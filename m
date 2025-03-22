Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB35EA6CCB1
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE7C10E188;
	Sat, 22 Mar 2025 21:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LUe+QSKk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CAA10E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678973; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=edhGsgPmgntLYCFaQiqxGvBfQx7WnUBG2hldBgS3YznZI31TszLQzqEcfsecU6rVae+ppjhzsntO6MS4TscJhmB1aZlYsm0OH6UDYU49iFu2KypgVDAJ51Yn7bkbgKedq1LMsrASPdr3MK8vNnr2h5IB0l3DqWeoBrOdokETwbA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678973;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1dcY8k5g4fF0UWLqOc8Uf+7VkNlVV5V21QJxksyUkCk=; 
 b=HPWbDWGZAGu0hMs6wjzV9EboKn6rdj/FBZ6zLGvfo6IO7VBWxXdzaNDcn2n6DER7LGkw0IsTLgBMW7gDPa7g2J6D8dKIBEjdnsTJ4Ugg57/SIS+g0acRhIupO/AaEzV5tUlew2fr2uFJGSlcoK8gAOBl35FoOopYKKuHGnywzyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678973; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=1dcY8k5g4fF0UWLqOc8Uf+7VkNlVV5V21QJxksyUkCk=;
 b=LUe+QSKk2nUd75NePop6N2yuJp2ThVLy5PNQ9afWa+727iFm7A0Usxw1bgFKR/vY
 rdrLIiOMhc6CTqaWJTBWEGRk8GhEZ2rI6q0b1n2M6yDOzxFbkbOf2GlHx/6j3Vr4MZo
 9bncoUC5FOvuMdQ3nY4b5ShhAsT1frnW1MP8tIys=
Received: by mx.zohomail.com with SMTPS id 1742678972553562.2070710536797;
 Sat, 22 Mar 2025 14:29:32 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 07/10] drm/shmem-helper: Add and use pages_pin_count
Date: Sun, 23 Mar 2025 00:26:05 +0300
Message-ID: <20250322212608.40511-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
 drivers/gpu/drm/drm_gem_shmem_helper.c | 16 +++++++++++++++-
 include/drm/drm_gem_shmem_helper.h     | 11 +++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 277e792a0c5c..d338b36f4eaa 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -177,6 +177,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			drm_gem_shmem_put_pages_locked(shmem);
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_pin_count));
 
 		dma_resv_unlock(shmem->base.resv);
 	}
@@ -257,7 +258,12 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(shmem->base.dev, drm_gem_is_imported(&shmem->base));
 
+	if (refcount_inc_not_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = drm_gem_shmem_get_pages_locked(shmem);
+	if (!ret)
+		refcount_set(&shmem->pages_pin_count, 1);
 
 	return ret;
 }
@@ -267,7 +273,8 @@ void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	drm_gem_shmem_put_pages_locked(shmem);
+	if (refcount_dec_and_test(&shmem->pages_pin_count))
+		drm_gem_shmem_put_pages_locked(shmem);
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin_locked);
 
@@ -288,6 +295,9 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
+	if (refcount_inc_not_zero(&shmem->pages_pin_count))
+		return 0;
+
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ret;
@@ -311,6 +321,9 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
+	if (refcount_dec_not_one(&shmem->pages_pin_count))
+		return;
+
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_unpin_locked(shmem);
 	dma_resv_unlock(shmem->base.resv);
@@ -660,6 +673,7 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 	if (drm_gem_is_imported(&shmem->base))
 		return;
 
+	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&shmem->pages_pin_count));
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 0609e336479d..d411215fe494 100644
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
2.49.0

