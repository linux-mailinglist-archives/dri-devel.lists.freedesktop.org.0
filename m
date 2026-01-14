Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3C8D20224
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6161E10E60D;
	Wed, 14 Jan 2026 16:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="b7eVyAkJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C778410E60B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 16:16:43 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b8719aeebc8so1281466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768407402; x=1769012202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9P8XyPfmO3JL3TpROOksSgUfSe+eAXc0UiVJRfYjjFs=;
 b=b7eVyAkJz07dy/mHsJo5z2ZXco253tyGTLWH6ABuw/NGptVQEeqC/EKtVx2B0ABJdb
 XOT/d70cW9IRqo/5DgBT7ASVqyAZ2JMLU3dj+xxAyJxuo7FyXzHEhgi+O7GJvGgjvVQ0
 rpIjJX2hV5wkuUUXHx9u0+zSnWOiAJsfxuxAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768407402; x=1769012202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9P8XyPfmO3JL3TpROOksSgUfSe+eAXc0UiVJRfYjjFs=;
 b=awYpLfNrtdis+sdZHyKj5mhxvW1K7kcqbB61U75uXON+GppJEUmkWIzODRha3S1HMi
 z0NjbrCzmKHzxCG/TkeiUeoT8gjDhnP+BWwEMMVhq+UVkwKQ2fr3zhioluCeg+16HUYX
 ilny1KVGDrl4KBZ3GrCgVhX09OdLCFNIl0tLnjehZ8FJqxLu0azno76JoLSuCiiqHgQf
 hUAcqQ6ZHNxUxcFz/XgwqPZDJfLNosvaAJjrZDpcGwL4MssWfGB/e+QWAOqsax0779LY
 VAvN+0rH7+pGkOFEA4cmf5sox6xRangndWeMpAukYxYECvIev79U4rS7+3HKrr26/Mk3
 0osA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqsipw1wqvErkGg7Fz+SLYYpK8xY42vS7ymiPziQFjpwbFsgH5NCqEwmVlO8cx1W7yyB4Zqpn5Q+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/6doTRoDqd4TAT+VQJGOwkgN9uUMskHRF9dd7Wy1vcPUhstyq
 ZGQmh2QkFPoJ+VCa6KtbUVIbKjdo1vJ0kixSKW2P13CKNSjX34gUF03Nub//5m4I2b4=
X-Gm-Gg: AY/fxX5DK1zpt7z2xQk5lvMOdRUfyaH9TbaKpHAvy6pj4bFW/7g0vMXA5a0bfRqVHVW
 iG/u+bujdK/rc2xnhSWSdc9jdl7kzgs0wywqc3Ce6uWxoq5Hfko3+1Vd2aIbme1Gs/efGofGRQS
 oAbxjFxiAHAxQGgfChvzfLg84PTqhSPgPLDC8/1TUEBWdqoXnrsCeuTElk4LhNc4hohd9aiMfFz
 tHjBeoj/P7JR7kAv/bgt6IYQ+IEJIgy4aFnFBzBlOMIachyDoteOsFiPWM+2Vp12Kf/JrcfZYdQ
 JGecInY1Nd+mKP1sLUa9+FfmRy/W+68qTozxQ8UhO/Og7VrttNDHgUDqgaVTHbL6kY5ePZ+17jP
 PDW89YgAZFay/4p+yDrJ0ZtrpKnR+RoDOqwSkchr1QTwcrZbNRy8shmT7ngpUrOp/PuyTIuzjzn
 /tiECWdjgaZ/MOB62RGQZmPW4ndisxQ+pqnwpbJMkPtEyHso6FeCW0uE181TKW7XJsWxedaVa/f
 2X9pxcm3IACNHbXq0+uFIXQiuzbAO7/OlICqiIPwDE1pb6O9YKQQIzG0deX/lqj95Obdg==
X-Received: by 2002:a17:907:868a:b0:b7c:e320:5232 with SMTP id
 a640c23a62f3a-b8767670af7mr186507866b.5.1768407402207; 
 Wed, 14 Jan 2026 08:16:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876dd0e9ffsm152281566b.37.2026.01.14.08.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:16:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/panel: ilitek-ili9806e: rename to specific DSI
 driver
Date: Wed, 14 Jan 2026 17:16:16 +0100
Message-ID: <20260114161636.1076706-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
References: <20260114161636.1076706-1-dario.binacchi@amarulasolutions.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Ilitek ILI9806E controller can support different transport buses,
such as MIPI-DSI and SPI. The current implementation is specific to
the MIPI-DSI interface.

In preparation for adding SPI support, rename the current Kconfig
symbol and files to be DSI-specific, clarifying the current scope
of the code.

Since DRM_PANEL_ILITEK_ILI9806E is not used in any in-tree defconfig,
the symbol is renamed directly to DRM_PANEL_ILITEK_ILI9806E_DSI without
providing a legacy compatibility alias.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 MAINTAINERS                                                 | 2 +-
 drivers/gpu/drm/panel/Kconfig                               | 6 +++---
 drivers/gpu/drm/panel/Makefile                              | 2 +-
 ...{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..317e76cc99e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7913,7 +7913,7 @@ F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
 DRM DRIVER FOR ILITEK ILI9806E PANELS
 M:	Michael Walle <mwalle@kernel.org>
 S:	Maintained
-F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
 
 DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
 M:	Jagan Teki <jagan@edgeble.ai>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca..692cd474910d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -257,14 +257,14 @@ config DRM_PANEL_ILITEK_ILI9805
 	  Say Y if you want to enable support for panels based on the
 	  Ilitek ILI9805 controller.
 
-config DRM_PANEL_ILITEK_ILI9806E
-	tristate "Ilitek ILI9806E-based panels"
+config DRM_PANEL_ILITEK_ILI9806E_DSI
+	tristate "Ilitek ILI9806E-based DSI panels"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y if you want to enable support for panels based on the
-	  Ilitek ILI9806E controller.
+	  Ilitek ILI9806E controller using DSI.
 
 config DRM_PANEL_ILITEK_ILI9881C
 	tristate "Ilitek ILI9881C-based panels"
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb3..00071a983242 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) += panel-hydis-hv101hd1.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
-obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E) += panel-ilitek-ili9806e.o
+obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E_DSI) += panel-ilitek-ili9806e-dsi.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
 obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
 obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
similarity index 99%
rename from drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
rename to drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
index 18aa6222b0c5..c337c4f1a1c7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c
@@ -561,5 +561,5 @@ module_mipi_dsi_driver(ili9806e_dsi_driver);
 
 MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
 MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
-MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
+MODULE_DESCRIPTION("Ilitek ILI9806E Controller DSI Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

