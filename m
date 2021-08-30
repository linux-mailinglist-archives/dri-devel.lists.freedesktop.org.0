Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB73FB2C6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D34F89D4A;
	Mon, 30 Aug 2021 08:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0089D39
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q11so21303747wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hFXo/QKLo0lGYv+wI80/C8+VI8KbTJYD1k0JLKaL+gg=;
 b=EmD+EgLmvXBg54A52lyyV79CC8qO72vCVGC5diCONRzr1aTFux/bY5WlWaQ7lzdce2
 NISlUFuaaF0Fu2f5I0PcJ5+2WjtHT2Q1tHFgVP17tHCe4ToiTTJWPH1WYcYtUFR92Bk7
 kFDTs5apvnPlnfvWwIEjCNtP69i4fnqEG3qb2PvZ4ZJR7eNcGw34PfLKmNAnSyDA0TK4
 wRld0stGBcGZP1JKK3vf7lr3RJNBjOwSgVK901YRr3BXz3iMrYdEs4oNjMiAvt+OEBgu
 zwrToheXhsBuhgQF4HTxjb7Vy1bdrui5+FdlST/aWCXdiZk1BnJW+tNurKS8nUIfmKG3
 kVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hFXo/QKLo0lGYv+wI80/C8+VI8KbTJYD1k0JLKaL+gg=;
 b=XgHtoa0OpjTDgpSJe7oZWV4lZeb/0YokCs5g7ESFegFZajFm/1wzo2HTRXlbKI79gj
 suEz4IZtceR/MTO01cDYyv78mLBi0/20Pd8/IVQZcaJ8tr1YCLKPNtplJzF/euF0Zpag
 8oNk6Jla6OND9Vle1q4VJ+f81tGVW0WYXhr7FSS8todu6y4QXzV0dvuE5+y1h6bgNPSI
 XrOI+HuViZZ9ob2u3bjZ+26rZpruACadSiN81TclXBbyKBEV4CUDeS8g51TVykz+jl6+
 iMjXdIweKNKMtI3g1K4cyosLtANT5PmtelE+KCf2Z/p9L6a/6pTfKcVBoeLevicGa2DR
 07ng==
X-Gm-Message-State: AOAM533u2ukh15NFT1zQzh4XEw8TsCPT127AXhx18Ig3RB523AcHrAP7
 /Q0ndY7de0y6qbKA9W9/6ik=
X-Google-Smtp-Source: ABdhPJyH2Rtz6I7jUNm+QlB4QfruSmkI1e4+Dj6k/W9r44R9Puxfnog3VrFZSDjmKzAd2kZh+M+BIA==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr24694461wrq.330.1630313836491; 
 Mon, 30 Aug 2021 01:57:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 10/12] drm/amdgpu: remove GTT accounting
Date: Mon, 30 Aug 2021 10:57:05 +0200
Message-Id: <20210830085707.209508-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is provided by TTM now.

Also switch man->size to bytes instead of pages and fix the double
printing of size and usage in debugfs.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 50 +++++----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 -
 3 files changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 1dae68caa974..7085494c6a9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -60,7 +60,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
-	return sysfs_emit(buf, "%llu\n", man->size * PAGE_SIZE);
+	return sysfs_emit(buf, "%llu\n", man->size);
 }
 
 /**
@@ -80,7 +80,7 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
-	return sysfs_emit(buf, "%llu\n", amdgpu_gtt_mgr_usage(man));
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
 }
 
 static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
@@ -132,20 +132,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
-	    atomic64_add_return(num_pages, &mgr->used) >  man->size) {
-		atomic64_sub(num_pages, &mgr->used);
-		return -ENOSPC;
-	}
-
 	node = kzalloc(struct_size(node, base.mm_nodes, 1), GFP_KERNEL);
-	if (!node) {
-		r = -ENOMEM;
-		goto err_out;
-	}
+	if (!node)
+		return -ENOMEM;
 
 	node->tbo = tbo;
 	ttm_resource_init(tbo, place, &node->base.base);
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
+	    ttm_resource_manager_usage(man) > man->size) {
+		r = -ENOSPC;
+		goto err_free;
+	}
 
 	if (place->lpfn) {
 		spin_lock(&mgr->lock);
@@ -171,11 +168,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 err_free:
 	ttm_resource_fini(man, &node->base.base);
 	kfree(node);
-
-err_out:
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
-		atomic64_sub(num_pages, &mgr->used);
-
 	return r;
 }
 
@@ -198,27 +190,10 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 		drm_mm_remove_node(&node->base.mm_nodes[0]);
 	spin_unlock(&mgr->lock);
 
-	if (!(res->placement & TTM_PL_FLAG_TEMPORARY))
-		atomic64_sub(res->num_pages, &mgr->used);
-
 	ttm_resource_fini(man, res);
 	kfree(node);
 }
 
-/**
- * amdgpu_gtt_mgr_usage - return usage of GTT domain
- *
- * @man: TTM memory type manager
- *
- * Return how many bytes are used in the GTT domain
- */
-uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
-{
-	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-
-	return atomic64_read(&mgr->used) * PAGE_SIZE;
-}
-
 /**
  * amdgpu_gtt_mgr_recover - re-init gart
  *
@@ -265,9 +240,6 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
-
-	drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n",
-		   man->size, atomic64_read(&mgr->used));
 }
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
@@ -293,14 +265,12 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 
-	ttm_resource_manager_init(man, &adev->mman.bdev,
-				  gtt_size >> PAGE_SHIFT);
+	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
 	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->used, 0);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 20b049ad61c1..bd8e28e9ca7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -671,7 +671,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		ui64 = amdgpu_vram_mgr_vis_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GTT_USAGE:
-		ui64 = amdgpu_gtt_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
+		ui64 = ttm_resource_manager_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GDS_CONFIG: {
 		struct drm_amdgpu_info_gds gds_info;
@@ -730,8 +730,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		mem.gtt.total_heap_size *= PAGE_SIZE;
 		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
 			atomic64_read(&adev->gart_pin_size);
-		mem.gtt.heap_usage =
-			amdgpu_gtt_mgr_usage(gtt_man);
+		mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);
 		mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
 
 		return copy_to_user(out, &mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 3205fd520060..af0faf9b36f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,7 +52,6 @@ struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
-	atomic64_t used;
 };
 
 struct amdgpu_preempt_mgr {
@@ -114,7 +113,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev);
 void amdgpu_vram_mgr_fini(struct amdgpu_device *adev);
 
 bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *mem);
-uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man);
 int amdgpu_gtt_mgr_recover(struct ttm_resource_manager *man);
 
 uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man);
-- 
2.25.1

