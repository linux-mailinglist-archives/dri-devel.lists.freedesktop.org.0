Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4A04C8D69
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C625510E82F;
	Tue,  1 Mar 2022 14:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9610E82F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:15 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so2074089pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ADBJOJJawEycdkHMuo7YSP3/OwAMSkCIo3gpljHm8c=;
 b=pE/TUj957bec+OdfR9iCwinj4Vj4ojGxa8wQ/DXu/qAWpe/rNXTySa3mG1YUlTYl07
 9UPksOxYguN/MAuZCVOxuyah6+RZaoQuG7Hb+IWqbhTooltUCL8ko3a8AEuQuCyFOL6i
 FAvyijef17+gXWT4swrxe6sF0XCZEfu6q+nJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ADBJOJJawEycdkHMuo7YSP3/OwAMSkCIo3gpljHm8c=;
 b=zzAcGCgheLRKZfv6eZHacsmU7iVTh7HWDrFXg7g5ifLGEMJs0yTXpH/Apgau2K1GGs
 Rjfhs2UY4F0irn7g8TNzav0T9iEef0PsHwviK4xrqx0N3ozL11vYxJyE3poGaAW4jQ1S
 BMTFijylh+rUf2bjn7bEJqxYDJkh/KhE8PsKAFlo9DE+URWWf9PwDnGLsTy1mPIgUxwd
 9kUKeRBiZ/d7cfjwt3LeuJIqJZdMb0tzxanBBrp2tjwyWjKxFjCynYRHoZzEMKVUWW8c
 c52MjUBEE6tQNIMc/p0kKtEorl31/aWwXZzIAxQPsl1KTchjPDdkyA8Qf+pxlGJM4UIu
 ksnQ==
X-Gm-Message-State: AOAM530RgvpsIO27lxGzPB+tSeUZb8/XTkC0YkiaKKXiqChlI3b3Cs0u
 sPPPcPiitRnCVo0mb0QVlmUtTdvAqSu98w==
X-Google-Smtp-Source: ABdhPJxgYxr1yTAFpq0XRdkobkUCq5hCgOSimUBDY7FZu5yWoXbY7vgz8bB6DD+vpGKlKy1mjlFWIA==
X-Received: by 2002:a17:902:8498:b0:14d:cca6:741 with SMTP id
 c24-20020a170902849800b0014dcca60741mr25507576plo.16.1646143994756; 
 Tue, 01 Mar 2022 06:13:14 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:14 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 4/8] drm: bridge: dw-mipi-dsi: Switch to
 devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:43 +0530
Message-Id: <20220301141247.126911-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301141247.126911-1-jagan@amarulasolutions.com>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
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

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- split the patch

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 1cc912b6e1f8..b2efecf7d160 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -315,7 +315,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	struct dw_mipi_dsi *dsi = host_to_dsi(host);
 	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
 	struct drm_bridge *bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	if (device->lanes > dsi->plat_data->max_data_lanes) {
@@ -329,17 +328,9 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
 
-	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
-					  &panel, &bridge);
-	if (ret)
-		return ret;
-
-	if (panel) {
-		bridge = drm_panel_bridge_add_typed(panel,
-						    DRM_MODE_CONNECTOR_DSI);
-		if (IS_ERR(bridge))
-			return PTR_ERR(bridge);
-	}
+	bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 1, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
 
 	dsi->panel_bridge = bridge;
 
-- 
2.25.1

