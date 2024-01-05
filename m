Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4E9825A75
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A434F10E67E;
	Fri,  5 Jan 2024 18:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BDF10E67E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480430;
 bh=QuYX1ZbeqzzlgphkIZfy751IRqx3iZbH6NUvd1ayS2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2u20bBo2hSpc1THMfYB6JNEoJgDpKys+lBggfjoSpFj7t7nm01B0QgElOM1/8apZk
 heSFvZSGfDyeK4oBTragO5Jjg+1pj8WfjyW8MoP37fsgqcday1bN7HTIiNY4yMWiGU
 ZmyV2Nse5W+lS1k8OnULetaokn82kfZ5YFD+TOPSmeglq/8xrE3F/PKfT5kOSQ7c/R
 Lp9LXu9NfDcabVPGgHe2KFeTjP2Xhp90zai1qmWDVmRzsSY5VSLj4QWduFvGDSviGB
 kgj6RFK7hUo+V22r6Mo/tJ0FaVHmWQjXa5AYICEd+hCH+vl1ksPleUzeqf7Bg33VrR
 3mrt5q4QwCrFg==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C4A6F3782046;
 Fri,  5 Jan 2024 18:47:08 +0000 (UTC)
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
Subject: [PATCH v19 16/30] drm/lima: Explicitly get and put drm-shmem pages
Date: Fri,  5 Jan 2024 21:46:10 +0300
Message-ID: <20240105184624.508603-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
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
 drivers/gpu/drm/lima/lima_gem.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 2a97aa85416b..9c3e34a7fbed 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -115,6 +115,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 		return PTR_ERR(shmem);
 
 	obj = &shmem->base;
+	bo = to_lima_bo(obj);
 
 	/* Mali Utgard GPU can only support 32bit address space */
 	mask = mapping_gfp_mask(obj->filp->f_mapping);
@@ -123,13 +124,17 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	mapping_set_gfp_mask(obj->filp->f_mapping, mask);
 
 	if (is_heap) {
-		bo = to_lima_bo(obj);
 		err = lima_heap_alloc(bo, NULL);
 		if (err)
 			goto out;
 	} else {
-		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(shmem);
+		struct sg_table *sgt;
 
+		err = drm_gem_shmem_get_pages(shmem);
+		if (err)
+			goto out;
+
+		sgt = drm_gem_shmem_get_pages_sgt(shmem);
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
 			goto out;
@@ -139,6 +144,9 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 	err = drm_gem_handle_create(file, obj, handle);
 
 out:
+	if (err && refcount_read(&bo->base.pages_use_count))
+		drm_gem_shmem_put_pages(shmem);
+
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_put(obj);
 
@@ -152,6 +160,9 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	if (!list_empty(&bo->va))
 		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
 
+	if (refcount_read(&bo->base.pages_use_count))
+		drm_gem_shmem_put_pages(&bo->base);
+
 	drm_gem_shmem_free(&bo->base);
 }
 
-- 
2.43.0

