Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA815D36B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE66E542;
	Fri, 14 Feb 2020 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5BC6E27C;
 Thu, 13 Feb 2020 11:59:35 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so6384012wma.1;
 Thu, 13 Feb 2020 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDuVHY99NXVA3v/yOFXi0xBQCBd43rBDgj+11sFGRXY=;
 b=nFrY7IcQE3TDDCxSwzBuESx0wkPvYsgnnEl2FQ4/h1bq1VWhf01k2TCWq1tURoSH0F
 dT1TqtvxzABqs8WRD3c8s/lTmk2yMpUkbzSY6Jx+jEd/tnKeaZoSQHwEf3B/UkpqABXj
 zICQB5GmpLMgZxIKNI6k/PBiGm3Mtt0O7hH+j97clrldLW3AwJ6ximKNPBX4OydQsS9G
 bvwuy/0zt3xYhmYFb+8yzUCuf6jZnhFGnHircqKFbpsNJcIW0uGXGHnHIUlSTafUL0RJ
 cVXvki1jkW7Awb+Oi2qWEfthTuNaaq7VJm5cFZ4LCOhoxRwjUb/1GnhJMnEUzLaJro97
 bugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDuVHY99NXVA3v/yOFXi0xBQCBd43rBDgj+11sFGRXY=;
 b=Gtysd72xet9ffsbAFI8FWmXFVsFVtUbfXP1a5cP2eEYhRjWxyJeIJJKrS30t98QZYW
 14jefNB/MNBXumFIQfEODjJ+nCwNKb+K4EWN5H9TjeyOBqM7nZf9nfnAW55/GtPeg8ZR
 MIRFUqwIER/QscbZgiarS00vmEfdIwj/X0StexULmD/ZJX6E/DspLBVFvRPI1rWEa98F
 OoupoX+Bg8Xn/4/iPRX8EeZIck0ThaijX0kxZhOqoBqDwAGGoXBUISkxZRiZ6RVCmmuN
 8+XJS119/OH84JqRFmeGQfDuz5XHHz8MPWtmTlLV3/jX7FxzWxqPAZR4XN9P4PFWd2tz
 Ujng==
X-Gm-Message-State: APjAAAWbT8K8HGmsERkQdKUj1auqqDIkf85urJeQfWlo71KiB1jVE784
 HkFX5JyonkCiS3aHkDZJrE+QCAzy45SW5w==
X-Google-Smtp-Source: APXvYqz42cNZRyp7zi6zBxP/Nbqj+Hpr3wz1/+4iWGUpRtvcqo4urcteWrJPGcIjHZ7P+5trUSGRAQ==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr5521413wmm.143.1581595173240; 
 Thu, 13 Feb 2020 03:59:33 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2A5E004DB99F42976E8A13.dip0.t-ipconnect.de.
 [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13])
 by smtp.gmail.com with ESMTPSA id y131sm2803985wmc.13.2020.02.13.03.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 03:59:32 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/6] drm/amdgpu: move ttm bo->offset to amdgpu_bo
Date: Thu, 13 Feb 2020 13:01:58 +0100
Message-Id: <20200213120203.29368-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213120203.29368-1-nirmoy.das@amd.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU address should belong to driver not in memory management.
This patch moves ttm bo.offset and gpu_offset calculation to amdgpu driver.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 29 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 +--
 5 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 6f60a581e3ba..1b1c393587a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -917,7 +917,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		bo->pin_count++;
 
 		if (max_offset != 0) {
-			u64 domain_start = bo->tbo.bdev->man[mem_type].gpu_offset;
+			u64 domain_start = amdgpu_ttm_domain_start(adev, mem_type);
 			WARN_ON_ONCE(max_offset <
 				     (amdgpu_bo_gpu_offset(bo) - domain_start));
 		}
@@ -1467,7 +1467,25 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
 	WARN_ON_ONCE(bo->tbo.mem.mem_type == TTM_PL_VRAM &&
 		     !(bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS));
 
-	return amdgpu_gmc_sign_extend(bo->tbo.offset);
+	return amdgpu_bo_gpu_offset_no_check(bo);
+}
+
+/**
+ * amdgpu_bo_gpu_offset_no_check - return GPU offset of bo
+ * @bo:	amdgpu object for which we query the offset
+ *
+ * Returns:
+ * current GPU offset of the object without raising warnings.
+ */
+u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	uint64_t offset;
+
+        offset = (bo->tbo.mem.start << PAGE_SHIFT) +
+		 amdgpu_ttm_domain_start(adev, bo->tbo.mem.mem_type);
+
+	return amdgpu_gmc_sign_extend(offset);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 96d805889e8d..9075ef20ce02 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -288,6 +288,7 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
 			     bool intr);
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
+u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
 int amdgpu_bo_validate(struct amdgpu_bo *bo);
 int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
 			     struct dma_fence **fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2c1d1eb1a7e1..4bb02d787945 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -103,7 +103,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_TT:
 		/* GTT memory  */
 		man->func = &amdgpu_gtt_mgr_func;
-		man->gpu_offset = adev->gmc.gart_start;
 		man->available_caching = TTM_PL_MASK_CACHING;
 		man->default_caching = TTM_PL_FLAG_CACHED;
 		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
@@ -111,7 +110,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 		/* "On-card" video ram */
 		man->func = &amdgpu_vram_mgr_func;
-		man->gpu_offset = adev->gmc.vram_start;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED |
 			     TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
@@ -122,7 +120,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case AMDGPU_PL_OA:
 		/* On-chip GDS memory*/
 		man->func = &ttm_bo_manager_func;
-		man->gpu_offset = 0;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_CMA;
 		man->available_caching = TTM_PL_FLAG_UNCACHED;
 		man->default_caching = TTM_PL_FLAG_UNCACHED;
@@ -270,7 +267,7 @@ static uint64_t amdgpu_mm_node_addr(struct ttm_buffer_object *bo,
 
 	if (mm_node->start != AMDGPU_BO_INVALID_OFFSET) {
 		addr = mm_node->start << PAGE_SHIFT;
-		addr += bo->bdev->man[mem->mem_type].gpu_offset;
+		addr += amdgpu_ttm_domain_start(amdgpu_ttm_adev(bo->bdev), mem->mem_type);
 	}
 	return addr;
 }
@@ -757,6 +754,27 @@ static unsigned long amdgpu_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
 		(offset >> PAGE_SHIFT);
 }
 
+/**
+ * amdgpu_ttm_domain_start - Returns GPU start address
+ * @adev: amdgpu device object
+ * @type: type of the memory
+ *
+ * Returns:
+ * GPU start address of a memory domain
+ */
+
+uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type)
+{
+	switch(type) {
+	case TTM_PL_TT:
+		return adev->gmc.gart_start;
+	case TTM_PL_VRAM:
+		return adev->gmc.vram_start;
+	}
+
+	return 0;
+}
+
 /*
  * TTM backend functions.
  */
@@ -1136,9 +1154,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 		bo->mem = tmp;
 	}
 
-	bo->offset = (bo->mem.start << PAGE_SHIFT) +
-		bo->bdev->man[bo->mem.mem_type].gpu_offset;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f1ebd424510c..aed364d71d58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -102,6 +102,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
+uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);
 
 #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
 int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 4cc7881f438c..3c02647e6848 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -140,7 +140,7 @@ static void amdgpu_vm_sdma_copy_ptes(struct amdgpu_vm_update_params *p,
 
 	src += p->num_dw_left * 4;
 
-	pe += amdgpu_gmc_sign_extend(bo->tbo.offset);
+	pe += amdgpu_bo_gpu_offset_no_check(bo);
 	trace_amdgpu_vm_copy_ptes(pe, src, count, p->direct);
 
 	amdgpu_vm_copy_pte(p->adev, ib, pe, src, count);
@@ -167,7 +167,7 @@ static void amdgpu_vm_sdma_set_ptes(struct amdgpu_vm_update_params *p,
 {
 	struct amdgpu_ib *ib = p->job->ibs;
 
-	pe += amdgpu_gmc_sign_extend(bo->tbo.offset);
+	pe += amdgpu_bo_gpu_offset_no_check(bo);
 	trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags, p->direct);
 	if (count < 3) {
 		amdgpu_vm_write_pte(p->adev, ib, pe, addr | flags,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
