Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C760CC4A4C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480210E4A2;
	Tue, 11 Nov 2025 01:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gTHIjKlM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C010E4A2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 01:16:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+OhvsR4XtxmCNBmGdTs+Gl/Y4LEZC6FtImfzsNs0qWfmYxGIt7oXGIN2SIW1Rghm6/RrBZiXSMC0D+KqfmPXbwBGgRD0pnTLhePfujDQxbXycH7H0ElunvtKFIfCCBUF0WxwdkzSdNhNmjv3FNW4SQrPHZ6rcryXPptBhtbF/ztIgPrMENufajZwwAlDOvaqsAEhr9CW+EfFrl6nfuERnOYfAhOFhc+sPxUKSseXYCyp1iLLZ39rrLbVPcSzUhBAfx235aj/fHAiOpvn+6YOsqra0iuHfSFq5jOpEMNA/dAer1TE3jyFs2ripYJtCkSCZVzjl9Op0DrjwEIGOEn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LL2JjEBQ1ndJuOL5VoL9AxkknsE4huU5NNvRTeRHdc=;
 b=nEU5hy5QnlkL8ymw45YNT+F9+sE6oQvKejS/5kggELbEEc5pYTm0H699PXJ/D11YqdCt6WafZ+zRml0UbYPP99SE71yIyF+VSgZaflCrJgeXVJ9QJAjvniBeKkL/NSzzLB2UNKf/mPhaPr1Nwt/SwRMIEEHwKm811U1oRz6RjT80dGaGWQUwQlGjP+X++QHR5aRAk7sWF+CDsBG5f4lsJTXZB7RfSw5fLZMAqux2CMS2HIVTl56exLborTyts3nQKImcVOT1lVhMdOIuJrIOsroYplRjvNFpnS0Q18VLFoSZ3FESPsqy8qDSN7f8g0MVJVc6HHmEtq/qdrovOp1P+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LL2JjEBQ1ndJuOL5VoL9AxkknsE4huU5NNvRTeRHdc=;
 b=gTHIjKlMgReiuTsEW4S4O1iH4UH89ZJZStFEDVkl/7DCtyJBRfcgpABEYcjXxYG7xjUxc6S6bu3gdj1Z5K5Ilwg1zmOmdrYf1+PnkdTKXkPYUVnzPIsmgIE8GwR5mdvKerYHitIiygcv9hSm5rZ8S3iUf+5kcfCm8VNOtRdtfI4=
Received: from BYAPR08CA0025.namprd08.prod.outlook.com (2603:10b6:a03:100::38)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:16:11 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::61) by BYAPR08CA0025.outlook.office365.com
 (2603:10b6:a03:100::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 01:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 01:16:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:16:00 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 10 Nov 2025 17:15:59 -0800
From: David Zhang <yidong.zhang@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: David Zhang <yidong.zhang@amd.com>, <linux-kernel@vger.kernel.org>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, <lizhi.hou@amd.com>,
 "DMG Karthik" <Karthik.DMG@amd.com>, Nishad Saraf <nishads@amd.com>
Subject: [PATCH V1 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
Date: Mon, 10 Nov 2025 17:15:47 -0800
Message-ID: <20251111011550.439157-3-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111011550.439157-1-yidong.zhang@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0c9dcc-21ec-4b06-8cc4-08de20bfe676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5RaK8UwfyBWDMphygZeSR7TCI0kibrNSx0AB/YT2SfhWxp5Dy2vAth009FBb?=
 =?us-ascii?Q?03yy3FHwn0KdUDU0AkdgB3dNSaqWtmktPwN3ttzSSYnDxX/R85Pw7ryW0ndn?=
 =?us-ascii?Q?dEPkvk45yDHH0omowKCtvewfWFzGyYQKTixE0Gzm4lGRQtJ/k48TWeooEyFH?=
 =?us-ascii?Q?VIk5lnzFZeDT/pGLcCScqzAvnbiQvePzdGW2T2FOoq+5aN2phUMGCUMc4g6H?=
 =?us-ascii?Q?qhpvJLchz3pxlxsSodgggENgOKaFoeWWp7uQpIL6ZZDIqg2TAFsjZROjoMnB?=
 =?us-ascii?Q?v2PvWDRX/5hWHqq1mIYGEK2D6in9LuI3aYC7mp+Y33U4nXigPTyR7OS6Q+7r?=
 =?us-ascii?Q?vmhEa2HOfqZrzIqvosj3hV+ybA1ajuZK/buTaaRAhgR2ctPMgY5zolxlOsTn?=
 =?us-ascii?Q?brSBd9aKWja/8PDEWje0RWYGi6UT4rgF03aNaO6adK3vR0WImx0rJilD/kAz?=
 =?us-ascii?Q?GAnY0rLqq6UREOeQGxa7FwolQpbCXpcFZF5zsTLCLjytnuk1Dk/rCn2/OgPp?=
 =?us-ascii?Q?9kCqAxB+hj6BQ/7Nnilk9wExUH+NVqYaGG/gi2tyyrtzBEqT4FxseaMgTlgJ?=
 =?us-ascii?Q?LXmFHmVaLykTuMIefiG1+61q9yRWjmXsyDENUZv5f2E5xlvLhsucDl9Kau0g?=
 =?us-ascii?Q?gJVABqnKsRVVO1iZq0J5WPBK2qsLSV6DEQXr6iLirUtwmwKEVhTKbrRLcidI?=
 =?us-ascii?Q?v7T7zTj9AVeux6BGjtoGRBO/92luRyFFqekL+tRIN0tQyIeSnTupmMqwrqE/?=
 =?us-ascii?Q?6BKg4kciWcziUgANKYVUkvaFe3JM4bk/ce8uaDjBIttk/QAYxBG0sjjDg0mY?=
 =?us-ascii?Q?IExP6bK13UvC0r3ETjPptmvrZiq14D5iBoCcytjiGtbPknfWL+XMebgKGra8?=
 =?us-ascii?Q?9Mq74FLpBIgH0SDqYIb3hOI80hlL/XbfJiKgkUShYRd/wyFHEtNsrnJzrNNO?=
 =?us-ascii?Q?vgIXjJZRMiwYsVDPn2TMsRpn/a7YsRt3WwZFLjqGigy2FUL/aNogZUjYy8cN?=
 =?us-ascii?Q?gE/I72hb4jbqNh3w4CukPDP+cnZh8xiQ7Iq6vtVKptu7qg/zp3nPY6a1fwib?=
 =?us-ascii?Q?Mp+tyigheejXBXdYDgttYFRS7obCV1SrU2O94mQ7Ffv5tNn6XCBcd2fYP1uU?=
 =?us-ascii?Q?xUH3WVpCY2+zEyLrrbktEEhQEemcem3LK/KuMI7UkWHZeU+B2k9hgcVEgZS1?=
 =?us-ascii?Q?2EPh9GXtW5nKBZDe80ibuJSX9nuTNGtOfrrxFsnxgzaZAWqo2Fxoqn0Yhgkp?=
 =?us-ascii?Q?0vciSWNEarx1TJ4myj+xNmUHWr2jBOId8LPYpYGwzr+8MrFxjlkoFJzSBf3g?=
 =?us-ascii?Q?mBsNJVNK2m1ZQFIkSwdJVWvqwPDrLAqsS/hvpXRbKgwpbc7j//BOTSu8QFWi?=
 =?us-ascii?Q?SQ5/rp+fTPF2R45G5Rm9OOJbf3gWQ9tBWfJcaEADfN0GIB6P/qbgZdJcvfHK?=
 =?us-ascii?Q?W6BJnOBecziON0YRGrMNkIYnq7uLWU99ZIGh7HOOlExoG0Li4hEcNhgtZtYD?=
 =?us-ascii?Q?ELoNbRT4tS7QmEnpEq48ACPwVbuva0nVinQN8Z8ap22HeSB0tucCe7l8hbj0?=
 =?us-ascii?Q?Cx+v1/ES2JLBhtoEZKU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:16:10.9219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0c9dcc-21ec-4b06-8cc4-08de20bfe676
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776
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

This patch introduces a new PCI driver for AMD Versal-based accelerator
cards.

The driver provides basic module and PCI device initialization, based on
BAR resources used to establish a hardware queue-based ring buffer between
the PCIe host and the Versal Management Runtime (VMR) service running on
the embedded SoC. This interface enables firmware management and board
health monitoring.

Key features:
   - PCI probe and BAR resource initialization.
   - Integration with configfs for firmware management
   - Compatibility check using firmware-reported UUIDs

The base firmware image is expected under /lib/firmware/xilinx/<fw_name>
and can be programmed to the device through the configfs interface.
Firmware transfer is handled via a remote queue service (added in a later
patch).

Co-developed-by: DMG Karthik <Karthik.DMG@amd.com>
Signed-off-by: DMG Karthik <Karthik.DMG@amd.com>
Co-developed-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 MAINTAINERS                              |   5 +
 drivers/accel/Kconfig                    |   1 +
 drivers/accel/Makefile                   |   3 +-
 drivers/accel/amd_vpci/Kconfig           |  15 ++
 drivers/accel/amd_vpci/Makefile          |   6 +
 drivers/accel/amd_vpci/versal-pci-main.c | 279 +++++++++++++++++++++++
 drivers/accel/amd_vpci/versal-pci.h      |  62 +++++
 7 files changed, 370 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amd_vpci/Kconfig
 create mode 100644 drivers/accel/amd_vpci/Makefile
 create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..924a00c04646 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1257,6 +1257,11 @@ F:	drivers/spi/spi-amd-pci.c
 F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
+AMD VERSAL PCI DRIVER
+M:	Yidong Zhang <yidong.zhang@amd.com>
+S:	Supported
+F:	drivers/accel/amd_vpci/
+
 AMD XDNA DRIVER
 M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bb01cebc42bf..c82ebf9accfa 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
 	  and debugfs).
 
 source "drivers/accel/amdxdna/Kconfig"
+source "drivers/accel/amd_vpci/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index ffc3fa588666..92906c9cf3d9 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
+obj-$(CONFIG_DRM_ACCEL_AMD_VPCI)	+= amd_vpci/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
diff --git a/drivers/accel/amd_vpci/Kconfig b/drivers/accel/amd_vpci/Kconfig
new file mode 100644
index 000000000000..dcf83bf3d8e6
--- /dev/null
+++ b/drivers/accel/amd_vpci/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_AMD_VPCI
+	tristate "AMD Versal PCIe Management Driver"
+	depends on DRM_ACCEL
+	depends on PCI && HAS_IOMEM
+	select FW_LOADER
+	select CONFIGFS_FS
+	default m
+	help
+	  AMD Versal PCIe Management Driver provides management services,
+	  including download firmware, program bitstream, and communicate with
+	  the User function.
+
+	  If "M" is selected, the driver module will be versal-pci
diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
new file mode 100644
index 000000000000..03849875ad0b
--- /dev/null
+++ b/drivers/accel/amd_vpci/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
+
+versal-pci-y := \
+	versal-pci-main.o
diff --git a/drivers/accel/amd_vpci/versal-pci-main.c b/drivers/accel/amd_vpci/versal-pci-main.c
new file mode 100644
index 000000000000..4172f7ac9bd1
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-main.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/pci.h>
+
+#include "versal-pci.h"
+
+#define DRV_NAME			"amd-versal-pci"
+
+#define PCI_DEVICE_ID_V70PQ2		0x50B0
+#define PCI_DEVICE_ID_RAVE		0x5700
+#define VERSAL_XCLBIN_MAGIC_ID		"xclbin2"
+
+static inline u32 versal_pci_devid(struct versal_pci_device *vdev)
+{
+	return ((pci_domain_nr(vdev->pdev->bus) << 16) |
+		PCI_DEVID(vdev->pdev->bus->number, vdev->pdev->devfn));
+}
+
+static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
+{
+	const struct firmware *fw;
+	struct axlf *xsabin;
+	int ret;
+
+	strim(fw_name);
+
+	ret = request_firmware(&fw, fw_name, &vdev->pdev->dev);
+	if (ret) {
+		vdev_warn(vdev, "request xsabin fw %s failed %d", fw_name, ret);
+		return ret;
+	}
+
+	xsabin = (struct axlf *)fw->data;
+	if (memcmp(xsabin->magic, VERSAL_XCLBIN_MAGIC_ID, strlen(VERSAL_XCLBIN_MAGIC_ID))) {
+		vdev_err(vdev, "Invalid device firmware");
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!fw->size ||
+	    fw->size != xsabin->header.length ||
+	    fw->size < sizeof(*xsabin) ||
+	    fw->size > SZ_1G) {
+		vdev_err(vdev, "Invalid device firmware size %zu", fw->size);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!uuid_equal(&vdev->intf_uuid, &xsabin->header.rom_uuid)) {
+		vdev_err(vdev, "base shell doesn't match uuid %pUb", &xsabin->header.rom_uuid);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	/* TODO upload fw to card */
+	if (ret) {
+		vdev_err(vdev, "failed to load xsabin %s : %d", fw_name, ret);
+		goto release_firmware;
+	}
+
+	vdev_info(vdev, "Downloaded xsabin %pUb of size %lld Bytes",
+		  &xsabin->header.uuid, xsabin->header.length);
+
+release_firmware:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static inline struct versal_pci_device *item_to_vdev(struct config_item *item)
+{
+	return container_of(to_configfs_subsystem(to_config_group(item)),
+			    struct versal_pci_device, cfs_subsys);
+}
+
+static ssize_t versal_pci_cfs_config_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+	u32 config;
+	int ret;
+
+	ret = kstrtou32(page, 0, &config);
+	if (ret)
+		return -EINVAL;
+
+	if (config)
+		ret = versal_pci_load_shell(vdev, vdev->fw.name);
+
+	if (ret)
+		return -EFAULT;
+
+	return count;
+}
+CONFIGFS_ATTR_WO(versal_pci_cfs_, config);
+
+static ssize_t versal_pci_cfs_image_show(struct config_item *item, char *page)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+
+	vdev_info(vdev, "fw name: %s", vdev->fw.name);
+
+	return 0;
+}
+
+static ssize_t versal_pci_cfs_image_store(struct config_item *item,
+					  const char *page, size_t count)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+
+	count = snprintf(vdev->fw.name, sizeof(vdev->fw.name), "%s", page);
+
+	vdev_info(vdev, "fw name: %s", vdev->fw.name);
+	return count;
+}
+CONFIGFS_ATTR(versal_pci_cfs_, image);
+
+static struct configfs_attribute *versal_pci_cfs_attrs[] = {
+	&versal_pci_cfs_attr_config,
+	&versal_pci_cfs_attr_image,
+	NULL,
+};
+
+static const struct config_item_type versal_pci_cfs_table = {
+	.ct_owner = THIS_MODULE,
+	.ct_attrs = versal_pci_cfs_attrs,
+};
+
+static int versal_pci_cfs_init(struct versal_pci_device *vdev)
+{
+	struct configfs_subsystem *subsys = &vdev->cfs_subsys;
+
+	snprintf(subsys->su_group.cg_item.ci_namebuf,
+		 sizeof(subsys->su_group.cg_item.ci_namebuf),
+		 "%s%x", DRV_NAME, versal_pci_devid(vdev));
+
+	subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
+
+	config_group_init(&subsys->su_group);
+	return configfs_register_subsystem(subsys);
+}
+
+static void versal_pci_fw_fini(struct versal_pci_device *vdev)
+{
+	uuid_copy(&vdev->intf_uuid, &uuid_null);
+}
+
+static void versal_pci_cfs_fini(struct configfs_subsystem *subsys)
+{
+	configfs_unregister_subsystem(subsys);
+}
+
+static void versal_pci_device_teardown(struct versal_pci_device *vdev)
+{
+	versal_pci_cfs_fini(&vdev->cfs_subsys);
+	versal_pci_fw_fini(vdev);
+}
+
+static int versal_pci_uuid_parse(struct versal_pci_device *vdev, uuid_t *uuid)
+{
+	char str[UUID_STRING_LEN];
+	u8 i, j;
+	int len = strlen(vdev->fw_id);
+
+	/* parse uuid into a valid uuid string format */
+	for (i = 0, j = 0; i < len && i < sizeof(str); i++) {
+		str[j++] = vdev->fw_id[i];
+		if (j == 8 || j == 13 || j == 18 || j == 23)
+			str[j++] = '-';
+	}
+
+	if (uuid_parse(str, uuid)) {
+		vdev_warn(vdev, "Invalid fw_id format");
+		return -EINVAL;
+	}
+
+	vdev_info(vdev, "Interface uuid %pU", uuid);
+	return 0;
+}
+
+static int versal_pci_fw_init(struct versal_pci_device *vdev)
+{
+	int ret;
+
+	/* TODO request compatible fw_id from card */
+
+	ret = versal_pci_uuid_parse(vdev, &vdev->intf_uuid);
+
+	return ret;
+}
+
+static int versal_pci_device_setup(struct versal_pci_device *vdev)
+{
+	int ret;
+
+	ret = versal_pci_fw_init(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to init fw, err %d", ret);
+		goto comm_chan_fini;
+	}
+
+	ret = versal_pci_cfs_init(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to init configfs subsys, err %d", ret);
+		goto comm_chan_fini;
+	}
+
+	return 0;
+
+comm_chan_fini:
+
+	return ret;
+}
+
+static void versal_pci_remove(struct pci_dev *pdev)
+{
+	struct versal_pci_device *vdev = pci_get_drvdata(pdev);
+
+	versal_pci_device_teardown(vdev);
+}
+
+static int versal_pci_probe(struct pci_dev *pdev, const struct pci_device_id *pdev_id)
+{
+	struct versal_pci_device *vdev;
+	int ret;
+
+	vdev = devm_kzalloc(&pdev->dev, sizeof(*vdev), GFP_KERNEL);
+	if (!vdev)
+		return -ENOMEM;
+
+	pci_set_drvdata(pdev, vdev);
+	vdev->pdev = pdev;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to enable device %d", ret);
+		return ret;
+	}
+
+	vdev->io_regs = pcim_iomap_region(vdev->pdev, MGMT_BAR, DRV_NAME);
+	if (IS_ERR(vdev->io_regs)) {
+		vdev_err(vdev, "Failed to map RM shared memory BAR%d", MGMT_BAR);
+		return PTR_ERR(vdev->io_regs);
+	}
+
+	ret = versal_pci_device_setup(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to setup Versal device %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pci_device_id versal_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_V70PQ2), },
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_RAVE), },
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(pci, versal_pci_ids);
+
+static struct pci_driver versal_pci_driver = {
+	.name = DRV_NAME,
+	.id_table = versal_pci_ids,
+	.probe = versal_pci_probe,
+	.remove = versal_pci_remove,
+};
+
+module_pci_driver(versal_pci_driver);
+
+MODULE_DESCRIPTION("AMD Versal PCIe Management Driver");
+MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
new file mode 100644
index 000000000000..ca309aee87ad
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __VERSAL_PCI_H
+#define __VERSAL_PCI_H
+
+#include <linux/configfs.h>
+#include <linux/firmware.h>
+
+#define MGMT_BAR		0
+
+#define vdev_info(vdev, fmt, args...)					\
+	dev_info(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_warn(vdev, fmt, args...)					\
+	dev_warn(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_err(vdev, fmt, args...)					\
+	dev_err(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_dbg(vdev, fmt, args...)					\
+	dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
+
+struct versal_pci_device;
+
+struct axlf_header {
+	__u64				length;
+	__u8				reserved1[24];
+	uuid_t				rom_uuid;
+	__u8				reserved2[64];
+	uuid_t				uuid;
+	__u8				reserved3[24];
+} __packed;
+
+struct axlf {
+	__u8				magic[8];
+	__u8				reserved[296];
+	struct axlf_header		header;
+} __packed;
+
+struct fw_info {
+	__u32				opcode;
+	char				name[128];
+};
+
+struct versal_pci_device {
+	struct pci_dev			*pdev;
+
+	struct fw_info			fw;
+
+	void __iomem			*io_regs;
+	uuid_t				intf_uuid;
+	__u8				fw_id[UUID_STRING_LEN + 1];
+
+	struct configfs_subsystem	cfs_subsys;
+};
+
+#endif	/* __VERSAL_PCI_H */
-- 
2.34.1

