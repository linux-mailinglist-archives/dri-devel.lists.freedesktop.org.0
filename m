Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43862907923
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD610EB27;
	Thu, 13 Jun 2024 17:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="crkBG3Ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B8010EB0B;
 Thu, 13 Jun 2024 17:00:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX80SwEPXkhyDf4Yie5iplXZh6aIH9oBn5Z5Ja+4Nz4iyQ9SUvPgQ2qWXQ7+zhOjBu7S9+WXb/7X8ZKR3gtR/Zf+lxpxoh8y5zVHJ6bM/3c3PgGrnr9fbynW2fWc4KaIgzIgy2eW+ktlDWmiKOV5xeX+k5gOM1kS9RkTPcYYI0NLU3N/cNMXlUU0o5nJDVZl2p0HLH+pJdR8HBiR8YtgKNmFJJOCAEAeEa8zXddl1sBxKxLMwHjLQoZplAKENMJPzGxvGKrjXZHkzUH0qgVhSSzm+u/BONGibPTLLSoJtQvSEB7AjJkozeNvrPJ4dRX00ia6guw7DHzRO5p5bN0s3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXTvaBvIagHsZoBUhTb6+KSJ2C5holbF/iaIy7qJTxY=;
 b=g9GcFTWdE2V8lOIsObzB07tgJ3VJWleYeU+SNhIleNgSxlZUUgmyMmvTcz/4+0dBi8I0B3htzrjkpyUKMNUWSehxhySTYvqnLBdq5U0iaRcKjBRAcP3+o/To5dGkj6pFUMSgTZx19ZuBuI93GeJEnCuq1cUJRPJtDL20UpKC3Nw1Hwx0xGlH2ic+DhLHuh6jFEomqInSRww2KZpwTf2iQoecs8mwFgHFDgntmwomQgkg2Q28e0Slrn4jZQLNZZcjsXjKOqT3uEublhY/sUOshKVzsqchOEWX/mNNM2dieFDTPguZP3qNffKKulvHJyRCmqgioEDaa9xqNCDXBRw+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXTvaBvIagHsZoBUhTb6+KSJ2C5holbF/iaIy7qJTxY=;
 b=crkBG3EydmZ7gIaQkz7toQMPjhhKynX+8USCCfa6CTPgFM5MtyYjSP/PhG15V6wZoL+iVkkr8nom3EVCEZHusPV1D+sCgK5b3U6oE8pFDx1Xsfm2bTKY2ukoBkvyMvx/JlWlrqUPw9vqvZCOAs+53DbmMf8YaCd9oYgcpxHNm+Wo22AWEulfF5xFE/wsCfXpf00xC/pazALw1luK23xFAB4/nSxfIGGJjvbgV1/N6IWQ3Vx0yddTl3ZeyCD00xkGVKhzpUWEokn/k5WQq8UNflUhdX9UalOenG5DzoIjx7XWPYGLm52y2gDkmnIl1pDfooTB8ncHij+rPV8GMktO4w==
Received: from SA9PR10CA0013.namprd10.prod.outlook.com (2603:10b6:806:a7::18)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:00:29 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::31) by SA9PR10CA0013.outlook.office365.com
 (2603:10b6:806:a7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:06 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 20/21] drm/nouveau: probe() against nvkm-provided auxiliary
 devices
Date: Fri, 14 Jun 2024 03:00:12 +1000
Message-ID: <20240613170046.88687-21-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e4da70-e749-432f-76a9-08dc8bca5346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XIdh0LXtGbWqlJgXTInYRFpENILGAMShUcMOgCQmq+3CQ+utlkm9COd9Zhu6?=
 =?us-ascii?Q?E1AIZWIVFlAPg0pQRADSZ/x1wVVDR6JRXl+bC17h+6ZD4CCMOV86EI2nQ3ad?=
 =?us-ascii?Q?eN2MGDKNNpc+Bu8kwPuPNRVq3LfmKdHqNxl/CoKKa7+XrvgFnHLFSTRgf/Ra?=
 =?us-ascii?Q?7AsioDi64CjEW84Jo/fl5f7FXSPqpxv9Iq0WmumqgVePhgR77bqAzu3wUc1S?=
 =?us-ascii?Q?/QATaV8FiVTASzewGP+0RinRt7jiqAsk6WlsxIVjPUF/cwjRx0++n7W6llPu?=
 =?us-ascii?Q?ArNIS5/IF6qFaNmJje19sw5gs+cww1y/ieAZlVJXDBIUHn+2uGpiycHoXkjT?=
 =?us-ascii?Q?0qENK1fv5a5fFqdpp6UTUu+rGw33iSIPqDzrNQ4KFxxPVATxmcKzvm9vsKZW?=
 =?us-ascii?Q?MgWy+1aJ6o0rDyA5UWkqqEL7P/ybRBS9qLf1qJM+Bl/gwP25Ag8DAXQgIdia?=
 =?us-ascii?Q?xVnlvLPp8L3iJSMKmwuPJO/GhEVFwngsne8PIFFWTZBgGIFeYd26G4rxbK09?=
 =?us-ascii?Q?+DVaqp6JYFsye8gTyZlgECa+jEOLOYq0lTE7NA1kTnUFvvtM8u8PdcDy1v9k?=
 =?us-ascii?Q?XmA4nCtT3HOFlkg3itwCGfPNaZWXjrQk3SoS0/C1FkipaYYY2/sFv0LZawWs?=
 =?us-ascii?Q?DMMf+DuZvjiL1VuX4kjhBGX49O6A7Ide8/FMcwaXCkLQ3xa6oBql3A8+vrgx?=
 =?us-ascii?Q?zLV2euEKyQPxySFupn/xcRtxPhchpkPBfJbRhnhJR+c/p4nJVfH8kwkCdJdJ?=
 =?us-ascii?Q?Byc3B5fOZG0VfaKaRv2XAozpkGvzNdhzzQkr4O9YKLF4IujZfyxKa3C0lMA5?=
 =?us-ascii?Q?wJPQpA1TfiP1xWs2xGTnTnazCck8UjhkXhtAmAneLUrXMICWBF7oPeJ+sZ3V?=
 =?us-ascii?Q?Vs0ZOOfWUvJczhieWrAFENFJchOKcXobIJ5W77BtSLACKDGfcnoz3a+vgGMg?=
 =?us-ascii?Q?ZFErpj8wLJGcn8Uge8sI1HFICj6nwIYOS1YTd6OulT87KNXDrdsvYWeVQZ7h?=
 =?us-ascii?Q?YaSlTcEXei+ARwe9Sf/iPdm8JLCIKQ3Rdv+3ZPOIzu6KJJWKYXL+LYacqTAl?=
 =?us-ascii?Q?m5hYL/lwKW4yD/YO2EuLHqCSNfERjjpHAWzh1QlKdsIhWcqn/V+4gwX9Pirz?=
 =?us-ascii?Q?IaQNIDi4CjdZmc+hO1kJ2N6YWmuG1PrzWAleJPiPS+CS60KsSnC6MmvO7HJq?=
 =?us-ascii?Q?gKxJ4SAy5vnUW0yC0/vacNzJm0jrx2/RUd0PdyKnQliPYV5y7bT9+Uj5/K+C?=
 =?us-ascii?Q?EkVS8BPrPJ0gq41eakkXLS2CxgPfrz3yrUAXdk+Ziym2uyvQckCXdEn+xoAH?=
 =?us-ascii?Q?sN9k2qG5Uq8c1kas/PCgZ2bLlyL+Ji2vcKclfUbBHBRUMAUo2jmlLPuUIchC?=
 =?us-ascii?Q?qW8fy5lCIKDqtP+pXgpIWgjBeDLCr2SvWbMCBHeWJiEa6gd+7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:27.5143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e4da70-e749-432f-76a9-08dc8bca5346
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439
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

Previously, the DRM driver was the entry-point for the pci/platform
bus probe() functions, and calls into NVKM to create an nvkm_device
from pci/platform devices, then continues on with DRM init.

Most of the code handling PCI/Tegra-specific functions has now been
moved to NVKM (though prior to this commit, still *called* from DRM)
and NVKM registers devices named "nvkm.device.<n>" on the auxiliary
bus for each PCI or Tegra GPU in the system.

The final step is to move pci/platform driver registration to NVKM,
and have the DRM driver register as an auxiliary driver, from where
it can gain access to the nvkm_device and proceed as it did before.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild                |   1 -
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   9 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 178 ++++--------------
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  17 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  93 ---------
 drivers/gpu/drm/nouveau/nouveau_platform.h    |  27 ---
 drivers/gpu/drm/nouveau/nouveau_runpm.h       |   2 +-
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c    |   9 +-
 drivers/gpu/drm/nouveau/nvkm/device/pci.c     |  42 ++++-
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c   |  43 ++++-
 drivers/gpu/drm/nouveau/nvkm/module.c         |  24 +++
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    |   4 +-
 13 files changed, 155 insertions(+), 296 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.c
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_platform.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 61eeef83847a..cc471ab6a7ec 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -23,7 +23,6 @@ nouveau-y += nouveau_drm.o
 nouveau-y += nouveau_hwmon.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
-nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
 nouveau-y += nouveau_vga.o
 
 # DRM - memory management
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c0fc5233ebd4..60affaedb933 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -353,7 +353,8 @@ static int
 nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 			     bool *enabled, unsigned char *buf, int max_bytes)
 {
-	struct nouveau_drm *drm = dev_get_drvdata(kdev);
+	struct nvkm_device *device = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = container_of(device->driver, typeof(*drm), driver);
 	struct drm_encoder *encoder;
 	struct nouveau_encoder *nv_encoder;
 	struct nouveau_crtc *nv_crtc;
@@ -398,7 +399,8 @@ static int
 nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 			  void *data)
 {
-	struct nouveau_drm *drm = dev_get_drvdata(kdev);
+	struct nvkm_device *device = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = container_of(device->driver, typeof(*drm), driver);
 	struct drm_audio_component *acomp = data;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
@@ -416,7 +418,8 @@ static void
 nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 			    void *data)
 {
-	struct nouveau_drm *drm = dev_get_drvdata(kdev);
+	struct nvkm_device *device = dev_get_drvdata(kdev);
+	struct nouveau_drm *drm = container_of(device->driver, typeof(*drm), driver);
 	struct drm_audio_component *acomp = data;
 
 	drm_modeset_lock_all(drm->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 57d31a17ad68..5ec320fdfaf8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -545,7 +545,7 @@ nouveau_display_acpi_ntfy(struct notifier_block *nb, unsigned long val,
 {
 	struct nouveau_drm *drm = container_of(nb, typeof(*drm), acpi_nb);
 	struct acpi_bus_event *info = data;
-	struct device *dev = drm->dev->dev;
+	struct device *dev = &drm->auxdev->dev;
 	int ret;
 
 	if (!strcmp(info->device_class, ACPI_VIDEO_CLASS)) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2a9faf0fc277..7e77e950eba2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -40,8 +40,6 @@
 #include <core/gpuobj.h>
 #include <core/module.h>
 #include <core/option.h>
-#include <core/pci.h>
-#include <core/tegra.h>
 
 #include <nvif/driver.h>
 #include <nvif/fifo.h>
@@ -65,7 +63,6 @@
 #include "nouveau_fence.h"
 #include "nouveau_debugfs.h"
 #include "nouveau_connector.h"
-#include "nouveau_platform.h"
 #include "nouveau_svm.h"
 #include "nouveau_dmem.h"
 #include "nouveau_exec.h"
@@ -111,8 +108,6 @@ static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
 static struct drm_driver driver_stub;
-static struct drm_driver driver_pci;
-static struct drm_driver driver_platform;
 
 static inline bool
 nouveau_cli_work_ready(struct dma_fence *fence)
@@ -530,6 +525,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 static int
 nouveau_drm_device_init(struct nouveau_drm *drm)
 {
+	struct nvkm_device *device = container_of(drm->auxdev, typeof(*device), auxdev);
 	struct drm_device *dev = drm->dev;
 	int ret;
 
@@ -623,7 +619,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 }
 
 static struct nouveau_drm *
-nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
+nouveau_drm_device_new(const struct drm_driver *drm_driver, struct auxiliary_device *parent,
 		       struct nvkm_device *device)
 {
 	const struct nvif_driver *driver;
@@ -636,7 +632,7 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
-	drm->nvkm = device;
+	drm->auxdev = parent;
 	drm->driver = nouveau_driver;
 	drm->driver.switcheroo = nouveau_switcheroo;
 
@@ -705,14 +701,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		goto done;
 	}
 
-	drm->dev = drm_dev_alloc(drm_driver, parent);
+	drm->dev = drm_dev_alloc(drm_driver, parent->dev.parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
 		goto done;
 	}
 
 	drm->dev->dev_private = drm;
-	dev_set_drvdata(parent, drm);
+	auxiliary_set_drvdata(parent, drm);
 
 done:
 	if (ret) {
@@ -723,68 +719,51 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	return ret ? ERR_PTR(ret) : drm;
 }
 
-static int nouveau_drm_probe(struct pci_dev *pdev,
-			     const struct pci_device_id *pent)
+static int
+nouveau_drm_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
 {
-	struct nvkm_device *device;
+	struct nvkm_device *device = container_of(auxdev, typeof(*device), auxdev);
 	struct nouveau_drm *drm;
 	int ret;
 
-	/* We need to check that the chipset is supported before booting
-	 * fbdev off the hardware, as there's no way to put it back.
-	 */
-	ret = nvkm_device_pci_driver.probe(pdev, NULL);
-	if (ret)
-		return ret;
-
-	device = pci_get_drvdata(pdev);
-
-	if (nouveau_atomic)
-		driver_pci.driver_features |= DRIVER_ATOMIC;
-
-	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
+	drm = nouveau_drm_device_new(&driver_stub, auxdev, device);
 	if (IS_ERR(drm)) {
 		ret = PTR_ERR(drm);
-		goto fail_nvkm;
+		return ret;
 	}
 
 	ret = nouveau_drm_device_init(drm);
 	if (ret)
 		goto fail_drm;
 
-	if (drm->device.impl->ram_size <= 32 * 1024 * 1024)
-		drm_fbdev_ttm_setup(drm->dev, 8);
-	else
-		drm_fbdev_ttm_setup(drm->dev, 32);
+	if (drm->device.impl->disp.oclass) {
+		if (drm->device.impl->ram_size <= 32 * 1024 * 1024)
+			drm_fbdev_ttm_setup(drm->dev, 8);
+		else
+			drm_fbdev_ttm_setup(drm->dev, 32);
+
+		if (nouveau_atomic)
+			drm->dev->driver_features |= DRIVER_ATOMIC;
+	}
 
 	return 0;
 
 fail_drm:
 	nouveau_drm_device_del(drm);
-fail_nvkm:
-	nvkm_device_del(&device);
 	return ret;
 }
 
-void
-nouveau_drm_device_remove(struct nouveau_drm *drm)
+static void
+nouveau_drm_remove(struct auxiliary_device *auxdev)
 {
+	struct nouveau_drm *drm = auxiliary_get_drvdata(auxdev);
+
 	drm_dev_unplug(drm->dev);
 
 	nouveau_drm_device_fini(drm);
 	nouveau_drm_device_del(drm);
 }
 
-static void
-nouveau_drm_remove(struct pci_dev *pdev)
-{
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-
-	nouveau_drm_device_remove(drm);
-
-	nvkm_device_pci_driver.remove(pdev);
-}
-
 static int
 nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
 {
@@ -881,36 +860,25 @@ nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
 int
 nouveau_pmops_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	int ret;
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
 
 	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
 	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return 0;
 
-	ret = nouveau_do_suspend(drm, false);
-	if (ret)
-		return ret;
-
-	return nvkm_device_pci_driver.driver.pm->suspend(dev);
+	return nouveau_do_suspend(drm, false);
 }
 
 int
 nouveau_pmops_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
 	int ret;
 
 	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
 	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return 0;
 
-	ret = nvkm_device_pci_driver.driver.pm->resume(dev);
-	if (ret)
-		return ret;
-
 	ret = nouveau_do_resume(drm, false);
 
 	/* Monitors may have been connected / disconnected during suspend */
@@ -949,8 +917,7 @@ nouveau_pmops_runtime(struct device *dev)
 static int
 nouveau_pmops_runtime_suspend(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
 	int ret;
 
 	if (!nouveau_pmops_runtime(dev)) {
@@ -959,7 +926,6 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 	}
 
 	ret = nouveau_do_suspend(drm, true);
-	ret = nvkm_device_pci_driver.driver.pm->runtime_suspend(dev);
 	drm->dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
 	return ret;
 }
@@ -967,8 +933,7 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 static int
 nouveau_pmops_runtime_resume(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
 	int ret;
 
 	if (!nouveau_pmops_runtime(dev)) {
@@ -976,10 +941,6 @@ nouveau_pmops_runtime_resume(struct device *dev)
 		return -EBUSY;
 	}
 
-	ret = nvkm_device_pci_driver.driver.pm->runtime_resume(dev);
-	if (ret)
-		return ret;
-
 	ret = nouveau_do_resume(drm, true);
 	if (ret) {
 		NV_ERROR(drm, "resume failed with: %d\n", ret);
@@ -1183,21 +1144,6 @@ driver_stub = {
 	.patchlevel = DRIVER_PATCHLEVEL,
 };
 
-static struct pci_device_id
-nouveau_drm_pci_table[] = {
-	{
-		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID),
-		.class = PCI_BASE_CLASS_DISPLAY << 16,
-		.class_mask  = 0xff << 16,
-	},
-	{
-		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA_SGS, PCI_ANY_ID),
-		.class = PCI_BASE_CLASS_DISPLAY << 16,
-		.class_mask  = 0xff << 16,
-	},
-	{}
-};
-
 static void nouveau_display_options(void)
 {
 	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n");
@@ -1226,57 +1172,26 @@ static const struct dev_pm_ops nouveau_pm_ops = {
 	.runtime_idle = nouveau_pmops_runtime_idle,
 };
 
-static struct pci_driver
-nouveau_drm_pci_driver = {
+static const struct auxiliary_device_id
+nouveau_drm_id_table[] = {
+	{ .name = "nouveau.device" },
+	{}
+};
+
+static struct auxiliary_driver
+nouveau_auxdrv = {
 	.name = "nouveau",
-	.id_table = nouveau_drm_pci_table,
+	.id_table = nouveau_drm_id_table,
 	.probe = nouveau_drm_probe,
 	.remove = nouveau_drm_remove,
 	.driver.pm = &nouveau_pm_ops,
 };
 
-struct drm_device *
-nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
-			       struct platform_device *pdev,
-			       struct nvkm_device **pdevice)
-{
-	struct nouveau_drm *drm;
-	int err;
-
-	err = nvkm_device_tegra.probe(pdev);
-	if (err)
-		return ERR_PTR(err);
-
-	*pdevice = platform_get_drvdata(pdev);
-
-	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
-	if (IS_ERR(drm)) {
-		err = PTR_ERR(drm);
-		goto err_free;
-	}
-
-	err = nouveau_drm_device_init(drm);
-	if (err)
-		goto err_put;
-
-	return drm->dev;
-
-err_put:
-	nouveau_drm_device_del(drm);
-err_free:
-	nvkm_device_del(pdevice);
-
-	return ERR_PTR(err);
-}
-
 static int __init
 nouveau_drm_init(void)
 {
 	int ret;
 
-	driver_pci = driver_stub;
-	driver_platform = driver_stub;
-
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
@@ -1291,17 +1206,9 @@ nouveau_drm_init(void)
 	if (ret)
 		return ret;
 
-#ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
-	platform_driver_register(&nouveau_platform_driver);
-#endif
-
 	nouveau_backlight_ctor();
 
-#ifdef CONFIG_PCI
-	return pci_register_driver(&nouveau_drm_pci_driver);
-#else
-	return 0;
-#endif
+	return auxiliary_driver_register(&nouveau_auxdrv);
 }
 
 static void __exit
@@ -1310,14 +1217,10 @@ nouveau_drm_exit(void)
 	if (!nouveau_modeset)
 		return;
 
-#ifdef CONFIG_PCI
-	pci_unregister_driver(&nouveau_drm_pci_driver);
-#endif
+	auxiliary_driver_unregister(&nouveau_auxdrv);
+
 	nouveau_backlight_dtor();
 
-#ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
-	platform_driver_unregister(&nouveau_platform_driver);
-#endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
 
@@ -1327,7 +1230,6 @@ nouveau_drm_exit(void)
 module_init(nouveau_drm_init);
 module_exit(nouveau_drm_exit);
 
-MODULE_DEVICE_TABLE(pci, nouveau_drm_pci_table);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9ca0f6ab4359..ee1116bf7824 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -61,7 +61,6 @@
 #include "uapi/drm/nouveau_drm.h"
 
 struct nouveau_channel;
-struct platform_device;
 
 #include "nouveau_fence.h"
 #include "nouveau_bios.h"
@@ -201,7 +200,8 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 #include <nvif/parent.h>
 
 struct nouveau_drm {
-	struct nvkm_device *nvkm;
+	struct auxiliary_device *auxdev;
+
 	struct nvif_driver_func driver;
 	struct nvif_parent parent;
 	struct nvif_client client;
@@ -322,20 +322,13 @@ int nouveau_pmops_suspend(struct device *);
 int nouveau_pmops_resume(struct device *);
 bool nouveau_pmops_runtime(struct device *);
 
-#include <nvkm/core/tegra.h>
-
-struct drm_device *
-nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
-			       struct platform_device *, struct nvkm_device **);
-void nouveau_drm_device_remove(struct nouveau_drm *);
-
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
 
-#define NV_PRINTK_(l,drm,f,a...) do {             \
-	dev_##l((drm)->nvkm->dev, "drm: "f, ##a); \
+#define NV_PRINTK_(l,drm,f,a...) do {                \
+	dev_##l(&(drm)->auxdev->dev, "drm: "f, ##a); \
 } while(0)
 #define NV_FATAL(drm,f,a...) NV_PRINTK_(crit, (drm), f, ##a)
 #define NV_ERROR(drm,f,a...) NV_PRINTK_(err, (drm), f, ##a)
@@ -371,7 +364,7 @@ extern int nouveau_modeset;
 static inline struct nvkm_device *
 nvxx_device(struct nouveau_drm *drm)
 {
-	return drm->nvkm;
+	return container_of(drm->auxdev, struct nvkm_device, auxdev);
 }
 
 #define nvxx_bios(a) nvxx_device(a)->bios
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
deleted file mode 100644
index 23beac1f96f1..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ /dev/null
@@ -1,93 +0,0 @@
-/*
- * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-#include "nouveau_platform.h"
-
-static int nouveau_platform_probe(struct platform_device *pdev)
-{
-	const struct nvkm_device_tegra_func *func;
-	struct nvkm_device *device = NULL;
-	struct drm_device *drm;
-	int ret;
-
-	func = of_device_get_match_data(&pdev->dev);
-
-	drm = nouveau_platform_device_create(func, pdev, &device);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	return 0;
-}
-
-static void nouveau_platform_remove(struct platform_device *pdev)
-{
-	struct nouveau_drm *drm = platform_get_drvdata(pdev);
-
-	nouveau_drm_device_remove(drm);
-
-	nvkm_device_tegra.remove_new(pdev);
-}
-
-#if IS_ENABLED(CONFIG_OF)
-static const struct nvkm_device_tegra_func gk20a_platform_data = {
-	.iommu_bit = 34,
-	.require_vdd = true,
-};
-
-static const struct nvkm_device_tegra_func gm20b_platform_data = {
-	.iommu_bit = 34,
-	.require_vdd = true,
-	.require_ref_clk = true,
-};
-
-static const struct nvkm_device_tegra_func gp10b_platform_data = {
-	.iommu_bit = 36,
-	/* power provided by generic PM domains */
-	.require_vdd = false,
-};
-
-static const struct of_device_id nouveau_platform_match[] = {
-	{
-		.compatible = "nvidia,gk20a",
-		.data = &gk20a_platform_data,
-	},
-	{
-		.compatible = "nvidia,gm20b",
-		.data = &gm20b_platform_data,
-	},
-	{
-		.compatible = "nvidia,gp10b",
-		.data = &gp10b_platform_data,
-	},
-	{ }
-};
-
-MODULE_DEVICE_TABLE(of, nouveau_platform_match);
-#endif
-
-struct platform_driver nouveau_platform_driver = {
-	.driver = {
-		.name = "nouveau",
-		.of_match_table = of_match_ptr(nouveau_platform_match),
-	},
-	.probe = nouveau_platform_probe,
-	.remove_new = nouveau_platform_remove,
-};
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.h b/drivers/gpu/drm/nouveau/nouveau_platform.h
deleted file mode 100644
index a90d72767b8b..000000000000
--- a/drivers/gpu/drm/nouveau/nouveau_platform.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Copyright (c) 2014, NVIDIA CORPORATION. All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
- * DEALINGS IN THE SOFTWARE.
- */
-#ifndef __NOUVEAU_PLATFORM_H__
-#define __NOUVEAU_PLATFORM_H__
-#include "nouveau_drv.h"
-
-extern struct platform_driver nouveau_platform_driver;
-#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_runpm.h b/drivers/gpu/drm/nouveau/nouveau_runpm.h
index 92d6c518bdad..0de62022db58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_runpm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_runpm.h
@@ -6,7 +6,7 @@
 static inline struct device *
 nouveau_runpm_dev(struct nouveau_drm *drm)
 {
-	return drm->dev->dev;
+	return &drm->auxdev->dev;
 }
 
 static inline void
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
index cbaad3ea10eb..c4cbdf172499 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
@@ -191,13 +191,10 @@ static int nouveau_dsm_set_discrete_state(acpi_handle handle, enum vga_switchero
 	return 0;
 }
 
-#include "nouveau_drv.h"
-#include "nouveau_acpi.h"
-
 static void
 nvkm_acpi_switcheroo_reprobe(struct pci_dev *pdev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+	struct nvkm_device *device = pci_get_drvdata(pdev);
 
 	device->driver->switcheroo.reprobe(device->driver);
 }
@@ -206,7 +203,7 @@ static void
 nvkm_acpi_switcheroo_set_state(struct pci_dev *pdev,
 			     enum vga_switcheroo_state state)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+	struct nvkm_device *device = pci_get_drvdata(pdev);
 
 	if (state == VGA_SWITCHEROO_OFF) {
 		if (nouveau_dsm_priv.dsm_detected || nouveau_dsm_priv.optimus_detected)
@@ -221,7 +218,7 @@ nvkm_acpi_switcheroo_set_state(struct pci_dev *pdev,
 static bool
 nvkm_acpi_switcheroo_can_switch(struct pci_dev *pdev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+	struct nvkm_device *device = pci_get_drvdata(pdev);
 
 	return device->driver->switcheroo.can_switch(device->driver);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index a66cb9d474d5..735bf0a9931d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1618,12 +1618,10 @@ nvkm_device_pci_func = {
 	.cpu_coherent = !IS_ENABLED(CONFIG_ARM),
 };
 
-#include "nouveau_drv.h"
-
 static int
 nvkm_device_pci_pm_runtime_resume(struct device *dev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct nvkm_device *device = dev_get_drvdata(dev);
 	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
 	int ret;
 
@@ -1644,7 +1642,7 @@ nvkm_device_pci_pm_runtime_resume(struct device *dev)
 static int
 nvkm_device_pci_pm_runtime_suspend(struct device *dev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct nvkm_device *device = dev_get_drvdata(dev);
 	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
 
 	nvkm_acpi_switcheroo_set_powerdown();
@@ -1659,7 +1657,7 @@ nvkm_device_pci_pm_runtime_suspend(struct device *dev)
 static int
 nvkm_device_pci_pm_resume(struct device *dev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct nvkm_device *device = dev_get_drvdata(dev);
 	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
 	int ret;
 
@@ -1677,7 +1675,7 @@ nvkm_device_pci_pm_resume(struct device *dev)
 static int
 nvkm_device_pci_pm_suspend(struct device *dev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)dev_get_drvdata(dev))->nvkm;
+	struct nvkm_device *device = dev_get_drvdata(dev);
 	struct pci_dev *pdev = nvkm_device_pci(device)->pdev;
 
 	pci_save_state(pdev);
@@ -1698,8 +1696,12 @@ nvkm_device_pci_pm = {
 static void
 nvkm_device_pci_remove(struct pci_dev *dev)
 {
-	struct drm_device *drm_dev = pci_get_drvdata(dev);
-	struct nvkm_device *device = nouveau_drm(drm_dev)->nvkm;
+	struct nvkm_device *device = pci_get_drvdata(dev);
+
+	if (device->runpm) {
+		pm_runtime_get_sync(device->dev);
+		pm_runtime_forbid(device->dev);
+	}
 
 	nvkm_device_del(&device);
 }
@@ -1855,12 +1857,36 @@ nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 		}
 	}
 
+	if (device->runpm) {
+		pm_runtime_allow(device->dev);
+		pm_runtime_put(device->dev);
+	}
+
 	return 0;
 }
 
+static struct pci_device_id
+nvkm_device_pci_id_table[] = {
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA, PCI_ANY_ID),
+		.class = PCI_BASE_CLASS_DISPLAY << 16,
+		.class_mask  = 0xff << 16,
+	},
+	{
+		PCI_DEVICE(PCI_VENDOR_ID_NVIDIA_SGS, PCI_ANY_ID),
+		.class = PCI_BASE_CLASS_DISPLAY << 16,
+		.class_mask  = 0xff << 16,
+	},
+	{}
+};
+
 struct pci_driver
 nvkm_device_pci_driver = {
+	.name = "nvkm",
+	.id_table = nvkm_device_pci_id_table,
 	.probe = nvkm_device_pci_probe,
 	.remove = nvkm_device_pci_remove,
 	.driver.pm = &nvkm_device_pci_pm,
 };
+
+MODULE_DEVICE_TABLE(pci, nvkm_device_pci_id_table);
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
index f0c1258170f4..743a781586c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
@@ -233,12 +233,10 @@ nvkm_device_tegra_func = {
 	.cpu_coherent = false,
 };
 
-#include "nouveau_drv.h"
-
 static void
 nvkm_device_tegra_remove(struct platform_device *pdev)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)platform_get_drvdata(pdev))->nvkm;
+	struct nvkm_device *device = platform_get_drvdata(dev);
 
 	nvkm_device_del(&device);
 }
@@ -336,11 +334,50 @@ nvkm_device_tegra_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static const struct nvkm_device_tegra_func gk20a_platform_data = {
+	.iommu_bit = 34,
+	.require_vdd = true,
+};
+
+static const struct nvkm_device_tegra_func gm20b_platform_data = {
+	.iommu_bit = 34,
+	.require_vdd = true,
+	.require_ref_clk = true,
+};
+
+static const struct nvkm_device_tegra_func gp10b_platform_data = {
+	.iommu_bit = 36,
+	/* power provided by generic PM domains */
+	.require_vdd = false,
+};
+
+static const struct of_device_id nouveau_platform_match[] = {
+	{
+		.compatible = "nvidia,gk20a",
+		.data = &gk20a_platform_data,
+	},
+	{
+		.compatible = "nvidia,gm20b",
+		.data = &gm20b_platform_data,
+	},
+	{
+		.compatible = "nvidia,gp10b",
+		.data = &gp10b_platform_data,
+	},
+	{ }
+};
+
 struct platform_driver
 nvkm_device_tegra = {
+	.driver = {
+		.name = "nvkm",
+		.of_match_table = of_match_ptr(nouveau_platform_match),
+	},
 	.probe = nvkm_device_tegra_probe,
 	.remove_new = nvkm_device_tegra_remove,
 };
+
+MODULE_DEVICE_TABLE(of, nouveau_platform_match);
 #else
 struct platform_driver
 nvkm_device_tegra = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/module.c b/drivers/gpu/drm/nouveau/nvkm/module.c
index 7a56ef8c3b6b..c14dd7fa15c2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/module.c
+++ b/drivers/gpu/drm/nouveau/nvkm/module.c
@@ -20,6 +20,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <core/module.h>
+#include <core/pci.h>
+#include <core/tegra.h>
 #include <device/acpi.h>
 
 int nvkm_runpm = -1;
@@ -27,12 +29,34 @@ int nvkm_runpm = -1;
 void __exit
 nvkm_exit(void)
 {
+#ifdef CONFIG_PCI
 	nvkm_acpi_switcheroo_fini();
+	pci_unregister_driver(&nvkm_device_pci_driver);
+#endif
+
+#ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
+	platform_driver_unregister(&nvkm_device_tegra);
+#endif
 }
 
 int __init
 nvkm_init(void)
 {
+	int ret;
+
+#ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
+	ret = platform_driver_register(&nvkm_device_tegra);
+	if (ret)
+		return ret;
+#endif
+
+#ifdef CONFIG_PCI
 	nvkm_acpi_switcheroo_init();
+
+	ret = pci_register_driver(&nvkm_device_pci_driver);
+	if (ret)
+		return ret;
+#endif
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
index e4737b89cb63..919e07d85f2e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -64,12 +64,10 @@ nvkm_pci_mask(struct nvkm_pci *pci, u16 addr, u32 mask, u32 value)
 	return data;
 }
 
-#include "nouveau_drv.h"
-
 static unsigned int
 nvkm_pci_vga_set_decode(struct pci_dev *pdev, bool state)
 {
-	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+	struct nvkm_device *device = pci_get_drvdata(pdev);
 
 	if (device->card_type == NV_40 &&
 	    device->chipset >= 0x4c)
-- 
2.44.0

