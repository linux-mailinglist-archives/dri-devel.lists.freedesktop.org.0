Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA48600B0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A304410EA01;
	Thu, 22 Feb 2024 18:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RjU+3Y0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9952A10E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 18:15:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DF37CE28BA;
 Thu, 22 Feb 2024 18:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C94C433C7;
 Thu, 22 Feb 2024 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708625721;
 bh=EaHy6j+3RjBAOh9evmI3+WZxOll+3PxO3So+9Nmr8uU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RjU+3Y0Qp97jEPnuwAWu+BVqwe3nBGiVfnsb3fmScLt0ALTTS7tb7tiFH4wV5EDag
 E3vB/U6lMRdIi4HMkaaKCOL+vI8HHQKNZVZ8LT5y8LCCB8Y3H1tH8yUHKulIp7KFw5
 n99mXESPM9SY+waLgOqXT+6h4HV83u7Ov/OAw6xQnSSY7jIAfZ7OeCH38aTqbtii6W
 EXlgSoGmgukuEfYa81IrCc+vcxuZv5RJ/aWeFM4SLL2Cgw+gtXIS7eiundvcqt48Ax
 OGBtjWsBDXKz3Nh9CVoQOWniyNvnD1A3PMjBo37aQqTRybghDYqB7Zhv6frloL7Yj3
 kqSQrNXjm0/Yg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Feb 2024 19:14:05 +0100
Subject: [PATCH v7 19/36] drm/connector: hdmi: Compute bpc and format
 automatically
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-kms-hdmi-connector-state-v7-19-8f4af575fce2@kernel.org>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9869; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EaHy6j+3RjBAOh9evmI3+WZxOll+3PxO3So+9Nmr8uU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKnX+76WG+1qX+3iLbfI5ee/v0ujGXtr93stk/3C/f7wf
 J27U7+c6ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBESg4y/LN70d5X9tV76wH7
 DQeXrPR1uPya8fTPaK8td/dGfn6otf49I8O5S+f85DxE7j2R//ll9dL3y/byZgbJpV0N264edfC
 R0Wp+AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we have all the infrastructure needed, we can add some code
that will, for a given connector state and mode, compute the best output
format and bpc.

The algorithm is equivalent to the one already found in i915 and vc4.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c          | 184 ++++++++++++++++++++-
 .../gpu/drm/tests/drm_atomic_state_helper_test.c   |  25 ++-
 2 files changed, 197 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 448b4a73d1c8..9f517599f117 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -31,6 +31,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
@@ -662,6 +663,96 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 	return &crtc_state->mode;
 }
 
+static bool
+sink_supports_format_bpc(const struct drm_connector *connector,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode,
+			 unsigned int format, unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+	u8 vic = drm_match_cea_mode(mode);
+
+	if (vic == 1 && bpc != 8) {
+		drm_dbg(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
+		return false;
+	}
+
+	if (!info->is_hdmi &&
+	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
+		drm_dbg(dev, "DVI Monitors require an RGB output at 8 bpc\n");
+		return false;
+	}
+
+	if (!(connector->hdmi.supported_formats & BIT(format))) {
+		drm_dbg(dev, "%s format unsupported by the connector.\n",
+			drm_hdmi_connector_get_output_format_name(format));
+		return false;
+	}
+
+	switch (format) {
+	case HDMI_COLORSPACE_RGB:
+		drm_dbg(dev, "RGB Format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444))
+			return false;
+
+		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "RGB format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV422:
+		drm_dbg(dev, "YUV422 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR422)) {
+			drm_dbg(dev, "Sink doesn't support YUV422.\n");
+			return false;
+		}
+
+		if (bpc != 12) {
+			drm_dbg(dev, "YUV422 only supports 12 bpc.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV422 format supported in that configuration.\n");
+
+		return true;
+
+	case HDMI_COLORSPACE_YUV444:
+		drm_dbg(dev, "YUV444 format, checking the constraints.\n");
+
+		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR444)) {
+			drm_dbg(dev, "Sink doesn't support YUV444.\n");
+			return false;
+		}
+
+		if (bpc == 10 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30)) {
+			drm_dbg(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
+			return false;
+		}
+
+		if (bpc == 12 && !(info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36)) {
+			drm_dbg(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
+			return false;
+		}
+
+		drm_dbg(dev, "YUV444 format supported in that configuration.\n");
+
+		return true;
+	}
+
+	return false;
+}
+
 static enum drm_mode_status
 hdmi_clock_valid(const struct drm_connector *connector,
 		 const struct drm_display_mode *mode,
@@ -706,6 +797,95 @@ hdmi_compute_clock(const struct drm_connector *connector,
 	return 0;
 }
 
+static bool
+hdmi_try_format_bpc(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc, enum hdmi_colorspace fmt)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	struct drm_device *dev = connector->dev;
+	int ret;
+
+	drm_dbg(dev, "Trying %s output format\n",
+		drm_hdmi_connector_get_output_format_name(fmt));
+
+	if (!sink_supports_format_bpc(connector, info, mode, fmt, bpc)) {
+		drm_dbg(dev, "%s output format not supported with %u bpc\n",
+			drm_hdmi_connector_get_output_format_name(fmt), bpc);
+		return false;
+	}
+
+	ret = hdmi_compute_clock(connector, state, mode, bpc, fmt);
+	if (ret) {
+		drm_dbg(dev, "Couldn't compute clock for %s output format and %u bpc\n",
+			drm_hdmi_connector_get_output_format_name(fmt), bpc);
+		return false;
+	}
+
+	drm_dbg(dev, "%s output format supported with %u (TMDS char rate: %llu Hz)\n",
+		drm_hdmi_connector_get_output_format_name(fmt), bpc, state->hdmi.tmds_char_rate);
+
+	return true;
+}
+
+static int
+hdmi_compute_format(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode,
+		    unsigned int bpc)
+{
+	struct drm_device *dev = connector->dev;
+
+	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_RGB)) {
+		state->hdmi.output_format = HDMI_COLORSPACE_RGB;
+		return 0;
+	}
+
+	if (hdmi_try_format_bpc(connector, state, mode, bpc, HDMI_COLORSPACE_YUV422)) {
+		state->hdmi.output_format = HDMI_COLORSPACE_YUV422;
+		return 0;
+	}
+
+	drm_dbg(dev, "Failed. No Format Supported for that bpc count.\n");
+
+	return -EINVAL;
+}
+
+static int
+hdmi_compute_config(const struct drm_connector *connector,
+		    struct drm_connector_state *state,
+		    const struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	unsigned int max_bpc = clamp_t(unsigned int,
+				       state->max_bpc,
+				       8, connector->max_bpc);
+	unsigned int bpc;
+	int ret;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		drm_dbg(dev, "Trying with a %d bpc output\n", bpc);
+
+		ret = hdmi_compute_format(connector, state, mode, bpc);
+		if (ret)
+			continue;
+
+		state->hdmi.output_bpc = bpc;
+
+		drm_dbg(dev,
+			"Mode %ux%u @ %uHz: Found configuration: bpc: %u, fmt: %s, clock: %llu\n",
+			mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
+			state->hdmi.output_bpc,
+			drm_hdmi_connector_get_output_format_name(state->hdmi.output_format),
+			state->hdmi.tmds_char_rate);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
  * @connector: DRM Connector
@@ -729,9 +909,7 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		connector_state_get_mode(new_state);
 	int ret;
 
-	ret = hdmi_compute_clock(connector, new_state, mode,
-				 new_state->hdmi.output_bpc,
-				 new_state->hdmi.output_format);
+	ret = hdmi_compute_config(connector, new_state, mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
index 5a8750153510..f010fde0eb69 100644
--- a/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_atomic_state_helper_test.c
@@ -70,9 +70,6 @@ static int light_up_connector(struct kunit *test,
 	conn_state = drm_atomic_get_connector_state(state, connector);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
 
-	conn_state->hdmi.output_bpc = connector->max_bpc;
-	conn_state->hdmi.output_format = HDMI_COLORSPACE_RGB;
-
 	ret = drm_atomic_set_crtc_for_connector(conn_state, crtc);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 
@@ -251,10 +248,15 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -272,11 +274,11 @@ static void drm_test_check_output_bpc_crtc_mode_changed(struct kunit *test)
 	old_conn_state = drm_atomic_get_old_connector_state(state, conn);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, old_conn_state);
 
-	new_conn_state->hdmi.output_bpc = 8;
+	new_conn_state->max_requested_bpc = 8;
 
 	KUNIT_ASSERT_NE(test,
-			old_conn_state->hdmi.output_bpc,
-			new_conn_state->hdmi.output_bpc);
+			old_conn_state->max_requested_bpc,
+			new_conn_state->max_requested_bpc);
 
 	ret = drm_atomic_check_only(state);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -320,10 +322,15 @@ static void drm_test_check_output_bpc_crtc_mode_not_changed(struct kunit *test)
 						     10);
 	KUNIT_ASSERT_NOT_NULL(test, priv);
 
+	conn = &priv->connector;
+	ret = set_connector_edid(test, conn,
+				 test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz,
+				 ARRAY_SIZE(test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	ctx = drm_kunit_helper_acquire_ctx_alloc(test);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
 
-	conn = &priv->connector;
 	preferred = find_preferred_mode(conn);
 	KUNIT_ASSERT_NOT_NULL(test, preferred);
 
@@ -670,7 +677,7 @@ static void drm_test_check_format_value(struct kunit *test)
 
 	conn = &priv->connector;
 	conn_state = conn->state;
-	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, HDMI_COLORSPACE_RGB);
+	KUNIT_EXPECT_EQ(test, conn_state->hdmi.output_format, 0);
 }
 
 /*

-- 
2.43.2

