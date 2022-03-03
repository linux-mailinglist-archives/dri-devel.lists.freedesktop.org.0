Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A04CC2F2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F79210EA3E;
	Thu,  3 Mar 2022 16:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0082310EA3E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:37:53 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 6so449168pgg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LqxMAJ8/uNH+xDV5ABc3SJFvaxw+zJIGqvUEcIBudhI=;
 b=IM9EGV6IMN3547F1mzjKyf6VP/5cjyxT3tvF13f89mQHGAg5Lj5LydksdY+SzfJBag
 2XNTYC8w3rjDGYOnCOKtF39q1ucmpvtUF+qwvsJkypkZx1lvCDMAmE40pTeRn3EcnIu1
 ytBPGUqEHSKLYYJICYhyWs3zW+dXrDt9QyufU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LqxMAJ8/uNH+xDV5ABc3SJFvaxw+zJIGqvUEcIBudhI=;
 b=X4IQdUXEI/+dDAJDlcaZ+/2n93H11ltTrQaBJrFX3rvmhzE07dHfzuqDmYHQ3E9nXj
 cOgZUr/MyvwRj469LKBhuctteVwJ81+oQo7J2jvpvZRkJjyKnfx7FTysNHkNxvwAn8jF
 swDZubNbXaqpELtlTuJl2WQ6ISb/CekN2tBCETiKh2flkE1/h2FR3uCHqP6Wqq04fdTA
 WJZcX97YoNnM7Dg+9Pp7uml0baMezwGopbLcvAddt6EzrPkDxKdNiuLh1AUVxzbHAatp
 LJtmLx+BmNRPRh02QaQ81K/wbNl9mkmEHsCC6s/bB2Vt134cZF9Hs3I0wTiQ6P6UEmnN
 bS6g==
X-Gm-Message-State: AOAM533rROGyIlGhL/fZ2wAcSm31yB5qmhQN07+UWF/pOZK2yABhsXLo
 QTzOWqwkDDXdnmPauXjHDg2TPA==
X-Google-Smtp-Source: ABdhPJxIt+kgU1IKvlrzc56cx9nBnOLXnryPaEL1TFMuchiwj4QVNuBCsjoYvGU9qEN+rj2SydFBhQ==
X-Received: by 2002:a05:6a00:1a56:b0:4f4:1a2a:6d1b with SMTP id
 h22-20020a056a001a5600b004f41a2a6d1bmr19378527pfv.65.1646325473491; 
 Thu, 03 Mar 2022 08:37:53 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:4526:5253:a010:63f4])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm3220983pfj.14.2022.03.03.08.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 08:37:53 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v6 3/6] exynos: drm: dsi: Attach in_bridge in MIC driver
Date: Thu,  3 Mar 2022 22:06:51 +0530
Message-Id: <20220303163654.3381470-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303163654.3381470-1-jagan@amarulasolutions.com>
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIC drivers in the Exynos5433 display pipeline are already registered
as bridge drivers and it is more advisable to attach the downstream
bridge on the bridge attach call instead of doing the same in the
DSI driver.

This makes bridge attachment more meaningful and avoids the races
during bridge function calls.

So, move the bridge finding and drm_bridge_attach from DSI to MIC.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v6:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 15 ---------------
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index b7d0a4aead0a..741c046513e8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1660,11 +1660,6 @@ static int exynos_dsi_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int exynos_dsi_parse_dt(struct exynos_dsi *dsi)
 {
 	struct device *dev = dsi->dev;
@@ -1695,8 +1690,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct exynos_dsi *dsi = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm_dev = data;
-	struct device_node *in_bridge_node;
-	struct drm_bridge *in_bridge;
 	int ret;
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1707,14 +1700,6 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return ret;
 
-	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
-	if (in_bridge_node) {
-		in_bridge = of_drm_find_bridge(in_bridge_node);
-		if (in_bridge)
-			drm_bridge_attach(encoder, in_bridge, NULL, 0);
-		of_node_put(in_bridge_node);
-	}
-
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 32672bf8ae4a..9e06f8e2a863 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -102,6 +102,7 @@ struct exynos_mic {
 	struct videomode vm;
 	struct drm_encoder *encoder;
 	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
 
 	bool enabled;
 };
@@ -298,12 +299,22 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 
 static void mic_enable(struct drm_bridge *bridge) { }
 
+static int mic_attach(struct drm_bridge *bridge,
+		      enum drm_bridge_attach_flags flags)
+{
+	struct exynos_mic *mic = bridge->driver_private;
+
+	return drm_bridge_attach(bridge->encoder, mic->next_bridge,
+				 &mic->bridge, flags);
+}
+
 static const struct drm_bridge_funcs mic_bridge_funcs = {
 	.disable = mic_disable,
 	.post_disable = mic_post_disable,
 	.mode_set = mic_mode_set,
 	.pre_enable = mic_pre_enable,
 	.enable = mic_enable,
+	.attach = mic_attach,
 };
 
 static int exynos_mic_bind(struct device *dev, struct device *master,
@@ -377,6 +388,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos_mic *mic;
+	struct device_node *remote;
 	struct resource res;
 	int ret, i;
 
@@ -420,6 +432,16 @@ static int exynos_mic_probe(struct platform_device *pdev)
 		}
 	}
 
+	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
+	mic->next_bridge = of_drm_find_bridge(remote);
+	if (IS_ERR(mic->next_bridge)) {
+		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
+		ret = PTR_ERR(mic->next_bridge);
+		goto err;
+	}
+
+	of_node_put(remote);
+
 	platform_set_drvdata(pdev, mic);
 
 	mic->bridge.funcs = &mic_bridge_funcs;
-- 
2.25.1

