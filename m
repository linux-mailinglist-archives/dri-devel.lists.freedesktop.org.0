Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AAB2EC8C7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048E76E44E;
	Thu,  7 Jan 2021 03:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076C16E3E3;
 Thu,  7 Jan 2021 03:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEHG0nA9pCLUJ/zJIkUOkGSmjAjtApAa99tizfq+MyNJrZu48FGL/PbuxcB8Ran3TeFU9nVMLTxrLc3zbF0MKxPlvcC5jxjLf+0TD30gI5Nfu+0kCVtg7g9Hf2PUMoehQ+Q7tvaKuAi5zFqR7F0Cvp+9y9pfieYInBVy8x2nJsBGXDOGI6zRu3C2QIT/8kxxhRmcz5bxY40MXeW/0NU0IlVKfOIko/c7p1/43ubpkkYjm9yUvRrCWc9VL58JVEbYN9W7T+YkeTtvUZkT8VDU1RDCNpAn3wN3pw5NYsxisDVdjmO85DJuPLFiKYLFCSzWf4ovvFHzZMqVApNT1ZaPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib0xZeJSl/RN93o6HT5ObsWxcTnaAbPNXIQx+81/zz8=;
 b=G9BZYAMGVgxxT5aFJNXKsq3q+ltjAc0H/sKZB/XSvQqnr53sgpFyqNgbgOMjhuORxDxLm6J/7UGr0aqNkwpE8ajr2raY+0H7R0qldD+qMWQlosOcATGE+7omjabdor4LYcloIPJ6oAg9FuPnULYkrH06sdNGSsMuH2Q2xz+7wgCoS0jo3t5J+wBxo2RKOvIvG6jVItKiWb9vyz8UQYfiCmpCjSqCdsJRFqhOnTxe+3LdUPoOhJuz4enaVUJIog6niu65ULIIwRk9rdkU/ytJK2TyVzwHefPcldKJmzYCHztEYZjkyyFqnECAi3TKhSTXDj3aGhxxJPAgtSiuzpApFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib0xZeJSl/RN93o6HT5ObsWxcTnaAbPNXIQx+81/zz8=;
 b=3QJMzMYehmDWEWm6/ZqfmnM9dwiOqvl5z35E4Zbey902DALKW3wIShziP5uGewzTz6h6O2ud1itdBSHRPYMTT0dYsaZ6Z1oQD7bzSGcCZhaQeJXvA7dzIdPMoQu/onNnR0CXIKKS9ae9fkUwG9GUh4IOLFdLM6vuvYrkGfcIxeE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 03:03:37 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:03:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 35/35] drm/amdkfd: multiple gpu migrate vram to vram
Date: Wed,  6 Jan 2021 22:01:27 -0500
Message-Id: <20210107030127.20393-36-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:03:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c695c525-8401-4b4f-65b8-08d8b2b8d421
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB44080E3E70F270FCAB7EF34192AF0@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2mN+SX2EDjOqnHGw6etYHwGq6pPqyO4D2M9HfPf7r6KFHYlrzwANv9uHFdalb5/zAm0BM9evlhIuMYYFVdOAxUfXZSWvIuMVDjFFglkQsSIElwdH+e6MJhZVMzy/xy8zLn4XU07CnLVYcvscZ9x23h2szxYpYlZswa5Ib6VNr/hm8UoOwEBU9hhMI/8BaT7pjYc1pTgZgJmVJ0bzm0XK6UBg51HSC2qqB+yLWB/fqmdprqlod+1tVGDup7Yb7RAQJt+D7WlKreuTju4dI0pw37vmb2JHHin0UUItP054eu9k8dcpA/dOc9MNQAT/jkA7kb/Lk8HtgLijb8Pvc2klJiOzw9ukyO4EcoQ1ODS6PqUDNzBScJ4JagroUz4b9hufmbGfQ1dfdZjJnIzillbzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(8676002)(2906002)(86362001)(450100002)(66556008)(4326008)(66476007)(8936002)(5660300002)(66946007)(1076003)(6486002)(83380400001)(52116002)(316002)(7696005)(2616005)(36756003)(16526019)(956004)(478600001)(26005)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TwPDo9HpWzoERtwT2wIdVeYRFQTQ1KCg0vfP94ftakaY55Wkm6v0xMfHDRI3?=
 =?us-ascii?Q?iuJo2NaVC/IvT1HqAHd8O4f7GLuwd5XT4VrvHUXBGVVf9G2uyq/HZAZRtELq?=
 =?us-ascii?Q?apEoPTD60ZviygECkuxF+LjmzwAQCkmTCqlZAwBxS9BUGg4hwZ/8WBXJni2L?=
 =?us-ascii?Q?okNdiNCuAgAheLMA8qvfVsOM4bWS5abfPOKDOgqrQZe8Tee069Xdh07sJoo9?=
 =?us-ascii?Q?EX/0Vddtiq0ATsA4iijb4UEedFtX4i0TPKxvxIqGvxhrTkhKUDNYbfDSFN1J?=
 =?us-ascii?Q?VSI2FQ9oBKgbBLcwsHH29jpuFc/p3g9s8OAf3pYXU83yz7B1oARUlYlyVmUt?=
 =?us-ascii?Q?CoSBa4l0LzvwQ/XHwhyGpieTXldPLKLbS4ItzTqKkIV/oOoEyoIYo7vg4I09?=
 =?us-ascii?Q?YZ9LxL7efwSrMnW9sL0x2VB8YFP2Tx7pR7lSbyPA3ARFdVI94tVNlPFTp2a3?=
 =?us-ascii?Q?yVV0J2pcHrQ3wQGMdqjDaNA3yWsRIQ+ot4RLymG4X32Iqn4bj51u/E00GeNG?=
 =?us-ascii?Q?0G2GRNPMI9dspJKcXZoAroZl+cDgu8di5HvMEfyY7zPcVGC+H0KTPRvmp1QQ?=
 =?us-ascii?Q?BMiI1poiGldJJTloh1a+meX1wUmolUPYkmvLtdP/e5eK8jn9ubga/L9O9qzZ?=
 =?us-ascii?Q?tVr0DJMTtc0yJIGMMhr6m/cRV5jDghMHXKU4lAlpNqhXqgFttK0lVul0/6Th?=
 =?us-ascii?Q?j8aHG3UGTfk+Q3+l3ir6mpo6UZHCLE7Aro+VBpwW/kT4ieOlEmlsTV15THAQ?=
 =?us-ascii?Q?xktB0Z+SW5e0bSMRelbeGWYA+VjehU5j8SFpQ3MIXctsH5Y7p9kMypx7d1Jk?=
 =?us-ascii?Q?N9+OW2JpGBlo1ZZFatPaYxhoaNwAdBDki0QDRhkzvz8+CSxHtzkzxcvNGbMI?=
 =?us-ascii?Q?wca2HGVGK7dSblMdda04LMt0npDXgdaCk02I+V9WmaU5XpbmDOMC6qmtM/6F?=
 =?us-ascii?Q?1Xnb4chUz8h17it++g7oQCkIrciVpfHHNSPoNrI5FjZ67EqI1hnokLyTEGpw?=
 =?us-ascii?Q?0pbX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:03:08.0526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c695c525-8401-4b4f-65b8-08d8b2b8d421
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dy9gAb3Xnh9TLI7XAzOsEiYCQqSdkDEb6sJqmsrLtUCmjovftTmvF/BJov+OEYS29vKhAtXQ2XYO/SAyPOtC5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

If prefetch range to gpu with acutal location is another gpu, or GPU
retry fault restore pages to migrate the range with acutal location is
gpu, then migrate from one gpu to another gpu.

Use system memory as bridge because sdma engine may not able to access
another gpu vram, use sdma of source gpu to migrate to system memory,
then use sdma of destination gpu to migrate from system memory to gpu.

Print out gpuid or gpuidx in debug messages.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 57 +++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 70 +++++++++++++++++-------
 3 files changed, 103 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 2095417c7846..6c644472cead 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -449,8 +449,9 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
  * Return:
  * 0 - OK, otherwise error code
  */
-int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
-			    struct mm_struct *mm)
+static int
+svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			struct mm_struct *mm)
 {
 	unsigned long addr, start, end;
 	struct vm_area_struct *vma;
@@ -470,8 +471,8 @@ int svm_migrate_ram_to_vram(struct svm_range *prange, uint32_t best_loc,
 		return -ENODEV;
 	}
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
-		 prange->it_node.start, prange->it_node.last);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] to gpu 0x%x\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last, best_loc);
 
 	start = prange->it_node.start << PAGE_SHIFT;
 	end = (prange->it_node.last + 1) << PAGE_SHIFT;
@@ -668,8 +669,9 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
 		return -ENODEV;
 	}
 
-	pr_debug("svms 0x%p [0x%lx 0x%lx]\n", prange->svms,
-		 prange->it_node.start, prange->it_node.last);
+	pr_debug("svms 0x%p [0x%lx 0x%lx] from gpu 0x%x to ram\n", prange->svms,
+		 prange->it_node.start, prange->it_node.last,
+		 prange->actual_loc);
 
 	start = prange->it_node.start << PAGE_SHIFT;
 	end = (prange->it_node.last + 1) << PAGE_SHIFT;
@@ -696,6 +698,49 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm)
 	return r;
 }
 
+/**
+ * svm_migrate_vram_to_vram - migrate svm range from device to device
+ * @prange: range structure
+ * @best_loc: the device to migrate to
+ * @mm: process mm, use current->mm if NULL
+ *
+ * Context: Process context, caller hold mm->mmap_sem and prange->lock and take
+ *          svms srcu read lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
+ */
+static int
+svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
+			 struct mm_struct *mm)
+{
+	int r;
+
+	/*
+	 * TODO: for both devices with PCIe large bar or on same xgmi hive, skip
+	 * system memory as migration bridge
+	 */
+
+	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
+
+	r = svm_migrate_vram_to_ram(prange, mm);
+	if (r)
+		return r;
+
+	return svm_migrate_ram_to_vram(prange, best_loc, mm);
+}
+
+int
+svm_migrate_to_vram(struct svm_range *prange, uint32_t best_loc,
+		    struct mm_struct *mm)
+{
+	if  (!prange->actual_loc)
+		return svm_migrate_ram_to_vram(prange, best_loc, mm);
+	else
+		return svm_migrate_vram_to_vram(prange, best_loc, mm);
+
+}
+
 /**
  * svm_migrate_to_ram - CPU page fault handler
  * @vmf: CPU vm fault vma, address
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 9949b55d3b6a..bc680619d135 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -37,8 +37,8 @@ enum MIGRATION_COPY_DIR {
 	FROM_VRAM_TO_RAM
 };
 
-int svm_migrate_ram_to_vram(struct svm_range *prange,  uint32_t best_loc,
-			    struct mm_struct *mm);
+int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
+			struct mm_struct *mm);
 int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm);
 unsigned long
 svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 65f20a72ddcb..d029fce94db0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -288,8 +288,11 @@ static void svm_range_bo_unref(struct svm_range_bo *svm_bo)
 	kref_put(&svm_bo->kref, svm_range_bo_release);
 }
 
-static bool svm_range_validate_svm_bo(struct svm_range *prange)
+static bool
+svm_range_validate_svm_bo(struct amdgpu_device *adev, struct svm_range *prange)
 {
+	struct amdgpu_device *bo_adev;
+
 	spin_lock(&prange->svm_bo_lock);
 	if (!prange->svm_bo) {
 		spin_unlock(&prange->svm_bo_lock);
@@ -301,6 +304,22 @@ static bool svm_range_validate_svm_bo(struct svm_range *prange)
 		return true;
 	}
 	if (svm_bo_ref_unless_zero(prange->svm_bo)) {
+		/*
+		 * Migrate from GPU to GPU, remove range from source bo_adev
+		 * svm_bo range list, and return false to allocate svm_bo from
+		 * destination adev.
+		 */
+		bo_adev = amdgpu_ttm_adev(prange->svm_bo->bo->tbo.bdev);
+		if (bo_adev != adev) {
+			spin_unlock(&prange->svm_bo_lock);
+
+			spin_lock(&prange->svm_bo->list_lock);
+			list_del_init(&prange->svm_bo_list);
+			spin_unlock(&prange->svm_bo->list_lock);
+
+			svm_range_bo_unref(prange->svm_bo);
+			return false;
+		}
 		if (READ_ONCE(prange->svm_bo->evicting)) {
 			struct dma_fence *f;
 			struct svm_range_bo *svm_bo;
@@ -374,7 +393,7 @@ svm_range_vram_node_new(struct amdgpu_device *adev, struct svm_range *prange,
 	pr_debug("pasid: %x svms 0x%p [0x%lx 0x%lx]\n", p->pasid, prange->svms,
 		 prange->it_node.start, prange->it_node.last);
 
-	if (svm_range_validate_svm_bo(prange))
+	if (svm_range_validate_svm_bo(adev, prange))
 		return 0;
 
 	svm_bo = svm_range_bo_new();
@@ -1209,6 +1228,7 @@ int svm_range_map_to_gpus(struct svm_range *prange, bool reserve_vm)
 	}
 
 	for_each_set_bit(gpuidx, bitmap, MAX_GPU_INSTANCE) {
+		pr_debug("mapping to gpu idx 0x%x\n", gpuidx);
 		r = kfd_process_device_from_gpuidx(p, gpuidx, &dev);
 		if (r) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
@@ -1843,7 +1863,7 @@ svm_range_restore_pages(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 
 	if (prange->actual_loc != best_loc) {
 		if (best_loc)
-			r = svm_migrate_ram_to_vram(prange, best_loc, mm);
+			r = svm_migrate_to_vram(prange, best_loc, mm);
 		else
 			r = svm_migrate_vram_to_ram(prange, mm);
 		if (r) {
@@ -2056,6 +2076,11 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 		goto out;
 
 	bo_adev = svm_range_get_adev_by_id(prange, best_loc);
+	if (!bo_adev) {
+		WARN_ONCE(1, "failed to get device by id 0x%x\n", best_loc);
+		best_loc = 0;
+		goto out;
+	}
 	bitmap_or(bitmap, prange->bitmap_access, prange->bitmap_aip,
 		  MAX_GPU_INSTANCE);
 
@@ -2076,6 +2101,7 @@ svm_range_best_prefetch_location(struct svm_range *prange)
 	pr_debug("xnack %d svms 0x%p [0x%lx 0x%lx] best loc 0x%x\n",
 		 p->xnack_enabled, &p->svms, prange->it_node.start,
 		 prange->it_node.last, best_loc);
+
 	return best_loc;
 }
 
@@ -2117,29 +2143,33 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
 	    best_loc == prange->actual_loc)
 		return 0;
 
+	/*
+	 * Prefetch to GPU without host access flag, set actual_loc to gpu, then
+	 * validate on gpu and map to gpus will be handled afterwards.
+	 */
 	if (best_loc && !prange->actual_loc &&
-	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS))
+	    !(prange->flags & KFD_IOCTL_SVM_FLAG_HOST_ACCESS)) {
+		prange->actual_loc = best_loc;
 		return 0;
+	}
 
-	if (best_loc) {
-		if (!prange->actual_loc && !prange->pages_addr) {
-			pr_debug("host access and prefetch to gpu\n");
-			r = svm_range_validate_ram(mm, prange);
-			if (r) {
-				pr_debug("failed %d to validate on ram\n", r);
-				return r;
-			}
-		}
-
-		pr_debug("migrate from ram to vram\n");
-		r = svm_migrate_ram_to_vram(prange, best_loc, mm);
-	} else {
-		pr_debug("migrate from vram to ram\n");
+	if (!best_loc) {
 		r = svm_migrate_vram_to_ram(prange, mm);
+		*migrated = !r;
+		return r;
+	}
+
+	if (!prange->actual_loc && !prange->pages_addr) {
+		pr_debug("host access and prefetch to gpu\n");
+		r = svm_range_validate_ram(mm, prange);
+		if (r) {
+			pr_debug("failed %d to validate on ram\n", r);
+			return r;
+		}
 	}
 
-	if (!r)
-		*migrated = true;
+	r = svm_migrate_to_vram(prange, best_loc, mm);
+	*migrated = !r;
 
 	return r;
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
