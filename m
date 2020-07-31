Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE4233DFE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 06:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D556E9B2;
	Fri, 31 Jul 2020 04:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8952E6E9AE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 04:06:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-K6CmWFv5M4SaQ-BoECRC-A-1; Fri, 31 Jul 2020 00:06:30 -0400
X-MC-Unique: K6CmWFv5M4SaQ-BoECRC-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ED831005510;
 Fri, 31 Jul 2020 04:06:29 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C39261002393;
 Fri, 31 Jul 2020 04:06:27 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 27/49] drm/amdgfx/ttm: use wrapper to get ttm memory managers
Date: Fri, 31 Jul 2020 14:04:58 +1000
Message-Id: <20200731040520.3701599-28-airlied@gmail.com>
In-Reply-To: <20200731040520.3701599-1-airlied@gmail.com>
References: <20200731040520.3701599-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: christian.koenig@amd.com, sroland@vmware.com, bskeggs@redhat.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 12 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c      | 21 +++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 12 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 12 +++++------
 8 files changed, 39 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 1b865fed74ca..e24f421e5553 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -517,8 +517,9 @@ int amdgpu_amdkfd_get_dmabuf_info(struct kgd_dev *kgd, int dma_buf_fd,
 uint64_t amdgpu_amdkfd_get_vram_usage(struct kgd_dev *kgd)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	struct ttm_mem_type_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
-	return amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+	return amdgpu_vram_mgr_usage(vram_man);
 }
 
 uint64_t amdgpu_amdkfd_get_hive_id(struct kgd_dev *kgd)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a512ccbc4dea..9829640e1769 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -299,7 +299,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 {
 	s64 time_us, increment_us;
 	u64 free_vram, total_vram, used_vram;
-
+	struct ttm_mem_type_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	/* Allow a maximum of 200 accumulated ms. This is basically per-IB
 	 * throttling.
 	 *
@@ -316,7 +316,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	}
 
 	total_vram = adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_size);
-	used_vram = amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+	used_vram = amdgpu_vram_mgr_usage(vram_man);
 	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
 
 	spin_lock(&adev->mm_stats.lock);
@@ -363,7 +363,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	if (!amdgpu_gmc_vram_full_visible(&adev->gmc)) {
 		u64 total_vis_vram = adev->gmc.visible_vram_size;
 		u64 used_vis_vram =
-			amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+		  amdgpu_vram_mgr_vis_usage(vram_man);
 
 		if (used_vis_vram < total_vis_vram) {
 			u64 free_vis_vram = total_vis_vram - used_vis_vram;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index aa5b54e5a1d7..d551e7c5e69d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3880,7 +3880,7 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 
 	amdgpu_virt_init_data_exchange(adev);
 	/* we need recover gart prior to run SMC/CP/SDMA resume */
-	amdgpu_gtt_mgr_recover(&adev->mman.bdev.man[TTM_PL_TT]);
+	amdgpu_gtt_mgr_recover(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
 
 	r = amdgpu_device_fw_loading(adev);
 	if (r)
@@ -4079,8 +4079,7 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 					amdgpu_inc_vram_lost(tmp_adev);
 				}
 
-				r = amdgpu_gtt_mgr_recover(
-					&tmp_adev->mman.bdev.man[TTM_PL_TT]);
+				r = amdgpu_gtt_mgr_recover(ttm_manager_type(&tmp_adev->mman.bdev, TTM_PL_TT));
 				if (r)
 					goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index f4c870b2f348..0b0d09d19b4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -48,9 +48,9 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
-			(adev->mman.bdev.man[TTM_PL_TT].size) * PAGE_SIZE);
+			man->size * PAGE_SIZE);
 }
 
 /**
@@ -66,9 +66,9 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
-			amdgpu_gtt_mgr_usage(&adev->mman.bdev.man[TTM_PL_TT]));
+			amdgpu_gtt_mgr_usage(man));
 }
 
 static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
@@ -87,7 +87,7 @@ static const struct ttm_mem_type_manager_func amdgpu_gtt_mgr_func;
  */
 int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_TT];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	struct amdgpu_gtt_mgr *mgr;
 	uint64_t start, size;
 	int ret;
@@ -135,7 +135,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
  */
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_TT];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 	struct amdgpu_gtt_mgr *mgr = man->priv;
 	int ret;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index a8c47aecd342..594687cc99ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -594,13 +594,13 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 		ui64 = atomic64_read(&adev->num_vram_cpu_page_faults);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VRAM_USAGE:
-		ui64 = amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+		ui64 = amdgpu_vram_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VIS_VRAM_USAGE:
-		ui64 = amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+		ui64 = amdgpu_vram_mgr_vis_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GTT_USAGE:
-		ui64 = amdgpu_gtt_mgr_usage(&adev->mman.bdev.man[TTM_PL_TT]);
+		ui64 = amdgpu_gtt_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GDS_CONFIG: {
 		struct drm_amdgpu_info_gds gds_info;
@@ -623,7 +623,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 			min(adev->gmc.visible_vram_size -
 			    atomic64_read(&adev->visible_pin_size),
 			    vram_gtt.vram_size);
-		vram_gtt.gtt_size = adev->mman.bdev.man[TTM_PL_TT].size;
+		vram_gtt.gtt_size = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
 		vram_gtt.gtt_size *= PAGE_SIZE;
 		vram_gtt.gtt_size -= atomic64_read(&adev->gart_pin_size);
 		return copy_to_user(out, &vram_gtt,
@@ -631,14 +631,17 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 	}
 	case AMDGPU_INFO_MEMORY: {
 		struct drm_amdgpu_memory_info mem;
-
+		struct ttm_mem_type_manager *vram_man =
+			ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+		struct ttm_mem_type_manager *gtt_man =
+			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 		memset(&mem, 0, sizeof(mem));
 		mem.vram.total_heap_size = adev->gmc.real_vram_size;
 		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
 			atomic64_read(&adev->vram_pin_size) -
 			AMDGPU_VM_RESERVED_VRAM;
 		mem.vram.heap_usage =
-			amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+			amdgpu_vram_mgr_usage(vram_man);
 		mem.vram.max_allocation = mem.vram.usable_heap_size * 3 / 4;
 
 		mem.cpu_accessible_vram.total_heap_size =
@@ -648,16 +651,16 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 			    atomic64_read(&adev->visible_pin_size),
 			    mem.vram.usable_heap_size);
 		mem.cpu_accessible_vram.heap_usage =
-			amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]);
+			amdgpu_vram_mgr_vis_usage(vram_man);
 		mem.cpu_accessible_vram.max_allocation =
 			mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
 
-		mem.gtt.total_heap_size = adev->mman.bdev.man[TTM_PL_TT].size;
+		mem.gtt.total_heap_size = gtt_man->size;
 		mem.gtt.total_heap_size *= PAGE_SIZE;
 		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
 			atomic64_read(&adev->gart_pin_size);
 		mem.gtt.heap_usage =
-			amdgpu_gtt_mgr_usage(&adev->mman.bdev.man[TTM_PL_TT]);
+			amdgpu_gtt_mgr_usage(gtt_man);
 		mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
 
 		return copy_to_user(out, &mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5ac7b5561475..ced418cba2f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -449,7 +449,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 	 * allow fall back to GTT
 	 */
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
-		man = &adev->mman.bdev.man[TTM_PL_TT];
+		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
 		if (size < (man->size << PAGE_SHIFT))
 			return true;
@@ -458,7 +458,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
-		man = &adev->mman.bdev.man[TTM_PL_VRAM];
+		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
 		if (size < (man->size << PAGE_SHIFT))
 			return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b1452df8fce9..4beec1c4e037 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -67,7 +67,7 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
 				    uint64_t size)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[type];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, type);
 
 	man->available_caching = TTM_PL_FLAG_UNCACHED;
 	man->default_caching = TTM_PL_FLAG_UNCACHED;
@@ -2014,9 +2014,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 
 	amdgpu_vram_mgr_fini(adev);
 	amdgpu_gtt_mgr_fini(adev);
-	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_GDS]);
-	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_GWS]);
-	ttm_bo_man_takedown(&adev->mman.bdev, &adev->mman.bdev.man[AMDGPU_PL_OA]);
+	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GDS));
+	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GWS));
+	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_OA));
 	ttm_bo_device_release(&adev->mman.bdev);
 	adev->mman.initialized = false;
 	DRM_INFO("amdgpu: ttm finalized\n");
@@ -2033,7 +2033,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
  */
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
 	int r;
 
@@ -2255,7 +2255,7 @@ static int amdgpu_mm_dump_table(struct seq_file *m, void *data)
 	unsigned ttm_pl = (uintptr_t)node->info_ent->data;
 	struct drm_device *dev = node->minor->dev;
 	struct amdgpu_device *adev = dev->dev_private;
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[ttm_pl];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, ttm_pl);
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	man->func->debug(man, &p);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index cc45be8ccb0f..d33a750e07a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -82,9 +82,9 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		amdgpu_vram_mgr_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
+			amdgpu_vram_mgr_usage(man));
 }
 
 /**
@@ -100,9 +100,9 @@ static ssize_t amdgpu_mem_info_vis_vram_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
-
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	return snprintf(buf, PAGE_SIZE, "%llu\n",
-		amdgpu_vram_mgr_vis_usage(&adev->mman.bdev.man[TTM_PL_VRAM]));
+			amdgpu_vram_mgr_vis_usage(man));
 }
 
 static ssize_t amdgpu_mem_info_vram_vendor(struct device *dev,
@@ -170,7 +170,7 @@ static const struct ttm_mem_type_manager_func amdgpu_vram_mgr_func;
  */
 int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	struct amdgpu_vram_mgr *mgr;
 	int ret;
 
@@ -207,7 +207,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
  */
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 {
-	struct ttm_mem_type_manager *man = &adev->mman.bdev.man[TTM_PL_VRAM];
+	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	struct amdgpu_vram_mgr *mgr = man->priv;
 	int ret;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
