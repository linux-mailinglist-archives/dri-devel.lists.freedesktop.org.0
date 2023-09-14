Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC77A11BB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D60910E5AC;
	Thu, 14 Sep 2023 23:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1598210E2B6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:29:07 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 723CF6607346;
 Fri, 15 Sep 2023 00:29:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694734145;
 bh=+WahLq2KPu3N5dEfC75pioBsE8NOud04/kmdVqiq2D0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GkYtGMcoGjBdC1njqnU7b0hRj4d1iM2gO9LPLH1wXIY0D+m+UIAxPG9045GhHrcIN
 27jlC25R/AkUgwEzK5uO9hJFOmvV5HG+iLmLJH15XlTbUMHR6L5QCKtvfo12k6HBZL
 EPX8oHl4XNMoCa17uitl3RcYNSrFsji7kCA9DHffLt242F6qPJyZXfhJAaKPiYnBv9
 KdnIgPHACW0AYoe8T4KzAZbB2nlvq7mbFWyiS3wupPsIvWQWuVxb/y1RHvL+VXUBZa
 mw25WxE7bu/0M53moE9sQ4kamVQkJHacAg0Dl9pQRqDYi/Yfe/uvTJFdI0Q/GbG8Tc
 qBgFP5HrmSowQ==
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
Subject: [PATCH v17 06/18] drm/shmem-helper: Add and use pages_pin_count
Date: Fri, 15 Sep 2023 02:27:09 +0300
Message-ID: <20230914232721.408581-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
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

Add separate pages_pin_count for tracking of whether drm-shmem pages are
moveable or not. With the addition of memory shrinker support to drm-shmem,
the pages_use_count will no longer determine whether pages are hard-pinned
in memory, but whether pages exist and are soft-pinned (and could be swapped
out). The pages_pin_count > 1 will hard-pin pages in memory.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++++++--------
 include/drm/drm_gem_shmem_helper.h     | 10 ++++++++++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 2cc0601865f6..286f0ca51309 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -234,18 +234,16 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
+	if (refcount_inc_not_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = drm_gem_shmem_get_pages_locked(shmem);
+	if (!ret)
+		refcount_set(&shmem->pages_pin_count, 1);
 
 	return ret;
 }
 
-static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
-{
-	dma_resv_assert_held(shmem->base.resv);
-
-	drm_gem_shmem_put_pages_locked(shmem);
-}
-
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
  * @shmem: shmem GEM object
@@ -263,6 +261,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (refcount_inc_not_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
@@ -286,8 +287,14 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (refcount_dec_not_one(&shmem->pages_pin_count))
+		return;
+
 	dma_resv_lock(shmem->base.resv, NULL);
-	drm_gem_shmem_unpin_locked(shmem);
+
+	if (refcount_dec_and_test(&shmem->pages_pin_count))
+		drm_gem_shmem_put_pages_locked(shmem);
+
 	dma_resv_unlock(shmem->base.resv);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_unpin);
@@ -632,6 +639,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (shmem->base.import_attach)
 		return;
 
+	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 6ee4a4046980..268b3127d150 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -39,6 +39,16 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 * The pages allowed to be evicted and purged by memory
+	 * shrinker only when the count is zero, otherwise pages
+	 * are hard-pinned in memory.
+	 */
+	refcount_t pages_pin_count;
+
 	/**
 	 * @madv: State for madvise
 	 *
-- 
2.41.0

