Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C32A5686D1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 13:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EDE113FC5;
	Wed,  6 Jul 2022 11:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4089113FBF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 11:41:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 266Bf6uY096717;
 Wed, 6 Jul 2022 06:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1657107666;
 bh=3vNcCgtYK6oeAlB1FRtuqMNsWqaSnPkxEW05tBN2XiM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=e1Ce6EJoTqhYFltjnGGNfDMv8WRJxBHvwBRGCbxr3SalBxvkzFhpCJHRjQFuibuw5
 SDz5o9wAet+SmZ8iTcfItqs/CNOM161Izjh5BXbIle4qs2ELvWIS/WEsBDOtRZAEic
 ktrWd+oc2MuyhjsPKSDTPJk8kxALxe8On6BASBZ4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 266Bf5WY008260
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Jul 2022 06:41:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Jul 2022 06:41:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Jul 2022 06:41:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 266Bf4g2115524;
 Wed, 6 Jul 2022 06:41:05 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 3/5] drm/bridge: cdns-dsi: Move to drm/bridge/cadence
Date: Wed, 6 Jul 2022 17:10:51 +0530
Message-ID: <20220706114053.3454-4-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706114053.3454-1-r-ravikumar@ti.com>
References: <20220706114053.3454-1-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the cadence dsi bridge under drm/bridge/cadence
directory, to prepare for adding j721e wrapper
support

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 drivers/gpu/drm/bridge/Kconfig                        | 11 -----------
 drivers/gpu/drm/bridge/Makefile                       |  1 -
 drivers/gpu/drm/bridge/cadence/Kconfig                | 11 +++++++++++
 drivers/gpu/drm/bridge/cadence/Makefile               |  2 ++
 .../bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c}    |  0
 5 files changed, 13 insertions(+), 12 deletions(-)
 rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (100%)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 57946d80b02d..8b2226f72b24 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -15,17 +15,6 @@ config DRM_PANEL_BRIDGE
 menu "Display Interface Bridges"
 	depends on DRM && DRM_BRIDGE
 
-config DRM_CDNS_DSI
-	tristate "Cadence DPI/DSI bridge"
-	select DRM_KMS_HELPER
-	select DRM_MIPI_DSI
-	select DRM_PANEL_BRIDGE
-	select GENERIC_PHY_MIPI_DPHY
-	depends on OF
-	help
-	  Support Cadence DPI to DSI bridge. This is an internal
-	  bridge and is meant to be directly embedded in a SoC.
-
 config DRM_CHIPONE_ICN6211
 	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 1884803c6860..52f6e8b4a821 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
 obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 1d06182bea71..8fbb46c66094 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -25,3 +25,14 @@ config DRM_CDNS_MHDP8546_J721E
 	  initializes the J721E Display Port and sets up the
 	  clock and data muxes.
 endif
+
+config DRM_CDNS_DSI
+	tristate "Cadence DPI/DSI bridge"
+	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY_MIPI_DPHY
+	depends on OF
+	help
+	  Support Cadence DPI to DSI bridge. This is an internal
+	  bridge and is meant to be directly embedded in a SoC.
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index 4d2db8df1bc6..e3d8e9a40784 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,3 +2,5 @@
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
+obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
+cdns-dsi-y := cdns-dsi-core.o
diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
similarity index 100%
rename from drivers/gpu/drm/bridge/cdns-dsi.c
rename to drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
-- 
2.36.1

