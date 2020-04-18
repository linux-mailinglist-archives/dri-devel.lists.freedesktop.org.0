Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AEB1B0202
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C226E260;
	Mon, 20 Apr 2020 06:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738CB6ECBA
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 17:07:24 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 198so4405188lfo.7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Apr 2020 10:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFP2Xgl/P5L3A3AOxfNfJFdvZnWq+GhQQ62axDeZbgY=;
 b=OYenw0CFf7zJ1WnF4hUB8e1e8MLRJoH1OEtXGLd7Ae53R+7MH2FWi38JrkdktSsUt1
 11sfyc/W4Bgr1qDrzOE3hRjwQtx/il8SCvF9rv16zSI4qUbgtKNALQv91YStbqzTFdMr
 ad0cU7OIcqiQEZZYg0UoEuVNFPF/PtisVryWUU5VwsbjF5egyNrmX/ZohokOJNxGzoY4
 U39WK0niOGFOwgGGEZ4rsQMZmpygkDNR4bgxsSPo+IMZnW9IvCA7eH4DRcKYKFC4TDZi
 VLkC6o1pgTDlX+jD08MA9riDalmztx3p4lnM+C6CLefTecn+h1D6KmHVk9dZFbRhOUAy
 ZJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFP2Xgl/P5L3A3AOxfNfJFdvZnWq+GhQQ62axDeZbgY=;
 b=llLdvNnGOqXNtfSRSDDr9vz6pPFgDIZuQOR2Jmt52yaxvMUB09SyM1Rlud55nwBEln
 PKT5x2O6cABp0GbeOHMvKuP6ovk1aeLZ+PLXA+LDCnh+PCSlaTjsl0f8uRjFTUNI31em
 45RTWvO+wSdIztM3gdF3gOqsoDS04ExOVvZ9jcjjUMXdw2Xkm1KnCaCg/nilYlXvl2Qs
 IDHeHpYRhAGo6bcrfL0OEhcqUuMpFQKOErqKWxu+VbTo0ge+wLBCjEJnAxfgeOwhPYJl
 dBjNkiZK854+Zycgef5pwPv9LtKROHnsRHYMU7fwYkNSo4v/VFeftQhwakI3lBd5FbAI
 xIDA==
X-Gm-Message-State: AGi0PubSA3n+ZDq2vp9oh+TE5QaNiksGFkjfT/M8L4IGAUZsClvpee3I
 GoWlMnuciE+xnsv9k7V4X4Y=
X-Google-Smtp-Source: APiQypIlefeTuO41RijFbk6d9TIcAjiDCdxxSql5D26sOBd/08siAd8F6UP9uMfaUABbUEzgSij3sA==
X-Received: by 2002:ac2:5f5b:: with SMTP id 27mr5376939lfz.136.1587229642863; 
 Sat, 18 Apr 2020 10:07:22 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id e15sm8768909ljb.25.2020.04.18.10.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 10:07:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 5/6] drm/tegra: output: rgb: Support LVDS encoder bridge
Date: Sat, 18 Apr 2020 20:07:02 +0300
Message-Id: <20200418170703.1583-6-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418170703.1583-1-digetx@gmail.com>
References: <20200418170703.1583-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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
