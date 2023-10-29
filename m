Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C582F7DB033
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15A110E1E3;
	Sun, 29 Oct 2023 23:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2DF10E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:49 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 90B23660739F;
 Sun, 29 Oct 2023 23:02:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620567;
 bh=XINqki645Wc8g9EPZb23p5o68bDFjXO7qBHmFhDTndY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQKrB9boVoagum6YgnbTzBhRm3ekdhY/16TvUkNv4aHUd0nuWxU+91YM+fD+40llK
 sPzE3053tFMrnXUlCDYAiRd8abe6WmXp3Am7S+uUwj4xkH4vZr6nQ+6lcDbliYRSxj
 1euNzz1JxaaMcCPRv0qrGd2LxrookCAeGvorDptQGuUww/iovif5TJOQ0ud+xZAdXI
 XcZu3R6gW6CkQZusoUdoHv/+oqd3XW+11GMASCYb5CiSfcMaBpeM2h/koctXCSbbGa
 JGatgPqYy+csPA6o+7tYbJzLGd74cpvPHclrOJ7zp9b6oyXmsWuM/RHiY1ThBvWgsY
 OO3kR5vahmowA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v18 14/26] drm/lima: Explicitly get and put drm-shmem pages
Date: Mon, 30 Oct 2023 02:01:53 +0300
Message-ID: <20231029230205.93277-15-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To simplify the drm-shmem refcnt handling, we're moving away from
the implicit get_pages() that is used by get_pages_sgt(). From now on
drivers will have to pin pages while they use sgt. Lima driver doesn't
have shrinker, hence pages are pinned and sgt is valid as long as pages'
use-count > 0.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/lima/lima_gem.c | 18 ++++++++++++++++--
 drivers/gpu/drm/lima/lima_gem.h |  1 +
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 988e74f67465..d255f5775dac 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -46,6 +46,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 			return -ENOMEM;
 		}
 
+		bo->put_pages = true;
 		bo->base.pages = pages;
 		refcount_set(&bo->base.pages_use_count, 1);
 
@@ -115,6 +116,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 		return PTR_ERR(shmem);
 
 	obj = &shmem->base;
+	bo = to_lima_bo(obj);
 
 	/* Mali Utgard GPU can only support 32bit address space */
 	mask = mapping_gfp_mask(obj->filp->f_mapping);
@@ -123,13 +125,19 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
 
 	if (is_heap) {
-		bo = to_lima_bo(obj);
 		err = lima_heap_alloc(bo, NULL);
 		if (err)
 			goto out;
 	} else {
-		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(shmem);
+		struct sg_table *sgt;
+
+		err = drm_gem_shmem_get_pages(shmem);
+		if (err)
+			goto out;
+
+		bo->put_pages = true;
 
+		sgt = drm_gem_shmem_get_pages_sgt(shmem);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto out;
@@ -139,6 +147,9 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	err = drm_gem_handle_create(file, obj, handle);
 
 out:
+	if (err && bo->put_pages)
+		drm_gem_shmem_put_pages(shmem);
+
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_put(obj);
 
@@ -152,6 +163,9 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	if (!list_empty(&bo->va))
 		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
 
+	if (bo->put_pages)
+		drm_gem_shmem_put_pages(&bo->base);
+
 	drm_gem_shmem_free(&bo->base);
 }
 
diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
index ccea06142f4b..dc5a6d465c80 100644
--- a/drivers/gpu/drm/lima/lima_gem.h
+++ b/drivers/gpu/drm/lima/lima_gem.h
@@ -16,6 +16,7 @@ struct lima_bo {
 	struct list_head va;
 
 	size_t heap_size;
+	bool put_pages;
 };
 
 static inline struct lima_bo *
-- 
2.41.0

