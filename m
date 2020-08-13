Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33360245D37
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C346E4B5;
	Mon, 17 Aug 2020 07:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5796E277
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 22:07:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id f26so7852843ljc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 15:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNB1WJ7nT7eTiS7MheejVX1+HgDEY/PQRFgw5jRVS9A=;
 b=H/93/TrnfP5dYTTzKMRei86RrmGKRuJpnVo69hwYEaNhgzQv8D2Wq4dCigDFKztgmE
 J3AzebWfRJzq2ALp9Vg3BUCP40hzyo1ayz+p8Iq8GFbpfKlT8SpoaKgt7KWJ5Mb484gc
 PuOPwnx0ZZytynM2HDS21srgF24uhnKQL1NNzBW6hkyJN4NNgz/DHXstP2JvHX7KGtsz
 LauTs1SW9I+0BkeaAB97OQ2dHyrmnUJo5uMA6ubt+aAbw7ACCb8po3x9sVxwOfP1r4st
 EI8OTJ+UMyWdD0bQVr4Q4jempm5UMae7iVZefgsD6IAFgZlGjwiXGlQLuGzo0FPE8Fn4
 zZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNB1WJ7nT7eTiS7MheejVX1+HgDEY/PQRFgw5jRVS9A=;
 b=ME77VwrsSYjhvEozBywE+Fkmgs2vengNHAosCoqj/drjLBA7uuv6Rps3yybAZJFnYd
 m7HYgI5Ztw6+6mGenVwCDm4cc9IGGZXcrfcglgY1zu7n5TgNJIkjsZsLR+aD33J94NwP
 FD92ZKa/aysG/Gwpzg9xd9fp6VffIPXj9SxTT3CX+U79GqUyH3zv2iAirG7A1M8GvkYd
 PizBNZ758kMUjL9kPQ+79q1JjC97D/9NHg00d2cKAPEt82SRL+IDimz5dJQlMkhOftAn
 KV6HIUFHdufwpJTP1qVWKOnxSUCTnrL7fcizsLZJ7euGN0cX+F+Imb0fi/yYG6Bs07dB
 w2xg==
X-Gm-Message-State: AOAM530vnSAPLfC1QW3ZsCOzY+D+1a11i3vjIq2FX9SSxqJXYGGn2uDa
 qiMPsBU/+OGWedcl6RXD2E8=
X-Google-Smtp-Source: ABdhPJxBFe4j/gvqI+fonyfgEXxpOyTzTLmdf61nd407n4XUc3CAYfN7yHv+TItbEWcV3APUxRvm3g==
X-Received: by 2002:a05:651c:1b4:: with SMTP id
 c20mr2836389ljn.432.1597356428258; 
 Thu, 13 Aug 2020 15:07:08 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id z20sm1354452ljk.97.2020.08.13.15.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 15:07:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH RESEND v10 4/4] drm/tegra: output: rgb: Wrap
 directly-connected panel into DRM bridge
Date: Fri, 14 Aug 2020 01:06:56 +0300
Message-Id: <20200813220656.30838-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813220656.30838-1-digetx@gmail.com>
References: <20200813220656.30838-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently Tegra DRM driver manually manages display panel, but this
management could be moved out into DRM core if we'll wrap panel into
DRM bridge. This patch wraps RGB panel into a DRM bridge and removes
manual handling of the panel from the RGB output code.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 70 ++++++++++---------------------------
 1 file changed, 18 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 9a7024ec96bc..4142a56ca764 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -8,7 +8,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "drm.h"
@@ -86,45 +85,13 @@ static void tegra_dc_write_regs(struct tegra_dc *dc,
 		tegra_dc_writel(dc, table[i].value, table[i].offset);
 }
 
-static const struct drm_connector_funcs tegra_rgb_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.detect = tegra_output_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = tegra_output_connector_destroy,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static enum drm_mode_status
-tegra_rgb_connector_mode_valid(struct drm_connector *connector,
-			       struct drm_display_mode *mode)
-{
-	/*
-	 * FIXME: For now, always assume that the mode is okay. There are
-	 * unresolved issues with clk_round_rate(), which doesn't always
-	 * reliably report whether a frequency can be set or not.
-	 */
-	return MODE_OK;
-}
-
-static const struct drm_connector_helper_funcs tegra_rgb_connector_helper_funcs = {
-	.get_modes = tegra_output_connector_get_modes,
-	.mode_valid = tegra_rgb_connector_mode_valid,
-};
-
 static void tegra_rgb_encoder_disable(struct drm_encoder *encoder)
 {
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 
-	if (output->panel)
-		drm_panel_disable(output->panel);
-
 	tegra_dc_write_regs(rgb->dc, rgb_disable, ARRAY_SIZE(rgb_disable));
 	tegra_dc_commit(rgb->dc);
-
-	if (output->panel)
-		drm_panel_unprepare(output->panel);
 }
 
 static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
@@ -133,9 +100,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	struct tegra_rgb *rgb = to_rgb(output);
 	u32 value;
 
-	if (output->panel)
-		drm_panel_prepare(output->panel);
-
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
@@ -157,9 +121,6 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	tegra_dc_writel(rgb->dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 
 	tegra_dc_commit(rgb->dc);
-
-	if (output->panel)
-		drm_panel_enable(output->panel);
 }
 
 static int
@@ -278,6 +239,23 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 
+	/*
+	 * Wrap directly-connected panel into DRM bridge in order to let
+	 * DRM core to handle panel for us.
+	 */
+	if (output->panel) {
+		output->bridge = devm_drm_panel_bridge_add(output->dev,
+							   output->panel);
+		if (IS_ERR(output->bridge)) {
+			dev_err(output->dev,
+				"failed to wrap panel into bridge: %pe\n",
+				output->bridge);
+			return PTR_ERR(output->bridge);
+		}
+
+		output->panel = NULL;
+	}
+
 	/*
 	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
 	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
@@ -292,8 +270,7 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	 * Newer device-trees utilize LVDS encoder bridge, which provides
 	 * us with a connector and handles the display panel.
 	 *
-	 * For older device-trees we fall back to our own connector and use
-	 * nvidia,panel phandle.
+	 * For older device-trees we wrapped panel into the panel-bridge.
 	 */
 	if (output->bridge) {
 		err = drm_bridge_attach(&output->encoder, output->bridge,
@@ -313,17 +290,6 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 		}
 
 		drm_connector_attach_encoder(connector, &output->encoder);
-	} else {
-		drm_connector_init(drm, &output->connector,
-				   &tegra_rgb_connector_funcs,
-				   DRM_MODE_CONNECTOR_LVDS);
-		drm_connector_helper_add(&output->connector,
-					 &tegra_rgb_connector_helper_funcs);
-		output->connector.dpms = DRM_MODE_DPMS_OFF;
-
-		drm_connector_attach_encoder(&output->connector,
-					     &output->encoder);
-		drm_connector_register(&output->connector);
 	}
 
 	err = tegra_output_init(drm, output);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
