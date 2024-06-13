Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE1907933
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38510EB30;
	Thu, 13 Jun 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAc6hsZ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43910EB15;
 Thu, 13 Jun 2024 17:00:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T36y9Wkmkjez9JqPSK8Bz4u3nQyGejN6os0dTemJyYyrVJvSqiRVpdgS8H+Rxze98WTiY397EWMTuW2hBp2PJxaKlX9WaQuIJi8dr/VOItuMCFwoi6rFzVBFjE2rKDLFBOiBkwL+4LjQ1daAFb2gHcM9QRxM3G/7FhHXjO2n5sJ2uwMKDqdfwxx7wSfQ59LtA0IBmDv0kzzivGJ9OurMLblCRCmz0IX3C4ahl9RDdRwTajKoasZfn8A8N+L6ybVPuaSLsXqG8RO8BLDHl/0rImpyT/lys2+HVvEMAcNcJrR6hAxe034RQfamYTRra2ZFQ9yZNmUiVgALeOA6Jo1rZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyr3WMOCIteDmaS5ZrBx+YRtrEaXDLizInJjEcmaLys=;
 b=jrcz52wbySNnR/bZk55cEnkn6FvNDN+Mt4lJnnSeykywzBP2L3CPwx8ZWAG8y8ugEaEJIiVYDsLcl3LUQEG1ERX2aQvOeDABExr+IOWTK6rezPPcatBVR5h8LzGV0B/E9Mxw1wmVO9WN65hY5VEPt4yA2cEbsePSFuqTRV8k8+aTz7DSipGswfzaatO4ORX+NEWPkK8UERTFvtle6xoyf0Y0kWaJTPMOvaW8qKLwARiVGN4/mRcLBOG4Yn6Gn0No0f1dySmP122/fCMOn4QKv9S+e6KVWFrI/HGmsNxd9FBq/0wsEjKr33IXmlOz/IsALQyU+HoNpf9HFKC7RNfPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyr3WMOCIteDmaS5ZrBx+YRtrEaXDLizInJjEcmaLys=;
 b=YAc6hsZ1T0FNtYvliyZAKPug3VyfnUiNh7ek9TxWGtUN5H8SgI03uGrTG64NIDG+CLGhwC8+QM1WWF+rmehJPSXqhNtYWPlZOD1exuzYq1iL0oRXzKanKMAKajlrrgfILnfpgVIUFuBDpTZx3tR3XdUr4RnWlER0lJWvg3N2JNuFKbMiJkR4jTdvQ8luauAZNJdwV8iFj6yG+RNyK5PbVgjaAWMww/hYbBU/AvPZsaRJiIzlGGFcWvHLrbea3/MESmT22nmujwBLf4H5Smb91Ri+PBmJRAQXyex+uUyH4spX8v0wqs1TtkqKDxODGXhNnxEl5vuJaX30vQNV488T8Q==
Received: from MW4PR02CA0004.namprd02.prod.outlook.com (2603:10b6:303:16d::19)
 by MW4PR12MB7437.namprd12.prod.outlook.com (2603:10b6:303:21a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:00:04 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::fe) by MW4PR02CA0004.outlook.office365.com
 (2603:10b6:303:16d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:04 +0000
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
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:51 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 10/21] drm/nouveau/nvif: add runpm supported flag to device
 impl
Date: Fri, 14 Jun 2024 03:00:02 +1000
Message-ID: <20240613170046.88687-11-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: aeac2850-4233-43ee-9e01-08dc8bca455f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ry9zOUyD7ACzVBqVPgFXmmXbaA9djtF8dtc7la2qu9jm1y0appxmoIfD5o9?=
 =?us-ascii?Q?6WfzOfrAYSHQsXKWwSzvUMtTUI68CDY8QNulAV8ulbXCcaIALZQB6DUvAlRy?=
 =?us-ascii?Q?nD2xGT5MOcAYAid9IB5ghkfveRQXGgUHIoaCb6JOaGb1T3+5+EgJkvQQCpqq?=
 =?us-ascii?Q?JdOyYrkEuLgvYGrMHxh3YFKJQ4E9DkJljArXqJSrIu8iw55oWW/3EBVPITRi?=
 =?us-ascii?Q?4nmt+szivreSm4cb71M31CUWrMXi/GPr6thXYDEgmsqBB6qzbI1PP0jmsaCN?=
 =?us-ascii?Q?QNfdITV3JxPbcePHRWtHyPnW+6i6t3PChE8eI4VD86jmVsifx28Ejwzi4iDM?=
 =?us-ascii?Q?MjYax+v0c166JexldXJ9u+8quI/DYJDzz4g6ZypJZST02aTviFIHO9AtY7gg?=
 =?us-ascii?Q?5uy35NUIRbiViBTJGg0YICdNg3PxyIbGBeUh7ST/VLvBw5MOAXerI2iU7PZf?=
 =?us-ascii?Q?AWxAVQQou/TZBlH5opLjCiQWRgvc/OELbZX6VfLMzyhQsA1rkGydzlsM5+HS?=
 =?us-ascii?Q?QxD3VF6rvSzvda7Id9Jtk2nnecwvZKPzAyv5QMtea+7TjSCiLR8e1V2HPHwu?=
 =?us-ascii?Q?zgSFPhjo/QK3iFeRJ1SjEIbYSn/U0K/qDwn/kCP2bbPvmgsitPvQWZ8PV6ze?=
 =?us-ascii?Q?+wC+go/8ILIQI/Jh2iNhTEF34nHRZiQEJ+k/jkxlua824krzTfESiGQkj6As?=
 =?us-ascii?Q?iWQN1oj+kYCbJDyYdf3o9FD8QZs2lIkICWTNd8Ey6vERupj7cvYuH6VCgwGS?=
 =?us-ascii?Q?z5gwu+Rjh0j+UIjw7onv1NJgn49YWpTxT/bIs7UKxIPhOl0xKDfXu+t5bv1u?=
 =?us-ascii?Q?8urT1P/fExFPLc5q5o5Q4B4LaSj/zFaNDSS1bkOBnkA2l7WhWV0bJSEqZnAF?=
 =?us-ascii?Q?Yc66AIS202EIY38HAEYBIHZSD2UuGUK1zesVTjDnrdgTZ/cCdBqBhp6wxsZv?=
 =?us-ascii?Q?u84+jezbZE0CnkwWl6e8oPny8Cx8PKzSw4KsJ1kuLDBGOUDTiAoHP45ipDam?=
 =?us-ascii?Q?8V44LwnHomU8XrfbW7f6Rc38swAYKZiZXhsuZt7FfvdUmuAhbrt/cTWH//X1?=
 =?us-ascii?Q?rkHQvy8GwVW967665CdOiUk2GiCp1iKoIf9SllQ+O7bv0pHlJvMg3J3XHImc?=
 =?us-ascii?Q?JiDEOnPEaJFeZUtPYRt+dM3nG97L06D4/k2NMNZmza+stYepkZBkV5dFargO?=
 =?us-ascii?Q?jxcgrWYlvYzIpUM348OSpzCvC7X1mcvKlZiWMAFqkXBFhA7jvO936p/9BRDq?=
 =?us-ascii?Q?rIArgDU545b69rrkIyJ2qY9FAx+DcjTR9P1INAkSdrovKufEVG8o0rFceqpp?=
 =?us-ascii?Q?MkuWa35Xt7HPo++N4yk4mhkoqNyRRa349LOhzz3gwDfxVERYqvI51WRz9lRN?=
 =?us-ascii?Q?uADn24ljEdpxdPkdIflBtmy4NE4uE92MpGOAvKBpirLONrxU8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:04.3004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeac2850-4233-43ee-9e01-08dc8bca455f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
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

The DRM driver uses "nouveau_is_optimus() || nouveau_is_v1_dsm()", which
have been moved to NVKM, to determine support for runtime pm.

Replace with a feature flag returned when allocating an nvif_device.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h |  2 ++
 .../gpu/drm/nouveau/include/nvkm/core/device.h  |  6 ++++++
 .../gpu/drm/nouveau/include/nvkm/core/module.h  |  2 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c           | 17 ++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_drv.h           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c           |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/device/pci.c       | 12 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.c      |  2 ++
 drivers/gpu/drm/nouveau/nvkm/module.c           |  2 ++
 9 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 638c72c1b580..e1d3ccc2128c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -538,6 +538,8 @@ struct nvif_device_impl {
 	u64 ram_size;
 	u64 ram_user;
 
+	bool runpm;
+
 	u64 (*time)(struct nvif_device_priv *);
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index c9965934b0d5..3c11d3068ced 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -55,6 +55,12 @@ struct nvkm_device {
 		struct notifier_block nb;
 	} acpi;
 
+	enum {
+		NVKM_DEVICE_RUNPM_NONE = 0,
+		NVKM_DEVICE_RUNPM_V1,
+		NVKM_DEVICE_RUNPM_OPTIMUS,
+	} runpm;
+
 #define NVKM_LAYOUT_ONCE(type,data,ptr) data *ptr;
 #define NVKM_LAYOUT_INST(type,data,ptr,cnt) data *ptr[cnt];
 #include <core/layout.h>
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/module.h b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
index 5cf80e4deb90..fc42ace93a1c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
@@ -5,4 +5,6 @@
 
 int __init nvkm_init(void);
 void __exit nvkm_exit(void);
+
+extern int nvkm_runpm;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0ac17da04819..52c4c3f58799 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -486,7 +486,7 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	struct drm_device *dev = drm->dev;
 	struct nouveau_cli *cli, *temp_cli;
 
-	if (nouveau_pmops_runtime()) {
+	if (nouveau_pmops_runtime(dev->dev)) {
 		pm_runtime_get_sync(dev->dev);
 		pm_runtime_forbid(dev->dev);
 	}
@@ -584,7 +584,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	nouveau_dmem_init(drm);
 	nouveau_led_init(dev);
 
-	if (nouveau_pmops_runtime()) {
+	if (nouveau_pmops_runtime(dev->dev)) {
 		pm_runtime_use_autosuspend(dev->dev);
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
 		pm_runtime_set_active(dev->dev);
@@ -1031,10 +1031,13 @@ nouveau_pmops_thaw(struct device *dev)
 }
 
 bool
-nouveau_pmops_runtime(void)
+nouveau_pmops_runtime(struct device *dev)
 {
+	struct nouveau_drm *drm = nouveau_drm(dev_get_drvdata(dev));
+
 	if (nouveau_runtime_pm == -1)
-		return nouveau_is_optimus() || nouveau_is_v1_dsm();
+		return drm->device.impl->runpm;
+
 	return nouveau_runtime_pm == 1;
 }
 
@@ -1045,7 +1048,7 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!nouveau_pmops_runtime()) {
+	if (!nouveau_pmops_runtime(dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
@@ -1067,7 +1070,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	int ret;
 
-	if (!nouveau_pmops_runtime()) {
+	if (!nouveau_pmops_runtime(dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
@@ -1098,7 +1101,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 static int
 nouveau_pmops_runtime_idle(struct device *dev)
 {
-	if (!nouveau_pmops_runtime()) {
+	if (!nouveau_pmops_runtime(dev)) {
 		pm_runtime_forbid(dev);
 		return -EBUSY;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 52589d5eab63..c2014a29891c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -324,7 +324,7 @@ nouveau_drm_use_coherent_gpu_mapping(struct nouveau_drm *drm)
 
 int nouveau_pmops_suspend(struct device *);
 int nouveau_pmops_resume(struct device *);
-bool nouveau_pmops_runtime(void);
+bool nouveau_pmops_runtime(struct device *);
 
 #include <nvkm/core/tegra.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 53b332708061..1f5ccec025d7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -63,7 +63,7 @@ void
 nouveau_vga_init(struct nouveau_drm *drm)
 {
 	struct drm_device *dev = drm->dev;
-	bool runtime = nouveau_pmops_runtime();
+	bool runtime = nouveau_pmops_runtime(dev->dev);
 	struct pci_dev *pdev;
 
 	/* only relevant for PCI devices */
@@ -85,7 +85,7 @@ void
 nouveau_vga_fini(struct nouveau_drm *drm)
 {
 	struct drm_device *dev = drm->dev;
-	bool runtime = nouveau_pmops_runtime();
+	bool runtime = nouveau_pmops_runtime(dev->dev);
 	struct pci_dev *pdev;
 
 	/* only relevant for PCI devices */
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index e48f3219f047..16e059866168 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -22,6 +22,8 @@
  * Authors: Ben Skeggs <bskeggs@redhat.com>
  */
 #include <core/pci.h>
+#include <core/module.h>
+#include "acpi.h"
 #include "priv.h"
 
 struct nvkm_device_pci_device {
@@ -1704,5 +1706,15 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 	}
 
 	*pdevice = &pdev->device;
+
+	if (nvkm_runpm) {
+		if (!nouveau_dsm_priv.optimus_detected) {
+			if (nouveau_dsm_priv.dsm_detected)
+				device->runpm = NVKM_DEVICE_RUNPM_V1;
+		} else {
+			device->runpm = NVKM_DEVICE_RUNPM_OPTIMUS;
+		}
+	}
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index 4ffcd7c6e0b9..a510d24019f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -393,6 +393,8 @@ nvkm_udevice_new(struct nvkm_device *device,
 	if (device->imem && udev->impl.ram_size > 0)
 		udev->impl.ram_user = udev->impl.ram_user - device->imem->reserved;
 
+	udev->impl.runpm = (device->runpm != NVKM_DEVICE_RUNPM_NONE);
+
 	if (device->vfn) {
 		udev->impl.usermode.oclass = device->vfn->user.base.oclass;
 		udev->impl.usermode.new = nvkm_udevice_usermode_new;
diff --git a/drivers/gpu/drm/nouveau/nvkm/module.c b/drivers/gpu/drm/nouveau/nvkm/module.c
index cf71c68af89a..7a56ef8c3b6b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/module.c
+++ b/drivers/gpu/drm/nouveau/nvkm/module.c
@@ -22,6 +22,8 @@
 #include <core/module.h>
 #include <device/acpi.h>
 
+int nvkm_runpm = -1;
+
 void __exit
 nvkm_exit(void)
 {
-- 
2.44.0

