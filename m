Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ADC67CE9B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54710E925;
	Thu, 26 Jan 2023 14:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7439210E922
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:46:45 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id a18so2027339plm.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCVYG25W1pHQNxSfAOiHmaNQidizxzXKd6AiL4XAwms=;
 b=J5r6PKryB1ljLmvqcvclVHC92p0hV+3a4T0wmynl5mHdjZSWBaxln6B+q2Q+RNzYmc
 uHsB87C/M9RCMhUC5jRCjRXQE6QFfrjK+1qEpuMXkJbZqgbgE85Rlr0YBNUdI9hRilyz
 vhIEGJ0oWoB9vqhtmRgisKViEnW8Ql14VL9nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCVYG25W1pHQNxSfAOiHmaNQidizxzXKd6AiL4XAwms=;
 b=5AeTd8jrZJhGA1TkpL5sPj1E/xiCIJ1BHn3nE1S247QwGW9BjnEl9XN4liYGHyGnOK
 wztHvqGWeVYiSj1dSmZF/3pt0XZAva69pDIwGzhJar6IvlC2ka8FInvX1HVTqjjEo8n0
 ToLrzbph+1dxe7LfEDcy/Hxq6A8KjsojrtSw1E18gfD7rzBb5hTxFKHmQ73aGA8MdPar
 vBc5t5eJhzCD3B1asSbWbfuTzQvA57JHV0bWlMol/DusN0vPn4g5auXwSQy81asg0X21
 fT4lk5dsfkw0POngIoMOw5dBg6MzCP4to8HdOH0DTKRtwUtANPMKwKm+EFqW1GusP1ap
 YctQ==
X-Gm-Message-State: AFqh2kokgDWIHhc2/itvW+GiPAFtBnKcfYbqD5sA0ujhAtsVZEVqSGvR
 BGFUgbyUSODvLPYwoST692+gmg==
X-Google-Smtp-Source: AMrXdXtJ5fZLKtk38j0oZHe+QIkIVQDfMF/e1R47vrpGkb7LfA21PmqqZvKVYx0jfa7t4ZjIOLqVfQ==
X-Received: by 2002:a05:6a20:3942:b0:b8:50fd:fd1a with SMTP id
 r2-20020a056a20394200b000b850fdfd1amr50376881pzg.19.1674744405018; 
 Thu, 26 Jan 2023 06:46:45 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
 by smtp.gmail.com with ESMTPSA id
 d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:46:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v12 10/18] drm: exynos: dsi: Add input_bus_flags
Date: Thu, 26 Jan 2023 20:14:19 +0530
Message-Id: <20230126144427.607098-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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

LCDIF-DSIM glue logic inverts the HS/VS/DE signals and expecting
the i.MX8M Mini/Nano DSI host to add additional Data Enable signal
active low (DE_LOW). This makes the valid data transfer on each
horizontal line.

So, add additional bus flags DE_LOW setting via input_bus_flags
for i.MX8M Mini/Nano platforms.

Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v12:
- collect RB from Marek
Changes for v11:
- collect RB from Frieder
Changes for v10, v9:
- none
Changes for v8:
- add DE_LOW for i.MX8M Mini/Nano platforms.
Changes for v7, v6:
- none
Changes for v5:
- rebased based on updated bridge changes
Changes for v4 - v1:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d8958838ab7b..5518d92c8455 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1691,6 +1691,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1777,6 +1781,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 	dsi->bridge.pre_enable_prev_first = true;
 
+	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
+	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
+		dsi->bridge.timings = &dsim_bridge_timings_de_low;
+
 	ret = component_add(dev, &exynos_dsi_component_ops);
 	if (ret)
 		goto err_disable_runtime;
-- 
2.25.1

