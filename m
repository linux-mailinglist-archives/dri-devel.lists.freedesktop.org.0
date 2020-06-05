Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10081EF81B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 14:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACA96E10E;
	Fri,  5 Jun 2020 12:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7085F6E10E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 12:40:34 +0000 (UTC)
IronPort-SDR: y5dH3+HK1rWViJnxU1mmgHy6FIOg3FYNdp9BRjnZc1stMJikikxxsC49ZkuHplwkXLD2BkkscT
 UI7cWucaXvUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 05:40:34 -0700
IronPort-SDR: d/ZZIQkKrA8F6+ZvwLCExx6m5F0TmrLFufRUQLbWpJxkdsgzUb7SkEihT79AjKEEOfFf72SJY0
 zJ8XzJBa9eZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; d="scan'208";a="417262506"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2020 05:40:32 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm: cleanup on drm_mode_object_find
Date: Fri,  5 Jun 2020 18:10:36 +0530
Message-Id: <20200605124037.2918-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Redundant wrapper for drm_mode_object_find is removed.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/drm_crtc_internal.h |  6 ++---
 drivers/gpu/drm/drm_framebuffer.c   |  2 +-
 drivers/gpu/drm/drm_mode_object.c   | 38 +++++++++++------------------
 drivers/gpu/drm/drm_property.c      |  6 ++---
 4 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index da96b2f64d7e..4bfde1367c1a 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -144,9 +144,9 @@ int drm_mode_object_add(struct drm_device *dev, struct drm_mode_object *obj,
 			uint32_t obj_type);
 void drm_mode_object_register(struct drm_device *dev,
 			      struct drm_mode_object *obj);
-struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
-					       struct drm_file *file_priv,
-					       uint32_t id, uint32_t type);
+struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
+					     struct drm_file *file_priv,
+					     uint32_t id, uint32_t type);
 void drm_mode_object_unregister(struct drm_device *dev,
 				struct drm_mode_object *object);
 int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 0375b3d7f8d0..023cea64e87d 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -888,7 +888,7 @@ struct drm_framebuffer *drm_framebuffer_lookup(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_framebuffer *fb = NULL;
 
-	obj = __drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
+	obj = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_FB);
 	if (obj)
 		fb = obj_to_fb(obj);
 	return fb;
diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 901b078abf40..6c5e689d8b60 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -133,9 +133,20 @@ bool drm_mode_object_lease_required(uint32_t type)
 	}
 }
 
-struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
-					       struct drm_file *file_priv,
-					       uint32_t id, uint32_t type)
+/**
+ * drm_mode_object_find - look up a drm object with static lifetime
+ * @dev: drm device
+ * @file_priv: drm file
+ * @id: id of the mode object
+ * @type: type of the mode object
+ *
+ * This function is used to look up a modeset object. It will acquire a
+ * reference for reference counted objects. This reference must be dropped again
+ * by callind drm_mode_object_put().
+ */
+struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
+					     struct drm_file *file_priv,
+					     uint32_t id, uint32_t type)
 {
 	struct drm_mode_object *obj = NULL;
 
@@ -158,27 +169,6 @@ struct drm_mode_object *__drm_mode_object_find(struct drm_device *dev,
 
 	return obj;
 }
-
-/**
- * drm_mode_object_find - look up a drm object with static lifetime
- * @dev: drm device
- * @file_priv: drm file
- * @id: id of the mode object
- * @type: type of the mode object
- *
- * This function is used to look up a modeset object. It will acquire a
- * reference for reference counted objects. This reference must be dropped again
- * by callind drm_mode_object_put().
- */
-struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
-		struct drm_file *file_priv,
-		uint32_t id, uint32_t type)
-{
-	struct drm_mode_object *obj = NULL;
-
-	obj = __drm_mode_object_find(dev, file_priv, id, type);
-	return obj;
-}
 EXPORT_SYMBOL(drm_mode_object_find);
 
 /**
diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 6ee04803c362..f1e338f909f1 100644
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -656,7 +656,7 @@ struct drm_property_blob *drm_property_lookup_blob(struct drm_device *dev,
 	struct drm_mode_object *obj;
 	struct drm_property_blob *blob = NULL;
 
-	obj = __drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
+	obj = drm_mode_object_find(dev, NULL, id, DRM_MODE_OBJECT_BLOB);
 	if (obj)
 		blob = obj_to_blob(obj);
 	return blob;
@@ -919,8 +919,8 @@ bool drm_property_change_valid_get(struct drm_property *property,
 		if (value == 0)
 			return true;
 
-		*ref = __drm_mode_object_find(property->dev, NULL, value,
-					      property->values[0]);
+		*ref = drm_mode_object_find(property->dev, NULL, value,
+					    property->values[0]);
 		return *ref != NULL;
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
