Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F1D35ED78
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0E6E8C1;
	Wed, 14 Apr 2021 06:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D546E8C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeE9iv5Uq4PWlRSh5R+4TDRJUsM+Ndrg5Fx6LQnBlodM3zrl8n8LkHp0RRV3Gc1kWwp9hJj4arJaM4u7S3xabrSC8GvfyFZU6DsrnNK3mPnS68U123ydwB94OpsyDAlUFCzS6zUBsadz7YzS29onTDlTabGuovl3b8h8yzb7I/YmuJClwtWBcEWjsLR1+OONdeXvfIwetScl1U4hMrTaQH5l69ujlt1mOoK2Pp38mgz6t3oc8QKx2RIhgPgGcywaoQ2UqK3utj8BXGW1dCsDB9nv7GTJoc8pwNlbDznct+gZw02NlE3wK9oAtoH3JmRcCRI4kTtnP6uyGwe1HvsX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUTVJD2QQLOcysdAZoVYPo8qqJJSUCAvbgkijjckEI=;
 b=MKN6T+XwbxnemNtCDYb4bcRnOHZL1UgpIJLyBh0t3Ip62Wfa6pwtKN6X5LDf0fBgs5K+w40IRuH01YljdWnwWjcqJbZLYOabcTEN0SQ93+89CPEctiHHCW4JylW4hlTOUyLtuZ0wSxLImUgMr1rGgKUpKltD8KifRw6+j54CVE8EWR6Fbc8HG6BUpMk5uEVTRkSGYbTviy0vsBHezkzVarfqWyXtMWQdnL/x0gOQerhZrNeEE0Z6Nyctkp4DrNWakprrK04fJ+7jZiGRzlvwb/M4uUrtroNa6eSp3GXHIJycsrLYf3CbUzY8BbS1KMK1G0p1BK8Yle4eOWixcjrzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GUTVJD2QQLOcysdAZoVYPo8qqJJSUCAvbgkijjckEI=;
 b=T5/HYvC+MJioym0iUQOZCmqf+my34ZmeYSZAIobwdazy0cv305oVJJXVoUxpxtzW6+BfAh+NP7W/ns6TbqdsSzY3nkgXg+laY8Kuq2EXiuhJEFFcS1uAVzOpBYsUdNq5M+XcBd3p8aw4OInNh0iUyO7sQhbd118PbQGyVIXz/vI=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:46:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/amdgpu: Rename kfd_bo_va_list to kfd_mem_attachment
Date: Wed, 14 Apr 2021 02:46:13 -0400
Message-Id: <20210414064621.29273-2-Felix.Kuehling@amd.com>
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
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c720ca02-ed50-408c-da5e-08d8ff1113f5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125CC17C3672C514CAB5E35924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBN0NPKKxlm3LHQXjcWc5g0VuPsXTfnOiy43BacrxsnkRK5pqfR5FgZW0PwWfUQH/2YsIgFSbetLs+dwGvlACOxA6NbZ1bpxrqNhfcbgmbO1cOa567YXA4R3WLjgJfjH0Jo/5l3Yqym6rpng0PFcu9oho0gaGv88A8yPuXFwHGhmzAcG7UoqEPLuAKwot/EYHU+7w+jr0v7cnw2HqeDW9B1betSbblIU5xq3SqceegxNCaavKHdfDJz7i3XTU3YviJM0Vh0eo/AARx0zsgZLBiZHz7w2L9dQ9asxdz2AQWtVLkUZiL1luEYtUx+lJyy5Z7maVJEd71ZOVRjJjbdAS55Nbfgc6ILmCKRvbBkFRjQztxrV6JR/rTutirZTrVwhOx0gU3SU1y73Qmjfg0SHdr2U1NO//Ut7CTBB5v/LoA56tz6qUFR1OAOAAUHHQFZIQk/ZIjtD+A0m7FDMSng0A/LfKaPdbYpsi81xQSdo9nqRTiiCY24zp2QFjCKAPJtJNYdXElEnDRtlGRjRIoZRBtYChmTg8L/bPRcIwdu1T1IQToT6Wx/l8k7pBag7/uXl2LuMBaNzBWYdVpM3xofiJRcF+8H0J9/DB7myfh8OAOU0/Qkab8yN4K8Q/a9/6W977vHdYKNTDM4MKMNoBlzf7jopQIKw7uuPhtBXIIK9l6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(5660300002)(478600001)(6666004)(316002)(186003)(30864003)(16526019)(66946007)(8676002)(83380400001)(4326008)(6486002)(2906002)(66556008)(52116002)(38350700002)(8936002)(86362001)(7696005)(26005)(66476007)(36756003)(956004)(1076003)(38100700002)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/m78RmUsnsi5y+PHBiFenJmftJePnIyjH446OArGb7pSEsfHDKskC51H/UsP?=
 =?us-ascii?Q?hWS779xdNbWgWjuw23eOiP0Ib7hfEuc5kQLDw2o+z05BDodfqyEIsuSrvhIG?=
 =?us-ascii?Q?smvWM3iE0/Wew6QI7IvgR90EtRCtwftY19gKIMPzDjNWoajP0EvSxaZHhgxF?=
 =?us-ascii?Q?109jRugVkirMTqWPCW2Z1MP7V06CfGqjKoqqv3NIw0JCXr60yHflC8+CvX91?=
 =?us-ascii?Q?hJWI68HIlR7KONcPq+/Bt37KHnndOaOrxhb0sq/Sn7UNq5NV+QyGw8a8nKJ+?=
 =?us-ascii?Q?MXxRYJMsp8DTJl0WV0RM7AmeM0nDjkayOzxN3JtziKzgm81yeTX0HRO7Z0n1?=
 =?us-ascii?Q?BB9KqS0UiFFYouO63XsvTTM4et7WpCvDxhE0ag0Ja+OnDVPEKCDVZ4LcibiJ?=
 =?us-ascii?Q?v1VGNkn+WxQP3UsX9qTae0kXnfq7li1Xa1XGSrHm67LVX3uDdV/3v12lMfcq?=
 =?us-ascii?Q?koia6sy2yBmkREi5F8kk64xEpFOIG58wKo+BIPLBdV78GQe7QmlnOh25c8CT?=
 =?us-ascii?Q?bgcH2TReqqRn2WX5POQ87qEM36TPhk3RVpxmL3nQ5QJ9cXhIqaEr2nHKifeH?=
 =?us-ascii?Q?5EHzHa9rS8CM27LW9bWcBEUmp9wz/tU0zOSzQdVMxiwE3P1lmjnZ6JAH3I2y?=
 =?us-ascii?Q?pI/De7GErz7v2FEBHPsdlaqt9TtuXr+TpWe20puzieZXhEt975ZtvKHJRm7f?=
 =?us-ascii?Q?a+qDYqxO73NWZktkhsXxbRmvk2LQOfukc7ihhJr/ggy1n0Vs4w75gs9v9h+S?=
 =?us-ascii?Q?28+DAdxxdyvRv/crWpMdSSP8XhFD2vOndaeEgAcARf4VfcVgoqPHEReFa8p0?=
 =?us-ascii?Q?3y8qLCruv3OyS7mjwTWs4827f60hmwD9Y2dg7hsm6uaaNCjONIKmB/cxygk7?=
 =?us-ascii?Q?vRmmf6eqZr4VF9SDUpOQmiNM9cxyiGPBANKoNymQLBZaUSOnoewcIjQfptvH?=
 =?us-ascii?Q?BmcIAEJQnGQuCyuo0gMLhL/tQgrxiEg3CgRJb05nBxwcHV+QE/Fb5PnPDc/d?=
 =?us-ascii?Q?LJGgITyC8tiLt8c6n90NNMR31Ji/odmfv0eIHSEmt8M7P7O67VKF+FJ5WuuU?=
 =?us-ascii?Q?vnH+xiyxz7qNndCba+eDYkQqmgFCd4LYcLW8K4VCC3F507dXY7pscwRnXC2K?=
 =?us-ascii?Q?V4ZRfxR5VobeXkwIrxWqG8clXDodJ6tW1sJ1NbRKlocujjM4+NdGgdkhZ+lm?=
 =?us-ascii?Q?4Lyjp5he1nDJzayt0T3yEd0FzsrQP4QrS6thYeOsLKMUh+RTRUDfHZ94cPei?=
 =?us-ascii?Q?j+l4o3JhMfbciufMAtLnS0yRAT8E690TconC0G3rPLR4PPvUGLxPP7Fv7T1S?=
 =?us-ascii?Q?YdOaj0031FnypPNps83mi3zw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c720ca02-ed50-408c-da5e-08d8ff1113f5
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:48.8645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPfpi+tr1UZKGEuLNKteko/yarzBRBU3Nn21k7Jhog+esK3uVyPygJ5kPQlWDrVUwEugHV4vbTIXmUI5Aakr3Q==
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
