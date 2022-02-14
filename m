Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947114B4659
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B597810E26F;
	Mon, 14 Feb 2022 09:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D23810E261
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f17so26108277edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RRnh9tbVPXPS8AhPbbw/qutM66S3hnu1Wtsw56OCnsE=;
 b=gOK5KunOgbYw5bDa4BM4nP6pBV/BJCtfMYGrpWjSFQyaKe0Ye6SEyLIk60qcZ2RsLp
 Iw9iZt2NlEaLYGYjNW/cZ1jqpTllMSa+0XxEBvZRmJ1i9cb1fChDPfYsm297+E91EPYv
 b5UiBypJfJ1ePkKfdtD2dKRdZYHndhnNRXER/zrE3DuidxyM8KRokme8PCu1yqzN8twm
 5PcbJDZNBIr5ZHkt/SA0p6cpgrZQf2gnvLDgqNtqijj7BtvZIP8CXFZPyn6GVwqZ9l3C
 /8u34CA9b4xsZXqYWMl6MaEtnOzwt3+c+dgQsfJDOjkeubX1h4XtqPHziTKnOCg6Q2OL
 tpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RRnh9tbVPXPS8AhPbbw/qutM66S3hnu1Wtsw56OCnsE=;
 b=7oKbmnonRPHPJ0A1BN6MDwolTeG81GS3hjGdHTbL+c8ISv4spyf+iTRiYIh39TRDcy
 7pzK1F+8X2J4Z2SVjelqsKjvUWZLMOy8i2f7gm7ZrhbEldjKPwVytb4sEOp0f6X63Z9x
 6qYXtEdUyweeQ56tCYHz4w9w5FUuWkD/NTC1xF9Vx3l4nMoFzkbJkF27s/mR2SX3O8B9
 +IFuKcQVrJbJwbqSMvZbFuZde7ZPzwAdeZH+dWN0S6egHVtikg5VOchQDHLdcJPDNJTw
 dO4SHfmPGzRQWhf6J8Ia/ut2EfTPAqQ4de5CJkY9LzLBcWv2huSi4hb9GkTsU2pmWQnw
 i+0w==
X-Gm-Message-State: AOAM531/POBPF/Ok1PuT1W616Q/7Dz9GmpyovgFgDrS7vWsc+7PG6kgV
 cDgxVH3n1utuCPDpVU7oOjQ=
X-Google-Smtp-Source: ABdhPJzVZOxaqa4rOIBuNOJ16+Fs8Yo9wAX1LGpX1LvoNxWW9usTCmDPsOmECv7sgLYyJ9usuK16+A==
X-Received: by 2002:a05:6402:40c9:: with SMTP id
 z9mr14257013edb.119.1644831285061; 
 Mon, 14 Feb 2022 01:34:45 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/amdgpu: remove GTT accounting v2
Date: Mon, 14 Feb 2022 10:34:34 +0100
Message-Id: <20220214093439.2989-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
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

v2: fix size checking as well

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 49 +++++----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  8 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 -
 4 files changed, 16 insertions(+), 45 deletions(-)

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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5661b82d84d4..514754142f69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -451,7 +451,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
 		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
 
-		if (size < (man->size << PAGE_SHIFT))
+		if (size < man->size)
 			return true;
 		else
 			goto fail;
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

