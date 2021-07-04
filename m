Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2383BAC4E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA10C89D7D;
	Sun,  4 Jul 2021 09:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B9D89D7D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:05:06 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id g24so9567480pji.4
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDJhbX+YMl3evTa07XA+cYBo4VfmU7H6Kne/zU0MCxI=;
 b=MzU6XoPBmW8oZc8sFFtNdNj7nBMBEITvj347sE61nkA/4LHtDJQ/adSkdZsxF9I6f5
 7RCsUnSCy7i0MBKTALe5RQAyETtpQd3atLLGO8KGGRj4fqfxhS6HRWy3OjweDv3VKVtL
 +syAh8R08cMBsMYbrksHRa2cPU+yJ0uDgfU9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LDJhbX+YMl3evTa07XA+cYBo4VfmU7H6Kne/zU0MCxI=;
 b=bxikacaYVAspmV0nT91z2s+7OKz5okLMvPqddFKg8+IbS6PJylSXduLwBv6gGUyq+O
 M5sLyJe5aq9atyovhYDxsYl9j88hv10u5txAmJWvmADKM72LqlxUeKqMAF843wh8DBGh
 aIzZPCQm7FX1Dn31hXUmX+mVy6FX7TSFlo5yrEk0x85ET39P6dVX6lsxO2KWeBVr9+tY
 wo/RtPfHYNz/K+vspCeTPRYFAxttXpEIpdwjD+sZkt9j+lst6cHl8JYLLNsL5omFKa5b
 nYxNjxRhAcsl8c9UEbe2IqP8E2HmMx8BblDWxqkRRjcpo2/txEM5AreJaK2XR1LSIkeg
 V7PQ==
X-Gm-Message-State: AOAM531FpBu99/hjRo4tJjJ3h+2VVrcEhvlMILpq7nz8GRWASD9OVrQX
 nvehYyrxA4+ZEqX0eebO9UbuAg==
X-Google-Smtp-Source: ABdhPJzIvvEMjIP/hh218sspQf7V0ep9uHZnLxmS0/zXxCMUJE2GejzApTBKIzS2W7ykhYnyWrTqcQ==
X-Received: by 2002:a17:902:c00b:b029:129:c3:aeb7 with SMTP id
 v11-20020a170902c00bb029012900c3aeb7mr7305352plx.39.1625389505903; 
 Sun, 04 Jul 2021 02:05:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 02:05:05 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: [RFC PATCH 09/17] drm: bridge: samsung-dsim: Add module init, exit
Date: Sun,  4 Jul 2021 14:32:22 +0530
Message-Id: <20210704090230.26489-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
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

Add module init and exit functions for the bridge to
register and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver
separately in the common of it's exynos_drm_drv.c including
dsi_driver. Register again would return -EBUSY, so return 0
for such cases as dsi_driver is already registered.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eed6b3ffdea7..627580abd6df 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1878,6 +1878,28 @@ struct platform_driver dsi_driver = {
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
 MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
-- 
2.25.1

