Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A658BE375
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4912210F6E9;
	Tue,  7 May 2024 13:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p1MtUNP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4259E10F9C4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 13:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AEE0D61760;
 Tue,  7 May 2024 13:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A3BC3277B;
 Tue,  7 May 2024 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715087917;
 bh=RN/G2T+h0gDIvoAMWemqAVAc9PVQmQKSA0ShqGvtKJY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=p1MtUNP3alS+Mw2uXOmD69n8VQrwqY1+W7h/Q9CXVoRurF6zE+tdPsneoH97HjzNy
 b1BcASFzArqitVDPaDUmU1PNPPoA/EPN2MgFLbcwMzndkIzxtUewhbpi+MkqgjrD7Z
 e/EnQ/aot22pwAveTuUdQXB1R+EYEPuv8lNNdEyoj69j056FCQeD1+biz+ZGf4sZn/
 salazQz7IfQcwnhiEjgZpYjEn7ETSYcd5vkygYsbz+BV313+gos/R6uvomRZNx6koX
 Y9oYO4KXIFSHo/Wr9cBagRys++jDv8bcjQ3feBh059EgLVuj+h7EeyzaUVKzvG0l1A
 jTKg4I34ctYvg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 07 May 2024 15:17:37 +0200
Subject: [PATCH v13 19/28] drm/connector: hdmi: Add RGB Quantization Range
 to the connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240507-kms-hdmi-connector-state-v13-19-8fafc5efe8be@kernel.org>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
In-Reply-To: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4100; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RN/G2T+h0gDIvoAMWemqAVAc9PVQmQKSA0ShqGvtKJY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGlWmu//neJd9GHTqncbTuxfxbjaU6lKZeu1ZfOL7+6aI
 X9+4/ba8x1TWRiEORlkxRRZnsiEnV7evrjKwX7lD5g5rEwgQxi4OAVgIgrmjLWCOneTmhgTbnid
 +pE0ZfuxCQ+1pl4M3JyYLiwSEPwzoHvapopnMxd+nKqXUNJ7pUtI3Y+xvkRx/vW8rjtHGua2vHr
 54XWsaN4rNamqDUXWOouiH4b2z3RYvLUyes+CLom+7aeze4quAwA=
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

HDMI controller drivers will need to figure out the RGB range they need
to configure based on a mode and property values. Let's expose that in
the HDMI connector state so drivers can just use that value.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 29 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                    |  1 +
 include/drm/drm_connector.h                     |  6 +++++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index f038f567ab43..c3a10f9f7ecd 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -49,10 +49,37 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
 		return NULL;
 
 	return &crtc_state->mode;
 }
 
+static bool hdmi_is_limited_range(const struct drm_connector *connector,
+				  const struct drm_connector_state *conn_state)
+{
+	const struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_mode *mode =
+		connector_state_get_mode(conn_state);
+
+	/*
+	 * The Broadcast RGB property only applies to RGB format, and
+	 * i915 just assumes limited range for YCbCr output, so let's
+	 * just do the same.
+	 */
+	if (conn_state->hdmi.output_format != HDMI_COLORSPACE_RGB)
+		return true;
+
+	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_FULL)
+		return false;
+
+	if (conn_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+		return true;
+
+	if (!info->is_hdmi)
+		return false;
+
+	return drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
+}
+
 static bool
 sink_supports_format_bpc(const struct drm_connector *connector,
 			 const struct drm_display_info *info,
 			 const struct drm_display_mode *mode,
 			 unsigned int format, unsigned int bpc)
@@ -309,10 +336,12 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
 		drm_atomic_get_new_connector_state(state, connector);
 	const struct drm_display_mode *mode =
 		connector_state_get_mode(new_conn_state);
 	int ret;
 
+	new_conn_state->hdmi.is_limited_range = hdmi_is_limited_range(connector, new_conn_state);
+
 	ret = hdmi_compute_config(connector, new_conn_state, mode);
 	if (ret)
 		return ret;
 
 	if (old_conn_state->hdmi.broadcast_rgb != new_conn_state->hdmi.broadcast_rgb ||
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3e57d98d8418..07b4b394e3bf 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1145,10 +1145,11 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
 		drm_printf(p, "\tbroadcast_rgb=%s\n",
 			   drm_hdmi_connector_get_broadcast_rgb_name(state->hdmi.broadcast_rgb));
+		drm_printf(p, "\tis_limited_range=%c\n", state->hdmi.is_limited_range ? 'y' : 'n');
 		drm_printf(p, "\toutput_bpc=%u\n", state->hdmi.output_bpc);
 		drm_printf(p, "\toutput_format=%s\n",
 			   drm_hdmi_connector_get_output_format_name(state->hdmi.output_format));
 		drm_printf(p, "\ttmds_char_rate=%llu\n", state->hdmi.tmds_char_rate);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a40eaf3a8ce4..1fca26d51218 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1068,10 +1068,16 @@ struct drm_connector_state {
 		 * @broadcast_rgb: Connector property to pass the
 		 * Broadcast RGB selection value.
 		 */
 		enum drm_hdmi_broadcast_rgb broadcast_rgb;
 
+		/**
+		 * @is_full_range: Is the output supposed to use a full
+		 * RGB Quantization Range or not?
+		 */
+		bool is_limited_range;
+
 		/**
 		 * @output_bpc: Bits per color channel to output.
 		 */
 		unsigned int output_bpc;
 

-- 
2.45.0

