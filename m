Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA574B465E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2228310E2AB;
	Mon, 14 Feb 2022 09:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422BE10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id b14so1573790ede.9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+husCGohDqsG8B115jpopx22ukRwNHhKb8tUOXM5vR4=;
 b=chVw/yWr7pYJYxK57QxIkpMpxpzIqUTevstLudhf8IqujdLoSIcqfHQdT9H89ow15W
 tMfrD62OgNd+AoGSucbD8YCFQUQbtT0V7Q35qr/HS+XOzsLLmntiFR8eLAuvTg3uJ5Se
 G7tFhhkpsG1hB8VSu9KaMEQuwCbR3Ah7ivZqwWiPVMwxU18ddLLGbOjwgO9qkHsmLymR
 HINL9IIDIoG4O8UhdFrnzt3MNsUe6kdudwwx++5QRTSOHlCPkonoevdemyDo/WYlR+/H
 T/hQmu9jRvJJC933M61IeXvZmoMqd0mNVrI7GR0hHEAS6uGChveoetzgORXNhcEhYO7c
 4REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+husCGohDqsG8B115jpopx22ukRwNHhKb8tUOXM5vR4=;
 b=MI/Ttb7CXb6cEhHo8JSFezx8UGwc5Ivno8X2pfv0qE8wzgK89+pUpEgikuv7X0Hc0g
 L+wM6tKOzK6eoHEj2c6KkgC1GnGwHUjRCzgdLUZ8iOY0EfWLI5G15zBYUWodbslSk68h
 pKF0Ba+eQAXfNDuS/L+qJ3kxY9pi2P+sU54/WgjTkvs1lQb8G6XrtD48hMbXe+xYSvOh
 NyrsVUwfdUIApkWd4Iialy7l+ZscCBnJYGXFWB1JJ3tgkVdI55bUj8fJUDCSDS9LwQ0B
 bo9MbuN/xcUl3NgQtdFVGLkh/CPVZ3g+zmaJxanHVDukeWEnSVg9Bp3VB3Tm05UN11W5
 dZcw==
X-Gm-Message-State: AOAM530rrd9Tgvupmdh0S2/jQtiWd09XQBx5uFWWtBRdzfWvlrdX6k2t
 NlDyg/lwoxvachMEASQq7WY=
X-Google-Smtp-Source: ABdhPJyUR5jW2+82ZPLiAAwLF62HjV+6rIdV9GURvplCegeQ6Oi2GvulewUas7pimy1p88S/THAq3Q==
X-Received: by 2002:aa7:d790:: with SMTP id s16mr9187618edq.53.1644831285861; 
 Mon, 14 Feb 2022 01:34:45 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:45 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/amdgpu: remove PL_PREEMPT accounting
Date: Mon, 14 Feb 2022 10:34:35 +0100
Message-Id: <20220214093439.2989-7-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c   | 62 ++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  7 +--
 2 files changed, 6 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
index 0d85c2096ab5..e8adfd0a570a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
@@ -25,12 +25,6 @@
 
 #include "amdgpu.h"
 
-static inline struct amdgpu_preempt_mgr *
-to_preempt_mgr(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct amdgpu_preempt_mgr, manager);
-}
-
 /**
  * DOC: mem_info_preempt_used
  *
@@ -45,10 +39,9 @@ static ssize_t mem_info_preempt_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
-	struct ttm_resource_manager *man;
+	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
 
-	man = ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_PREEMPT);
-	return sysfs_emit(buf, "%llu\n", amdgpu_preempt_mgr_usage(man));
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
 }
 
 static DEVICE_ATTR_RO(mem_info_preempt_used);
@@ -68,16 +61,12 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
 				  const struct ttm_place *place,
 				  struct ttm_resource **res)
 {
-	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
-
 	*res = kzalloc(sizeof(**res), GFP_KERNEL);
 	if (!*res)
 		return -ENOMEM;
 
 	ttm_resource_init(tbo, place, *res);
 	(*res)->start = AMDGPU_BO_INVALID_OFFSET;
-
-	atomic64_add((*res)->num_pages, &mgr->used);
 	return 0;
 }
 
@@ -92,49 +81,13 @@ static int amdgpu_preempt_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_preempt_mgr_del(struct ttm_resource_manager *man,
 				   struct ttm_resource *res)
 {
-	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
-
-	atomic64_sub(res->num_pages, &mgr->used);
 	ttm_resource_fini(man, res);
 	kfree(res);
 }
 
-/**
- * amdgpu_preempt_mgr_usage - return usage of PREEMPT domain
- *
- * @man: TTM memory type manager
- *
- * Return how many bytes are used in the GTT domain
- */
-uint64_t amdgpu_preempt_mgr_usage(struct ttm_resource_manager *man)
-{
-	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
-	s64 result = atomic64_read(&mgr->used);
-
-	return (result > 0 ? result : 0) * PAGE_SIZE;
-}
-
-/**
- * amdgpu_preempt_mgr_debug - dump VRAM table
- *
- * @man: TTM memory type manager
- * @printer: DRM printer to use
- *
- * Dump the table content using printk.
- */
-static void amdgpu_preempt_mgr_debug(struct ttm_resource_manager *man,
-				     struct drm_printer *printer)
-{
-	struct amdgpu_preempt_mgr *mgr = to_preempt_mgr(man);
-
-	drm_printf(printer, "man size:%llu pages, preempt used:%lld pages\n",
-		   man->size, (u64)atomic64_read(&mgr->used));
-}
-
 static const struct ttm_resource_manager_func amdgpu_preempt_mgr_func = {
 	.alloc = amdgpu_preempt_mgr_new,
 	.free = amdgpu_preempt_mgr_del,
-	.debug = amdgpu_preempt_mgr_debug
 };
 
 /**
@@ -146,8 +99,7 @@ static const struct ttm_resource_manager_func amdgpu_preempt_mgr_func = {
  */
 int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 {
-	struct amdgpu_preempt_mgr *mgr = &adev->mman.preempt_mgr;
-	struct ttm_resource_manager *man = &mgr->manager;
+	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
 	int ret;
 
 	man->use_tt = true;
@@ -155,16 +107,13 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
 
-	atomic64_set(&mgr->used, 0);
-
 	ret = device_create_file(adev->dev, &dev_attr_mem_info_preempt_used);
 	if (ret) {
 		DRM_ERROR("Failed to create device file mem_info_preempt_used\n");
 		return ret;
 	}
 
-	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT,
-			       &mgr->manager);
+	ttm_set_driver_manager(&adev->mman.bdev, AMDGPU_PL_PREEMPT, man);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
@@ -179,8 +128,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
  */
 void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev)
 {
-	struct amdgpu_preempt_mgr *mgr = &adev->mman.preempt_mgr;
-	struct ttm_resource_manager *man = &mgr->manager;
+	struct ttm_resource_manager *man = &adev->mman.preempt_mgr;
 	int ret;
 
 	ttm_resource_manager_set_used(man, false);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 120b69ec9885..4e8577dad16a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -54,11 +54,6 @@ struct amdgpu_gtt_mgr {
 	spinlock_t lock;
 };
 
-struct amdgpu_preempt_mgr {
-	struct ttm_resource_manager manager;
-	atomic64_t used;
-};
-
 struct amdgpu_mman {
 	struct ttm_device		bdev;
 	bool				initialized;
@@ -75,7 +70,7 @@ struct amdgpu_mman {
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
-	struct amdgpu_preempt_mgr preempt_mgr;
+	struct ttm_resource_manager preempt_mgr;
 
 	uint64_t		stolen_vga_size;
 	struct amdgpu_bo	*stolen_vga_memory;
-- 
2.25.1

