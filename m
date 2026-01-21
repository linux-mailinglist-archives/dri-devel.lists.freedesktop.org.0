Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GRkI93YcGmraQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:47:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CD57CB8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 14:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E4D10E0E1;
	Wed, 21 Jan 2026 13:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JTFjdymc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E3D10E79D;
 Wed, 21 Jan 2026 13:47:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769003219; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RsAAeleuylYGPWAhcp+dhkZrTTkjsE+Dhizlb/Jq9v683MB97VWceV+WW55uu5ypmrPj0uvr5A4R+D9Bf2oDaSNlnK0lwhAeuEBbqZ0tUzsmvJaP+MnozAXq/0FCeZCjNAbUuZvDPjPG5n/UAjd8l2TGIbvzzDtArypI1c6IFSw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769003219;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qN9JnzXYc1ALB1FaWrHdx2xDY4Ko4GDTc0PdjkixbkY=; 
 b=QVNNPnoWoojtznGErwcIhL1cLLFyCkNOa+NDm2X5K0Em+zGX0+iDl4KrAXNzh9Y1xbileQycGSY1BHJpE0B/pQq7olkv8HJOyLy9KOcdStTDZghBae9yttQAupQCl6Q6KWptVZkZUNkMmDJCGLxubnc5GQCnDuKDDGgwjeebNt4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003219; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=qN9JnzXYc1ALB1FaWrHdx2xDY4Ko4GDTc0PdjkixbkY=;
 b=JTFjdymcyn8A3K4oUtVOBcknotYiVk1qp5XU3vI+7J4IQtGhCIELhd/B0T7lJHba
 jLYQ9E1fQiO9wwCwRXzH9UeSzWI9/J7fDtWMGKi9nLZPHXDE3onCm7dqyRtbcv75mGQ
 lE6T7Ba6+Y/iNM5yv6kZEemFGtxz7iQ+bY499Xrk=
Received: by mx.zohomail.com with SMTPS id 1769003218256395.11230939451;
 Wed, 21 Jan 2026 05:46:58 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:34 +0100
Subject: [PATCH v6 08/21] drm/amdgpu: Implement "color format" DRM property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-8-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 1A8CD57CB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "color format" DRM property allows userspace to explicitly pick a
color format to use. If an unsupported color format is requested,
userspace will be given an error instead of silently having its request
disobeyed.

The default case, which is AUTO, picks YCbCr 4:2:0 if it's a 4:2:0-only
mode, and RGB in all other cases.

Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Co-developed-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 87 +++++++++++++++++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 13 ++++
 2 files changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4a2491a66fdd..a3edf6ce5c5a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6681,11 +6681,14 @@ static void fill_stream_properties_from_drm_display_mode(
 	const struct dc_stream_state *old_stream,
 	int requested_bpc)
 {
+	bool is_dp_or_hdmi = dc_is_hdmi_signal(stream->signal) || dc_is_dp_signal(stream->signal);
 	struct dc_crtc_timing *timing_out = &stream->timing;
 	const struct drm_display_info *info = &connector->display_info;
 	struct amdgpu_dm_connector *aconnector = NULL;
 	struct hdmi_vendor_infoframe hv_frame;
 	struct hdmi_avi_infoframe avi_frame;
+	bool want_420;
+	bool want_422;
 	ssize_t err;
 
 	if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
@@ -6698,20 +6701,39 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->h_border_right = 0;
 	timing_out->v_border_top = 0;
 	timing_out->v_border_bottom = 0;
-	/* TODO: un-hardcode */
-	if (drm_mode_is_420_only(info, mode_in) ||
-	    (aconnector && aconnector->force_yuv420_output &&
-	     drm_mode_is_420_also(info, mode_in)))
+
+	want_420 = (aconnector && aconnector->force_yuv420_output) ||
+		   (connector_state->color_format == DRM_COLOR_FORMAT_YCBCR420);
+	want_422 = (aconnector && aconnector->force_yuv422_output) ||
+		   (connector_state->color_format == DRM_COLOR_FORMAT_YCBCR422);
+
+	if (drm_mode_is_420_only(info, mode_in) && (want_420 || !connector_state->color_format)) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
-			&& aconnector
-			&& aconnector->force_yuv422_output)
+	} else if (drm_mode_is_420_also(info, mode_in) && want_420) {
+		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+	} else if ((info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		   && want_422 && is_dp_or_hdmi) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR422;
-	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
-			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
+	} else if (connector_state->color_format == DRM_COLOR_FORMAT_YCBCR444 &&
+		   (info->color_formats & DRM_COLOR_FORMAT_YCBCR444) && is_dp_or_hdmi) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
-	else
+	} else if ((connector_state->color_format == DRM_COLOR_FORMAT_RGB444 ||
+		   !connector_state->color_format)) {
 		timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	} else {
+		/*
+		 * If a format was explicitly requested but the requested format
+		 * can't be satisfied, set it to an invalid value so that an
+		 * error bubbles up to userspace. This way, userspace knows it
+		 * needs to make a better choice.
+		 */
+		if (connector_state->color_format)
+			timing_out->pixel_encoding = PIXEL_ENCODING_UNDEFINED;
+		else if (drm_mode_is_420_only(info, mode_in))
+			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
+		else
+			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
+	}
 
 	timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
 	timing_out->display_color_depth = convert_color_depth_from_display_info(
@@ -8059,6 +8081,38 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	return dc_result;
 }
 
+static enum dc_status
+dm_validate_stream_color_format(const struct drm_connector_state *drm_state,
+				const struct dc_stream_state *stream)
+{
+	enum dc_pixel_encoding encoding;
+
+	if (!drm_state->color_format)
+		return DC_OK;
+
+	switch (drm_state->color_format) {
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		encoding = PIXEL_ENCODING_RGB;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		encoding = PIXEL_ENCODING_YCBCR444;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		encoding = PIXEL_ENCODING_YCBCR422;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		encoding = PIXEL_ENCODING_YCBCR420;
+		break;
+	default:
+		encoding = PIXEL_ENCODING_UNDEFINED;
+		break;
+	}
+
+	return encoding == stream->timing.pixel_encoding ?
+		DC_OK : DC_UNSUPPORTED_VALUE;
+}
+
 struct dc_stream_state *
 create_validate_stream_for_sink(struct drm_connector *connector,
 				const struct drm_display_mode *drm_mode,
@@ -8105,6 +8159,9 @@ create_validate_stream_for_sink(struct drm_connector *connector,
 		if (dc_result == DC_OK)
 			dc_result = dm_validate_stream_and_context(adev->dm.dc, stream);
 
+		if (dc_result == DC_OK)
+			dc_result = dm_validate_stream_color_format(drm_state, stream);
+
 		if (dc_result != DC_OK) {
 			drm_dbg_kms(connector->dev, "Pruned mode %d x %d (clk %d) %s %s -- %s\n",
 				      drm_mode->hdisplay,
@@ -8928,6 +8985,12 @@ static const u32 supported_colorspaces =
 	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
 	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
 
+static const u32 supported_colorformats =
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -9049,6 +9112,10 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 
 		if (adev->dm.hdcp_workqueue)
 			drm_connector_attach_content_protection_property(&aconnector->base, true);
+
+		if (!drm_mode_create_color_format_property(&aconnector->base,
+							   supported_colorformats))
+			drm_connector_attach_color_format_property(&aconnector->base);
 	}
 
 	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 5e92eaa67aa3..a7b1274ead8d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -52,6 +52,12 @@
 
 #define PEAK_FACTOR_X1000 1006
 
+static const u32 supported_colorformats =
+	DRM_COLOR_FORMAT_RGB444 |
+	DRM_COLOR_FORMAT_YCBCR444 |
+	DRM_COLOR_FORMAT_YCBCR422 |
+	DRM_COLOR_FORMAT_YCBCR420;
+
 /*
  * This function handles both native AUX and I2C-Over-AUX transactions.
  */
@@ -679,6 +685,13 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 	if (connector->max_bpc_property)
 		drm_connector_attach_max_bpc_property(connector, 8, 16);
 
+	connector->color_format_property = master->base.color_format_property;
+	if (connector->color_format_property) {
+		if (!drm_mode_create_color_format_property(&aconnector->base,
+							   supported_colorformats))
+			drm_connector_attach_color_format_property(&aconnector->base);
+	}
+
 	connector->vrr_capable_property = master->base.vrr_capable_property;
 	if (connector->vrr_capable_property)
 		drm_connector_attach_vrr_capable_property(connector);

-- 
2.52.0

