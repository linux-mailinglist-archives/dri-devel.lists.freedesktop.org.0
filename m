Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 105101F8FB0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540DD6E13D;
	Mon, 15 Jun 2020 07:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2039C89EB1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 17:23:26 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c17so16383148lji.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37Z3HYJxY12m2q1zLLMVAo9a4Krobq6zohBrdzALyVQ=;
 b=sUM+61bHMTQwyYxyYmN3fSPDw7/38uK50F0zfc7/YI9dEkVzyM9NDOvp2JksQFxlp5
 +XXYcNtE6bwKD1ZtEgCTqYbjoKGJUk9bFlSM7g7PCqKJLuNbskX9LlACSXwTrgLzq+zK
 nIIkNqncpoEs6GazHlCOxHv9tVrGbnBki3ob+PiT9cP4TBBmfSfBZKtE5K6Y9vT3iaw9
 YyDnfQ6O/jedLLqaOUACuoh7l6pXCyG/CGAupZ4k8xPzrjheB0PwD97CVU9RSxwek/tN
 K0CsnhRxmA4w6XasvfzFQ7yqEOfRH8CLbhoPum1rJly1ylZ7qxjWtnH0seb1nKRGI2SQ
 wY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37Z3HYJxY12m2q1zLLMVAo9a4Krobq6zohBrdzALyVQ=;
 b=RgDuajWzhmbrW/gfPvKDC09tuBYlYUbfJWmZNb4S5sN1RpvS1Q0X7uJ0B/uDz6TmYI
 aHssf6CciLwHKa6KJQikpfnBdVx0Nh/D7zf00RWcS/aFJ7MRrtowaNWF9PUAAWCMUba4
 bZmGts510PbO3IiXvdB+ICWnOr/vr33E+r3iNyY3MOwInL1j73otLmvdb3/Lpvax8dH1
 s5RkbB7bEVT7d8MCKQL3P+9+PoT19mEtqtOXTf83Qg6Lx8wmOAxMmgWjNAwpXxnUw2e6
 7ONYaErJw97xJFqzKZJUGDXsWRGy/OgKXhYCqo/6R7a/LM9/QKshx6MsjW3yLj3zl9f3
 C0mw==
X-Gm-Message-State: AOAM532d6IqaCfC99Rwizvo+HXkFpB3xYIGY5bAhfbBDT+W0XNbM4VUC
 516xm2LBLb6XONGV/QV8at4=
X-Google-Smtp-Source: ABdhPJwJkmicC3yQWMn1EaHLj6NqgXGyVJXWs5uV2d/dqFdB4aC3XCOIC1NQbPfRIz+w9Luv9PWQ2w==
X-Received: by 2002:a2e:82ce:: with SMTP id n14mr12022057ljh.9.1592155404533; 
 Sun, 14 Jun 2020 10:23:24 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id m14sm55144lfp.18.2020.06.14.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 10:23:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v7 6/6] drm/tegra: output: rgb: Wrap directly-connected panel
 into DRM bridge
Date: Sun, 14 Jun 2020 20:22:34 +0300
Message-Id: <20200614172234.8856-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200614172234.8856-1-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
