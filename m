Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9C350DB8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C16EC44;
	Thu,  1 Apr 2021 04:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE946EC40;
 Thu,  1 Apr 2021 04:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feiH9D9fmNCCWWoYMaWKlYT1mpXMejLJqiviILAeFnVmn/V6qz7mPMI1nPxEgPmzQF4RjR/c/BTa6qpjB30StoxNTpTm3JM+52T3Jm4YJhdvgTpmN8gzppcpAP1bSgTMi29ulhIPFdrfaJ88M7MJQSTUF9H3BYoOtHmEEe9eTJXavxBz2+RbnjltLHaXGAun/R52HeI2ERxUyKtPIWzvZU+jWeCv/9xXaZyVrj8vvDu9x0K5EqE93fDopoBxGFpYhN70xQKn7A+qI1T5Gc8pPejv/1gXpmvwobCNmrYaQfCtR9HewNY/87khTCbYq15AvWuoiVrBVlL3ZneYZE8SJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqdnSGxpb/8i1qRcbax6jZIbjRSZNYRXd3M4rBQF8G0=;
 b=GmQJqwrhG+dc836khb8lYDltDfL5jUnZ+qzD3HNaMLnyhwP6qXzJfBljEK3wIj2HYSLaFyB8FQg+y9FETHwFwemzD2qhG5gIcXzjPB9b5IcNzi71C9/Tq+jSYAovBMyL1ZPd0Qena/vtjwX6arREqv+NtzFalrrGwnMQqh7jibaAsvCYyDEpHHACqbZ99xv39H2CuDUkvzCexWClyog/0hGWOCXOJDZN6wbnxfeOI2f9yvUBX/sJXB4VwC9edKO+cgIHtgRbaKaY43I6d0bAnuBm9USsna1dnsdkRIPotwulcVKVGFl9w0PBYYXKl7JZytJRatFSf8x4uRZ/FZ2Zmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqdnSGxpb/8i1qRcbax6jZIbjRSZNYRXd3M4rBQF8G0=;
 b=GGPnJgY7hHkh+e4s+0JO2SUSY76SMNW1vj/2jHilnLQ7VU5srpAKy4c7J7LfbQ9YcinmC/A4iEy4GVuEHNUbwMnYVcKqYPg+4jo2e3aUejVfzZmEMUIObqGSadWO8TBnEEbqgciHLOozd6q7raT94gsGZ5M2ahoeuQFR6aZIUl0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:22:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:57 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 16/34] drm/amdkfd: support xgmi same hive mapping
Date: Thu,  1 Apr 2021 00:22:10 -0400
Message-Id: <20210401042228.1423-17-Felix.Kuehling@amd.com>
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
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c49c98eb-3a03-4368-247c-08d8f4c5d32b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4222E7300AEAF8221266D90E927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oc6zgQGnB08Fy9BaqMzPPFpxvCpICUxCYTUR1/I+nPLQKocfHZhg6LOeh43B6qdJ/QSt0jcO2pBoymMeSevWAzduJBXCOf/AMyMwKkPHpGaV8WQe+bL3tUHSoYS9nQzRQiRUY1qE4VFJgBnosT/EdOmK6u/EmttRuH6XdTO7xGdl7Ua5An1FmwMjOsbTnHhPARyfMp0ohGrnQVFTpFw3B5DnnCgmM7lLMZWLaA/kB3heabm8Xo2Qsj8gafsu0rxSbTzM8OpB+Q7jSBnDKRI2ARfTTxjzHs8OAKsF+1rbAaIIuMeWe/gNxI1/SlhqSls1HcOlHSI4tLVmFYj9DCirxs7802u3OeXg2OOA8dk/vLsv1LQVx873PpZ0667p8Yy/CgRPclWxzPeJzO1VSzwFXrWa0gDqL4uIEvhl7A5O6VxLsQc0XVNp4+FvCaS3F1dM2ZyQDMq5gI0UNoCg9Debv4P/DhURhHFcFARse+Sv5pct1NYWwPpxR1XP0zowTn4vIdfVL9fjFYCBET/rtXForEQuosoKBp5d2b4h3nlq8ZJGT+r5Z4mreI5HUoq2529E7Dz2mR8B+dFAF8sRB1C0A3NCCnm3sw+Fm9Ev50k8SIe9NPKaM6Kpop4K7PiG539papP9u9NjUEVR65e7IM0BuhiW7j8yK0G8JCLVSLL2iQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(5660300002)(2906002)(6666004)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(83380400001)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NnoXEvHjutyEogAyuBTGqs2w2WHdrAIwB/ydR3e/PcM9I7QWSNaFLMzo9gPW?=
 =?us-ascii?Q?2WG2AR5TwjfM00QCXutRzQ5JiVuTg71m71Sj9GBHam6HzhvdldRkGVaK5TAG?=
 =?us-ascii?Q?CwsYiTqDq5F9kQ+VnTtU12ClVRXDtGVQhgJJwNc+giHzRp5+I3DgbvKVTxkY?=
 =?us-ascii?Q?sAoWW2YVzU2UIWXwGxPYt6GcovlOleRFByROsi7TDaWRgq2idNIIgLfKKcCI?=
 =?us-ascii?Q?FfzTTBRG0RdiGPmSL+1GZgRKIrUXv8HK/Ejth94GuPImXHlm7Pzne/Pcb0qj?=
 =?us-ascii?Q?+e2I14JWKXseimgp/gc2PBLkxVAf5ymgblPlU5M4eYvwGtr2CTnG6IejQwzK?=
 =?us-ascii?Q?5baixEuJcbZ7Li5+RhASAaXQux4NgTVX8zEJk3+8/PcL0Pue3R80grQWUxld?=
 =?us-ascii?Q?zPF4KrFpZBmUQr9qec/OOhQD5be8zvSdju7k14Bx0UzFmws/ceVEpfDgD3Xp?=
 =?us-ascii?Q?TsAHGgIx74kqc0Go8zT82ShW3r57CXsopBxFQUz7ZjTnsSCRipY87U4kgb3C?=
 =?us-ascii?Q?juy3BF+GCqqRm0a8iVyRI6E59xGVSSi4Q+LQ6DsD8H4nm51jhmEYGUlst64F?=
 =?us-ascii?Q?iLAG1bPYC68VxCc81n9359xqd8NQQg4L62YsFeBHJdGKSAHqmpDLRNl/0OGj?=
 =?us-ascii?Q?LizT8hWxFHWBf2r8icbqA2chEVc+AVzaxFfOtz2UB5jSV9LadDVCcqDgUv4/?=
 =?us-ascii?Q?YOVgH8twQxa8ce5/TLd4mvDKqPjgtgMidyuzSOp5kGQGgYv10VBguyg4k1fW?=
 =?us-ascii?Q?BU7GqXJr7oB61wtpbgVItR4opx9ULyq3iJQmDRIbr0hsfQZOSKzixvDZcTn8?=
 =?us-ascii?Q?v0fsQe3CPPCfPtgcEJKXZqw3+XnyrUIO5xnzspDu9LbJZTo5/1FpJmo40hEb?=
 =?us-ascii?Q?pTywvS8b1kwoKdn7f/kwXTWvq1N59nJhNU+yvOd0rQ0vHJ98dKjA1YASEGEX?=
 =?us-ascii?Q?Jc4DkNiLQ5NE1tVhqmgSentqXh0tisDvY0+jyumZjuZAaMi4AmzIkyet0Uks?=
 =?us-ascii?Q?eabkY2GqdPJJEGxSVEhQt21FGJhYKpEziAU569Li/Gft7k5noPL3tGYc9LPW?=
 =?us-ascii?Q?woAUEXwVD6mMQZwSfcYH9dX1cbBsFk+Fet51naIvOKvLvJGJf+6IGHZKMnB8?=
 =?us-ascii?Q?DID+ewjhVMYJTwq6R9DA9ofQQhIqFfM9cNn5cokvyfs6k5luCwCsUYIyZY+F?=
 =?us-ascii?Q?jpi9j6E2+Hdepddz2UtGaksHR2rhObidn879vP2MCcgUhFUbrwtlD7rR2oPp?=
 =?us-ascii?Q?t3j+WhdWiRNd/Q/pPjAcsEkPBlHZF3nIn8LBrgPHjTjyOl8l4HTPudnAK0qZ?=
 =?us-ascii?Q?4LBbImP0+aTyPEXr6l86YGTs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49c98eb-3a03-4368-247c-08d8f4c5d32b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:56.7274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjEtrwM8PMFR+soILlX0wUDFyuJVdx+dmOMW7iU8kssa3VJVuulFJIZZNbpEQ5FyW6cQtrAAg1zNsixNsJO4zg==
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
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index f01bc3b4010d..f557f67b9d2d 100644
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
 
@@ -953,21 +955,27 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 static int
 svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		     struct svm_range *prange, dma_addr_t *dma_addr,
-		     struct dma_fence **fence)
+		     struct amdgpu_device *bo_adev, struct dma_fence **fence)
 {
+	struct amdgpu_bo_va bo_va;
 	uint64_t pte_flags;
 	int r = 0;
 
 	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms, prange->start,
 		 prange->last);
 
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
@@ -990,6 +998,7 @@ svm_range_map_to_gpu(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		*fence = dma_fence_get(vm->last_update);
 
 out:
+	prange->mapping.bo_va = NULL;
 	return r;
 }
 
@@ -997,12 +1006,18 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 				 unsigned long *bitmap, bool wait)
 {
 	struct kfd_process_device *pdd;
+	struct amdgpu_device *bo_adev;
 	struct amdgpu_device *adev;
 	struct kfd_process *p;
 	struct dma_fence *fence = NULL;
 	uint32_t gpuidx;
 	int r = 0;
 
+	if (prange->svm_bo && prange->ttm_res)
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+	else
+		bo_adev = NULL;
+
 	p = container_of(prange->svms, struct kfd_process, svms);
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
 		pdd = kfd_process_device_from_gpuidx(p, gpuidx);
@@ -1016,8 +1031,14 @@ static int svm_range_map_to_gpus(struct svm_range *prange,
 		if (IS_ERR(pdd))
 			return -EINVAL;
 
+		if (bo_adev && adev != bo_adev &&
+		    !amdgpu_xgmi_same_hive(adev, bo_adev)) {
+			pr_debug("cannot map to device idx %d\n", gpuidx);
+			continue;
+		}
+
 		r = svm_range_map_to_gpu(adev, pdd->vm, prange,
-					 prange->dma_addr[gpuidx],
+					 prange->dma_addr[gpuidx], bo_adev,
 					 wait ? &fence : NULL);
 		if (r)
 			break;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
