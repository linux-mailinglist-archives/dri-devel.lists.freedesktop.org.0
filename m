Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF9F90791F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA44910EB2A;
	Thu, 13 Jun 2024 17:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tclbTbiu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE7910EB18;
 Thu, 13 Jun 2024 17:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMsUChnvelVUbJUwFgM7Nf948a8bl84NAEfFMnJlOiurH0gLJugyWm+qhwkfXImRDyZgiC9uOXSHJdWW9veFor+886/ne2DHhrYT6hGyGpv9YipIaHDb/WDveMAHCUPC/9/sPbkHN/7dE6tMTc7BhgLhNzi3dNkpA22He8m/bOLsFuY+fqegjhPIeqFfHQk3IB5A+dMEDJlen9ncUIozg6bxUawEaWvjtZqiQIgSDhAFTToADB8zGbMw+Al3wdohJGGdsGZ9oeEXcTR67Am9Q0qyFs4Qr2b5t/6U5HOsaU45eBQp+qBcOBDGFc1jKgdSAb0+x3jxEcvtior/v8zJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeamXsoNP8XsMfiai1c6C4O+TYg5s/XKFdmaZDyqF98=;
 b=eghy+svMDjBa+6wLiPLSLmoCwQhCpprVgESLjzX23lyih5CXniO+pPecKyljDujTBMEIArkl2YftkjnNxZ5CEG9BSEBgGKceTBQsBN66HZ1dYG82y2jg+EBrYIXEEM/qTiybofmDYshxQoI/cHlrO7LpFRQ/HwNR0dHN5EdGsK4yYxvn3CE0tdvr4C+jE3TrrSYBHoRLTSKbrPaWxdYkTefwSt1MT7BjIO7LRp1brNoKwYqvT8bFyY1FmbgsIO9rf1CwaabeNDnWzd4foTo048/JbpnfI0p75aZyu3xLFMf6YJsLrEHCy3HjZYTlSwwlFS9zIrttRV2613JVkcow9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeamXsoNP8XsMfiai1c6C4O+TYg5s/XKFdmaZDyqF98=;
 b=tclbTbiuIZVD+vwCoKR4j0IWYtlbEph3wyhiidEyDE5b4vH3NxUX0LvhXwA/ptUuchZ6XfmWsCHw8ILyDv5E+6sX6uOr9OZP+xWcZxcwgVlZsfSkzy/hSSyOavmGOiNFxyXfkF7jltCcF9IaTLq4AHY7A9gKauVpdTKC3yy8xV02e1gVgD3EI/1erf56w7GiMox3d0USoufRXQDZj5mUSE0UYfVIn4YRzalupbvACq8vP6LKPoqEuLUXxOHw8dxaUCFVROcdsaLZP7ZONnBGpwIyjbB6d/iTatAB3bTDNPoLm/UTRT7zrn8fpDAOulQzPd4gO73dvwM+FS7C6wlUxA==
Received: from SJ0PR03CA0349.namprd03.prod.outlook.com (2603:10b6:a03:39c::24)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.23; Thu, 13 Jun
 2024 17:00:08 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::b5) by SJ0PR03CA0349.outlook.office365.com
 (2603:10b6:a03:39c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:54 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 12/21] drm/nouveau/nvkm: prepare pci/tegra probe()/remove()
 functions
Date: Fri, 14 Jun 2024 03:00:04 +1000
Message-ID: <20240613170046.88687-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b668ce6-62d6-42ef-7f42-08dc8bca4756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q50Rw4Ct91hTaowyESL/N87NdV9Ov05YOsk0EHbxagxwv+/dGtSvCHkMgLcT?=
 =?us-ascii?Q?QrXrnSS0FcXsy6DK9nIBOrdPq9CYqUYkpcILLtv1yTEj0FSplkytpv8ByDDF?=
 =?us-ascii?Q?HgEMZ3fn2V1vSNfUk78wLGs3rSi69e46KVK6MwYAYTXcW5deMit1SPeQpV8j?=
 =?us-ascii?Q?EgOjr0knFXUQyer0HT/JgpquPSji+V6aoTMFJXirE/ykcu6AUU6HM+7FsBxm?=
 =?us-ascii?Q?z9aSGUntU0A2f8+yHA5uEJUFq/vLlyqzwsF2WduZZTC1qGNbiHSU0d+Q5i0B?=
 =?us-ascii?Q?wDv40BiV7KzYx51xly4Mjkz5mfwmxcqkoWPcilCua6PtXKYCi0lMtBIK9l/F?=
 =?us-ascii?Q?JQuL3yAoqfMQs8XY73TQnx93w0Hh/EoARGv6bd4+XckIPuWshCcE+tytYitN?=
 =?us-ascii?Q?zjs5zlLpH3Ymf2taAFIKoQN2s6kxSFMt2l546oFIgRKIEzydwbcRJUIcxWmI?=
 =?us-ascii?Q?NUW3SsuEyGiQYti99eAEshWWgSoSf39s06N5zV9Evd9Zr19JnttKANvOFMIc?=
 =?us-ascii?Q?Ep0iiFTYs9qg6uVshhceMd9N2Qo0y62/4AFxNJZ0GW61f+d0BwIXjxHgI8D5?=
 =?us-ascii?Q?8zOgbIq2YJHwVvjatDOwLbqGEKAr9rfXktSE1m1BSqx8MB9QagDywW8AUJEe?=
 =?us-ascii?Q?5wBTLIprYogE1U2/ID6W7qFl0BmPu6BWoqqlYLx1Br0KHoPnReXGLZYLQ/uJ?=
 =?us-ascii?Q?21wMZuyRdxIAeKGVgGOfF4T/6UXEiUzoMnV6HQYsnJZRPCVI5IkQetYIikWo?=
 =?us-ascii?Q?wWBayoS/tmv6O1csYjtdsrFRoLXu4BQ6VF6yo7KOLWVJ3qinH45cuPc0SMmp?=
 =?us-ascii?Q?NaKVAt/WeZUSUAeiLmP+hF8RsYObLqX+rQY1NS1RtB02QrRo5OLg5pTUFtnT?=
 =?us-ascii?Q?ZDRCvnuDJ4p/Y57p5iaCH0qdnWNdCNRWjqjyC1V8rPDMirEe7q1nS28xB/g3?=
 =?us-ascii?Q?IvEt4UjovMoQdPrSqOceN8rLxjknAQ60MZn+zUJjwKkR2b59l/BlzURx7rlR?=
 =?us-ascii?Q?+KFwFQrzTdLjIvJuxp2cMAtlV3pJ6rPS+032eogd1Gion+2/9CHzOxmWCfsF?=
 =?us-ascii?Q?5Y+l0NmdTQa6pRJn2ri3GSdKgAcH2MRn5NFJoJtgdm/5iuVqr9I2lX3w4dud?=
 =?us-ascii?Q?M8rPjPf2X7DAK0z5eHOZJ1O+VznVX5n9nrHYrIvmULcLWBx098SVVBKy/9Ra?=
 =?us-ascii?Q?h5kQW0oJay9po9ZqjFb10k8RCNPGIi4Y9Btuhd1Cm+P7umjVWzQo5Du5rwDy?=
 =?us-ascii?Q?dUNO1T0q2ycq2PIgxV3mtUHxODja65P0LHZoI4EQbfsBB0moQ+L2X35Oxqio?=
 =?us-ascii?Q?i8r7f9LmD1nl7yJ5slgSKwJZ7pZoXGJYQXyxTkU+8LL9KBq3Z2CxHmOMJyPT?=
 =?us-ascii?Q?ajY9r4GZV29PDXxzzsY720FER7Ddt3LI/i8T9CIajWmQdTJl4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:07.5961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b668ce6-62d6-42ef-7f42-08dc8bca4756
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194
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

Rename, and modify the signatures of nvkm_device_{pci,tegra}_new() to be
consistent with pci/platform driver probe() functions.

The DRM driver is still calling the functions as it did before, just via
the new pci/platform driver structs in NVKM that will eventually be used
for driver registration.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |  3 +-
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |  5 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++---
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  2 +
 drivers/gpu/drm/nouveau/nvkm/device/pci.c     | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c   | 37 ++++++++++++-------
 6 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
index a1e9ee6da44e..b9e10dad6ee9 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
@@ -11,6 +11,5 @@ struct nvkm_device_pci {
 	struct dev_pm_domain vga_pm_domain;
 };
 
-int nvkm_device_pci_new(struct pci_dev *, const char *cfg, const char *dbg,
-			struct nvkm_device **);
+extern struct pci_driver nvkm_device_pci_driver;
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index 22f74fc88cd7..e641f387fa3e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -48,8 +48,5 @@ struct nvkm_device_tegra_func {
 	bool require_vdd;
 };
 
-int nvkm_device_tegra_new(const struct nvkm_device_tegra_func *,
-			  struct platform_device *,
-			  const char *cfg, const char *dbg,
-			  struct nvkm_device **);
+extern struct platform_driver nvkm_device_tegra;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 580849b78231..632635c16b88 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -801,10 +801,12 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug, &device);
+	ret = nvkm_device_pci_driver.probe(pdev, NULL);
 	if (ret)
 		return ret;
 
+	device = pci_get_drvdata(pdev);
+
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
@@ -849,13 +851,10 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 void
 nouveau_drm_device_remove(struct nouveau_drm *drm)
 {
-	struct nvkm_device *device = drm->nvkm;
-
 	drm_dev_unplug(drm->dev);
 
 	nouveau_drm_device_fini(drm);
 	nouveau_drm_device_del(drm);
-	nvkm_device_del(&device);
 }
 
 static void
@@ -868,6 +867,8 @@ nouveau_drm_remove(struct pci_dev *pdev)
 		pdev->pm_cap = drm->old_pm_cap;
 	nouveau_drm_device_remove(drm);
 	pci_disable_device(pdev);
+
+	nvkm_device_pci_driver.remove(pdev);
 }
 
 static int
@@ -1349,10 +1350,12 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	struct nouveau_drm *drm;
 	int err;
 
-	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug, pdevice);
+	err = nvkm_device_tegra.probe(pdev);
 	if (err)
 		return ERR_PTR(err);
 
+	*pdevice = platform_get_drvdata(pdev);
+
 	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 3194b110eff8..23beac1f96f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -42,6 +42,8 @@ static void nouveau_platform_remove(struct platform_device *pdev)
 	struct nouveau_drm *drm = platform_get_drvdata(pdev);
 
 	nouveau_drm_device_remove(drm);
+
+	nvkm_device_tegra.remove_new(pdev);
 }
 
 #if IS_ENABLED(CONFIG_OF)
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 16e059866168..be6433eab814 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1626,9 +1626,19 @@ nvkm_device_pci_func = {
 	.cpu_coherent = !IS_ENABLED(CONFIG_ARM),
 };
 
-int
-nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
-		    struct nvkm_device **pdevice)
+#include "nouveau_drv.h"
+
+static void
+nvkm_device_pci_remove(struct pci_dev *dev)
+{
+	struct drm_device *drm_dev = pci_get_drvdata(dev);
+	struct nvkm_device *device = nouveau_drm(drm_dev)->nvkm;
+
+	nvkm_device_del(&device);
+}
+
+static int
+nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	const struct nvkm_device_quirk *quirk = NULL;
 	const struct nvkm_device_pci_device *pcid;
@@ -1705,7 +1715,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 		return ret;
 	}
 
-	*pdevice = &pdev->device;
+	pci_set_drvdata(pci_dev, &pdev->device);
 
 	if (nvkm_runpm) {
 		if (!nouveau_dsm_priv.optimus_detected) {
@@ -1718,3 +1728,9 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 
 	return 0;
 }
+
+struct pci_driver
+nvkm_device_pci_driver = {
+	.probe = nvkm_device_pci_probe,
+	.remove = nvkm_device_pci_remove,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
index 9c3673c74b19..f0c1258170f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
@@ -233,12 +233,20 @@ nvkm_device_tegra_func = {
 	.cpu_coherent = false,
 };
 
-int
-nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
-		      struct platform_device *pdev,
-		      const char *cfg, const char *dbg,
-		      struct nvkm_device **pdevice)
+#include "nouveau_drv.h"
+
+static void
+nvkm_device_tegra_remove(struct platform_device *pdev)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)platform_get_drvdata(pdev))->nvkm;
+
+	nvkm_device_del(&device);
+}
+
+static int
+nvkm_device_tegra_probe(struct platform_device *pdev)
 {
+	const struct nvkm_device_tegra_func *func = of_device_get_match_data(&pdev->dev);
 	struct nvkm_device_tegra *tdev;
 	struct nvkm_device *device;
 	unsigned long rate;
@@ -318,7 +326,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		return ret;
 	}
 
-	*pdevice = &tdev->device;
+	platform_set_drvdata(pdev, &tdev->device);
 	return 0;
 
 remove:
@@ -327,13 +335,14 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 	kfree(tdev);
 	return ret;
 }
+
+struct platform_driver
+nvkm_device_tegra = {
+	.probe = nvkm_device_tegra_probe,
+	.remove_new = nvkm_device_tegra_remove,
+};
 #else
-int
-nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
-		      struct platform_device *pdev,
-		      const char *cfg, const char *dbg,
-		      struct nvkm_device **pdevice)
-{
-	return -ENOSYS;
-}
+struct platform_driver
+nvkm_device_tegra = {
+};
 #endif
-- 
2.44.0

