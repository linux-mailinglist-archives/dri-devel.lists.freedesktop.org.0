Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A568F97C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 22:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6F410E860;
	Wed,  8 Feb 2023 21:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BAE10E860;
 Wed,  8 Feb 2023 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675890622; x=1707426622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EICfGrcgFp4pD1wu67tjv5dZ89kguSgtYMBc4lxwVpI=;
 b=YIilwn8IgV+psi8MFMUxUH0h8ISOHUjt+bGlLzBCDbbLuwa4k1VEPugT
 u2eQFhS0up/33b3di2svgaHS00FXYJ3ZIbCY14EMn+k1o3KRqlckAGRgZ
 vNYUJnWMbrz+bxPamtj9OAVZB2BVGl6Ws1C3AfMf5Oc0a82CWKZ5re5n/
 Je02SSEq581chgFuc3zmcX3j2eEhorKG9udpn4MeIxdiRUHZA7i6w3SKm
 /cSpHd3GxmxN6bg2DUCNHvOcEs6a8imOZXzRl9tkSYUMkZ0r4fb1vakKA
 v0kfeDn8iq32Uk6tbQ5OTeMFWh8avRZ0hwEjY2O8+coqLAtDaJpQ3W9gr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="329953588"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="329953588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 13:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660786218"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="660786218"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga007.jf.intel.com with SMTP; 08 Feb 2023 13:10:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Feb 2023 23:10:16 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Date: Wed,  8 Feb 2023 23:10:16 +0200
Message-Id: <20230208211016.7034-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 intel-gfx@lists.freedesktop.org,
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

v2: Try to add some docs

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++
 drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  5 ++++
 include/drm/drm_plane.h           |  4 +++
 include/uapi/drm/drm_mode.h       | 11 +++++++
 5 files changed, 75 insertions(+)

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
index 24e7998d1731..ae51b1f83755 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -140,6 +140,21 @@
  *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
  *     various bugs in this area with inconsistencies between the capability
  *     flag and per-plane properties.
+ *
+ * SIZE_HINTS:
+ *     Blob property which contains the set of recommended plane size
+ *     which can used for simple "cursor like" use cases (eg. no scaling).
+ *     Using these hints frees userspace from extensive probing of
+ *     supported plane sizes through atomic/setcursor ioctls.
+ *
+ *     For optimal usage userspace should pick the smallest size
+ *     that satisfies its own requirements.
+ *
+ *     The blob contains an array of struct drm_plane_size_hint.
+ *
+ *     Drivers should only attach this property to planes that
+ *     support a very limited set of sizes (eg. cursor planes
+ *     on typical hardware).
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
@@ -1582,3 +1597,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
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
index e5b053001d22..5bc8aed9b445 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -949,6 +949,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @size_hints_propertty: Plane SIZE_HINTS property.
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
index 46becedf5b2f..9d7c5967264f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -849,6 +849,17 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_plane_size_hint - Plane size hints
+ *
+ * The plane SIZE_HINTS property blob contains an
+ * array of struct drm_plane_size_hint.
+ */
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

