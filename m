Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D581A907926
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28FC10EB31;
	Thu, 13 Jun 2024 17:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F8G6kbPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB0810EB1A;
 Thu, 13 Jun 2024 17:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azbszUqifooAcR/Dzn0Xs7a88WjZBfN5EgdrZHnfzfQCF9tHU/TSI005p3/WMlxUKfMLpeG8ZjqpmH8HqegctFRGAAni/Q1eNz+O6QSckwi7rQmFm0cxgGkpkXuQQqId8gPFgqCw24rbN1T8gcdw8i5VAXuFIct/FFyok1HH4GnDTVJn7eUMaz6yGwhN6wyl1WApmm5uQ0l8YvnQJtI4zW9n6aN26kT9HVnaj0z1z3dUj/P05pFn7DtD7rX/i59U49ZBzGSZCMG1xtBlz3JwTwq32N9vjkz8kMCCflfQTbXbD8/ZNFeEGWWSBTiJXf2f1GfB4jE/0RlegeDbJJ9Thg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxs56OHAtYKzW75XmP6d5140RXeRJTnKfiLbOZ6opJA=;
 b=XVl7VGCeLaQhLHxhsdIt1SR+p1wsJ3XVC6VJHlJlFH4lo/qr6DWUBLpePdINueCcgcY6a4yt73cgOFG5yU4xVmLYmBYruI8LWIMujBJiJm5sZCHzp1sN+XPSa43eC2D28Xhbxnptr/N6eEv4XZJbpAeD/mV5FxPZDGwJnR9uNlfGlWSO2vxNHofbeZNEOwz9awRvA3hVRJ8TOfvXQz6rFhx28bo2e5kQ9ujVETM0UYdG1jFwmGjHRRjdc7ufeTZL/f0OBZPOvjWYfYXSm76V7hlJ35keUHP+ZaRGN9voFIllxB3GoB5ud/a0TIlxkrrIbnNpsGmkxeAc7w+zwn8v8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxs56OHAtYKzW75XmP6d5140RXeRJTnKfiLbOZ6opJA=;
 b=F8G6kbPYclslddziDtz0XBl3JQbGzKhOoY/YxpSp3atO7AjtfxNj4THriw/FwFV1kTHCRvj325+wnIPuvJ12jVmZOSaONOpf7OshdEEEaUb7ChDmCJIhRB40rc5JLcv5+sN97kUKWI8aV8VWvWTn/xwZa132VX7Dz5ZcANWGDKyvfLFe2kYtPU8gA9taZrX+uLKFEScc3SkP8/VtFrDZQIqlN2HnF6WWXQ51vPeXxhmyPOchcmnE/9XkyA8WQdqc30aAvpHOwMx+riKBLsu0GL+tC3vSwOEMwoMC86c5orXMh8QrCP09E25Kt3Ee5j2BeN9ZXxzSE9dZomWmFQtPuw==
Received: from BYAPR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:74::34)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Thu, 13 Jun
 2024 17:00:10 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:74:cafe::9a) by BYAPR05CA0057.outlook.office365.com
 (2603:10b6:a03:74::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:59 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 15/21] drm/nouveau/nvkm: move pci probe() enable/disable
 handling from drm
Date: Fri, 14 Jun 2024 03:00:07 +1000
Message-ID: <20240613170046.88687-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 814a15ca-2790-440e-1aeb-08dc8bca48a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1G19HoSyq3GMqtZum88PXT/d8CXUNEiT3cmZb5kxz8PtB2ao541uqmqhIq6T?=
 =?us-ascii?Q?LX3CYyvm9dIaAewKh8VCgRZITockUi0lWoQ8Xr9eMl/DAfwQWaP7HLAonXaF?=
 =?us-ascii?Q?jhSXVlxM0EjRx2kOPsuTTsrtXMiAZhbG1frQw8Mdt3zTOefJF7HqHViq26FN?=
 =?us-ascii?Q?A7DtBjsgrFaIDIep0weZxk7YaG0Ld7BQJVgVztg42OydYI5Hb+qJ6MuGYksa?=
 =?us-ascii?Q?IQ8TGIC6862MRkQ8W5QAc63PgVI5GXGF18u7SPVfjtCnvx0YUoC7mAjzI9Lt?=
 =?us-ascii?Q?V+wVikUC9YbMVyyXLUNdPpeAv5jbn0/M5/Fs/cg+zWW2uCUZ/tWkk6fE9yaP?=
 =?us-ascii?Q?FwN6KVdnPsWaUgghCwG2Z4nF4Er9hXp2Ccd8Te+BzlhYAEEvTlNqjTgAlCYq?=
 =?us-ascii?Q?Vie/7mpfD0OLuqPYlp6R3uVd+BLrQqe1H75brKS0JXDQ9w33ClwYGp0jKiEZ?=
 =?us-ascii?Q?g2jasMlK/3+mAYIyTOcRZRpqI1KJSjQeFAXtd9/JgZ1kiCDMKjkfFICcAS/N?=
 =?us-ascii?Q?IZ1iGPoj2EdQJMqnx1uNq7ZAhrshO8d4l78fU1dlLpQOMNTdSxintt6iyPiC?=
 =?us-ascii?Q?pwVjQO7WY8k4xcu1aDKY0XsXPHZeI5uBcTNT4O47O9Cx8RvXzfq/IuYRnzTY?=
 =?us-ascii?Q?BqRu74iQSlEKDKaQ6xDZndTo270sXAh7q7neVmjtTw9mKeJYxc2pSzDj3AeQ?=
 =?us-ascii?Q?EtY1Tp49QOVTfabXguQcfmal9engrtRNTo6pjGhrwJ2jCSzoHZbRGKzv02k7?=
 =?us-ascii?Q?wz3pKPd9WTRcaYkuYKZEKrH+Kdmg28ZnnaEI9zVp+ph5bUJM+YF2EosPkgvO?=
 =?us-ascii?Q?bqHGTVUpgs1WATcaKkLwMtQgMi69EJgGp0HG2nd+nmyByWA8iqCoucjwHNDa?=
 =?us-ascii?Q?nd/WpCnJrANJGmpj+kaPFV6ZzM07oBn+1WcgoWSOa+9sXPVFOYdCbJIUB6xZ?=
 =?us-ascii?Q?j3jbiRnTYhMNJPG8k721AOexuCNQvcpShKEDGFTOSdWvYFzsRBTGBgCYL1To?=
 =?us-ascii?Q?1YmXbagf/lx3d/lKOeSA6i3o1JaRr4Ok7yRsBfEavRPWp7kuRcxjibC4xXwb?=
 =?us-ascii?Q?DQDwu736AdGh6eJeewfhAs97gQ/MB4z61XoZUgsvtZMNc66icrQAsPzbbMSN?=
 =?us-ascii?Q?GuYhcuMYWX/rLGlIYLnB4S+VejcwfWzp9vxRaV//l+QhTiuWMZozdjeW+Uef?=
 =?us-ascii?Q?qZJyO0tMEVUo22+HVndYL2xPdXCQx2M2TuAEfnL6lUMzHSiceWoB+++VXrBH?=
 =?us-ascii?Q?mX5X4WbK/hrB4n2TSLATV+ZC4JXg1Me+iiWRoIbH31fI1oFzI5VF4JU70Cwn?=
 =?us-ascii?Q?DYKbV1hBGT/7QrwAyIm8FgQBV160Ez6BzNXn8/OHsCVUg7tbRY6BR+G5QaM6?=
 =?us-ascii?Q?oyBGVcyCcvn8pNEe28/t870Q3L1CmBLR2avNM+H+46RGzyG7Ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:09.8020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 814a15ca-2790-440e-1aeb-08dc8bca48a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |  1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 11 +-------
 drivers/gpu/drm/nouveau/nvkm/device/pci.c     | 28 ++-----------------
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
index b9e10dad6ee9..0797225ab038 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
@@ -6,7 +6,6 @@
 struct nvkm_device_pci {
 	struct nvkm_device device;
 	struct pci_dev *pdev;
-	bool suspend;
 
 	struct dev_pm_domain vga_pm_domain;
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index be31e8ea4fee..4bcfc2291c4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -804,8 +804,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 
 	device = pci_get_drvdata(pdev);
 
-	pci_set_master(pdev);
-
 	if (nouveau_atomic)
 		driver_pci.driver_features |= DRIVER_ATOMIC;
 
@@ -815,13 +813,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		goto fail_nvkm;
 	}
 
-	ret = pci_enable_device(pdev);
-	if (ret)
-		goto fail_drm;
-
 	ret = nouveau_drm_device_init(drm);
 	if (ret)
-		goto fail_pci;
+		goto fail_drm;
 
 	if (drm->device.impl->ram_size <= 32 * 1024 * 1024)
 		drm_fbdev_ttm_setup(drm->dev, 8);
@@ -831,8 +825,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	quirk_broken_nv_runpm(pdev);
 	return 0;
 
-fail_pci:
-	pci_disable_device(pdev);
 fail_drm:
 	nouveau_drm_device_del(drm);
 fail_nvkm:
@@ -858,7 +850,6 @@ nouveau_drm_remove(struct pci_dev *pdev)
 	if (drm->old_pm_cap)
 		pdev->pm_cap = drm->old_pm_cap;
 	nouveau_drm_device_remove(drm);
-	pci_disable_device(pdev);
 
 	nvkm_device_pci_driver.remove(pdev);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index 7d0ddc968246..d9b8e3bc4169 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1585,30 +1585,6 @@ nvkm_device_pci_irq(struct nvkm_device *device)
 	return nvkm_device_pci(device)->pdev->irq;
 }
 
-static void
-nvkm_device_pci_fini(struct nvkm_device *device, bool suspend)
-{
-	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
-	if (suspend) {
-		pci_disable_device(pdev->pdev);
-		pdev->suspend = true;
-	}
-}
-
-static int
-nvkm_device_pci_preinit(struct nvkm_device *device)
-{
-	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
-	if (pdev->suspend) {
-		int ret = pci_enable_device(pdev->pdev);
-		if (ret)
-			return ret;
-		pci_set_master(pdev->pdev);
-		pdev->suspend = false;
-	}
-	return 0;
-}
-
 static int
 nvkm_device_pci_oneinit(struct nvkm_device *device)
 {
@@ -1630,9 +1606,7 @@ static const struct nvkm_device_func
 nvkm_device_pci_func = {
 	.pci = nvkm_device_pci,
 	.dtor = nvkm_device_pci_dtor,
-	.preinit = nvkm_device_pci_preinit,
 	.oneinit = nvkm_device_pci_oneinit,
-	.fini = nvkm_device_pci_fini,
 	.irq = nvkm_device_pci_irq,
 	.resource_addr = nvkm_device_pci_resource_addr,
 	.resource_size = nvkm_device_pci_resource_size,
@@ -1700,6 +1674,8 @@ nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 		return ret;
 	}
 
+	pci_set_master(pci_dev);
+
 	ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
 			       pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
 			       pci_find_capability(pci_dev, PCI_CAP_ID_AGP) ?
-- 
2.44.0

