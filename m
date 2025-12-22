Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB56FCD57E9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B57D10E30F;
	Mon, 22 Dec 2025 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nu6IiE8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D7510E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:11:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 08D81C1AE05;
 Mon, 22 Dec 2025 10:11:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 04160606C1;
 Mon, 22 Dec 2025 10:11:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3416E10AB0194; Mon, 22 Dec 2025 11:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sl8Le4obEhXGwn4WHUvMuISFrlY/VG+RoyMboE2Djac=;
 b=nu6IiE8vadVnag0rhvBR2/mG4P3I+i4gP1Ns/G9RY99Xa4ZYMFC3kG+Tjf+pwJwcOSv5rk
 Cl48giFtY2zY3s4IbcMHuOuWZMhXqbua210Nw3WaSviUmxwgs0sTWcGzhA1UJCv4O+87lq
 tEVszuZZDRln1/yhreHGeXUJXRuSBzoxhNEFX4JGlP+1BDxorCeV5aT6vvkUBXB5mBnf8g
 GXPdDuXhoF3gyDIPXZfaI61V/OTp+assXwK2DjCfzXITLSeps3GtKF9v77bpKPisEAWutP
 83/stESSIsWYmQiDaknD5Kll/MYdpA2HwfLWypIovmzGKLjq2IUtEkDU9RSVhg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:17 +0100
Subject: [PATCH v3 15/33] drm/vkms: Introduce config for plane color range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-15-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10940;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YsXBxTtZ2dfU4I3O7VtTUuslG1wNR+/6hNxx1wqF1IM=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlB39/nUq+Fu3ban5KWaGpUyua+JCgW+fz/S
 IK/gQoMPm2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKVVA/8CMK0EPQGVNgGsuDUeRIRK4S2WscNlfh
 CZhHEMBH1/yE77ExdDYBGbN9i+bRfTcLDwOfCvrmiL5mrbi0OAIs2kFxs0HpGpm7QLTyoGUZSCz
 yXJ45JxLWJBXPNuJtZZSKRrG2mk567b9+PtwJ6d3p8xyY2G46Kt6XLZxuj2EyohN6ZaSX9Kh5OG
 6gfT+VJLcqRSoJZm3/KcdMEYDAQC5XducZcrIOBnF5Uajll62DD7nFd2gQzI53uz1i73L0npEiu
 Wx0iVFFC3ZdGGRwMWJbMLLRDoL/qQ0/uJcs8WzFggPH1qdZOKPPrjhIfUMSD6JJsvt7H715xew/
 7Ln4DhRFF/Bezwd5DIzDGk7z5pS0UMAPwzswvYG7BEEv90KW8F+m/88ocbk0Td1D0dmV4kJmKYc
 A6jcgWJQ5dYcFtisBcUQvHwIRapRTbpaW+pcoTVdg0tBOjHuLk2WCsFLnqJturYyD7Bx19urvAY
 lzerhKjfjbmgWFzt6Wq2ew8xQCpLTfM2slo+Rr5dETbBSfaGXWzVS4P82CAIDU+Alt8oZvrB/vd
 snc55XJmvfQmdgUlpdMtUqidOnnf+HdUvzvxSVRoQSS0fHL9fWRdIMIlNT5YQ+vpcCtb5yXKUKu
 ZN9QltNLl50hqOGUeDKlZF63YQojfKVzuA/EeQ0ujWeXEwG1Tlyw=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

VKMS driver supports all the color range on planes, but for testing it can
be useful to only advertise few of them. This new configuration interface
will allow configuring the color range per planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 44 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 39 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 35 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c             |  8 ++---
 4 files changed, 122 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index a2a3f1a106a3..a88d8b4a969e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_mode.h>
 #include <kunit/test.h>
 
@@ -562,6 +563,7 @@ static void vkms_config_test_valid_plane_color_encoding(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
 
 	/* Valid, no supported or color encoding */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
 	vkms_config_plane_set_supported_color_encodings(plane_cfg, 0);
 	vkms_config_plane_set_default_color_encoding(plane_cfg, 0);
 	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_encoding(config, plane_cfg));
@@ -576,6 +578,47 @@ static void vkms_config_test_valid_plane_color_encoding(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_plane_color_range(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+
+	config = vkms_config_default_create(false, false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = get_first_plane(config);
+
+	/* Valid, all color range supported */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg,
+						     BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						     BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid, default color range is not supported */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg,
+						     BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_LIMITED_RANGE);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Valid, no supported or color range */
+	vkms_config_plane_set_supported_color_encodings(plane_cfg, 0);
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
+	vkms_config_plane_set_default_color_range(plane_cfg, 0);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Valid, if no supported color range, default is ignored */
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, 0);
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_LIMITED_RANGE);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_color_range(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -1100,6 +1143,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
 	KUNIT_CASE(vkms_config_test_valid_plane_rotations),
 	KUNIT_CASE(vkms_config_test_valid_plane_color_encoding),
+	KUNIT_CASE(vkms_config_test_valid_plane_color_range),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 486cdd1f54a4..5591e0baf1a1 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -198,6 +198,25 @@ bool vkms_config_valid_plane_color_encoding(const struct vkms_config *config,
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_encoding);
 
+VISIBLE_IF_KUNIT
+bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
+					 const struct vkms_config_plane *plane_cfg)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+
+	if (vkms_config_plane_get_supported_color_ranges(plane_cfg)) {
+		if ((BIT(vkms_config_plane_get_default_color_range(plane_cfg)) &
+		     vkms_config_plane_get_supported_color_ranges(plane_cfg)) !=
+		    BIT(vkms_config_plane_get_default_color_range(plane_cfg))) {
+			drm_info(dev, "Configured default color range is not supported by the plane\n");
+			return false;
+		}
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_color_range);
+
 static bool valid_planes_for_crtc(const struct vkms_config *config,
 				  struct vkms_config_crtc *crtc_cfg)
 {
@@ -354,6 +373,7 @@ static bool valid_connector_possible_encoders(const struct vkms_config *config)
 
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_plane *plane_cfg;
 
@@ -363,6 +383,16 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 
 		if (!vkms_config_valid_plane_color_encoding(config, plane_cfg))
 			return false;
+
+		if (!vkms_config_valid_plane_color_range(config, plane_cfg))
+			return false;
+
+		if ((vkms_config_plane_get_supported_color_encodings(plane_cfg) == 0) !=
+		    (vkms_config_plane_get_supported_color_ranges(plane_cfg) == 0)) {
+			drm_info(dev,
+				 "Both supported color encodings and color ranges must be set, or none\n");
+			return false;
+		}
 	}
 
 	if (!valid_plane_number(config))
@@ -446,6 +476,12 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "\n");
 		seq_printf(m, "\tdefault color encoding=%s\n",
 			   drm_get_color_encoding_name(vkms_config_plane_get_default_color_encoding(plane_cfg)));
+		seq_puts(m, "\tsupported color ranges=");
+		show_bitfield(m, vkms_config_plane_get_supported_color_ranges(plane_cfg),
+			      drm_get_color_range_name);
+		seq_puts(m, "\n");
+		seq_printf(m, "\tdefault color range=%s\n",
+			   drm_get_color_range_name(vkms_config_plane_get_default_color_range(plane_cfg)));
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -495,6 +531,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 							BIT(DRM_COLOR_YCBCR_BT709) |
 							BIT(DRM_COLOR_YCBCR_BT2020));
 	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
+	vkms_config_plane_set_supported_color_ranges(plane_cfg, BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+								BIT(DRM_COLOR_YCBCR_FULL_RANGE));
+	vkms_config_plane_set_default_color_range(plane_cfg, DRM_COLOR_YCBCR_FULL_RANGE);
 
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index cae7c3b3da07..bb2721a18d61 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -47,6 +47,8 @@ struct vkms_config {
  *         must be managed by other means.
  * @default_color_encoding: Default color encoding that should be used by this plane
  * @supported_color_encodings: Color encodings that this plane will support
+ * @default_color_range: Default color range that should be used by this plane
+ * @supported_color_ranges: Color ranges that this plane will support
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -58,6 +60,8 @@ struct vkms_config_plane {
 	unsigned int supported_rotations;
 	enum drm_color_encoding default_color_encoding;
 	unsigned int supported_color_encodings;
+	enum drm_color_range default_color_range;
+	unsigned int supported_color_ranges;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -439,6 +443,37 @@ bool vkms_config_valid_plane_color_encoding(const struct vkms_config *config,
 					    const struct vkms_config_plane *plane_cfg);
 #endif
 
+static inline enum drm_color_range
+vkms_config_plane_get_default_color_range(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->default_color_range;
+}
+
+static inline void
+vkms_config_plane_set_default_color_range(struct vkms_config_plane *plane_cfg,
+					  enum drm_color_range default_color_range)
+{
+	plane_cfg->default_color_range = default_color_range;
+}
+
+static inline unsigned int
+vkms_config_plane_get_supported_color_ranges(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_color_ranges;
+}
+
+static inline void
+vkms_config_plane_set_supported_color_ranges(struct vkms_config_plane *plane_cfg,
+					     unsigned int supported_color_ranges)
+{
+	plane_cfg->supported_color_ranges = supported_color_ranges;
+}
+
+#if IS_ENABLED(CONFIG_KUNIT)
+bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
+					 const struct vkms_config_plane *plane_cfg);
+#endif
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 49544839f7dd..6461cf025a27 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -239,13 +239,13 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					   vkms_config_plane_get_default_rotation(plane_cfg),
 					   vkms_config_plane_get_supported_rotations(plane_cfg));
 
-	if (vkms_config_plane_get_supported_color_encodings(plane_cfg) != 0)
+	if (vkms_config_plane_get_supported_color_encodings(plane_cfg) != 0 &&
+	    vkms_config_plane_get_supported_color_ranges(plane_cfg) != 0)
 		drm_plane_create_color_properties(&plane->base,
 						  vkms_config_plane_get_supported_color_encodings(plane_cfg),
-						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
-						  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						  vkms_config_plane_get_supported_color_ranges(plane_cfg),
 						  vkms_config_plane_get_default_color_encoding(plane_cfg),
-						  DRM_COLOR_YCBCR_FULL_RANGE);
+						  vkms_config_plane_get_default_color_range(plane_cfg));
 
 	if (vkms_config_plane_get_default_pipeline(plane_cfg))
 		vkms_initialize_colorops(&plane->base);

-- 
2.51.2

