Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449D84D1231
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06D710ED3A;
	Tue,  8 Mar 2022 08:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3C210ED40
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:45 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso1630667pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wN3m2ndqA5HMdI/kw5XelwmrJbhaV3NLwlS6+vKGmUQ=;
 b=GC8kICxKwc0cX9Ta+cy8a/qtjTf6HcQmkysyxl9Cp1br61T94kB/8nLoS9nUjImY81
 Yl8l1Ho8F3fqea/3UDeoXU05NUUogiSbaxFMhEwL8S21SD3Fz8bOjjNct+Mn395D+Yig
 o6C26mZbtXZbp2k3cJ+GCZqO437kLLcp+vRuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wN3m2ndqA5HMdI/kw5XelwmrJbhaV3NLwlS6+vKGmUQ=;
 b=m46LxPjRbVWtgYx7qiZUkLwVMkGetM07uIISIbSx0d2sLE3y+wFt9trFAz2bL6WJB6
 H2hsXIQbNmBJpveD8QYv04Ghxs6Nyq7C9Sz+Mbk12ZDRMYtCLGwVLCdJtJvtoDrBDLMD
 +6N5vF8BzHIvFbyeL692/FFUZOt3zgVddbFMnPlXYxE38qpnR/NeM1QotjpM1d4IPcd3
 Y6yzBcxHyiRtpZPTvNoeMTOorh44Pnrec193GIi8JhCSH4Qkx4kUqRwfFPDyNSGBr2if
 7/fuU9AI64mPYwv24ZP8mUPyp5qBcTAO72SvtRy+sHQeh68Qv/vtRGzjPbkUYbOgOmxy
 cUJw==
X-Gm-Message-State: AOAM530F4a8C/iRUxVyPLvsnxcBUUiyjLXVeY/TXJwJ7U9tqkSEAFhDR
 QNgpFoI5LQc+uYRw1JfwaO4CB/BEEiT+ohfW
X-Google-Smtp-Source: ABdhPJxrxcFZ/WapoXW9hchmCGmA2aFcnLYMKFuYnx8fe0WCzNgw11TkJOMFJdtIeI699wGLvwpzKw==
X-Received: by 2002:a17:903:248f:b0:14f:acf5:a5c2 with SMTP id
 p15-20020a170903248f00b0014facf5a5c2mr16444969plw.167.1646728064950; 
 Tue, 08 Mar 2022 00:27:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 4/8] drm: bridge: dw-mipi-dsi: Switch to
 devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:22 +0530
Message-Id: <20220308082726.77482-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Changes for v3:
- none 
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

