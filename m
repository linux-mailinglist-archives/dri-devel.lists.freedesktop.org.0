Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C3C4F9A76
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C04D10E51A;
	Fri,  8 Apr 2022 16:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ADD10E51A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:22:57 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 n6-20020a17090a670600b001caa71a9c4aso10180466pjj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Is0eSnwBB0c+KCKE5P6y3Z/4g9fKoG//Yrq64nJGzuA=;
 b=PJ1FXOhyq6lEZGcESSV3oZwNaq+cYEByIC3a06+xLMyPUy4BAL3RMx2iQFRq6Zuapa
 GnJw/ocMXEDvDTGDzFf9FeZ7429S7s3jYF9LBWvOAlbq3/4peayUB6XiweycgoC59yhp
 wNjpd+UKj0nS71yvRdLLqDdlPK7xZ/pUb2iqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Is0eSnwBB0c+KCKE5P6y3Z/4g9fKoG//Yrq64nJGzuA=;
 b=FEMDgPCu9eU6aikzwV7rtfUgFf83ZiR2jZHyh5+1IelYtxHAC88Fe0E/sYFKFszOPs
 zrMXH5SQccX1HFPdmuelfEVbjnS9fjpce+j8kFHL3mPUR/6S2HeVAxxQ3RWcC3i2m3Ec
 v//bDD1IBAcaZzaY/CsY56t4N/lA7nF/THFtNpem27WbZpfjgNkVOQGwU9SBSQRDRtu/
 lc2OszYsau2KUDkGQS3hz/lhJonaYDWYNWXtc3WytxGETNMRIxY+KZ7vHPZKH4VKpiIT
 dayPKWJmS9heDEecQvc1Gbf0yL62YB6Fb90KA2DGXvQd4WasewU9pP61sNtFbmt21XIF
 QzLw==
X-Gm-Message-State: AOAM530Ul3eQgj8NLUJnfK3vnArzR4DqrPv2L6OoE+NljUq0HDa3rP5E
 /rSxOQNyEoE7CRUlxjq0g9TjlQ==
X-Google-Smtp-Source: ABdhPJyyC+DLIlCAsb4NS7NYt091VuqvyMKyji4aF7dG4s7CnOE/27EJaHXsz9UfH0iHconOn81y2A==
X-Received: by 2002:a17:902:cf05:b0:156:9d:ca01 with SMTP id
 i5-20020a170902cf0500b00156009dca01mr19868194plg.111.1649434977157; 
 Fri, 08 Apr 2022 09:22:57 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:22:56 -0700 (PDT)
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
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 06/11] drm: bridge: samsung-dsim: Add module init, exit
Date: Fri,  8 Apr 2022 21:51:03 +0530
Message-Id: <20220408162108.184583-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
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

v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 423d654e8ffd..1fe4b8e737a4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1696,6 +1696,28 @@ struct platform_driver dsi_driver = {
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
 MODULE_LICENSE("GPL v2");
-- 
2.25.1

