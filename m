Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0F907911
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203BB10EB1A;
	Thu, 13 Jun 2024 17:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MSq7Z6AB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C693D10EB16;
 Thu, 13 Jun 2024 17:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoSVpXuBc3y23MYfClYYRe7oGSaofJ89OpalfuDTQei+gqE4ExaMbBkcZ+pXtJ8ODZCjuBsWGEb9Lgj2eFVjAAt39mWaxPORBf2/eEkLq+fX8OVORQoK1xOD7n59YewUmIO/BGKXSby5yDrr5eloLyz16W6wxu4MBF1NNQWQRpKlEhVtqXyajsePBFEMVhUWfvho168MJl8Ot0t4IfrA5Kb1UIKExfAEi0DEMkvVw+weI6SUp3NCf0ie95tb62aVSG2yUf+ZAMBEdjTgQHuV3OudG1CID/sDyNdOcvIUU3WQDpepWVUYlcUyoe6Y4M4CiK/qrv+rk1lVAiH6mZUwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHXBOY/8OiNnwAS/KQMVF3wk0PNmKvHDm0F3HCwwZ8s=;
 b=jSBUOqOt2Z8jI4B1amq7S/5OcOlQ6MFxUwNC9wVB+lEqdIYTIpRg9pOFCYmPLVlo02V8s0aztawUwkosxQ+cyOi7zf0WCRq1tQz8y3Ohs4MRhnSVx8tJCBEuWt1xKKh9xO/dYDCxeEi2JbKc69RUWfp31QI4LM9FDCx/iAHb2gCnil3TB0befiIHFa8xsZUEdfHdjBIT3ciar3gycHD3ILcPazILsamD+eajAn5x47MaoinXIjxeVbh1GREcI84G2S8dxNZdT96UifOj9BVOncS3KZyO/krBPCtKcaFAo2l0JdnKGVsCbwlwvD72uPUZyA3OCFdyJc8ZSirnAg3r5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHXBOY/8OiNnwAS/KQMVF3wk0PNmKvHDm0F3HCwwZ8s=;
 b=MSq7Z6ABXh+8VQZObLb5QS+wNuPa4RO6CC+u2Tm3icQInHg7HrPIvjMWyG9JvZRoRf2YjBUXU7VqQVFDqwMjgmRPJllJIbrf6tfqY0wWhysa+WvyGDs16PL2kvwJCJk9uaCFo8eSszduwEjuJfNW2Y9+LnBNX6J5ALIYWtO+2uY4w1hhTtHtxMoY6cbFQnIVqB+SoM6ts5l1Q8eC5fk1eFmwgyTtu5eLwx2iP/9VQ86Rzt9+JCVNIC+52/m8M/MXPcVFYAhLBxK1OcHts8h2O/8pqkjDG0JCP+pBIW5Aco9IX363umzVgQDvpR6HqbAB90ZKItTfBIAqEspdsTb+gw==
Received: from SA9PR10CA0004.namprd10.prod.outlook.com (2603:10b6:806:a7::9)
 by PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:00:05 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::20) by SA9PR10CA0004.outlook.office365.com
 (2603:10b6:806:a7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:05 +0000
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
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:48 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 08/21] drm/nouveau/nvkm: move vgaarb code from drm
Date: Fri, 14 Jun 2024 03:00:00 +1000
Message-ID: <20240613170046.88687-9-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 911626f8-7314-4c5c-fc4a-08dc8bca45e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lkjqj/wqjgNFOiPMJwU4vQjuoG/qQJzv9eHW/yQZhb4hvfg5ID0XLtvKBJ4r?=
 =?us-ascii?Q?dRVcG0cw8ZlqEVqhHfwMeuUdtf5cf0DhXVTsrdhafFXC1G+Noq1D9E6r+I2M?=
 =?us-ascii?Q?r5vANSDjqmmOAx+/KvHcnrjN0dIDWh+6iwamj3D90KWxkDSpZkKCHM3H4B6o?=
 =?us-ascii?Q?uDxmuJmx/KjQfy9gmCH8GpIb/jTQFlhLx8Na6FobqN3z6tQvZpqoosESWQC7?=
 =?us-ascii?Q?1bYtFUiR/ivEPlYOvK+VOyqQ0IgQiTu7izI3FbKUdbio/7o3ZTz2hRmf2lwd?=
 =?us-ascii?Q?JGbS5duSD8PAvMb5AGBmNxTwivMVR2ddVFM9bFxmEKGCq48j+k5CWoD90XrO?=
 =?us-ascii?Q?FWczxEX+40utEk4op424UqSKjMPb8fgugjoDG7Vm+X2WoGtPQ/jNMNoiFfpj?=
 =?us-ascii?Q?keffuXWYYgzGunwJ+JIQilf70m9CEauT7FOj4zej22ipeJGEIG0f1sb5TAyN?=
 =?us-ascii?Q?dCfINusQo0c9ojP30iOD+RV2QxgviLP0fnadEYHDYaHjE6XcY4+2nb6yu3pO?=
 =?us-ascii?Q?CjjmFqV2CgG1c6UC64/mY2KbgmvzD6B01lDREFcDYgkvuSc04C2KuzNXGx/4?=
 =?us-ascii?Q?5ukpmQGPsKUNPvG0VjbcjTp7z5OPpVn87MZPdJuFTFtjoB7ZTHy4QpCui8VT?=
 =?us-ascii?Q?VQGUCPgaIP4DszZqVLV5DuD5qOeAtbNcGNeZcOHY742e3KLNCbOjZT5o2oQo?=
 =?us-ascii?Q?mxTg1lhmiUyFIw1GSCUcFSPhS3TNl3gJOJ71CneClYbqGb2qC3x7pXrAbH5v?=
 =?us-ascii?Q?1auG6RtojL3SpPyjm5mryFF/IkKYPMJMM/VH2cRZhf0Qq+vhPxWcfns9FFIN?=
 =?us-ascii?Q?VVWfTF8iMjAa91zH4Z9Y6L7XDCheXGzwRiDjcfMoouhAh0HsXYVumO7p2s/j?=
 =?us-ascii?Q?CYmtS3ZX/yWB36H/vCgjLKYVKde2QkHq+8RD4SupmDdg281DFqWFwDjhZT+6?=
 =?us-ascii?Q?vDoQH3m7Z6JKGbl8sY10TMzY/FF6Nm24xjk4pAbwjnsZ3PeQ9xc2ZojcDzu+?=
 =?us-ascii?Q?51eSZhc+akr4f2XLCSs5avxv4yJpNYHnpDy/QhbHodmcIJ7r/Ngn9PrlVS8m?=
 =?us-ascii?Q?14dXCbXRb2C5FzeaKDUC+NpcK73yLU+wD+ncXgAoczNXwif3yxh+CJ8+pT/7?=
 =?us-ascii?Q?HXs3esTxzS1rm8cAyl5Osd5BISSasNK4DoXByEnmhzf+lAbePPGvr8663/GU?=
 =?us-ascii?Q?5mL/sZWy3Pw3sBxRRq52bu60nOlJpVqez0FDwRzDrDpUmvnWHbRVpnos911a?=
 =?us-ascii?Q?p6FR9NoEB8YWBn4zWA9yVLOcnhAlurVUbcT3qL+FCDhEsT/sDAB0BeWPgC2M?=
 =?us-ascii?Q?U4WMeKL42J7x1ykLYyS82E9ebPFwk9jtNXoxnbj9DFXdjPRqQRkuvx0dcA0W?=
 =?us-ascii?Q?asrkGv60F3rMGdil0cu2YoYvC0EMvNLMGSYgPQ0Qnzkn2rFSNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:05.0454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911626f8-7314-4c5c-fc4a-08dc8bca45e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814
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
 drivers/gpu/drm/nouveau/nouveau_vga.c         | 27 ----------------
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 83496af605a1..53b332708061 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: MIT
-#include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_fb_helper.h>
@@ -8,28 +7,6 @@
 #include "nouveau_acpi.h"
 #include "nouveau_vga.h"
 
-static unsigned int
-nouveau_vga_set_decode(struct pci_dev *pdev, bool state)
-{
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	struct nvif_device *device = &drm->device;
-
-	if (device->impl->family == NVIF_DEVICE_CURIE &&
-	    device->impl->chipset >= 0x4c)
-		nvif_wr32(device, 0x088060, state);
-	else
-	if (device->impl->chipset >= 0x40)
-		nvif_wr32(device, 0x088054, state);
-	else
-		nvif_wr32(device, 0x001854, state);
-
-	if (state)
-		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
-		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-	else
-		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
-}
-
 static void
 nouveau_switcheroo_set_state(struct pci_dev *pdev,
 			     enum vga_switcheroo_state state)
@@ -94,8 +71,6 @@ nouveau_vga_init(struct nouveau_drm *drm)
 		return;
 	pdev = to_pci_dev(dev->dev);
 
-	vga_client_register(pdev, nouveau_vga_set_decode);
-
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
 	if (pci_is_thunderbolt_attached(pdev))
 		return;
@@ -118,8 +93,6 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 		return;
 	pdev = to_pci_dev(dev->dev);
 
-	vga_client_unregister(pdev);
-
 	if (pci_is_thunderbolt_attached(pdev))
 		return;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
index 5a0de45d36ce..e4737b89cb63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -27,6 +27,8 @@
 #include <core/option.h>
 #include <core/pci.h>
 
+#include <linux/vgaarb.h>
+
 void
 nvkm_pci_msi_rearm(struct nvkm_device *device)
 {
@@ -62,6 +64,29 @@ nvkm_pci_mask(struct nvkm_pci *pci, u16 addr, u32 mask, u32 value)
 	return data;
 }
 
+#include "nouveau_drv.h"
+
+static unsigned int
+nvkm_pci_vga_set_decode(struct pci_dev *pdev, bool state)
+{
+	struct nvkm_device *device = ((struct nouveau_drm *)pci_get_drvdata(pdev))->nvkm;
+
+	if (device->card_type == NV_40 &&
+	    device->chipset >= 0x4c)
+		nvkm_wr32(device, 0x088060, state);
+	else
+	if (device->chipset >= 0x40)
+		nvkm_wr32(device, 0x088054, state);
+	else
+		nvkm_wr32(device, 0x001854, state);
+
+	if (state)
+		return VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM |
+		       VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+	else
+		return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
+}
+
 void
 nvkm_pci_rom_shadow(struct nvkm_pci *pci, bool shadow)
 {
@@ -76,11 +101,16 @@ nvkm_pci_rom_shadow(struct nvkm_pci *pci, bool shadow)
 static int
 nvkm_pci_fini(struct nvkm_subdev *subdev, bool suspend)
 {
+	struct nvkm_device_pci *pdev = subdev->device->func->pci(subdev->device);
 	struct nvkm_pci *pci = nvkm_pci(subdev);
 
+	if (!subdev->use.enabled)
+		return 0;
+
 	if (pci->agp.bridge)
 		nvkm_agp_fini(pci);
 
+	vga_client_unregister(pdev->pdev);
 	return 0;
 }
 
@@ -111,6 +141,7 @@ nvkm_pci_oneinit(struct nvkm_subdev *subdev)
 static int
 nvkm_pci_init(struct nvkm_subdev *subdev)
 {
+	struct nvkm_device_pci *pdev = subdev->device->func->pci(subdev->device);
 	struct nvkm_pci *pci = nvkm_pci(subdev);
 	int ret;
 
@@ -131,6 +162,7 @@ nvkm_pci_init(struct nvkm_subdev *subdev)
 	if (pci->msi)
 		pci->func->msi_rearm(pci);
 
+	vga_client_register(pdev->pdev, nvkm_pci_vga_set_decode);
 	return 0;
 }
 
-- 
2.44.0

