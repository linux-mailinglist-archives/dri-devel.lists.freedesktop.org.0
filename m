Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DFD519E3F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBD410F93C;
	Wed,  4 May 2022 11:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B9E10F93C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:55 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id i1so1167797plg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6x3uhd4n6O5D7pALxGc91aHeDNwJaEEVtXUZiIW64UA=;
 b=aBFpZcFXIbVT3OsRu1NUdY7fkQxGxL2Lb22zKsZQs3fnuyVvpxi7YYwBV9FX24QqX3
 r0mXe7PmpQdgkwL4ePr92WpXPVkRLD+xUBuPIBN7jLZDNAiCS6sux1lSvbqfs2Dops4C
 2Y3Y7x8AXAr6oAbEsgSKB+Rv1HZu/McoWwFp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6x3uhd4n6O5D7pALxGc91aHeDNwJaEEVtXUZiIW64UA=;
 b=a7tULx0tqL1i8r0EC+sse1p/88+xA5rnhsivBPg1n+96F5dftNxX0It+ahxXf8gWhc
 J8h9t2uIZdOsRBbAwXP71FHzryyopoFv+9+AGL/87KNJ3ogC+yVgk1a2AygWd91G7zBJ
 bd4XCX9v6xmhDPH9peHuLK90LeazIJLF6BLECEMLybhdpH4Issfk+HB+X/S5R/0zt/Ul
 N0hAMNmBDUZikSPEFuQsJuxl6LgE1ORjkIlSJDtf/F5rF6esCnZNTBbEBMH+bCyEdmcO
 IMee53U0tMbuNs5+A6R13gQ2zSVTQVkdpLLXlyUT/fZqOq44mQykP+HFhZuH5J2IcqbB
 Q7Gw==
X-Gm-Message-State: AOAM533HWAUgrOrqa/pHx++xqScWuA05uh1VIbdDfWO0F1f1aNh1QGTa
 f8cwQYclpFzhSmSQU3aPveSSYw==
X-Google-Smtp-Source: ABdhPJxMlVVAIBPMiL4PWtvlE1XR6X5dinptt8otsTu2e9OjgZztK0oOnkzntRbi5WClZV1gDUY9QA==
X-Received: by 2002:a17:90b:1c04:b0:1dc:4dfd:5a43 with SMTP id
 oc4-20020a17090b1c0400b001dc4dfd5a43mr10047143pjb.160.1651664514764; 
 Wed, 04 May 2022 04:41:54 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:54 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 10/12] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Wed,  4 May 2022 17:10:19 +0530
Message-Id: <20220504114021.33265-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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

eLCDIF is expecting to have input_bus_flags as DE_LOW in order to
set active low during valid data transfer on each horizontal line.

Add DE_LOW flag via drm bridge timings.

v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 407abd488005..28ed6b096fd0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1587,6 +1587,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1666,6 +1670,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->platform_init) {
-- 
2.25.1

