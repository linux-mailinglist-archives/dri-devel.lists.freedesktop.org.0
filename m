Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AC5F573A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF26610E447;
	Wed,  5 Oct 2022 15:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BED10E648
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:13:27 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id l127so10551995iof.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTE4OyoAPPvHX4/voYrSXggdSk25Ceo5ZBjV7AJSfnQ=;
 b=c5/d6Kr0FFnq30GHdmiuMG2sUP0T5m/KQzZqYN5lgKNE0NGjYSyg1kF81kpvPCTIoL
 AENd7cCb5meoc5UDzQZmaBruBQotgvTERB8G06jevzdtyrj8p8YGGfqvKav0XY3B+Yhf
 Kfvt8icGywu0qYhuJ6hNRoaFSV8lfnkVcLz6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTE4OyoAPPvHX4/voYrSXggdSk25Ceo5ZBjV7AJSfnQ=;
 b=R5XWN4tLamFFIzD5ZHRtb8L1zPiOK2mtRazjNjr4/s/+pA4Q58PZ342plT4RyAMkvi
 U1DfeW3uLzGAWt06/W8uQNS3wmEgriewmqV5apnC0hwXs2x2Fykw5urjJyr93oRKpw4I
 jreX6ysFZ+CXBByMdb+vxGG/Knry7HPibgUCdY4cVU/DadIWdqUrPT2nGiSnz7MStFcU
 eknUYPr7GEcqPOOPkm95DasUagdgh8SV1ftNXfxKpJ5vFu871rdDr8zA+VVt0cvJbtE8
 Fy7YVWiznKeDJiJj3el0yK/YnLyDaGJQRrXMFs3CEZ+dCcr0FhR+aaQpF3JyrySRKoUq
 3v7Q==
X-Gm-Message-State: ACrzQf3av9+rsF5tK4nY2dVjFBjLhaSIB7B3U+6cquJkFgiN4RwzamkU
 aRRzGSxHJRW3xilTmIXuVuR69w==
X-Google-Smtp-Source: AMsMyM40pIuHfCdrxZqp1NZDN/lFDmsgc2lreRe9h5tfHkJksCNCxPUH6RvZ3c43rzSAfevYpzbwQg==
X-Received: by 2002:a02:ccf9:0:b0:356:71fc:26a5 with SMTP id
 l25-20020a02ccf9000000b0035671fc26a5mr49162jaq.165.1664982806826; 
 Wed, 05 Oct 2022 08:13:26 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:13:26 -0700 (PDT)
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
Subject: [PATCH v7 04/10] drm: bridge: samsung-dsim: Handle proper DSI host
 initialization
Date: Wed,  5 Oct 2022 20:43:03 +0530
Message-Id: <20221005151309.7278-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

v7, v6, v5:
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
index 1bae3673151b..563781bb27c4 100644
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

