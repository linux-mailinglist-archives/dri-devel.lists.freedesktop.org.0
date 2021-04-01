Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B2350DCC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D74C6EC55;
	Thu,  1 Apr 2021 04:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2666EC51;
 Thu,  1 Apr 2021 04:23:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C24nHn9Aev/rsipqgnruZx8olg1qtgn5QHQCam3kvgsLxf8DrxUb7nTpxDhiVYwp/6iCvY8DPWtQMCgVwjKqDAbSO25OeGe2d2QzfYbiws6PMbqVTDXugWuwTntUTNYtRVZQlyVNgoMtc2zzyvhiKicqAqGV+YzzJRRAFuJPfaObzzRgQKduU84ZCv+AiuKWgV5Iu4ekS/bm3LKBDIPDZ6UjbK2wHxMqW4+s7WycWdNq9q5eZ+m8jWIiX0Ttf4ndiltnNu1v+9dae6vq195sJnjYVDVvmIfjF3BqDjrBsR9+po9/finokpO1WC1Ftp4s/5U7z1oz0ToYkvBbTOY6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ61no1y9PqHSlkRHYFPAeaFnXio++PwLMmSwx8/nko=;
 b=kdaaoUXmIk0tUn/IgNLW4GU4GFpreUHTRAWVZ7b6xWp40HFt9Zf7ch6MIdEk+h1VY6T5QaTTx9+apXbWQgbEr6ogwoAzBDGE1Naaywcy0qh3KuKaYmaPBNxsPOFmez9U4/TfMys3M1y7/8USdDF+1aq2sTu7IJjUuZf62OwA3QhWoMdokST2Ui/Aj0wDPYLxMaTDmUPWeUkPdmnUXWEhTzII36CCo7hLhbl1j464HQnbXTBGmPGQlX9c2/6UL9lfNNYLoMdSEwEkEEDx7pV/cnRD7g9+wMIjVMqLpp0cQZGIE5daJnjDq1tg9/6eVauSYwxKhf6mmUQb8FC7UlUyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ61no1y9PqHSlkRHYFPAeaFnXio++PwLMmSwx8/nko=;
 b=VhJNxhgrS5d+xLnh3ES93CWNFmK8fZuagDl+2LY0VAUIjHcd3zeYRujSG4w8DQr3ibKUQsQNcylV6ONxuWTP+oF+XoGbEIds91X7DVerSVuNqIvXlmUpJREO+kUg6Zs90soBfPPG3G+RPLaubGkh6C9xkmeHDBFva9NpGjX94eM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:08 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/34] drm/amdgpu: svm bo enable_signal call condition
Date: Thu,  1 Apr 2021 00:22:21 -0400
Message-Id: <20210401042228.1423-28-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44c51d3f-d1cf-4819-723a-08d8f4c5da36
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB422225468D16E97EFAED6378927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G3MEamg7P3eWTIfRQt9Pq9dRmTdOSEIBMD9EtOU0LOViU9YJHqxLnyOFEJWm9G1QxPcewncYILoHRo/lZuozAcILT+vFe+u2qyWkQ3IIei4Tkbi4uom+qr03guUFeHpVNAxfZVvFlTvM+iFA4V0CSrMQIhrn75c79iqjOichps30GXJZDek5DN2/ZbOFgSd21pjGdF0EC2L9jcfqMu7zV2H9jNAs2tWQG0mjD9hzVFUl0lz0Xziu+ECqMu8vwy5riNpJM7MtOUVW3GaDyuzUMIlKljE1XuLcQfvZU9D4dahRHlhpqUVfE7bAQSCz5UUMEqhK3kFoVi29D8zizaBRjsg7LXUAq0AIlW05Jjf7LHBYJyu+5RXlt1gXT+DUE2lfSYYhEs+AW4YbwhtLzLhBVPVXxYKb6btF6BfuWiq47Y8q1OZWBlJvx4B1Wrd3FiohhNl6zwHmQqTGkXw+wZELGBIMV7eF2X13DDNGuWuoduACz3b78FMJbVuE0Q1+C//3mk1W50iyBG+HwpPkLOm7FShSzJilytCqTagJk1FIfwBB4Imn4ZGh0pfhNZ4D3kQgd8iGQUcWr2p5ZahERM1E8qrYJoWMEeLRsxovnTNT5sl+BEHVd1Zon2S1wDE2vlTj5LDaALPXb1s85CZR9LVug8myUt94ff4DadY61uaTGl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GSYDvuY/eZJ0/3zcS/pulBzT3QfMmlaZreFM0vesvM/349pglfT6JA3VFdgR?=
 =?us-ascii?Q?76RIU6B9coTjx78rlGcV/A96HYvEjY8B5XQBGd+WdESmNo/r7CiwgHKWPDvP?=
 =?us-ascii?Q?fvU1v8FOqfaE5ue4ys5nXmEF5t3FSUR6xrtxLeH8NOCx+RwhS8C0FdyLChLp?=
 =?us-ascii?Q?NEuSPlHPivbQlApDVA6PV5Exbi3a/r47S/0MAopaF0dmJD4xdgfl1k8hxCrO?=
 =?us-ascii?Q?q6OXDnEFmKICV0mqK9CL/DjDFx0moH6U6oZkaItB40IJus2skFSE8xSiGAG8?=
 =?us-ascii?Q?aCkyiERM0YY9X3pP8ufR+PCmmOYwp4iZ6rmiZdEmbssJXewdD4SpXcphlWqz?=
 =?us-ascii?Q?luhweiYgfQSwoXafSP3RoV5aD8aC8qD0Wh+OMZUeHS/BlTQGmFRav1SDPnZb?=
 =?us-ascii?Q?i2K8nruqAyp+z0r9gzJuJSDhJwNYKJBoToU34o+Xt9JowUf3yD/OW0G5EU7d?=
 =?us-ascii?Q?HTRiJbThJICWCbjrqWb9tIHfMBVb8+qT/iY9nuCDlMDZoDXdsKEJwg4wTn34?=
 =?us-ascii?Q?7DbTlxJUi4/BOHufSGFIhd9JrKmEFeU8s9Wl3Mg8XIYtzbhgPDqb5CLaywaB?=
 =?us-ascii?Q?ACFv3YbWJdA718cp2RXrPtPXBGQDfArzF0D+anmBZMafgIMeZnWZLn5jN8JH?=
 =?us-ascii?Q?fyFlLL7TTADdH4FJmjtErAyQd/xknygRKAbe/jFAyhQsJicHX7YRIWB7RFCh?=
 =?us-ascii?Q?Tx0uUtRWgN3aM1u7RQ2p/xhrXUeA3dGSh2M7nWUEnk+ZaIc1sY/subSf46Cu?=
 =?us-ascii?Q?rgIKp9SBFIiFWqblYKIbJomVZ4M/Xu3knbR/RwgXE7Oyyae2GlwmTnccBZpO?=
 =?us-ascii?Q?qesbsQcryRVKcwwf4g4zTNcGh24eQGvGLEl4Lylmzbuluw9Nu9yCIX7s5HAH?=
 =?us-ascii?Q?L8hc9bS8wkpIJ9YL+q6ZVm3YztnWi3+jHasCYvEVmKpvXUgzUu3tnTGotLxQ?=
 =?us-ascii?Q?cRj5uUkQhzTZ6/AsvlDyLBemj/hUudBt0Dzn9cy9NWLifHxR5edaFtoXn2CA?=
 =?us-ascii?Q?N3NEypKbKAzfEx300InDZm08OZMWHkNrWLshA0N/s3FWiXZP4K4140bNhrDb?=
 =?us-ascii?Q?N7rpaDLOVOZyBhlY9P+dqw0q+O9kGW8cgLRCQXPNm7RUKhdOxpj7mOUIV2Oe?=
 =?us-ascii?Q?Fu8NhjEIgH62Lrep/n6qSNCu3RR9DpFe9zfVNHCSOh+zFmXH7uhNbq0lb9lm?=
 =?us-ascii?Q?sRHA/C7JfjNJNfo45TMmhAFjxSttUvoo2a2kcOnSmUT7lfrrb4wUlLMmgZ2t?=
 =?us-ascii?Q?6U18XBsSJpxN4CttHqj2EWNs67+HRBqwX4+iH0+fqaoP5gS62nglWoedWc6Q?=
 =?us-ascii?Q?xOyfoJOwihwx4EoJExe5MvNH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c51d3f-d1cf-4819-723a-08d8f4c5da36
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:08.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeD6lL0uTY6D/nEdP1R3/KEq71IwNkq2YqcMpluUpM3hLXVAFuCQYq1K2Ks8fkMO0qXkNzbPesbamQxjwbe9wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

[why]
To support svm bo eviction mechanism.

[how]
If the BO crated has AMDGPU_AMDKFD_CREATE_SVM_BO flag set,
enable_signal callback will be called inside amdgpu_evict_flags.
This also causes gutting of the BO by removing all placements,
so that TTM won't actually do an eviction. Instead it will discard
the memory held by the BO. This is needed for HMM migration to user
mode system memory pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a2585058e65d..17e0f3b60c18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -111,6 +111,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	}
 
 	abo = ttm_to_amdgpu_bo(bo);
+	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
+		struct dma_fence *fence;
+		struct dma_resv *resv = &bo->base._resv;
+
+		rcu_read_lock();
+		fence = rcu_dereference(resv->fence_excl);
+		if (fence && !fence->ops->signaled)
+			dma_fence_enable_sw_signaling(fence);
+
+		placement->num_placement = 0;
+		placement->num_busy_placement = 0;
+		rcu_read_unlock();
+		return;
+	}
 	switch (bo->mem.mem_type) {
 	case AMDGPU_PL_GDS:
 	case AMDGPU_PL_GWS:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
