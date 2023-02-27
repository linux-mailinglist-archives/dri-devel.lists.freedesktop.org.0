Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAD6A40EF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCB410E3DF;
	Mon, 27 Feb 2023 11:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E4810E3DF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:40:33 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so5304007pjg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aXzlQcM2+q3cNKX9yDd3QRgxQ4bSUjE8wzTk4MHaeas=;
 b=oMN7np5Ywb1j618P5mP6I8CA1pdx3IRvrz+Z0UnRWJzF6u0sG4KAohlDku81tM/ofw
 +vBRJcuVKdoakK6YnXAnTAXf3fUBHV99jvTjWw6/i7SW/eSIXVxzlMtjX9pOBYx2/Cet
 LIGHiEa0wjSTyrN4bc1xTIHsLdyqOZ/yL8i5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aXzlQcM2+q3cNKX9yDd3QRgxQ4bSUjE8wzTk4MHaeas=;
 b=Uukcc5P3H5U/5LZOBG8i3r4H15P2exHfWpgjL+zLT/b3n5pp29nlpNb0VMRkpEyMNk
 a6mfDIhyHFqRG4edqfxDvpI1HwSGTpvZKgu2MyA7bkT6XtW4bHnlh+hivHePLCcj1Kd6
 TCbSccjNibl6OEqpqbw7OyAAGdvHRbWxoXhnoptipVRV6oZMCJwOInUKA3d+/RhGSk6u
 Wj0Qog9K+danUmx1Y1Gs+3lnXc0/68S0hWGeKehdL0Q0fKVFsRHv0qqnHytRKCQ2nPX2
 dLhdiH9/Io7HtCVIot82BuN59Le91mR6O2qMAM/1ZvTuRQzgU0NcEPO7y/u8Ck2d4xF7
 1nEQ==
X-Gm-Message-State: AO0yUKXSj9VIQLXybEjd3XKOUF1cTISyPTj2GvyxikdDI8wsst7RzQfZ
 KieYSv6pz+z8pe6UsF6pkeTg+g==
X-Google-Smtp-Source: AK7set8nVCUoZ2kKVilS7IRsDEIA0PAZPWIW+2HrEvpd1P2d2JhIqlSDjvd1UwEHZ0H+jF8ozv6LpA==
X-Received: by 2002:a17:902:c946:b0:19d:74c:78e5 with SMTP id
 i6-20020a170902c94600b0019d074c78e5mr5079561pla.50.1677498032954; 
 Mon, 27 Feb 2023 03:40:32 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:40:32 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 08/18] drm: exynos: dsi: Handle proper host initialization
Date: Mon, 27 Feb 2023 17:09:15 +0530
Message-Id: <20230227113925.875425-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

Host transfer() in the DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this host
the transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the controller
setup for I2C configured DSI bridges.

This patch updates the DSI host initialization by calling host to init
from bridge pre_enable as the bridge pre_enable API is invoked by core
as it is common across all classes of DSI device drivers.

The host init during pre_enable is conditional and not invoked for Exynos
as existing downstream drm panels and bridges in Exynos are expecting
the host initialization during DSI transfer.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none 
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
Changes for v10:
- update the to simple logic to handle all platforms
Changs for v9 - v8:
- none
Changes for v2:
- check initialized state in samsung_dsim_init
Changes for v1:
- keep DSI init in host transfer

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 9217b362224a..5723d91ff686 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -255,6 +255,9 @@ struct exynos_dsi_transfer {
 #define DSIM_STATE_CMD_LPM		BIT(2)
 #define DSIM_STATE_VIDOUT_AVAILABLE	BIT(3)
 
+#define exynos_dsi_hw_is_exynos(hw) \
+	((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
+
 enum exynos_dsi_type {
 	DSIM_TYPE_EXYNOS3250,
 	DSIM_TYPE_EXYNOS4210,
@@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
 	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 
+	if (dsi->state & DSIM_STATE_INITIALIZED)
+		return 0;
+
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
 
@@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	exynos_dsi_set_phy_ctrl(dsi);
 	exynos_dsi_init_link(dsi);
 
+	dsi->state |= DSIM_STATE_INITIALIZED;
+
 	return 0;
 }
 
@@ -1411,6 +1419,16 @@ static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	/*
+	 * For Exynos-DSIM the downstream bridge, or panel are expecting
+	 * the host initialization during DSI transfer.
+	 */
+	if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
+		ret = exynos_dsi_init(dsi);
+		if (ret)
+			return;
+	}
 }
 
 static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1568,12 +1586,9 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = exynos_dsi_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
+	ret = exynos_dsi_init(dsi);
+	if (ret)
+		return ret;
 
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
-- 
2.25.1

