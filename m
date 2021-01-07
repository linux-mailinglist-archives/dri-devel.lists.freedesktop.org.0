Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEB72EC8A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27306E427;
	Thu,  7 Jan 2021 03:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653536E420;
 Thu,  7 Jan 2021 03:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zcgl7Qu6l22EX9DOCuuE64Vf5HK6msK3VUmCMCuAQGMOIIab8Hha2ULS8Xu8c/JuVYokHimdd3CkX4HSWeHDzAPTHJjIh+/1chVxIDtm8ifQ5jOcaFmU7TQw0444Gk8vxiJtOeVNC1yWEOayA9jYyZzwmz10F6s7RhYohRbU0cOvUIq7m1jt2rXvYyqYyGUqmIYLjYwHcGBqA3XJIVCNAGgrt/dRb7r0Oz9uA+suNc08y1oGM1RWUXT8ZxvzO/I9O5QOaHGyIEr7PLAu6WB3uEhB6HcKV3qOs/rSvRjZ75lmRAeZLjNoeBXhrcuaGtFNzmHY7D3NcZusdeOvzIQwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKw5rfarbrEmJzteLpIQK/5jTr7b5oNRsnyb6GrAOTg=;
 b=ZA+0SJ3j01IXcPkGD9p/Pw6D7T01p6ScBIWlC7mNTKaBCj/r6BYz+cWL6D28Bu0kfhKwOEcsjeld51NOljr6Ms8CEWTYWtWcBCnMUz1D6ROLc0V3O9Ivae22il4LE8LWHi+h8BX3UWUhM2VAg9kcoduOUORgPFf79xZ7BISlftFZ+N5kU+a3+6g74l7tcRER1RR8zwoy4GJuIimCaVUAe8fL9kGxQ+fSb7bBaaKYtJbfnpldsxJwcCxTUKdRqDAugIXnBa3Y7yfXTKapR9pNK65clwJ2lotklk28301V+9N7cJLBIkdxTwCGvn9jF+K1ziBzeXpY/BaH/mYCxAkrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKw5rfarbrEmJzteLpIQK/5jTr7b5oNRsnyb6GrAOTg=;
 b=2YNd3kUcO1efE7BJXJJQpWe3xADSOraa7OpzP5lraWfNuW32G6Pwaao2n4RNHkGtTAe2XOBXzOkpmmyIA0Y2Jx5PzAoAZGrkf8QF4heNz7kkk/adEu7TmAzhY0e5e8gZe6cQW4PVwoLMsMv5V0VDA4JMlDlLKuy7QHOmydrLVJo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:59 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/35] drm/amdkfd: support xgmi same hive mapping
Date: Wed,  6 Jan 2021 22:01:11 -0500
Message-Id: <20210107030127.20393-20-Felix.Kuehling@amd.com>
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
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 413b8c04-5a63-4c32-3c9e-08d8b2b8bd66
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB399934E7BB9F75F7E083864A92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXIMJLWXUiAWXsa1hu/NTolRxLESq3hdh1aV4ZmipozDwxqbXh+kiWTkRXTNCWhCnKLLgB9aTze3upD101scPn9ETmsAFx2ByEkLw0a3K83/aBitBOq5xImXxVgfzwgBAPXVWlVQXBSnteQdY86hOgxXaB7WWerOT6Ccus7ehw3LhZHJoYTzou4BA+ErrSaDhZJFZEzErd/6LXehV4pno/F5nPJcAXPSS9jV9JmN0wdE1C/Op/T1HPcd69EijZOHFgXZpWahh1GVgtC7bcOZx9VUymEDYEHLoyZkYqapb942/xiTJa4DrKyyUfXFJnHJS0BjAioJzMBiV1U/e9X9fEZtglLdk5/Ox8UivcuMPowmIK6pWUQtpsJdQJokxZJbtpYH4LPT1lW3LHPrvPs4tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HM8XWPFy13ersLYv2hE5EI3R7M7+PZW9y+LFpk8QMda5InVYQAPrY6tWDS9r?=
 =?us-ascii?Q?KaigHYBReXMXZpmII/w6jMu69UGS2UOnlujMq1msUKcPElypCphB7+Zg/Z20?=
 =?us-ascii?Q?SC1RSC/Ygige08iZCeCF1Uy2HQm6WC9E7vqn14kloe6YduGKui+J/LNgIZE0?=
 =?us-ascii?Q?Gcz8kz7zf4nV9nlQVArsBmx4sBY05TlmL1mze5KDjj84B2GSZQPPFlkZmLgB?=
 =?us-ascii?Q?4AWJ4BzoRMYhV4rDULbdvpZIWeLOObHSSxNRcBYGfVidvF96iabj1UYNiUeW?=
 =?us-ascii?Q?z6+iLpqyuSekcdXE0l8PghO8j66gjb825vS4AkrT0UTXR3b4qS8Gk57/cpIT?=
 =?us-ascii?Q?njzFFQPlhkWoSf6T97YSHtub9s2I9EPevo56TNf82a5Ajs2NSGtv4aJigWbr?=
 =?us-ascii?Q?hwDNF1c8lqGi3ebG18mQ4qzx22plnlafSkN65THzTS5fky5G5wSrnJz7b0ld?=
 =?us-ascii?Q?ZP1REkTsDv8ipRWRLYvV1gln226BDb4sl5KiMx/RYQbZjKk/YptV1czyIlOT?=
 =?us-ascii?Q?s8gp7FUM2KJfE1QendCEN3RSOLdk+d4cnZQZJYx6KPhngp+r6guLW7Mr8lq4?=
 =?us-ascii?Q?l91fWR+feFCZ2Hgbm3ABxk9QGm19mKHN/KyqTm7iWJoSVnAnKWotnIDkpjLw?=
 =?us-ascii?Q?yTbIS/ZYeGEaFxIW6Elm4iKcPTGyuEjsk8SZqyJ8FC6V+BoCWP7W2j0yxAel?=
 =?us-ascii?Q?OI8LTHlHzOgY4nR0IIq802BmP008rCnrIZrCUGA6IcFXs7kkKpmWRoac1HAs?=
 =?us-ascii?Q?iVDc+xGGQ0JnjkghGCO5qEYZSASnBzeAlaBxW1cBnTRlr088DFoHktYFQTcn?=
 =?us-ascii?Q?cCWsVyu0Hsjzl7P87BOWS4fGm6xj0u1F6N990t3MYz840Cn/GQcbMdxU0SSj?=
 =?us-ascii?Q?KUuQdceVRLamTymZs/hqCrs5EEClcvF8WIqb5xsduvvVEwe93c7hAW2uiBZv?=
 =?us-ascii?Q?pAel5tGAj6HNHTQ1/M61SpwDFp+0aUKxmsQgII37fHYjXVjEGv2l8fjMMQXH?=
 =?us-ascii?Q?bVPw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:59.1288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 413b8c04-5a63-4c32-3c9e-08d8b2b8bd66
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPXS1TJJ7c9lVBLO9z3R1GcVZvGuIhcXX1iWgvKG8n8TdiYE2HSctoAgMJgELcdpm+UAo1Yl4y9GJBWB/EGJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

amdgpu_gmc_get_vm_pte use bo_va->is_xgmi same hive information to set
pte flags to update GPU mapping. Add local structure variable bo_va, and
update bo_va.is_xgmi, pass it to mapping->bo_va while mapping to GPU.

Assuming xgmi pstate is hi after boot.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7d91dc49a5a9..8a4d0a3935b6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -26,6 +26,8 @@
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_mn.h"
+#include "amdgpu.h"
+#include "amdgpu_xgmi.h"
 #include "kfd_priv.h"
 #include "kfd_svm.h"
 
@@ -923,10 +925,11 @@ static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
 static int
 svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, bool reserve_vm,
-		     struct dma_fence **fence)
+		     struct amdgpu_device *bo_adev, struct dma_fence **fence)
 {
 	struct ttm_validate_buffer tv[2];
 	struct ww_acquire_ctx ticket;
+	struct amdgpu_bo_va bo_va;
 	struct list_head list;
 	dma_addr_t *pages_addr;
 	uint64_t pte_flags;
@@ -963,6 +966,11 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		}
 	}
 
+	if (prange->svm_bo && prange->mm_nodes) {
+		bo_va.is_xgmi = amdgpu_xgmi_same_hive(adev, bo_adev);
+		prange->mapping.bo_va = &bo_va;
+	}
+
 	prange->mapping.start = prange->it_node.start;
 	prange->mapping.last = prange->it_node.last;
 	prange->mapping.offset = prange->offset;
@@ -970,7 +978,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	prange->mapping.flags = pte_flags;
 	pages_addr = prange->pages_addr;
 
-	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+	r = amdgpu_vm_bo_update_mapping(adev, bo_adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
 					prange->mapping.offset,
@@ -994,6 +1002,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 unreserve_out:
+	prange->mapping.bo_va = NULL;
 	if (reserve_vm)
 		ttm_eu_backoff_reservation(&ticket, &list);
 out:
@@ -1004,6 +1013,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
 	struct kfd_dev *dev;
@@ -1011,6 +1021,11 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	uint32_t gpuidx;
 	int r = 0;
 
+	if (prange->svm_bo && prange->mm_nodes)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 	p = container_of(prange->svms, struct kfd_process, svms);
@@ -1027,8 +1042,14 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 			return -EINVAL;
 		adev = (struct amdgpu_device *)dev->kgd;
 
+		if (bo_adev && adev != bo_adev &&
+		    !amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			pr_debug("cannot map to device idx %d\n", gpuidx);
+			continue;
+		}
+
 		r = svm_range_map_to_gpu(adev, pdd->vm, prange, reserve_vm,
-					 &fence);
+					 bo_adev, &fence);
 		if (r)
 			break;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
