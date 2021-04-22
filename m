Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4223676DC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3106EA2C;
	Thu, 22 Apr 2021 01:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC196E027;
 Thu, 22 Apr 2021 01:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofTlIK7aDHLed+XQxu3udt8Z+N/j7qIwSLZ9Am/DfoB5LJ2GY8SD4M5QmRQYiQUZQzjHOHkfM3az10iunXDF036Ef1vMDrhSsv10zy4ZJtOnO5mwoRTdA7furikqJM1hShvtmkAkfeKUETbEoc1nmWFyfZqiEwTw/k+vDCWEKntB200XSD1eeaZ+zZEtXsN0f1sacobpRvXcxTIwTXq19+6ZGNN/Z58dugFXVa+1/QsYp3vzZqFsz2Ye24FhLZ6/mPdI2i9L37arvTp6WX0TiszgnjcQUGk7lpIEQNbKi3cGoVK3zbgvkIdPYpdgjM5Uz/9/JxibwdgCJ1ANxTTMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcvBxQQN3XxmKl/jkoPLrdRLUs7jOhXovQIxMWHgDl4=;
 b=kXiOUzWALUAytJVWGmkDXGi+Ihl7lK6ecAn2oYagZBQWJXejpEuz1IiGLJ9N3XapHh2U2ykWXvHwRytX0Iy+DP4gFVuWAUsRYGGe1vAG6SbhKjuVuj/ESaYiSD315f/UKALVwsGYMazRMPgmtvhmwKIZ0NannVWUoEV2lDz1qzyParRlJQLQxWyMFclri+gnYkaJNGbcOyd6IGakqif681SXPa65GM82587aojP3faX23AzjOpBJnURpRkmcKjz0zNAff8M27RTaddfZN3gcB/IvSVjfnokUcfxrGD4FShsH5RHpuhbLqT3Vv5L/OUappb3runpnW+ZJN2vEAohKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcvBxQQN3XxmKl/jkoPLrdRLUs7jOhXovQIxMWHgDl4=;
 b=p1EBMb1l4pVAn/64msbhjQwXDpKXN2k5hEgO6ffs8JEjWkc45pAgBtXkieNVEIKsyE6Jmvxkb2Pr2NjlSS4L0Esfk9HUAJAPK5nmNljxUQ1OT/N9o3Dh/8h2Hp6R+lgypQBJVwe4k5hw+cLwKiDOsrzkrX6S+UJ33a2x9aUdURg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:18 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:18 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/10] drm/amdgpu: Move kfd_mem_attach outside reservation
Date: Wed, 21 Apr 2021 21:30:55 -0400
Message-Id: <20210422013058.6305-8-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36387260-bb42-4eb0-0e4f-08d9052e5387
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438068F3D072C291B6D0E9B92469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tg01OENGkBelaA5rRdYIvvJ3iR0YUPPzNwqOv5AMgdyJG5hXPRCw3x/8fORXVBFMrl+A6UgeqTdNy6S20CCYKFMS1J6xS2g579HUGw/HKQDtdarBvLvT+P0kQCMKNWViTXK/04dyaPNMVVKWP4N3g3tHwXLA/SOaEbkzlUsQvMDG9hTBllo4X/ik9ArTOcGr+rBahWWH2FhYJkztlCUzOmo4ppZ6nHrAxwbYyTCmXLPBR//5EXeAWlCj8NzAAUPxuCC6Z1mOJLP3ZrsU77jORPVUm+eObHmIiMsCPURVRgAMfEYMc7Am4qXbieyH8xfh3TED14eCmPsmoT88mwJ8K/ZC6MY4vZ98Me0Co1zfofYF4yMRSuouGAPy/tWi7gqK+mwcr/jdY+l+8ryTb/9IkkHaMcaTlif/zpuNeL2fGr/dSfG/MyQqQqCBUFJ1eR9P+7VFE6SqoUZGp/mSJDyt8jg7GwUU5gOskWs0vNUN87GIJ0bq3MSpWpmXMbnzai26oTtU3pi4H5TZSKN0RxGqUYEGtCrhgFZ5TUyw3Z7F7iX5M5PZ2SzRT4zoczCA3aRcyA0btKFf03S5BuscakptPejwZ3A4v8XiAjHRudhfZWx1ZmKJ4IDIRCFbQU9saE8hB4aTh2i81gWF4ZytarLmvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vG6RE2VOmesT3r7n++QsAUh1Wn+uN8B4QG6agOGzeAV8STdHVFFJHurBbflx?=
 =?us-ascii?Q?m0eObz5CeUliVcZ9hEdzRn8qtCTdsjBX3X5tZX0SS8TrHk0lgk4sD9fyh71e?=
 =?us-ascii?Q?V0vAA+kEHgOfxYr3fhSTH8hWaV3UD8AWezmR1BFVRkU2At7u1+YY0puWlqEB?=
 =?us-ascii?Q?Iu9pDPCCtkvK9EgHXcsskhMoSV4qKn3WBoixxTqtn2GIA7axRygaB4UNRsNY?=
 =?us-ascii?Q?6wMVWQgLvVYtg8NsQtnlRlXI2QRjnZnOPKeKTBHGkABZHs1EL7UYZ7kdA2a2?=
 =?us-ascii?Q?gm0fxqiK9Sf4hBbpEbGrk8jpWSNg2/+D3mxdGbasSjnWWHrgSKdiiFxIkxWL?=
 =?us-ascii?Q?0GLk+U/yP+EfJzeQ9/hQLnD+RT1yr/cAe7aBJLaNFTNtavf/cPOe5LKf31La?=
 =?us-ascii?Q?R25holHbODdupEwVhPBeGJWICJsYSZCuBcBfbFyUYnRPdX8+aG/IJAo2bc3h?=
 =?us-ascii?Q?wYjHgste57vocMAW0q+y+iQ0MqjI/MBQByQ0Wm1UaZepUqtKHdWsj+CWS4FS?=
 =?us-ascii?Q?D00JQm98mctQMjPGr0/mR8SBxxKE6z1i/zT6g2DNfY4kM+Byw5dR/ca444L+?=
 =?us-ascii?Q?TbrP8C1HKHLid4LGwgmcBGZLlXyU3HnxH4BGLNXFLZrfJ3mEJ/GtLqozTVNO?=
 =?us-ascii?Q?b5sivFcf+aWZEDM6tIAHP56l7SSZif5Uug/6+BqWwCqZPvwSQm0NyNg0pMIo?=
 =?us-ascii?Q?7C+7CUt4Zq0fadLIT3LFiLgNa6IgN9w99x+eQ+uMPfpFlSyjj3Tpow0NAL+h?=
 =?us-ascii?Q?KcdqHTEym1u+2cfRMguWmNSxyxerzcdNl2fxROE3u/hsDrau5tWlsBrrqVcb?=
 =?us-ascii?Q?JIr4onjHdtXmOW09rtQqxB62XAFnZAGurd0acBQJ0f+c2O3sWrWYRSBdCOYn?=
 =?us-ascii?Q?ojBwWESXpSGVFdTnAoPeM3MhxdNxfpQtpoBkJJDD3jDXq62+iDzb4fyaUQ9L?=
 =?us-ascii?Q?yadZ4LI5kqOWajQd/2Vih+c1lDFb+048QXB9mrlCTABylirUCMoBIkneODsp?=
 =?us-ascii?Q?1dPkvfelZw4y1drn1BNo6szlKHv7PD0eArnaB4nKfGyV306NTqBA4Y/28IEH?=
 =?us-ascii?Q?+2mByS0JR4m7gIuvUysFyL9C2X8J5lGdRtU2eXDvhbp0cHfwr5/X88KjdfdA?=
 =?us-ascii?Q?Up5xP3R/zdR+ZnIbZgzoshdgMrQ4SrhxonFRGvW4Lc0U2u1Zz0DqvxjyJHzj?=
 =?us-ascii?Q?BOfBeETlPMXX87rchuhQwm+zwdfRdCDBAx5F9uI6cec7sxqmOPUskJtYYgzd?=
 =?us-ascii?Q?fETbyZxtOyAAag/h48UD5j7j/hXuAdeqMO6ELSQp2McYDBiA00DsHU2b10lu?=
 =?us-ascii?Q?wkpJd3O7fk9rK/wFzVt2T13x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36387260-bb42-4eb0-0e4f-08d9052e5387
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:17.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ju13sVNDXgWKimULig8WmqnwEyz7B4s00Dm/HhYiuGuvuWva9mov8K5XtEV9rJHUbhTVx2mhCLK9HJ6XPsNisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to avoid deadlocks with DMA buf import in the next patch.
Also move PT/PD validation out of kfd_mem_attach, that way the caller
can bo this unconditionally.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 75 +++++++++++--------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d25d886b98c..9eeedd0c7920 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -577,6 +577,34 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
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
+	(*bo)->parent = amdgpu_bo_ref(mem->bo);
+
+	return 0;
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
@@ -598,7 +626,6 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	uint64_t va = mem->va;
 	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
 	struct amdgpu_bo *bo[2] = {NULL, NULL};
-	struct drm_gem_object *gobj;
 	int i, ret;
 
 	if (!va) {
@@ -632,15 +659,9 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
-			bo[i]->parent = amdgpu_bo_ref(mem->bo);
 		} else {
 			/* FIXME: Need to DMA-map other BO types */
 			attachment[i]->type = KFD_MEM_ATT_SHARED;
@@ -665,13 +686,6 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
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
@@ -1478,12 +1492,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
 		mem->va + bo_size * (1 + mem->aql_queue));
 
+	ret = unreserve_bo_and_vms(&ctx, false, false);
+
 	/* Remove from VM internal data structures */
 	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
 		kfd_mem_detach(entry);
 
-	ret = unreserve_bo_and_vms(&ctx, false, false);
-
 	/* Free the sync object */
 	amdgpu_sync_free(&mem->sync);
 
@@ -1560,6 +1574,12 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			mem->va + bo_size * (1 + mem->aql_queue),
 			avm, domain_string(domain));
 
+	if (!kfd_mem_is_attached(avm, mem)) {
+		ret = kfd_mem_attach(adev, mem, avm, mem->aql_queue);
+		if (ret)
+			goto out;
+	}
+
 	ret = reserve_bo_and_vm(mem, avm, &ctx);
 	if (unlikely(ret))
 		goto out;
@@ -1573,15 +1593,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
@@ -1592,7 +1606,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
 		if (ret) {
 			pr_debug("Validate failed\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 	}
 
@@ -1607,13 +1621,13 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				      is_invalid_userptr);
 		if (ret) {
 			pr_err("Failed to map bo to gpuvm\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 
 		ret = vm_update_pds(avm, ctx.sync);
 		if (ret) {
 			pr_err("Failed to update page directories\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 
 		entry->is_mapped = true;
@@ -1630,8 +1644,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 
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
