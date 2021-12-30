Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D9481B7C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 11:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D2610E356;
	Thu, 30 Dec 2021 10:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5D010E356
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1640861562; bh=AmXTcCILumk6XLYdDWeiBkDgnffIvploJE1VZfTzmNY=;
 h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=vjIXrK7lX6CT6CFxcJuR58S8CJlWdGXrwtU48GnDmKDbdQ0d2ZUzjwfc5l8yjUJ4J
 JPJhJn2yW1fQuGxbYaoK3lYM/qZ1tYwMUzycH7pVWXA3DdGU2irBb2dpVo1pdrrUWS
 SHRXv93JhI91zCgjjcwPPaLfvjcehLBoNTYoFg0A=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Thu, 30 Dec 2021 11:52:42 +0100 (CET)
X-EA-Auth: AOblEUObU6DVhylVhPXBs+04cfCuu4LrsyqLbNDZWMipIAaFFCijjtcK8vQhCjWYFIPug3X/AQMJlbt1nJgMeDpnZduANJbm
Date: Thu, 30 Dec 2021 11:52:39 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core, files
 drm_{b,c}*.c
Message-ID: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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


DRM_DEBUG_* and DRM_* log calls are deprecated.
Change them to drm_dbg_* / drm_{err,info,...} calls in drm core
files.

To avoid making a very big patch, this change is split in
smaller patches. This one includes drm_{b,c}*.c

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_blend.c          |   6 +-
 drivers/gpu/drm/drm_bridge.c         |   6 +-
 drivers/gpu/drm/drm_bufs.c           | 116 +++++++++++++--------------
 drivers/gpu/drm/drm_client_modeset.c | 109 +++++++++++++------------
 drivers/gpu/drm/drm_color_mgmt.c     |   6 +-
 drivers/gpu/drm/drm_connector.c      |  37 +++++----
 drivers/gpu/drm/drm_context.c        |  18 ++---
 drivers/gpu/drm/drm_crtc.c           |  40 ++++-----
 drivers/gpu/drm/drm_crtc_helper.c    |  61 +++++++-------
 9 files changed, 211 insertions(+), 188 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index ec37cbfabb50..4a988815f998 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -450,7 +450,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
 	int i, n = 0;
 	int ret = 0;
 
-	DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos values\n",
+	drm_dbg_atomic(dev, "[CRTC:%d:%s] calculating normalized zpos values\n",
 			 crtc->base.id, crtc->name);
 
 	states = kmalloc_array(total_planes, sizeof(*states), GFP_KERNEL);
@@ -469,7 +469,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
 			goto done;
 		}
 		states[n++] = plane_state;
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value %d\n",
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] processing zpos value %d\n",
 				 plane->base.id, plane->name,
 				 plane_state->zpos);
 	}
@@ -480,7 +480,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
 		plane = states[i]->plane;
 
 		states[i]->normalized_zpos = i;
-		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value %d\n",
+		drm_dbg_atomic(dev, "[PLANE:%d:%s] normalized zpos value %d\n",
 				 plane->base.id, plane->name, i);
 	}
 	crtc_state->zpos_changed = true;
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..b108377b4b40 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -288,10 +288,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	list_del(&bridge->chain_node);
 
 #ifdef CONFIG_OF
-	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
+	drm_err(encoder->dev,
+		  "failed to attach bridge %pOF to encoder %s: %d\n",
 		  bridge->of_node, encoder->name, ret);
 #else
-	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
+	drm_err(encoder->dev,
+		  "failed to attach bridge to encoder %s: %d\n",
 		  encoder->name, ret);
 #endif
 
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index fcca21e8efac..dd8e100e120c 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -171,8 +171,8 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		kfree(map);
 		return -EINVAL;
 	}
-	DRM_DEBUG("offset = 0x%08llx, size = 0x%08lx, type = %d\n",
-		  (unsigned long long)map->offset, map->size, map->type);
+	drm_dev_dbg(dev, "offset = 0x%08llx, size = 0x%08lx, type = %d\n",
+		    (unsigned long long)map->offset, map->size, map->type);
 
 	/* page-align _DRM_SHM maps. They are allocated here so there is no security
 	 * hole created by that and it works around various broken drivers that use
@@ -205,10 +205,9 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		list = drm_find_matching_map(dev, map);
 		if (list != NULL) {
 			if (list->map->size != map->size) {
-				DRM_DEBUG("Matching maps of type %d with "
-					  "mismatched sizes, (%ld vs %ld)\n",
-					  map->type, map->size,
-					  list->map->size);
+				drm_dev_dbg(dev,
+					    "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
+					    map->type, map->size, list->map->size);
 				list->map->size = map->size;
 			}
 
@@ -239,9 +238,9 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 		list = drm_find_matching_map(dev, map);
 		if (list != NULL) {
 			if (list->map->size != map->size) {
-				DRM_DEBUG("Matching maps of type %d with "
-					  "mismatched sizes, (%ld vs %ld)\n",
-					  map->type, map->size, list->map->size);
+				drm_dev_dbg(dev,
+					    "Matching maps of type %d with mismatched sizes, (%ld vs %ld)\n",
+					    map->type, map->size, list->map->size);
 				list->map->size = map->size;
 			}
 
@@ -250,7 +249,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 			return 0;
 		}
 		map->handle = vmalloc_user(map->size);
-		DRM_DEBUG("%lu %d %p\n",
+		drm_dev_dbg(dev, "%lu %d %p\n",
 			  map->size, order_base_2(map->size), map->handle);
 		if (!map->handle) {
 			kfree(map);
@@ -308,7 +307,7 @@ static int drm_addmap_core(struct drm_device *dev, resource_size_t offset,
 			kfree(map);
 			return -EPERM;
 		}
-		DRM_DEBUG("AGP offset = 0x%08llx, size = 0x%08lx\n",
+		drm_dev_dbg(dev, "AGP offset = 0x%08llx, size = 0x%08lx\n",
 			  (unsigned long long)map->offset, map->size);
 
 		break;
@@ -749,13 +748,13 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 	byte_count = 0;
 	agp_offset = dev->agp->base + request->agp_start;
 
-	DRM_DEBUG("count:      %d\n", count);
-	DRM_DEBUG("order:      %d\n", order);
-	DRM_DEBUG("size:       %d\n", size);
-	DRM_DEBUG("agp_offset: %lx\n", agp_offset);
-	DRM_DEBUG("alignment:  %d\n", alignment);
-	DRM_DEBUG("page_order: %d\n", page_order);
-	DRM_DEBUG("total:      %d\n", total);
+	drm_dev_dbg(dev, "count:      %d\n", count);
+	drm_dev_dbg(dev, "order:      %d\n", order);
+	drm_dev_dbg(dev, "size:       %d\n", size);
+	drm_dev_dbg(dev, "agp_offset: %lx\n", agp_offset);
+	drm_dev_dbg(dev, "alignment:  %d\n", alignment);
+	drm_dev_dbg(dev, "page_order: %d\n", page_order);
+	drm_dev_dbg(dev, "total:      %d\n", total);
 
 	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 		return -EINVAL;
@@ -770,7 +769,7 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 		}
 	}
 	if (!list_empty(&dev->agp->memory) && !valid) {
-		DRM_DEBUG("zone invalid\n");
+		drm_dev_dbg(dev, "zone invalid\n");
 		return -EINVAL;
 	}
 	spin_lock(&dev->buf_lock);
@@ -833,14 +832,14 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 			return -ENOMEM;
 		}
 
-		DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
+		drm_dev_dbg(dev, "buffer %d @ %p\n", entry->buf_count, buf->address);
 
 		offset += alignment;
 		entry->buf_count++;
 		byte_count += PAGE_SIZE << page_order;
 	}
 
-	DRM_DEBUG("byte_count: %d\n", byte_count);
+	drm_dev_dbg(dev, "byte_count: %d\n", byte_count);
 
 	temp_buflist = krealloc(dma->buflist,
 				(dma->buf_count + entry->buf_count) *
@@ -863,8 +862,8 @@ int drm_legacy_addbufs_agp(struct drm_device *dev,
 	dma->page_count += byte_count >> PAGE_SHIFT;
 	dma->byte_count += byte_count;
 
-	DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
-	DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
+	drm_dev_dbg(dev, "dma->buf_count : %d\n", dma->buf_count);
+	drm_dev_dbg(dev, "entry->buf_count : %d\n", entry->buf_count);
 
 	mutex_unlock(&dev->struct_mutex);
 
@@ -912,8 +911,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 	order = order_base_2(request->size);
 	size = 1 << order;
 
-	DRM_DEBUG("count=%d, size=%d (%d), order=%d\n",
-		  request->count, request->size, size, order);
+	drm_dev_dbg(dev, "count=%d, size=%d (%d), order=%d\n",
+		    request->count, request->size, size, order);
 
 	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 		return -EINVAL;
@@ -975,8 +974,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 	}
 	memcpy(temp_pagelist,
 	       dma->pagelist, dma->page_count * sizeof(*dma->pagelist));
-	DRM_DEBUG("pagelist: %d entries\n",
-		  dma->page_count + (count << page_order));
+	drm_dev_dbg(dev, "pagelist: %d entries\n",
+		    dma->page_count + (count << page_order));
 
 	entry->buf_size = size;
 	entry->page_order = page_order;
@@ -1015,9 +1014,9 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 		}
 		entry->seglist[entry->seg_count++] = dmah;
 		for (i = 0; i < (1 << page_order); i++) {
-			DRM_DEBUG("page %d @ 0x%08lx\n",
-				  dma->page_count + page_count,
-				  (unsigned long)dmah->vaddr + PAGE_SIZE * i);
+			drm_dev_dbg(dev, "page %d @ 0x%08lx\n",
+				    dma->page_count + page_count,
+				    (unsigned long)dmah->vaddr + PAGE_SIZE * i);
 			temp_pagelist[dma->page_count + page_count++]
 				= (unsigned long)dmah->vaddr + PAGE_SIZE * i;
 		}
@@ -1051,8 +1050,8 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
 				return -ENOMEM;
 			}
 
-			DRM_DEBUG("buffer %d @ %p\n",
-				  entry->buf_count, buf->address);
+			drm_dev_dbg(dev, "buffer %d @ %p\n",
+				    entry->buf_count, buf->address);
 		}
 		byte_count += PAGE_SIZE << page_order;
 	}
@@ -1140,13 +1139,13 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
 	byte_count = 0;
 	agp_offset = request->agp_start;
 
-	DRM_DEBUG("count:      %d\n", count);
-	DRM_DEBUG("order:      %d\n", order);
-	DRM_DEBUG("size:       %d\n", size);
-	DRM_DEBUG("agp_offset: %lu\n", agp_offset);
-	DRM_DEBUG("alignment:  %d\n", alignment);
-	DRM_DEBUG("page_order: %d\n", page_order);
-	DRM_DEBUG("total:      %d\n", total);
+	drm_dev_dbg(dev, "count:      %d\n", count);
+	drm_dev_dbg(dev, "order:      %d\n", order);
+	drm_dev_dbg(dev, "size:       %d\n", size);
+	drm_dev_dbg(dev, "agp_offset: %lu\n", agp_offset);
+	drm_dev_dbg(dev, "alignment:  %d\n", alignment);
+	drm_dev_dbg(dev, "page_order: %d\n", page_order);
+	drm_dev_dbg(dev, "total:      %d\n", total);
 
 	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 		return -EINVAL;
@@ -1212,14 +1211,15 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
 			return -ENOMEM;
 		}
 
-		DRM_DEBUG("buffer %d @ %p\n", entry->buf_count, buf->address);
+		drm_dev_dbg(dev, "buffer %d @ %p\n",
+			    entry->buf_count, buf->address);
 
 		offset += alignment;
 		entry->buf_count++;
 		byte_count += PAGE_SIZE << page_order;
 	}
 
-	DRM_DEBUG("byte_count: %d\n", byte_count);
+	drm_dev_dbg(dev, "byte_count: %d\n", byte_count);
 
 	temp_buflist = krealloc(dma->buflist,
 				(dma->buf_count + entry->buf_count) *
@@ -1242,8 +1242,8 @@ static int drm_legacy_addbufs_sg(struct drm_device *dev,
 	dma->page_count += byte_count >> PAGE_SHIFT;
 	dma->byte_count += byte_count;
 
-	DRM_DEBUG("dma->buf_count : %d\n", dma->buf_count);
-	DRM_DEBUG("entry->buf_count : %d\n", entry->buf_count);
+	drm_dev_dbg(dev, "dma->buf_count : %d\n", dma->buf_count);
+	drm_dev_dbg(dev, "entry->buf_count : %d\n", entry->buf_count);
 
 	mutex_unlock(&dev->struct_mutex);
 
@@ -1344,7 +1344,7 @@ int __drm_legacy_infobufs(struct drm_device *dev,
 			++count;
 	}
 
-	DRM_DEBUG("count = %d\n", count);
+	drm_dev_dbg(dev, "count = %d\n", count);
 
 	if (*p >= count) {
 		for (i = 0, count = 0; i < DRM_MAX_ORDER + 1; i++) {
@@ -1353,12 +1353,12 @@ int __drm_legacy_infobufs(struct drm_device *dev,
 			if (from->buf_count) {
 				if (f(data, count, from) < 0)
 					return -EFAULT;
-				DRM_DEBUG("%d %d %d %d %d\n",
-					  i,
-					  dma->bufs[i].buf_count,
-					  dma->bufs[i].buf_size,
-					  dma->bufs[i].low_mark,
-					  dma->bufs[i].high_mark);
+				drm_dev_dbg(dev, "%d %d %d %d %d\n",
+					    i,
+					    dma->bufs[i].buf_count,
+					    dma->bufs[i].buf_size,
+					    dma->bufs[i].low_mark,
+					    dma->bufs[i].high_mark);
 				++count;
 			}
 		}
@@ -1421,8 +1421,8 @@ int drm_legacy_markbufs(struct drm_device *dev, void *data,
 	if (!dma)
 		return -EINVAL;
 
-	DRM_DEBUG("%d, %d, %d\n",
-		  request->size, request->low_mark, request->high_mark);
+	drm_dev_dbg(dev, "%d, %d, %d\n",
+		    request->size, request->low_mark, request->high_mark);
 	order = order_base_2(request->size);
 	if (order < DRM_MIN_ORDER || order > DRM_MAX_ORDER)
 		return -EINVAL;
@@ -1469,20 +1469,20 @@ int drm_legacy_freebufs(struct drm_device *dev, void *data,
 	if (!dma)
 		return -EINVAL;
 
-	DRM_DEBUG("%d\n", request->count);
+	drm_dev_dbg(dev, "%d\n", request->count);
 	for (i = 0; i < request->count; i++) {
 		if (copy_from_user(&idx, &request->list[i], sizeof(idx)))
 			return -EFAULT;
 		if (idx < 0 || idx >= dma->buf_count) {
-			DRM_ERROR("Index %d (of %d max)\n",
-				  idx, dma->buf_count - 1);
+			drm_err(dev, "Index %d (of %d max)\n",
+				idx, dma->buf_count - 1);
 			return -EINVAL;
 		}
 		idx = array_index_nospec(idx, dma->buf_count);
 		buf = dma->buflist[idx];
 		if (buf->file_priv != file_priv) {
-			DRM_ERROR("Process %d freeing buffer not owned\n",
-				  task_pid_nr(current));
+			drm_err(dev, "Process %d freeing buffer not owned\n",
+				task_pid_nr(current));
 			return -EINVAL;
 		}
 		drm_legacy_free_buffer(dev, buf);
@@ -1569,7 +1569,7 @@ int __drm_legacy_mapbufs(struct drm_device *dev, void *data, int *p,
 	}
       done:
 	*p = dma->buf_count;
-	DRM_DEBUG("%d buffers, retcode = %d\n", *p, retcode);
+	drm_dev_dbg(dev, "%d buffers, retcode = %d\n", *p, retcode);
 
 	return retcode;
 }
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ced09c7c06f9..37be434fc48d 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -240,8 +240,8 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 	for (i = 0; i < connector_count; i++) {
 		connector = connectors[i];
 		enabled[i] = drm_connector_enabled(connector, true);
-		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
-			      connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
+		drm_dbg_kms(connector->dev, "connector %d enabled? %s\n", connector->base.id,
+			    connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
 
 		any_enabled |= enabled[i];
 	}
@@ -301,7 +301,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	}
 
 	if (can_clone) {
-		DRM_DEBUG_KMS("can clone using command line\n");
+		drm_dbg_kms(dev, "can clone using command line\n");
 		return true;
 	}
 
@@ -326,10 +326,11 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	}
 
 	if (can_clone) {
-		DRM_DEBUG_KMS("can clone using 1024x768\n");
+		drm_dbg_kms(dev, "can clone using 1024x768\n");
 		return true;
 	}
-	DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
+	drm_info(dev,
+		 "kms: can't enable cloning when we probably wanted to.\n");
 	return false;
 }
 
@@ -341,6 +342,7 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 				       int h_idx, int v_idx)
 {
 	struct drm_connector *connector;
+	struct drm_device *dev = connector_count ? connectors[0]->dev : NULL;
 	int i;
 	int hoffset = 0, voffset = 0;
 
@@ -350,8 +352,8 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 			continue;
 
 		if (!modes[i] && (h_idx || v_idx)) {
-			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
-				      connector->base.id);
+			drm_dbg_kms(dev, "no modes for connector tiled %d %d\n",
+				    i, connector->base.id);
 			continue;
 		}
 		if (connector->tile_h_loc < h_idx)
@@ -362,7 +364,7 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 	}
 	offsets[idx].x = hoffset;
 	offsets[idx].y = voffset;
-	DRM_DEBUG_KMS("returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
+	drm_dbg_kms(dev, "returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
 	return 0;
 }
 
@@ -419,14 +421,16 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
 						    connector->tile_h_loc, connector->tile_v_loc);
 		}
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
-			      connector->base.id);
+		drm_dbg_kms(connector->dev,
+			    "looking for cmdline mode on connector %d\n",
+			    connector->base.id);
 
 		/* got for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
-				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
+			drm_dbg_kms(connector->dev,
+				    "looking for preferred mode on connector %d %d\n",
+				    connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
@@ -448,16 +452,18 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
 			    (connector->tile_h_loc == 0 &&
 			     connector->tile_v_loc == 0 &&
 			     !drm_connector_get_tiled_mode(connector))) {
-				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-					      connector->base.id);
+				drm_dbg_kms(connector->dev,
+					    "Falling back to non tiled mode on Connector %d\n",
+					    connector->base.id);
 				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 			} else {
 				modes[i] = drm_connector_get_tiled_mode(connector);
 			}
 		}
 
-		DRM_DEBUG_KMS("found mode %s\n", modes[i] ? modes[i]->name :
-			  "none");
+		drm_dbg_kms(connector->dev,
+			    "found mode %s\n",
+			    modes[i] ? modes[i]->name : "none");
 		conn_configured |= BIT_ULL(i);
 	}
 
@@ -617,15 +623,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			num_connectors_detected++;
 
 		if (!enabled[i]) {
-			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s not enabled, skipping\n",
+				    connector->name);
 			conn_configured |= BIT(i);
 			continue;
 		}
 
 		if (connector->force == DRM_FORCE_OFF) {
-			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s is disabled by user, skipping\n",
+				    connector->name);
 			enabled[i] = false;
 			continue;
 		}
@@ -635,8 +641,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			if (connector->force > DRM_FORCE_OFF)
 				goto bail;
 
-			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
-				      connector->name);
+			drm_dbg_kms(dev, "connector %s has no encoder or crtc, skipping\n",
+				    connector->name);
 			enabled[i] = false;
 			conn_configured |= BIT(i);
 			continue;
@@ -653,28 +659,28 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		for (j = 0; j < count; j++) {
 			if (crtcs[j] == new_crtc) {
-				DRM_DEBUG_KMS("fallback: cloned configuration\n");
+				drm_dbg_kms(dev, "fallback: cloned configuration\n");
 				goto bail;
 			}
 		}
 
-		DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
-			      connector->name);
+		drm_dbg_kms(dev, "looking for cmdline mode on connector %s\n",
+			    connector->name);
 
 		/* go for command line mode first */
 		modes[i] = drm_connector_pick_cmdline_mode(connector);
 
 		/* try for preferred next */
 		if (!modes[i]) {
-			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
-				      connector->name, connector->has_tile);
+			drm_dbg_kms(dev, "looking for preferred mode on connector %s %d\n",
+				    connector->name, connector->has_tile);
 			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
 		}
 
 		/* No preferred mode marked by the EDID? Are there any modes? */
 		if (!modes[i] && !list_empty(&connector->modes)) {
-			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "using first mode listed on connector %s\n",
+				    connector->name);
 			modes[i] = list_first_entry(&connector->modes,
 						    struct drm_display_mode,
 						    head);
@@ -693,8 +699,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			 * This is crtc->mode and not crtc->state->mode for the
 			 * fastboot check to work correctly.
 			 */
-			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
-				      connector->name);
+			drm_dbg_kms(dev, "looking for current mode on connector %s\n",
+				    connector->name);
 			modes[i] = &connector->state->crtc->mode;
 		}
 		/*
@@ -703,18 +709,18 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 */
 		if (connector->has_tile &&
 		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
-			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
-				      connector->base.id);
+			drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
+				    connector->base.id);
 			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
 		}
 		crtcs[i] = new_crtc;
 
-		DRM_DEBUG_KMS("connector %s on [CRTC:%d:%s]: %dx%d%s\n",
-			      connector->name,
-			      connector->state->crtc->base.id,
-			      connector->state->crtc->name,
-			      modes[i]->hdisplay, modes[i]->vdisplay,
-			      modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
+		drm_dbg_kms(dev, "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
+			    connector->name,
+			    connector->state->crtc->base.id,
+			    connector->state->crtc->name,
+			    modes[i]->hdisplay, modes[i]->vdisplay,
+			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
 
 		fallback = false;
 		conn_configured |= BIT(i);
@@ -730,15 +736,16 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	 */
 	if (num_connectors_enabled != num_connectors_detected &&
 	    num_connectors_enabled < dev->mode_config.num_crtc) {
-		DRM_DEBUG_KMS("fallback: Not all outputs enabled\n");
-		DRM_DEBUG_KMS("Enabled: %i, detected: %i\n", num_connectors_enabled,
-			      num_connectors_detected);
+		drm_dbg_kms(dev, "fallback: Not all outputs enabled\n");
+		drm_dbg_kms(dev, "Enabled: %i, detected: %i\n",
+			    num_connectors_enabled,
+			    num_connectors_detected);
 		fallback = true;
 	}
 
 	if (fallback) {
 bail:
-		DRM_DEBUG_KMS("Not using firmware configuration\n");
+		drm_dbg_kms(dev, "Not using firmware configuration\n");
 		memcpy(enabled, save_enabled, count);
 		ret = false;
 	}
@@ -775,7 +782,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	int i, ret = 0;
 	bool *enabled;
 
-	DRM_DEBUG_KMS("\n");
+	drm_dbg_kms(dev, "\n");
 
 	if (!width)
 		width = dev->mode_config.max_width;
@@ -806,7 +813,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	offsets = kcalloc(connector_count, sizeof(*offsets), GFP_KERNEL);
 	enabled = kcalloc(connector_count, sizeof(bool), GFP_KERNEL);
 	if (!crtcs || !modes || !enabled || !offsets) {
-		DRM_ERROR("Memory allocation failed\n");
+		drm_err(dev, "Memory allocation failed\n");
 		ret = -ENOMEM;
 		goto out;
 	}
@@ -817,7 +824,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 	for (i = 0; i < connector_count; i++)
 		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);
 	if (!total_modes_count)
-		DRM_DEBUG_KMS("No connectors reported connected with modes\n");
+		drm_dbg_kms(dev, "No connectors reported connected with modes\n");
 	drm_client_connectors_enabled(connectors, connector_count, enabled);
 
 	if (!drm_client_firmware_config(client, connectors, connector_count, crtcs,
@@ -830,10 +837,10 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 					      offsets, enabled, width, height) &&
 		    !drm_client_target_preferred(connectors, connector_count, modes,
 						 offsets, enabled, width, height))
-			DRM_ERROR("Unable to find initial modes\n");
+			drm_err(dev, "Unable to find initial modes\n");
 
-		DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
-			      width, height);
+		drm_dbg_kms(dev, "picking CRTCs for %dx%d config\n",
+			    width, height);
 
 		drm_client_pick_crtcs(client, connectors, connector_count,
 				      crtcs, modes, 0, width, height);
@@ -851,8 +858,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
 			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
 			struct drm_connector *connector = connectors[i];
 
-			DRM_DEBUG_KMS("desired mode %s set on crtc %d (%d,%d)\n",
-				      mode->name, crtc->base.id, offset->x, offset->y);
+			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
+				    mode->name, crtc->base.id, offset->x, offset->y);
 
 			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
 					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..b2bdb684a1e3 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -608,7 +608,8 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
 			if (entry[i].red != entry[i].blue ||
 			    entry[i].red != entry[i].green) {
-				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
+				drm_dbg_kms(lut->dev,
+					    "All LUT entries must have equal r/g/b\n");
 				return -EINVAL;
 			}
 		}
@@ -617,7 +618,8 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
 			if (entry[i].red < entry[i - 1].red ||
 			    entry[i].green < entry[i - 1].green ||
 			    entry[i].blue < entry[i - 1].blue) {
-				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
+				drm_dbg_kms(lut->dev,
+					    "LUT entries must never decrease.\n");
 				return -EINVAL;
 			}
 		}
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 52e20c68813b..c9ac42277f3c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -161,25 +161,28 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
 		return;
 
 	if (mode->force) {
-		DRM_INFO("forcing %s connector %s\n", connector->name,
+		drm_info(connector->dev, "forcing %s connector %s\n",
+			 connector->name,
 			 drm_get_connector_force_name(mode->force));
 		connector->force = mode->force;
 	}
 
 	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
-		DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
+		drm_info(connector->dev,
+			 "cmdline forces connector %s panel_orientation to %d\n",
 			 connector->name, mode->panel_orientation);
 		drm_connector_set_panel_orientation(connector,
 						    mode->panel_orientation);
 	}
 
-	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
-		      connector->name, mode->name,
-		      mode->xres, mode->yres,
-		      mode->refresh_specified ? mode->refresh : 60,
-		      mode->rb ? " reduced blanking" : "",
-		      mode->margins ? " with margins" : "",
-		      mode->interlace ?  " interlaced" : "");
+	drm_dbg_kms(connector->dev,
+		    "cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
+		    connector->name, mode->name,
+		    mode->xres, mode->yres,
+		    mode->refresh_specified ? mode->refresh : 60,
+		    mode->rb ? " reduced blanking" : "",
+		    mode->margins ? " with margins" : "",
+		    mode->interlace ?  " interlaced" : "");
 }
 
 static void drm_connector_free(struct kref *kref)
@@ -251,9 +254,9 @@ int drm_connector_init(struct drm_device *dev,
 	/* connector index is used with 32bit bitmasks */
 	ret = ida_simple_get(&config->connector_ida, 0, 32, GFP_KERNEL);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Failed to allocate %s connector index: %d\n",
-			      drm_connector_enum_list[connector_type].name,
-			      ret);
+		drm_dbg_kms(dev, "Failed to allocate %s connector index: %d\n",
+			    drm_connector_enum_list[connector_type].name,
+			    ret);
 		goto out_put;
 	}
 	connector->index = ret;
@@ -2104,12 +2107,14 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 		old_edid = (const struct edid *)connector->edid_blob_ptr->data;
 		if (old_edid) {
 			if (!drm_edid_are_equal(edid, old_edid)) {
-				DRM_DEBUG_KMS("[CONNECTOR:%d:%s] Edid was changed.\n",
-					      connector->base.id, connector->name);
+				drm_dbg_kms(dev,
+					    "[CONNECTOR:%d:%s] Edid was changed.\n",
+					    connector->base.id, connector->name);
 
 				connector->epoch_counter += 1;
-				DRM_DEBUG_KMS("Updating change counter to %llu\n",
-					      connector->epoch_counter);
+				drm_dbg_kms(dev,
+					    "Updating change counter to %llu\n",
+					    connector->epoch_counter);
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
index c6e6a3e7219a..c52764e98d26 100644
--- a/drivers/gpu/drm/drm_context.c
+++ b/drivers/gpu/drm/drm_context.c
@@ -276,11 +276,11 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
 static int drm_context_switch(struct drm_device * dev, int old, int new)
 {
 	if (test_and_set_bit(0, &dev->context_flag)) {
-		DRM_ERROR("Reentering -- FIXME\n");
+		drm_err(dev, "Reentering -- FIXME\n");
 		return -EBUSY;
 	}
 
-	DRM_DEBUG("Context switch from %d to %d\n", old, new);
+	drm_dbg_core(dev, "Context switch from %d to %d\n", old, new);
 
 	if (new == dev->last_context) {
 		clear_bit(0, &dev->context_flag);
@@ -307,7 +307,7 @@ static int drm_context_switch_complete(struct drm_device *dev,
 	dev->last_context = new;	/* PRE/POST: This is the _only_ writer. */
 
 	if (!_DRM_LOCK_IS_HELD(file_priv->master->lock.hw_lock->lock)) {
-		DRM_ERROR("Lock isn't held after context switch\n");
+		drm_err(dev, "Lock isn't held after context switch\n");
 	}
 
 	/* If a context switch is ever initiated
@@ -379,9 +379,9 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
 		/* Skip kernel's context and get a new one. */
 		tmp_handle = drm_legacy_ctxbitmap_next(dev);
 	}
-	DRM_DEBUG("%d\n", tmp_handle);
+	drm_dbg_core(dev, "%d\n", tmp_handle);
 	if (tmp_handle < 0) {
-		DRM_DEBUG("Not enough free contexts.\n");
+		drm_dbg_core(dev, "Not enough free contexts.\n");
 		/* Should this return -EBUSY instead? */
 		return tmp_handle;
 	}
@@ -390,7 +390,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
 
 	ctx_entry = kmalloc(sizeof(*ctx_entry), GFP_KERNEL);
 	if (!ctx_entry) {
-		DRM_DEBUG("out of memory\n");
+		drm_dbg_core(dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -449,7 +449,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
 	    !drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
-	DRM_DEBUG("%d\n", ctx->handle);
+	drm_dbg_core(dev, "%d\n", ctx->handle);
 	return drm_context_switch(dev, dev->last_context, ctx->handle);
 }
 
@@ -473,7 +473,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
 	    !drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
-	DRM_DEBUG("%d\n", ctx->handle);
+	drm_dbg_core(dev, "%d\n", ctx->handle);
 	drm_context_switch_complete(dev, file_priv, ctx->handle);
 
 	return 0;
@@ -499,7 +499,7 @@ int drm_legacy_rmctx(struct drm_device *dev, void *data,
 	    !drm_core_check_feature(dev, DRIVER_LEGACY))
 		return -EOPNOTSUPP;
 
-	DRM_DEBUG("%d\n", ctx->handle);
+	drm_dbg_core(dev, "%d\n", ctx->handle);
 	if (ctx->handle != DRM_KERNEL_CONTEXT) {
 		if (dev->driver->context_dtor)
 			dev->driver->context_dtor(dev, ctx->handle);
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 26a77a735905..994147abf9eb 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -658,10 +658,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 	crtc = drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
 	if (!crtc) {
-		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
+		drm_dbg_kms(dev, "Unknown CRTC ID %d\n", crtc_req->crtc_id);
 		return -ENOENT;
 	}
-	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
 
 	plane = crtc->primary;
 
@@ -684,7 +684,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 				old_fb = plane->fb;
 
 			if (!old_fb) {
-				DRM_DEBUG_KMS("CRTC doesn't have current FB\n");
+				drm_dbg_kms(dev,
+					    "CRTC doesn't have current FB\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -695,8 +696,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		} else {
 			fb = drm_framebuffer_lookup(dev, file_priv, crtc_req->fb_id);
 			if (!fb) {
-				DRM_DEBUG_KMS("Unknown FB ID%d\n",
-						crtc_req->fb_id);
+				drm_dbg_kms(dev, "Unknown FB ID%d\n",
+					      crtc_req->fb_id);
 				ret = -ENOENT;
 				goto out;
 			}
@@ -709,7 +710,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		}
 		if (!file_priv->aspect_ratio_allowed &&
 		    (crtc_req->mode.flags & DRM_MODE_FLAG_PIC_AR_MASK) != DRM_MODE_FLAG_PIC_AR_NONE) {
-			DRM_DEBUG_KMS("Unexpected aspect-ratio flag bits\n");
+			drm_dbg_kms(dev, "Unexpected aspect-ratio flag bits\n");
 			ret = -EINVAL;
 			goto out;
 		}
@@ -717,8 +718,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 		ret = drm_mode_convert_umode(dev, mode, &crtc_req->mode);
 		if (ret) {
-			DRM_DEBUG_KMS("Invalid mode (ret=%d, status=%s)\n",
-				      ret, drm_get_mode_status_name(mode->status));
+			drm_dbg_kms(dev, "Invalid mode (ret=%d, status=%s)\n",
+				    ret, drm_get_mode_status_name(mode->status));
 			drm_mode_debug_printmodeline(mode);
 			goto out;
 		}
@@ -735,9 +736,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 							   fb->format->format,
 							   fb->modifier);
 			if (ret) {
-				DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
-					      &fb->format->format,
-					      fb->modifier);
+				drm_dbg_kms(dev,
+					    "Invalid pixel format %p4cc, modifier 0x%llx\n",
+					    &fb->format->format,
+					    fb->modifier);
 				goto out;
 			}
 		}
@@ -750,14 +752,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	}
 
 	if (crtc_req->count_connectors == 0 && mode) {
-		DRM_DEBUG_KMS("Count connectors is 0 but mode set\n");
+		drm_dbg_kms(dev, "Count connectors is 0 but mode set\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (crtc_req->count_connectors > 0 && (!mode || !fb)) {
-		DRM_DEBUG_KMS("Count connectors is %d but no mode or fb set\n",
-			  crtc_req->count_connectors);
+		drm_dbg_kms(dev, "Count connectors is %d but no mode or fb set\n",
+			    crtc_req->count_connectors);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -789,14 +791,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 			connector = drm_connector_lookup(dev, file_priv, out_id);
 			if (!connector) {
-				DRM_DEBUG_KMS("Connector id %d unknown\n",
-						out_id);
+				drm_dbg_kms(dev, "Connector id %d unknown\n",
+					    out_id);
 				ret = -ENOENT;
 				goto out;
 			}
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-					connector->base.id,
-					connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
+				    connector->base.id,
+				    connector->name);
 
 			connector_set[i] = connector;
 		}
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index bff917531f33..3a94e4067998 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -326,7 +326,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (encoder_funcs->mode_fixup) {
 			if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
 							      adjusted_mode))) {
-				DRM_DEBUG_KMS("Encoder fixup failed\n");
+				drm_dbg_kms(dev, "Encoder fixup failed\n");
 				goto done;
 			}
 		}
@@ -335,11 +335,11 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	if (crtc_funcs->mode_fixup) {
 		if (!(ret = crtc_funcs->mode_fixup(crtc, mode,
 						adjusted_mode))) {
-			DRM_DEBUG_KMS("CRTC fixup failed\n");
+			drm_dbg_kms(dev, "CRTC fixup failed\n");
 			goto done;
 		}
 	}
-	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
 
 	crtc->hwmode = *adjusted_mode;
 
@@ -378,7 +378,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (!encoder_funcs)
 			continue;
 
-		DRM_DEBUG_KMS("[ENCODER:%d:%s] set [MODE:%s]\n",
+		drm_dbg_kms(dev, "[ENCODER:%d:%s] set [MODE:%s]\n",
 			encoder->base.id, encoder->name, mode->name);
 		if (encoder_funcs->mode_set)
 			encoder_funcs->mode_set(encoder, mode, adjusted_mode);
@@ -529,8 +529,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	int ret;
 	int i;
 
-	DRM_DEBUG_KMS("\n");
-
 	BUG_ON(!set);
 	BUG_ON(!set->crtc);
 	BUG_ON(!set->crtc->helper_private);
@@ -542,19 +540,23 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	crtc_funcs = set->crtc->helper_private;
 
 	dev = set->crtc->dev;
+
+	drm_dbg_kms(dev, "\n");
+
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
 	if (!set->mode)
 		set->fb = NULL;
 
 	if (set->fb) {
-		DRM_DEBUG_KMS("[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
-			      set->crtc->base.id, set->crtc->name,
-			      set->fb->base.id,
-			      (int)set->num_connectors, set->x, set->y);
+		drm_dbg_kms(dev,
+			    "[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
+			    set->crtc->base.id, set->crtc->name,
+			    set->fb->base.id,
+			    (int)set->num_connectors, set->x, set->y);
 	} else {
-		DRM_DEBUG_KMS("[CRTC:%d:%s] [NOFB]\n",
-			      set->crtc->base.id, set->crtc->name);
+		drm_dbg_kms(dev, "[CRTC:%d:%s] [NOFB]\n",
+			    set->crtc->base.id, set->crtc->name);
 		drm_crtc_helper_disable(set->crtc);
 		return 0;
 	}
@@ -604,7 +606,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	if (set->crtc->primary->fb != set->fb) {
 		/* If we have no fb then treat it as a full mode set */
 		if (set->crtc->primary->fb == NULL) {
-			DRM_DEBUG_KMS("crtc has no fb, full mode set\n");
+			drm_dbg_kms(dev, "crtc has no fb, full mode set\n");
 			mode_changed = true;
 		} else if (set->fb->format != set->crtc->primary->fb->format) {
 			mode_changed = true;
@@ -616,7 +618,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		fb_changed = true;
 
 	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
-		DRM_DEBUG_KMS("modes are different, full mode set\n");
+		drm_dbg_kms(dev, "modes are different, full mode set\n");
 		drm_mode_debug_printmodeline(&set->crtc->mode);
 		drm_mode_debug_printmodeline(set->mode);
 		mode_changed = true;
@@ -652,7 +654,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 					fail = 1;
 
 				if (connector->dpms != DRM_MODE_DPMS_ON) {
-					DRM_DEBUG_KMS("connector dpms not on, full mode switch\n");
+					drm_dbg_kms(dev,
+						    "connector dpms not on, full mode switch\n");
 					mode_changed = true;
 				}
 
@@ -661,7 +664,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		}
 
 		if (new_encoder != connector->encoder) {
-			DRM_DEBUG_KMS("encoder changed, full mode switch\n");
+			drm_dbg_kms(dev, "encoder changed, full mode switch\n");
 			mode_changed = true;
 			/* If the encoder is reused for another connector, then
 			 * the appropriate crtc will be set later.
@@ -702,17 +705,17 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 			goto fail;
 		}
 		if (new_crtc != connector->encoder->crtc) {
-			DRM_DEBUG_KMS("crtc changed, full mode switch\n");
+			drm_dbg_kms(dev, "crtc changed, full mode switch\n");
 			mode_changed = true;
 			connector->encoder->crtc = new_crtc;
 		}
 		if (new_crtc) {
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
-				      connector->base.id, connector->name,
-				      new_crtc->base.id, new_crtc->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
+				    connector->base.id, connector->name,
+				    new_crtc->base.id, new_crtc->name);
 		} else {
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [NOCRTC]\n",
-				      connector->base.id, connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [NOCRTC]\n",
+				    connector->base.id, connector->name);
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
@@ -723,22 +726,23 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 
 	if (mode_changed) {
 		if (drm_helper_crtc_in_use(set->crtc)) {
-			DRM_DEBUG_KMS("attempting to set mode from"
+			drm_dbg_kms(dev, "attempting to set mode from"
 					" userspace\n");
 			drm_mode_debug_printmodeline(set->mode);
 			set->crtc->primary->fb = set->fb;
 			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
 						      set->x, set->y,
 						      save_set.fb)) {
-				DRM_ERROR("failed to set mode on [CRTC:%d:%s]\n",
+				drm_err(dev, "failed to set mode on [CRTC:%d:%s]\n",
 					  set->crtc->base.id, set->crtc->name);
 				set->crtc->primary->fb = save_set.fb;
 				ret = -EINVAL;
 				goto fail;
 			}
-			DRM_DEBUG_KMS("Setting connector DPMS state to on\n");
+			drm_dbg_kms(dev, "Setting connector DPMS state to on\n");
 			for (i = 0; i < set->num_connectors; i++) {
-				DRM_DEBUG_KMS("\t[CONNECTOR:%d:%s] set DPMS on\n", set->connectors[i]->base.id,
+				drm_dbg_kms(dev, "\t[CONNECTOR:%d:%s] set DPMS on\n",
+					      set->connectors[i]->base.id,
 					      set->connectors[i]->name);
 				set->connectors[i]->funcs->dpms(set->connectors[i], DRM_MODE_DPMS_ON);
 			}
@@ -788,7 +792,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	if (mode_changed &&
 	    !drm_crtc_helper_set_mode(save_set.crtc, save_set.mode, save_set.x,
 				      save_set.y, save_set.fb))
-		DRM_ERROR("failed to restore config after modeset failure\n");
+		drm_err(dev,
+			  "failed to restore config after modeset failure\n");
 
 	kfree(save_connector_encoders);
 	kfree(save_encoder_crtcs);
@@ -958,7 +963,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 
 		/* Restoring the old config should never fail! */
 		if (ret == false)
-			DRM_ERROR("failed to set mode on crtc %p\n", crtc);
+			drm_err(dev, "failed to set mode on crtc %p\n", crtc);
 
 		/* Turn off outputs that were already powered off */
 		if (drm_helper_choose_crtc_dpms(crtc)) {
-- 
2.34.1



