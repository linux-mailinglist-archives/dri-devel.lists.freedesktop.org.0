Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A29703884CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 04:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EC46E174;
	Wed, 19 May 2021 02:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3506E160;
 Wed, 19 May 2021 02:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjAIFrnoRL8CNXJ+tzHhA9bYKDolcH3DFiAqUCDV0WPM9vi300NpeZzmZ8ovRRxOePPIuSD7kfr0fUQ2lHlAeW1C7KjCSvz56eEayaYYkPvLa1BLVwKfteJF6dRBSgXhJZQO4GtlyH7c+1imRa7djY2zfVcgpSR3+4kEdgvAnkZP9S+XxgWg/FOPLE3m54Q9MQ5uEsmuu+Fmn/YYamotdJV/GUggJBKThlqsEwW25oX97FI33lsN0vgESVt6DRXGEv8JXkhsjDSTfnuDOYP0qvilBZ8eKejvz46znRE7PSoGo7Jq7oFgdFM8mfEIbSxlyfbtmVdfFKYgLuQJne0EUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6gKiVATmCjWhR29M/2P1MDXn4mKamFnas6Z9pDGQbk=;
 b=Nt+A31ivIRbPRUXkNgJppYvI23KGgER1+3yaWl0Sl4CQDiu7XJfVzHmA3/i5jvlSiMl+gHNc9ZY3MsuCRhYwQJ5VpEGI9MAw/2gvKMgIjy/tEJ/IPSfuO4mbtiMb5qX7lqWiqaJFZ71B/Fi0Jji+JkfGXZTgk+l9/1SMRcBBNFaP2IrVNbOxwshKUySNfiyXappttowGMFTWsLfApilxgWcYYezRXp4lHT1YXOd0weFM3ETiIJwfpQSVQx/ulMXaTFFEBpDb5Lp+gnqWrwLoTNVWEqieDH4V4rw584mkd7iQJSs3KDZ1IQmwF3R4T3iNqMXjvflTm7iX4EJepPWJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6gKiVATmCjWhR29M/2P1MDXn4mKamFnas6Z9pDGQbk=;
 b=DwzrPiAYXTsrYSpzY3gSJyOKvtAac/tzo2ePsIn6eKfDhSyTZla8YX498e65fDbIErod+NfU4Tx3Avxl3mo7OAggQTdMSWbbIoFNW95zhuiUNUzQ8J3ePvVCLEaMtWqOQnWrDMA9+7x8r5FdXv8U1OlEY0uuFNuNMGM82ZB9gIk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5166.namprd12.prod.outlook.com (2603:10b6:5:395::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 02:29:29 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4129.031; Wed, 19 May 2021
 02:29:29 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout and
 swapin
Date: Wed, 19 May 2021 10:28:51 +0800
Message-Id: <20210519022852.16766-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HKAPR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:203:c8::18) To DM4PR12MB5165.namprd12.prod.outlook.com
 (2603:10b6:5:394::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (165.204.134.244) by
 HKAPR03CA0013.apcprd03.prod.outlook.com (2603:1096:203:c8::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Wed, 19 May 2021 02:29:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac998374-ec49-4872-a5fe-08d91a6dedeb
X-MS-TrafficTypeDiagnostic: DM4PR12MB5166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB51660DD8C1212D7032FA8BF6872B9@DM4PR12MB5166.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s/GgSrMidxt2/v6fBPStuk98wBdj63OJc/1IzuzUHxJeeanrRO6HaaAS431vLgqSRVxxHRga0awvz7PIx/559n6WSswzYYmxumCChnSnRmvWwKaHZAJelLsoAtGfLK0pPNzoinftPCxn3112Qfd1m3tjO0shZ2WEwNdmVMerS1kTPQ2nFPocDO4I5WUgBNc8CNpTNytJ5POeejzFKYG9sLM7MBW/R4F2qnv4bOVyCYr3EO4QB+nqhjfokqTmRkJgqSzCE65O7BQlNRKc/gS78bfWsZlchn67WURjMF8vpM1cAkrEw52l91f5eEN0AqI7oI/bN4Jmt1x2S53s0pKuG9/BjhsmWA2aWM3vN/LHpY7XMBwjlkWszfCfvz03BeKIaFvRo3LwMRpP7xWqvfj4fBYuJ1dwrtK9KN0uw7O5Gk0JqyPg6vk5LbjsPla/l9MB3bFmT+wOxrGUWc4POZAYCojrYsgERL0ZDBBQ4LrNQ2Xj//xXWPRT2w2ejHgJOZTlDnNEQUiTg1y/mmo1gIjTnGExgFSAk3Plv108aiEFnEd1+SyQeDjMLM09DBCYmfCvkxJ6XpyO56gHlES9Kl7xNzu0ChEMO7owC5IF7GjVFqjiFh8dywC2VqCcd4Avop7ppmZEy7waiS54dioD883jgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(6666004)(66946007)(66476007)(8936002)(8676002)(66556008)(86362001)(6486002)(83380400001)(38350700002)(52116002)(7696005)(5660300002)(2616005)(36756003)(26005)(956004)(478600001)(316002)(1076003)(2906002)(38100700002)(16526019)(4326008)(186003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tKpmmyDEPfyH8dxO008LEEiPKJ6XavVE9PlWrFKJc895U6orQsBJCCa6QXKo?=
 =?us-ascii?Q?C7j/eqOPJVB6E8XgejJI1KL5P9gtWAd+sAfgkF4YeUWM3blC9SA0lTWmw0+E?=
 =?us-ascii?Q?JRSmbdGdAm7EdHjfZLsbccnlBk6fMIeCxsLkkcdDTwZf8A4r8iPCoRMiTzo0?=
 =?us-ascii?Q?5ksYMf/0gL85MLMJv5FDKJjREtnXb0OU7zsqRzn3RGZlqIrzWGLQb+qaUI5k?=
 =?us-ascii?Q?G8PHVX+VU/aBTXLsn+xeKs36S3gVSjtDBQxMGYLJOlHRtvWqVHxRQ409SNYz?=
 =?us-ascii?Q?QZnh4uLZQOlkO+9S1O89rQtD8UuR37LhlGgoaBub5uYjmsT1IDae3bfzL28w?=
 =?us-ascii?Q?ERMaS8m28nKOw+lN7zKMwJrpSAg8rF2zF4EZBjpp6NBSnbKRWZsy5sIdopBB?=
 =?us-ascii?Q?temswBipwY1hwlpPb7khTnm1wPN2jc9hIx81DqvSmrKg+fegdjoStYMzGxbL?=
 =?us-ascii?Q?OE8eolvBphmM7RV5zpeB0Vx9hhDyO/+aRZ8zBd0HmzfCPbtAznagF1fxd8Lh?=
 =?us-ascii?Q?dQfsJ65N2/EO+Gi+VD/vmM+wrTJYbuaza1TXWW+ki6ZxqQVAP8TQJ5m+//SI?=
 =?us-ascii?Q?H7zOypz7z+wZ8oBNqxGSX1uvCg7W3zcGiOqcJ3EcTck3zku7aG+2JmF7u2+A?=
 =?us-ascii?Q?nHfp2e8AnwkZQIfEXWn0tQmlyba0r7+f2wa0I13aE68zXYQw5nD5KnCfg1iA?=
 =?us-ascii?Q?gO7uR56YMdnhS02dxwXAffhWj7VFUZqY44LGAs4hc9FBDj+EE3ZPUQ/sZ+mF?=
 =?us-ascii?Q?j+moPE2EsNwxmh5eXFdnQiMXfl3OuoLFcsfba7PZLEtJKYeZZbSgasZq4gNP?=
 =?us-ascii?Q?j4/lDyNfnHrilibNVvAeXIEtiNNa1BJUhJaHA/6rrROG+eRn3kM2hdnhq6eL?=
 =?us-ascii?Q?M4eXwEn4D5y0d6x8/i8qsv6C5wY5lqOmcYHgQacUhfAitJmT+B4+ZfgbDDRw?=
 =?us-ascii?Q?SdRgCIoLFj3dwDUmSG99j/e+Q5DQaDluqQJ78JSN1Xk+2Vv5tyFVE6zTyY7/?=
 =?us-ascii?Q?Yqt54qPs/1YX68r0lurEoN0T5lGsWDfTF6y38Y07hNm0USE9yJSHMB81HzzY?=
 =?us-ascii?Q?rKTuhKzpni956I47qUyxzxvmg33nD9ihzQNEh0JsHVnZYdISHJK+YBUT9Dho?=
 =?us-ascii?Q?Wszn99XTTrAtJmoGVDYvFMEJC2GyV1QeGx9sxpkIhrm6pPrLQ2/kT63oGDHy?=
 =?us-ascii?Q?zj9VBBq348LqxWsFELEc6jjZ6m1x+VfSNPIN0wFf0I/gYGZw1+z/0T6ptu55?=
 =?us-ascii?Q?AJLmDekXiHHuBsoJ/xq+XwAwBd5kBaYiB0CFR23VN+DdkLeai+R5gCvwjZ2I?=
 =?us-ascii?Q?A85fSkEti0oFRyVkUbFm1ck2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac998374-ec49-4872-a5fe-08d91a6dedeb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 02:29:29.6450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCEt6AEZP3ZHuMIcXkaVQrqkeOb8gfnbZ3GGIKAhNnhpl0rJKZxGgtGGfJzYRLho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5166
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
Cc: Felix.Kuehling@amd.com, xinhui pan <xinhui.pan@amd.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cpu 1                                           cpu 2
kfd alloc BO A(userptr)                         alloc BO B(GTT)
    ->init -> validate				-> init -> validate -> populate
    init_user_pages				  -> swapout BO A //hit ttm pages limit
	-> get_user_pages (fill up ttm->pages)
	 -> validate -> populate
          -> swapin BO A // Now hit the BUG

We know that get_user_pages may race with swapout on same BO.
Threre are some issues I have met.
1) memory corruption.
This is because we do a swap before memory is setup. ttm_tt_swapout()
just create a swap_storage with its content being 0x0. So when we setup
memory after the swapout. The following swapin makes the memory
corrupted.

2) panic
When swapout happes with get_user_pages, they touch ttm->pages without
anylock. It causes memory corruption too. But I hit page fault mostly.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 928e8d57cd08..42460e4480f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -835,6 +835,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 	struct amdkfd_process_info *process_info = mem->process_info;
 	struct amdgpu_bo *bo = mem->bo;
 	struct ttm_operation_ctx ctx = { true, false };
+	struct page **pages;
 	int ret = 0;
 
 	mutex_lock(&process_info->lock);
@@ -852,7 +853,13 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 		goto out;
 	}
 
-	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
+	pages = kvmalloc_array(bo->tbo.ttm->num_pages,
+			sizeof(struct page *),
+			GFP_KERNEL | __GFP_ZERO);
+	if (!pages)
+		goto unregister_out;
+
+	ret = amdgpu_ttm_tt_get_user_pages(bo, pages);
 	if (ret) {
 		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
 		goto unregister_out;
@@ -863,6 +870,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 		pr_err("%s: Failed to reserve BO\n", __func__);
 		goto release_out;
 	}
+
+	WARN_ON_ONCE(bo->tbo.ttm->page_flags & TTM_PAGE_FLAG_SWAPPED);
+
+	memcpy(bo->tbo.ttm->pages,
+			pages,
+			sizeof(struct page*) * bo->tbo.ttm->num_pages);
 	amdgpu_bo_placement_from_domain(bo, mem->domain);
 	ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 	if (ret)
@@ -872,6 +885,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
 release_out:
 	amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
 unregister_out:
+	kvfree(pages);
 	if (ret)
 		amdgpu_mn_unregister(bo);
 out:
-- 
2.25.1

