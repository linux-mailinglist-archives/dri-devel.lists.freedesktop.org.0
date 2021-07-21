Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD13D0F91
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF88C6EB2F;
	Wed, 21 Jul 2021 13:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2616C6EB12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:30:24 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u1so2234200wrs.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rwfs5+AW0M9YMzsGWjOsQQtX6ZLGDGpVWAUp13x/Y5I=;
 b=CCed9AFJH2Xw+zjsZyy/h1hYyPpLgbE9YK7sn0843CH3SmHqg+MN8xbZfkZGwCdG87
 KEJ/rKlAjoTPTEWoLdTNrD+YlLIeEka9l7j4ACOUXSsLRMz8wUZ5voktkLXrPtMiZCgq
 xMlkw7mTQdKCSBuY0F/oLdcsfmlF+ObFd0yXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rwfs5+AW0M9YMzsGWjOsQQtX6ZLGDGpVWAUp13x/Y5I=;
 b=Nk7aM7kqJcAdkSSbkLd8lYmVppM0lmoRwz+GsZFhHRhWBnPt5I2lvpMJkJVbPrz9p+
 ZYEyoI/QTpYjV5J+4sIoSYnrdNLlz9mJk3MQ7p3BEkE3VvsUfroxTKHuVOiLsSM8FbxA
 UQBUB/7GfZpiCoIet/4956F5Ai7SqR1Rw1q3kLPsIIMG89aXLGKCJJqMt3yGVyynXnDw
 py19T/NyHRC//T2roa9SADKkzfCF3E07658XBvUtW+5a9m3BdB2WxJncgz9TQ+pR81z/
 93BJnsFz79krOpecBfm2MIpVAVzUOpAgC754Xx1QIeQnW0nSyumstBi2T348dTTNHopV
 EJHA==
X-Gm-Message-State: AOAM530SFcg0d07IGztLsKXwPgKK7ubwvtRb9be0hSGMNpJJ4sxLwrp0
 0ygOAtSlWxJObONUYw+/0sTMsLsLChofeQ==
X-Google-Smtp-Source: ABdhPJwA/sneHEcPSZJwCCeBy17/RKYZuFaZMD8E/dnTqfYDScAd6zarC1UOisJdcgILtmtF/eCcGg==
X-Received: by 2002:adf:e0c4:: with SMTP id m4mr42798039wri.312.1626874222741; 
 Wed, 21 Jul 2021 06:30:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l22sm4962624wmp.41.2021.07.21.06.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:30:22 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/plane: Move drm_plane_enable_fb_damage_clips into core
Date: Wed, 21 Jul 2021 15:30:14 +0200
Message-Id: <20210721133014.3880922-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721133014.3880922-1-daniel.vetter@ffwll.ch>
References: <20210721133014.3880922-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're trying to have a fairly strict split between core functionality
that defines the uapi, including the docs, and the helper functions to
implement it.

Move drm_plane_enable_fb_damage_clips and associated kerneldoc into
drm_plane from drm_damage_helper.c to fix this.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/drm-kms.rst       |  4 +--
 drivers/gpu/drm/drm_damage_helper.c | 54 -----------------------------
 drivers/gpu/drm/drm_plane.c         | 54 +++++++++++++++++++++++++++++
 include/drm/drm_damage_helper.h     |  1 -
 include/drm/drm_plane.h             |  3 +-
 5 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 87e5023e3f55..7399f497e7e2 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -508,8 +508,8 @@ Plane Composition Properties
 Damage Tracking Properties
 --------------------------
 
-.. kernel-doc:: drivers/gpu/drm/drm_damage_helper.c
-   :doc: overview
+.. kernel-doc:: drivers/gpu/drm/drm_plane.c
+   :doc: damage tracking
 
 Color Management Properties
 ---------------------------
diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index eb69b7123af5..245959dad7bb 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -34,44 +34,6 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 
-/**
- * DOC: overview
- *
- * FB_DAMAGE_CLIPS is an optional plane property which provides a means to
- * specify a list of damage rectangles on a plane in framebuffer coordinates of
- * the framebuffer attached to the plane. In current context damage is the area
- * of plane framebuffer that has changed since last plane update (also called
- * page-flip), irrespective of whether currently attached framebuffer is same as
- * framebuffer attached during last plane update or not.
- *
- * FB_DAMAGE_CLIPS is a hint to kernel which could be helpful for some drivers
- * to optimize internally especially for virtual devices where each framebuffer
- * change needs to be transmitted over network, usb, etc.
- *
- * Since FB_DAMAGE_CLIPS is a hint so it is an optional property. User-space can
- * ignore damage clips property and in that case driver will do a full plane
- * update. In case damage clips are provided then it is guaranteed that the area
- * inside damage clips will be updated to plane. For efficiency driver can do
- * full update or can update more than specified in damage clips. Since driver
- * is free to read more, user-space must always render the entire visible
- * framebuffer. Otherwise there can be corruptions. Also, if a user-space
- * provides damage clips which doesn't encompass the actual damage to
- * framebuffer (since last plane update) can result in incorrect rendering.
- *
- * FB_DAMAGE_CLIPS is a blob property with the layout of blob data is simply an
- * array of &drm_mode_rect. Unlike plane &drm_plane_state.src coordinates,
- * damage clips are not in 16.16 fixed point. Similar to plane src in
- * framebuffer, damage clips cannot be negative. In damage clip, x1/y1 are
- * inclusive and x2/y2 are exclusive. While kernel does not error for overlapped
- * damage clips, it is strongly discouraged.
- *
- * Drivers that are interested in damage interface for plane should enable
- * FB_DAMAGE_CLIPS property by calling drm_plane_enable_fb_damage_clips().
- * Drivers implementing damage can use drm_atomic_helper_damage_iter_init() and
- * drm_atomic_helper_damage_iter_next() helper iterator function to get damage
- * rectangles clipped to &drm_plane_state.src.
- */
-
 static void convert_clip_rect_to_rect(const struct drm_clip_rect *src,
 				      struct drm_mode_rect *dest,
 				      uint32_t num_clips, uint32_t src_inc)
@@ -87,22 +49,6 @@ static void convert_clip_rect_to_rect(const struct drm_clip_rect *src,
 	}
 }
 
-/**
- * drm_plane_enable_fb_damage_clips - Enables plane fb damage clips property.
- * @plane: Plane on which to enable damage clips property.
- *
- * This function lets driver to enable the damage clips property on a plane.
- */
-void drm_plane_enable_fb_damage_clips(struct drm_plane *plane)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_mode_config *config = &dev->mode_config;
-
-	drm_object_attach_property(&plane->base, config->prop_fb_damage_clips,
-				   0);
-}
-EXPORT_SYMBOL(drm_plane_enable_fb_damage_clips);
-
 /**
  * drm_atomic_helper_check_plane_damage - Verify plane damage on atomic_check.
  * @state: The driver state object.
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 40f099c67a8d..b68d06f536fa 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1397,6 +1397,60 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+/**
+ * DOC: damage tracking
+ *
+ * FB_DAMAGE_CLIPS is an optional plane property which provides a means to
+ * specify a list of damage rectangles on a plane in framebuffer coordinates of
+ * the framebuffer attached to the plane. In current context damage is the area
+ * of plane framebuffer that has changed since last plane update (also called
+ * page-flip), irrespective of whether currently attached framebuffer is same as
+ * framebuffer attached during last plane update or not.
+ *
+ * FB_DAMAGE_CLIPS is a hint to kernel which could be helpful for some drivers
+ * to optimize internally especially for virtual devices where each framebuffer
+ * change needs to be transmitted over network, usb, etc.
+ *
+ * Since FB_DAMAGE_CLIPS is a hint so it is an optional property. User-space can
+ * ignore damage clips property and in that case driver will do a full plane
+ * update. In case damage clips are provided then it is guaranteed that the area
+ * inside damage clips will be updated to plane. For efficiency driver can do
+ * full update or can update more than specified in damage clips. Since driver
+ * is free to read more, user-space must always render the entire visible
+ * framebuffer. Otherwise there can be corruptions. Also, if a user-space
+ * provides damage clips which doesn't encompass the actual damage to
+ * framebuffer (since last plane update) can result in incorrect rendering.
+ *
+ * FB_DAMAGE_CLIPS is a blob property with the layout of blob data is simply an
+ * array of &drm_mode_rect. Unlike plane &drm_plane_state.src coordinates,
+ * damage clips are not in 16.16 fixed point. Similar to plane src in
+ * framebuffer, damage clips cannot be negative. In damage clip, x1/y1 are
+ * inclusive and x2/y2 are exclusive. While kernel does not error for overlapped
+ * damage clips, it is strongly discouraged.
+ *
+ * Drivers that are interested in damage interface for plane should enable
+ * FB_DAMAGE_CLIPS property by calling drm_plane_enable_fb_damage_clips().
+ * Drivers implementing damage can use drm_atomic_helper_damage_iter_init() and
+ * drm_atomic_helper_damage_iter_next() helper iterator function to get damage
+ * rectangles clipped to &drm_plane_state.src.
+ */
+
+/**
+ * drm_plane_enable_fb_damage_clips - Enables plane fb damage clips property.
+ * @plane: Plane on which to enable damage clips property.
+ *
+ * This function lets driver to enable the damage clips property on a plane.
+ */
+void drm_plane_enable_fb_damage_clips(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	drm_object_attach_property(&plane->base, config->prop_fb_damage_clips,
+				   0);
+}
+EXPORT_SYMBOL(drm_plane_enable_fb_damage_clips);
+
 /**
  * drm_plane_get_damage_clips_count - Returns damage clips count.
  * @state: Plane state.
diff --git a/include/drm/drm_damage_helper.h b/include/drm/drm_damage_helper.h
index 1ae8bce6a5ce..effda42cce31 100644
--- a/include/drm/drm_damage_helper.h
+++ b/include/drm/drm_damage_helper.h
@@ -64,7 +64,6 @@ struct drm_atomic_helper_damage_iter {
 	bool full_update;
 };
 
-void drm_plane_enable_fb_damage_clips(struct drm_plane *plane);
 void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 					  struct drm_plane_state *plane_state);
 int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index a2684aab8372..fed97e35626f 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -897,9 +897,10 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
 
 bool drm_any_plane_has_format(struct drm_device *dev,
 			      u32 format, u64 modifier);
+
+void drm_plane_enable_fb_damage_clips(struct drm_plane *plane);
 unsigned int
 drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
-
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
-- 
2.32.0

