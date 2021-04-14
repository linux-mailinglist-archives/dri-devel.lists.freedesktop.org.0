Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A335ED7E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C8B6E8C6;
	Wed, 14 Apr 2021 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6A6E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVzwxlcLbnF6PPvhTsGVyhzmAUeKojFSbSOyTy0a/EZbyjbHyC7yFCPJXw7lsU+fM2KMq5a3RBX0QlyQqHuGhbaV7qqTM6xpfdV8mpt/eExzxjN0dFWujJC2/FldoHJo4dNJXZgyd1CQ283qaRiL53nzS9CXLb983JqkTjf3JTWG/WYa98RGr9YELaQaUGaQLpXrpYd6/uwoK14VLq5EJxBLzVVXSPgUGFxCDl63VwiF3DGmwjFXEU5qauYMzbwklSv95mamvcPAQpDDZdBns4xn+mc2GKGKe51MDugcmHycmHNgwQ6IlVW1sdtiQit/xOIo2+r5kXcuv2CVDuT7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQut1xXkpwdjAD1BditEYBDjILo3RVAJf1/Yf2Aq5Us=;
 b=lC6O1ydlkacJg8/a4WnFLx1p5lcxlfDARUkE8paXJgX9rjR3eCSF7UCIf3oWbG7XjveJ8VWlQlebDwIN0R4uiV2AQxHe9WkoyLFVJomH6wINwDVo6UPJoRq5jqsmeoIVuhDDjIoc+nzjkAiVL164jZwbz6oDhX5L8RlBGMxqvx2u/xdkd6Iv9w2XjBMjYtqNUXw3+1LgtpvztsHeP/faP5G2+k72rjXQW794YHGFz6im4qSLDxKtzVUqICxPmvxfUFs4/enuDqaYo74/8adgxNh1NPJinmoej3AFlKKgIFzAU/7Md7+j8Xf6qXYVu6yLlF707GuUd5f1HdpLCguTEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQut1xXkpwdjAD1BditEYBDjILo3RVAJf1/Yf2Aq5Us=;
 b=Egya3pUYsrAHm62bvlfJavfC/zDL7EcsrT+ylrCZeFgfImO0JxOC6bL/E0JhxDw2KhFDEJ0ala2B2XLFjZ/hD6cy9hosDrvUlvonr+x4tpFY4sJO2F4ZYcb2jeJZP+Hm7a8vGwYGHByulBYXFXcuvXxXteHWVehIwuPuVRIPg8M=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:46:51 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:51 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/amdgpu: Move kfd_mem_attach outside reservation
Date: Wed, 14 Apr 2021 02:46:18 -0400
Message-Id: <20210414064621.29273-7-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4ea2180-46df-4d11-cc5f-08d8ff111535
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46896A75150952B81F922468924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hASnQUtFu2ew24VnOq2Rd4BIT+Ya5GDigpzV42HM/o+TjsU+rWm0tP5blFPIBXv/3CZGMUBXpS3NZfIeYlHyudS99HsQot0Xo5tE+b8v1QBkJYVugLaQ652/P/ixly36bqzs+IaqV1tXuwxVfNtffKs927P30r2skr12byNqa50s13Jtesl5doxczQN0vlcI5I0uF84SpCca8L43EVDpF5KwEuWVm7e7/xDHIw6QnzxABRMbZLOo/mmKHD3IPlqTK5c05QKqAX9FQrRfGSaGaWjQntJvzzSluOmbFrFpDKOPjHvnpERH40yXtPJVRawcRWSGU+G/lDPMDJB1PgDCcPnu89a2r6lIrHcjzFoi9oiktkwbcqEDn/8BMwW811PV2NMKa4obVPV3TjoWVRY+/cD0BROHwTBF8a7vYkXGiCF90Monf+IAYF9HnPcAf6scKSAhDqdCS6KGSwxtF6jyjVMGQ1ji3TXFrhfOIEraqEddOpXHnyBJ6/aTQZOIDHJrQrwn1AYQMdwdhXAM6C/xnGX3AdjKfvGN4UnEYQCtr2hP0pM67bYp7WwweoN3tKhBwWL396iT5o0mUtTA8FA/ZFwxanrP4N5OKaYCqVHvwNvYv3RcqUCZU5Qq289yCU6xN4S2bDPn65m91KyJqX6hb3H3CE82yqIvEe4fm6XEqP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sNaoOtl8GoFR0xXIS9AbYhAKBzS0csybi6aVIvOKvHH1PNrumBKYpEvYbPQd?=
 =?us-ascii?Q?mTpzvBtOwkc6IOJTN1Saa3z4Lgihv+yk5vtrG/I6eNru8gz7AMIXbA868h98?=
 =?us-ascii?Q?TRmrJwJxLb+0/1CxbjDC9Ao92vpBS6WnPWWSXcaJkn6/7PSE6YI20aPc92SV?=
 =?us-ascii?Q?9UoEJ64tr5/triQ1zL71dasD16f0Bb4ZEu7CrxjwcbbMfeWSWbEQTFYShbEX?=
 =?us-ascii?Q?SpJaQrp7GbTYUREMbABMVARIl6P2Jcnu8FHdFhkTBq3Xdy5OMv2g/IzOODU0?=
 =?us-ascii?Q?N4fFq6RCN2pVM1Yw1xaZ8vWIMJ3ddHMwMDvQ7R5QJc1cO976YFCZD+VIuP0+?=
 =?us-ascii?Q?d1vAFT4w1VHn9UIVMdI6dgfJvcLaauSQqipuycMbeVm3Baj9PYin/nA7qwfD?=
 =?us-ascii?Q?qsGgSGGcOkLwoylCe6Bb+xb8JYJXT/ujXmBTt80lP/CvzcXAEpjJX5182/0x?=
 =?us-ascii?Q?aUaHXF0PsHkya6151EA3iOhl/X7ycNoQfDqwefi5oLiBOPzQVP9QP41SKBUM?=
 =?us-ascii?Q?ZFOdHppftmXucueadITvbnn/dNkebU49LpcsPJo6lYfSQBx0K/uvg9uqGSfS?=
 =?us-ascii?Q?n9w7C1AcXvOz6aw1bNU07Z0ZMeIqj3Z2uZJ464jt6wtZ+Eiae0nfGGEXMht+?=
 =?us-ascii?Q?vAkYTjkTw4HNlsfmFFCER9XcxjDXtlJISu63+T1IpLj+ei3M/oLeySGfsFaQ?=
 =?us-ascii?Q?A9WTjXOjiOEad5akL6DQZQ/i+KJ+9aPoB1RRakr193RrG5wQrV29BbLw1KS1?=
 =?us-ascii?Q?gsA0LZsnCXi0W4QjKOFT0TC6jX7Sxp+f07Nqf+nC95CkG8yrRQaeo4fmh3Bh?=
 =?us-ascii?Q?Y0AVWk2PHSmQBshU4VCLwnxkONXxeCwz0eT4CfP2rW70SnzEzBbam/RVG/LT?=
 =?us-ascii?Q?8IMFXO1uLSbUkaYaPIaQ6xPixDqRAze/d6mDXrU46faVykHwMtkEMUd0GE75?=
 =?us-ascii?Q?oh5fSOoEfkZkJOPQSXm6Oka91e42WKNpAjXaI2Rwk2JdStEw43lqqTPc5r7y?=
 =?us-ascii?Q?2de/zgjUDuLu+cutQNfYuZgMsNu1TimgukhSOnpkq+6KOzEwEOr3h7y8oGcd?=
 =?us-ascii?Q?lf9hKN7et/lN1snqb7UwJRxaGGa4ldxPMTAbqNrT/OJ4ADg3Itw4Gm8iheIS?=
 =?us-ascii?Q?XNgq3qBruphbJTZDYQGqk/Bdjoq1lMonEnfRC3homVcV1nZJmGozoUklaUki?=
 =?us-ascii?Q?km0iBDPRyMhcePnM4+vig4eTRZAqvbjI9iHCJYjVDN1Kh4+HzEfXYvkaPV1x?=
 =?us-ascii?Q?8Gz9AV1K4orNhQrRSt7vSEyIFo1VaXc2xB7XAla9uCrNujF5M8iOgzs8kFcJ?=
 =?us-ascii?Q?rDGE6iubSE983qNVapfF+46m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ea2180-46df-4d11-cc5f-08d8ff111535
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:50.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WUuljiUSkV4Uxarb4W9lX84cfw/ywd35ZjQVuepV2GQvBUEBlkSPLhEpyFRnDWLTGAoXWHSg0QFiNzL6thAzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
