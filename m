Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI81DVtHqWm33gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:05:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A934B20DF13
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:05:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC110EBA8;
	Thu,  5 Mar 2026 09:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n3Q1hDNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D8010EBB7;
 Thu,  5 Mar 2026 09:05:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 34F526183D;
 Thu,  5 Mar 2026 09:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E9BC19423;
 Thu,  5 Mar 2026 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772701526;
 bh=8B8JtzDFuZLy9KjteSKdgn1Z1TYnFMm7twCZx63a4Uw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=n3Q1hDNFP4pOAUAdjmu14HR7I1BlYaqkeJhRZpn4BDztr1Kyctwn7aSNusQWjawXC
 YNd6OBz+mVW40oB8C73mWXXXfxWuraCz/9w+YlokDxEgKZpmepa4M1qwEHB8QN6IK/
 S0ijgL8jaDQlmFWJN/nxhCzrp7ETSwmL1XgXnF5So9xq6QkveUEXkf9atXCozQIead
 pBlPeWD1ib2XQsHj9sCUDSKw8bsJ91JQGV49uEzVREezS3kgEclSkp8NNyrXSk89LW
 jqMPXnigjB5GAJZeVJ0LvwmMKbj3HEGX3wCYb0k1XF8S/J8QkfV+JRa5fKnruweEwz
 QAKzhap3hN7Xg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:05:00 +0100
Subject: [PATCH v3 08/14] drm/bridge: synopsys: dw-dp: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-8-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9554; i=mripard@kernel.org;
 h=from:subject:message-id; bh=8B8JtzDFuZLy9KjteSKdgn1Z1TYnFMm7twCZx63a4Uw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3S2Dzmjde7p2R/Y6Ia2e0OwXNimLUxb8O/e+JW1Nw
 irW3evaOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEwi0YG1oDA6qWHjN8vzzp
 v+IMx71xU7PfvtDeqXyPWfJqxcaMnkn3o6N/PTRN6BCXNNy+IszhCmPDns699lYfLy9atf3W7Xk
 BV87rFzY7f0zrZ9F+ueBVZsqJ9z4uu5QTN/eI/k+LCUyZnBcFAA==
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
X-Rspamd-Queue-Id: A934B20DF13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Action: no action

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 71 +++++++++++++++++----------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index e7bef9150f6a8eaf0338a4cb6fab516e295c70f7..45b37885d719dcf291383499a69d7e27c36513b2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -377,28 +377,28 @@ enum {
 	DW_DP_PHY_PATTERN_CP2520_2,
 };
 
 struct dw_dp_output_format {
 	u32 bus_format;
-	u32 color_format;
+	enum drm_output_color_format color_format;
 	u8 video_mapping;
 	u8 bpc;
 	u8 bpp;
 };
 
 #define to_dw_dp_bridge_state(s) container_of(s, struct dw_dp_bridge_state, base)
 
 static const struct dw_dp_output_format dw_dp_output_formats[] = {
-	{ MEDIA_BUS_FMT_RGB101010_1X30, DRM_COLOR_FORMAT_RGB444, DW_DP_RGB_10BIT, 10, 30 },
-	{ MEDIA_BUS_FMT_RGB888_1X24, DRM_COLOR_FORMAT_RGB444, DW_DP_RGB_8BIT, 8, 24 },
-	{ MEDIA_BUS_FMT_YUV10_1X30, DRM_COLOR_FORMAT_YCBCR444, DW_DP_YCBCR444_10BIT, 10, 30 },
-	{ MEDIA_BUS_FMT_YUV8_1X24, DRM_COLOR_FORMAT_YCBCR444, DW_DP_YCBCR444_8BIT, 8, 24},
-	{ MEDIA_BUS_FMT_YUYV10_1X20, DRM_COLOR_FORMAT_YCBCR422, DW_DP_YCBCR422_10BIT, 10, 20 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, DRM_COLOR_FORMAT_YCBCR422, DW_DP_YCBCR422_8BIT, 8, 16 },
-	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, DRM_COLOR_FORMAT_YCBCR420, DW_DP_YCBCR420_10BIT, 10, 15 },
-	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, DRM_COLOR_FORMAT_YCBCR420, DW_DP_YCBCR420_8BIT, 8, 12 },
-	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, DRM_COLOR_FORMAT_RGB444, DW_DP_RGB_6BIT, 6, 18 },
+	{ MEDIA_BUS_FMT_RGB101010_1X30, DRM_OUTPUT_COLOR_FORMAT_RGB444, DW_DP_RGB_10BIT, 10, 30 },
+	{ MEDIA_BUS_FMT_RGB888_1X24, DRM_OUTPUT_COLOR_FORMAT_RGB444, DW_DP_RGB_8BIT, 8, 24 },
+	{ MEDIA_BUS_FMT_YUV10_1X30, DRM_OUTPUT_COLOR_FORMAT_YCBCR444, DW_DP_YCBCR444_10BIT, 10, 30 },
+	{ MEDIA_BUS_FMT_YUV8_1X24, DRM_OUTPUT_COLOR_FORMAT_YCBCR444, DW_DP_YCBCR444_8BIT, 8, 24},
+	{ MEDIA_BUS_FMT_YUYV10_1X20, DRM_OUTPUT_COLOR_FORMAT_YCBCR422, DW_DP_YCBCR422_10BIT, 10, 20 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, DRM_OUTPUT_COLOR_FORMAT_YCBCR422, DW_DP_YCBCR422_8BIT, 8, 16 },
+	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30, DRM_OUTPUT_COLOR_FORMAT_YCBCR420, DW_DP_YCBCR420_10BIT, 10, 15 },
+	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24, DRM_OUTPUT_COLOR_FORMAT_YCBCR420, DW_DP_YCBCR420_8BIT, 8, 12 },
+	{ MEDIA_BUS_FMT_RGB666_1X24_CPADHI, DRM_OUTPUT_COLOR_FORMAT_RGB444, DW_DP_RGB_6BIT, 6, 18 },
 };
 
 static const struct dw_dp_output_format *dw_dp_get_output_format(u32 bus_format)
 {
 	unsigned int i;
@@ -1089,26 +1089,26 @@ static int dw_dp_send_vsc_sdp(struct dw_dp *dp)
 	vsc.content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 
 	sdp.flags = DW_DP_SDP_VERTICAL_INTERVAL;
 
 	switch (state->color_format) {
-	case DRM_COLOR_FORMAT_YCBCR444:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
 		vsc.pixelformat = DP_PIXELFORMAT_YUV444;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR420:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
 		vsc.pixelformat = DP_PIXELFORMAT_YUV420;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR422:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
 		vsc.pixelformat = DP_PIXELFORMAT_YUV422;
 		break;
-	case DRM_COLOR_FORMAT_RGB444:
+	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
 	default:
 		vsc.pixelformat = DP_PIXELFORMAT_RGB;
 		break;
 	}
 
-	if (state->color_format == DRM_COLOR_FORMAT_RGB444) {
+	if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_RGB444) {
 		vsc.colorimetry = DP_COLORIMETRY_DEFAULT;
 		vsc.dynamic_range = DP_DYNAMIC_RANGE_VESA;
 	} else {
 		vsc.colorimetry = DP_COLORIMETRY_BT709_YCC;
 		vsc.dynamic_range = DP_DYNAMIC_RANGE_CTA;
@@ -1146,35 +1146,36 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 		return -EINVAL;
 
 	if (!link->vsc_sdp_supported)
 		return false;
 
-	if (state->color_format == DRM_COLOR_FORMAT_YCBCR420)
+	if (state->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 		return true;
 
 	return false;
 }
 
-static int dw_dp_video_set_msa(struct dw_dp *dp, u8 color_format, u8 bpc,
-			       u16 vstart, u16 hstart)
+static int dw_dp_video_set_msa(struct dw_dp *dp,
+			       enum drm_output_color_format color_format,
+			       u8 bpc, u16 vstart, u16 hstart)
 {
 	u16 misc = 0;
 
 	if (dw_dp_video_need_vsc_sdp(dp))
 		misc |= DP_MSA_MISC_COLOR_VSC_SDP;
 
 	switch (color_format) {
-	case DRM_COLOR_FORMAT_RGB444:
+	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
 		misc |= DP_MSA_MISC_COLOR_RGB;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR444:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
 		misc |= DP_MSA_MISC_COLOR_YCBCR_444_BT709;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR422:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
 		misc |= DP_MSA_MISC_COLOR_YCBCR_422_BT709;
 		break;
-	case DRM_COLOR_FORMAT_YCBCR420:
+	case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
 		break;
 	default:
 		return -EINVAL;
 	}
 
@@ -1302,13 +1303,13 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 	average_bytes_per_tu = ts / 1000;
 	average_bytes_per_tu_frac = ts / 100 - average_bytes_per_tu * 10;
 	if (dp->pixel_mode == DW_DP_MP_SINGLE_PIXEL) {
 		if (average_bytes_per_tu < 6)
 			init_threshold = 32;
-		else if (hblank <= 80 && color_format != DRM_COLOR_FORMAT_YCBCR420)
+		else if (hblank <= 80 && color_format != DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 			init_threshold = 12;
-		else if (hblank <= 40 && color_format == DRM_COLOR_FORMAT_YCBCR420)
+		else if (hblank <= 40 && color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 			init_threshold = 3;
 		else
 			init_threshold = 16;
 	} else {
 		u32 t1 = 0, t2 = 0, t3 = 0;
@@ -1316,47 +1317,47 @@ static int dw_dp_video_enable(struct dw_dp *dp)
 		switch (bpc) {
 		case 6:
 			t1 = (4 * 1000 / 9) * link->lanes;
 			break;
 		case 8:
-			if (color_format == DRM_COLOR_FORMAT_YCBCR422) {
+			if (color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR422) {
 				t1 = (1000 / 2) * link->lanes;
 			} else {
 				if (dp->pixel_mode == DW_DP_MP_DUAL_PIXEL)
 					t1 = (1000 / 3) * link->lanes;
 				else
 					t1 = (3000 / 16) * link->lanes;
 			}
 			break;
 		case 10:
-			if (color_format == DRM_COLOR_FORMAT_YCBCR422)
+			if (color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR422)
 				t1 = (2000 / 5) * link->lanes;
 			else
 				t1 = (4000 / 15) * link->lanes;
 			break;
 		case 12:
-			if (color_format == DRM_COLOR_FORMAT_YCBCR422) {
+			if (color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR422) {
 				if (dp->pixel_mode == DW_DP_MP_DUAL_PIXEL)
 					t1 = (1000 / 6) * link->lanes;
 				else
 					t1 = (1000 / 3) * link->lanes;
 			} else {
 				t1 = (2000 / 9) * link->lanes;
 			}
 			break;
 		case 16:
-			if (color_format != DRM_COLOR_FORMAT_YCBCR422 &&
+			if (color_format != DRM_OUTPUT_COLOR_FORMAT_YCBCR422 &&
 			    dp->pixel_mode == DW_DP_MP_DUAL_PIXEL)
 				t1 = (1000 / 6) * link->lanes;
 			else
 				t1 = (1000 / 4) * link->lanes;
 			break;
 		default:
 			return -EINVAL;
 		}
 
-		if (color_format == DRM_COLOR_FORMAT_YCBCR420)
+		if (color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420)
 			t2 = (link->rate / 4) * 1000 / (mode->clock / 2);
 		else
 			t2 = (link->rate / 4) * 1000 / mode->clock;
 
 		if (average_bytes_per_tu_frac)
@@ -1572,17 +1573,17 @@ static enum drm_mode_status dw_dp_bridge_mode_valid(struct drm_bridge *bridge,
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 	struct dw_dp_link *link = &dp->link;
 	u32 min_bpp;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR420 &&
+	if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420) &&
 	    link->vsc_sdp_supported &&
 	    (drm_mode_is_420_only(info, mode) || drm_mode_is_420_also(info, mode)))
 		min_bpp = 12;
-	else if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	else if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		min_bpp = 16;
-	else if (info->color_formats & DRM_COLOR_FORMAT_RGB444)
+	else if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
 		min_bpp = 18;
 	else
 		min_bpp = 24;
 
 	if (!link->vsc_sdp_supported &&
@@ -1775,18 +1776,18 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 		fmt = &dw_dp_output_formats[i];
 
 		if (fmt->bpc > conn_state->max_bpc)
 			continue;
 
-		if (!(fmt->color_format & di->color_formats))
+		if (!(BIT(fmt->color_format) & di->color_formats))
 			continue;
 
-		if (fmt->color_format == DRM_COLOR_FORMAT_YCBCR420 &&
+		if (fmt->color_format == DRM_OUTPUT_COLOR_FORMAT_YCBCR420 &&
 		    !link->vsc_sdp_supported)
 			continue;
 
-		if (fmt->color_format != DRM_COLOR_FORMAT_YCBCR420 &&
+		if (fmt->color_format != DRM_OUTPUT_COLOR_FORMAT_YCBCR420 &&
 		    drm_mode_is_420_only(di, &mode))
 			continue;
 
 		if (!dw_dp_bandwidth_ok(dp, &mode, fmt->bpp, link->lanes, link->rate))
 			continue;

-- 
2.53.0

