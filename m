Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DB39BE4A9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB3210E6B7;
	Wed,  6 Nov 2024 10:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fl1PBQ8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF8B10E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:48:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B00336000E;
 Wed,  6 Nov 2024 10:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730890124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6pRM5jscZII9GohdxbWbdZ5ZoYRQpxbmot/dqfyy/mM=;
 b=Fl1PBQ8vf8xbrbvYM3xWTxSpEI3DdCvhNIBTbOYp6R+eDrsVaCDOKt0Jox0oPfimU1B9YA
 pHfLSpEqovaIxofsgJhE/kStmQesRRrZ0t/Pkptx6G3Uw4xLiTPe0CXzwD4C7H0dsR7/Y6
 qi89zz5Y3iHIs+mDjaicJW1eeYQeGDzVj7hbBvDspF6VZg5nuR5TEksv97XYsCvG7n3yXd
 qTicJU3CcnPNi6EO8gP0kxj9vMtjnTdTJ/YtBcGqYe8jJTyMdO+/L/d71J8lmwKWod57eL
 ANYApORKl9n8h07Ab2yZpYzTsbZBgcDUvkwCqzdpiYbM9ClTo6iBsepwJHBi4Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 06 Nov 2024 11:48:26 +0100
Subject: [PATCH v2 3/4] drm/mode_object: add
 drm_mode_object_read_refcount()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-drm-small-improvements-v2-3-f6e2aef86719@bootlin.com>
References: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
In-Reply-To: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add a wrapper to kref_read() just like the ones already in place for
kref_get() and kref_put(). This will be used for sanity checks on object
lifetime.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_mode_object.c | 20 ++++++++++++++++++++
 include/drm/drm_mode_object.h     |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index df4cc0e8e263d5887a799cf1a61d998234be7158..f990cc7e9b5d3bda3453123593314fa1ea2bf923 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -217,6 +217,26 @@ void drm_mode_object_get(struct drm_mode_object *obj)
 }
 EXPORT_SYMBOL(drm_mode_object_get);
 
+/**
+ * drm_mode_object_get - read the refcount for a mode object
+ * @obj: DRM mode object
+ *
+ * This function returns the current object's refcount if it is a
+ * refcounted modeset object, or 0 on any other object.
+ */
+unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj)
+{
+	unsigned int refcount = 0;
+
+	if (obj->free_cb) {
+		refcount = kref_read(&obj->refcount);
+		DRM_DEBUG("OBJ ID: %d (%d)\n", obj->id, refcount);
+	}
+
+	return refcount;
+}
+EXPORT_SYMBOL(drm_mode_object_read_refcount);
+
 /**
  * drm_object_attach_property - attach a property to a modeset object
  * @obj: drm modeset object
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index c68edbd126d04d51221f50aa2b4166475543b59f..3d2c739e703888bf4520c61594d480f128d50e56 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -123,6 +123,7 @@ struct drm_mode_object *drm_mode_object_find(struct drm_device *dev,
 					     uint32_t id, uint32_t type);
 void drm_mode_object_get(struct drm_mode_object *obj);
 void drm_mode_object_put(struct drm_mode_object *obj);
+unsigned int drm_mode_object_read_refcount(struct drm_mode_object *obj);
 
 int drm_object_property_set_value(struct drm_mode_object *obj,
 				  struct drm_property *property,

-- 
2.34.1

