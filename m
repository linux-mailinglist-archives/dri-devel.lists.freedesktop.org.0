Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9541AE96
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 14:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CBD6E8A9;
	Tue, 28 Sep 2021 12:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4BC6E8A0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 12:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E2FE9FB04;
 Tue, 28 Sep 2021 14:16:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NlOYXvSoIIW; Tue, 28 Sep 2021 14:16:22 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>, Lucas Stach <l.stach@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/5] drm/bridge: nwl-dsi: Add atomic_get_input_bus_fmts
Date: Tue, 28 Sep 2021 14:16:10 +0200
Message-Id: <80f9dc4e275d1e76aa66c60c6677d960a4b917ac.1632828477.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1632828477.git.agx@sigxcpu.org>
References: <cover.1632828477.git.agx@sigxcpu.org>
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

Components further up in the chain might ask us for supported formats.

Without this MEDIA_BUS_FMT_FIXED is assumed which then breaks display
output with mxsfb since it can't determine a proper bus format.

We handle the bus formats that correspond to the DSI formats the bridge
can potentially output (see chapter 13.6 of the i.MX 8MQ reference
manual) - which matches what xsfb can input.

Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a251cc1f088f..27c80d36846b 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -1234,6 +1234,40 @@ static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
 	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
 }
 
+static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+						 struct drm_bridge_state *bridge_state,
+						 struct drm_crtc_state *crtc_state,
+						 struct drm_connector_state *conn_state,
+						 u32 output_fmt,
+						 unsigned int *num_input_fmts)
+{
+	u32 *input_fmts, input_fmt;
+
+	*num_input_fmts = 0;
+
+	switch (output_fmt) {
+	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
+	case MEDIA_BUS_FMT_FIXED:
+		input_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		input_fmt = output_fmt;
+		break;
+	default:
+		return NULL;
+	}
+
+	input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+	input_fmts[0] = input_fmt;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
@@ -1241,6 +1275,7 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
 	.atomic_check		= nwl_dsi_bridge_atomic_check,
 	.atomic_enable		= nwl_dsi_bridge_atomic_enable,
 	.atomic_disable		= nwl_dsi_bridge_atomic_disable,
+	.atomic_get_input_bus_fmts = nwl_bridge_atomic_get_input_bus_fmts,
 	.mode_set		= nwl_dsi_bridge_mode_set,
 	.mode_valid		= nwl_dsi_bridge_mode_valid,
 	.attach			= nwl_dsi_bridge_attach,
-- 
2.33.0

