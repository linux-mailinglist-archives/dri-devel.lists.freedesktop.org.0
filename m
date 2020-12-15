Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05ED2DB4AA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 20:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6554897C5;
	Tue, 15 Dec 2020 19:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBCC897C5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 19:51:58 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9FB6593;
 Tue, 15 Dec 2020 20:51:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608061917;
 bh=d6rlOKHEy2Iro1p452YXifXDaAZbpiDtJfBvMtGKCMk=;
 h=From:To:Cc:Subject:Date:From;
 b=LsA8cEoCGmifraMhKAqKazYGYy5tEQkfy+MIrZxA5liWv/S+nGEehEhyNL3oFehU6
 L8coQytai7NE/s8JsXfpIjc1xX9YnS389zj2yRA2KBt4/ltqPmeWw8O1wjTnR2n5mf
 EWizkUVqngAdkClsqq6aKbmn6DKEtVztgBGxiQfs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Don't export the drm_gem_dumb_destroy() function
Date: Tue, 15 Dec 2020 21:51:47 +0200
Message-Id: <20201215195147.4039-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_dumb_destroy() isn't used in drivers, don't export it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Move function prototype from drm_gem.h to drm_internal.h
- Drop function documentation
- Replace uint32_t with u32
---
 drivers/gpu/drm/drm_dumb_buffers.c |  8 +++++---
 drivers/gpu/drm/drm_gem.c          | 12 +-----------
 drivers/gpu/drm/drm_internal.h     |  3 +++
 include/drm/drm_gem.h              |  3 ---
 4 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index d18a740fe0f1..ad17fa21cebb 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -29,6 +29,7 @@
 #include <drm/drm_mode.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -46,9 +47,10 @@
  * KMS frame buffers.
  *
  * To support dumb objects drivers must implement the &drm_driver.dumb_create
- * operation. &drm_driver.dumb_destroy defaults to drm_gem_dumb_destroy() if
- * not set and &drm_driver.dumb_map_offset defaults to
- * drm_gem_dumb_map_offset(). See the callbacks for further details.
+ * and &drm_driver.dumb_map_offset operations (the latter defaults to
+ * drm_gem_dumb_map_offset() if not set). Drivers that don't use GEM handles
+ * additionally need to implement the &drm_driver.dumb_destroy operation. See
+ * the callbacks for further details.
  *
  * Note that dumb objects may not be used for gpu acceleration, as has been
  * attempted on some ARM embedded platforms. Such drivers really must have
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 92f89cee213e..34b2f111c01c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -335,22 +335,12 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_dumb_map_offset);
 
-/**
- * drm_gem_dumb_destroy - dumb fb callback helper for gem based drivers
- * @file: drm file-private structure to remove the dumb handle from
- * @dev: corresponding drm_device
- * @handle: the dumb handle to remove
- *
- * This implements the &drm_driver.dumb_destroy kms driver callback for drivers
- * which use gem to manage their backing storage.
- */
 int drm_gem_dumb_destroy(struct drm_file *file,
 			 struct drm_device *dev,
-			 uint32_t handle)
+			 u32 handle)
 {
 	return drm_gem_handle_delete(file, handle);
 }
-EXPORT_SYMBOL(drm_gem_dumb_destroy);
 
 /**
  * drm_gem_handle_create_tail - internal functions to create a handle
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 81d386b5b92a..fad2249ee67b 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -191,6 +191,9 @@ void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct dma_buf_map *map);
 
+int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
+			 u32 handle);
+
 /* drm_debugfs.c drm_debugfs_crc.c */
 #if defined(CONFIG_DEBUG_FS)
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5e6daa1c982f..240049566592 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -416,8 +416,5 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     bool write);
 int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
 			    u32 handle, u64 *offset);
-int drm_gem_dumb_destroy(struct drm_file *file,
-			 struct drm_device *dev,
-			 uint32_t handle);
 
 #endif /* __DRM_GEM_H__ */
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
