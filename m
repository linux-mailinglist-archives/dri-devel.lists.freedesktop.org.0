Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CD1FEC37
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D45C6EB20;
	Thu, 18 Jun 2020 07:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2A26E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 22:28:02 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c11so2279670lfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 15:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37Z3HYJxY12m2q1zLLMVAo9a4Krobq6zohBrdzALyVQ=;
 b=Y9tZxdA1rsUIIaZhvYLwCqWPTBb6phJr1GlFlLkZmkTyASjV5UDgh3qmcpfXJOG66b
 6xnGvDC9A7qwm9zLOWBHW/anG5LKyRHK0Jps7F1yuVWYq2ep3TMgFixmGPknDWOkLhzI
 Itf3nzn2N8VqHIPa31vjW7HAJ+EpPpuNTidIrMkpryM3ivmGHVwt9DuXNiN6JFFlP7pa
 6jZcNHu53Q10EMzElyIvK+XUPbsKfSDy+zSZkIg9LXjgKvpj9hIk+awSnvyDM6my/uz6
 IKfz4sVl5VtGGQzULlzuC6cvmGc2JrDLAF/HuIHwGKvXVkJf93H8hyKMON3L1l9LmNyL
 3+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37Z3HYJxY12m2q1zLLMVAo9a4Krobq6zohBrdzALyVQ=;
 b=MFS812v4qUUCB4s9ZlSY/zkzaNAzj/BUMCEM6gQKhkk3+j/mwmY2D8r1OyqZiX8E2H
 C6QUu6pPBHg6Ch2GrWfbnsbPgAuDJUEQgud6NNboCLhoRrvqMtNifFaShOkBUWOOGJog
 XyazMiJVdQjvvcQl7S8Lg1WUmGsRh0V7MtK+wMwR4+tIaNmp9GTBJB/QzkeMtd5N/A57
 +MNrOSWu7PQuGzT3LrYixIajMmZeCvCuXHP1afEomxgrPBBfnH8DijiHNOlrKkI8/ppq
 SHN1IhgIqwDgUdjfp5db5N07K8gpDt3NDvnSTtnKjntHfTZccf+wVtjeBKdStLOJfPEq
 h0Eg==
X-Gm-Message-State: AOAM530uQBhvAhHPCaX90cBnmQH5CTMnZ3utUrk5fuTvOmpZqwcKX0i6
 BSpK+2O/EqXnVb0KVehb8MM=
X-Google-Smtp-Source: ABdhPJx6IKZqruOfHC3cc6bguSK0xEBwL3JLuOkypb06GquTIdueKILcT/UJXg0dkgQ+3eEIFuf6dQ==
X-Received: by 2002:a19:d44:: with SMTP id 65mr610935lfn.36.1592432880756;
 Wed, 17 Jun 2020 15:28:00 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id a1sm210378ljk.133.2020.06.17.15.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 15:28:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v8 6/7] drm/tegra: output: rgb: Wrap directly-connected panel
 into DRM bridge
Date: Thu, 18 Jun 2020 01:27:02 +0300
Message-Id: <20200617222703.17080-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200617222703.17080-1-digetx@gmail.com>
References: <20200617222703.17080-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
