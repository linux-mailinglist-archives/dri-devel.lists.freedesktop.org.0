Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096D350DC5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC726EC4E;
	Thu,  1 Apr 2021 04:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F076EC47;
 Thu,  1 Apr 2021 04:23:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV/t0kATAnBTHsF2lObkxk4XamvN8639OR1asTfjA8cs+G5RMnyn4mpBAdVEZljj6YeQ7tOFhxKD3+YV2mOc8qntYjtcIEXHzFXGPty2oLJuJcsoQmBGnN+fAIhs7zmHSR0HERSPLl+5saKORiPDo1hOJEBtVdcsHYc9zKFp0Jcyx8XJxaJu6KM3dsu2gt81IsALzv15vu/Kp9tyB5OP1OVqarSBIuUDpQLmRWoFrOigYL94Bt2MM4ew+f016oy5YNzgRyJAlOA4xLGU26+aVlfaVPz7fdR9VLyanxWO+/UU1sX0ErbS54ar+067e9vDURDLqbNCvOPgJrxOudnhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk/n1r4OdSX1FoulbGWlFUFwROfIy9PQmV5Q7q+/w7o=;
 b=Lmy3bg7Y1xpKftHYHbi85rc0KIvCe2j7PjTXf3amZk5QecpCEE6rR8gkAl4GPIlzUbo5eo10eb6dXucekgEf14XMInU1onFH5XlfAux8atB5/ke1svFjYunIEilwvbd97JVmP8YOplTA6sTs9iuy3jyYq2krJyvtgIqKKosXY94RKqtqayBF9oQAuItizTzD4ZNC4PTlQsHep61rRDacgEwxC5mBLYuUYTUQ4rzlsyid+iDV9pooFiPGObNWWOj565Avm0wP6Y38SoaTkBLwqkU3XcA4/BagFAd5fEWybv/HlXLo+7j29vlx78KEyTiXYI1AK042M1oliFkbeCI3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk/n1r4OdSX1FoulbGWlFUFwROfIy9PQmV5Q7q+/w7o=;
 b=z6/Qact1W7VX9AIGOuyYWWGfHNnB297S78lpTJa2UujuA/BxhUkmwHU8+1MjDWfpYK3jXhTCg6SAJkfechwvuPiGou0iuZjZdTbgEarfeTrjqmVcvsc2ka5LRsOMViF04mV5DSaadUSRZ611PrDwL30AAeRcGH4DxBs6fXJUT90=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:05 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/34] drm/amdkfd: SVM API call to restore page tables
Date: Thu,  1 Apr 2021 00:22:17 -0400
Message-Id: <20210401042228.1423-24-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1924f004-71be-4273-1eb2-08d8f4c5d846
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222491B12C10F8BF8B2E5F3927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uimX8MuCo/PDDXN/T/W72bErYDZhp/GcP4FRM4BttlV4jt+InE8s4dBTc1MZsAB4Oh4Tcslry0n9jr1zqNomjSza+HxB6DjQpt0s04YC2WMmF/ecoaVTo8RpID/J3Wj6Zd6EdAhM6x2Mll6TQjeVebMXIKIbBanLNdEg3/AFffJ6wru/1A6G/iK7Q5GNfi5tuYlePBbli9kayKinydIPzsoplEnogRXxgkt6bE1d2lmE3wUuhXwuojBSPQBNwp7FkP3Lsr6nNBT0VIvnEgUcIa7iY+lEZZoYIjTOKO/beTh9HYLeBCx9ddj+g/rA2/JpAqqyWxxhorXzNA0RRBxPS0QRbxJ4gBqru2nr4dcx9sAYU3dTA5K1y9wXsUSqnQNZsn8MrNgwWPvsPN4zXfZMtbqE231dt0gG2xzq7Z6oaWQ+INMAkkcqamaGe1Nf8rwXb37TLOkGA9hgHqTgWwm5cRupzkoiQUqvTSRRCiMV3qk0lPeFqvX3wci/wltK8sHxf9lVXX1We60fSDDIUnL1ljjb8FEZXDEo4bbG8UkUGj8r7ML9kuLafSEZOxt2ssmIfoEbXfc0i/wHJXNlitE1Iuk/p8NbpLY5j91C93iCmHRblVqL9bk+EXwy/GzNKH2n2aGlwCKTH3hFG6DhQb+nEIjP7MWM737+3rglDrqEzzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?C+pxKfcSxbl8isB/qDag1yB2SO7i8NproqD/TE8kj5wpguCap0DpttqIE7on?=
 =?us-ascii?Q?CE8hqZuKJ6aQk6ri3QKJp096OajvDUjynO5RAhgd6eCTdW+rgA5s7CkvdSYp?=
 =?us-ascii?Q?GvDvX0fotu+/vKoJgaZkXv2E9J8pA6Oev++zwMWotac9Fp1IqXCp44iAtiHq?=
 =?us-ascii?Q?CgxVsGsrk9lOqfLcFliYQmMY3w+hcgBuGSEYxzA/aVEWiUynAbtRpAp98nWR?=
 =?us-ascii?Q?Xku5R0tCcQ9m/IDMu5MYYbA1GdktTe5ctmuFjsYUBL1dvTIo/7uxz7ovjsAJ?=
 =?us-ascii?Q?TOShga+gLZRjOwjj84HXk1EYdhfpdhe57Qo+6zkxLQGPW7SATx1KTh9B3kuO?=
 =?us-ascii?Q?lxTKVvbV0bWq9gBBPfVmXi1us8n2vRXkx6JM6EbPUSI1JOruevkECWJy5SWB?=
 =?us-ascii?Q?5/2p6rVoKWVe1xC2qy8UETTaafbBIdcuucZMgaKKlnoai76nP8Pp5oll1DLh?=
 =?us-ascii?Q?sSAM8P1KSZYqTrrzPHqbdA1O8UAxEA2eaXLF51GGPPT+FXl61qN5Wv30tRyn?=
 =?us-ascii?Q?U9G1tyvZE7Tx8efAb9bU8OJfZqE60cRfePeNLNgpyQ22QN/JK8yvTyMvnyY8?=
 =?us-ascii?Q?+Ypzg3Hd7NupSBryyDNzGgQOCxqHKJLTYM8uuF8sEBssRuQ46OERfL+4Ejz8?=
 =?us-ascii?Q?AytPjN2T2ufQp/jmLJBhKNLaey0aI/B8kU/wiPC6TIY2l6xmE44CmGogkbCs?=
 =?us-ascii?Q?uIdBUbIzYzizO31eUCJgGJBczpAEKq2s+Bfvd4zAvd7OMvjFbfvYWD+qosY+?=
 =?us-ascii?Q?emCpXLVaI4jXGOqOWckkg7XzqJeMFCkGkPl9c1bnSa1+jNg0BUGdwv+2ttAw?=
 =?us-ascii?Q?++ozbX/RflnjrtS+OGGbNoAfu9A324skVs77SQrnWltQxbiGTCMqdSpjjB3K?=
 =?us-ascii?Q?DHvQGYgmyB4Mqje3GLXQ8COBSlFjd21JFhbBoITTTx0xR0+2FEiWfw+evPIQ?=
 =?us-ascii?Q?uzsDnFLWHuoFok65QvEkKdkyiQY5zXZnFmajeoWt/o/lq5e/VAtLSYZMO2LL?=
 =?us-ascii?Q?IRN0gvO7s5ZPVlmb6fi4jAsZxabDuVSKJkU17FUPeq5jWlYu/X4VIve1BUHJ?=
 =?us-ascii?Q?/rcGg7jwe4kXAaI76miHXQluO6CGMWKxprYiiymGaQKft/PcQiif0yCDHqGv?=
 =?us-ascii?Q?pgReuyQNxn+Y/LU3FxJgzn5so2z4+pHVNUSjG/zMMIMJb/quI27IdZZHOgj2?=
 =?us-ascii?Q?mbNiUgtaBCPl6ng+VUg/b96wgFOBcQ7UpmupHojNMIq6/6PMITMEb6fm61jb?=
 =?us-ascii?Q?NK1LOvu8p00JFAIkaSVuSGIDpCU+ClQsNcyH6/JV9XGC5Js/N4YablnAuJSd?=
 =?us-ascii?Q?Q+vztOi+ksVN8Xe6QMj2YZew?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1924f004-71be-4273-1eb2-08d8f4c5d846
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:05.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4Vwq9dspiyMi7q3sI2HYWSoU6O01+u6j35eapzqJMAOolZFVbynDD/0ZOkFkfX7WO9gCdi/r5bEFs7qFv4/rg==
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

Use SVM API to restore page tables when retry fault and
compute context are enabled.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 7e306fd20de4..83c020411e52 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -37,6 +37,7 @@
 #include "amdgpu_gmc.h"
 #include "amdgpu_xgmi.h"
 #include "amdgpu_dma_buf.h"
+#include "kfd_svm.h"
 
 /**
  * DOC: GPUVM
@@ -3302,18 +3303,29 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	uint64_t value, flags;
 	struct amdgpu_vm *vm;
 	long r;
+	bool is_compute_context = false;
 
 	spin_lock(&adev->vm_manager.pasid_lock);
 	vm = idr_find(&adev->vm_manager.pasid_idr, pasid);
-	if (vm)
+	if (vm) {
 		root = amdgpu_bo_ref(vm->root.base.bo);
-	else
+		is_compute_context = vm->is_compute_context;
+	} else {
 		root = NULL;
+	}
 	spin_unlock(&adev->vm_manager.pasid_lock);
 
 	if (!root)
 		return false;
 
+	addr /= AMDGPU_GPU_PAGE_SIZE;
+
+	if (is_compute_context &&
+	    !svm_range_restore_pages(adev, pasid, addr)) {
+		amdgpu_bo_unref(&root);
+		return true;
+	}
+
 	r = amdgpu_bo_reserve(root, true);
 	if (r)
 		goto error_unref;
@@ -3327,18 +3339,16 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
 	if (!vm)
 		goto error_unlock;
 
-	addr /= AMDGPU_GPU_PAGE_SIZE;
 	flags = AMDGPU_PTE_VALID | AMDGPU_PTE_SNOOPED |
 		AMDGPU_PTE_SYSTEM;
 
-	if (vm->is_compute_context) {
+	if (is_compute_context) {
 		/* Intentionally setting invalid PTE flag
 		 * combination to force a no-retry-fault
 		 */
 		flags = AMDGPU_PTE_EXECUTABLE | AMDGPU_PDE_PTE |
 			AMDGPU_PTE_TF;
 		value = 0;
-
 	} else if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_NEVER) {
 		/* Redirect the access to the dummy page */
 		value = adev->dummy_page_addr;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
