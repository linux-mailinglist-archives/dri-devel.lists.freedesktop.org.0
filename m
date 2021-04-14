Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B0535ED89
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A036E8DB;
	Wed, 14 Apr 2021 06:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ED36E8D7;
 Wed, 14 Apr 2021 06:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2Frpw5K3TSv3Ec3xxVj8Uffy+WNfHqERNK/ZTDZDRRmKsV0uRNWC3L9mcxUwdi+OMBo4KTiXvmVhH2C0XLjiIl9Q0pnN9caT4N/PEJkJ0JUmRbHpcQnDd/TkPiFLBWO7MSISa+ubTGkptwYuUeu2VJWvoQi5jAk95h0zAOTHAe11J4vi1o5e9KzNaf/puuQQZpAm1VSqKIlJGtkY4qGwRwqFlXOGd2oQK6qTj7xqboPEEDhpjxuIwxiwv8pWmtnxJMiDnSembmUTbf7TmkkEiKuykxCZFg9O8TCdZ3dA+xzT/GUZRmJHL/Qg+WFtCZZr8hXjEE5BdyB1LVNlnYnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQut1xXkpwdjAD1BditEYBDjILo3RVAJf1/Yf2Aq5Us=;
 b=aBXEZj1C8E17bhJy8RH6AKP4rvtTbPr69Fac8YqPuOmVlG+BB+cl/57CBSEEOJdzfq6bFeIDcZfZbhJgd9miMCtHz6omF9ui6f82T91ywKkPhNrW+i/DUUax8F2yC18Fv75YrRpptfwitoK8vZgg/KIL/q88l4N1kUyXZqf6a/+Klr/21KdbbD5dDwpTpGmh1S7dd2d0vJYYZN7C2ir23cTPcUWsLV5Y0jkSJELpnGxqgi12ewZV6IS/FJ6KGsWrWOc0yiUDFeizOUobamWej9aNauoOADP39x02AR1w3hkEI0MZ4s1Ux1XjOMubzNBHUPnlrS6LVU4qRKipcgeIVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQut1xXkpwdjAD1BditEYBDjILo3RVAJf1/Yf2Aq5Us=;
 b=Sg21ZqsgdC7At4dNt5BYfPG+T5sF2TtoDyRwFLqIPAyf1i3v81cq8GnZ+lM6XOqgAJWqsJ0ateyQaE3IOz7TVIU6eSm4fw4cCGt3RVFtRuz+hZ9qByMp0Kjfrhv8/y6qXJBn6lz5MnBqSN0UN0lwHCV287tWxZ5AoGz+xmHjx3M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:21 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:21 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: Move kfd_mem_attach outside reservation
Date: Wed, 14 Apr 2021 02:48:01 -0400
Message-Id: <20210414064804.29356-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4490978d-a5cc-4908-7c8a-08d8ff114abf
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41259D733C27C8CDDB005C8A924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4heHkAiCHQo9qiZ3Jh7nY/MzOsv5Cn09xPve7N9iv1w1754a9ddXYxDG+ytk4qkAzDfnuMXRVAETTmxbVk0/pvToDbAkOh3F53DtuJmQSYymnF4U7sVZs6CT+UbZj1+et6QGQZzuUEjH2lK+ct8lM6dZLJUEeySmn4gEYz9774h/i0mYgrGH+PlnrJ5wFP9g8lytWgjNuZLRi0EUNfFyI6bkf/o9CGZ9CEZmqx39whgIurmJcQSWnlsdpu8UIVPpxXDSph1gvL//s053CDQME9xajoxGnPMwRil2gYTta+mWpHNowWAoZOt5fifZaLqW2Q1rfZ04EVbWtcRXmRuc1eIJsgVMyeunBO+imn83aYGv0ISJUtw7g3tWeO0E+vPtd/cv1XiDqGGhZcG0U+PA4ajelIn1RAXHImigfbZv/1Ym334u0gaSET7g1gj6CH+AaPzmWhQCwrsPeSD+OboYdHR75Ec9Nq+8aXDdb/7TGMUSkbSsXtPYjjoqXpv/kpfSuy2wG/CmfYhes2j529kC+4eB0IzU8MUSlPovsVTisUf5gqQdh153bA+ru6RdFjepWy/enEX/fKF7hSM1hqjNejB5q9SL3TF058gmnvLX/FOihEKIoMAzG10ZD3BLK6YMU8hal7fFYeTvpEHAvPWyc3hzNwuoMj8RrYF2e/Xd3jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YAZVlu7smxY1sbtUk28v8PxTWd9MVV0iKO6kj2aqBD4IIlEFZmG3nj3Vs4B+?=
 =?us-ascii?Q?ilrUGZed3RF4dJx7piF/hih6RaaVtx3Etvt/3DboNFS8+QtrZYGy0WMl0o9e?=
 =?us-ascii?Q?FMb+ACuKCSYWARHxs0yrkAodQ4af/v8+dBlIp9EoLJaFSrnQ5jlaLePmeH+H?=
 =?us-ascii?Q?T+sgzvKcMZ+cYvbJGFbSQkSZEQHSOfe9Jk1lnsVMSBQyz8xTZvnqcW9hjF0f?=
 =?us-ascii?Q?URrQfTcHixxVuX6AFeLYAHH6XbtU0OTO4AoU2sk2MxC0APQpXhyGMKmAVaBa?=
 =?us-ascii?Q?wb0XMWA/VQ3l9T5JBjl3P7WTaEfTIJyKr++UaM1NV8W1Q5SUKBES02VAXUEg?=
 =?us-ascii?Q?UncHCH9qX7KOXrNbQPnch1yZpExEPHlTErWEgjY1SdKQgIv9UFpckEoCN1JT?=
 =?us-ascii?Q?fw9VrpXAjr1urkoCa64MJ8evh4hXD+tOvrjmf7FC6wE37itBJ1tcy3yLk3DU?=
 =?us-ascii?Q?hPm2ZaBa4XqIebSd0O7GuMCU3gDEwEfgOdio5g+t4PH7uUR5fKFsxwb1FpHE?=
 =?us-ascii?Q?FIW5LsJGOrmXgLacvNwOaWMA0jlcjK2sVkarlxN8YhHnoqXDyYIQdYVycJfL?=
 =?us-ascii?Q?HUFr5aquwFCNTzuxSz0DG7mc1OWzN2NN8eZQEKxvMRmJ+Xp4ERe2G7/sXUQK?=
 =?us-ascii?Q?B3EoMNvKxwmph2ROc/bTwRZrmhDdfb+mAjK2WOm85fVQcsR9DtTeRxKQkm7a?=
 =?us-ascii?Q?CLNn3CrOyE2vMpKqyqKq/GM1P/eKd4qYJgC6RSZsErwgF6OSQpVzt8l/XeXj?=
 =?us-ascii?Q?xeaS3jHI79VUY2PuJHLXBUZan7yL/RC6ekOMtN23nkvYTe0J2Hnhj+yZovsp?=
 =?us-ascii?Q?sQmSHpYThFy9dN4lVluqg7Y9mFm2TuB1zBwfEskhYI/zbA0E3oFIjZ8WRtNw?=
 =?us-ascii?Q?6pQq3cbVlQUrf5XeCOV5Ti2blZf6qk+liJaZiIb+6LSkUwe7j9DssjGQw2y3?=
 =?us-ascii?Q?3Rt0afwvlrcVxb1iLh4/tIrupcoh5/wTAJmnSLIux0Sqb5i4OTjuqObc73hm?=
 =?us-ascii?Q?01lXXOvwC+iXJgE0ZXBwc8FkEOxY/6JHUOxROgSgK1kXw8UWQq+DWuvfsvgA?=
 =?us-ascii?Q?LweoxTdvgxpjxJn05kM+3S/sNHllrrVAVKYWOd7vFpAMD5uTZ2FLWQiGtuFO?=
 =?us-ascii?Q?JFLMOkQPxrheiYd3f5jq9LJHQmsm48x4tmN+OyXQHNqduRduFltOj+Kfnb39?=
 =?us-ascii?Q?JQs8XHCsP1Zk35pAEz4IrXz2nQbdCMMnX2x2ofvoTIATLoBbbPYlWL1DTS6R?=
 =?us-ascii?Q?zdUEubaLpX9oS8SNoCMMFgpQehVIJNy8SbOjfz3hSFX5/fFd/NhXW7wlelxC?=
 =?us-ascii?Q?xICFsYzHrY1tt+dIxcH6IJQ1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4490978d-a5cc-4908-7c8a-08d8ff114abf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:20.7968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYExOLpeSVYtvYmkB1WcwRia5dhj5z8vXlHnff2GB6Fq3Xvke7ZJewu/5jusFJELeg6LozKY4Rztd9TxmxbeaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to avoid deadlocks with DMA buf import in the next patch.
Also move PT/PD validation out of kfd_mem_attach, that way the caller
can bo this unconditionally.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 72 +++++++++++--------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3bb2ae185bbb..1416f3c03f1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -575,6 +575,32 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	}
 }
 
+static int
+kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
+		       struct amdgpu_bo **bo)
+{
+	unsigned long bo_size = mem->bo->tbo.base.size;
+	struct drm_gem_object *gobj;
+	int ret;
+
+	ret = amdgpu_bo_reserve(mem->bo, false);
+	if (ret)
+		return ret;
+
+	ret = amdgpu_gem_object_create(adev, bo_size, 1,
+				       AMDGPU_GEM_DOMAIN_CPU,
+				       0, ttm_bo_type_sg,
+				       mem->bo->tbo.base.resv,
+				       &gobj);
+	if (ret)
+		return ret;
+
+	amdgpu_bo_unreserve(mem->bo);
+
+	*bo = gem_to_amdgpu_bo(gobj);
+	return 0;
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
@@ -596,7 +622,6 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
-	struct drm_gem_object *gobj;
 	int i, ret;
 
 	if (!va) {
@@ -630,14 +655,9 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		} else if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
 			/* Create an SG BO to DMA-map userptrs on other GPUs */
 			attachment[i]->type = KFD_MEM_ATT_USERPTR;
-			ret = amdgpu_gem_object_create(adev, bo_size, 1,
-						       AMDGPU_GEM_DOMAIN_CPU,
-						       0, ttm_bo_type_sg,
-						       mem->bo->tbo.base.resv,
-						       &gobj);
+			ret = kfd_mem_attach_userptr(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
-			bo[i] = gem_to_amdgpu_bo(gobj);
 		} else {
 			/* FIXME: Need to DMA-map other BO types */
 			attachment[i]->type = KFD_MEM_ATT_SHARED;
@@ -662,13 +682,6 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		va += bo_size;
 	}
 
-	/* Allocate validate page tables if needed */
-	ret = vm_validate_pt_pd_bos(vm);
-	if (unlikely(ret)) {
-		pr_err("validate_pt_pd_bos() failed\n");
-		goto unwind;
-	}
-
 	return 0;
 
 unwind:
@@ -1516,12 +1529,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
 		mem->va + bo_size * (1 + mem->aql_queue));
 
+	ret = unreserve_bo_and_vms(&ctx, false, false);
+
 	/* Remove from VM internal data structures */
 	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
 		kfd_mem_detach(mem, entry);
 
-	ret = unreserve_bo_and_vms(&ctx, false, false);
-
 	/* Free the sync object */
 	amdgpu_sync_free(&mem->sync);
 
@@ -1597,6 +1610,12 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			mem->va + bo_size * (1 + mem->aql_queue),
 			vm, domain_string(domain));
 
+	if (!kfd_mem_is_attached(avm, mem)) {
+		ret = kfd_mem_attach(adev, mem, avm, mem->aql_queue);
+		if (ret)
+			goto out;
+	}
+
 	ret = reserve_bo_and_vm(mem, vm, &ctx);
 	if (unlikely(ret))
 		goto out;
@@ -1610,15 +1629,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	    bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
 		is_invalid_userptr = true;
 
-	if (!kfd_mem_is_attached(avm, mem)) {
-		ret = kfd_mem_attach(adev, mem, avm, mem->aql_queue);
-		if (ret)
-			goto attach_failed;
-	} else {
-		ret = vm_validate_pt_pd_bos(avm);
-		if (unlikely(ret))
-			goto attach_failed;
-	}
+	ret = vm_validate_pt_pd_bos(avm);
+	if (unlikely(ret))
+		goto out_unreserve;
 
 	if (mem->mapped_to_gpu_memory == 0 &&
 	    !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
@@ -1629,7 +1642,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
 		if (ret) {
 			pr_debug("Validate failed\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 	}
 
@@ -1644,13 +1657,13 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				      is_invalid_userptr);
 		if (ret) {
 			pr_err("Failed to map bo to gpuvm\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 
 		ret = vm_update_pds(vm, ctx.sync);
 		if (ret) {
 			pr_err("Failed to update page directories\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 
 		entry->is_mapped = true;
@@ -1667,8 +1680,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 
 	goto out;
 
-map_bo_to_gpuvm_failed:
-attach_failed:
+out_unreserve:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
 	mutex_unlock(&mem->process_info->lock);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
