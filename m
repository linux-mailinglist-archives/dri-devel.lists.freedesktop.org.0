Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF174210492
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1E66E7E5;
	Wed,  1 Jul 2020 07:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47616E39E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 02:23:59 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d17so10381903ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 19:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfaJuFdXozXDPR9zng+hgfPKlX3mT8FyISD1FTQ25bo=;
 b=VE7s85l5fyLK0B6o/yt86K8C9cK16DV3MrIuvwOOuc+NBn1BXoVRakQLfb1/3Yg/aZ
 R+HSNymIVAhgmg3e2ojg6/JRCpoBa4x3lmzlk+2suLHFSujns4KhQxR1QLr4D9sFpwCb
 9Q+ZXTqCF+JPPInnPjoTcecuq8t5akEpl/N/smciUfH/pmYq9aHD8SvSiu5k2OiV1o3e
 cEoGjNI+o2cyYd8MlsF4TE/B2SGmBqOTAiO3wyWDwmSd8NuIPVrAQ8Ye/XG1rH6jwVKE
 W2OlthjfiervACVtspzepIMIv3aLd5e4XHJdJcYbuodAlHEygtys3135ZqG/+3iwg43p
 IpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfaJuFdXozXDPR9zng+hgfPKlX3mT8FyISD1FTQ25bo=;
 b=dVZ2HMyw5kMvKjW8av4hnDZuyMZoqxFgkI/SeByuEIj3ZtTYL1jdg22iltfBugPm5m
 y7HjVxs+Zfa87kjM3wUdsH3V89AMlxkcatpiWEKALMgVkYb7BS+XikSsYBM4nMk12MFV
 1oCIiPu4Rin7zWe88rR/OrRArT9mOmYsdo8WoMtuzlWSlCxsQ12XhOwH6eS7Mxh3cBtD
 P7fNrnxDfRW5pj76Bhwk//Fn9/AU9K+ZWFNY94oJhVXIgOIbU+bQBPfTSYOEdPoTqoTU
 j9s0zIn+b8uEXex9CDqq/Yv5PGQLbv+Xw42wcS4Mpt3yesKREPtZXueuPmsdwg7ZPSlo
 r1mA==
X-Gm-Message-State: AOAM5325vqvBf36SuZfXYfupY6FsBrCFP1XCYwwfhfR5WS3hc1GtFfUY
 BCQe+1GV3aw9oRnllgU3zvE=
X-Google-Smtp-Source: ABdhPJw8XwqM+o3V3NyT/ahxuvQDzRvny1dTXfsyM+RgMUzYUT+Wa94GwTf+cWLO24giLZ5NMMBl+g==
X-Received: by 2002:a05:651c:3c2:: with SMTP id
 f2mr12254508ljp.37.1593570238171; 
 Tue, 30 Jun 2020 19:23:58 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id f21sm1303557ljj.121.2020.06.30.19.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 19:23:57 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 3/4] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Wed,  1 Jul 2020 05:21:27 +0300
Message-Id: <20200701022128.12968-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200701022128.12968-1-digetx@gmail.com>
References: <20200701022128.12968-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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

Newer Tegra device-trees will specify a video output graph, which involves
LVDS encoder bridge. This patch adds support for the LVDS encoder bridge
to the RGB output, allowing us to model the display hardware properly.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 58 +++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 0562a7eb793f..9a7024ec96bc 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -267,24 +268,63 @@ int tegra_dc_rgb_remove(struct tegra_dc *dc)
 int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 {
 	struct tegra_output *output = dc->rgb;
+	struct drm_connector *connector;
 	int err;
 
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_connector_init(drm, &output->connector, &tegra_rgb_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
-	drm_connector_helper_add(&output->connector,
-				 &tegra_rgb_connector_helper_funcs);
-	output->connector.dpms = DRM_MODE_DPMS_OFF;
-
 	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 
-	drm_connector_attach_encoder(&output->connector,
-					  &output->encoder);
-	drm_connector_register(&output->connector);
+	/*
+	 * Tegra devices that have LVDS panel utilize LVDS encoder bridge
+	 * for converting up to 28 LCD LVTTL lanes into 5/4 LVDS lanes that
+	 * go to display panel's receiver.
+	 *
+	 * Encoder usually have a power-down control which needs to be enabled
+	 * in order to transmit data to the panel.  Historically devices that
+	 * use an older device-tree version didn't model the bridge, assuming
+	 * that encoder is turned ON by default, while today's DRM allows us
+	 * to model LVDS encoder properly.
+	 *
+	 * Newer device-trees utilize LVDS encoder bridge, which provides
+	 * us with a connector and handles the display panel.
+	 *
+	 * For older device-trees we fall back to our own connector and use
+	 * nvidia,panel phandle.
+	 */
+	if (output->bridge) {
+		err = drm_bridge_attach(&output->encoder, output->bridge,
+					NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (err) {
+			dev_err(output->dev, "failed to attach bridge: %d\n",
+				err);
+			return err;
+		}
+
+		connector = drm_bridge_connector_init(drm, &output->encoder);
+		if (IS_ERR(connector)) {
+			dev_err(output->dev,
+				"failed to initialize bridge connector: %pe\n",
+				connector);
+			return PTR_ERR(connector);
+		}
+
+		drm_connector_attach_encoder(connector, &output->encoder);
+	} else {
+		drm_connector_init(drm, &output->connector,
+				   &tegra_rgb_connector_funcs,
+				   DRM_MODE_CONNECTOR_LVDS);
+		drm_connector_helper_add(&output->connector,
+					 &tegra_rgb_connector_helper_funcs);
+		output->connector.dpms = DRM_MODE_DPMS_OFF;
+
+		drm_connector_attach_encoder(&output->connector,
+					     &output->encoder);
+		drm_connector_register(&output->connector);
+	}
 
 	err = tegra_output_init(drm, output);
 	if (err < 0) {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
