Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC14AECCC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25E10E572;
	Wed,  9 Feb 2022 08:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DE510E555;
 Wed,  9 Feb 2022 08:41:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u18so3579571edt.6;
 Wed, 09 Feb 2022 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ur+a0XB6YGOgN2+nHGAvG//MoKUjko0kbsrGToRzp0=;
 b=lgp9E9gspBtG94nTYNVzQtMLcDMX38LkceQkcNjpLrLRSfaKKsYUfojPfXl9lzXJiT
 2NL2M9cRNahhdHweSUJabm/IAbDGXS+U1BFGNj7QLTQOhANACptR4gP+ARF3sNzWM+gV
 A8ykA/TUuW42Nga1FajPooMMnJgB/wYJ1Jr//lmmHjkXwQ12pRJMNWfCjh9zvYVkP/Er
 elWpdFrrMkyqoa6hMgTbZlJN2qeF5HervWL8HW9vX4xwZK6XzqvXyaggy+3XwDkFeDTU
 J/LBb7BIWASaGCN3tPyywa3zhaS86Q94GCHkNxMJbx/icjNvPyFH3AKvP2TMUc9gXUnU
 Ab+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ur+a0XB6YGOgN2+nHGAvG//MoKUjko0kbsrGToRzp0=;
 b=vPaffswozMLjzXhg9Si8kY8agsNn3DzqOMKyThEeN2gDQCR7x+sD2MOqV7cow/Dnt/
 jDsm3RvzGVxy9fjSxah76tCXIxtZdj40KdGHhW03oaVZm3DSjlqilRpg8rFXIjvxnRn7
 423ZrLFAUrEU3C5cMWlAhLqrfv6SrUYeT0S/tb1pg93fGTJBBI3ZQ9phl0vA5Rv195hj
 iKq/Op43YM/nn1ILTFxf4x2wSeyxT/o5neHX6uJ0FGpL/uXXkP8QosK2jJO5P7v1P/ql
 ZdJvMyys2ozFQ1Vg/A6uIuNwb4054BWlZooZD77yi96StfR7bfIyJPBhz4CFecTQVwzL
 eGtA==
X-Gm-Message-State: AOAM531IeIIxBL3S9RdpMSE8/sMIji4EwuW5gIyuGdvICG2aI/6LZ8GY
 qMubCgeFFAvhS0Tt6mnpcOM=
X-Google-Smtp-Source: ABdhPJxO6EiGKTuRpYo/jqOcy+jN3xUsZL4VGYzfwZ8jrYCMWXzbkkLDBHhdWVC4LG/XzM1gsvwCJA==
X-Received: by 2002:a50:fb04:: with SMTP id d4mr1215770edq.303.1644396066632; 
 Wed, 09 Feb 2022 00:41:06 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id u6sm3807958eje.101.2022.02.09.00.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 00:41:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 5/9] drm/amdgpu: remove GTT accounting
Date: Wed,  9 Feb 2022 09:40:55 +0100
Message-Id: <20220209084059.1042345-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209084059.1042345-1-christian.koenig@amd.com>
References: <20220209084059.1042345-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is provided by TTM now.

Also switch man->size to bytes instead of pages and fix the double
printing of size and usage in debugfs.

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 +++++----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 -
 3 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index e0c7fbe01d93..3bcd27ae379d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -60,7 +60,7 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
 	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
-	return sysfs_emit(buf, "%llu\n", man->size * PAGE_SIZE);
+	return sysfs_emit(buf, "%llu\n", man->size);
 }
 
 /**
@@ -77,8 +77,9 @@ static ssize_t amdgpu_mem_info_gtt_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct ttm_resource_manager *man = &adev->mman.gtt_mgr.manager;
 
-	return sysfs_emit(buf, "%llu\n", amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr));
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
 }
 
 static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
@@ -130,20 +131,17 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
@@ -169,11 +167,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
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
 
@@ -196,25 +189,10 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
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
- * @mgr: amdgpu_gtt_mgr pointer
- *
- * Return how many bytes are used in the GTT domain
- */
-uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr)
-{
-	return atomic64_read(&mgr->used) * PAGE_SIZE;
-}
-
 /**
  * amdgpu_gtt_mgr_recover - re-init gart
  *
@@ -260,9 +238,6 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
-
-	drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n",
-		   man->size, atomic64_read(&mgr->used));
 }
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
@@ -288,14 +263,12 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
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
index 1ebb91db2274..9ff4aced5da7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -684,7 +684,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		ui64 = amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GTT_USAGE:
-		ui64 = amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
+		ui64 = ttm_resource_manager_usage(&adev->mman.gtt_mgr.manager);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_GDS_CONFIG: {
 		struct drm_amdgpu_info_gds gds_info;
@@ -716,7 +716,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	case AMDGPU_INFO_MEMORY: {
 		struct drm_amdgpu_memory_info mem;
 		struct ttm_resource_manager *gtt_man =
-			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
+			&adev->mman.gtt_mgr.manager;
+
 		memset(&mem, 0, sizeof(mem));
 		mem.vram.total_heap_size = adev->gmc.real_vram_size;
 		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
@@ -741,8 +742,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		mem.gtt.total_heap_size *= PAGE_SIZE;
 		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
 			atomic64_read(&adev->gart_pin_size);
-		mem.gtt.heap_usage =
-			amdgpu_gtt_mgr_usage(&adev->mman.gtt_mgr);
+		mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);
 		mem.gtt.max_allocation = mem.gtt.usable_heap_size * 3 / 4;
 
 		return copy_to_user(out, &mem,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f8f48be16d80..120b69ec9885 100644
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
-uint64_t amdgpu_gtt_mgr_usage(struct amdgpu_gtt_mgr *mgr);
 int amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr);
 
 uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man);
-- 
2.25.1

