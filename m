Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC46C3469
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 15:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE13410E224;
	Tue, 21 Mar 2023 14:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B95610E224;
 Tue, 21 Mar 2023 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679409495; x=1710945495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3R7O1caVV5ScxkYfE2dsOHf250qg7RYXap0vAmAaZo=;
 b=LQecx2TVNmADlrldXktzI/eeNYwYo3yQQKglSEB6v78mu5ruVhTWmlkV
 OM6pLJaOpOxnurCC+q/G3Uvmfe+f/YzKxq1EMc+p3gENZ3yKBaSjQr1k9
 BBqzz9f5C+/h2b67Kt2a2a3u30oE69x+jYIm8JnF0ChsnmLt+OW0LYRuM
 B412Bghu1vvgF3y80I7QTyAs47ogljFm+hmYr9TSIpuk0iwXRhtrv5R1M
 x5a0ZFYjhrVlw5+E9H3sBEZWzsKFDBk972mgDYSXqDYW3K1Q0azPQMgXC
 OSmDSuM5scAdkkB+uQbvi5x/nQsWvWDsZEPMtK6h/G9tVQ30C1yHkqc8g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="403832763"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="403832763"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674851701"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674851701"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga007.jf.intel.com with SMTP; 21 Mar 2023 07:36:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Mar 2023 16:36:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH v2 1/3] drm: Introduce plane SIZE_HINTS property
Date: Tue, 21 Mar 2023 16:36:41 +0200
Message-Id: <20230321143643.26676-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
References: <20230321143643.26676-1-ville.syrjala@linux.intel.com>
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

The blob contains explicit min and max plane sizes, as
well as a 2D bitmap representing all the square and non-square
power of two sizes between the min and max.

Note that the reported sizes (either via the property or the
caps) make no claims about things such as plane scaling. So
these things should only really be consulted for simple
"cursor like" use cases.

v2: Try to add some docs
v3: Specify that value 0 is reserved for future use (basic idea from Jonas)
    Drop the note about typical hardware (Pekka)
v4: Total redesign to include the 2D bitmap

Cc: Simon Ser <contact@emersion.fr>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c |  7 +++
 drivers/gpu/drm/drm_plane.c       | 96 +++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  5 ++
 include/drm/drm_plane.h           |  6 ++
 include/uapi/drm/drm_mode.h       | 29 ++++++++++
 5 files changed, 143 insertions(+)

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
index 24e7998d1731..fb9cee504767 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -140,6 +140,27 @@
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
+ *     The blob contains explicit min/max sizes, as well as a 2D bitmap
+ *     representign all square and non-square POT sizes between.
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
@@ -1582,3 +1603,78 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
+
+static int hint_dim(int x, int x0, int w, int min, int max)
+{
+	if (x == 0)
+		return min;
+	else if (x == w - 1)
+		return max;
+	else
+		return 1 << (x0 + x);
+}
+
+/**
+ * drm_plane_add_size_hint_property - create a size hint property
+ *
+ * @plane: drm plane
+ * @min_width: minimum width
+ * @min_height: minimum height
+ * @max_width: maximum width
+ * @max_height: maximum height
+ * @cursor_size_ok: function to check if specified size is ok
+ *
+ * Create a size hints property for the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      int min_width, int min_height,
+				      int max_width, int max_height,
+				      bool (*size_ok)(struct drm_plane *plane,
+						      int width, int height))
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_property_blob *blob;
+	struct drm_plane_size_hint *hints;
+	int x, y, x0, y0, w, h;
+
+	x0 = fls(min_width) - 1;
+	y0 = fls(min_height) - 1;
+	w = fls(2 * max_width - 1) - x0;
+	h = fls(2 * max_height - 1) - y0;
+
+	blob = drm_property_create_blob(dev,
+					struct_size(hints, bitmap,
+						    DIV_ROUND_UP(w * h, 32)),
+					NULL);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	hints = blob->data;
+
+	hints->min_width = min_width;
+	hints->min_height = min_height;
+	hints->max_width = max_width;
+	hints->max_height = max_height;
+
+	for (y = 0; y < h; y++) {
+		int height = hint_dim(y, y0, h, min_height, max_height);
+
+		for (x = 0; x < w; x++) {
+			int width = hint_dim(x, x0, w, min_width, max_width);
+			unsigned int bit = y * w + x;
+
+			if (size_ok(plane, width, height))
+				hints->bitmap[bit/32] |= 1 << (bit & 31);
+		}
+	}
+
+	drm_object_attach_property(&plane->base, config->size_hints_property,
+				   blob->base.id);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_add_size_hints_property);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index e5b053001d22..d5495c0804c5 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -949,6 +949,11 @@ struct drm_mode_config {
 	 */
 	struct drm_property *modifiers_property;
 
+	/**
+	 * @size_hints_propertty: Plane size hints property.
+	 */
+	struct drm_property *size_hints_property;
+
 	/* cursor size */
 	uint32_t cursor_width, cursor_height;
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 51291983ea44..6d7326f15761 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -32,6 +32,7 @@
 #include <drm/drm_util.h>
 
 struct drm_crtc;
+struct drm_plane_size_hint;
 struct drm_printer;
 struct drm_modeset_acquire_ctx;
 
@@ -945,5 +946,10 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
+int drm_plane_add_size_hints_property(struct drm_plane *plane,
+				      int min_width, int min_height,
+				      int max_width, int max_height,
+				      bool (*size_ok)(struct drm_plane *plane,
+						      int width, int height));
 
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..5a1de6bd80dd 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -849,6 +849,35 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_plane_size_hint - Plane size hints
+ *
+ * Includes a 2D bitmap in row major order of one bit per plane
+ * size (WxH). The colums represent the possible plane widths as
+ * <min>,<power of two values between min-max>,<max>
+ * the rows do the same for plane heights. The minimums and
+ * maximums need not be power of two themselves. The bits
+ * are walked in lsb->msb order.
+ *
+ * Example:
+ * min_width = 33, min_height = 16
+ * max_width = 128, max_height = 127
+ * bitmap[0] = 0b100111011001
+ *     33 64 128
+ * 16   *
+ * 32   *  *
+ * 64   *  *   *
+ * 127         *
+ *
+ * Indicating support for 33x16,33xx32,
+ * 64x32,64x64,128x64,128x127 sizes.
+ */
+struct drm_plane_size_hint {
+	__u16 min_width, min_height;
+	__u16 max_width, max_height;
+	__u32 bitmap[];
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.39.2

