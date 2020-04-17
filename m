Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FFA1AEB51
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9306E6EC78;
	Sat, 18 Apr 2020 09:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478876E397
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 17:54:54 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l19so403246lje.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GKoLevPErJgCi+JpOaGzfkWLVDaW2J8oO+kaf3Kspgk=;
 b=u/gDGIQ+v+JALbcxkcVVO5ecTZtxZAJFMJFRTaSMb2CnmNkXrwSECqVFnpP6oP5RI+
 xChy1oxaipy2Tg9H4Y70JsCyNIhYv1ieSe8r1U+xm6N6W/sA0T+StnVXvqYsxcQurEt+
 U+fGNc2RdOvRXp4D9RYEsG61maNgNkmEsCS1yD71Kk0K8HwoOlpE/BScwLEeVQWDkbg6
 lwARCJebcQUX2PY3w9PmqpwP9zLyQmZkD1DPt0uw9398lMvUNLvR0kaBkdFtcrjOcsBr
 vDCtLC4q7Yjf4OVS1ShimjnSbLdcF7bPm9xuGJEnaplWOFSxlGm0UkOVm2TzW1CUwZ1p
 YzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GKoLevPErJgCi+JpOaGzfkWLVDaW2J8oO+kaf3Kspgk=;
 b=WG1K0mA6i8M/XEy+dTJL3Y5iyPCLW5IgZuf8C9jHc+DMEabZq/PqYGqrR8DvBkw0Og
 jjdlKjpKYVX8/w2yB8fHR/HYstgD+QQwffhpBidSg2ftICyhxUFvuTJa/WAbwTHlDXy7
 GQDLTvVjrWjaCMfGYDpKElkWQV2BU2jsYC4CwX/IdP2o9UwRL++1MHyePzG9cWkXk9UP
 TjvPZIJvfLaqEU/TpeMxjaWGqQ4qw6Aacir1E5EM7teecoGn6NoQh961A/5t3EAF6Aq3
 Q9C7iH83LGT3dl8xL8nzY0vvydpXDf8A7h0hbUm3xk+0mzavBgq5q3Aj7bztIzK0RBbN
 52Hg==
X-Gm-Message-State: AGi0Pubxeuam8CgjWTMukIxy4vycJNL1RIQQ9iGgR2CiwElYXfNNCEVo
 L2qNoeK3O0sLpkUWROz9dmc=
X-Google-Smtp-Source: APiQypLtwk6f1u+8Di7H3XmSukHeuifYPwBT/XEM6e3fIAQGKKI8BhxxyOiWecaCAAvvfPB8GOCb4g==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr2861100ljj.105.1587146092688; 
 Fri, 17 Apr 2020 10:54:52 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 10:54:51 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 3/3] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Fri, 17 Apr 2020 20:52:38 +0300
Message-Id: <20200417175238.27154-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417175238.27154-1-digetx@gmail.com>
References: <20200417175238.27154-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer Tegra device-trees will specify a video output graph, which involves
LVDS encoder bridge. This patch adds support for the LVDS encoder bridge
to the RGB output, allowing us to model the display hardware properly.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 58 +++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 0562a7eb793f..f28a226914c0 100644
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
+	 * in order to transmit data to the panel. Historically devices that
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
