Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499C35ED8B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E33D6E8DD;
	Wed, 14 Apr 2021 06:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6BF26E8D6;
 Wed, 14 Apr 2021 06:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKh5ShnohYB6xPenNGPwP8mWI8wVekOhbHYNcJNpu9Z4eIVsEntpyf+xe/j1j7al/+uaUNMjYGE8qwFbiiK1PDstofJb9zQJSz/74sf8XzaxU/HeXg1v0jmKS+GXL/n33a9tC2wpxtOmCfewsTz1cOOEP+CRzS39vhWmeTJs4NJUt3v1RYO0J24NOh0U2SHOPTG+5yG5V74U2vP1j1ltzK58ugbp0wBfcp43apiHIJ9yANEkrVQZseTS82ZOutvfR4N6BqOCuyG58T78hTm81Tr0uOFL/ofZUkZZGK7DozNKuWRlOQFNdt1Sv9ZAxaX2TLet9GU9mYruBUCRYyi+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb8YxsUBmYMVnZl2DgiAN61Zr0J9HEePKeYL5KfZrdQ=;
 b=nNjY+NcRH8k9m4uAeGYHZs+08DY36cvzdWtdbzSh3ipatTDemHMPtBLg/Wo0oUiMPDpwQ4kayurba+4I/mpkn4W+mh4N6UUCeEaMydk4rUIhSuhTdAb7zA9UN3Lfp04Wznp1MXC/jrX+vykUKux36U87aHbUtgPMfkvNwJmwNmgGDAhrm2htgjQXtA52Iiqansg2479M8lWcJdwc9vyzz8onFL4hJkznehg1TsL43tE26s4sksmgLN40YwDCaWuGNE6OzAH5TiKBkKdyUDEAc/eXvLSP67lDY1bk5OoKtDtqC92P3RKZZdbvIPG4m2JfWjPdGY6X0TyPobUq72oaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb8YxsUBmYMVnZl2DgiAN61Zr0J9HEePKeYL5KfZrdQ=;
 b=qbsrCO80mf57CrM3lkmK8PK2czKFmkjDs1NqBdxPZLbmx3lWwJ/q+xzrbEPeyk1anqYhTVBrYdEcb8vOYQPfvs9Sv71kvQ/miOFrZ70bBJ4czDBrV95xQmLRYmkGsqQX39EQsCXrwRdZ4IeRVyWoal244765KJzbK/R0VjDuCQg=
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
Subject: [PATCH 5/9] drm/amdgpu: DMA map/unmap when updating GPU mappings
Date: Wed, 14 Apr 2021 02:48:00 -0400
Message-Id: <20210414064804.29356-6-Felix.Kuehling@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: bd64d84b-ead0-473d-76e0-08d8ff114a7e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41258ADD3739730B5768C29B924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1GExj7Rqh92zne9tm2m/nxE+KG59xx0bWgld1cVBeqTiyXmboIcIGG3m/1Ph6uGqWoT/gi6TYDtzYxFxOVDcp6PF1k+V/HKnwkZfc0SgCSR3uYSRsMyGjL510eGtHYC6RqHsmWcEr7fgUpaRxQvD8eAtTNZBAO9u4x1q2h7NWm8J8FCp0XXKtED0F2nuGUw6IDNmoLkZmHdOlEb/x5+prpGne+imineaPT7vUfBrylT4/wFyEVxOJsAsl3b8rn7I6uYs8YdkUYyJTq6PesbbVM5CacMUDBAw2+UXU5HoHzzGf32SSIDNdnW25GvAbyYtVKPbZkT7t77iV+sMz/TWLbguibjGG1eio52UYnKglcyGGT37nuAa5eEFEIVnWD2ZgyK66STzmmq0PDa0oR9kWyhAihYfzquk4rDbWaR5GBZqLDuIOOKtQ+L/2FoBNOiH1MTYxn6K/1wbIrmgArrH2mzp7hRKfVeWoyYqwolKOKO1hD03l7eREK3NkstifnuK90Ru2LbfgYXEifcjHpr9FDvcUjqirf3947ei3L9hptOEpJBPKpnbGyCGP1W+Oz+6Bcvuro+zJqdH9lEqmGePMUF+K1h0j24ufzftqncKEm4uhwU93ojxT5eWf/9EP0kG+CA1YxlxHxgbBdZY+BS+vcBb00YnApGdzH+1djwCOWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5MUhUT1psH+7wrhsOTTMdcxH9AF64vR9235L4WD04/XRyouZ8+mcTmHxV1r6?=
 =?us-ascii?Q?vj87bCwdTrpHU8k52J7mXH3Fo2qad7v1Lm+0sgyOEUvCN5dSKAoY5KR97P5O?=
 =?us-ascii?Q?Nb9v8USRGZwzx3/WeDNeTSOloP/HJsa4XklCO7Bg5pIuUAJybpuFyh4/37zH?=
 =?us-ascii?Q?6SSFGZuEz/cFRs+LOUYWtLmnu52gFunKoGOZ4ZGtY6CeYO5OAMoSLxwIlnAS?=
 =?us-ascii?Q?XmdZnh6hAa0o/1KAS4XZ79Otwb0FMPEUxV1o6HSoOWKMKQKnyLcOJdoj6c5K?=
 =?us-ascii?Q?LrLe5XDhwk/clVHH5BjvNcHpmRII5NR04mks1JowSC6bUBRnrZAgqxybZxZ9?=
 =?us-ascii?Q?IAxeIsMIA7sCntFw/HsOkxqAmnB3FZpm0YKaUAmTHnRzYE/lv0aFsrMkNgLP?=
 =?us-ascii?Q?UMLyWueqlVnkUw1OX9DxdyYUQ7PecxUQCa99ImpjLuozOExg11xk8U8qO1qt?=
 =?us-ascii?Q?S+92UQzTell4sYO+ZiA2J2RpcGqiArdy7GkoWYVIC5Is5oje9rPc0ue+J1Tm?=
 =?us-ascii?Q?fyvQeHWRfQCwiFKAyI3em3J7of51LO9hiWWRnqEFemNUyKKJypRkc+tfQWIe?=
 =?us-ascii?Q?1gGzqVL/zwXPvwx262fFK/qu+r/c8u7XNCsvXUDT0Arj0TlpzNA238a3Iyk6?=
 =?us-ascii?Q?n9a4NRCjHRChQVOKz+t0NYoqBKlLMcEe3YXQKOQn8xTycPYjBwDUj8oT9ZBG?=
 =?us-ascii?Q?GxHvgpwfLguu6xFmvMF+ShJq7zA1fkbkWmRvgES5nmmSE15/G680idAR4QmN?=
 =?us-ascii?Q?XpaNRUHV+DFlelt+fZFD8xAqDlOaLQxcJvow6R0L9IkIjnvelwGtupCyAzIR?=
 =?us-ascii?Q?ov4j2LuKdZMwtMrXru3cnerhpA85XghKnAknVWR169jjMl1dgVbIZo9ZY4cL?=
 =?us-ascii?Q?e7FCBmK/TA9aZx0gVKpQ83cnEipFbTuvtmmX580ES1uCSvi5+kQxx2KGx7EV?=
 =?us-ascii?Q?ux3LUwo3shPvZoRScsh+68xZZKwGIlcQ5wJc5o5kAP2Y8wXqiRf5FIVcqaCp?=
 =?us-ascii?Q?s8rg9gdWBV4UUFjHAV+ekWNNp9n5BKg+QFs8VKpwsHV3pV4zkmhDEP/CJEyg?=
 =?us-ascii?Q?wmYDd4f88WDueWkwcDcODHmNI6flhl3KVgKXPXsCxMTyokUw8WyY2hpPj2F2?=
 =?us-ascii?Q?x8ey/B7RvMYrcK7USmjeFvJ4DtOQ6I5Y4GMJQaXRWery9PH58rE16aISooni?=
 =?us-ascii?Q?wQp8+LJCDbdK70woTBjl5dQ+88PbDgWcinE/Fu0DUVqt5hTZejAj0sflQgLB?=
 =?us-ascii?Q?7+P1c7U/acCXq7OtdExKtdIYG9Nu0TFKu9aCcMt5yAfVjLryAAGLGVkZYrbU?=
 =?us-ascii?Q?WX4kfhGxoSMWFoiwnhbbmrG3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd64d84b-ead0-473d-76e0-08d8ff114a7e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:20.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzzOFxhsgszkzemYoEXgKzWATeQrJB1r9aL8LUy9pLKBP4UrS9/iMlEokNhuvj/xsOtorBQl5uV+heKtFSeU1Q==
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
