Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE6D907925
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84FC10EB33;
	Thu, 13 Jun 2024 17:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t+aZ6HP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EE810EB19;
 Thu, 13 Jun 2024 17:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocX0Cl5rnzXlfIfkxyY2HtWHZ+YRZft+ln6d2t4aPfX87rA/ubqr/ME5pgSqFj2dhLc2PVX63iI9ycfeJk0OiCFjlnuUyd5mZs0VUapEFyMP1V1Ryc06pOEGZ2HBq1etKXrWqWLdn4dtAm7ZeykFtR+Pu5b1qPCAlsgSGa7tGaZvYyrtuDqa6RuYf/bxAf5eFM2dUI+Kz3ev2dnLJHvu+Zh3H6vrh8z8vRtqq/R3wZkfiy7AVb0a6RmZKnUZQtt7XsVSEVkCqVNn+C0YbeF6hQ11gtFjE7BisUxKwgkY96iPTfKqUukjzbGlhDNlgnbdlyOAn0lzua4pwXt8W7tkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYwGodSCEo4o8qng0Xi7VHXUq0eon05cbXGB4ZtQTJA=;
 b=EUfEJSgW5IQUrEqzrOFEeqY3AD7o4vKk1JGPK/zCiy2mpppY7kXKKPDZH2BH7WSKpHIm8NovMVe1CHoOFVU7QdNgFhLc5zDTHXbhRveFeLSrHt9u0kYQXrdNrNvjxZ0rTNCEBFB6OzqegOWwz4ylI4ixfYDrSiPEMsIcde+NbnJy63mflshivg+9PDWekTFZSSdicpZ7acEsJGER8QeAOFnpKJYiEmdiBIKkZSKOzYlYh22yFcObdbYNCgIpWQb7fixKoZECDNsA4AOaVIEVJq9PEGqKsc2eYYqwoFGhPfgKKIpW+Nv0cZDdTo0Rw8W7iMFpkSZOxJkvtPkAMWhr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYwGodSCEo4o8qng0Xi7VHXUq0eon05cbXGB4ZtQTJA=;
 b=t+aZ6HP/wMy9dzXq11TGq5iTdSAyldocSLcwTOZbrd1qpr8SFgBJ3Gm+V0yNwHCwPKRdbswcIGFnOBkv0N9Wg0ByOiRZLE09D0u8iP3IUmCf73d9kVIb5Mx7hKh7ng/zZ7y3F9qDL1WNyyfQthngL4GJXG5y/cxjSlvtOQHwRl95jDYxWzXpIifCJFXp+qHv5cBWrt+I5S9hCoi93e9Xju3cGELrqqxBO7r2qTqSzE81dKz6v3kkmgOexBOrKWb46fX6fGRakgdK7dg4TJquLnIVkft+bq6wO75z1KtcJSJAw0gs0Pye0tQmJBia8iCB/98tVjqminbIaW/rsH/i0Q==
Received: from MW4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:303:16d::33)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 17:00:05 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::64) by MW4PR02CA0007.outlook.office365.com
 (2603:10b6:303:16d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:53 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 11/21] drm/nouveau/nvkm: move switcheroo from drm
Date: Fri, 14 Jun 2024 03:00:03 +1000
Message-ID: <20240613170046.88687-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c07368c-fe47-4400-d3ce-08dc8bca45d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PmDAWQvxVjFndykm4Y3y5DUDMpW4K26mvMrHv0zdN89NNA1QNaoD9XncVijf?=
 =?us-ascii?Q?8rMvxIxBTF1nWZJmZJ+aq1KlTyd57CJbxRPtpewhWFv9Yy92Ib2iGsAMjnoh?=
 =?us-ascii?Q?epJpMhLy1mg7Jsd9I2oMZ/UhdEiAw1N9cQQA5ca6OMPfqtPY880Uh5Irf7UD?=
 =?us-ascii?Q?AI8B2a9PcKygWJlVfAUk2N3hYsEXHAGHQqAk06fRwpq2JRLucbO2jp94EXUz?=
 =?us-ascii?Q?wbr70BRSKhpU3YjqzBF9w9+kKoakZy4/jg9dhvHs7LEx4xk62f9whBWhwTtL?=
 =?us-ascii?Q?6DnN/63IJS0ZXub0uUDyHungTpSJOqh0Av2PBehi4qmhi0vNhr71ivAHotyH?=
 =?us-ascii?Q?+QqTqwtU7P7NVeDvNkJQjR77ksWdhgSgey2MiUkjLht8n+zjjQwSoQ4XVc0s?=
 =?us-ascii?Q?FNbTYc8iEz+JOlwTzGj+8C38RVYa121gYRIZ592kkF4Q9PhJBFgz66xvdCVT?=
 =?us-ascii?Q?8nWJgiaLPgXG3GtQFm1Qplou04xGxAQxTTYecZbHBaXxo6opcq7BiesMJeZV?=
 =?us-ascii?Q?oUr9e9HRnRwbHm/WVw5eqTadaWwEbYzWodX7Yjw/1ch4Vb6FJLdVUuSbFtfN?=
 =?us-ascii?Q?tvgNZN75nOTVQ7kZ8wZshL0pt4EIX+gdwtqXuXLCIoSY6mbz9QK644sYCCLs?=
 =?us-ascii?Q?WltqkHmZ2PYO15narojNCPHhCkIgAvqlow8+EddmeSDZmiJN+Z07qootxPtB?=
 =?us-ascii?Q?+CX1Y6NVFBaT7AmZPzC91DnTq+ashLsQRby6oUMjauMiLO4akEKvMVpULmmG?=
 =?us-ascii?Q?Lk3fpxJ/46VWVB3eIT23h9jyeMkuDYDRcInKVK+7pQv1UFBCKqMJyaFN5yt/?=
 =?us-ascii?Q?O0LHzUhg+7stHPHZRaBtWKVYs5Uz7rGo27+OSrDlDCLekYn1mPqjRsfzeMPa?=
 =?us-ascii?Q?aUgdfoEXHosco6OrIUORdgXpOeC9a4etQLg9Cm6MWsKdOw9Bxmz1Hi/Pn8az?=
 =?us-ascii?Q?2SZoC61qSzuI7Vaedne+vICD9p9NVZ5Oejnhte7UhTNsWIn7w+nXSt+w4foD?=
 =?us-ascii?Q?ojI8X8cF5N8DDi0HC9zrkS3sHi6SXuUqwC5qMvBKaSpx5U4wup5KGYhX1kMX?=
 =?us-ascii?Q?qN5ZuUImfIdO4pR/7PYhDpovpL+w0YsDArrPiTBRHLbvrt1peSDdbzq5p2MS?=
 =?us-ascii?Q?6iDLOh+28xI3zOlzp9P5qQypiix6irjqj/cLvRehfzKmLcJHMrS7Qz+N33km?=
 =?us-ascii?Q?x6Ta1Z17XCuIsch7HWXDKdaMqba97xX0dCRfL9s1+1ZcWuf+W7L+qEGhqf/V?=
 =?us-ascii?Q?dp4XOcwgjW/cE1cVy/Jj5tZtylrc1suhQAAq2WmDUv+GtKyn037Cqhjtp3IC?=
 =?us-ascii?Q?0vhuzc3eIHApWjnqnIRLHpFriPxzhGv5609/LeqtWf/GSVxxSYWr5huIkbnR?=
 =?us-ascii?Q?D4xFECG/T/+aC47lHeN8b2ZWiAgRfBZylXAi6DdBk0qI9xJ4ww=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:05.0816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c07368c-fe47-4400-d3ce-08dc8bca45d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831
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

The DRM driver needs to do things in response to vga_switcheroo_client
callbacks, so this move isn't a direct copy+paste.

3 new callbacks are added to nvif_driver_func, which are basically the
same as the switcheroo callbacks, except NVKM handles all the PCI/ACPI
parts, and calls into the DRM driver for the rest.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  7 ++
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |  2 +
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  8 --
 drivers/gpu/drm/nouveau/nouveau_acpi.h        |  4 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 -
 drivers/gpu/drm/nouveau/nouveau_vga.c         | 71 +++-------------
 drivers/gpu/drm/nouveau/nouveau_vga.h         |  3 +-
 drivers/gpu/drm/nouveau/nvkm/device/acpi.c    | 83 ++++++++++++++++++-
 9 files changed, 104 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e1d3ccc2128c..49db239f1156 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -2,6 +2,7 @@
 #ifndef __NVIF_DRIVERIF_H__
 #define __NVIF_DRIVERIF_H__
 #include <drm/display/drm_dp.h>
+#include <linux/vga_switcheroo.h>
 
 struct nvif_event_priv;
 struct nvif_client_priv;
@@ -36,6 +37,12 @@ struct nvif_event_impl {
 
 struct nvif_driver_func {
 	enum nvif_event_stat (*event)(u64 token, void *repv, u32 repc);
+
+	struct nvif_driver_func_switcheroo {
+		bool (*can_switch)(const struct nvif_driver_func *);
+		void (*set_state)(const struct nvif_driver_func *, enum vga_switcheroo_state);
+		void (*reprobe)(const struct nvif_driver_func *);
+	} switcheroo;
 };
 
 struct nvif_driver {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
index 7444c4d59e09..a1e9ee6da44e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
@@ -7,6 +7,8 @@ struct nvkm_device_pci {
 	struct nvkm_device device;
 	struct pci_dev *pdev;
 	bool suspend;
+
+	struct dev_pm_domain vga_pm_domain;
 };
 
 int nvkm_device_pci_new(struct pci_dev *, const char *cfg, const char *dbg,
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index b9c43fe552c0..da3120258527 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -8,14 +8,6 @@
 #include "nouveau_drv.h"
 #include "nouveau_acpi.h"
 
-bool nouveau_is_optimus(void) {
-	return nouveau_dsm_priv.optimus_detected;
-}
-
-bool nouveau_is_v1_dsm(void) {
-	return nouveau_dsm_priv.dsm_detected;
-}
-
 void *
 nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index a7fac1f7a73d..be1b218cb921 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -5,16 +5,12 @@
 #define ROM_BIOS_PAGE 4096
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
-bool nouveau_is_optimus(void);
-bool nouveau_is_v1_dsm(void);
 #include <device/acpi.h>
 static inline void nouveau_switcheroo_optimus_dsm(void) { nvkm_acpi_switcheroo_set_powerdown(); }
 void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
 void nouveau_acpi_video_register_backlight(void);
 #else
-static inline bool nouveau_is_optimus(void) { return false; };
-static inline bool nouveau_is_v1_dsm(void) { return false; };
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
 static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 52c4c3f58799..580849b78231 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -505,7 +505,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	nouveau_bios_takedown(dev);
 
 	nouveau_ttm_fini(drm);
-	nouveau_vga_fini(drm);
 
 	/*
 	 * There may be existing clients from as-yet unclosed files. For now,
@@ -556,8 +555,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	if (drm->device.impl->chipset == 0xc1)
 		nvif_mask(&drm->device, 0x00088080, 0x00000800, 0x00000000);
 
-	nouveau_vga_init(drm);
-
 	ret = nouveau_ttm_init(drm);
 	if (ret)
 		goto fail_ttm;
@@ -608,7 +605,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 fail_bios:
 	nouveau_ttm_fini(drm);
 fail_ttm:
-	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->cli);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
@@ -650,6 +646,7 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 
 	drm->nvkm = device;
 	drm->driver = nouveau_driver;
+	drm->driver.switcheroo = nouveau_switcheroo;
 
 	device->cfgopt = nouveau_config;
 	device->dbgopt = nouveau_debug;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index c2014a29891c..b44f0d408ccc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -295,8 +295,6 @@ struct nouveau_drm {
 	/* led management */
 	struct nouveau_led *led;
 
-	struct dev_pm_domain vga_pm_domain;
-
 	struct nouveau_svm *svm;
 
 	struct nouveau_dmem *dmem;
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 1f5ccec025d7..cb5cd4b93fdf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -8,41 +8,35 @@
 #include "nouveau_vga.h"
 
 static void
-nouveau_switcheroo_set_state(struct pci_dev *pdev,
-			     enum vga_switcheroo_state state)
+nouveau_switcheroo_set_state(const struct nvif_driver_func *driver, enum vga_switcheroo_state state)
 {
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	struct drm_device *dev = drm->dev;
-
-	if ((nouveau_is_optimus() || nouveau_is_v1_dsm()) && state == VGA_SWITCHEROO_OFF)
-		return;
+	struct drm_device *dev = container_of(driver, struct nouveau_drm, driver)->dev;
 
 	if (state == VGA_SWITCHEROO_ON) {
 		pr_err("VGA switcheroo: switched nouveau on\n");
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
-		nouveau_pmops_resume(&pdev->dev);
+		nouveau_pmops_resume(dev->dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_ON;
 	} else {
 		pr_err("VGA switcheroo: switched nouveau off\n");
 		dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
-		nouveau_switcheroo_optimus_dsm();
-		nouveau_pmops_suspend(&pdev->dev);
+		nouveau_pmops_suspend(dev->dev);
 		dev->switch_power_state = DRM_SWITCH_POWER_OFF;
 	}
 }
 
 static void
-nouveau_switcheroo_reprobe(struct pci_dev *pdev)
+nouveau_switcheroo_reprobe(const struct nvif_driver_func *driver)
 {
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = container_of(driver, struct nouveau_drm, driver);
 
 	drm_fb_helper_output_poll_changed(drm->dev);
 }
 
 static bool
-nouveau_switcheroo_can_switch(struct pci_dev *pdev)
+nouveau_switcheroo_can_switch(const struct nvif_driver_func *driver)
 {
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = container_of(driver, struct nouveau_drm, driver);
 
 	/*
 	 * FIXME: open_count is protected by drm_global_mutex but that would lead to
@@ -52,56 +46,13 @@ nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 	return atomic_read(&drm->dev->open_count) == 0;
 }
 
-static const struct vga_switcheroo_client_ops
-nouveau_switcheroo_ops = {
-	.set_gpu_state = nouveau_switcheroo_set_state,
+const struct nvif_driver_func_switcheroo
+nouveau_switcheroo = {
+	.set_state = nouveau_switcheroo_set_state,
 	.reprobe = nouveau_switcheroo_reprobe,
 	.can_switch = nouveau_switcheroo_can_switch,
 };
 
-void
-nouveau_vga_init(struct nouveau_drm *drm)
-{
-	struct drm_device *dev = drm->dev;
-	bool runtime = nouveau_pmops_runtime(dev->dev);
-	struct pci_dev *pdev;
-
-	/* only relevant for PCI devices */
-	if (!dev_is_pci(dev->dev))
-		return;
-	pdev = to_pci_dev(dev->dev);
-
-	/* don't register Thunderbolt eGPU with vga_switcheroo */
-	if (pci_is_thunderbolt_attached(pdev))
-		return;
-
-	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtime);
-
-	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
-		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, &drm->vga_pm_domain);
-}
-
-void
-nouveau_vga_fini(struct nouveau_drm *drm)
-{
-	struct drm_device *dev = drm->dev;
-	bool runtime = nouveau_pmops_runtime(dev->dev);
-	struct pci_dev *pdev;
-
-	/* only relevant for PCI devices */
-	if (!dev_is_pci(dev->dev))
-		return;
-	pdev = to_pci_dev(dev->dev);
-
-	if (pci_is_thunderbolt_attached(pdev))
-		return;
-
-	vga_switcheroo_unregister_client(pdev);
-	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
-		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
-}
-
-
 void
 nouveau_vga_lastclose(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouveau/nouveau_vga.h
index 951a83f984dd..119b39cfbbcc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.h
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
@@ -2,8 +2,7 @@
 #ifndef __NOUVEAU_VGA_H__
 #define __NOUVEAU_VGA_H__
 
-void nouveau_vga_init(struct nouveau_drm *);
-void nouveau_vga_fini(struct nouveau_drm *);
+extern const struct nvif_driver_func_switcheroo nouveau_switcheroo;
 void nouveau_vga_lastclose(struct drm_device *dev);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
index 2bead7e879a5..cbaad3ea10eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
@@ -23,9 +23,11 @@
  */
 #include "acpi.h"
 
-#include <core/device.h>
+#include <core/pci.h>
 #include <subdev/clk.h>
 
+#include <nvif/driverif.h>
+
 #include <linux/mxm-wmi.h>
 #include <linux/vga_switcheroo.h>
 
@@ -189,6 +191,48 @@ static int nouveau_dsm_set_discrete_state(acpi_handle handle, enum vga_switchero
 	return 0;
 }
 
+#include "nouveau_drv.h"
+#include "nouveau_acpi.h"
+
+static void
+nvkm_acpi_switcheroo_reprobe(struct pci_dev *pdev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+
+	device->driver->switcheroo.reprobe(device->driver);
+}
+
+static void
+nvkm_acpi_switcheroo_set_state(struct pci_dev *pdev,
+			     enum vga_switcheroo_state state)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+
+	if (state == VGA_SWITCHEROO_OFF) {
+		if (nouveau_dsm_priv.dsm_detected || nouveau_dsm_priv.optimus_detected)
+			return;
+
+		nvkm_acpi_switcheroo_set_powerdown();
+	}
+
+	device->driver->switcheroo.set_state(device->driver, state);
+}
+
+static bool
+nvkm_acpi_switcheroo_can_switch(struct pci_dev *pdev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+
+	return device->driver->switcheroo.can_switch(device->driver);
+}
+
+static const struct vga_switcheroo_client_ops
+nvkm_acpi_switcheroo_ops = {
+	.can_switch = nvkm_acpi_switcheroo_can_switch,
+	.set_gpu_state = nvkm_acpi_switcheroo_set_state,
+	.reprobe = nvkm_acpi_switcheroo_reprobe,
+};
+
 static int nouveau_dsm_switchto(enum vga_switcheroo_client_id id)
 {
 	if (!nouveau_dsm_priv.dsm_detected)
@@ -380,16 +424,53 @@ nvkm_acpi_ntfy(struct notifier_block *nb, unsigned long val, void *data)
 void
 nvkm_acpi_fini(struct nvkm_device *device)
 {
+	struct nvkm_device_pci *pdev;
+
+	if (!device->func->pci)
+		return;
+
+	pdev = device->func->pci(device);
+	(void)pdev;
+
 #ifdef CONFIG_ACPI
 	unregister_acpi_notifier(&device->acpi.nb);
 #endif
+
+#ifdef CONFIG_VGA_SWITCHEROO
+	if (pci_is_thunderbolt_attached(pdev->pdev))
+		return;
+
+	vga_switcheroo_unregister_client(pdev->pdev);
+	if (device->runpm == NVKM_DEVICE_RUNPM_V1)
+		vga_switcheroo_fini_domain_pm_ops(device->dev);
+#endif
 }
 
 void
 nvkm_acpi_init(struct nvkm_device *device)
 {
+	struct nvkm_device_pci *pdev;
+
+	if (!device->func->pci)
+		return;
+
+	pdev = device->func->pci(device);
+	(void)pdev;
+
 #ifdef CONFIG_ACPI
 	device->acpi.nb.notifier_call = nvkm_acpi_ntfy;
 	register_acpi_notifier(&device->acpi.nb);
 #endif
+
+#ifdef CONFIG_VGA_SWITCHEROO
+	/* don't register Thunderbolt eGPU with vga_switcheroo */
+	if (pci_is_thunderbolt_attached(pdev->pdev))
+		return;
+
+	vga_switcheroo_register_client(pdev->pdev, &nvkm_acpi_switcheroo_ops,
+				       device->runpm != NVKM_DEVICE_RUNPM_NONE);
+
+	if (device->runpm == NVKM_DEVICE_RUNPM_V1)
+		vga_switcheroo_init_domain_pm_ops(device->dev, &pdev->vga_pm_domain);
+#endif
 }
-- 
2.44.0

