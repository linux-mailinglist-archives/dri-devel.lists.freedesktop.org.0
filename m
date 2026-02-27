Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GENWCH6joWnEvAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:00:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3CF1B82D4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 15:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1137010EB89;
	Fri, 27 Feb 2026 14:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QU0F0kJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1449A10EB77;
 Fri, 27 Feb 2026 14:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E15C540B1F;
 Fri, 27 Feb 2026 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429D1C19423;
 Fri, 27 Feb 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772200821;
 bh=pmuV9XT5xz4TIGCX33nAahI5S0bV94XYGEmoM0J00kE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QU0F0kJ5NBlgWFhg738XGBv5DVWfKxPpFdsmRUjAYRflkwtxpQ5Gei814H2aTjtQP
 cm4zFGisMDOTjsgdrhSkJvgzhLlUYpd9VWazCXFEZ/UHHPFxJHSV82S7swMwxUwvVO
 fgu6HxZceVtp7b+sk9Vqs1CeB5XSmy3dkqF8XMlWPC1X7KBgBbvL6QDvfrZxfatjwH
 zfyljkcwr4VFZwYLK0N92JL8/LAqbxYJWJWyOj53vCJ1UTJPwfVmx5N1F5sZ3QD5ra
 o6iAtf8pWpmZ2d/wh45BBc0IA49nFp3nJrQkofK+ypA/5FLvKkZV8+ZHGQJHYvVGOd
 zcVQ0Rw3l5cTQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 27 Feb 2026 14:59:53 +0100
Subject: [PATCH v2 09/14] drm/bridge: synopsys: dw-hdmi: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drm-rework-color-formats-v2-9-8bd278e2af9d@kernel.org>
References: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
In-Reply-To: <20260227-drm-rework-color-formats-v2-0-8bd278e2af9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pmuV9XT5xz4TIGCX33nAahI5S0bV94XYGEmoM0J00kE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLF4d12J2ec9SgUd/+lbB1K6Oz7krdD6zXeANUI1O+S
 t09u3tjx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI+QvGOrX6Y1dleQX5VHl+
 XJk0SSKOO/Fw+ETn5DVKWlbZc90etBd8dJSdtHXisXv6K5Mfml61YqzTeC2kaeNweFLACqZS8W9
 p6llsDiZst4TsT704sfyswKU9dWtVbzz+aZWhuD1ZqSLQSAEA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9C3CF1B82D4
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ee88c0e793b0416d20105a43448cb4037402e64b..0296e110ce65ffc284e120f4e3f92052474e83e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2662,11 +2662,11 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	struct drm_connector *conn = conn_state->connector;
 	struct drm_display_info *info = &conn->display_info;
 	struct drm_display_mode *mode = &crtc_state->mode;
 	u8 max_bpc = conn_state->max_requested_bpc;
 	bool is_hdmi2_sink = info->hdmi.scdc.supported ||
-			     (info->color_formats & DRM_COLOR_FORMAT_YCBCR420);
+			     (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420));
 	u32 *output_fmts;
 	unsigned int i = 0;
 
 	*num_output_fmts = 0;
 
@@ -2721,40 +2721,40 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 
 	/* Default 8bit RGB fallback */
 	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
 
 	if (max_bpc >= 16 && info->bpc == 16) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB161616_1X48;
 	}
 
 	if (max_bpc >= 12 && info->bpc >= 12) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY12_1X24;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV12_1X36;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB121212_1X36;
 	}
 
 	if (max_bpc >= 10 && info->bpc >= 10) {
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			output_fmts[i++] = MEDIA_BUS_FMT_UYVY10_1X20;
 
-		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+		if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV10_1X30;
 
 		output_fmts[i++] = MEDIA_BUS_FMT_RGB101010_1X30;
 	}
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		output_fmts[i++] = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
 	*num_output_fmts = i;
 
 	return output_fmts;

-- 
2.53.0

