Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1D8825A6B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C60410E675;
	Fri,  5 Jan 2024 18:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C9F10E673
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 18:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704480415;
 bh=4r4O0Txfi6sopJfIVmmSRlOl7CynM2fVl56/NWlOz5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUKmatPYuxSLewnyK0wnLHgKnMj/IflthxaD4ptKKDHilcL8uZyPR/xzePklx18st
 GR87LT57II64QsIW767D76QP8T8WVqmuijhRMXOC3Usx7kZQiax2/ee2baw8IeoAHY
 TU+T2K/xp2F/d8kT2AIFeTYOpV0QKx6aXV9iLo9qVB005R3PV+eA7vwt+xRtrg0h83
 SIopLsPwN7iYLLyEltax6KzukYL6/Ct5mFSWqTIYpupFGhLk04re3USQNiI1UCg10J
 HGR2iX3OvNj5Y6mWz74uTWF9hMykFXqSPuDF8OMZxVT0GZKnTO7nPKPLklU8qAygTm
 He7O0zVAbn0nQ==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 76A473782043;
 Fri,  5 Jan 2024 18:46:54 +0000 (UTC)
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
Subject: [PATCH v19 07/30] drm/shmem-helper: Add and use pages_pin_count
Date: Fri,  5 Jan 2024 21:46:01 +0300
Message-ID: <20240105184624.508603-8-dmitry.osipenko@collabora.com>
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

Add separate pages_pin_count for tracking of whether drm-shmem pages are
moveable or not. With the addition of memory shrinker support to drm-shmem,
the pages_use_count will no longer determine whether pages are hard-pinned
in memory, but whether pages exist and are soft-pinned (and could be swapped
out). The pages_pin_count > 1 will hard-pin pages in memory.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 25 +++++++++++++++++--------
 include/drm/drm_gem_shmem_helper.h     | 11 +++++++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 1f0a66386415..55b9dd3d4b18 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -156,6 +156,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			drm_gem_shmem_put_pages_locked(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -234,18 +235,16 @@ static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
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
@@ -263,6 +262,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
+	if (refcount_inc_not_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
@@ -286,8 +288,14 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
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
@@ -632,6 +640,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (shmem->base.import_attach)
 		return;
 
+	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 9e83212becbb..c708a9f45cbd 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -39,6 +39,17 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int pages_use_count;
 
+	/**
+	 * @pages_pin_count:
+	 *
+	 * Reference count on the pinned pages table.
+	 *
+	 * Pages are hard-pinned and reside in memory if count
+	 * greater than zero. Otherwise, when count is zero, the pages are
+	 * allowed to be evicted and purged by memory shrinker.
+	 */
+	refcount_t pages_pin_count;
+
 	/**
 	 * @madv: State for madvise
 	 *
-- 
2.43.0

