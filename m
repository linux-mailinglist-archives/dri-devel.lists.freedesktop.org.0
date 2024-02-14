Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87F855552
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7510A10E7E1;
	Wed, 14 Feb 2024 21:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ouyV/O8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE1710E4FA;
 Wed, 14 Feb 2024 21:58:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9aFXuvdgPcKqGP7zOaydflMz0GMKJe6VCyUGSkHMLJvD6aYu3CZE+KOblaXCTsD0iMZ3Zm0ZQm9i/Sszu8o/ocnqVmddc9Ut35HQBE1NcrSeuaLeVAT4vdI+V9L2q1uuWYBseh263mcFr5P4cktyB08ISWw5JYc7LRhSpRbzKPG++JoleMvqhHu0AIWHTOf/r1a3vBaXLV8YCKb5vlGHZr69aUfgSLmBUKHXT9LTNcRedMPIUQAUvJk6MFxcDME1aaY2WARJdH5m+I4OLSjIVFeu/I2XEKc3BYvzoXIgQGDjcgthWHYogqKtS83qoJ0ePhoKcDBB9KfwhziMIKflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Nf6NEKHjTlcMhR2gou0updJKUTJqZjmkgBaC/j+dHQ=;
 b=e5sGrkl57H6ys8JR8uxJ1PwG9ab85g1ybOyssqMpVjpV8xot8gzw2BZCYZpAJfl8LDNixNl/SV0Cj89ICIw2+H5fTk/2AflMahDZCfNGq7WcVsQYBlSRAHxeaL1seft45hz+9Ux7dNwZCxXkdmVjoEja3mviO2z7k0Nz343uNMMM5XN91r5iuw5Bzr/e4cAzkPNVvBU8oSNEp6+n96PR4fYVPhsFyXpCs4IexnrepFqqVqKu897O23R1GBKzAd4bGs5lYtO/6UyBskuhTRkOzNfZCokRJY+UpTueNp7//ZFQfit/862iQqAhjsMRehaTjmqhNnJphDUqxH7FJ78Rkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nf6NEKHjTlcMhR2gou0updJKUTJqZjmkgBaC/j+dHQ=;
 b=ouyV/O8bdenEm6K4MDKJwYy43MloPQHOwpMq+ZtSDMiCZWRSOTmsP6x2scHxsWLEteYi0OL4NkW2yJwRJe5Y6sjrVzOTb4i/wxmuFB9Whn/vbquXudNMlMdCI7MGFGjgZKE5ukS3KvT0vHh+fz5LDJfdpJhCYdNkDwHOfD8MA4k=
Received: from BL1PR13CA0030.namprd13.prod.outlook.com (2603:10b6:208:256::35)
 by DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 21:58:28 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::b9) by BL1PR13CA0030.outlook.office365.com
 (2603:10b6:208:256::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:28 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:27 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 2/5] drm: Stop using `select BACKLIGHT_CLASS_DEVICE`
Date: Wed, 14 Feb 2024 15:57:53 -0600
Message-ID: <20240214215756.6530-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: b92a513a-7573-4d6e-29a3-08dc2da81396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EG1qysjp0s2MPR4XTPqom6A0tMvP7peLrRAdp1CxhNfjVtzscK/+hiYPzNKmhg6SyTTXI6tvMmxb2M564Gy9CdagJ6eN1fwgSP3RJGBe6SbtzpO/p3vaZ0I99TTsPtLQjQtz5O3MNWWKGOL9bo8Ob1sPfD+QpZyfScWeohtsd0NFCndx47C8vtrWLdMvzGA0IHLOOFL0xYSQ/J6X90JNjcLE584JXP1X7+tjWAlhLYr+e4n0IP9yRjJKN+2arjVcqkVXN2qAImqjVSm5uwcNHYuniUpEJkalmuq1DaSad1ofvhXo9MeR4d5uPGah6e+Lb5LNvx6Y2ZEXwTxE1ly9kVNXl3ENAVJrNTwWFLNy0cdEFaleDonavqvco/Tsmf4AFJ3oV/9OUSpTVgfI6KDsRk7nnceD74sJAtlZ2fvXEkoVGF4fGVuhNFeMFZcaMCL2XviSZdsYUJgHUuG3KfMtddxF223dC0JXoARYDz5YAnd9rp0O+TC6+6zAzep76IxuFc0HxIXXQ8OL5Oy9+FUqHGA1KFLcokOHQLy0gJRagQy3npNEJ8Ok2XJ8jKRVCNqf6ABzXzLxJJxwHtqT5fknWgPH3zGec9HAGn50g0BPqYZoJMx6tOTgyi2hV2vt887B3+QBL44ZwQdjw7LWGghYgD32ddkFDYSiHTZBWGyR+Gk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39850400004)(230922051799003)(451199024)(36860700004)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(2906002)(82740400003)(44832011)(5660300002)(7416002)(81166007)(86362001)(7696005)(1076003)(356005)(83380400001)(316002)(6666004)(336012)(70206006)(16526019)(26005)(54906003)(36756003)(4326008)(426003)(8936002)(110136005)(8676002)(2616005)(70586007)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:28.5662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b92a513a-7573-4d6e-29a3-08dc2da81396
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352
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

Many drivers ab(use) `select BACKLIGHT_CLASS_DEVICE` to avoid
dependency problems.  This however makes it impossible for DRM
core to be able to add a dependency on ACPI_VIDEO. Switch users
of `select BACKLIGHT_CLASS_DEVICE` to `depends on BACKLIGHT_CLASS_DEVICE`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/bridge/Kconfig           |  2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig          |  2 +-
 drivers/gpu/drm/gud/Kconfig              |  2 +-
 drivers/gpu/drm/renesas/shmobile/Kconfig |  2 +-
 drivers/gpu/drm/solomon/Kconfig          |  2 +-
 drivers/gpu/drm/tilcdc/Kconfig           |  2 +-
 drivers/gpu/drm/tiny/Kconfig             | 14 +++++++-------
 drivers/platform/x86/Kconfig             |  4 ++--
 drivers/usb/misc/Kconfig                 |  2 +-
 9 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index efd996f6c138..c4e0d506a389 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -218,9 +218,9 @@ config DRM_NXP_PTN3460
 config DRM_PARADE_PS8622
 	tristate "Parade eDP/LVDS bridge"
 	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_PANEL
 	select DRM_KMS_HELPER
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  Parade eDP-LVDS bridge chip driver.
 
diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 5ca71ef87325..93202786bec5 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -2,7 +2,7 @@
 config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
 	depends on DRM && OF && ARM && COMMON_CLK
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/gud/Kconfig b/drivers/gpu/drm/gud/Kconfig
index 9c1e61f9eec3..44553514ad64 100644
--- a/drivers/gpu/drm/gud/Kconfig
+++ b/drivers/gpu/drm/gud/Kconfig
@@ -3,10 +3,10 @@
 config DRM_GUD
 	tristate "GUD USB Display"
 	depends on DRM && USB && MMU
+	depends on BACKLIGHT_CLASS_DEVICE
 	select LZ4_COMPRESS
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  This is a DRM display driver for GUD USB Displays or display
 	  adapters.
diff --git a/drivers/gpu/drm/renesas/shmobile/Kconfig b/drivers/gpu/drm/renesas/shmobile/Kconfig
index 027220b8fe1c..6b36dee443eb 100644
--- a/drivers/gpu/drm/renesas/shmobile/Kconfig
+++ b/drivers/gpu/drm/renesas/shmobile/Kconfig
@@ -3,7 +3,7 @@ config DRM_SHMOBILE
 	tristate "DRM Support for SH Mobile"
 	depends on DRM && PM
 	depends on ARCH_RENESAS || ARCH_SHMOBILE || COMPILE_TEST
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/solomon/Kconfig b/drivers/gpu/drm/solomon/Kconfig
index c3ee956c2bb9..2b36ac8e0913 100644
--- a/drivers/gpu/drm/solomon/Kconfig
+++ b/drivers/gpu/drm/solomon/Kconfig
@@ -1,7 +1,7 @@
 config DRM_SSD130X
 	tristate "DRM support for Solomon SSD13xx OLED displays"
 	depends on DRM && MMU
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index d3bd2d7a181e..640adf075bba 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -2,12 +2,12 @@
 config DRM_TILCDC
 	tristate "DRM Support for TI LCDC Display Controller"
 	depends on DRM && OF && ARM
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select VIDEOMODE_HELPERS
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  Choose this option if you have an TI SoC with LCDC display
 	  controller, for example AM33xx in beagle-bone, DA8xx, or
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..d5160a6b5d72 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -67,10 +67,10 @@ config DRM_OFDRM
 config DRM_PANEL_MIPI_DBI
 	tristate "DRM support for MIPI DBI compatible panels"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 	help
 	  Say Y here if you want to enable support for MIPI DBI compatible
@@ -99,10 +99,10 @@ config DRM_SIMPLEDRM
 config TINYDRM_HX8357D
 	tristate "DRM support for HX8357D display panels"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  DRM driver for the following HX8357D panels:
 	  * YX350HV15-T 3.5" 340x350 TFT (Adafruit 3.5")
@@ -112,7 +112,7 @@ config TINYDRM_HX8357D
 config TINYDRM_ILI9163
 	tristate "DRM support for ILI9163 display panels"
 	depends on DRM && SPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DBI
@@ -137,10 +137,10 @@ config TINYDRM_ILI9225
 config TINYDRM_ILI9341
 	tristate "DRM support for ILI9341 display panels"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  DRM driver for the following Ilitek ILI9341 panels:
 	  * YX240QV29-T 2.4" 240x320 TFT (Adafruit 2.4")
@@ -150,10 +150,10 @@ config TINYDRM_ILI9341
 config TINYDRM_ILI9486
 	tristate "DRM support for ILI9486 display panels"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  DRM driver for the following Ilitek ILI9486 panels:
 	  * PISCREEN 3.5" 320x480 TFT (Ozzmaker 3.5")
@@ -164,10 +164,10 @@ config TINYDRM_ILI9486
 config TINYDRM_MI0283QT
 	tristate "DRM support for MI0283QT"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  DRM driver for the Multi-Inno MI0283QT display panel
 	  If M is selected the module will be called mi0283qt.
@@ -201,10 +201,10 @@ config TINYDRM_ST7586
 config TINYDRM_ST7735R
 	tristate "DRM support for Sitronix ST7715R/ST7735R display panels"
 	depends on DRM && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_MIPI_DBI
-	select BACKLIGHT_CLASS_DEVICE
 	help
 	  DRM driver for Sitronix ST7715R/ST7735R with one of the following
 	  LCDs:
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index bdd302274b9a..509bcf6ac88b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -753,7 +753,7 @@ config SAMSUNG_LAPTOP
 config SAMSUNG_Q10
 	tristate "Samsung Q10 Extras"
 	depends on ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  This driver provides support for backlight control on Samsung Q10
 	  and related laptops, including Dell Latitude X200.
@@ -852,7 +852,7 @@ config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on ACPI && INPUT
 	depends on RFKILL || RFKILL=n
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Support for Intel Classmate PC ACPI devices, including some
 	  keys as input device, backlight device, tablet and accelerometer
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index c510af7baa0d..2251ddabbfb8 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -139,7 +139,7 @@ config USB_IDMOUSE
 
 config USB_APPLEDISPLAY
 	tristate "Apple Cinema Display support"
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to control the backlight of Apple Cinema
 	  Displays over USB. This driver provides a sysfs interface.
-- 
2.34.1

