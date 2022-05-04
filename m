Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4380519E39
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B2C10F826;
	Wed,  4 May 2022 11:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C613810F826
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:32 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id j8so1157267pll.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zroNIHNyi1xhWUCjMbfGRAX1xVgB1APMgcHSCv64Dcg=;
 b=GAMchdnOFVBu8MgxuMIcwfoun7timH2lhBD9bi3n1IOZVh9J/WFY63YoebZLARAICK
 AYqUsCFqKufuSUa14TOerRFX5LcMhnoqguVXcfZtFOoxVYHHExRug9CDoW1Ax0QNtxk+
 utEfgZ4g9oFV6hnVUFHf1qb1Tohxqtu2Oj6SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zroNIHNyi1xhWUCjMbfGRAX1xVgB1APMgcHSCv64Dcg=;
 b=XXh2wUQY+jGlOYw8DSLPiUzNRaEbw+cLDU2Mgd5eXUC00N69ml0fLkxK0Pl8HdEBq1
 QIdAqbWqi+EgN0AVS4yTplPsgLV2LiWeWPim2FMk8t3qSqmEstRvW4AwAe076j0ChYXW
 tB4gwNx+6bdIw2g494JMBHx1Sjzxhq5sPyzwrV5PiRVpHTNUkSr1HEFUg3gZE5H+rpAp
 gWBvFOF0PlN3EW9Htt01l+JBC9d7E+uiAKGdEwT8INmU3VPk1FwLbdYGPdoyk70W0lHu
 n6aTJXEn2jCcxOt0AERFkacrVMMMMl+WA5ZIoi6dtOBRPLXO5mUUzOztAhToSUQVkwZ3
 4ZJA==
X-Gm-Message-State: AOAM532CuZ2UA2F7qj4EXIUQUPd9LJpGBFLi7j1WaebZ+paMGJddqv8A
 PTLjRQ5gwQoMv+Nlb3JTXWh1Mw==
X-Google-Smtp-Source: ABdhPJwEaGjX3j/RzoSectesepakk+UomwdKFJ3YD/G3W/8jIvtg0/ahYwC1KyfyV4iEoDGRkcuAnw==
X-Received: by 2002:a17:90a:fa97:b0:1dc:2805:9b0a with SMTP id
 cu23-20020a17090afa9700b001dc28059b0amr9700771pjb.85.1651664492362; 
 Wed, 04 May 2022 04:41:32 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:31 -0700 (PDT)
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
Subject: [PATCH v2 07/12] drm: bridge: samsung-dsim: Add module init, exit
Date: Wed,  4 May 2022 17:10:16 +0530
Message-Id: <20220504114021.33265-8-jagan@amarulasolutions.com>
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

Add module init and exit functions for the bridge to register
and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver separately
in the common of it's exynos_drm_drv.c including dsi_driver.

Register again would return -EBUSY, so return 0 for such cases as
dsi_driver is already registered.

v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8f9ae16d45bc..b618e52d0ee3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1740,6 +1740,28 @@ struct platform_driver dsi_driver = {
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

