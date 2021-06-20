Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C953AE0FD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 00:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7089C8D;
	Sun, 20 Jun 2021 22:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6C589C8D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 22:42:38 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 394E182893;
 Mon, 21 Jun 2021 00:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624228955;
 bh=4B/n9ROF8MeqWJjSy9S7tLtV+Jzyc89iKvgTYIVpBcE=;
 h=From:To:Cc:Subject:Date:From;
 b=voTz9o83Srf4so0/m9Y85EFyOt8IYCRA0kS03lAIJF0eqQQAeOZwIezdTAq0M+klw
 Yf5Mx3QjiKwkpRKuAp4EAKLbEirMmCJ0rclmuUPLb8zHwHyq5rswh6+xX8+lCmi8fI
 hP77CASycoNmsrV+hxfOYWhOYd+VqLEQizxdc0V7t1vR6xX08X4dW4LVdaOnSWeSB5
 0FnQUmVXsdIfw9dNEpVXb4Hgz4evrmIDNVe4h95R9ZJvxKbnH+nL5AlPTDMScmYxm8
 zLoQsHS/UQGl4XkTtPFgbra2+NFRIIorF0YLoYqiqvwUFpqXwbLUAYBLZ8FW+Djq/Z
 BhMKunnICT1rQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Replace connector format patching
 with atomic_get_input_bus_fmts
Date: Mon, 21 Jun 2021 00:42:08 +0200
Message-Id: <20210620224208.184719-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 ch@denx.de, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patching the connector format is causing various problematic
side effects. Implement .atomic_get_input_bus_fmts callback
instead, which sets up the input (DSI-end) format, and that
format can then be used in pipeline format negotiation between
the DSI-end of this bridge and the other component closer to
the scanout engine.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Adam Ford <aford173@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Valentin Raevsky <valentin@compulab.co.il>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 35 ++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 750f2172ef08..32bda20f5dda 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -517,7 +517,6 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
 				 struct drm_display_mode *adj)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	u32 input_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_device *ddev = encoder->dev;
 	struct drm_connector *connector;
@@ -550,14 +549,37 @@ static bool sn65dsi83_mode_fixup(struct drm_bridge *bridge,
 				 connector->display_info.bus_formats[0]);
 			break;
 		}
-
-		drm_display_info_set_bus_formats(&connector->display_info,
-						 &input_bus_format, 1);
 	}
 
 	return true;
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				    struct drm_bridge_state *bridge_state,
+				    struct drm_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state,
+				    u32 output_fmt,
+				    unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.attach		= sn65dsi83_attach,
 	.pre_enable	= sn65dsi83_pre_enable,
@@ -567,6 +589,11 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.mode_valid	= sn65dsi83_mode_valid,
 	.mode_set	= sn65dsi83_mode_set,
 	.mode_fixup	= sn65dsi83_mode_fixup,
+
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = sn65dsi83_atomic_get_input_bus_fmts,
 };
 
 static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
-- 
2.30.2

