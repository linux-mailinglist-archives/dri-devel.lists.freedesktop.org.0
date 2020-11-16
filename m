Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264C62B51DB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914AF89C37;
	Mon, 16 Nov 2020 20:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F4A89BC2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 20:04:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83B87AEAA;
 Mon, 16 Nov 2020 20:04:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, christian.koenig@amd.com
Subject: [PATCH 03/10] drm/client: Depend on GEM object kmap ref-counting
Date: Mon, 16 Nov 2020 21:04:30 +0100
Message-Id: <20201116200437.17977-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116200437.17977-1-tzimmermann@suse.de>
References: <20201116200437.17977-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM client's vmap/vunmap functions don't allow for multiple vmap
operations. Calling drm_client_buffer_vmap() twice returns the same
mapping, then calling drm_client_buffer_vunmap() twice already unmaps
on the first call. This leads to unbalanced vmap refcounts. Fix this
by calling drm_gem_vmap() unconditionally in drm_client_buffer_vmap().

All drivers that support DRM clients have to implement correct ref-
counting for their vmap operations, or not vunmap at all. This is the
case for drivers that use CMA, SHMEM and VRAM helpers, and QXL. Other
drivers are not affected.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index fe573acf1067..ce45e380f4a2 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -314,9 +314,6 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map
 	struct dma_buf_map *map = &buffer->map;
 	int ret;
 
-	if (dma_buf_map_is_set(map))
-		goto out;
-
 	/*
 	 * FIXME: The dependency on GEM here isn't required, we could
 	 * convert the driver handle to a dma-buf instead and use the
@@ -329,7 +326,6 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map
 	if (ret)
 		return ret;
 
-out:
 	*map_copy = *map;
 
 	return 0;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
