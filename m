Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C666343F0C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBDA89F49;
	Mon, 22 Mar 2021 11:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4976689ECD;
 Mon, 22 Mar 2021 11:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8D9f8Yn8l6V+5VRIbqxtGqbEHCIPFeQqBZpxV1JADk991+xzt3mYPobtlu81BLpKhj2bgH4/rDti7nNpGkQSSFgwI8MMe2e0QbDql7F2hn0O20S0ipPsHSCr9x+Vt3eL1bJMiWUN17qCgaiaZa+j4CZFW81LeSWjn1kyRW+2UBOyeOhxKtJ15vprToigQrDLbQfQZO+SgZMnbEFGv3ZePY4ruCHO2eUjLo9tNhu3UUjTfxMWfSz/gDDlSJREDdOxG4/Ly5jk38ClLR8DnpaHo5dMEalVMPIQZu/Gg6TBbz2Isq7hOSUnPgg1JKsr6YrgwKmwJ5od2KrMkuOSG7xlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1a9lKtIkPZes2B6a1c6oAOIaPDsq1t8O0hVbXfjDMI=;
 b=DgvN+HsilB4WJyMrfvYq2RDISoWYvhPJDNegNScqYSYDiY4PwVXBxPNjdy+uVwnT58bhQBfvfpS3lN+EBGW4Q1t7UfpAxzkHplIQlw6dNqf9v1OCUf6K0OoTt2xfeDFaOBDK/d0jExxbs2rSnACuzmCndO/KSvowJVq3G8Chlh+/yYUH4WyR8OoFhywzoURJXzN+ww/smip/jaoWsOxez1Bci32sBvztr4T/KhMHMDsAkYcAJorLzWD6CelhziNJZe3O3IauD0jWiI3pKdKuLTuQCVg7z/rlO5rFNZqjGctu6D2V9OlMiI8gMqH3zE99X5Czp4KgOtEV6Q8Fda3mLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1a9lKtIkPZes2B6a1c6oAOIaPDsq1t8O0hVbXfjDMI=;
 b=feoq9TIwItqc3MwDn8B9gWJxZyoSi9lMz/OaI0gTIyVRBIeAjPrjb4ej6cgihW0XPDd6byOATkPRuhmbJUa2LzJosHHotTtSMns/iSyJLw33cBuLnuW45443h9ucbYQfnHdiAcnzbLGO9melzUYFNDo2MSCVq79yX54o2+t2BR0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3678.namprd12.prod.outlook.com (2603:10b6:208:158::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:38 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:38 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 16/44] drm/amdkfd: support xgmi same hive mapping
Date: Mon, 22 Mar 2021 06:58:32 -0400
Message-Id: <20210322105900.14068-17-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d19f0c0-42fe-4316-4603-08d8ed22b433
X-MS-TrafficTypeDiagnostic: MN2PR12MB3678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36785440C08C5F4F016AE45792659@MN2PR12MB3678.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JQWYRcqzg8bJfLXJC/hZya/LPnM5MKe1K2B/MHQzDTxrLOyObI7bSQjiIb9xa6ZOHv3hme7YISbI7l20zboQI5so7t3RnbgQq9WPOSzdHPzpCWgNDwF5aSkaob+xeFopMyoAo8KLqyU29H8W0UhKUJSGV9MLymJIF0PcBe0y2hDrHb+3ZSlK2TyX2qObXKx08vCt66fBiFLQgffjiVqGQgyZyM0/Dda00kwftsEyMIQCS8pSQnzpTpJUtHrEAVgLmKjIN0Ds7RGfX/ZwkxREXO5x6wyGoPhzwjLYVo1LX56Ork67nhzvuiZG5FwwydBM00EMYQym767YoowdPOPLe01tA/z6pyC/XlzFSPsTlaZa9jCYlfTp/Tr1HaL6c4RPH2qmOMOTpKsRswv1+mG1uOGqVotUCBlY5NUI+zJi+ilFq0+BT3KbRb/X9i6uoxly5vWkilOPhpMYMZDlzoyWhF0KxNJTYh3+RviYib9t0QSkCF5HGKcb1xAnB92RoJtPJqKlPXaMpX8FSTJ27ou1cu8nnasJv4ZeuPjoc5OZNos0i4YBO2ueaKIJDtNs3jb9SbXHI3289ahcqYBeQeJVB+txTbQTISCgZYDtKOJbqq+mwrRe8Rron7R7JknR/snZ8+4Bok6Uy55PPVql0brPbBNkzaeQSOaNdgKw/ZnyGFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(52116002)(7696005)(6486002)(1076003)(36756003)(38100700001)(6666004)(83380400001)(478600001)(2616005)(956004)(4326008)(450100002)(16526019)(2906002)(186003)(26005)(5660300002)(66556008)(66476007)(8936002)(66946007)(316002)(86362001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7OY7M8JQcGqRPFlgzmItF+hYsD0Rnhek+1Qm/P3+6eCQbnuOea2VwHq128a3?=
 =?us-ascii?Q?tsjFE1z8GLryrByA+DgDFsC0bxYCMZvBqSORSfozJ/IHaLwtVlcUQIphe/bd?=
 =?us-ascii?Q?Wpx/lg2wK7SNz8i4AwP80pwY+Wfqve8CBXAIC1kvb9MUy01xmLD1+SObs4Nm?=
 =?us-ascii?Q?8r+X9FT9t89pYzV815tOXW3Ux++ujLtRFROcw6X/yQkDHGjK1b6kcW91lIYT?=
 =?us-ascii?Q?fsrvnUKJH8rFsi2I9VtSC/YKvIkpyeeAUPmVb/JtGZN6eHlahXixjJILqm+E?=
 =?us-ascii?Q?cQSpNcbF6sToC3sJM2V9L7bYODVpOytp8HlhgWiu9aPbqDKxYLeuHkGUqPTF?=
 =?us-ascii?Q?dLvRhNZmjQMhM1g54wxEs8/70PwkZf7yi+pAIhr/c/cUdvcGzx4N6WAC9sx/?=
 =?us-ascii?Q?IQwfWJKYCnrgM23jxhNAog+wsHgZ/9Q9/7CwrnUvqDC2GTyG6/tUGlvEYM2c?=
 =?us-ascii?Q?8nGcUXxiC/EK7YJ/o2TTkwsI/ZEiXmdRqrT7coABqVvSK9w1IU8a5yxOIljN?=
 =?us-ascii?Q?FDoPROdjhNeqPUS+uBGlkZ/G8b/T3ox0wBSc1qt5sSMI7RNl1W3Ej+zKYSKL?=
 =?us-ascii?Q?JlGxEJtL77qq/XBxJstj832y5roE+I8kJGhAmnXaYMvIb9/Ine5vBt7GWAnD?=
 =?us-ascii?Q?uPU7El2B8iTmsprKG2DcZwaJf3Yjbi77EA7QxFItrTm9v1iECvccE0RPlPYk?=
 =?us-ascii?Q?u7u/AujRrR/7lCqrGSMURowynJodW4hjXO0COylVtKLwfKI+5nlhuZjOqKhe?=
 =?us-ascii?Q?lJcq1Axj0VwUy5RfsW7Pl74uxvayTmPf6SJzu2lPpu4/107JixGVoxMf7ZLE?=
 =?us-ascii?Q?F7o5JxwzjUdqEI1DQAIwXQpr6ixyTWeyqruwFz+JpMmTNSPZWPJ3/fbcZcKv?=
 =?us-ascii?Q?GoUUNlQrJC8kqPZxXKNvsfDwxGYs/t90IjnIDA+OLnvONiXDLAWspe1+/rHc?=
 =?us-ascii?Q?p9VA97w6dApZc2FNzIEr+MXwTyL4gcnCo2+6pbwXv/4xe0pjcWklKF/Cyr5C?=
 =?us-ascii?Q?slr+hOH1edRQ/D7sSaKBtlG7qFDw6iQCCVi/fVnoz2qgl6IIWUTU0WmxQDEf?=
 =?us-ascii?Q?w3zN2/bR+PuwVHykJRx3TiEBEYSr+bTi1nDPYGPsPk0IP/yrMvCpOJXfgZ4x?=
 =?us-ascii?Q?npFdYF0XEXXHs6lbQvGXxOqrP2m/CSeuZ2eqZdG8nF/47c/RREmuMfS7o4Yg?=
 =?us-ascii?Q?MR5bQkc2M01AzxfBMPiJqHZkW7eBfPr6QHmF26cXnruy2VDzRWeBE9DDfPMt?=
 =?us-ascii?Q?tkXR/aKDr6d6G4O5yxirOMZe6nwd7KltrgerbnaxAii+Am8xIuSsy/lOt4vm?=
 =?us-ascii?Q?AWJHdNAkSYmFlKjHs6mFU2ZE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d19f0c0-42fe-4316-4603-08d8ed22b433
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:38.2627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFyR+/cB1DZMVHsO6wdogCU/3ffNpf1PmqI2H9mXIiZE3MBteRIgJPz7fChyo9+HrMb1lalPTjss74r0/0ahAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3678
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
Cc: Philip Yang <Philip.Yang@amd.com>
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 9b1c5aa86f4a..de5777330d23 100644
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
 
@@ -1026,10 +1028,12 @@ static int svm_range_bo_validate(void *param, struct amdgpu_bo *bo)
 static int
 svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, dma_addr_t *pages_addr,
-		     bool reserve_vm, struct dma_fence **fence)
+		     bool reserve_vm, struct amdgpu_device *bo_adev,
+		     struct dma_fence **fence)
 {
 	struct ttm_validate_buffer tv[2];
 	struct ww_acquire_ctx ticket;
+	struct amdgpu_bo_va bo_va;
 	struct list_head list;
 	uint64_t pte_flags;
 	int r = 0;
@@ -1062,13 +1066,18 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		}
 	}
 
+	if (prange->svm_bo && prange->ttm_res) {
+		bo_va.is_xgmi = amdgpu_xgmi_same_hive(adev, bo_adev);
+		prange->mapping.bo_va = &bo_va;
+	}
+
 	prange->mapping.start = prange->start;
 	prange->mapping.last = prange->last;
 	prange->mapping.offset = prange->offset;
 	pte_flags = svm_range_get_pte_flags(adev, prange);
 	prange->mapping.flags = pte_flags;
 
-	r = amdgpu_vm_bo_update_mapping(adev, adev, vm, false, false, NULL,
+	r = amdgpu_vm_bo_update_mapping(adev, bo_adev, vm, false, false, NULL,
 					prange->mapping.start,
 					prange->mapping.last, pte_flags,
 					prange->mapping.offset,
@@ -1092,6 +1101,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 unreserve_out:
+	prange->mapping.bo_va = NULL;
 	if (reserve_vm)
 		ttm_eu_backoff_reservation(&ticket, &list);
 out:
@@ -1102,6 +1112,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 {
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
 	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
 	struct kfd_dev *dev;
@@ -1109,6 +1120,11 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	uint32_t gpuidx;
 	int r = 0;
 
+	if (prange->svm_bo && prange->ttm_res)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 	p = container_of(prange->svms, struct kfd_process, svms);
@@ -1125,6 +1141,12 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 			return -EINVAL;
 		adev = (struct amdgpu_device *)dev->kgd;
 
+		if (bo_adev && adev != bo_adev &&
+		    !amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			pr_debug("cannot map to device idx %d\n", gpuidx);
+			continue;
+		}
+
 		r = svm_range_dma_map(adev->dev, &prange->dma_addr[gpuidx],
 				      prange->pages_addr, prange->npages);
 		if (r)
@@ -1132,7 +1154,7 @@ static int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 
 		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
 					 prange->dma_addr[gpuidx], reserve_vm,
-					 &fence);
+					 bo_adev, &fence);
 		if (r)
 			break;
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
