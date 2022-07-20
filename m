Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C108657BAE3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C5B8F778;
	Wed, 20 Jul 2022 15:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C138F737
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:49 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 t3-20020a17090a3b4300b001f21eb7e8b0so1882381pjf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKqKSpIoemqVJvmONKd6Y8SQyJA7cnV4uKHmCv+ADCk=;
 b=GNSCNaKrUm3d1bXMtufqIxjwG9UhsmbJebE7kan/OLYK+D+KUuhqNVXOPPWdVpeBvm
 u5nzalIBEHN3pVVamLt9am2vDsJYqjAY1COv7McbFc0cO+wVmwG1r8UVXhCrxcEaaLKk
 Dt9uzTm08dHiXIJdY021DoMsL0F+WBbqNMnPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iKqKSpIoemqVJvmONKd6Y8SQyJA7cnV4uKHmCv+ADCk=;
 b=jWLWpZvqcXKubH0e2Bd/2t9Ijj42Ape8kNUyZ0vR9pU49NnGuRvgL49j4h4lZy3Eaa
 AfAOTbIe7h1WhyO7144sbL7ZzaUNN9VZTQ/VOt+pMjoBz0LsUhC/plezkCMiDb0HoQC5
 wggXkK7FpfHX99OOpVYq5EwsvJ3LUtrHrkZ2A0vRR4MrILXx8DoHx4TLula8QDB8IM9N
 t3bGGTrIQP9sOQhb4SZltTlswuSeuRWF9t/11edEdl/Nj1iDjzpWDgPtx0StPPhNn1W7
 eiR7FsaMOmQu0lBWcbvjze7TjZnLYeoEd8f5ZcN9t9+3ZrL5KNGTRNfXwNSPH8ZSnDWi
 bz5Q==
X-Gm-Message-State: AJIora9IZFEP91zdMWTFazuzk9JRCZlgjmRvHsoOOxp5RPRxHFrz7bm3
 ZlUDf6iHhkpwjQoSA888Xe1xMw==
X-Google-Smtp-Source: AGRyM1vY/tznd8lVbexlB1d1i7cBqZktheP7oQh5b3RuBKJuBql8fuwFbjXLEnhH4o+uHauW25wcnA==
X-Received: by 2002:a17:90b:3890:b0:1f0:2abb:e7d1 with SMTP id
 mu16-20020a17090b389000b001f02abbe7d1mr6276345pjb.158.1658332428629; 
 Wed, 20 Jul 2022 08:53:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:48 -0700 (PDT)
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v3 11/13] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Wed, 20 Jul 2022 21:22:08 +0530
Message-Id: <20220720155210.365977-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

v3, v2:
* none

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2584343b767a..ef439b49f2b8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1591,6 +1591,10 @@ __weak void samsung_dsim_plat_remove(struct samsung_dsim *priv)
 {
 }
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1670,6 +1674,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->driver_data->quirks & DSIM_QUIRK_PLAT_DATA)
-- 
2.25.1

