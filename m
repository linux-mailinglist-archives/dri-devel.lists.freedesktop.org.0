Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1705F1AD3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3852E10E52B;
	Sat,  1 Oct 2022 08:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABD110E52B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:09:43 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id jo24so5213881plb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bIsBpWYKGaRb2gfWU/8omTUwq6r8O+ulvfUN+TCAIdY=;
 b=lfTdedK41vWtMebW3Wcp94YL7ucmrlEryRuuPWEj+o7FAAPRkjDA+9D5Pac+YlQm3+
 pBpTLZbP/U95I+bN063h+cFVsvEu91POyJnliuPN/4No7TVkOfPBVS12IJtx/3QVP//U
 RcI9Ck1SO4KholGKAGSZoHwFS9y8khcFmTCA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bIsBpWYKGaRb2gfWU/8omTUwq6r8O+ulvfUN+TCAIdY=;
 b=xPsCm/6vEdIuxOvFB12w7PKeFYsbOPoOqjGoylZ1xWw4JQtWFVg3fApoOdPTKvbI2m
 K41l6yU8f+9VtSsSvZ61xG/AVduy+MQaAurreuY3Lb12i0aAen2iOSovuEe9dTmV5yuA
 TrT00z2LRnaIGjxcPMXftxXC5yOpw19/CJ0u8EBTVIS2Wn6Av9nla4JRWzn6zkKVlxpr
 pyBEMBpvr4XxWGnkvZIzc8UYeKy0GPAhxr0OgZchQybJ7+GgZdfSgk6I0AVWfgmhstrj
 pGd+gtqC5zX+sXoCQuysbopO3XXf2GgKuDjBFV+GzXtyvIWzmdbrHdQSVCRJnAo+uUos
 /oOw==
X-Gm-Message-State: ACrzQf0IN78wvBWkb5Cg8aHX1onhS4cSa1IwMuohhnz3JJKwFq0u0jnu
 F5eW9rJg/HlP3U/iMM0csyO7HQ==
X-Google-Smtp-Source: AMsMyM7A6yv4u9IjhcSR+PGTiZiBShQT4hp8vwLtDbTRUwpJ55h1OAzyFhyKY2oLDVzQW/Ntc0WcjQ==
X-Received: by 2002:a17:902:f650:b0:172:8ee1:7f40 with SMTP id
 m16-20020a170902f65000b001728ee17f40mr12989210plg.101.1664611783492; 
 Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:09:43 -0700 (PDT)
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
Subject: [PATCH v6 08/10] drm: bridge: samsung-dsim: Add input_bus_flags
Date: Sat,  1 Oct 2022 13:36:48 +0530
Message-Id: <20221001080650.1007043-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

v6:
* none

v5:
* rebased based on updated bridge changes

v4, v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4fd77172bb4b..49406a07d655 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1601,6 +1601,10 @@ static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
 	.unregister_host = samsung_dsim_unregister_host,
 };
 
+static const struct drm_bridge_timings samsung_dsim_bridge_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1681,6 +1685,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
 	dsi->bridge.of_node = dev->of_node;
+	dsi->bridge.timings = &samsung_dsim_bridge_timings;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
-- 
2.25.1

