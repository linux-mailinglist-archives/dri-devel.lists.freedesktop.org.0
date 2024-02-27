Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408986A04B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 20:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FDE10E774;
	Tue, 27 Feb 2024 19:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuB31C76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCB810E5CC;
 Tue, 27 Feb 2024 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709062533; x=1740598533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hQEvAWhj1YTK4rbB0MD5bqo/v/sbCPDOTSwaSBQzqs4=;
 b=QuB31C76INnsTGqx5M5DNQb9vOhd0oWUOgAFaCBvZ2w/OJSs8ZGyzgpA
 EhIr/dwwaFykmudi6lmiZ+lfTWep4iGg30Y8n9ythUgZFTsMmwOPynVaB
 yVQYZ6HQXwdgZ7dfhwgjre4Wu0SuD6jP2t5QBBvbHgGudfrSib4UmmWt0
 cmofPZ3YTDan06YYt5w+ocUDMKYdiF+BQx4N/N5BFswxp8r1HkbiQa1C6
 Cnq0H2Md6ByPyuUjq+GVt/LqBsq/tOCPM0AL1WKoDsvkvjSOdq4PIpzvt
 qKawFtBdRp7DzOe2SfsZLTO8sB7Gg7W3invsIjtDxG+2iXBkTrfRm+mKz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6377144"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="6377144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 11:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="827770859"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="827770859"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 27 Feb 2024 11:35:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Feb 2024 21:35:28 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Date: Tue, 27 Feb 2024 21:35:22 +0200
Message-ID: <20240227193523.5601-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
References: <20240227193523.5601-1-ville.syrjala@linux.intel.com>
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

Userspace consumer in the form of mutter seems ready:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3165

v2: Try to add some docs
v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
    Drop the note about typical hardware (Pekka)
v4: Update the docs to indicate the list is "in order of preference"
    Add a a link to the mutter MR

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++++
 drivers/gpu/drm/drm_plane.c       | 52 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  5 +++
 include/drm/drm_plane.h           |  4 +++
 include/uapi/drm/drm_mode.h       | 11 +++++++
 5 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 48fd2d67f352..568972258222 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -372,6 +372,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
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
index 672c655c7a8e..4135ce16e608 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -140,6 +140,25 @@
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
+ *     The blob contains an array of struct drm_plane_size_hint, in
+ *     order of preference. For optimal usage userspace should pick
+ *     the first size that satisfies its own requirements.
+ *
+ *     Drivers should only attach this property to planes that
+ *     support a very limited set of sizes.
+ *
+ *     Note that property value 0 (ie. no blob) is reserved for potential
+ *     future use. Current userspace is expected to ignore the property
+ *     if the value is 0, and fall back to some other means (eg.
+ *     &DRM_CAP_CURSOR_WIDTH and &DRM_CAP_CURSOR_HEIGHT) to determine
+ *     the appropriate plane size to use.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
@@ -1729,3 +1748,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
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
index 973119a9176b..9d8acf7a10eb 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -942,6 +942,11 @@ struct drm_mode_config {
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
index 641fe298052d..ec1112208b73 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -32,6 +32,7 @@
 #include <drm/drm_util.h>
 
 struct drm_crtc;
+struct drm_plane_size_hint;
 struct drm_printer;
 struct drm_modeset_acquire_ctx;
 
@@ -976,5 +977,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      const struct drm_plane_size_hint *hints,
+				      int num_hints);
 
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7040e7ea80c7..1ca5c7e418fd 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -865,6 +865,17 @@ struct drm_color_lut {
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
2.43.0

