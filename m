Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A27068E6F4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 05:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE87510E050;
	Wed,  8 Feb 2023 04:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7EF10E6B6;
 Wed,  8 Feb 2023 04:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675829360; x=1707365360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rsXNLQ+UBBcE4H5ydNYsoldWQweaKEN8ZuI8oHHLnYA=;
 b=ixAmUQ9i0HDI2/8dhbmLPK6ku0sR/ASY8TxuwYJwSghTAzsEE0LqesCD
 L13lbPUfQ6evWcc61YEskZn5CRSAefiZ368G+b6M/lzKlOlQVko9+lZ9d
 rf2UiFfZw/lEqs2kXXJqn7YYJB9Dc8h3wtdvPK6sJSmxzBI+xcTcHO8lP
 ahf4yvgTNQNAMfrVdjTx7KOpC3nBU6cE8rakHepnxxYBEBn+eK2Xx2YDF
 yevFzoMAgS7AY4H4N+ilCUJRNHa9s60jYI5ofADuhzPe+8zySiaSW8BNK
 MDx+sAHaR+GeYtQVlriPXDXrNw5mFct9M0Uv34piI/d5t71EVJfqqdhBT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330997982"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="330997982"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 20:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="697519848"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; d="scan'208";a="697519848"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 07 Feb 2023 20:09:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Feb 2023 06:09:16 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Introduce plane SIZE_HINTS property
Date: Wed,  8 Feb 2023 06:09:10 +0200
Message-Id: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
References: <20230208040911.12590-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a new immutable plane property by which a plane can advertise
a handful of recommended plane sizes. This would be mostly exposed
by cursor planes as a slightly more capable replacement for
the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
a one size fits all limit for the whole device.

Currently eg. amdgpu/i915/nouveau just advertize the max cursor
size via the cursor size caps. But always using the max sized
cursor can waste a surprising amount of power, so a better
stragey is desirable.

Most other drivers don't specify any cursor size at all, in
which case the ioctl code just claims that 64x64 is a great
choice. Whether that is actually true is debatable.

A poll of various compositor developers informs us that
blindly probing with setcursor/atomic ioctl to determine
suitable cursor sizes is not acceptable, thus the
introduction of the new property to supplant the cursor
size caps. The compositor will now be free to select a
more optimal cursor size from the short list of options.

Note that the reported sizes (either via the property or the
caps) make no claims about things such as plane scaling. So
these things should only really be consulted for simple
"cursor like" use cases.

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++++
 drivers/gpu/drm/drm_plane.c       | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  5 +++++
 include/drm/drm_plane.h           |  4 ++++
 include/uapi/drm/drm_mode.h       |  5 +++++
 5 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 87eb591fe9b5..21860f94a18c 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
 		return -ENOMEM;
 	dev->mode_config.modifiers_property = prop;
 
+	prop = drm_property_create(dev,
+				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
+				   "SIZE_HINTS", 0);
+	if (!prop)
+		return -ENOMEM;
+	dev->mode_config.size_hints_property = prop;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..d0a277f4be1f 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1582,3 +1582,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
+
+/**
+ * drm_plane_add_size_hint_property - create a size hint property
+ *
+ * @plane: drm plane
+ * @hints: size hints
+ * @num_hints: number of size hints
+ *
+ * Create a size hints property for the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      const struct drm_plane_size_hint *hints,
+				      int num_hints)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
+
+	blob = drm_property_create_blob(dev,
+					array_size(sizeof(hints[0]), num_hints),
+					hints);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	drm_object_attach_property(&plane->base, config->size_hints_property,
+				   blob->base.id);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_add_size_hints_property);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22..ed9f6938dca1 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -949,6 +949,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @size_hints_property: Plane SIZE_HINTS property.
+	 */
+	struct drm_property *size_hints_property;
+
 	/* cursor size */
 	uint32_t cursor_width, cursor_height;
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..1997d7d64b69 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -32,6 +32,7 @@
 #include <drm/drm_util.h>
 
 struct drm_crtc;
+struct drm_plane_size_hint;
 struct drm_printer;
 struct drm_modeset_acquire_ctx;
 
@@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      const struct drm_plane_size_hint *hints,
+				      int num_hints);
 
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..4f0551d7f481 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -849,6 +849,11 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+struct drm_plane_size_hint {
+	__u16 width;
+	__u16 height;
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.39.1

