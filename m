Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D0835ED7C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9426E8C7;
	Wed, 14 Apr 2021 06:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D466E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEwNkFQsVEyrkEJt437t2hkh76H5BGyqb/M6+CXTDYxzbdkZ9Gbw6amA6z1ljGmPLF5rLrKijlht4RC+LIda0Tsy687gYv3WagRQMcybF+7kaAOsh9T1zJ+6j6qe7A5LQ1YzdtrHwh7M1oBfVuMiTCjGH22hurfgXYsJP3Ma9DrjMoSVh8RHtTihNsmF/oOt+Gj5wo+P7XEOneR/i1RKJLt+NxbOh/CCnLaDyJU05cpJa5AEKzVf1+wanfjl2CqKIVIuU6V/r4boVnrUX0pO+m/wvJ+2BDGCDv+Q7EAqSmuDNkLck9jH6i8a4oteVGlcRbBgOxdIIkev0SPSZjp9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb8YxsUBmYMVnZl2DgiAN61Zr0J9HEePKeYL5KfZrdQ=;
 b=DWI7CdXqFC9cJwzLEMqzdEcMZB28SpmXrP2U+dgKcGeicPMw/1JpRqCL4tHJp/W8tNtZ3Gw24fYtJ0wFP4ajWatUD/paTgnD1bvHGwd0YAefg53r+eLsdB8fwA7VhzTR0Mhq2i/t60v6lBslOySfjkPcxbzhwzpW20OJHMkQ/t2xjPfe1yOFsFdSukqewp7dg5P4/4WfilT+uFwNSaGQIIQbeeFeQKTjzDd+B4I2H833+bY+3+6IlHCnChBzzRINBn8+CHOD1BoTiLmRa/MLNISvO0mXaDxjlKTcwjCFV++Ltgaa4G2EQ7pH/8Z+pS2qHlfg5kmawTNgwB+4efLTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb8YxsUBmYMVnZl2DgiAN61Zr0J9HEePKeYL5KfZrdQ=;
 b=vaONb3rIedjwvfTrN1LQZjdMbP7yUkz33CrXpM3hcLYsztqwZygjeJNSs5tkxX+YHDSXeg0TeyWo9PnWtuxEp/qT45leKAE6wTZB+mJurYZqj/Vkur4b8n3jLJlLlsIqqyrsmjC4mGjSAocIVD0C51U490HUzc++SSru44ty29w=
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
 06:46:50 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/amdgpu: DMA map/unmap when updating GPU mappings
Date: Wed, 14 Apr 2021 02:46:17 -0400
Message-Id: <20210414064621.29273-6-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d4e473ec-c92c-4986-0aa8-08d8ff1114f2
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46891E040E9447E541D72AE6924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukoxCNJlgQO8AV8hmx9t5NgLeiLiXQWZc/cRvTkHC9repHRG11aN1wS3L4R8JrmvzBJuVaBxadtq10+oqozyjgsnJ1f+YMfLw8q09eYYt2/+iEiTs5iH8Shx9QqQ3/9WuEEOx//weaCz2VAdKEzAxT/pWWy095l/nO4kYaej9b99YLnVAfkJxeA92cGbBtGNlY0+Z7NeipX9/19Po1wR8LkTxvg/xjFrlS6YLKaV48ptWdA8gUfGPd+CCzb2EDjPJzZSSdBTyL9Gzv3Xzk8K2SU2vpDxNdZrs1etjI32AIp5neNkZ1w3+kG3jV7UpmzHTDdBl5NioDoNDzUGigkfyL4GfYAEMd2uTUSusatcegrJwWK9bBBN2Iw/AuFbRMA+4xrITjKWlH9NSdJe6kFOoMTDxkvKsT8bwTsX+dMo8RXXdtDHqnwU39O/pRAeKiZSqPXlueqNxvMhXJ8X5uzOmFgyIOFSE1zs/De1WbdNkpYxb86CzkmoFFHMrMXkU6IX48WleTujFLgdt0Cek+FTqXCPcWigxVRvXt1OflZlQhQxhNINwmTJdbycwVVJnM0IVvnnzIxrTJJPQwkEZOKvlrzml6OKhAEmCaQAtuGtUIWwCKvHEeDzqMZ9pF40yFkxF+h0OmUmJtlat1N2Qy/NG2jeqZAjz+BG6aQFBgjuWtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KxK2/oI1ncuAzY99GPpEULG8xadP02O4c7DMoMJkmp4gI9eopgVedFxMBzvW?=
 =?us-ascii?Q?Kfh8zGgyk8t496mxxF2TkK3DVs3qLWiyjDbW19P4n+GBbL4CsntuyI0/3HMQ?=
 =?us-ascii?Q?Tlbn8MTwLdeyZ+A8ttgJw0hpMKNzr3yhSS5N+xaqyZO9KNwtNFv4xCXTo5o7?=
 =?us-ascii?Q?CIf9Ao+T8hi6Cya8rUzR9bb4Oy67pGlJFHpeU0QCJDjey455bocdhUUobCsU?=
 =?us-ascii?Q?hh41iK/6EsCajLrDQ3ygCZ7IMOknjAaee0DPWO5DzW13sT3bNOV5oXAo+gBq?=
 =?us-ascii?Q?Eyr7Ksw9+C+KiEhq6fOb1ppMEtCDtcAqZqJ/aQL+NYT5imIu4TXapqiaLqXs?=
 =?us-ascii?Q?bZT50dUlzaNVMzQQc8Jfr95Q+wnUv/WEk59ZttB+YgP3qIB8EN2sV2JKP0jY?=
 =?us-ascii?Q?zSjOKCRIIDSkx26tTGm7Roj/2EdiuYlWVJcoMUM7ZqEFgeIKIDyyqGNfoP86?=
 =?us-ascii?Q?KCy/VRUTBQphhGv745a4TIH0YkRkzXoC/7ZnAjooQ2mkyeAqk2ES+EUz5Eyp?=
 =?us-ascii?Q?1TSQGrfdEu1RkZVqWsrR76DhyNgs/SfbwK3Iz5lDmCM26bDmDdTLMhL3q18S?=
 =?us-ascii?Q?R2tkeORVP/1n9DQD56qS5Ixs7JpVVub7BOthSAk2dlPzzjl/JUscQ/WNt67d?=
 =?us-ascii?Q?JcqrSFbMLzsWdHZotmBKh5d5LWFwbZkBZWyu1LNHBR/65LC0+prNggQFSge3?=
 =?us-ascii?Q?HkNT5+YETVRcBO6KmEbHiz5JGkOd6AAfn2PtuMcrxhdUbXyVUjl6RZrK+B8T?=
 =?us-ascii?Q?ioK0nhmxkFXcJ5oagtfNXZZullNFocKJiuy5S68vy5GNQqSYUxUHlgwr9m5S?=
 =?us-ascii?Q?4daE7R1YavcpoICSJHMjWpg89dFN7AqviKuCO2Kzp0XSiuepOIQp+Tciudfn?=
 =?us-ascii?Q?u0cxf2TivUvMpZMeKhOd1lkIBcqNQfZeil4XwtYZiGZVwQt5LTWi6n79ehfV?=
 =?us-ascii?Q?vD8DSZI8ugWuEoKaTfQ43mjBpk1AvH5gDkkpBZH00BRNnFyThwaLOtYp8I0w?=
 =?us-ascii?Q?CMy4AExfzNsCTuhSl7KCFmjPWTF0voGMYjWUcckSJyVEPo5RRyDCcVH1tNTy?=
 =?us-ascii?Q?vjQdvm117ndYpMjO/1ZHoqTikPQBDU0LnJPQ5VfGr7hWvVSZ/Rvkbs8EODiv?=
 =?us-ascii?Q?eg3QLkxvU+Fflabsi/KWVSwV6AL5bRrhv1ziEZRoaGWViJ3IHKEcC73AUZiU?=
 =?us-ascii?Q?dgYihdn1ssNdNzDu+Fpg3wWeivz8+UoKH7IWQwQqCKXo+hf092dog3a3ynfJ?=
 =?us-ascii?Q?1tZqYWu6aKKdXXGK1HKQVyNbtLAgWv8qfONED/K78T39Ra8/QvmIyCPogDim?=
 =?us-ascii?Q?Cer9xcnhyJiWl1I+1wQF5OGW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e473ec-c92c-4986-0aa8-08d8ff1114f2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:50.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXHjQ1bMmvQXtp+/BGNe8WjOoeoP2RYY8Wq8ljq3/6xi38S2WGz3TzDQwzJhcEuNx0Q3jDaAJj4Rcu/63mpbrA==
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

DMA map kfd_mem_attachments in update_gpuvm_pte. This function is called
with the BO and page tables reserved, so we can safely update the DMA
mapping.

DMA unmap when a BO is unmapped from a GPU and before updating mappings
in restore workers.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 56 ++++++++++---------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 51502a07fc1d..3bb2ae185bbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -964,11 +964,12 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 	return ret;
 }
 
-static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
+static void unmap_bo_from_gpuvm(struct kgd_mem *mem,
 				struct kfd_mem_attachment *entry,
 				struct amdgpu_sync *sync)
 {
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
+	struct amdgpu_device *adev = entry->adev;
 	struct amdgpu_vm *vm = bo_va->base.vm;
 
 	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
@@ -977,15 +978,20 @@ static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
 
 	amdgpu_sync_fence(sync, bo_va->last_pt_update);
 
-	return 0;
+	kfd_mem_dmaunmap_attachment(mem, entry);
 }
 
-static int update_gpuvm_pte(struct amdgpu_device *adev,
-		struct kfd_mem_attachment *entry,
-		struct amdgpu_sync *sync)
+static int update_gpuvm_pte(struct kgd_mem *mem,
+			    struct kfd_mem_attachment *entry,
+			    struct amdgpu_sync *sync)
 {
-	int ret;
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
+	struct amdgpu_device *adev = entry->adev;
+	int ret;
+
+	ret = kfd_mem_dmamap_attachment(mem, entry);
+	if (ret)
+		return ret;
 
 	/* Update the page tables  */
 	ret = amdgpu_vm_bo_update(adev, bo_va, false);
@@ -997,14 +1003,15 @@ static int update_gpuvm_pte(struct amdgpu_device *adev,
 	return amdgpu_sync_fence(sync, bo_va->last_pt_update);
 }
 
-static int map_bo_to_gpuvm(struct amdgpu_device *adev,
-		struct kfd_mem_attachment *entry, struct amdgpu_sync *sync,
-		bool no_update_pte)
+static int map_bo_to_gpuvm(struct kgd_mem *mem,
+			   struct kfd_mem_attachment *entry,
+			   struct amdgpu_sync *sync,
+			   bool no_update_pte)
 {
 	int ret;
 
 	/* Set virtual address for the allocation */
-	ret = amdgpu_vm_bo_map(adev, entry->bo_va, entry->va, 0,
+	ret = amdgpu_vm_bo_map(entry->adev, entry->bo_va, entry->va, 0,
 			       amdgpu_bo_size(entry->bo_va->base.bo),
 			       entry->pte_flags);
 	if (ret) {
@@ -1016,7 +1023,7 @@ static int map_bo_to_gpuvm(struct amdgpu_device *adev,
 	if (no_update_pte)
 		return 0;
 
-	ret = update_gpuvm_pte(adev, entry, sync);
+	ret = update_gpuvm_pte(mem, entry, sync);
 	if (ret) {
 		pr_err("update_gpuvm_pte() failed\n");
 		goto update_gpuvm_pte_failed;
@@ -1025,7 +1032,7 @@ static int map_bo_to_gpuvm(struct amdgpu_device *adev,
 	return 0;
 
 update_gpuvm_pte_failed:
-	unmap_bo_from_gpuvm(adev, entry, sync);
+	unmap_bo_from_gpuvm(mem, entry, sync);
 	return ret;
 }
 
@@ -1633,7 +1640,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
 			 entry->va, entry->va + bo_size, entry);
 
-		ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
+		ret = map_bo_to_gpuvm(mem, entry, ctx.sync,
 				      is_invalid_userptr);
 		if (ret) {
 			pr_err("Failed to map bo to gpuvm\n");
@@ -1672,7 +1679,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
 {
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
 	struct amdkfd_process_info *process_info =
 		((struct amdgpu_vm *)vm)->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
@@ -1707,13 +1713,8 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
 			 entry->va, entry->va + bo_size, entry);
 
-		ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
-		if (ret == 0) {
-			entry->is_mapped = false;
-		} else {
-			pr_err("failed to unmap VA 0x%llx\n", mem->va);
-			goto unreserve_out;
-		}
+		unmap_bo_from_gpuvm(mem, entry, ctx.sync);
+		entry->is_mapped = false;
 
 		mem->mapped_to_gpu_memory--;
 		pr_debug("\t DEC mapping count %d\n",
@@ -2083,9 +2084,8 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 			if (!attachment->is_mapped)
 				continue;
 
-			ret = update_gpuvm_pte((struct amdgpu_device *)
-					       attachment->adev,
-					       attachment, &sync);
+			kfd_mem_dmaunmap_attachment(mem, attachment);
+			ret = update_gpuvm_pte(mem, attachment, &sync);
 			if (ret) {
 				pr_err("%s: update PTE failed\n", __func__);
 				/* make sure this gets validated again */
@@ -2287,9 +2287,11 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 			goto validate_map_fail;
 		}
 		list_for_each_entry(attachment, &mem->attachments, list) {
-			ret = update_gpuvm_pte((struct amdgpu_device *)
-					      attachment->adev, attachment,
-					      &sync_obj);
+			if (!attachment->is_mapped)
+				continue;
+
+			kfd_mem_dmaunmap_attachment(mem, attachment);
+			ret = update_gpuvm_pte(mem, attachment, &sync_obj);
 			if (ret) {
 				pr_debug("Memory eviction: update PTE failed. Try again\n");
 				goto validate_map_fail;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
