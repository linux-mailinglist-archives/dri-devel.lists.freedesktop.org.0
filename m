Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8479A6F37
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE8310E557;
	Mon, 21 Oct 2024 16:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3e2f1Wo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F5010E568
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSP67KdUwXLaZjBfSFv+WghOggV6RKOsv4xAxr2p8Y4huAMEJrz7sgOXwUAcn6ASCOnP7kzvXo3qQYEYUTHxuxnigZGkmRGGy/IAVBvM2aczJwjEkV7a/9hut8vn/8RE9DyYz9BAG1aAI/ozc2ERr9NJqVqSzbG1td+4z8PjOBaIWxqdJFY7D5SK0wxSystrvcvhxXPdmvS/DNXjnUSFeEzNlBvlHILk8JmgKlCnaRdObZDxliC3hPbPHeDxaQT59AukN9TRqrPsfjpeSj78NH8Spn80UaT9fQJMOLBDIQaz4U5MYYoU3W/rf3WFTDQ4rgx9uFldIDN1V79m0y+Nww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfDRUaEBKf34eG4ZYqjiL+3DoAjWRuD8cOWIoC/FOTE=;
 b=AMGJMumdCzScYDqbidi5Z5ZGRNZ0g4Tj4PoivZirfBOBt3TN4Rd8EqeVpHVaBGxJz/qCzwMj7W8fz/kmuxy4HqcZwH7tWQiVFcZGdkkmuiZSpoeiztKQPA1eZC5u0YxvtI1G5BiQA0cPcM9VXMVCgQ5/DD/+1IRD19kHFg69arKNsuTvPG4UerZkGnRu89+sRINRjvsS9SezUOeKygomV1nGWALpZmVbpotEHkVxi+21gDsXolt9zTRrzrxvDmx0PSDpjvS1ewGs5zkO7u/157FBHlfI2DcFs5jzkTL8++ji9HExlAAgWfWIs0/+LYwmMyA1NBCPrswfAoYOTYVT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfDRUaEBKf34eG4ZYqjiL+3DoAjWRuD8cOWIoC/FOTE=;
 b=3e2f1Wo9MQh4AFmxgHUjKvk6Gule2RFzsHBgr11XOjpXVHRe09mxnTPV2GdOg0XlQvaHZ/Mz0FlCqdPIQp9tTzQlxOy/NOUYKsm/6bdwvasCMJhfZppoc73DJVBXVFoeFsVp617NAH3RTwZ8TQnY6+3lUuQz1BPBNkBwoR0ncVU=
Received: from SJ0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:33a::29)
 by SA1PR12MB8844.namprd12.prod.outlook.com (2603:10b6:806:378::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 21 Oct
 2024 16:19:52 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::27) by SJ0PR03CA0024.outlook.office365.com
 (2603:10b6:a03:33a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 16:19:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:19:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:50 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 11:19:49 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 George Yang <George.Yang@amd.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH V5 02/10] accel/amdxdna: Add a new driver for AMD AI Engine
Date: Mon, 21 Oct 2024 09:19:23 -0700
Message-ID: <20241021161931.3701754-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021161931.3701754-1-lizhi.hou@amd.com>
References: <20241021161931.3701754-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA1PR12MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9c5a59-d49a-43c4-5b6c-08dcf1ec30fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YDkjo0Xjo4A9P6Xs8zKboFS1swbVB0WWFQf4Skh4Y6n67FI5d/GsbHvsz8da?=
 =?us-ascii?Q?dWdbFJIZTFJog2sObxDK2pe99MWCPHhJPIHqCsk9jbHNqfvdoace1LbMGJP6?=
 =?us-ascii?Q?NYm3SEopVmx4qnJBMAC2VVMOXjNhCO+7yodG71fYmXWOU5pqNVNCTaoPKtBS?=
 =?us-ascii?Q?oXzi4tymjT7K5h+XwqA1XB0D/jPf2X++GKtxcWhSilx3uON3sp6g76hWJOBM?=
 =?us-ascii?Q?3BFXitjZ87J6EYOihqiip3uscYgy1w9cX4T3vi7LDMLD1Pbr/bVEWeUfkiHx?=
 =?us-ascii?Q?or9c8ffe5hZm/k8xXYB1/t93IcSxt7lc3Ssnlzii27iGdmPqYnjq8dN9qh8f?=
 =?us-ascii?Q?6yY+y6l3RpZnFgPRJRj//q1M015casX3cPQvVa20ytLHa1+LWLXhRItXQUzT?=
 =?us-ascii?Q?7D2zpl0sTOLkzLYlnYAcswCguco8KcQ9uDdp21fnQz9+e9R2JgdI3+R55+SY?=
 =?us-ascii?Q?leF7PgLOlmYFUo7jdzgEy4bTxtjb13/e8HT6tdnJg1q5uoiIVk5QG17QYV7A?=
 =?us-ascii?Q?+n36bllwFdGZr2iy4HZZmTu+3nryQSmzmD73eyoUIWnHKmbDPx0ZWagIXf/d?=
 =?us-ascii?Q?4ptDdvtvkVNQbJwUIpqKTUbL49nsF3VL2oRhCDBQu0UKR9hKQa3EkRAtynzy?=
 =?us-ascii?Q?/JYYXQBJ0J4MdHvKw3sAC2U8hIRKaitR06FNTHjIk1K4hNe6Ed+Ad0mq7KDe?=
 =?us-ascii?Q?VV9xyDGfQAEnkH3t/kTwja+UvJxXt2twcOuD50M2MZ0GpfEzCBlnGQRF4dVO?=
 =?us-ascii?Q?T/9kfPtbNQGCZQ0plJYLQXqOOPQLoNJRj+yuPcdC0aHq815KSXHHhUQiyhsH?=
 =?us-ascii?Q?NjOByZ9AEJ1voErkaBpPfmThKkD9Bfq/5oxxuQGA9DszoUiHpdYvldYn2UsM?=
 =?us-ascii?Q?980hHpYHN06L+JYqsbHDd+XpBXM030SNmwX5H9+3i4CM6phNfXiyHdDnzpU0?=
 =?us-ascii?Q?GMQnh9blVWQ31A/TS4CFYpxPVEtGOfqx2C4ozp2w1qzD7Pdvp0GA48Bs6nRp?=
 =?us-ascii?Q?+xmyaRu4kkv/QM6FqudfsK/ZVfoBG76lPvJbu/1PSiHdyOSrwJlyA/4NJqLi?=
 =?us-ascii?Q?8VUQu/nEufJvC50UmLZP6m+dW33MVuJoAsYLRwCzS4JhOYXkQgOM3EW+asRB?=
 =?us-ascii?Q?5T6o3xteWFtlz1lXtlkM4n1RDsb0C8SVWVA5ueFO/qfBZ5cJuIc6Fn86oykw?=
 =?us-ascii?Q?PdO/ZL3uaftQ98WFvzXh1Rycy5gV0MXowq8zTTF+/PrIBUyALvxFKArQGqD9?=
 =?us-ascii?Q?je8gxYQUiP3qqknJD4Z8idcoQ/nhroRl5dEVJ8yl+u5PotuyELGGMZjCplYX?=
 =?us-ascii?Q?zb3GQP4YGGK1DVCRqlQvC4aCb2EGg5JVnf7o824HERXA53MJoRUkJQsP39BJ?=
 =?us-ascii?Q?L2TYKr4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:19:51.4182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9c5a59-d49a-43c4-5b6c-08dcf1ec30fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8844
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

AMD AI Engine forms the core of AMD NPU and can be used for accelerating
machine learning applications.

Add the driver to support AI Engine integrated to AMD CPU.
Only very basic functionalities are added.
  - module and PCI device initialization
  - firmware load
  - power up
  - low level hardware initialization

Co-developed-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Signed-off-by: Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>
Co-developed-by: George Yang <George.Yang@amd.com>
Signed-off-by: George Yang <George.Yang@amd.com>
Co-developed-by: Min Ma <min.ma@amd.com>
Signed-off-by: Min Ma <min.ma@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 MAINTAINERS                             |   9 ++
 drivers/accel/Kconfig                   |   1 +
 drivers/accel/Makefile                  |   1 +
 drivers/accel/amdxdna/Kconfig           |  15 ++
 drivers/accel/amdxdna/Makefile          |  13 ++
 drivers/accel/amdxdna/TODO              |   5 +
 drivers/accel/amdxdna/aie2_pci.c        | 184 ++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 130 +++++++++++++++++
 drivers/accel/amdxdna/aie2_psp.c        | 141 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_smu.c        | 117 +++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 128 +++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  76 ++++++++++
 drivers/accel/amdxdna/amdxdna_sysfs.c   |  51 +++++++
 drivers/accel/amdxdna/npu1_regs.c       |  99 +++++++++++++
 drivers/accel/amdxdna/npu2_regs.c       | 116 +++++++++++++++
 drivers/accel/amdxdna/npu4_regs.c       | 116 +++++++++++++++
 drivers/accel/amdxdna/npu5_regs.c       | 116 +++++++++++++++
 include/uapi/drm/amdxdna_accel.h        |  24 ++++
 18 files changed, 1342 insertions(+)
 create mode 100644 drivers/accel/amdxdna/Kconfig
 create mode 100644 drivers/accel/amdxdna/Makefile
 create mode 100644 drivers/accel/amdxdna/TODO
 create mode 100644 drivers/accel/amdxdna/aie2_pci.c
 create mode 100644 drivers/accel/amdxdna/aie2_pci.h
 create mode 100644 drivers/accel/amdxdna/aie2_psp.c
 create mode 100644 drivers/accel/amdxdna/aie2_smu.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
 create mode 100644 drivers/accel/amdxdna/npu1_regs.c
 create mode 100644 drivers/accel/amdxdna/npu2_regs.c
 create mode 100644 drivers/accel/amdxdna/npu4_regs.c
 create mode 100644 drivers/accel/amdxdna/npu5_regs.c
 create mode 100644 include/uapi/drm/amdxdna_accel.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ad507f49324..997cbcad8e3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1185,6 +1185,15 @@ M:	Sanjay R Mehta <sanju.mehta@amd.com>
 S:	Maintained
 F:	drivers/spi/spi-amd.c
 
+AMD XDNA DRIVER
+M:	Min Ma <min.ma@amd.com>
+M:	Lizhi Hou <lizhi.hou@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/accel/amdxdna/
+F:	include/uapi/drm/amdxdna_accel.h
+
 AMD XGBE DRIVER
 M:	"Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 64065fb8922b..5b9490367a39 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -24,6 +24,7 @@ menuconfig DRM_ACCEL
 	  different device files, called accel/accel* (in /dev, sysfs
 	  and debugfs).
 
+source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index ab3df932937f..a301fb6089d4 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
diff --git a/drivers/accel/amdxdna/Kconfig b/drivers/accel/amdxdna/Kconfig
new file mode 100644
index 000000000000..b6f4c364dd6b
--- /dev/null
+++ b/drivers/accel/amdxdna/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_AMDXDNA
+	tristate "AMD AI Engine"
+	depends on AMD_IOMMU
+	depends on DRM_ACCEL
+	depends on PCI && HAS_IOMEM
+	depends on X86_64
+	select FW_LOADER
+	help
+	  Choose this option to enable support for NPU integrated into AMD
+	  client CPUs like AMD Ryzen AI 300 Series. AMD NPU can be used to
+	  accelerate machine learning applications.
+
+	  If "M" is selected, the driver module will be amdxdna.
diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
new file mode 100644
index 000000000000..1dee0cba8390
--- /dev/null
+++ b/drivers/accel/amdxdna/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+amdxdna-y := \
+	aie2_pci.o \
+	aie2_psp.o \
+	aie2_smu.o \
+	amdxdna_pci_drv.o \
+	amdxdna_sysfs.o \
+	npu1_regs.o \
+	npu2_regs.o \
+	npu4_regs.o \
+	npu5_regs.o
+obj-$(CONFIG_DRM_ACCEL_AMDXDNA) = amdxdna.o
diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
new file mode 100644
index 000000000000..a130259f5f70
--- /dev/null
+++ b/drivers/accel/amdxdna/TODO
@@ -0,0 +1,5 @@
+- Replace idr with xa
+- Add import and export BO support
+- Add debugfs support
+- Add debug BO support
+- Improve power management
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
new file mode 100644
index 000000000000..f36549293053
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <linux/errno.h>
+#include <linux/firmware.h>
+#include <linux/iommu.h>
+#include <linux/pci.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+static void aie2_hw_stop(struct amdxdna_dev *xdna)
+{
+	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
+
+	aie2_psp_stop(ndev->psp_hdl);
+	aie2_smu_fini(ndev);
+	pci_disable_device(pdev);
+}
+
+static int aie2_hw_start(struct amdxdna_dev *xdna)
+{
+	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
+	int ret;
+
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
+		return ret;
+	}
+	pci_set_master(pdev);
+
+	ret = aie2_smu_init(ndev);
+	if (ret) {
+		XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
+		goto disable_dev;
+	}
+
+	ret = aie2_psp_start(ndev->psp_hdl);
+	if (ret) {
+		XDNA_ERR(xdna, "failed to start psp, ret %d", ret);
+		goto fini_smu;
+	}
+
+	return 0;
+
+fini_smu:
+	aie2_smu_fini(ndev);
+disable_dev:
+	pci_disable_device(pdev);
+
+	return ret;
+}
+
+static int aie2_init(struct amdxdna_dev *xdna)
+{
+	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	struct amdxdna_dev_hdl *ndev;
+	struct psp_config psp_conf;
+	const struct firmware *fw;
+	void __iomem * const *tbl;
+	int i, bars, nvec, ret;
+
+	ndev = drmm_kzalloc(&xdna->ddev, sizeof(*ndev), GFP_KERNEL);
+	if (!ndev)
+		return -ENOMEM;
+
+	ndev->priv = xdna->dev_info->dev_priv;
+	ndev->xdna = xdna;
+
+	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
+	if (ret) {
+		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
+			 ndev->priv->fw_path, ret);
+		return ret;
+	}
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		XDNA_ERR(xdna, "pcim enable device failed, ret %d", ret);
+		goto release_fw;
+	}
+
+	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	for (i = 0; i < PSP_MAX_REGS; i++) {
+		if (!(BIT(PSP_REG_BAR(ndev, i)) && bars)) {
+			XDNA_ERR(xdna, "does not get pci bar%d",
+				 PSP_REG_BAR(ndev, i));
+			ret = -EINVAL;
+			goto release_fw;
+		}
+	}
+
+	ret = pcim_iomap_regions(pdev, bars, "amdxdna-npu");
+	if (ret) {
+		XDNA_ERR(xdna, "map regions failed, ret %d", ret);
+		goto release_fw;
+	}
+
+	tbl = pcim_iomap_table(pdev);
+	if (!tbl) {
+		XDNA_ERR(xdna, "Cannot get iomap table");
+		ret = -ENOMEM;
+		goto release_fw;
+	}
+	ndev->sram_base = tbl[xdna->dev_info->sram_bar];
+	ndev->smu_base = tbl[xdna->dev_info->smu_bar];
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
+		goto release_fw;
+	}
+
+	nvec = pci_msix_vec_count(pdev);
+	if (nvec <= 0) {
+		XDNA_ERR(xdna, "does not get number of interrupt vector");
+		ret = -EINVAL;
+		goto release_fw;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSIX);
+	if (ret < 0) {
+		XDNA_ERR(xdna, "failed to alloc irq vectors, ret %d", ret);
+		goto release_fw;
+	}
+
+	ret = iommu_dev_enable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
+	if (ret) {
+		XDNA_ERR(xdna, "Enable PASID failed, ret %d", ret);
+		goto free_irq;
+	}
+
+	psp_conf.fw_size = fw->size;
+	psp_conf.fw_buf = fw->data;
+	for (i = 0; i < PSP_MAX_REGS; i++)
+		psp_conf.psp_regs[i] = tbl[PSP_REG_BAR(ndev, i)] + PSP_REG_OFF(ndev, i);
+	ndev->psp_hdl = aie2m_psp_create(&xdna->ddev, &psp_conf);
+	if (!ndev->psp_hdl) {
+		XDNA_ERR(xdna, "failed to create psp");
+		ret = -ENOMEM;
+		goto disable_sva;
+	}
+	xdna->dev_handle = ndev;
+
+	ret = aie2_hw_start(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "start npu failed, ret %d", ret);
+		goto disable_sva;
+	}
+
+	release_firmware(fw);
+	return 0;
+
+disable_sva:
+	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
+free_irq:
+	pci_free_irq_vectors(pdev);
+release_fw:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static void aie2_fini(struct amdxdna_dev *xdna)
+{
+	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+
+	aie2_hw_stop(xdna);
+	iommu_dev_disable_feature(&pdev->dev, IOMMU_DEV_FEAT_SVA);
+	pci_free_irq_vectors(pdev);
+}
+
+const struct amdxdna_dev_ops aie2_ops = {
+	.init           = aie2_init,
+	.fini           = aie2_fini,
+};
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
new file mode 100644
index 000000000000..34f344b4b662
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AIE2_PCI_H_
+#define _AIE2_PCI_H_
+
+#define AIE2_INTERVAL	20000	/* us */
+#define AIE2_TIMEOUT	1000000	/* us */
+
+/* Firmware determines device memory base address and size */
+#define AIE2_DEVM_BASE	0x4000000
+#define AIE2_DEVM_SIZE	SZ_64M
+
+#define NDEV2PDEV(ndev) (to_pci_dev((ndev)->xdna->ddev.dev))
+
+#define AIE2_SRAM_OFF(ndev, addr) ((addr) - (ndev)->priv->sram_dev_addr)
+#define AIE2_MBOX_OFF(ndev, addr) ((addr) - (ndev)->priv->mbox_dev_addr)
+
+#define PSP_REG_BAR(ndev, idx) ((ndev)->priv->psp_regs_off[(idx)].bar_idx)
+#define PSP_REG_OFF(ndev, idx) ((ndev)->priv->psp_regs_off[(idx)].offset)
+#define SRAM_REG_OFF(ndev, idx) ((ndev)->priv->sram_offs[(idx)].offset)
+
+#define SMU_REG(ndev, idx) \
+({ \
+	typeof(ndev) _ndev = ndev; \
+	((_ndev)->smu_base + (_ndev)->priv->smu_regs_off[(idx)].offset); \
+})
+#define SRAM_GET_ADDR(ndev, idx) \
+({ \
+	typeof(ndev) _ndev = ndev; \
+	((_ndev)->sram_base + SRAM_REG_OFF((_ndev), (idx))); \
+})
+
+#define SMU_MPNPUCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_mpnpuclk_freq_max)
+#define SMU_HCLK_FREQ_MAX(ndev) ((ndev)->priv->smu_hclk_freq_max)
+
+enum aie2_smu_reg_idx {
+	SMU_CMD_REG = 0,
+	SMU_ARG_REG,
+	SMU_INTR_REG,
+	SMU_RESP_REG,
+	SMU_OUT_REG,
+	SMU_MAX_REGS /* Keep this at the end */
+};
+
+enum aie2_sram_reg_idx {
+	MBOX_CHANN_OFF = 0,
+	FW_ALIVE_OFF,
+	SRAM_MAX_INDEX /* Keep this at the end */
+};
+
+enum psp_reg_idx {
+	PSP_CMD_REG = 0,
+	PSP_ARG0_REG,
+	PSP_ARG1_REG,
+	PSP_ARG2_REG,
+	PSP_NUM_IN_REGS, /* number of input registers */
+	PSP_INTR_REG = PSP_NUM_IN_REGS,
+	PSP_STATUS_REG,
+	PSP_RESP_REG,
+	PSP_MAX_REGS /* Keep this at the end */
+};
+
+struct psp_config {
+	const void	*fw_buf;
+	u32		fw_size;
+	void __iomem	*psp_regs[PSP_MAX_REGS];
+};
+
+struct clock_entry {
+	char name[16];
+	u32 freq_mhz;
+};
+
+struct rt_config {
+	u32	type;
+	u32	value;
+};
+
+struct amdxdna_dev_hdl {
+	struct amdxdna_dev		*xdna;
+	const struct amdxdna_dev_priv	*priv;
+	void			__iomem *sram_base;
+	void			__iomem *smu_base;
+	struct psp_device		*psp_hdl;
+	struct clock_entry		mp_npu_clock;
+	struct clock_entry		h_clock;
+};
+
+#define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
+	[reg_name] = {bar##_BAR_INDEX, (reg_addr) - bar##_BAR_BASE}
+
+struct aie2_bar_off_pair {
+	int	bar_idx;
+	u32	offset;
+};
+
+struct amdxdna_dev_priv {
+	const char			*fw_path;
+	u64				protocol_major;
+	u64				protocol_minor;
+	struct rt_config		rt_config;
+#define COL_ALIGN_NONE   0
+#define COL_ALIGN_NATURE 1
+	u32				col_align;
+	u32				mbox_dev_addr;
+	/* If mbox_size is 0, use BAR size. See MBOX_SIZE macro */
+	u32				mbox_size;
+	u32				sram_dev_addr;
+	struct aie2_bar_off_pair	sram_offs[SRAM_MAX_INDEX];
+	struct aie2_bar_off_pair	psp_regs_off[PSP_MAX_REGS];
+	struct aie2_bar_off_pair	smu_regs_off[SMU_MAX_REGS];
+	u32				smu_mpnpuclk_freq_max;
+	u32				smu_hclk_freq_max;
+};
+
+extern const struct amdxdna_dev_ops aie2_ops;
+
+/* aie2_smu.c */
+int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
+void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
+
+/* aie2_psp.c */
+struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
+int aie2_psp_start(struct psp_device *psp);
+void aie2_psp_stop(struct psp_device *psp);
+
+#endif /* _AIE2_PCI_H_ */
diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
new file mode 100644
index 000000000000..c87ca322e206
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+#include <linux/iopoll.h>
+
+#include "aie2_pci.h"
+
+#define PSP_STATUS_READY	BIT(31)
+
+/* PSP commands */
+#define PSP_VALIDATE		1
+#define PSP_START		2
+#define PSP_RELEASE_TMR		3
+
+/* PSP special arguments */
+#define PSP_START_COPY_FW	1
+
+/* PSP response error code */
+#define PSP_ERROR_CANCEL	0xFFFF0002
+#define PSP_ERROR_BAD_STATE	0xFFFF0007
+
+#define PSP_FW_ALIGN		0x10000
+#define PSP_POLL_INTERVAL	20000	/* us */
+#define PSP_POLL_TIMEOUT	1000000	/* us */
+
+#define PSP_REG(p, reg) ((p)->psp_regs[reg])
+
+struct psp_device {
+	struct drm_device	*ddev;
+	struct psp_config	conf;
+	u32			fw_buf_sz;
+	u64			fw_paddr;
+	void			*fw_buffer;
+	void __iomem		*psp_regs[PSP_MAX_REGS];
+};
+
+static int psp_exec(struct psp_device *psp, u32 *reg_vals)
+{
+	u32 resp_code;
+	int ret, i;
+	u32 ready;
+
+	/* Write command and argument registers */
+	for (i = 0; i < PSP_NUM_IN_REGS; i++)
+		writel(reg_vals[i], PSP_REG(psp, i));
+
+	/* clear and set PSP INTR register to kick off */
+	writel(0, PSP_REG(psp, PSP_INTR_REG));
+	writel(1, PSP_REG(psp, PSP_INTR_REG));
+
+	/* PSP should be busy. Wait for ready, so we know task is done. */
+	ret = readx_poll_timeout(readl, PSP_REG(psp, PSP_STATUS_REG), ready,
+				 FIELD_GET(PSP_STATUS_READY, ready),
+				 PSP_POLL_INTERVAL, PSP_POLL_TIMEOUT);
+	if (ret) {
+		drm_err(psp->ddev, "PSP is not ready, ret 0x%x", ret);
+		return ret;
+	}
+
+	resp_code = readl(PSP_REG(psp, PSP_RESP_REG));
+	if (resp_code) {
+		drm_err(psp->ddev, "fw return error 0x%x", resp_code);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+void aie2_psp_stop(struct psp_device *psp)
+{
+	u32 reg_vals[PSP_NUM_IN_REGS] = { PSP_RELEASE_TMR, };
+	int ret;
+
+	ret = psp_exec(psp, reg_vals);
+	if (ret)
+		drm_err(psp->ddev, "release tmr failed, ret %d", ret);
+}
+
+int aie2_psp_start(struct psp_device *psp)
+{
+	u32 reg_vals[PSP_NUM_IN_REGS];
+	int ret;
+
+	reg_vals[0] = PSP_VALIDATE;
+	reg_vals[1] = lower_32_bits(psp->fw_paddr);
+	reg_vals[2] = upper_32_bits(psp->fw_paddr);
+	reg_vals[3] = psp->fw_buf_sz;
+
+	ret = psp_exec(psp, reg_vals);
+	if (ret) {
+		drm_err(psp->ddev, "failed to validate fw, ret %d", ret);
+		return ret;
+	}
+
+	memset(reg_vals, 0, sizeof(reg_vals));
+	reg_vals[0] = PSP_START;
+	reg_vals[1] = PSP_START_COPY_FW;
+	ret = psp_exec(psp, reg_vals);
+	if (ret) {
+		drm_err(psp->ddev, "failed to start fw, ret %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf)
+{
+	struct psp_device *psp;
+	u64 offset;
+
+	psp = drmm_kzalloc(ddev, sizeof(*psp), GFP_KERNEL);
+	if (!psp)
+		return NULL;
+
+	psp->ddev = ddev;
+	memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
+
+	psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
+	psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL);
+	if (!psp->fw_buffer) {
+		drm_err(ddev, "no memory for fw buffer");
+		return NULL;
+	}
+
+	/*
+	 * AMD Platform Security Processor(PSP) requires host physical
+	 * address to load NPU firmware.
+	 */
+	psp->fw_paddr = virt_to_phys(psp->fw_buffer);
+	offset = ALIGN(psp->fw_paddr, PSP_FW_ALIGN) - psp->fw_paddr;
+	psp->fw_paddr += offset;
+	memcpy(psp->fw_buffer + offset, conf->fw_buf, conf->fw_size);
+
+	return psp;
+}
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
new file mode 100644
index 000000000000..3fa7064649aa
--- /dev/null
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <linux/iopoll.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+#define SMU_RESULT_OK		1
+
+/* SMU commands */
+#define AIE2_SMU_POWER_ON		0x3
+#define AIE2_SMU_POWER_OFF		0x4
+#define AIE2_SMU_SET_MPNPUCLK_FREQ	0x5
+#define AIE2_SMU_SET_HCLK_FREQ		0x6
+
+static int aie2_smu_exec(struct amdxdna_dev_hdl *ndev, u32 reg_cmd, u32 reg_arg)
+{
+	u32 resp;
+	int ret;
+
+	writel(0, SMU_REG(ndev, SMU_RESP_REG));
+	writel(reg_arg, SMU_REG(ndev, SMU_ARG_REG));
+	writel(reg_cmd, SMU_REG(ndev, SMU_CMD_REG));
+
+	/* Clear and set SMU_INTR_REG to kick off */
+	writel(0, SMU_REG(ndev, SMU_INTR_REG));
+	writel(1, SMU_REG(ndev, SMU_INTR_REG));
+
+	ret = readx_poll_timeout(readl, SMU_REG(ndev, SMU_RESP_REG), resp,
+				 resp, AIE2_INTERVAL, AIE2_TIMEOUT);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "smu cmd %d timed out", reg_cmd);
+		return ret;
+	}
+
+	if (resp != SMU_RESULT_OK) {
+		XDNA_ERR(ndev->xdna, "smu cmd %d failed, 0x%x", reg_cmd, resp);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aie2_smu_set_mpnpu_clock_freq(struct amdxdna_dev_hdl *ndev, u32 freq_mhz)
+{
+	int ret;
+
+	if (!freq_mhz || freq_mhz > SMU_MPNPUCLK_FREQ_MAX(ndev)) {
+		XDNA_ERR(ndev->xdna, "invalid mpnpu clock freq %d", freq_mhz);
+		return -EINVAL;
+	}
+
+	ndev->mp_npu_clock.freq_mhz = freq_mhz;
+	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ, freq_mhz);
+	if (!ret)
+		XDNA_INFO_ONCE(ndev->xdna, "set mpnpu_clock = %d mhz", freq_mhz);
+
+	return ret;
+}
+
+static int aie2_smu_set_hclock_freq(struct amdxdna_dev_hdl *ndev, u32 freq_mhz)
+{
+	int ret;
+
+	if (!freq_mhz || freq_mhz > SMU_HCLK_FREQ_MAX(ndev)) {
+		XDNA_ERR(ndev->xdna, "invalid hclock freq %d", freq_mhz);
+		return -EINVAL;
+	}
+
+	ndev->h_clock.freq_mhz = freq_mhz;
+	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HCLK_FREQ, freq_mhz);
+	if (!ret)
+		XDNA_INFO_ONCE(ndev->xdna, "set npu_hclock = %d mhz", freq_mhz);
+
+	return ret;
+}
+
+int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
+{
+	int ret;
+
+	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0);
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
+		return ret;
+	}
+
+	ret = aie2_smu_set_mpnpu_clock_freq(ndev, SMU_MPNPUCLK_FREQ_MAX(ndev));
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Set mpnpu clk freq failed, ret %d", ret);
+		return ret;
+	}
+	snprintf(ndev->mp_npu_clock.name, sizeof(ndev->mp_npu_clock.name), "MP-NPU Clock");
+
+	ret = aie2_smu_set_hclock_freq(ndev, SMU_HCLK_FREQ_MAX(ndev));
+	if (ret) {
+		XDNA_ERR(ndev->xdna, "Set hclk freq failed, ret %d", ret);
+		return ret;
+	}
+	snprintf(ndev->h_clock.name, sizeof(ndev->h_clock.name), "H Clock");
+
+	return 0;
+}
+
+void aie2_smu_fini(struct amdxdna_dev_hdl *ndev)
+{
+	int ret;
+
+	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0);
+	if (ret)
+		XDNA_ERR(ndev->xdna, "Power off failed, ret %d", ret);
+}
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
new file mode 100644
index 000000000000..7a5945854e26
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_accel.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
+#include <linux/pci.h>
+
+#include "amdxdna_pci_drv.h"
+
+/*
+ * Bind the driver base on (vendor_id, device_id) pair and later use the
+ * (device_id, rev_id) pair as a key to select the devices. The devices with
+ * same device_id have very similar interface to host driver.
+ */
+static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x1502) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x17f0) },
+	{0}
+};
+
+MODULE_DEVICE_TABLE(pci, pci_ids);
+
+static const struct amdxdna_device_id amdxdna_ids[] = {
+	{ 0x1502, 0x0,  &dev_npu1_info },
+	{ 0x17f0, 0x0,  &dev_npu2_info },
+	{ 0x17f0, 0x10, &dev_npu4_info },
+	{ 0x17f0, 0x11, &dev_npu5_info },
+	{0}
+};
+
+DEFINE_DRM_ACCEL_FOPS(amdxdna_fops);
+
+const struct drm_driver amdxdna_drm_drv = {
+	.driver_features = DRIVER_GEM | DRIVER_COMPUTE_ACCEL,
+	.fops = &amdxdna_fops,
+	.name = "amdxdna_accel_driver",
+	.desc = "AMD XDNA DRM implementation",
+};
+
+static const struct amdxdna_dev_info *
+amdxdna_get_dev_info(struct pci_dev *pdev)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(amdxdna_ids); i++) {
+		if (pdev->device == amdxdna_ids[i].device &&
+		    pdev->revision == amdxdna_ids[i].revision)
+			return amdxdna_ids[i].dev_info;
+	}
+	return NULL;
+}
+
+static int amdxdna_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct amdxdna_dev *xdna;
+	int ret;
+
+	xdna = devm_drm_dev_alloc(&pdev->dev, &amdxdna_drm_drv, typeof(*xdna), ddev);
+	if (IS_ERR(xdna))
+		return PTR_ERR(xdna);
+
+	xdna->dev_info = amdxdna_get_dev_info(pdev);
+	if (!xdna->dev_info)
+		return -ENODEV;
+
+	drmm_mutex_init(&xdna->ddev, &xdna->dev_lock);
+	pci_set_drvdata(pdev, xdna);
+
+	mutex_lock(&xdna->dev_lock);
+	ret = xdna->dev_info->ops->init(xdna);
+	mutex_unlock(&xdna->dev_lock);
+	if (ret) {
+		XDNA_ERR(xdna, "Hardware init failed, ret %d", ret);
+		return ret;
+	}
+
+	ret = amdxdna_sysfs_init(xdna);
+	if (ret) {
+		XDNA_ERR(xdna, "Create amdxdna attrs failed: %d", ret);
+		goto failed_dev_fini;
+	}
+
+	ret = drm_dev_register(&xdna->ddev, 0);
+	if (ret) {
+		XDNA_ERR(xdna, "DRM register failed, ret %d", ret);
+		goto failed_sysfs_fini;
+	}
+
+	return 0;
+
+failed_sysfs_fini:
+	amdxdna_sysfs_fini(xdna);
+failed_dev_fini:
+	mutex_lock(&xdna->dev_lock);
+	xdna->dev_info->ops->fini(xdna);
+	mutex_unlock(&xdna->dev_lock);
+	return ret;
+}
+
+static void amdxdna_remove(struct pci_dev *pdev)
+{
+	struct amdxdna_dev *xdna = pci_get_drvdata(pdev);
+
+	drm_dev_unplug(&xdna->ddev);
+	amdxdna_sysfs_fini(xdna);
+
+	mutex_lock(&xdna->dev_lock);
+	xdna->dev_info->ops->fini(xdna);
+	mutex_unlock(&xdna->dev_lock);
+}
+
+static struct pci_driver amdxdna_pci_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = pci_ids,
+	.probe = amdxdna_probe,
+	.remove = amdxdna_remove,
+};
+
+module_pci_driver(amdxdna_pci_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
+MODULE_DESCRIPTION("amdxdna driver");
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
new file mode 100644
index 000000000000..2f1a1c2441f9
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_PCI_DRV_H_
+#define _AMDXDNA_PCI_DRV_H_
+
+#define XDNA_INFO(xdna, fmt, args...)	drm_info(&(xdna)->ddev, fmt, ##args)
+#define XDNA_WARN(xdna, fmt, args...)	drm_warn(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
+#define XDNA_ERR(xdna, fmt, args...)	drm_err(&(xdna)->ddev, "%s: "fmt, __func__, ##args)
+#define XDNA_DBG(xdna, fmt, args...)	drm_dbg(&(xdna)->ddev, fmt, ##args)
+#define XDNA_INFO_ONCE(xdna, fmt, args...) drm_info_once(&(xdna)->ddev, fmt, ##args)
+
+#define to_xdna_dev(drm_dev) \
+	((struct amdxdna_dev *)container_of(drm_dev, struct amdxdna_dev, ddev))
+
+extern const struct drm_driver amdxdna_drm_drv;
+
+struct amdxdna_dev;
+
+/*
+ * struct amdxdna_dev_ops - Device hardware operation callbacks
+ */
+struct amdxdna_dev_ops {
+	int (*init)(struct amdxdna_dev *xdna);
+	void (*fini)(struct amdxdna_dev *xdna);
+};
+
+/*
+ * struct amdxdna_dev_info - Device hardware information
+ * Record device static information, like reg, mbox, PSP, SMU bar index
+ */
+struct amdxdna_dev_info {
+	int				reg_bar;
+	int				mbox_bar;
+	int				sram_bar;
+	int				psp_bar;
+	int				smu_bar;
+	int				device_type;
+	int				first_col;
+	u32				dev_mem_buf_shift;
+	u64				dev_mem_base;
+	size_t				dev_mem_size;
+	char				*vbnv;
+	const struct amdxdna_dev_priv	*dev_priv;
+	const struct amdxdna_dev_ops	*ops;
+};
+
+struct amdxdna_dev {
+	struct drm_device		ddev;
+	struct amdxdna_dev_hdl		*dev_handle;
+	const struct amdxdna_dev_info	*dev_info;
+
+	struct mutex			dev_lock; /* per device lock */
+};
+
+/*
+ * struct amdxdna_device_id - PCI device info
+ */
+struct amdxdna_device_id {
+	unsigned short device;
+	u8 revision;
+	const struct amdxdna_dev_info *dev_info;
+};
+
+/* Add device info below */
+extern const struct amdxdna_dev_info dev_npu1_info;
+extern const struct amdxdna_dev_info dev_npu2_info;
+extern const struct amdxdna_dev_info dev_npu4_info;
+extern const struct amdxdna_dev_info dev_npu5_info;
+
+int amdxdna_sysfs_init(struct amdxdna_dev *xdna);
+void amdxdna_sysfs_fini(struct amdxdna_dev *xdna);
+
+#endif /* _AMDXDNA_PCI_DRV_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
new file mode 100644
index 000000000000..5dd652fcf9d4
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include "amdxdna_pci_drv.h"
+
+static ssize_t vbnv_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amdxdna_dev *xdna = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", xdna->dev_info->vbnv);
+}
+static DEVICE_ATTR_RO(vbnv);
+
+static ssize_t device_type_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amdxdna_dev *xdna = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", xdna->dev_info->device_type);
+}
+static DEVICE_ATTR_RO(device_type);
+
+static struct attribute *amdxdna_attrs[] = {
+	&dev_attr_device_type.attr,
+	&dev_attr_vbnv.attr,
+	NULL,
+};
+
+static struct attribute_group amdxdna_attr_group = {
+	.attrs = amdxdna_attrs,
+};
+
+int amdxdna_sysfs_init(struct amdxdna_dev *xdna)
+{
+	int ret;
+
+	ret = sysfs_create_group(&xdna->ddev.dev->kobj, &amdxdna_attr_group);
+	if (ret)
+		XDNA_ERR(xdna, "Create attr group failed");
+
+	return ret;
+}
+
+void amdxdna_sysfs_fini(struct amdxdna_dev *xdna)
+{
+	sysfs_remove_group(&xdna->ddev.dev->kobj, &amdxdna_attr_group);
+}
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
new file mode 100644
index 000000000000..858b31a82888
--- /dev/null
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <linux/sizes.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+/* Address definition from NPU1 docs */
+#define MPNPU_PUB_SEC_INTR		0x3010090
+#define MPNPU_PUB_PWRMGMT_INTR		0x3010094
+#define MPNPU_PUB_SCRATCH2		0x30100A0
+#define MPNPU_PUB_SCRATCH3		0x30100A4
+#define MPNPU_PUB_SCRATCH4		0x30100A8
+#define MPNPU_PUB_SCRATCH5		0x30100AC
+#define MPNPU_PUB_SCRATCH6		0x30100B0
+#define MPNPU_PUB_SCRATCH7		0x30100B4
+#define MPNPU_PUB_SCRATCH9		0x30100BC
+
+#define MPNPU_SRAM_X2I_MAILBOX_0	0x30A0000
+#define MPNPU_SRAM_X2I_MAILBOX_1	0x30A2000
+#define MPNPU_SRAM_I2X_MAILBOX_15	0x30BF000
+
+#define MPNPU_APERTURE0_BASE		0x3000000
+#define MPNPU_APERTURE1_BASE		0x3080000
+#define MPNPU_APERTURE2_BASE		0x30C0000
+
+/* PCIe BAR Index for NPU1 */
+#define NPU1_REG_BAR_INDEX  0
+#define NPU1_MBOX_BAR_INDEX 4
+#define NPU1_PSP_BAR_INDEX  0
+#define NPU1_SMU_BAR_INDEX  0
+#define NPU1_SRAM_BAR_INDEX 2
+/* Associated BARs and Apertures */
+#define NPU1_REG_BAR_BASE  MPNPU_APERTURE0_BASE
+#define NPU1_MBOX_BAR_BASE MPNPU_APERTURE2_BASE
+#define NPU1_PSP_BAR_BASE  MPNPU_APERTURE0_BASE
+#define NPU1_SMU_BAR_BASE  MPNPU_APERTURE0_BASE
+#define NPU1_SRAM_BAR_BASE MPNPU_APERTURE1_BASE
+
+#define NPU1_RT_CFG_TYPE_PDI_LOAD 2
+#define NPU1_RT_CFG_VAL_PDI_LOAD_MGMT 0
+#define NPU1_RT_CFG_VAL_PDI_LOAD_APP 1
+
+#define NPU1_MPNPUCLK_FREQ_MAX  600
+#define NPU1_HCLK_FREQ_MAX      1024
+
+const struct amdxdna_dev_priv npu1_dev_priv = {
+	.fw_path        = "amdnpu/1502_00/npu.sbin",
+	.protocol_major = 0x5,
+	.protocol_minor = 0x1,
+	.rt_config	= {NPU1_RT_CFG_TYPE_PDI_LOAD, NPU1_RT_CFG_VAL_PDI_LOAD_APP},
+	.col_align	= COL_ALIGN_NONE,
+	.mbox_dev_addr  = NPU1_MBOX_BAR_BASE,
+	.mbox_size      = 0, /* Use BAR size */
+	.sram_dev_addr  = NPU1_SRAM_BAR_BASE,
+	.sram_offs      = {
+		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU1_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
+		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU1_SRAM, MPNPU_SRAM_I2X_MAILBOX_15),
+	},
+	.psp_regs_off   = {
+		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU1_PSP, MPNPU_PUB_SCRATCH2),
+		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH4),
+		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH9),
+		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU1_PSP, MPNPU_PUB_SEC_INTR),
+		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU1_PSP, MPNPU_PUB_SCRATCH2),
+		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU1_PSP, MPNPU_PUB_SCRATCH3),
+	},
+	.smu_regs_off   = {
+		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH5),
+		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH7),
+		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU1_SMU, MPNPU_PUB_PWRMGMT_INTR),
+		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU1_SMU, MPNPU_PUB_SCRATCH6),
+		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU1_SMU, MPNPU_PUB_SCRATCH7),
+	},
+	.smu_mpnpuclk_freq_max = NPU1_MPNPUCLK_FREQ_MAX,
+	.smu_hclk_freq_max     = NPU1_HCLK_FREQ_MAX,
+};
+
+const struct amdxdna_dev_info dev_npu1_info = {
+	.reg_bar           = NPU1_REG_BAR_INDEX,
+	.mbox_bar          = NPU1_MBOX_BAR_INDEX,
+	.sram_bar          = NPU1_SRAM_BAR_INDEX,
+	.psp_bar           = NPU1_PSP_BAR_INDEX,
+	.smu_bar           = NPU1_SMU_BAR_INDEX,
+	.first_col         = 1,
+	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
+	.dev_mem_base      = AIE2_DEVM_BASE,
+	.dev_mem_size      = AIE2_DEVM_SIZE,
+	.vbnv              = "RyzenAI-npu1",
+	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
+	.dev_priv          = &npu1_dev_priv,
+	.ops               = &aie2_ops,
+};
diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
new file mode 100644
index 000000000000..02b0f22c9f14
--- /dev/null
+++ b/drivers/accel/amdxdna/npu2_regs.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <linux/sizes.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PUB_SEC_INTR             0x3010060
+#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
+#define MPNPU_PUB_SCRATCH0             0x301006C
+#define MPNPU_PUB_SCRATCH1             0x3010070
+#define MPNPU_PUB_SCRATCH2             0x3010074
+#define MPNPU_PUB_SCRATCH3             0x3010078
+#define MPNPU_PUB_SCRATCH4             0x301007C
+#define MPNPU_PUB_SCRATCH5             0x3010080
+#define MPNPU_PUB_SCRATCH6             0x3010084
+#define MPNPU_PUB_SCRATCH7             0x3010088
+#define MPNPU_PUB_SCRATCH8             0x301008C
+#define MPNPU_PUB_SCRATCH9             0x3010090
+#define MPNPU_PUB_SCRATCH10            0x3010094
+#define MPNPU_PUB_SCRATCH11            0x3010098
+#define MPNPU_PUB_SCRATCH12            0x301009C
+#define MPNPU_PUB_SCRATCH13            0x30100A0
+#define MPNPU_PUB_SCRATCH14            0x30100A4
+#define MPNPU_PUB_SCRATCH15            0x30100A8
+#define MP0_C2PMSG_73                  0x3810A24
+#define MP0_C2PMSG_123                 0x3810AEC
+
+#define MP1_C2PMSG_0                   0x3B10900
+#define MP1_C2PMSG_60                  0x3B109F0
+#define MP1_C2PMSG_61                  0x3B109F4
+
+#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
+#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
+#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
+#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
+
+#define MMNPU_APERTURE0_BASE           0x3000000
+#define MMNPU_APERTURE1_BASE           0x3600000
+#define MMNPU_APERTURE3_BASE           0x3810000
+#define MMNPU_APERTURE4_BASE           0x3B10000
+
+/* PCIe BAR Index for NPU2 */
+#define NPU2_REG_BAR_INDEX	0
+#define NPU2_MBOX_BAR_INDEX	0
+#define NPU2_PSP_BAR_INDEX	4
+#define NPU2_SMU_BAR_INDEX	5
+#define NPU2_SRAM_BAR_INDEX	2
+/* Associated BARs and Apertures */
+#define NPU2_REG_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU2_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU2_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
+#define NPU2_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
+#define NPU2_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
+
+#define NPU2_RT_CFG_TYPE_PDI_LOAD 5
+#define NPU2_RT_CFG_VAL_PDI_LOAD_MGMT 0
+#define NPU2_RT_CFG_VAL_PDI_LOAD_APP 1
+
+#define NPU2_MPNPUCLK_FREQ_MAX  1267
+#define NPU2_HCLK_FREQ_MAX      1800
+
+const struct amdxdna_dev_priv npu2_dev_priv = {
+	.fw_path        = "amdnpu/17f0_00/npu.sbin",
+	.protocol_major = 0x6,
+	.protocol_minor = 0x1,
+	.rt_config	= {NPU2_RT_CFG_TYPE_PDI_LOAD, NPU2_RT_CFG_VAL_PDI_LOAD_APP},
+	.col_align	= COL_ALIGN_NATURE,
+	.mbox_dev_addr  = NPU2_MBOX_BAR_BASE,
+	.mbox_size      = 0, /* Use BAR size */
+	.sram_dev_addr  = NPU2_SRAM_BAR_BASE,
+	.sram_offs      = {
+		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
+		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU2_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
+	},
+	.psp_regs_off   = {
+		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU2_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU2_REG, MPNPU_PUB_SCRATCH4),
+		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU2_REG, MPNPU_PUB_SCRATCH9),
+		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU2_PSP, MP0_C2PMSG_73),
+		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU2_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU2_REG, MPNPU_PUB_SCRATCH3),
+	},
+	.smu_regs_off   = {
+		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU2_SMU, MP1_C2PMSG_0),
+		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU2_SMU, MP1_C2PMSG_60),
+		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU2_SMU, MMNPU_APERTURE4_BASE),
+		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU2_SMU, MP1_C2PMSG_61),
+		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU2_SMU, MP1_C2PMSG_60),
+	},
+	.smu_mpnpuclk_freq_max = NPU2_MPNPUCLK_FREQ_MAX,
+	.smu_hclk_freq_max     = NPU2_HCLK_FREQ_MAX,
+};
+
+const struct amdxdna_dev_info dev_npu2_info = {
+	.reg_bar           = NPU2_REG_BAR_INDEX,
+	.mbox_bar          = NPU2_MBOX_BAR_INDEX,
+	.sram_bar          = NPU2_SRAM_BAR_INDEX,
+	.psp_bar           = NPU2_PSP_BAR_INDEX,
+	.smu_bar           = NPU2_SMU_BAR_INDEX,
+	.first_col         = 0,
+	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
+	.dev_mem_base      = AIE2_DEVM_BASE,
+	.dev_mem_size      = AIE2_DEVM_SIZE,
+	.vbnv              = "RyzenAI-npu2",
+	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
+	.dev_priv          = &npu2_dev_priv,
+	.ops               = &aie2_ops, /* NPU2 can share NPU1's callback */
+};
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
new file mode 100644
index 000000000000..ca5ca5a6c751
--- /dev/null
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <linux/sizes.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PUB_SEC_INTR             0x3010060
+#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
+#define MPNPU_PUB_SCRATCH0             0x301006C
+#define MPNPU_PUB_SCRATCH1             0x3010070
+#define MPNPU_PUB_SCRATCH2             0x3010074
+#define MPNPU_PUB_SCRATCH3             0x3010078
+#define MPNPU_PUB_SCRATCH4             0x301007C
+#define MPNPU_PUB_SCRATCH5             0x3010080
+#define MPNPU_PUB_SCRATCH6             0x3010084
+#define MPNPU_PUB_SCRATCH7             0x3010088
+#define MPNPU_PUB_SCRATCH8             0x301008C
+#define MPNPU_PUB_SCRATCH9             0x3010090
+#define MPNPU_PUB_SCRATCH10            0x3010094
+#define MPNPU_PUB_SCRATCH11            0x3010098
+#define MPNPU_PUB_SCRATCH12            0x301009C
+#define MPNPU_PUB_SCRATCH13            0x30100A0
+#define MPNPU_PUB_SCRATCH14            0x30100A4
+#define MPNPU_PUB_SCRATCH15            0x30100A8
+#define MP0_C2PMSG_73                  0x3810A24
+#define MP0_C2PMSG_123                 0x3810AEC
+
+#define MP1_C2PMSG_0                   0x3B10900
+#define MP1_C2PMSG_60                  0x3B109F0
+#define MP1_C2PMSG_61                  0x3B109F4
+
+#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
+#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
+#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
+#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
+
+#define MMNPU_APERTURE0_BASE           0x3000000
+#define MMNPU_APERTURE1_BASE           0x3600000
+#define MMNPU_APERTURE3_BASE           0x3810000
+#define MMNPU_APERTURE4_BASE           0x3B10000
+
+/* PCIe BAR Index for NPU4 */
+#define NPU4_REG_BAR_INDEX	0
+#define NPU4_MBOX_BAR_INDEX	0
+#define NPU4_PSP_BAR_INDEX	4
+#define NPU4_SMU_BAR_INDEX	5
+#define NPU4_SRAM_BAR_INDEX	2
+/* Associated BARs and Apertures */
+#define NPU4_REG_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU4_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU4_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
+#define NPU4_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
+#define NPU4_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
+
+#define NPU4_RT_CFG_TYPE_PDI_LOAD 5
+#define NPU4_RT_CFG_VAL_PDI_LOAD_MGMT 0
+#define NPU4_RT_CFG_VAL_PDI_LOAD_APP 1
+
+#define NPU4_MPNPUCLK_FREQ_MAX  1267
+#define NPU4_HCLK_FREQ_MAX      1800
+
+const struct amdxdna_dev_priv npu4_dev_priv = {
+	.fw_path        = "amdnpu/17f0_10/npu.sbin",
+	.protocol_major = 0x6,
+	.protocol_minor = 0x1,
+	.rt_config	= {NPU4_RT_CFG_TYPE_PDI_LOAD, NPU4_RT_CFG_VAL_PDI_LOAD_APP},
+	.col_align	= COL_ALIGN_NATURE,
+	.mbox_dev_addr  = NPU4_MBOX_BAR_BASE,
+	.mbox_size      = 0, /* Use BAR size */
+	.sram_dev_addr  = NPU4_SRAM_BAR_BASE,
+	.sram_offs      = {
+		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
+		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU4_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
+	},
+	.psp_regs_off   = {
+		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU4_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU4_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU4_REG, MPNPU_PUB_SCRATCH4),
+		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU4_REG, MPNPU_PUB_SCRATCH9),
+		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU4_PSP, MP0_C2PMSG_73),
+		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU4_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU4_REG, MPNPU_PUB_SCRATCH3),
+	},
+	.smu_regs_off   = {
+		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU4_SMU, MP1_C2PMSG_0),
+		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU4_SMU, MP1_C2PMSG_60),
+		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU4_SMU, MMNPU_APERTURE4_BASE),
+		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU4_SMU, MP1_C2PMSG_61),
+		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU4_SMU, MP1_C2PMSG_60),
+	},
+	.smu_mpnpuclk_freq_max = NPU4_MPNPUCLK_FREQ_MAX,
+	.smu_hclk_freq_max     = NPU4_HCLK_FREQ_MAX,
+};
+
+const struct amdxdna_dev_info dev_npu4_info = {
+	.reg_bar           = NPU4_REG_BAR_INDEX,
+	.mbox_bar          = NPU4_MBOX_BAR_INDEX,
+	.sram_bar          = NPU4_SRAM_BAR_INDEX,
+	.psp_bar           = NPU4_PSP_BAR_INDEX,
+	.smu_bar           = NPU4_SMU_BAR_INDEX,
+	.first_col         = 0,
+	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
+	.dev_mem_base      = AIE2_DEVM_BASE,
+	.dev_mem_size      = AIE2_DEVM_SIZE,
+	.vbnv              = "RyzenAI-npu4",
+	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
+	.dev_priv          = &npu4_dev_priv,
+	.ops               = &aie2_ops, /* NPU4 can share NPU1's callback */
+};
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
new file mode 100644
index 000000000000..07fddcbb86ec
--- /dev/null
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024, Advanced Micro Devices, Inc.
+ */
+
+#include <drm/amdxdna_accel.h>
+#include <drm/drm_device.h>
+#include <linux/sizes.h>
+
+#include "aie2_pci.h"
+#include "amdxdna_pci_drv.h"
+
+/* NPU Public Registers on MpNPUAxiXbar (refer to Diag npu_registers.h) */
+#define MPNPU_PUB_SEC_INTR             0x3010060
+#define MPNPU_PUB_PWRMGMT_INTR         0x3010064
+#define MPNPU_PUB_SCRATCH0             0x301006C
+#define MPNPU_PUB_SCRATCH1             0x3010070
+#define MPNPU_PUB_SCRATCH2             0x3010074
+#define MPNPU_PUB_SCRATCH3             0x3010078
+#define MPNPU_PUB_SCRATCH4             0x301007C
+#define MPNPU_PUB_SCRATCH5             0x3010080
+#define MPNPU_PUB_SCRATCH6             0x3010084
+#define MPNPU_PUB_SCRATCH7             0x3010088
+#define MPNPU_PUB_SCRATCH8             0x301008C
+#define MPNPU_PUB_SCRATCH9             0x3010090
+#define MPNPU_PUB_SCRATCH10            0x3010094
+#define MPNPU_PUB_SCRATCH11            0x3010098
+#define MPNPU_PUB_SCRATCH12            0x301009C
+#define MPNPU_PUB_SCRATCH13            0x30100A0
+#define MPNPU_PUB_SCRATCH14            0x30100A4
+#define MPNPU_PUB_SCRATCH15            0x30100A8
+#define MP0_C2PMSG_73                  0x3810A24
+#define MP0_C2PMSG_123                 0x3810AEC
+
+#define MP1_C2PMSG_0                   0x3B10900
+#define MP1_C2PMSG_60                  0x3B109F0
+#define MP1_C2PMSG_61                  0x3B109F4
+
+#define MPNPU_SRAM_X2I_MAILBOX_0       0x3600000
+#define MPNPU_SRAM_X2I_MAILBOX_15      0x361E000
+#define MPNPU_SRAM_X2I_MAILBOX_31      0x363E000
+#define MPNPU_SRAM_I2X_MAILBOX_31      0x363F000
+
+#define MMNPU_APERTURE0_BASE           0x3000000
+#define MMNPU_APERTURE1_BASE           0x3600000
+#define MMNPU_APERTURE3_BASE           0x3810000
+#define MMNPU_APERTURE4_BASE           0x3B10000
+
+/* PCIe BAR Index for NPU5 */
+#define NPU5_REG_BAR_INDEX	0
+#define NPU5_MBOX_BAR_INDEX	0
+#define NPU5_PSP_BAR_INDEX	4
+#define NPU5_SMU_BAR_INDEX	5
+#define NPU5_SRAM_BAR_INDEX	2
+/* Associated BARs and Apertures */
+#define NPU5_REG_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU5_MBOX_BAR_BASE	MMNPU_APERTURE0_BASE
+#define NPU5_PSP_BAR_BASE	MMNPU_APERTURE3_BASE
+#define NPU5_SMU_BAR_BASE	MMNPU_APERTURE4_BASE
+#define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
+
+#define NPU5_RT_CFG_TYPE_PDI_LOAD 5
+#define NPU5_RT_CFG_VAL_PDI_LOAD_MGMT 0
+#define NPU5_RT_CFG_VAL_PDI_LOAD_APP 1
+
+#define NPU5_MPNPUCLK_FREQ_MAX  1267
+#define NPU5_HCLK_FREQ_MAX      1800
+
+const struct amdxdna_dev_priv npu5_dev_priv = {
+	.fw_path        = "amdnpu/17f0_11/npu.sbin",
+	.protocol_major = 0x6,
+	.protocol_minor = 0x1,
+	.rt_config	= {NPU5_RT_CFG_TYPE_PDI_LOAD, NPU5_RT_CFG_VAL_PDI_LOAD_APP},
+	.col_align	= COL_ALIGN_NATURE,
+	.mbox_dev_addr  = NPU5_MBOX_BAR_BASE,
+	.mbox_size      = 0, /* Use BAR size */
+	.sram_dev_addr  = NPU5_SRAM_BAR_BASE,
+	.sram_offs      = {
+		DEFINE_BAR_OFFSET(MBOX_CHANN_OFF, NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_0),
+		DEFINE_BAR_OFFSET(FW_ALIVE_OFF,   NPU5_SRAM, MPNPU_SRAM_X2I_MAILBOX_15),
+	},
+	.psp_regs_off   = {
+		DEFINE_BAR_OFFSET(PSP_CMD_REG,    NPU5_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_ARG0_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
+		DEFINE_BAR_OFFSET(PSP_ARG1_REG,   NPU5_REG, MPNPU_PUB_SCRATCH4),
+		DEFINE_BAR_OFFSET(PSP_ARG2_REG,   NPU5_REG, MPNPU_PUB_SCRATCH9),
+		DEFINE_BAR_OFFSET(PSP_INTR_REG,   NPU5_PSP, MP0_C2PMSG_73),
+		DEFINE_BAR_OFFSET(PSP_STATUS_REG, NPU5_PSP, MP0_C2PMSG_123),
+		DEFINE_BAR_OFFSET(PSP_RESP_REG,   NPU5_REG, MPNPU_PUB_SCRATCH3),
+	},
+	.smu_regs_off   = {
+		DEFINE_BAR_OFFSET(SMU_CMD_REG,  NPU5_SMU, MP1_C2PMSG_0),
+		DEFINE_BAR_OFFSET(SMU_ARG_REG,  NPU5_SMU, MP1_C2PMSG_60),
+		DEFINE_BAR_OFFSET(SMU_INTR_REG, NPU5_SMU, MMNPU_APERTURE4_BASE),
+		DEFINE_BAR_OFFSET(SMU_RESP_REG, NPU5_SMU, MP1_C2PMSG_61),
+		DEFINE_BAR_OFFSET(SMU_OUT_REG,  NPU5_SMU, MP1_C2PMSG_60),
+	},
+	.smu_mpnpuclk_freq_max = NPU5_MPNPUCLK_FREQ_MAX,
+	.smu_hclk_freq_max     = NPU5_HCLK_FREQ_MAX,
+};
+
+const struct amdxdna_dev_info dev_npu5_info = {
+	.reg_bar           = NPU5_REG_BAR_INDEX,
+	.mbox_bar          = NPU5_MBOX_BAR_INDEX,
+	.sram_bar          = NPU5_SRAM_BAR_INDEX,
+	.psp_bar           = NPU5_PSP_BAR_INDEX,
+	.smu_bar           = NPU5_SMU_BAR_INDEX,
+	.first_col         = 0,
+	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
+	.dev_mem_base      = AIE2_DEVM_BASE,
+	.dev_mem_size      = AIE2_DEVM_SIZE,
+	.vbnv              = "RyzenAI-npu5",
+	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
+	.dev_priv          = &npu5_dev_priv,
+	.ops               = &aie2_ops,
+};
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
new file mode 100644
index 000000000000..6d97e8e90cf6
--- /dev/null
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _UAPI_AMDXDNA_ACCEL_H_
+#define _UAPI_AMDXDNA_ACCEL_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+enum amdxdna_device_type {
+	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
+	AMDXDNA_DEV_TYPE_KMQ,
+};
+
+#if defined(__cplusplus)
+} /* extern c end */
+#endif
+
+#endif /* _UAPI_AMDXDNA_ACCEL_H_ */
-- 
2.34.1

