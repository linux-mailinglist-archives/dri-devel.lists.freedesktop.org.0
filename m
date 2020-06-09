Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985C1F4F1F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A16E0CA;
	Wed, 10 Jun 2020 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105A6E2AF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:29:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id e4so25073237ljn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfaJuFdXozXDPR9zng+hgfPKlX3mT8FyISD1FTQ25bo=;
 b=B49t0nxwad7JuaDtw6XwwGP7olO4EUYZJRXtmgrvPkREm2Ppd7/QceX0WDCPyE0Gza
 g0G037SyTdG/CA6TLDbhNbMpBx4jZv8bARBAVbdLQD+96bEx4L6BLoJRbS+BEvJXYo6M
 +WuiqA/4Ec6gc/uaVLhtHwgRoFLgmuY2YoIfvL7HHhOqnBCpNCJC+HzqlyiEYwj3djgW
 hJyy/+4mowI8Oj8rnMciNF6fgDjXDcnnwXM55bO0BVTTrw7xSPwIYT0JnWRrhpeI3daO
 Pu5cMcvRR5afaFCVl6FBt+Ih5DImvS9wujXso75sKP6UVM9yaN9lNDkJGgUpvo1zcvqC
 3EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfaJuFdXozXDPR9zng+hgfPKlX3mT8FyISD1FTQ25bo=;
 b=npqv0j5hR4fizIUelnolyL4cnOhFrBIp2v2osojuvOCE1AWX9H/LlXriYH0EwAV/gz
 RHInQCDMKuR5W7OGdoi2i66HHpeiXF8cOF5XJPR9ASMLbsZokVA53xr1xN5s2JpsVy7o
 tOs9WE/1U0JP7qOz3t+ObgWGi14WNIE0DAMFbOcHA0+76P5275SY6im61XO2gx52sML0
 RBF+Sxg7wv+p34tKNvi5+ZcKPrFg8dMYFQ/GNf93uS13kI9TXhJE9KtqgLdzlCJlhq3k
 odAdkx3dKS7I6kjzv3GWNhbU7H5DicXNROsd0Mu8biV/EjaEYS8Ui7ygMoeaqlMqZ4Kj
 cRcg==
X-Gm-Message-State: AOAM533DyY5AoEMQiUxSltoJXCd0s8UfHU/1ut1+5l+AefVnBcETt0gb
 Vka1ISKzbn4NbDRniI3X+HM=
X-Google-Smtp-Source: ABdhPJyAWXTNCfEi8RFikv95/5IpuMDduRELo2UqM80wfXS3VGGWUgEySJcI0zefr2Z/3wNmmCONDQ==
X-Received: by 2002:a2e:2a42:: with SMTP id q63mr1127043ljq.265.1591709356142; 
 Tue, 09 Jun 2020 06:29:16 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id s8sm5069821lfc.83.2020.06.09.06.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:29:15 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 5/6] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Tue,  9 Jun 2020 16:28:54 +0300
Message-Id: <20200609132855.20975-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609132855.20975-1-digetx@gmail.com>
References: <20200609132855.20975-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
