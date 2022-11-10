Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063106249B0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E194C10E7A9;
	Thu, 10 Nov 2022 18:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400BB10E7A9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:40:59 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id e129so2507999pgc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVZvXXPZkH3o8/n5mzHi6c1nTPAle34qM4sMhdqWc88=;
 b=jDmAeelXx83ktIBmtjAf1G6RakqngtCJRi6Djy4MwTzD5zjeWU/7ReG0p+6SSJdRFk
 hp7V9J9n1p7fSbOPP5VIremsyx4QLf48BgW7TkFYi3pwLlghviOB7XqGc4Vqdx3UB31O
 Gn26OanTbMQd9rVtQZ2UmrBleoFGI/X6dLFF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVZvXXPZkH3o8/n5mzHi6c1nTPAle34qM4sMhdqWc88=;
 b=XjYsCn/kHaskp3hZ6JbQrTgt/SAWJJqPhcU8Z6x/HdLc0KZDR/ZDWUJdw1ybnmxQbV
 trj+GO6kkvs94bcQTKOgghkmEv30UuAA6gRGWZtRU9cNtpYIeixN8O/05Y3O0kGRKCxx
 q0fZ6skaydIRJmXl3Xn+Az9dgNLYZf9IiERVgI0YnVsD3WFOpsIPFGhlJGUHou8XJ8vS
 vvVuteinxTotWN3Sxj2/2JCu65QT24ADSJPykDpQVh+wgHiggA7sFj0BX1WGWWY1qwIL
 MWQ/+IYAzSVKNeU78cNmm//+bHRwaoaZhWXxTSBdFXzaIdZi4c38EaYdcFLAckpCgqdF
 co3w==
X-Gm-Message-State: ACrzQf0q5P/As1ZsqTLaMPYU2iOqyhs/QAHAB3dfaVRGV+iRTTQ62YbW
 mIUrtqxWkWO7c1J6A2F0aJ5rqQ==
X-Google-Smtp-Source: AMsMyM5CIFiOWL51bQ1P/VPqW0/2Lr8GJNhCAcOr6saOgEryMRffovI9MfVkvbMhiIUW0HXzqMTRHQ==
X-Received: by 2002:a63:5650:0:b0:459:7d5f:293e with SMTP id
 g16-20020a635650000000b004597d5f293emr2945701pgm.602.1668105658769; 
 Thu, 10 Nov 2022 10:40:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:40:58 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI host
 initialization
Date: Fri, 11 Nov 2022 00:08:45 +0530
Message-Id: <20221110183853.3678209-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI host initialization handling in previous exynos dsi driver has
some pitfalls. It initializes the host during host transfer() hook
that is indeed not the desired call flow for I2C and any other DSI
configured downstream bridges.

Host transfer() is usually triggered for downstream DSI panels or
bridges and I2C-configured-DSI bridges miss these host initialization
as these downstream bridges use bridge operations hooks like pre_enable,
and enable in order to initialize or set up the host.

This patch is trying to handle the host init handler to satisfy all
downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
flag to ensure that host init is also done on first cmd transfer, this
helps existing DSI panels work on exynos platform (form Marek
Szyprowski).

v8, v7, v6, v5:
* none

v4:
* update init handling to ensure host init done on first cmd transfer

v3:
* none

v2:
* check initialized state in samsung_dsim_init

v1:
* keep DSI init in host transfer

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
 include/drm/bridge/samsung-dsim.h     |  5 +++--
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bb1f45fd5a88..ec7e01ae02ea 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct samsung_dsim *dsi)
 	disable_irq(dsi->irq);
 }
 
-static int samsung_dsim_init(struct samsung_dsim *dsi)
+static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int flag)
 {
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & flag)
+		return 0;
+
 	samsung_dsim_reset(dsi);
-	samsung_dsim_enable_irq(dsi);
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED))
+		samsung_dsim_enable_irq(dsi);
 
 	if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
 		samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
@@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 	samsung_dsim_set_phy_ctrl(dsi);
 	samsung_dsim_init_link(dsi);
 
+	dsi->state |= flag;
+
 	return 0;
 }
 
@@ -1269,6 +1276,10 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
+	if (ret)
+		return;
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
@@ -1458,12 +1469,9 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
@@ -1653,6 +1661,7 @@ static int __maybe_unused samsung_dsim_suspend(struct device *dev)
 
 	if (dsi->state & DSIM_STATE_INITIALIZED) {
 		dsi->state &= ~DSIM_STATE_INITIALIZED;
+		dsi->state &= ~DSIM_STATE_REINITIALIZED;
 
 		samsung_dsim_disable_clock(dsi);
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index b8132bf8e36f..0c5a905f3de7 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -17,8 +17,9 @@ struct samsung_dsim;
 
 #define DSIM_STATE_ENABLED		BIT(0)
 #define DSIM_STATE_INITIALIZED		BIT(1)
-#define DSIM_STATE_CMD_LPM		BIT(2)
-#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
+#define DSIM_STATE_REINITIALIZED	BIT(2)
+#define DSIM_STATE_CMD_LPM		BIT(3)
+#define DSIM_STATE_VIDOUT_AVAILABLE	BIT(4)
 
 enum samsung_dsim_type {
 	SAMSUNG_DSIM_TYPE_EXYNOS3250,
-- 
2.25.1

