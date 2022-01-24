Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6326497F5E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE60910EA39;
	Mon, 24 Jan 2022 12:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226C010E8BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:25:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h29so10610145wrb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 04:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mL9p2jWNUVXLZ5w9308C92ujxW+8PpClhjMW4UXdDb8=;
 b=IST1mh4oe//JLZU8n4tlAx+tZfRfUsrWxPGluTJItNymF93m+VEx6/Dp4CUV7LIKCM
 1Ga7GFooqUYv4gjNthyQM8QL1Vfs89uiczzv7ZsGU7ZOJXpRdjRJlso3xczNxgdUbEG2
 OzimrzArFiJhZcSunDdcW5U5WVJQvChQ59BB3uso0YJZPbjZ/P2YydAdKGzp2wZRAqZn
 I3vAsm8qezegxhp6+3VCKND2gotdGLtdVW3T77rW+TMlGgVKGoHAhwyPEp3mWpFJ4XWh
 ZNxP5YPSPI552LZwsopaMcbMSk9bDiY0B6loNaSgj8iSMwObCYrZQlDwvGj5s8vGUdaw
 GXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mL9p2jWNUVXLZ5w9308C92ujxW+8PpClhjMW4UXdDb8=;
 b=JxIK96rPwwRNxpRs26A9aYsJ+mdRqCbNXcCXR7q77GhJ8AB5vbT+jjkaW1kXvC3q0W
 cZSjqpdf4+ZbCfDjlMprevoEoFjHqkhBFaDM8KS4GOJlX//2yBtaK2wJOT5AmG2U2CLP
 rMWLz7wiuZqH7m7CVD4MvmlSzaFWkAtBA8+KzqhTsjEWTYxlguzt+i0RVlBAEe68HljY
 U5g8th26JEJoB88Y496biaoPtH4K64UBdCJQ9ysdAhHyusFbM9ROznT8vSttn+r78vy/
 2jpAHV6I3CssbXXalkcH/i58Pj+p0CAJxbEzxLS+yZQkFcdqkvF5tqk36P5oniPj3EA+
 tGiQ==
X-Gm-Message-State: AOAM530Xrhc2mq905tGzPB29VGXaQQ0tqb520FTubq1wrj39oX70onWj
 GHKVHd3u0vqPVYcVTLgELhc=
X-Google-Smtp-Source: ABdhPJyPM1v6kNYjDVdpEZ2cFG8gNEuPlzoKcbGzN/9I7sjTg7hQt801HEVrtBkVB8CrbrRDYAmeag==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr13954286wry.683.1643027122689; 
 Mon, 24 Jan 2022 04:25:22 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 1sm12830516wmo.37.2022.01.24.04.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 04:25:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org, bas@basnieuwenhuizen.nl
Subject: [PATCH 08/12] drm/amdgpu: remove GTT accounting
Date: Mon, 24 Jan 2022 13:25:10 +0100
Message-Id: <20220124122514.1832-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124122514.1832-1-christian.koenig@amd.com>
References: <20220124122514.1832-1-christian.koenig@amd.com>
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
index 9e7685a4878c..ce5eeb3c1097 100644
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
index 651c7abfde03..8d5d56d9d26d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -678,7 +678,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		ui64 = amdgpu_vram_mgr_vis_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GTT_USAGE:
-		ui64 = amdgpu_gtt_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
+		ui64 = ttm_resource_manager_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GDS_CONFIG: {
 		struct drm_amdgpu_info_gds gds_info;
@@ -737,8 +737,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		mem.gtt.total_heap_size *= PAGE_SIZE;
 		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
 			atomic64_read(&adev->gart_pin_size);
-		mem.gtt.heap_usage =
-			amdgpu_gtt_mgr_usage(gtt_man);
+		mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);
 		mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
 
 		return copy_to_user(out, &mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 7346ecff4438..2ac332cd4f59 100644
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

