Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 366882A7E22
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C316EB62;
	Thu,  5 Nov 2020 12:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768D26EB62
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:05:41 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5Yq4057152;
 Thu, 5 Nov 2020 06:05:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577934;
 bh=CYXj6N4VfE/jqMWwZRQevQvQaG/2qw7tiOL60jXZZPE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=r2hZ5eUckjoanSggGeDAMwU7kN+XE2O0MAUdQt1H0RZjCAQNlqTqG4ZT2L7Ui2bF3
 uPBEgwZeijH+dng4Sw+uNHw+ZhcufGXA+6DwnVrm/F7Ub5KfpvWIKC2kgAyPrNxG+s
 tpfXXRwjXTHn+8FkwdJVoG6/u9TmZ6ZQ5LMz1KjI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5YYV043854
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:05:34 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:33 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:33 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfc039111;
 Thu, 5 Nov 2020 06:05:31 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 40/56] drm/panel: Move OMAP's DSI command mode panel driver
Date: Thu, 5 Nov 2020 14:03:17 +0200
Message-ID: <20201105120333.947408-41-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The panel driver is no longer using any OMAP specific APIs, so
let's move it into the generic panel directory.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/omapdrm/Kconfig                        |  1 -
 drivers/gpu/drm/omapdrm/Makefile                       |  1 -
 drivers/gpu/drm/omapdrm/displays/Kconfig               | 10 ----------
 drivers/gpu/drm/omapdrm/displays/Makefile              |  2 --
 drivers/gpu/drm/panel/Kconfig                          |  9 +++++++++
 drivers/gpu/drm/panel/Makefile                         |  1 +
 .../gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c |  0
 7 files changed, 10 insertions(+), 14 deletions(-)
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Kconfig
 delete mode 100644 drivers/gpu/drm/omapdrm/displays/Makefile
 rename drivers/gpu/drm/{omapdrm/displays => panel}/panel-dsi-cm.c (100%)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 5417e7a47072..cea3f44ea6d4 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -12,6 +12,5 @@ config DRM_OMAP
 if DRM_OMAP
 
 source "drivers/gpu/drm/omapdrm/dss/Kconfig"
-source "drivers/gpu/drm/omapdrm/displays/Kconfig"
 
 endif
diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index f115253115c5..66a73eae6f7c 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -5,7 +5,6 @@
 #
 
 obj-y += dss/
-obj-y += displays/
 
 omapdrm-y := omap_drv.o \
 	omap_irq.o \
diff --git a/drivers/gpu/drm/omapdrm/displays/Kconfig b/drivers/gpu/drm/omapdrm/displays/Kconfig
deleted file mode 100644
index f2be594c7eff..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/Kconfig
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-menu "OMAPDRM External Display Device Drivers"
-
-config DRM_OMAP_PANEL_DSI_CM
-	tristate "Generic DSI Command Mode Panel"
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Driver for generic DSI command mode panels.
-
-endmenu
diff --git a/drivers/gpu/drm/omapdrm/displays/Makefile b/drivers/gpu/drm/omapdrm/displays/Makefile
deleted file mode 100644
index 488ddf153613..000000000000
--- a/drivers/gpu/drm/omapdrm/displays/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_DRM_OMAP_PANEL_DSI_CM) += panel-dsi-cm.o
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index b9dbedf8f15e..a71f95afc52e 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -48,6 +48,15 @@ config DRM_PANEL_BOE_TV101WUM_NL6
 	  Say Y here if you want to support for BOE TV101WUM and AUO KD101N80
 	  45NA WUXGA PANEL DSI Video Mode panel
 
+config DRM_PANEL_DSI_CM
+	tristate "Generic DSI command mode panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  DRM panel driver for DSI command mode panels with support for
+	  embedded and external backlights.
+
 config DRM_PANEL_LVDS
 	tristate "Generic LVDS panel driver"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 2ba560bca61d..c553e968e9a9 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_PANEL_ARM_VERSATILE) += panel-arm-versatile.o
 obj-$(CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596) += panel-asus-z00t-tm5p5-n35596.o
 obj-$(CONFIG_DRM_PANEL_BOE_HIMAX8279D) += panel-boe-himax8279d.o
 obj-$(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6) += panel-boe-tv101wum-nl6.o
+obj-$(CONFIG_DRM_PANEL_DSI_CM) += panel-dsi-cm.o
 obj-$(CONFIG_DRM_PANEL_LVDS) += panel-lvds.o
 obj-$(CONFIG_DRM_PANEL_SIMPLE) += panel-simple.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
similarity index 100%
rename from drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
rename to drivers/gpu/drm/panel/panel-dsi-cm.c
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
