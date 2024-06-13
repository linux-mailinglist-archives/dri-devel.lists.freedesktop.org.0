Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F82A907922
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1234A10EB2D;
	Thu, 13 Jun 2024 17:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XdBPFMZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B8B10EB1A;
 Thu, 13 Jun 2024 17:00:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP9FuqcoHPWngXyQjpVNn5QRzsEBK43ckaQ8vS0fcupqbo4ovo5VCfTJavinc4adjQjQ7C9PHrQ5OPNa9pPCZLcIpTGtAeXZmYd4Vtwo2iyqsozp8qI6Zcxm5A74NY9Pp1igqumPhPsbhlqtl/x1mr1FL6vt2Y9BeJ/dpbqHjUSTD9z0edKt3ndOOgnggbzExwt0V1lhMziuDat71VEL9g/nzM7Wd6xate9oeilEARRpkSwwk8/Wo+krjl4fyA8ItRDz/ZA1clGfQ7L0CluHYxPCXhgBYJ66ya2tM03gVEnORtvATfCMs7DL/2E782S3LGy/qyZ97LA/CKZ+ve1m6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV1vuEFMovDfxPLy3ODtP2O9GA0nTTNiggIUDi0TUCI=;
 b=imnKXpc2zpk/DbSUcdjeN6EEVKPRq1YIxl/x56ZReJqGAoYdJEj9N9Q20GAh/JPVYfdERbz5OFtYPLWlWFCdzehwQMXlB8tVY481J/iS8N5keVC8UBVVloONQn1CNzb4Y5ykZ1TA8gBo1qI00rh0jiAnmjQWr/8kGT6AD3BR4FShxTLtSo0GPggfDXvInBvI/DFr9BkyfmKNwCmPLx4xqm7om0B0jxwisN7r1SkFvyLZxmYRZMmH7/EeBrlxX2Rs180QoiKc+lJ87NvWNPM2wFNEv0CeIZz6hZ1iitgV3N87CiUJw+co/3NZH31HoChyet6zJ0JcLaR8afaTcyNtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV1vuEFMovDfxPLy3ODtP2O9GA0nTTNiggIUDi0TUCI=;
 b=XdBPFMZuJr0OI650WOJFsGdgNEogA5BXhIN3nz42koOLd3X8B9UJ7+CVpfJckVgLbIZYiimeGyGXFmY6qXvSlJVbGl7NQ9pXkmr1bwjiUmdQhflhmKQTk+VvzJDVMv11kAtbn0LKe2BTSRYAizO4RtvgLR3DPY75Gv9ErX+FCqSNVGofoPYPLUQmIHT9W2yUdBGrm/UpKvVVseJsL+jyODcL4KSrFts6xV/TYizHpt9YcDGsOOgmhFVuQLh2vBvirTQt1+28mM+GZNZrAnxULoQCPU3uNehC+Cu7iGaRb0ZjlBSw5hCJxrUrPxP8IlSFp9NAxknCeKEgblfOzZiVaQ==
Received: from SN4PR0501CA0066.namprd05.prod.outlook.com
 (2603:10b6:803:41::43) by DM4PR12MB6109.namprd12.prod.outlook.com
 (2603:10b6:8:ae::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 17:00:13 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::59) by SN4PR0501CA0066.outlook.office365.com
 (2603:10b6:803:41::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Thu, 13 Jun 2024 17:00:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:00:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:00:00 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 16/21] drm/nouveau/nvkm: move pci probe() runpm quirk from drm
Date: Fri, 14 Jun 2024 03:00:08 +1000
Message-ID: <20240613170046.88687-17-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DM4PR12MB6109:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb20acc-d755-420c-c325-08dc8bca4acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHNOVFd2MzNJeWtmVXEvcjVibUw3dms1aGtKbGxrZ0Q4eldPQzFPOUZ6TnlG?=
 =?utf-8?B?UGlDQW1oVFhlT1IzQStDTTVyZmpUNk93RzNmZ0o5MUhBUGVYNmxDVlFzYmk4?=
 =?utf-8?B?NU5NNC9XNzQ4ZCtyYld2VkxuYkxxaCtieW5oZGdnalYybk5EbXoybm4rZWZQ?=
 =?utf-8?B?WnZXN2lKN0hlOWl3Z3gzWDh1NHdtMDVHY3grVG9HK0UrYlZkVnVZdmdCbkYr?=
 =?utf-8?B?eTBzUEhPWTZPSi9yZFUxQWF3L3V2QjN4KzVMUEJvcnRjVE1JQVAzNncxQWsy?=
 =?utf-8?B?TldkYnNDbVlqeWhvVHczSkkvTG9hb24zRjVPUFhsSlVPanRNeEs2bzdROWw3?=
 =?utf-8?B?bmNsdGRCVGdrQ3h0VDNDMktPMVZOcSsyZDlPVlpNTGNWRHUyNlZHUjE5Nlgw?=
 =?utf-8?B?VjRORlkwSm9QTEM5ZmlNZG5JQjNOR2RZL3ZlQ2Y2TmZNQnBlOW1iNzVuUmMz?=
 =?utf-8?B?ZGxOd0J0N2JVeC9CYVBUUFZpbDJicStBUndiWUNEb0NyeGxuaDNSYVBQSC93?=
 =?utf-8?B?L1JLTHpLZkNBSTVHK1FteG53MDZWdnkzSUlBQUdnMDAxVUpZdGtXRWVhcDVS?=
 =?utf-8?B?TUJuaTBxbHY2MmhFS0QzSzQ4NnlLamZoYXlSNHdXUHBlV05rbUVNNFdjTllx?=
 =?utf-8?B?cTR0UG8vVXpiZHo5NkdzcU9va05qRGNjSk84a0NIK3h3eTM1SjRNam50V2V3?=
 =?utf-8?B?QUd0eVpmdFVveEl6ZE1xK2QwSjArdG50RGRpTko5ZmJQay81bnV1eWE5cjZP?=
 =?utf-8?B?ZVZnRmZIeWhNb2NhRFRPOEdnam9na25rK2tOaVg0a21LRGZKdjk4YlBsKzgy?=
 =?utf-8?B?WVBEb0YxQ1JrS2pKK3ZQS29mTzZydjZvYktYTU1iYTFkVVUzSDV4VDMzOUt0?=
 =?utf-8?B?T0RGQmI1L0V6MUxSNjZpMjBSSWpGV0hYbkozQkRXOVVLeThGdXBZSFVUQ3h3?=
 =?utf-8?B?cHRIV1BWZFpHejdiOStEcWZxcnoxNmg0RXovb0pVektTRWRRWWc1cFFVRkxj?=
 =?utf-8?B?MFdON3NVWVQ1bk9rLzkwTm5lNzhzb0J6YlBGUStCSTBoL2trUnlYVWE3ZVRE?=
 =?utf-8?B?K3NjVmFXY0Vua1ZQL0o1NjVvT3dKZFBBUGkxemhjZ1F6WURvbk9ma2tCRHpB?=
 =?utf-8?B?S1hIRGVSdTFieUZKcWJoR3Nqc1ZqRjdCc1J0cFp1VmZaZUVSWU95LzJnRURL?=
 =?utf-8?B?Q3BWNmpkUEI3ZUJoYWlzQXkzS05EVWJvSG00REpKRmZLcktxaTZLbW5ZbUc1?=
 =?utf-8?B?OWJUZUh0VHlSQmxZVEp6UXRZak9ZSnhCTXc5dnUrTkhVQllzeTNzNDljUTB4?=
 =?utf-8?B?cnMvdkdLOUoyL3pGaDBURzVjNk1RV0dzR2EvV0JKa09ibk5BcW9MS2lBenRF?=
 =?utf-8?B?TFZoSDd2MXJIQlY3aE1vLzlNd1p2Q3NnU0pWRU9UTnhldTFIOFRKY2VMRFZR?=
 =?utf-8?B?dElNQ2QwRlBvY3ZETTErcEpGbEMzL00zS2xJS0ZlVHhmcUg0alpzZCtOU1dE?=
 =?utf-8?B?TWlnU2pudWRRd1Q3VGRPbnFJcHBiQys2SngwWVBKdG9IRG9JdksvY1VmZjVv?=
 =?utf-8?B?MFovVFNxaGttdU1EaGFEVzJVT2xJVVNpaWRKSnVtcjZ2WkZnOUxEMlNqbVRY?=
 =?utf-8?B?TTI0TTYveVljbmh3M3lDejNFVnJkdVhUTk00RGNHRjBhVnJxYngzVWJoMzkx?=
 =?utf-8?B?MW9NWGl5cmIxY1kvS0JSbGQ4T0F6VDdsaWJFNGlXTTVzRk9Oejd3c0dqQVpH?=
 =?utf-8?B?VHpvbm8xbEdwQkJoVmVERDdRVnRRNCtZMUtZcWN0KzBKL2NOWWszS0p5TEU2?=
 =?utf-8?B?ZmpSeUNYeUw3bTBmNDROUnJUalJPWVhVWFArM250Q1VseVQrcGs5a2JCdXhI?=
 =?utf-8?B?eE13a3g4MXVEa3owdzNKOE1HTi9KOGwrRDBHc3RNTXcyQnc9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:00:13.3015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb20acc-d755-420c-c325-08dc8bca4acd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6109
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
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |  2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 61 ------------------
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 -
 drivers/gpu/drm/nouveau/nvkm/device/pci.c     | 62 +++++++++++++++++++
 4 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
index 0797225ab038..95deea8c65ff 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
@@ -7,6 +7,8 @@ struct nvkm_device_pci {
 	struct nvkm_device device;
 	struct pci_dev *pdev;
 
+	u8 old_pm_cap;
+
 	struct dev_pm_domain vga_pm_domain;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4bcfc2291c4d..76eddf172bb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -731,63 +731,6 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	return ret ? ERR_PTR(ret) : drm;
 }
 
-/*
- * On some Intel PCIe bridge controllers doing a
- * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
- * Skipping the intermediate D3hot step seems to make it work again. This is
- * probably caused by not meeting the expectation the involved AML code has
- * when the GPU is put into D3hot state before invoking it.
- *
- * This leads to various manifestations of this issue:
- *  - AML code execution to power on the GPU hits an infinite loop (as the
- *    code waits on device memory to change).
- *  - kernel crashes, as all PCI reads return -1, which most code isn't able
- *    to handle well enough.
- *
- * In all cases dmesg will contain at least one line like this:
- * 'nouveau 0000:01:00.0: Refused to change power state, currently in D3'
- * followed by a lot of nouveau timeouts.
- *
- * In the \_SB.PCI0.PEG0.PG00._OFF code deeper down writes bit 0x80 to the not
- * documented PCI config space register 0x248 of the Intel PCIe bridge
- * controller (0x1901) in order to change the state of the PCIe link between
- * the PCIe port and the GPU. There are alternative code paths using other
- * registers, which seem to work fine (executed pre Windows 8):
- *  - 0xbc bit 0x20 (publicly available documentation claims 'reserved')
- *  - 0xb0 bit 0x10 (link disable)
- * Changing the conditions inside the firmware by poking into the relevant
- * addresses does resolve the issue, but it seemed to be ACPI private memory
- * and not any device accessible memory at all, so there is no portable way of
- * changing the conditions.
- * On a XPS 9560 that means bits [0,3] on \CPEX need to be cleared.
- *
- * The only systems where this behavior can be seen are hybrid graphics laptops
- * with a secondary Nvidia Maxwell, Pascal or Turing GPU. It's unclear whether
- * this issue only occurs in combination with listed Intel PCIe bridge
- * controllers and the mentioned GPUs or other devices as well.
- *
- * documentation on the PCIe bridge controller can be found in the
- * "7th Generation Intel® Processor Families for H Platforms Datasheet Volume 2"
- * Section "12 PCI Express* Controller (x16) Registers"
- */
-
-static void quirk_broken_nv_runpm(struct pci_dev *pdev)
-{
-	struct nouveau_drm *drm = pci_get_drvdata(pdev);
-	struct pci_dev *bridge = pci_upstream_bridge(pdev);
-
-	if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
-		return;
-
-	switch (bridge->device) {
-	case 0x1901:
-		drm->old_pm_cap = pdev->pm_cap;
-		pdev->pm_cap = 0;
-		NV_INFO(drm, "Disabling PCI power management to avoid bug\n");
-		break;
-	}
-}
-
 static int nouveau_drm_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *pent)
 {
@@ -822,7 +765,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	else
 		drm_fbdev_ttm_setup(drm->dev, 32);
 
-	quirk_broken_nv_runpm(pdev);
 	return 0;
 
 fail_drm:
@@ -846,9 +788,6 @@ nouveau_drm_remove(struct pci_dev *pdev)
 {
 	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 
-	/* revert our workaround */
-	if (drm->old_pm_cap)
-		pdev->pm_cap = drm->old_pm_cap;
 	nouveau_drm_device_remove(drm);
 
 	nvkm_device_pci_driver.remove(pdev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b44f0d408ccc..9ca0f6ab4359 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -218,8 +218,6 @@ struct nouveau_drm {
 	 */
 	struct mutex clients_lock;
 
-	u8 old_pm_cap;
-
 	struct {
 		struct agp_bridge_data *bridge;
 		u32 base;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
index d9b8e3bc4169..d454d56a7909 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
@@ -1598,6 +1598,11 @@ static void *
 nvkm_device_pci_dtor(struct nvkm_device *device)
 {
 	struct nvkm_device_pci *pdev = nvkm_device_pci(device);
+
+	/* revert our workaround */
+	if (pdev->old_pm_cap)
+		pdev->pdev->pm_cap = pdev->old_pm_cap;
+
 	pci_disable_device(pdev->pdev);
 	return pdev;
 }
@@ -1624,6 +1629,62 @@ nvkm_device_pci_remove(struct pci_dev *dev)
 	nvkm_device_del(&device);
 }
 
+/*
+ * On some Intel PCIe bridge controllers doing a
+ * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
+ * Skipping the intermediate D3hot step seems to make it work again. This is
+ * probably caused by not meeting the expectation the involved AML code has
+ * when the GPU is put into D3hot state before invoking it.
+ *
+ * This leads to various manifestations of this issue:
+ *  - AML code execution to power on the GPU hits an infinite loop (as the
+ *    code waits on device memory to change).
+ *  - kernel crashes, as all PCI reads return -1, which most code isn't able
+ *    to handle well enough.
+ *
+ * In all cases dmesg will contain at least one line like this:
+ * 'nouveau 0000:01:00.0: Refused to change power state, currently in D3'
+ * followed by a lot of nouveau timeouts.
+ *
+ * In the \_SB.PCI0.PEG0.PG00._OFF code deeper down writes bit 0x80 to the not
+ * documented PCI config space register 0x248 of the Intel PCIe bridge
+ * controller (0x1901) in order to change the state of the PCIe link between
+ * the PCIe port and the GPU. There are alternative code paths using other
+ * registers, which seem to work fine (executed pre Windows 8):
+ *  - 0xbc bit 0x20 (publicly available documentation claims 'reserved')
+ *  - 0xb0 bit 0x10 (link disable)
+ * Changing the conditions inside the firmware by poking into the relevant
+ * addresses does resolve the issue, but it seemed to be ACPI private memory
+ * and not any device accessible memory at all, so there is no portable way of
+ * changing the conditions.
+ * On a XPS 9560 that means bits [0,3] on \CPEX need to be cleared.
+ *
+ * The only systems where this behavior can be seen are hybrid graphics laptops
+ * with a secondary Nvidia Maxwell, Pascal or Turing GPU. It's unclear whether
+ * this issue only occurs in combination with listed Intel PCIe bridge
+ * controllers and the mentioned GPUs or other devices as well.
+ *
+ * documentation on the PCIe bridge controller can be found in the
+ * "7th Generation Intel® Processor Families for H Platforms Datasheet Volume 2"
+ * Section "12 PCI Express* Controller (x16) Registers"
+ */
+
+static void quirk_broken_nv_runpm(struct nvkm_device_pci *pdev)
+{
+	struct pci_dev *bridge = pci_upstream_bridge(pdev->pdev);
+
+	if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
+		return;
+
+	switch (bridge->device) {
+	case 0x1901:
+		pdev->old_pm_cap = pdev->pdev->pm_cap;
+		pdev->pdev->pm_cap = 0;
+		nvdev_info(&pdev->device, "Disabling PCI power management to avoid bug\n");
+		break;
+	}
+}
+
 static int
 nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
@@ -1701,6 +1762,7 @@ nvkm_device_pci_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 		pdev->device.mmu->dma_bits = 32;
 	}
 
+	quirk_broken_nv_runpm(pdev);
 done:
 	if (ret) {
 		nvkm_device_del(&device);
-- 
2.44.0

