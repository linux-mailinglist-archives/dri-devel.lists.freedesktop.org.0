Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61A57BADD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B88EEC3;
	Wed, 20 Jul 2022 15:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D947C8F432
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:27 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 70so16864055pfx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0eeL5YJ6K1K/xYPiM4D/8wsBy92RLKZITtI/QG6TU2E=;
 b=C/ZB4MD+XhCadB9ByRb9zQVH3CkP5PPzXZ0p8wDhr2QbFnziWRPN6HojLxGEiQ2Ei1
 pe+MJcwaKoX6VAsnqGIQk6s/p21WSoP/63x9Tx0CrO+/yKoDruuZl7zDAE72TnZoR1H1
 ODorIPWnbGQRf+zU58YGZ/D5lQaIMxfYiHn/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0eeL5YJ6K1K/xYPiM4D/8wsBy92RLKZITtI/QG6TU2E=;
 b=TaL/YMGaYKXYx8xx+IjzPiMt0whU9KBrmuS5+woVgjSiQrnCjh/BvPvoUV5bgKJ9Lp
 sufAlYvbOK4Rz8uLhS/j4w4arQ7nyz2dWq3bFlH+75pAJ8YSb/nPT5Tnm72cOIE+Nez/
 FQvvkRYcxjTy0a5VA2442cdnhWygiv1o3XlRz1vCWudMKL9U6Gvcyj4gxgMoe24JQ1L0
 MwTf/c/5hrgVHPRL04nKmf4lggC8qrM6EZHPFxcQO5HUKKSAw5CNvQe9cYJfoI1AuLDt
 ebFA4IgjjGo1meDDk9WAHoS4nfU7eoYJU73/KdexTziYBH0TugD4htkS7rVe8OQ+yc7/
 DqIw==
X-Gm-Message-State: AJIora9v/oCViHTRYapvM9fzjU+1Cwxr09yh1PDrwvOIkopD84Co9pl+
 RPSCjBEhOoXnCH7wfU4e8t0EMQ==
X-Google-Smtp-Source: AGRyM1sZ16aLGbhGSuthIDLv8wJdyw4xIzY5kH9mfBVhtnoeLGBHmAM4LeECI6EWetU0paphjwCaNw==
X-Received: by 2002:a63:4cf:0:b0:41a:617f:e195 with SMTP id
 198-20020a6304cf000000b0041a617fe195mr4269823pge.89.1658332407383; 
 Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:27 -0700 (PDT)
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
Subject: [PATCH v3 08/13] drm: bridge: samsung-dsim: Add module init, exit
Date: Wed, 20 Jul 2022 21:22:05 +0530
Message-Id: <20220720155210.365977-9-jagan@amarulasolutions.com>
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

Add module init and exit functions for the bridge to register
and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver separately
in the common of it's exynos_drm_drv.c including dsi_driver.

Register again would return -EBUSY, so return 0 for such cases as
dsi_driver is already registered.

v3, v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5eb594ea0bdf..5a0fea30e9e8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1737,6 +1737,28 @@ struct platform_driver dsi_driver = {
 	},
 };
 
+static int __init samsung_mipi_dsim_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&dsi_driver);
+
+	/**
+	 * Exynos drm driver stack will register the platform_driver
+	 * separately in the common of it's exynos_drm_drv.c including
+	 * dsi_driver. Register again would return -EBUSY, so return 0
+	 * for such cases as dsi_driver is already registered.
+	 */
+	return ret == -EBUSY ? 0 : ret;
+}
+module_init(samsung_mipi_dsim_init);
+
+static void __exit samsung_mipi_dsim_exit(void)
+{
+	platform_driver_unregister(&dsi_driver);
+}
+module_exit(samsung_mipi_dsim_exit);
+
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
 MODULE_DESCRIPTION("Samsung MIPI DSIM controller bridge");
 MODULE_LICENSE("GPL");
-- 
2.25.1

