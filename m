Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCFC35ED8A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD1E6E8DE;
	Wed, 14 Apr 2021 06:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2157A6E8D0;
 Wed, 14 Apr 2021 06:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyjgpyffqfzoYKDm8wjeju/KbSUvMHDRxZTvoY9wI1l0hmdgVVAy/cFdD6hx+qA5FdGN0vBsZiN8uAKILkJeUKH5dHlZSfZGSmj6bm6S/D40qbG15ySry4SySNZ8wAyjP4+KsLF8md3ynTOgg2TwEFwTXSe8HYmmkiBosiTyNXnxscGt/RRfRfofziiv8WVVGVUs4n3dZizWj7xg30P74gQp2iIl65+ZS6lOzlLDFN4d1jDpi/WjTK3uXmvRHz+dt5+XYaYujxORteMFx3E+Yi6zycaxkEzo6K3y1KCUuStisKRlF49Trj+8FdThFe5+toFI9WcL34ZXQCDgaj58wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUTVJD2QQLOcysdAZoVYPo8qqJJSUCAvbgkijjckEI=;
 b=ERLRdHzWpNpCmZ8UuKXG+4I/6DXGeeBgEmPRdkYw3I1aEotLfvMZ2c+8vZlduAsFFfDQxenrT9WiaFT0i0xf3uJx8RseTp+zJFHPbxlNo/DoiLZvakmz0qN9uNxnWVZpNEMm5lOKka+KRh6qatHypLsHJJU2FXWg601Npoj0tpDXtbbH7XQvQnXD3+kdj6FwCxGKTgjIzg6HQf3MkK1ZO2T7TGTlBqjNyyGUt5Hxn+SSeTMNu302/pOefBdJ7ToNLUVEtVpmUxhzPn4DbPoEypq4w3qLBdxsllmYkHkhNPjbVc1+Qh4jCXJWeEtOyMj8znMzHtWJmKnvK984TKxFPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUTVJD2QQLOcysdAZoVYPo8qqJJSUCAvbgkijjckEI=;
 b=m5iiE0YWY2URU2BFkVn/R4F9hUKQcol/dJfTuruwXcjejMcynMH7/khyYWDGFbjQXDNU5+ps04vdoAYKihqsk2ZCs5x5hnfqoJkIdsD8hmXtOmnexuSuDzcrE5f4KJtp0pttlFLkqPO9KK3z/9Nrfh2NFsxuCiVsoORfnHNokdI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
Date: Wed, 14 Apr 2021 02:47:56 -0400
Message-Id: <20210414064804.29356-2-Felix.Kuehling@amd.com>
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
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93dcbb30-e949-4cca-aa94-08d8ff114975
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125878C14E4C65445B5B38B924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aGqvQrBI4oDhRuxxhZvLLOQ1J6FoDKSn3Gg4/hprhUE4TY/MP3yIySAToUPRtuwdY1EkSMNAzGejqZWD7qUr/1nb3A7lz9wz8AUoodzQJ8s5yXHMUBHNZNYRZtFOgb001qrpwbBf1ieuQKcK/cQDJgu79zgE8VR8xmUbxDb4S1o1qsLfLFqSoouqoccxWpucMOqtFo1prNqUCLffbRPMMJXaVo2eEvEkWDpJaxE/nwdVUzMFkg7Sye9EleoQt04Zlhs4W3T/TiA4o1JOmI+jP/LTt3CzsflD38zpX8RwtEKjv16hEEmCb9vwxB/2aw7/1R8jdrainQ/5UabUA3a/uCeqW8IyYjTyGQl5/Cr52z/Ax+SJeCGcYT8KFtWTCZ6IJ/OYeiH1p+FbKApV6ymitVQF3OQj0TpnRDiVkf1uNqYFZz3mUKMd1SUnq4K6j21Hr1ejXa1EwK9ZnGFjOeYCAZ15IMu3f8f1F8ouOGStniHNoo116WwIIr2tEtjK9tgks4MkcCyQdCrFsjFZKN/0L9NKQ6fh0bpNSod4oyo4M+/hltqhdfMe6tpKGfNYS7pb6IhWMruWeudvPrZOofH20JIjzGmyPxrMH3xS42AVgO/x9xvkMYtIrT3w/0HXjAUZB6k/7PNAClCBeefr3RK3G5Pa8jyh5zX/AsPHeAgpus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(30864003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HXoCLqBg8TGFsyURicvynHeJJSDfOpOzo1sGW2kcw8MqNaK/nkZJY1vmABYl?=
 =?us-ascii?Q?LQSiwBIdJCUzyXxs5UHcItgMbJJoYHtQke5woOyy8Krz910c91h51VkkypIf?=
 =?us-ascii?Q?1mK/U7dNFCGt+4ZsAUNr/XwMki4V7thVZDgkkMXaj2j2JfHrwXiIQeGvd/SB?=
 =?us-ascii?Q?h2nBZmMbONkxcv0KTnhqzY1ZM1ps+GgXraRiqvVeDjbPjVouQ7PelE/wjqUk?=
 =?us-ascii?Q?cl8YqztT33C9pjpvFqvfgiyM+k1WyI3LHSo1Ugn3yp00zFS7ACzqmgMxv6N2?=
 =?us-ascii?Q?6e87XoCz8Wdz8T397aFiiU46L29K1FSE6EmuJBMZ24l683ug/FZ9E3CWshOD?=
 =?us-ascii?Q?O1yKUK+Z4y73JBzyZb1mrjoMkRD3KrECZdM+XGiUFDghDfRdYjj7ViCLh2Cs?=
 =?us-ascii?Q?kgvCSxmQaMDxr1I7DokU/EJMOy9vUHbPdCp075hU0ugjPP2BdQ+NY1lG62/1?=
 =?us-ascii?Q?CwXuNvx1cTKZCRDEjx5Z9VpJd8PktfFqU8md6fxsm8lIYzhLC71ylYjC5ALU?=
 =?us-ascii?Q?ODNvQ0sEojT/gf0NQ9pXGFmoBIfX6Ga803IBErxK1cgpWND6QJkDhVmNYEwk?=
 =?us-ascii?Q?5IWL+/OF6Q7fPPzTzKuleZvnDMYOo6ijOGAQfgcPiBNt8YlQtgPNyXnN+tE6?=
 =?us-ascii?Q?ib1mNSPsnhxlVNvCWUO69wfyVOOMT/+UxQ6NIGXo/jMuIy2t0suvjZuP4+TA?=
 =?us-ascii?Q?5yc20gLKydVPzrJ5VZjdFAxtWN9+tIpItv8LV7dZyczWVk2hVLR3hNX++hBa?=
 =?us-ascii?Q?xobWWI8expEVmFw3EOPG6wByIZhCpu8hnQZ0wQmFmqcv8jQH8y9lNeIoz9W9?=
 =?us-ascii?Q?RXXHXUZphKRzoGQWsMPvALKpjTkB9u5Xs7rHl6KNy7io67o0SWUeQrjeX1wB?=
 =?us-ascii?Q?RR8bGwgfvqSymqraEZ6XO1Mtjb/iClH35ymT2XvqCRLA9rEO6yiv9yApDjzq?=
 =?us-ascii?Q?VBuWvBgqS7M9jpLzcEv4TBTHThAoYZGMR5IZWIlTSE0pVTS8p6HvmokefgP7?=
 =?us-ascii?Q?G+vFCX7OwM+zmuNRgRYbmemw8Y1SaLnd3fxBRuNObyE+T2HkiLJZVe+e04a7?=
 =?us-ascii?Q?4gJPw3aHJ929v3aLebmeDcE3oUdmIC7r+Auq/bgXCefR+eFSnRlLugaEZOTa?=
 =?us-ascii?Q?Lx4sM0Yt4g/VY1BUvauKt9FG4kp1aTOzivTN8dJwUJWsh6QNip8pGtXh9iTm?=
 =?us-ascii?Q?S3DdeOXk8J2IOT3P2dGVOvglqrnArM6I5x6nr/kj+mCWE80CH567QakLX2m5?=
 =?us-ascii?Q?RBp6WlCnkkKHT0sS+3jQmv+uqU3SKbO3ahj696TIlVXwV5IrkQNjqAvm8gGz?=
 =?us-ascii?Q?ULO97is1FwXF2FQGNlZhJqzO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dcbb30-e949-4cca-aa94-08d8ff114975
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:18.6353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19U2s/sNQfI30rupw+PwmSKqwz3LX0jdxSTYg0HKP69RHtz6b6h+PGm8qUHK7DO+KEsJpADODGfTMnt/2E5HBg==
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

This name is more fitting, especially for the changes coming next to
support multi-GPU systems with proper DMA mappings. Cleaned up the code
and renamed some related functions and variables to improve readability.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   8 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 209 +++++++++---------
 2 files changed, 104 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..910c50956e16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -38,10 +38,10 @@ extern uint64_t amdgpu_amdkfd_total_mem_size;
 
 struct amdgpu_device;
 
-struct kfd_bo_va_list {
-	struct list_head bo_list;
+struct kfd_mem_attachment {
+	struct list_head list;
 	struct amdgpu_bo_va *bo_va;
-	void *kgd_dev;
+	struct amdgpu_device *adev;
 	bool is_mapped;
 	uint64_t va;
 	uint64_t pte_flags;
@@ -50,7 +50,7 @@ struct kfd_bo_va_list {
 struct kgd_mem {
 	struct mutex lock;
 	struct amdgpu_bo *bo;
-	struct list_head bo_va_list;
+	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
 	struct ttm_validate_buffer validate_list;
 	struct ttm_validate_buffer resv_list;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6622695a5eed..d021152314ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -75,16 +75,16 @@ static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)
 	return (struct amdgpu_device *)kgd;
 }
 
-static bool check_if_add_bo_to_vm(struct amdgpu_vm *avm,
+static bool kfd_mem_is_attached(struct amdgpu_vm *avm,
 		struct kgd_mem *mem)
 {
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list)
+	list_for_each_entry(entry, &mem->attachments, list)
 		if (entry->bo_va->base.vm == avm)
-			return false;
+			return true;
 
-	return true;
+	return false;
 }
 
 /* Set memory usage limits. Current, limits are
@@ -471,7 +471,7 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
 	return pte_flags;
 }
 
-/* add_bo_to_vm - Add a BO to a VM
+/* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added
  * to a VM. It can later be mapped and unmapped many times without
@@ -483,15 +483,14 @@ static uint64_t get_pte_flags(struct amdgpu_device *adev, struct kgd_mem *mem)
  * 4. Alloc page tables and directories if needed
  * 4a.  Validate new page tables and directories
  */
-static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
+static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql,
-		struct kfd_bo_va_list **p_bo_va_entry)
+		struct kfd_mem_attachment **p_attachment)
 {
 	int ret;
-	struct kfd_bo_va_list *bo_va_entry;
+	struct kfd_mem_attachment *attachment;
 	struct amdgpu_bo *bo = mem->bo;
 	uint64_t va = mem->va;
-	struct list_head *list_bo_va = &mem->bo_va_list;
 	unsigned long bo_size = bo->tbo.base.size;
 
 	if (!va) {
@@ -502,29 +501,29 @@ static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
 	if (is_aql)
 		va += bo_size;
 
-	bo_va_entry = kzalloc(sizeof(*bo_va_entry), GFP_KERNEL);
-	if (!bo_va_entry)
+	attachment = kzalloc(sizeof(*attachment), GFP_KERNEL);
+	if (!attachment)
 		return -ENOMEM;
 
 	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			va + bo_size, vm);
 
 	/* Add BO to VM internal data structures*/
-	bo_va_entry->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
-	if (!bo_va_entry->bo_va) {
+	attachment->bo_va = amdgpu_vm_bo_add(adev, vm, bo);
+	if (!attachment->bo_va) {
 		ret = -EINVAL;
 		pr_err("Failed to add BO object to VM. ret == %d\n",
 				ret);
 		goto err_vmadd;
 	}
 
-	bo_va_entry->va = va;
-	bo_va_entry->pte_flags = get_pte_flags(adev, mem);
-	bo_va_entry->kgd_dev = (void *)adev;
-	list_add(&bo_va_entry->bo_list, list_bo_va);
+	attachment->va = va;
+	attachment->pte_flags = get_pte_flags(adev, mem);
+	attachment->adev = adev;
+	list_add(&attachment->list, &mem->attachments);
 
-	if (p_bo_va_entry)
-		*p_bo_va_entry = bo_va_entry;
+	if (p_attachment)
+		*p_attachment = attachment;
 
 	/* Allocate validate page tables if needed */
 	ret = vm_validate_pt_pd_bos(vm);
@@ -536,22 +535,20 @@ static int add_bo_to_vm(struct amdgpu_device *adev, struct kgd_mem *mem,
 	return 0;
 
 err_alloc_pts:
-	amdgpu_vm_bo_rmv(adev, bo_va_entry->bo_va);
-	list_del(&bo_va_entry->bo_list);
+	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
+	list_del(&attachment->list);
 err_vmadd:
-	kfree(bo_va_entry);
+	kfree(attachment);
 	return ret;
 }
 
-static void remove_bo_from_vm(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry, unsigned long size)
+static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
 {
-	pr_debug("\t remove VA 0x%llx - 0x%llx in entry %p\n",
-			entry->va,
-			entry->va + size, entry);
-	amdgpu_vm_bo_rmv(adev, entry->bo_va);
-	list_del(&entry->bo_list);
-	kfree(entry);
+	pr_debug("\t remove VA 0x%llx in entry %p\n",
+			attachment->va, attachment);
+	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	list_del(&attachment->list);
+	kfree(attachment);
 }
 
 static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
@@ -726,7 +723,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 				struct bo_vm_reservation_context *ctx)
 {
 	struct amdgpu_bo *bo = mem->bo;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	unsigned int i;
 	int ret;
 
@@ -738,7 +735,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	INIT_LIST_HEAD(&ctx->list);
 	INIT_LIST_HEAD(&ctx->duplicates);
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
+	list_for_each_entry(entry, &mem->attachments, list) {
 		if ((vm && vm != entry->bo_va->base.vm) ||
 			(entry->is_mapped != map_type
 			&& map_type != BO_VM_ALL))
@@ -760,7 +757,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	i = 0;
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
+	list_for_each_entry(entry, &mem->attachments, list) {
 		if ((vm && vm != entry->bo_va->base.vm) ||
 			(entry->is_mapped != map_type
 			&& map_type != BO_VM_ALL))
@@ -815,7 +812,7 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 }
 
 static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
-				struct kfd_bo_va_list *entry,
+				struct kfd_mem_attachment *entry,
 				struct amdgpu_sync *sync)
 {
 	struct amdgpu_bo_va *bo_va = entry->bo_va;
@@ -831,7 +828,7 @@ static int unmap_bo_from_gpuvm(struct amdgpu_device *adev,
 }
 
 static int update_gpuvm_pte(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry,
+		struct kfd_mem_attachment *entry,
 		struct amdgpu_sync *sync)
 {
 	int ret;
@@ -848,7 +845,7 @@ static int update_gpuvm_pte(struct amdgpu_device *adev,
 }
 
 static int map_bo_to_gpuvm(struct amdgpu_device *adev,
-		struct kfd_bo_va_list *entry, struct amdgpu_sync *sync,
+		struct kfd_mem_attachment *entry, struct amdgpu_sync *sync,
 		bool no_update_pte)
 {
 	int ret;
@@ -1235,7 +1232,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		ret = -ENOMEM;
 		goto err;
 	}
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	mutex_init(&(*mem)->lock);
 	(*mem)->aql_queue = !!(flags & KFD_IOC_ALLOC_MEM_FLAGS_AQL_QUEUE_MEM);
 
@@ -1316,7 +1313,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 {
 	struct amdkfd_process_info *process_info = mem->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
-	struct kfd_bo_va_list *entry, *tmp;
+	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
 	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
@@ -1360,9 +1357,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		mem->va + bo_size * (1 + mem->aql_queue));
 
 	/* Remove from VM internal data structures */
-	list_for_each_entry_safe(entry, tmp, &mem->bo_va_list, bo_list)
-		remove_bo_from_vm((struct amdgpu_device *)entry->kgd_dev,
-				entry, bo_size);
+	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
+		kfd_mem_detach(entry);
 
 	ret = unreserve_bo_and_vms(&ctx, false, false);
 
@@ -1404,10 +1400,10 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	int ret;
 	struct amdgpu_bo *bo;
 	uint32_t domain;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
-	struct kfd_bo_va_list *bo_va_entry = NULL;
-	struct kfd_bo_va_list *bo_va_entry_aql = NULL;
+	struct kfd_mem_attachment *attachment = NULL;
+	struct kfd_mem_attachment *attachment_aql = NULL;
 	unsigned long bo_size;
 	bool is_invalid_userptr = false;
 
@@ -1456,21 +1452,20 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	    bo->tbo.mem.mem_type == TTM_PL_SYSTEM)
 		is_invalid_userptr = true;
 
-	if (check_if_add_bo_to_vm(avm, mem)) {
-		ret = add_bo_to_vm(adev, mem, avm, false,
-				&bo_va_entry);
+	if (!kfd_mem_is_attached(avm, mem)) {
+		ret = kfd_mem_attach(adev, mem, avm, false, &attachment);
 		if (ret)
-			goto add_bo_to_vm_failed;
+			goto attach_failed;
 		if (mem->aql_queue) {
-			ret = add_bo_to_vm(adev, mem, avm,
-					true, &bo_va_entry_aql);
+			ret = kfd_mem_attach(adev, mem, avm, true,
+					     &attachment_aql);
 			if (ret)
-				goto add_bo_to_vm_failed_aql;
+				goto attach_failed_aql;
 		}
 	} else {
 		ret = vm_validate_pt_pd_bos(avm);
 		if (unlikely(ret))
-			goto add_bo_to_vm_failed;
+			goto attach_failed;
 	}
 
 	if (mem->mapped_to_gpu_memory == 0 &&
@@ -1486,30 +1481,30 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		}
 	}
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && !entry->is_mapped) {
-			pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
-					entry->va, entry->va + bo_size,
-					entry);
+	list_for_each_entry(entry, &mem->attachments, list) {
+		if (entry->bo_va->base.vm != vm || entry->is_mapped)
+			continue;
 
-			ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
-					      is_invalid_userptr);
-			if (ret) {
-				pr_err("Failed to map bo to gpuvm\n");
-				goto map_bo_to_gpuvm_failed;
-			}
+		pr_debug("\t map VA 0x%llx - 0x%llx in entry %p\n",
+			 entry->va, entry->va + bo_size, entry);
 
-			ret = vm_update_pds(vm, ctx.sync);
-			if (ret) {
-				pr_err("Failed to update page directories\n");
-				goto map_bo_to_gpuvm_failed;
-			}
+		ret = map_bo_to_gpuvm(adev, entry, ctx.sync,
+				      is_invalid_userptr);
+		if (ret) {
+			pr_err("Failed to map bo to gpuvm\n");
+			goto map_bo_to_gpuvm_failed;
+		}
 
-			entry->is_mapped = true;
-			mem->mapped_to_gpu_memory++;
-			pr_debug("\t INC mapping count %d\n",
-					mem->mapped_to_gpu_memory);
+		ret = vm_update_pds(vm, ctx.sync);
+		if (ret) {
+			pr_err("Failed to update page directories\n");
+			goto map_bo_to_gpuvm_failed;
 		}
+
+		entry->is_mapped = true;
+		mem->mapped_to_gpu_memory++;
+		pr_debug("\t INC mapping count %d\n",
+			 mem->mapped_to_gpu_memory);
 	}
 
 	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
@@ -1521,12 +1516,12 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	goto out;
 
 map_bo_to_gpuvm_failed:
-	if (bo_va_entry_aql)
-		remove_bo_from_vm(adev, bo_va_entry_aql, bo_size);
-add_bo_to_vm_failed_aql:
-	if (bo_va_entry)
-		remove_bo_from_vm(adev, bo_va_entry, bo_size);
-add_bo_to_vm_failed:
+	if (attachment_aql)
+		kfd_mem_detach(attachment_aql);
+attach_failed_aql:
+	if (attachment)
+		kfd_mem_detach(attachment);
+attach_failed:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
 	mutex_unlock(&mem->process_info->lock);
@@ -1541,7 +1536,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 	struct amdkfd_process_info *process_info =
 		((struct amdgpu_vm *)vm)->process_info;
 	unsigned long bo_size = mem->bo->tbo.base.size;
-	struct kfd_bo_va_list *entry;
+	struct kfd_mem_attachment *entry;
 	struct bo_vm_reservation_context ctx;
 	int ret;
 
@@ -1565,26 +1560,24 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		mem->va + bo_size * (1 + mem->aql_queue),
 		vm);
 
-	list_for_each_entry(entry, &mem->bo_va_list, bo_list) {
-		if (entry->bo_va->base.vm == vm && entry->is_mapped) {
-			pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
-					entry->va,
-					entry->va + bo_size,
-					entry);
+	list_for_each_entry(entry, &mem->attachments, list) {
+		if (entry->bo_va->base.vm != vm || !entry->is_mapped)
+			continue;
 
-			ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
-			if (ret == 0) {
-				entry->is_mapped = false;
-			} else {
-				pr_err("failed to unmap VA 0x%llx\n",
-						mem->va);
-				goto unreserve_out;
-			}
+		pr_debug("\t unmap VA 0x%llx - 0x%llx from entry %p\n",
+			 entry->va, entry->va + bo_size, entry);
 
-			mem->mapped_to_gpu_memory--;
-			pr_debug("\t DEC mapping count %d\n",
-					mem->mapped_to_gpu_memory);
+		ret = unmap_bo_from_gpuvm(adev, entry, ctx.sync);
+		if (ret == 0) {
+			entry->is_mapped = false;
+		} else {
+			pr_err("failed to unmap VA 0x%llx\n", mem->va);
+			goto unreserve_out;
 		}
+
+		mem->mapped_to_gpu_memory--;
+		pr_debug("\t DEC mapping count %d\n",
+			 mem->mapped_to_gpu_memory);
 	}
 
 	/* If BO is unmapped from all VMs, unfence it. It can be evicted if
@@ -1726,7 +1719,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	if (mmap_offset)
 		*mmap_offset = amdgpu_bo_mmap_offset(bo);
 
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	mutex_init(&(*mem)->lock);
 
 	(*mem)->alloc_flags =
@@ -1923,7 +1916,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
 				 validate_list.head) {
-		struct kfd_bo_va_list *bo_va_entry;
+		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
 
@@ -1946,13 +1939,13 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 		 * VM faults if the GPU tries to access the invalid
 		 * memory.
 		 */
-		list_for_each_entry(bo_va_entry, &mem->bo_va_list, bo_list) {
-			if (!bo_va_entry->is_mapped)
+		list_for_each_entry(attachment, &mem->attachments, list) {
+			if (!attachment->is_mapped)
 				continue;
 
 			ret = update_gpuvm_pte((struct amdgpu_device *)
-					       bo_va_entry->kgd_dev,
-					       bo_va_entry, &sync);
+					       attachment->adev,
+					       attachment, &sync);
 			if (ret) {
 				pr_err("%s: update PTE failed\n", __func__);
 				/* make sure this gets validated again */
@@ -2133,7 +2126,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
-		struct kfd_bo_va_list *bo_va_entry;
+		struct kfd_mem_attachment *attachment;
 
 		total_size += amdgpu_bo_size(bo);
 
@@ -2153,11 +2146,9 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 			pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
 			goto validate_map_fail;
 		}
-		list_for_each_entry(bo_va_entry, &mem->bo_va_list,
-				    bo_list) {
+		list_for_each_entry(attachment, &mem->attachments, list) {
 			ret = update_gpuvm_pte((struct amdgpu_device *)
-					      bo_va_entry->kgd_dev,
-					      bo_va_entry,
+					      attachment->adev, attachment,
 					      &sync_obj);
 			if (ret) {
 				pr_debug("Memory eviction: update PTE failed. Try again\n");
@@ -2232,7 +2223,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void *gws, struct kgd_mem **mem
 		return -ENOMEM;
 
 	mutex_init(&(*mem)->lock);
-	INIT_LIST_HEAD(&(*mem)->bo_va_list);
+	INIT_LIST_HEAD(&(*mem)->attachments);
 	(*mem)->bo = amdgpu_bo_ref(gws_bo);
 	(*mem)->domain = AMDGPU_GEM_DOMAIN_GWS;
 	(*mem)->process_info = process_info;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
