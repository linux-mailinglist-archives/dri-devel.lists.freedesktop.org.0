Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0366B0EF5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F72B10E692;
	Wed,  8 Mar 2023 16:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAF110E692
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:41:04 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id y2so17034211pjg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5uifEp0NbegnY+0fHyacboXPZ1//0/dD+ZvuB6kybZM=;
 b=gLVZ9B2id2TGNA73o4SbWd+gSleFNhHU5J1GOfn44Ll48NxHFMuHHzdjXQwjt59dyp
 SikxKeOxgLvoyx6iNXM2EUieacNbbSSI5ZYmRgDAl53qu/54GFpUCFDptXwaquKAeLDm
 Q55eysFkFqVhcT7gdLlCZGPrPvaG7xaO2loH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5uifEp0NbegnY+0fHyacboXPZ1//0/dD+ZvuB6kybZM=;
 b=SSrTdfNWHOe9BT5mCM38UpGWUI72YGEg5/gLUkNBQHW5mApqQQZcx0l8SvSMnVu8yG
 xXHSQp/ktEsKa6f7gwV7ziZWKUAKJYdk5qyIK8CqLmxUfx32mUZ7oKLZ4Sl5NLo3WdiQ
 E8sc2U/mLfG3pajh2Nph3AlEU4fr6XJoxXWQ8xSQnCyP0kF4V2ebTX0my4TAOgNRde1B
 nRACLz0rd8H3Tg4fYoPv9fQ9Ip4qV1+OkJQBw0v7Rh1x5ZwHOoEEIIrEwkpzbn5wYGAX
 p97FbeETuG5ET2Zler6Z/OURLxWuTeOeWv8W06uVbGoRidBOnv7UWWGWXPojq8GXjwXO
 x+7Q==
X-Gm-Message-State: AO0yUKULOLjouEjYvGptHhm8qwGFw58B7L1nd1G7cZ256aASD3rG7kO0
 heNEaoUzpxTyXw23UIVxk1LhLg==
X-Google-Smtp-Source: AK7set8sWU4P3d6UTEGJeT1Vc+X1pMVPeXyXvAXNHaaKMJxaX2kRJAhSt7ObvbjuPZpAm2ohEQ2xWg==
X-Received: by 2002:a17:903:24f:b0:19e:7a2c:78a7 with SMTP id
 j15-20020a170903024f00b0019e7a2c78a7mr20928369plh.57.1678293664454; 
 Wed, 08 Mar 2023 08:41:04 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:41:03 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 08/16] drm: exynos: dsi: Add input_bus_flags
Date: Wed,  8 Mar 2023 22:09:45 +0530
Message-Id: <20230308163953.28506-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
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
index df4d95ae8aad..0c480be5f070 100644
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

