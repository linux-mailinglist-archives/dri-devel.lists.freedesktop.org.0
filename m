Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549C92EC8C1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BAC56E44F;
	Thu,  7 Jan 2021 03:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58286E40C;
 Thu,  7 Jan 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO/qRvXxMkNcQ1D+CptWGzEXr74I5TybmfkEZb/KcaOXYbpkCZLeADr9WhCYFyZN4rSt7rL3ZNJDFpwWjbaIZvs8QX1zUAkEV8gS1WHRfSo8Kg0WoJ7CHVms+GKlBoGX+scPnddV/1UiMEOJz1hwtqxbkPD1S9WZjwcRpNVwvVgoQ+0jEovfDB6nc8sjKLJ2zLxWC/d0MczMrkNL7Vzv10NMGCMlM2R6lEwVrpbLc2aSIzuArvKQR6wDV0Tqi1XwACmsbXveDys+QtEuevBCLtksNdbCB4b8zf2lhBUc6yXvv3P6VKsqn7qhRJmmdPDpWoQDYMRFERGSqTACQqbEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k7m9cl48DF5s3Q45QsNTcU+29SZEejZzNYVWTAAPKk=;
 b=ao9ur3zF0eBH4I+gujUfbah2QaIlpNQlrql/dsbOZmNVeTC/k5hCTz+9osJyGKp+6WM4aNR1fu5YBoPNBeZcfrzchDtKhcdzj5EHv1fX9p5Cqa84IpZpqvJLlSYcBgYPgXzKdgKDNyOYPyTh6ui0fTlnGwPIQhcGseQFu6QgOSfCld40g0MVQguBoNpYoX2QALe36l1RVx8cVIrjWZJoxmIgDU4Ta5ouQBHtD7LcTeFwuXY1nDlAaJyFocXEnj9Q7QjpykyJGwTcTcsYceLb9OCxYWcLx4OHPHpsvaoJwdznCXTcwnSOXi2VKVDsISHbktjv8D1Ql2LqCICBdA7VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k7m9cl48DF5s3Q45QsNTcU+29SZEejZzNYVWTAAPKk=;
 b=ilpW6Ds04kvWWLNL7BmbtimkyGH552v5T9RNcwNYIb7OxfvXnSsfg37vjuedrN8jQ93g07ecC5K4h0FqhohXzTMc6pNHr9LIzXdbxJtR3W0pNujB4mNsALwaRERmbgDC0jejlrL4lyhee/q+ZIf/+Y+oY6irLpDMtpNdxXLf99M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/35] drm/amdgpu: svm bo enable_signal call condition
Date: Wed,  6 Jan 2021 22:01:21 -0500
Message-Id: <20210107030127.20393-30-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08728a89-0657-456d-a916-08d8b2b8c0ae
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408A9B090A9477D4C33B53392AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mvmXJIW6d/3SCeUrS4G+H6JNbFpQEc6oh3/MHW5Xg8UgfUZdyVUhtorG4P9J7xcnDuUUbWgNu0z/+Da9l7EqiNP+WqbolISb+4x6noneLtDz39U/gw78b9pspsAXKAhUuuduwZdRHH6DINvKlz3FwmnW2XeAmtbyYZgkCvDFeRylUyJ6O4DA6PkXcJVrqfj56CURa1v7ruviI+53lkgW9QZTl9QnGAV0iz3H2YxAbkY26TO3CbMO4Wjm1RNrpGsJVKE4jCFeYIhz9HYHtaaqAEv1AfXLbTbvRszQv5L84HB7dFnvjjYNXgquKRsLmzdQSwW60+fCPEzp2mJBgdNUELJMrXmqhSYUHswoX6GMstYPkzGl4XDfHB0mwuTq5Onzk7d60KaVqOiuk2JLxVz/gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4ejZwdYseKnU6c3TeU/Ts1kuHo5nBmfkuWLMmQVKlCwu8vJYkBNrMJwnaa3E?=
 =?us-ascii?Q?b40EgVauc0Z0jmTJUQKHNkV0SGHbUR5fb6ApDKODJ8yR8aEJvdcDrEZiTRm9?=
 =?us-ascii?Q?IdRBap7BItNrWHg+IffXlNmFdDWxHWPSP037eyoECrbusD5pz3fINdf1xZhv?=
 =?us-ascii?Q?0SLV0tumFSG6wsZ56wHKBLCmmqcU0hhw2JNI2PInvx8YmcFP08DY6vcoNPQ9?=
 =?us-ascii?Q?ZPF+phJmZcm0KVIXO1fb9wkZvxkxJSTiOx/VtgTz+l+P2StGCkDX2Nqz957o?=
 =?us-ascii?Q?23fkVBARMyuyeIbixHA5mgfxgVoT6Ag1cDaddNKaag4bVATY+VPULF3ucRAn?=
 =?us-ascii?Q?qS7In4hDKIyU9g5ylMaAgUbDmQzn4F7MuEvjtzcWexqgsBQuLLntpxU993Iz?=
 =?us-ascii?Q?LKgPkYQcTyzH0sjf4VX6QfO1QxAidG7HjPjYOwZyVqoEn/6ZKvOVd6IQpR5s?=
 =?us-ascii?Q?J21a/Cde0M87/zMZfTsZ/1t/OugNsyvAxjWm0EzX6D/rQ8B/VMBKR87OZDFq?=
 =?us-ascii?Q?0tMi5oKabkVBmtB5ko0ZlgqHj1kkQ5vBuIlZKbTsX8EVol/mn0ILHFyyAqpw?=
 =?us-ascii?Q?bcytqKEeO2SsWlRrtvr7zTiZhedO9GZ58N3H739rh7NtLlfVWk0bEyUd6ab/?=
 =?us-ascii?Q?w8KzQY2Kwo7U18hWsT3x0VO6W4x52nNF+knXBEZ3BprynFiXHCorQt1FJ7wY?=
 =?us-ascii?Q?jw7AMp3tMnEdNIqoKG55toOrPcx97Lz6nznlDHvmu8jaxrxPcTk0dCy+a4Yk?=
 =?us-ascii?Q?KYfT1X54hGzjlnhk3/B6SPjJbK+EQkEt9DAD2MxhZCarj2Sji89m9LDOauGj?=
 =?us-ascii?Q?f88RVkO5SCoabjCpyhxopDoH8R6DU/JZf5HFOU7QGRBdYUWG+dHzK+JkCfgT?=
 =?us-ascii?Q?HJBX+K0zoNmqRgdgb0+RYIrOHp+bjujJhE7Dq6B8jcA5sjmBtCvlk8jjzs9g?=
 =?us-ascii?Q?rOeODempYTho0q/JeuP0SdseuF4ArUqzE1lUJITBWy1FCTpCzzGUUgpQHOmu?=
 =?us-ascii?Q?Napx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:04.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 08728a89-0657-456d-a916-08d8b2b8c0ae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXY1v1SwaHykSHXPinG20aJhc2uZuxEFHUEpO8KGZ9llJ7lCmJWXuXtpSPkuisAohQZzXIF5WWOM8RGTkubE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
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
index f423f42cb9b5..62d4da95d22d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -107,6 +107,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
