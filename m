Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6179907907
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75CE10EB19;
	Thu, 13 Jun 2024 17:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X2mTLYI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676A10EB06;
 Thu, 13 Jun 2024 17:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XlMKG9KWQ4pLCiVDh526P2/T4YOqX4Bu94pvz7aKJrNlwtlxyps8yG7XEIwzwEcV+gcTKEmrTqaKwANje/PSbdQmyC9VS8sptmf24YFLuTvIYLJfcEA4XsZaBTfUCRhqOKuodRIsZysmD8soNTYuE7roZ9k8ZbWEuyHn/L1gF3ew7/da6uwU1N9PIB7GHbjpwk1W4wZZSsqas+AfPsvBJiaqQbDAa+d60bZq2xNDPR5ncnPGkimcmane4EFIo8Ba2b7SezNieb9ELwDKzddrS0fz2xpwWxtd2pxQ/dQcvNr9QlGeHGVmtSZjY2Zqjrqj3NWtrA+r5NTaZ/TrKiQ9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7mn/u4ruBIHr+UJb27n0VtaZ3sXleJtxlcFeSlwRik=;
 b=iEkiyBJz0dgKCgINrXGFUi7WcsKjWhE4Kslda8bHUXlJnUEXJojHCoU5d6HO9tL+kmjHFmLnryspZy7UT1DfIwvRz6BdDY9RCiIu9Q+RBN15K1UsLwK9EshLLJuyt8gTOLoxfyFvCiHOwRCRq5ELBTI8XeUksPTu85OZWMvKdoO6rC/h6L/3tfFJb+/6UT6VQ/8rWelLqesWqyRtZZebTDNFw77v9zHSZ74S08VlGAvv7u+4LhLyCXz+LOLNFaC7sDrlTLj9Eihi4AKOcLEp3gJwVbUwMJNs/+kMYrhNpRT6BDDzvQ1ZF42iBQsLQRN+Q8Q2iBCi5tFJm2CjljrCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7mn/u4ruBIHr+UJb27n0VtaZ3sXleJtxlcFeSlwRik=;
 b=X2mTLYI9TjB4TdB0Oj5bJ4ijpwSSexTsSt4DoZv+09XXD+vIrvVLDD5QwPpw0bGvPf7GMYgNPb7K6UJBQxjNpKh+4Phayq3URoq9vXfzd6M/ieEFL/Fd+AKwaxhb2feSdtZWSw3D5I6uK463a6ERRS+iJwlVTSmagVH06EIjpZpzT98cK2726uGifbY/NL6rbkSlpXcvFmfdT0TA20YiMvgiOc4d842Di9pW26L9pLhMiPNERIuArUABQ+FOuCYFMD8DKe+2rufMZZZoW5xQrFe8qyyRK8kIwE6z+ZNtaMCmS/Vfr0JuwSr90+8rdW3/UMpaFQrABRoqWAyp6vaS3A==
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 16:59:59 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::55) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:47 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 07/21] drm/nouveau/nvkm: cleanup in nvkm_device_{pci,
 tegra}_new() on failure
Date: Fri, 14 Jun 2024 02:59:59 +1000
Message-ID: <20240613170046.88687-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa04893-8fe0-45fd-c9cf-08dc8bca42b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YrV33HABbARWe6CBRAxN7hi2pfXNgk/nwSqhxmWIO7YejhhrSpkHjlOr6OiK?=
 =?us-ascii?Q?6DMckYXBISbFrrMNzCrZypF9BoC/tvMigREi80niKR0ZiZxpzODoGXcY3tG2?=
 =?us-ascii?Q?iW4zGXDWPea9WybavCQ6oIcXNAAbzKn7jAp4fIbltR8Llz0QlJi0E/C+mJqm?=
 =?us-ascii?Q?S1fbvvCdamHtTL71X9pyOCgbmBiqHuUHbBvVakxrdX1SnQti1VFjj0REFyaZ?=
 =?us-ascii?Q?xFiWMogYDI3FQmMYFyoPutPrgITt/XJg8Ln1Cp1c4/ZN4naso0LkHzvt32Uv?=
 =?us-ascii?Q?CM8Cb502bLr8eoH0kCKTYBH8acwcq3XLJdRq5MJxtZas5qP0DrQ/JzPKZZ0F?=
 =?us-ascii?Q?7S+PDU1mLReTrDPAsKZmjiUXCOXULtsJ49q/2V5biYs17FGOEq3XqTK03cqd?=
 =?us-ascii?Q?lcI+JZAz5fQ/jOgLQGT+oXh+Eha9wNjoVnz04PecPDCULhkuSohH0TwiQGaO?=
 =?us-ascii?Q?mOcBZONk+AxTrnOZ4H46fad93aME98sYvq7MdqCbZ2fT6KyZECe/4FKu4z15?=
 =?us-ascii?Q?rZ8GnKrephWxApksWPA9yrYJgHAEJ+v7H8fsZ2OHPeEwOSQACu3QV233Ck0b?=
 =?us-ascii?Q?ojxIXM7MUegEO+7ul1fEtuBzO8rimekTqqDIunXn5M8vU+iPrlERATb9Ay2F?=
 =?us-ascii?Q?8UpUNfUJK77pgmvfiqqVNs1E+6UrBrMw6HmQQSTp2Jh9hNDGIXQ6erUp0ucy?=
 =?us-ascii?Q?/Lfx+hfNnaMb/J4BDr0fNB9xuC6kxLlGaubxcuMiAObssLg5xh2mARzof0bg?=
 =?us-ascii?Q?jEHRC5Dg3Ez9GrXVrOvZ95e8A0fLTqKMakrafYJGChf490xz+aymPYGINjPs?=
 =?us-ascii?Q?QNYveYveKH4kLxvI0P1Y9nnbMe51RscXyV2clopAVZBrFKpA08WV54UoMSWe?=
 =?us-ascii?Q?2R0NWp64PXZPw+XDgzCWOxYB9v2GGkZbXqxUdJM0a+lf0kTythTvL1P8lwju?=
 =?us-ascii?Q?j0H1iZwh1hrKvKsI/KZRIrjHFaUKngrKLb1sQQqnmCnVnsQfdlsnLXb8EhaD?=
 =?us-ascii?Q?Kf3KYAGWB+Clz1uqqWEvLphVYs95ZWLVaJZ71SP3ojozQwK4qbAmc0YqZGyz?=
 =?us-ascii?Q?wRgqSIHAErgoTvJgQaHnJDSTOXvPzkdkV877gOZQK95xdUt35Prsm2ry2MNX?=
 =?us-ascii?Q?28Bde1JStOdm0xT4DxlCs6T9mn4FMOW05+HCsZB3NZGD2jHHvTb7xZQlMbzy?=
 =?us-ascii?Q?qIz7r4HUMQaJ1SBKv7u9mxGvVmF4B1N7evUX7I9sxJfDkDqGGehXyV2ao9rQ?=
 =?us-ascii?Q?KBhn/HbqrxAei9b+Gkprvw/QhwEZT22HDHDoAIDtDpn27SfsHo0zy2FpiTMa?=
 =?us-ascii?Q?JnAkha+rODB7kpV5+oETXaVQos30MF5SkwD7i35KXXXcc2ttqmhrFSw3zfjJ?=
 =?us-ascii?Q?szdcVJTvjRwzhdTav0WrfnDIISo5vCmnUmdso1e+FEHs3b+21g=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:59.8450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa04893-8fe0-45fd-c9cf-08dc8bca42b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
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

These previously depended on the caller calling nvkm_device_del() to
cleanup if nvkm_device_*_new() fails.

That's a little odd for starters, but only the Tegra path cleaned up,
and the PCI path would have leaked the memory, FWs etc that had been
allocated as NVKM ran each subdev's ctor().

A later patch turns these into pci/platform driver probe() functions,
so they need to learn how to clean up after themselves regardless.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
 drivers/gpu/drm/nouveau/nvkm/device/pci.c   | 26 ++++++++++++++-------
 drivers/gpu/drm/nouveau/nvkm/device/tegra.c | 11 +++++----
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0bf39b05926f..6c1cfc38d8fa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1351,7 +1351,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 
 	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug, pdevice);
 	if (err)
-		goto err_free;
+		return ERR_PTR(err);
 
 	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 8bfedd79d7a5..e48f3219f047 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1633,12 +1633,9 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 	const struct nvkm_device_pci_vendor *pciv;
 	const char *name = NULL;
 	struct nvkm_device_pci *pdev;
+	struct nvkm_device *device;
 	int ret, bits;
 
-	ret = pci_enable_device(pci_dev);
-	if (ret)
-		return ret;
-
 	switch (pci_dev->vendor) {
 	case 0x10de: pcid = nvkm_device_pci_10de; break;
 	default:
@@ -1664,12 +1661,16 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 		pcid++;
 	}
 
-	if (!(pdev = kzalloc(sizeof(*pdev), GFP_KERNEL))) {
-		pci_disable_device(pci_dev);
+	if (!(pdev = kzalloc(sizeof(*pdev), GFP_KERNEL)))
 		return -ENOMEM;
-	}
-	*pdevice = &pdev->device;
 	pdev->pdev = pci_dev;
+	device = &pdev->device;
+
+	ret = pci_enable_device(pci_dev);
+	if (ret) {
+		kfree(pdev);
+		return ret;
+	}
 
 	ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
 			       pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
@@ -1682,7 +1683,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 			       &pdev->device);
 
 	if (ret)
-		return ret;
+		goto done;
 
 	/* Set DMA mask based on capabilities reported by the MMU subdev. */
 	if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
@@ -1696,5 +1697,12 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 		pdev->device.mmu->dma_bits = 32;
 	}
 
+done:
+	if (ret) {
+		nvkm_device_del(&device);
+		return ret;
+	}
+
+	*pdevice = &pdev->device;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
index bb514ccdfff4..9c3673c74b19 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
@@ -240,6 +240,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		      struct nvkm_device **pdevice)
 {
 	struct nvkm_device_tegra *tdev;
+	struct nvkm_device *device;
 	unsigned long rate;
 	int ret;
 
@@ -248,6 +249,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 
 	tdev->func = func;
 	tdev->pdev = pdev;
+	device = &tdev->device;
 
 	if (func->require_vdd) {
 		tdev->vdd = devm_regulator_get(&pdev->dev, "vdd");
@@ -311,15 +313,14 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 	ret = nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
 			       NVKM_DEVICE_TEGRA, pdev->id, NULL,
 			       &tdev->device);
-	if (ret)
-		goto powerdown;
+	if (ret) {
+		nvkm_device_del(&device);
+		return ret;
+	}
 
 	*pdevice = &tdev->device;
-
 	return 0;
 
-powerdown:
-	nvkm_device_tegra_power_down(tdev);
 remove:
 	nvkm_device_tegra_remove_iommu(tdev);
 free:
-- 
2.44.0

