Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE713BAC38
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5268F89D1D;
	Sun,  4 Jul 2021 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8B089D1D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:04:22 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id l11so9559623pji.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHZlmXfHQZBPoJbCqWFCiDNyc3ufmjpnvtmCga+L6Lg=;
 b=HdKfCR+M9d8PAb5qcM+B5/p30gYnobuh3hmVKGu66n+5Te/7kFF+1lP4+iNzezvBXj
 nQLuibZhWBa3njTRNVsRtL/8/fY5PVM4ZuxYwmuzeR4cd+7FStR+b9aXLsAGzUMvPdPU
 AdrdVMUiQlcbBkZfQmjM1C5jKQ8kZESByQsjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHZlmXfHQZBPoJbCqWFCiDNyc3ufmjpnvtmCga+L6Lg=;
 b=ejv+URLa/IM5Q9DEFYmrg8p6s9qNG0v0r2aiMYsWVJEBuh6S6PeIx8EmeR2/qlKzxy
 /+5PbOPBJCwrlsH9I/H2UViBi1zcdkgJYaIhrtmXubQ7WA0J//wz4tr7PUMcpoAGfFiw
 liX2qjKdRzf3AdUBvaApn3D6BcZSMqCivZUaw8tay3gLa1qXaZQ/iDSC4+LcvjRdNPbA
 Ghp/HF4acHOdJitWidW8WXjytOKrLryffWWqOfEwPCDYvcD4fGP4xX4zC+4HUvQEUhEs
 8GIVOfHquCm38ojbEYlNN5HWsBpLp56DFijpmr9jGRwRkKXampMgnzKSxzKQ6hGbras7
 tsVg==
X-Gm-Message-State: AOAM532d7ZEIONo/gra9glSIBel2AtPNRQ9YN5RVZqoJolhygIVHqAhG
 Mdi4vCNzKca0L4tEgC3dyX16GA==
X-Google-Smtp-Source: ABdhPJxISoBSmwp9LoTH6IvRjyAvOsFcHPaz0y+FHrOnPHhyh4+PNywwGDOghPqT55xz0PLyiOXSPg==
X-Received: by 2002:a17:903:22c4:b029:129:8878:f872 with SMTP id
 y4-20020a17090322c4b02901298878f872mr132297plg.74.1625389462131; 
 Sun, 04 Jul 2021 02:04:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:04:21 -0700 (PDT)
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
Subject: [RFC PATCH 02/17] drm/exynos: dsi: Handle drm_device for bridge
Date: Sun,  4 Jul 2021 14:32:15 +0530
Message-Id: <20210704090230.26489-3-jagan@amarulasolutions.com>
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

Now the exynos dsi driver supports bridge and legacy
encoder.

In order to support drm_device in both the implementations
it is required to preserve the drm_device in a private
structure and use it accordingly.

1. encoder case, the bind will assign the drm_device into
   encoder->dev, so preserve the drm_device in the bind call.

2. bridge case, the drm_bridge_attach will assign the
   drm_device into bridge->dev, so preserve the drm_device
   in the bridge_attach function call.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 90d2ce2c3055..d7d60aee465b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -259,6 +259,7 @@ struct exynos_dsi {
 	struct list_head bridge_chain;
 	struct drm_bridge bridge;
 	struct drm_bridge *out_bridge;
+	struct drm_device *drm;
 	struct device *dev;
 
 	void __iomem *reg_base;
@@ -1495,11 +1496,11 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
 	.get_modes = exynos_dsi_get_modes,
 };
 
-static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
+static int exynos_dsi_create_connector(struct exynos_dsi *dsi,
+				       struct drm_device *drm)
 {
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_connector *connector = &dsi->connector;
-	struct drm_device *drm = encoder->dev;
 	int ret;
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
@@ -1526,6 +1527,10 @@ static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
 static int exynos_dsi_bridge_attach(struct drm_bridge *bridge,
 				    enum drm_bridge_attach_flags flags)
 {
+	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
+
+	dsi->drm = bridge->dev;
+
 	return 0;
 }
 
@@ -1542,7 +1547,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_encoder *encoder = &dsi->encoder;
-	struct drm_device *drm = encoder->dev;
+	struct drm_device *drm = dsi->drm;
 	struct drm_bridge *out_bridge;
 
 	out_bridge  = of_drm_find_bridge(device->dev.of_node);
@@ -1551,7 +1556,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 		dsi->out_bridge = out_bridge;
 		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
 	} else {
-		int ret = exynos_dsi_create_connector(dsi);
+		int ret = exynos_dsi_create_connector(dsi, drm);
 
 		if (ret) {
 			DRM_DEV_ERROR(dsi->dev,
@@ -1600,7 +1605,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
-	struct drm_device *drm = dsi->encoder.dev;
+	struct drm_device *drm = dsi->drm;
 
 	if (dsi->panel) {
 		mutex_lock(&drm->mode_config.mutex);
@@ -1728,6 +1733,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
 		of_node_put(in_bridge_node);
 	}
 
+	dsi->drm = drm_dev;
+
 	return mipi_dsi_host_register(&dsi->dsi_host);
 }
 
-- 
2.25.1

