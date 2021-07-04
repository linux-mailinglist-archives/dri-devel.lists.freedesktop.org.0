Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902EF3BAC3F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030D89D49;
	Sun,  4 Jul 2021 09:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9A989D49
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:34 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b12so12565469pfv.6
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9Aly6nJLJSN3b2bUvikDgpkvqF9hImc8XWMkPBqpXI=;
 b=TdmLonvKL3YQ4lTciPW2d5BOkfnDv1G7HGporYX1pWNlZ1aGEL+Eq8M7tmO8uBv+mf
 S7ULb87R3+34zvp3osimpLFs7hdpiemCCUQQLsKO4xiLBT2mPUks1MQ/LMUKarkFnES2
 I24uenpZy8PqVrpzNQlkvafBaBR5l0ByYLzRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9Aly6nJLJSN3b2bUvikDgpkvqF9hImc8XWMkPBqpXI=;
 b=YP5AeeX4u4oYVDazb/BA7vQ9a1cioAFewjQDepxDpA0gRKBFBpev2NkfkeYx8GGZzP
 q2WuEGQ0hNycxb5Sjl3HhjqLVnkrv0bi+2Wpr9oQ3IOSDknJ69TMvg351hsyOrERhbTX
 AyXj56ec+wdO7fu/fdzai1H0rjVXzvZMfriamGPdgSB+Uj5pwZyplEvz7agoNflPZdnL
 bZfKLoCwb3SLWOpicDjdBPzdlDfvuHLQkfaUHFWsdTzfPCur9OHkLfggN69bw128iv2F
 1tdz3r72vpB3tT81kNv2te8sIk+Xaluj6nkmd6+rKbafYmRY+LcZ9wst0OZUeURJfq2U
 6/IQ==
X-Gm-Message-State: AOAM531DzviwKOJuG7sI6HR21ZvT7t/p0QscsXS620M+806EosdCfHnu
 CZpc9lZ6kM8T117UjjimHmv8dw==
X-Google-Smtp-Source: ABdhPJweFhSs5QChPSwb0B5wADBPo78G77JyeMZ39XaIlV7lSuuZY45FOdIQsUxegraD1I9JmgaImQ==
X-Received: by 2002:aa7:8003:0:b029:2eb:2f8f:a320 with SMTP id
 j3-20020aa780030000b02902eb2f8fa320mr9221995pfi.70.1625389474612; 
 Sun, 04 Jul 2021 02:04:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:34 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 04/17] drm/exynos: dsi: Create bridge connector for encoder
Date: Sun,  4 Jul 2021 14:32:17 +0530
Message-Id: <20210704090230.26489-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_bridge_connector_init to create a connector
for display pipelines that use drm_bridge for encoder
implementation.

This allows splitting connector operations across
multiple bridges when necessary, instead of having
the last bridge in the chain creating the connector
and handling all connector operations internally.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 24f0b082ac6d..d828be07c325 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -24,6 +24,7 @@
 #include <video/videomode.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_mipi_dsi.h>
@@ -1591,6 +1592,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	struct drm_device *drm_dev = data;
 	struct device_node *in_bridge_node;
 	struct drm_bridge *in_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1599,12 +1601,22 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 	if (ret < 0)
 		return ret;
 
-	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		drm_encoder_cleanup(&dsi->encoder);
 		return ret;
 	}
 
+	connector = drm_bridge_connector_init(drm_dev, &dsi->encoder);
+	if (IS_ERR(connector)) {
+		DRM_DEV_ERROR(dsi->dev, "Unable to create bridge connector\n");
+		drm_encoder_cleanup(&dsi->encoder);
+		return PTR_ERR(connector);
+	}
+
+	drm_connector_attach_encoder(connector, &dsi->encoder);
+
 	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
 	if (in_bridge_node) {
 		in_bridge = of_drm_find_bridge(in_bridge_node);
-- 
2.25.1

