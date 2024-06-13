Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413B090790E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35410EB18;
	Thu, 13 Jun 2024 17:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UR0F9W0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC80010EB15;
 Thu, 13 Jun 2024 17:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hM4eeNfhnCKMgmhwIEYsmiQfvOOLCxQycsyn1MJBvdOOHVL11mpp6iFXHqgFfFioFvUxU8jkriTjmyjTyXYkhE2xxH3FopB3lIKuwIad6LvPSowNweV0ds7PJnBFY3QTLUH7r+xY+dUNZQRYWGw3BKiRuPoMH3l8Fs7oZ0z/1sBum84IWC410m6WYL3wNeKv1+zZ2u+5hpan2Wm0zxw7hvg+bhEaA7fpwi3AOXzciEjFfGSneqht0+VhOWA27VL8UZ+/n22GY8UbrbESRNZw3yMMIh+HRfEjPJ+V5JnmycCscl4daG7HGe6+pfnExcbmpBAOC4od4QVVbY/fOOZLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmDccZCuC/5lF1ALCsrgbJw7LLbXB5yypJhylkZDwag=;
 b=lMc7lxNn6gdIrE6Z70cS5CbAvshEOBuAkAP+sCFMPySnzqH6nos0XqqHnmdCHm7x2rUbeZah/GyVWHY7ZVLrIPlwjJGxv/s9DTc8fTh0nlmC6anRDzWgYz25Qk3nr8IR5WsYNDgbtxqiYYxT3iZxbViiHqXS9ZFcOGLJvKtZQqA8ltN+1wqX/dnTzB4ZZjahwrHd43jkotlIVspX8rmi625TU/oS914Yf1aB3/z3lf3Az85CK1VvjSJv6wDQjV6pyDwcZWzJ4NvR1sUKI7OqPNchqdmaasO9ms7mh7Iqnofcw0UWy5EElW9Kc7m5r70Vwrjl0kqrDpJ96O4kxN++zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmDccZCuC/5lF1ALCsrgbJw7LLbXB5yypJhylkZDwag=;
 b=UR0F9W0oJ/fcIvclWpam7d4aYiyuFXh7jqtTHp1U8ppku60f0myzzBgKG6bjv7w8v3S8TgLPe+qKhkE1G1sN5PTRxD1pMu5nAfQq3PT/UUzO5eaVtW9iLMwhrKL9aSnO4Oi++nRh+OFB4onR+3pOw7xf0ax2S4muMBpWRdXfpBtTCyl0RkUEgW4N+aZGkPhh8EBy/RguEjAedBVSDHG5j9Y06CzWiAJZeGMQGCmlhVClI3d9Y1EOnceZWwILSTC/wal+sA4P+h+886u9hjP6gOg3KTbWfLvXCvSPmiHbEsBp5jc7uFk9hOCihbRFusEZ2aBdbYwaol5lqZlSdLV11w==
Received: from BY5PR17CA0025.namprd17.prod.outlook.com (2603:10b6:a03:1b8::38)
 by CH3PR12MB9250.namprd12.prod.outlook.com (2603:10b6:610:1ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 17:00:08 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::22) by BY5PR17CA0025.outlook.office365.com
 (2603:10b6:a03:1b8::38) with Microsoft SMTP Server (version=TLS1_2,
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
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:57 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:56 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 14/21] drm/nouveau/nvkm: move pci probe() fb handoff from drm
Date: Fri, 14 Jun 2024 03:00:06 +1000
Message-ID: <20240613170046.88687-15-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|CH3PR12MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 054ce8df-11bd-4851-bdea-08dc8bca47c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?67HJ7qHr4S5cmIo+T/PnIRqQhQsXh983c9NJ/+2NdPaFbd79+YKhL7qwC0pa?=
 =?us-ascii?Q?DXGkp6+vXMa+bioZKadYjVyGT1gMWmec12dyv80eEr0mTkv2QTgDFih5slND?=
 =?us-ascii?Q?3ywxxz7fuIXi0/L4391MxoE7GAiE4J6eVfGWeMirAgc5t0urXMr3RhuT3DqB?=
 =?us-ascii?Q?F38Xsbw3IRBmy4DXSqYQDz6TaJ4XvOoY6gTP5w9vJYIYNgs3JF21iFto7jFi?=
 =?us-ascii?Q?Dez5deIaEbWTHc9UnMvzeD6tOrfTM4d8TG3yv3yGX6x0ZSOY0EykpNfiGRPc?=
 =?us-ascii?Q?KGLKodzivMqX11zwVGjdiFqNOaEYfmoVBto0c5dEA5HukFG7cJNd4IiIvVqG?=
 =?us-ascii?Q?sYIHNt7tzj115eHf0ZWVc1FK34F0rzFDeTE0tdI5VVwi6MbtV/hnTVm064ga?=
 =?us-ascii?Q?hx5JHXt58axI/o4lJPt0bS7+2jJ7E6wUj+sR2euGaseJ4J13/dmuzMuYsczy?=
 =?us-ascii?Q?8fYXoiePi1Xy/9yn0BB+MGg/VRpPxl3f3WCoF0k4Gwaq8chUdVXz/Qlbqv0R?=
 =?us-ascii?Q?NRNgKeQ4onQYrISgOsp5+03kqgL28nTUC6YLqSh6EErJ0tMtPKsc9OGgsUBe?=
 =?us-ascii?Q?maA6UMBi+73jEv5Fjx+tYFaakmXC93M/cxS3pOaayyPfUdWZsrecfRXvS5US?=
 =?us-ascii?Q?LLlWU8VwoEp0fpsPJEmkZlj2FoM0F0jqdNbRu0p/Iq2d1SzaYnXy6O8Rsznh?=
 =?us-ascii?Q?ymXlHuQB/O6GVf7bJ4pnkrhhCfExoTWOSZOcgfoKuWsBNN/LmRZfACBhCMyX?=
 =?us-ascii?Q?5+3WrPgG7Gk0qoRJ5dkEXQRvgCwxzxI7dnQNTNiu8Ns4NvUW5bz3djrJwXfb?=
 =?us-ascii?Q?cYC5jvDcpdYa8v97YI+bvSDR21BlgBAe1u2ntSbYSQRundMo3tOfvPfF6Ot9?=
 =?us-ascii?Q?eS9t2Ij2rCqOeEU6kQeDgnS7We/GIeC5neSOuuGXaHF8FkIkffP5ebN8+3B6?=
 =?us-ascii?Q?xzBTfflIZFxzK4b3vnN3+t+2mQlU+JWHKNYoZHZio9uFFvSAqnOvxvKCTsqk?=
 =?us-ascii?Q?CqBn5//IKtoba2DUSqUmtAYzBIUr5E8NIt9ncyQwQGl1daRqreQg8b/HCLUw?=
 =?us-ascii?Q?zLCTP/Qkg6VssD0/HiPxxnimehalqbU3+7GAfH6vRn7jwz6sJkN9A0WnaVNm?=
 =?us-ascii?Q?WCQO+uU3Swqog9mlTULvpZKYRVdd2G36y2xM8cWZRyzovctThZMwvjY7B3FG?=
 =?us-ascii?Q?IURRkOk1HiL15BmSI6tptNwGyd6EEILTnQ76awTFxEYYq/D8ABvi9LiVDwQ1?=
 =?us-ascii?Q?V5vO6k4bQlLUV/RMtcLcqU1GunTRd+Ln06c4grn8vq6s3IbwW3MrqBdNbuXO?=
 =?us-ascii?Q?Kkd6TutxrgPG4N3bMv8pwsjX6am9PmthA5UzCdm11h8IdlqASbMVVl3emsVO?=
 =?us-ascii?Q?7Ht8ny7LiKd+jWGfoKAjxbE8N6A9uKHD/HJiwE20yXrPxzWzRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:08.3473 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054ce8df-11bd-4851-bdea-08dc8bca47c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9250
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

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  5 -----
 drivers/gpu/drm/nouveau/nvkm/device/base.c         |  6 ++++++
 drivers/gpu/drm/nouveau/nvkm/device/pci.c          | 11 +++++++++++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 3c11d3068ced..d8596fe0adea 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -89,6 +89,7 @@ struct nvkm_device_func {
 	struct nvkm_device_tegra *(*tegra)(struct nvkm_device *);
 	void *(*dtor)(struct nvkm_device *);
 	int (*preinit)(struct nvkm_device *);
+	int (*oneinit)(struct nvkm_device *);
 	int (*init)(struct nvkm_device *);
 	void (*fini)(struct nvkm_device *, bool suspend);
 	int (*irq)(struct nvkm_device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 3f1f93fa7029..be31e8ea4fee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -804,11 +804,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 
 	device = pci_get_drvdata(pdev);
 
-	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
-	if (ret)
-		return ret;
-
 	pci_set_master(pdev);
 
 	if (nouveau_atomic)
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
index 1b76c2a60799..4f8298bf71ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/base.c
@@ -2954,6 +2954,12 @@ nvkm_device_oneinit(struct nvkm_device *device)
 #undef NVKM_LAYOUT_INST
 #undef NVKM_LAYOUT_ONCE
 
+	if (device->func->oneinit) {
+		ret = device->func->oneinit(device);
+		if (ret)
+			goto done;
+	}
+
 	ret = nvkm_intr_install(device);
 done:
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 21ca094df54f..7d0ddc968246 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -26,6 +26,7 @@
 #include "acpi.h"
 #include "priv.h"
 
+#include <linux/aperture.h>
 #include <linux/vga_switcheroo.h>
 
 struct nvkm_device_pci_device {
@@ -1608,6 +1609,15 @@ nvkm_device_pci_preinit(struct nvkm_device *device)
 	return 0;
 }
 
+static int
+nvkm_device_pci_oneinit(struct nvkm_device *device)
+{
+	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
+
+	/* Remove conflicting drivers (vesafb, efifb etc). */
+	return aperture_remove_conflicting_pci_devices(pdev->pdev, "nvkm");
+}
+
 static void *
 nvkm_device_pci_dtor(struct nvkm_device *device)
 {
@@ -1621,6 +1631,7 @@ nvkm_device_pci_func = {
 	.pci = nvkm_device_pci,
 	.dtor = nvkm_device_pci_dtor,
 	.preinit = nvkm_device_pci_preinit,
+	.oneinit = nvkm_device_pci_oneinit,
 	.fini = nvkm_device_pci_fini,
 	.irq = nvkm_device_pci_irq,
 	.resource_addr = nvkm_device_pci_resource_addr,
-- 
2.44.0

