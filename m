Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A01621C4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 08:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B106E169;
	Tue, 18 Feb 2020 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161E6E834;
 Mon, 17 Feb 2020 10:16:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so18924467wrl.13;
 Mon, 17 Feb 2020 02:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7JmOps2LFt/mZeLHn8kmkYKO/RC9xsbiYfzZQVFgxI=;
 b=kb9klnMc0KHYfg0Ioy7vJ9O0/k17qib9xOM+aoKoReJSnJt5ZFfFhf0DurVRmnIGUG
 aR6c1S9vaUa9BFP/jluWY+CHA8Vw7/74ueOB68HRnnhPTKlT7HRA1kdC2Wu2IXX3hN1W
 STTcI0SqOcuOgVvCl3NHaf/XH9C4Qc8RQzC0vkZPdnpfgKjzgLgefzdOs+S9WJqMZ7Wq
 MsLhy9iOnxKmfNJJ1GCCDZHRPg/u6eykmAwkygb41UNTT//CxY8ixBlwhfvnIfHVmuaz
 FL4vBXwjk+1Q/MtyNDUSmFpepQo2hhHIxzTQyjtpBaz8Fl09TAsPSt1G10UJqL68KGQg
 ueZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7JmOps2LFt/mZeLHn8kmkYKO/RC9xsbiYfzZQVFgxI=;
 b=QhVpLHe+dvq6x17gJIkqu794xTeTL7joStMdum/NaXZgrtIR0bGHTKIGBPHGRxPoNz
 eQnig+BO8Ons+oIAkF8B53BJezOMEVn124/49b4/GRdmVfKPq3qEkewUv9qQ1uiNXQVZ
 NsyAWKaExEUk5emHfX4Q1Xi2zBLQcX4fNBsfuFGwOwEclBt3DFXjz9ZxFV8cFAOq+iFS
 Bj/OlgUDQwqN+swYlk2ydM3/2em9pwbJ117BXUCxg2+NXGYvZzjvhzlYopTQ1PXpnhRE
 kyYSaoeSRV4Dma47iiG6FI+YyISapyuy1Bl5pJmvkV6uTYdtUC3hggxWv5TnOa4Du+pz
 GcFw==
X-Gm-Message-State: APjAAAXD8UbRaMO6eFaEbNKE4fk3XCvhWpODNcwgp740YpQbYQRq6/kX
 Hkfc638P7LzDHb+iHQI7eox8XCX1ixZPVQ==
X-Google-Smtp-Source: APXvYqzc/kBBnLAiOMkjcUfYcXI+DTeGYyArEVQd0b5Yt279POmb1JXuvJnLh6jL7mzmm9MyHyyxvg==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr21570530wrj.68.1581934560213; 
 Mon, 17 Feb 2020 02:16:00 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F261400BC111EAD619EC67C.dip0.t-ipconnect.de.
 [2003:c5:8f26:1400:bc11:1ead:619e:c67c])
 by smtp.gmail.com with ESMTPSA id a16sm278487wrt.30.2020.02.17.02.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:15:59 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/amdgpu: move ttm bo->offset to amdgpu_bo
Date: Mon, 17 Feb 2020 11:18:35 +0100
Message-Id: <20200217101841.7437-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217101841.7437-1-nirmoy.das@amd.com>
References: <20200217101841.7437-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:55:25 +0000
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
 alexander.deucher@amd.com, Huang Rui <ray.huang@amd.com>, sean@poorly.run,
 christian.koenig@amd.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPU address should belong to driver not in memory management.
This patch moves ttm bo.offset and gpu_offset calculation to amdgpu driver.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 22 ++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 29 ++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 4 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e3f16b49e970..04e78f783638 100644
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
@@ -1445,7 +1445,25 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
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
index 36dec51d1ef1..1d86b4c7a1f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -279,6 +279,7 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 		     bool shared);
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
+u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
 int amdgpu_bo_validate(struct amdgpu_bo *bo);
 int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
 			     struct dma_fence **fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3ab46d4647e4..e329a108e760 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -97,7 +97,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_TT:
 		/* GTT memory  */
 		man->func = &amdgpu_gtt_mgr_func;
-		man->gpu_offset = adev->gmc.gart_start;
 		man->available_caching = TTM_PL_MASK_CACHING;
 		man->default_caching = TTM_PL_FLAG_CACHED;
 		man->flags = TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLAG_CMA;
@@ -105,7 +104,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case TTM_PL_VRAM:
 		/* "On-card" video ram */
 		man->func = &amdgpu_vram_mgr_func;
-		man->gpu_offset = adev->gmc.vram_start;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED |
 			     TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
@@ -116,7 +114,6 @@ static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 	case AMDGPU_PL_OA:
 		/* On-chip GDS memory*/
 		man->func = &ttm_bo_manager_func;
-		man->gpu_offset = 0;
 		man->flags = TTM_MEMTYPE_FLAG_FIXED | TTM_MEMTYPE_FLAG_CMA;
 		man->available_caching = TTM_PL_FLAG_UNCACHED;
 		man->default_caching = TTM_PL_FLAG_UNCACHED;
@@ -264,7 +261,7 @@ static uint64_t amdgpu_mm_node_addr(struct ttm_buffer_object *bo,
 
 	if (mm_node->start != AMDGPU_BO_INVALID_OFFSET) {
 		addr = mm_node->start << PAGE_SHIFT;
-		addr += bo->bdev->man[mem->mem_type].gpu_offset;
+		addr += amdgpu_ttm_domain_start(amdgpu_ttm_adev(bo->bdev), mem->mem_type);
 	}
 	return addr;
 }
@@ -751,6 +748,27 @@ static unsigned long amdgpu_ttm_io_mem_pfn(struct ttm_buffer_object *bo,
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
@@ -1162,9 +1180,6 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 		bo->mem = tmp;
 	}
 
-	bo->offset = (bo->mem.start << PAGE_SHIFT) +
-		bo->bdev->man[bo->mem.mem_type].gpu_offset;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 0dddedc06ae3..2c90a95c4b27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -102,6 +102,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
+uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);
 
 #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
 int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
