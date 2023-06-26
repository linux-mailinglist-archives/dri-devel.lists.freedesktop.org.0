Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064073DE65
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526D210E1EC;
	Mon, 26 Jun 2023 12:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87B710E1E8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:57 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 812866607154;
 Mon, 26 Jun 2023 13:02:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780975;
 bh=FtIPjBHK+0db5j7gIdEtN2CKYsvW4d1S38hd5oN/+Es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LyKEljStQ4ZOrmmMmq2zHPmH8G88kXu0jZu9kWISCXbryLsVk3ctb+It5zAB5qPt+
 Mm8X7gcd0MqfvERbwGVPDDTdYl0ZO5/5yhcTQSe05Ho84CHJPnDJUoN3P0ktxoRgfA
 yAAPN+bmO1W1IGyxzhN+7ULi5vV4dLKZSOFZKRsQWrg2xEXoBkFLMaWSEItOWEYwXe
 Bjo6XnlnPqlRkYcGPLLVVmapq+QudL792DOL2322LJVBpWCFPyGNf+s9iCn/lVZv7y
 g8q5U1zbNtxm5w+ib/E4cOULJoRH8HEhqTq1jnb91uR/zQCrC7Xj3I40YuDMYVjbfo
 uziZTl0gJg4jg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/shmem-helper: Clarify drm_gem_shmem_v[un]map() usage
Date: Mon, 26 Jun 2023 14:02:47 +0200
Message-ID: <20230626120247.1337962-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626120247.1337962-1-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers are not supposed to call these functions directly when they
want to map/unamp a GEM in kernel space. They should instead go
through drm_gem_v[un]map[_unlocked]() that will forward the request
to drm_gem_object_funcs::v[un]map() which in turn will call
drm_gem_shmem_v[un]map().

Let's clarify that in the functions doc.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 2b8a32f6b656..daada172fe70 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -279,6 +279,11 @@ EXPORT_SYMBOL(drm_gem_shmem_unpin);
  *
  * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
  *
+ * This function is not meant to be used directly, but rather used as a helper
+ * to implement driver-specific versions of drm_gem_object_funcs::vmap(). If
+ * you need to vmap() a GEM object from your driver, use
+ * drm_gem_vmap[_unlocked]() instead.
+ *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
@@ -348,6 +353,11 @@ EXPORT_SYMBOL(drm_gem_shmem_vmap);
  *
  * This function hides the differences between dma-buf imported and natively
  * allocated objects.
+ *
+ * This function is not meant to be used directly, but rather used as a helper
+ * to implement driver-specific versions of drm_gem_object_funcs::vunmap(). If
+ * you need to vunmap() a GEM object from your driver, use
+ * drm_gem_vunmap[_unlocked]() instead.
  */
 void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 			  struct iosys_map *map)
-- 
2.41.0

