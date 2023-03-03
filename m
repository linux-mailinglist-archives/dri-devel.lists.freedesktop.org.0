Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DD6A99E0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6CC10E63C;
	Fri,  3 Mar 2023 14:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159210E63D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:52:57 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so2461099pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GpBHKg2Gosb5BLI0oOYz0OdhN4+kHsJSwAsQE5BDZyI=;
 b=cbJxdKLy2Asvp1ZHaU9YEae0ccePauhomRdvxY4Mt/Oevewsx7H/50anMfu5AqmV9t
 id6B/gv+xxOW7RIIbTs/QTYwf55IB+kQssLmJUKV4F3C4XF2zCM6ONIb602ileIwnRZe
 gHF7f7SIgg1oxoyv4rP6ok/gHnKQDV+u6H1fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GpBHKg2Gosb5BLI0oOYz0OdhN4+kHsJSwAsQE5BDZyI=;
 b=CHxDl1EyRUNH394ROiudgF2/xrDZLTsWp8S5pitlSx6en4EdGwLcxZ3i7c+6OfFCWO
 E1erXG9564Bjq4A0szeSzBnb4Y643x7IvrShNn79gmlc9wJ1m/jIOhokIzsyz0ta90Nl
 Fls3l/GfsT2tWDepv412dZbxvsYGuMkKUHTRBctjHbVfDRTvL2fkJCJGEc+bSbqjoXma
 jYAs8jwA1CU/RRg7mQHDD2ZfgwFIcjJdOU+ZEmqy8tf0a3oz9hr32w4/UAI271RQuLe2
 w8vqQJ5E/gCLhQMfdxgGggmTeIkYBJMN3bZ8XShvaODBnpYLNV2bcbnyVEDVs6/1qNBj
 2yWA==
X-Gm-Message-State: AO0yUKUowjok4IUJ/ycPFsNnte36DIaOhSISDRI0L4zivTCeB8t4oFK/
 ECgvacY2kmP5iBdRNJc1I2Y02A==
X-Google-Smtp-Source: AK7set8qLWqOAh0d59+jT9qkG2ZL6glMQgv/dAlbg7elmYnxYo15vbILe2zpJkOhVAlnxhOSUqH0Kg==
X-Received: by 2002:a05:6a20:c510:b0:cc:5917:c4ec with SMTP id
 gm16-20020a056a20c51000b000cc5917c4ecmr1900370pzb.23.1677855177350; 
 Fri, 03 Mar 2023 06:52:57 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:52:56 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 08/16] drm: exynos: dsi: Add input_bus_flags
Date: Fri,  3 Mar 2023 20:21:30 +0530
Message-Id: <20230303145138.29233-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
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
Changes for v15, v13:
- none
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
index 796480e4a18b..5d971b607e1a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1736,6 +1736,10 @@ static const struct component_ops exynos_dsi_component_ops = {
 	.unbind	= exynos_dsi_unbind,
 };
 
+static const struct drm_bridge_timings dsim_bridge_timings_de_low = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static int exynos_dsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1822,6 +1826,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
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

