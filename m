Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AEC8D7534
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 14:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBEC10E12E;
	Sun,  2 Jun 2024 12:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YRf6/RmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7821B10E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 12:04:53 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b82d57963so3289749e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jun 2024 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717329891; x=1717934691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h3z71OOWoNWZE+/hRN9KTPkL2PegZfYXg/orVwPR8kc=;
 b=YRf6/RmKR8fAkuJtDKmi65rqQBeaCfEpDC7CQpbvhmdSXx1Byr26rbC1N18l7OdgtR
 +D3Oto5ZzggXUzIkk6wae4L97lbq9hbXZfdy7LUcUf+tajT/ZyOeK5tiwLnCYtCbnNcE
 mKBOvmh1QhazqELIUUg9isX5yMDnGkPBUqg+ePvLc44P329iKo8SHiBg/rcgUkC2mye1
 NLYkUpS8zNY5JV9sGpSe9QbJ5Ln7luhZUAfvGRED1cMZKiwQ2oUJ3ZtH9x0t3/8xIvPZ
 Bb+fiqGp4SevSqG+GnsiZ0SXCcjIraBHkK7R3zJIOYQ2Y23G6eJVxJL2iPOvus/J+GMo
 KEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717329891; x=1717934691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3z71OOWoNWZE+/hRN9KTPkL2PegZfYXg/orVwPR8kc=;
 b=oFZFR2AskevWXvTyJORLNJlP4/uL7y9nbm8fnyN++OQm5aH6HycrF/GTfMhR2LeUjR
 8KwgwEwALP+QZkADHAJwRtMSYmHvn7WYwemFkBAj/xTQRzxvPb0p3iukwFYEv+TEiMVf
 5/nRNafFlczZcGeFOplD5IB+zvgdSiqSn2GLoU2S1P7+BDh8VmiEbwaWFQHIhgY5ZuQh
 ib8gIz87iDnJX76o6NNIPvgR8RFNPq2Y97zfw5EFLBwZPOk04HP2OYBLKJMgMDszG/lw
 joCviHvoIfgwl85D35SKD765AELSUxdqb4aSNU1410Qp+mkO+lbjhFMUbBdgSXhtW/SL
 12Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDMfe5JPaQ2exUnwmvDWJQ/4pHdTYMZku3m/ATfNkyt6024+Xl0cgFsuMRsdfqPdhm9WM2KC3QV/58SfuvDa3bPoNKzn9GlYij+dFIp76G
X-Gm-Message-State: AOJu0YwYhEu0Z6bJoWB7kYa1wA2fkLvh3BRGe5n/Usn76+ncrjn185Cz
 zalAh0S91SJ8VW2LxyykZL5sebNO67fCE9HThJ3kdWC0aaGYXHhhoghgBHDS/Qk=
X-Google-Smtp-Source: AGHT+IEU1T1JPwAyrMO5IbBAXktjwF9BMNKR9KPMqWrnmSSf9vVuZkPir8wiF0D+duaCctX822ai1w==
X-Received: by 2002:a05:6512:b24:b0:523:8cd3:42cb with SMTP id
 2adb3069b0e04-52b8957ff7cmr4204463e87.7.1717329891515; 
 Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 05:04:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:46 +0300
Subject: [PATCH v3 06/12] drm/imx: ldb: drop custom DDC bus support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-6-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OpWhxY1X8SkMml69I2Dn6lgdN1AEsg7Y8hzUgxz6Gx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/dvzraZ7ctB4FChev2m27M7qCFXal54iU0h
 YugcsfUMBiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1dQHCACQB3JwnhGjzPIYoevRPyg+W/8rjb+b4FiGCX+8kr4tglyyDGDSnXk3TUYYOIH6n2zC0RH
 LkkwktFI2o9qKaRhqVxLe27I7goSpmnC0mPwKCoOFj5OumAxioG+Yr/QDUsuwsmw3h+NMODYwEo
 gmIxHDx3DQ4M9HKdiMgLzoAyK5qOluYntgRSjeFQnYW0ailrYrcufrco7bdLl67alAiN6AcvNJ7
 FH0eg2FEpb6RdAavpMCIYXfAZHZ0Ti6Y2ssjWXo4cjxcXsFg9Oo5IV1O1QLU8AE+DWuX+LkrtWi
 7eO+NGUo1rAm68FAuK5z66cLuVS1LQTHEFw8cuoOfgtEKfAz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

None of the boards ever supported by the upstream kernel used the custom
DDC bus support with the LDB connector. If a need arises to do so, one
should use panel-simple and its DDC bus code. Drop ddc-i2c-bus support
from the imx-ldb driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 73 +++++--------------------------------
 1 file changed, 10 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 1924d8921c62..3f669604377e 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -25,7 +25,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -70,7 +69,6 @@ struct imx_ldb_channel {
 	struct drm_bridge *bridge;
 
 	struct device_node *child;
-	struct i2c_adapter *ddc;
 	int chno;
 	struct drm_display_mode mode;
 	int mode_valid;
@@ -141,18 +139,6 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imx_ldb_ch->ddc) {
-		const struct drm_edid *edid = drm_edid_read_ddc(connector,
-								imx_ldb_ch->ddc);
-
-		if (edid) {
-			drm_edid_connector_update(connector, edid);
-			drm_edid_free(edid);
-
-			return drm_edid_connector_add_modes(connector);
-		}
-	}
-
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
 
@@ -481,10 +467,9 @@ static int imx_ldb_register(struct drm_device *drm,
 		 */
 		drm_connector_helper_add(connector,
 					 &imx_ldb_connector_helper_funcs);
-		drm_connector_init_with_ddc(drm, connector,
-					    &imx_ldb_connector_funcs,
-					    DRM_MODE_CONNECTOR_LVDS,
-					    imx_ldb_ch->ddc);
+		drm_connector_init(drm, connector,
+				   &imx_ldb_connector_funcs,
+				   DRM_MODE_CONNECTOR_LVDS);
 		drm_connector_attach_encoder(connector, encoder);
 	}
 
@@ -551,39 +536,6 @@ static const struct of_device_id imx_ldb_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_ldb_dt_ids);
 
-static int imx_ldb_panel_ddc(struct device *dev,
-		struct imx_ldb_channel *channel, struct device_node *child)
-{
-	struct device_node *ddc_node;
-	int ret;
-
-	ddc_node = of_parse_phandle(child, "ddc-i2c-bus", 0);
-	if (ddc_node) {
-		channel->ddc = of_find_i2c_adapter_by_node(ddc_node);
-		of_node_put(ddc_node);
-		if (!channel->ddc) {
-			dev_warn(dev, "failed to get ddc i2c adapter\n");
-			return -EPROBE_DEFER;
-		}
-	}
-
-	if (!channel->ddc) {
-		/* if no DDC available, fallback to hardcoded EDID */
-		dev_dbg(dev, "no ddc available\n");
-
-		if (!channel->panel) {
-			/* fallback to display-timings node */
-			ret = of_get_drm_display_mode(child,
-						      &channel->mode,
-						      &channel->bus_flags,
-						      OF_USE_NATIVE_MODE);
-			if (!ret)
-				channel->mode_valid = 1;
-		}
-	}
-	return 0;
-}
-
 static int imx_ldb_bind(struct device *dev, struct device *master, void *data)
 {
 	struct drm_device *drm = data;
@@ -694,11 +646,15 @@ static int imx_ldb_probe(struct platform_device *pdev)
 		if (ret && ret != -ENODEV)
 			goto free_child;
 
-		/* panel ddc only if there is no bridge */
-		if (!channel->bridge) {
-			ret = imx_ldb_panel_ddc(dev, channel, child);
+		if (!channel->bridge && !channel->panel) {
+			ret = of_get_drm_display_mode(child,
+						      &channel->mode,
+						      &channel->bus_flags,
+						      OF_USE_NATIVE_MODE);
 			if (ret)
 				goto free_child;
+
+			channel->mode_valid = 1;
 		}
 
 		bus_format = of_get_bus_format(dev, child);
@@ -732,15 +688,6 @@ static int imx_ldb_probe(struct platform_device *pdev)
 
 static void imx_ldb_remove(struct platform_device *pdev)
 {
-	struct imx_ldb *imx_ldb = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
-
-		i2c_put_adapter(channel->ddc);
-	}
-
 	component_del(&pdev->dev, &imx_ldb_ops);
 }
 

-- 
2.39.2

