Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D4A82DA3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4836F10E2D6;
	Wed,  9 Apr 2025 17:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="udn+wwiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9701F10E28E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0d9W1R6jKegnI++aHJjtsO2lyjLtZNpENUpNyT+144eqIe4Au6dboWrIsZWcH1NKdqylC4Ykah6OhRFpZx1y4Q5U+B44q37AodyKPUNFB4VWwamV2ElF5/fY9kR5IfwfDyADdh/u/cNnGVccBi2L4KvO1lGL7QQ1Ps8D8OuvVie/tP2POZZHiUAKX5KItNqdLCBNNhik/IiDwC2gpcyt7j/07ShCSTFhuej2ebW64uVmgN6lb6eYRGiB9vtj8rwiiGKkTdSbkncx/Xv/g1ZhkTK2XBntmMvfnzaDMaC9AKWs+NIg8Udd6ET0VdtmvYGZ3BYSgVpDnrsjlR8/oeyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/tPXJyPG9/GhoDsRH1ozQpvHhqdo0D/YcVzC3uKCtE=;
 b=sz+G2xZY7fdnwCh2ze+K14ahxE9yizHkLyzCYkof4hMezEamwaxr0HlJBsjNgKU3BqzQxiVDUohS30xPK9RRpHwv1vIwpcFujHmilLkCJDQBIRuWEIDDsvlO572Rjow1NYOuSqs5wrC5rrBootNmfqrI/k75mjPF6aFHo3TEayDQP8QuqwXT6JP+jXXz4dqoCwMjDgi5OSkilkjSTFkDYLPRVicJGcukvx6SHGSoA1BK89h/ogV8k7Kaz8ODej/K+0gXDNR03sifKVEXJnQU5yo++7Jls3iOkTIieUybgG7ihSD1bV8oUqiN0oKYv0cLn9YoQ8Jo/NYpEghaRFCErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/tPXJyPG9/GhoDsRH1ozQpvHhqdo0D/YcVzC3uKCtE=;
 b=udn+wwiV2tyx8q77GYm64JKgM6wcbHXmw4N2URj7pMhdt0Pzl8Qsm4JXsrY3r5MsWeyEpYiVBqGxfLF1igI/2pcnpznI3OmcpIjaXDr6e7lGVv0t/TaTpq5uP5tawsw6brorsw+rRMl6T+PsZrNXf4EnriqQlM6sosKUFL9penA=
Received: from PH7P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::10)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 9 Apr
 2025 17:30:59 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::e8) by PH7P223CA0017.outlook.office365.com
 (2603:10b6:510:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 17:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 17:30:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 12:30:56 -0500
Received: from xhdipdslab69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 9 Apr 2025 12:30:51 -0500
From: Nipun Gupta <nipun.gupta@amd.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
 <gregkh@linuxfoundation.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <ogabbay@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <derek.kiernan@amd.com>, <dragan.cvetic@amd.com>,
 <arnd@arndb.de>
CC: <praveen.jain@amd.com>, <harpreet.anand@amd.com>,
 <nikhil.agarwal@amd.com>, <srivatsa@csail.mit.edu>, <code@tyhicks.com>,
 <ptsm@linux.microsoft.com>, Nipun Gupta <nipun.gupta@amd.com>
Subject: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Date: Wed, 9 Apr 2025 23:00:32 +0530
Message-ID: <20250409173033.2261755-2-nipun.gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: nipun.gupta@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 935eee8d-6010-491f-7af4-08dd778c4a52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|7416014|36860700013|13003099007|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IQuMkYvR2K7SUrrNaKXGvKfk+QeWOBvYYyLvvnHcnfYcLZLLrXBkb4VufJ6W?=
 =?us-ascii?Q?g+k42g5kR3khC5J6F0eKoCsGrYqJa/9uMLZ5zYCp25HYrEF9TKA4r3M9XYCT?=
 =?us-ascii?Q?RV9v9etc187eSkmBoL0OjF8ZW7OecA2A4hz+83GpqWHZxbrg0U76nAQ9GI+g?=
 =?us-ascii?Q?msJGe91mfR308FfrMLS9+0R+k+p+F2YbsivMTG01OivAfv4ceI8KGYN9+4wU?=
 =?us-ascii?Q?Lj5pHQQ+Iaamnj7c4qUuUDbfT96T62Di+maagMgpZLpWIGSg7T9QuXtN4lR8?=
 =?us-ascii?Q?PjZxhN8qythsyYaMDOpjrdfgqfZIf4vt0UPaE217cQSMosM4sVFvnALFIcX4?=
 =?us-ascii?Q?F0//WuTH77xqBfoDrQj+U8EXso3Vw2LT3IkHaryB7BciL0QZEhb0SwyBRkt7?=
 =?us-ascii?Q?/yQHafsqtKQbuf1QYgaSIzHvQmhxuiT6D62Jn+sJUhKa7KNtwIvSTMI99C3S?=
 =?us-ascii?Q?CjJfQpB2VKC9XF2vByp98OKosXCTWbqMCeRunVTG2deVDIWWZmE6F0v0m7oM?=
 =?us-ascii?Q?krflo6O3f83jY3jUSozfRdFL/Vf3lM7BapCzIZq5z0xUyn9y+he/VIhZtJPG?=
 =?us-ascii?Q?g6850VXmDPw6Lf0xXAJoFhWPT5buVb7zkQbiHx+6jsa4H3zgk1oOE0dnPynS?=
 =?us-ascii?Q?iFnS+UtllWuDgVYGMwUVSB7ShBV7wIAFaY47zKGdZHkQJeRKbdoGuOTjvV7s?=
 =?us-ascii?Q?rc9ecdfVgjWN+zX2cv3EwDCiBkWdJAyrM0ksfHj+C1ZAqCEHP2IYHtndtYmU?=
 =?us-ascii?Q?hy4AgDEFLoLu+YLL03dj4ktVuT0eyMubKzp+T4hY67Lf7DhQXLRuBqDXnnu1?=
 =?us-ascii?Q?25h2W8rdMDm26z9P5C8W6/K4hSovFsytiaaTzhO8yzVrwYrw8hc6OlZKGVQ3?=
 =?us-ascii?Q?ygfNz5K18PqRqh7HzjYhND0h/x/H3F/8oTNDgUOJmA21wQxITr5argRMZlCX?=
 =?us-ascii?Q?PgKfi4Z8nXaP69j7oZWfTIwuYkkKBETMBhs5honbTnbb3jSGUPGfHmX7/M4W?=
 =?us-ascii?Q?FzKM+b0C192SyMIIesamlzI5IuxVLU7lnT2ZPYXCdRpS4FiMRDCTlRPac/t8?=
 =?us-ascii?Q?cImEAeRTcjRcyOG+6+yJy9KUpMQkTv7HDCZs4+stD+uxLnbb6VmfCNYl0T8U?=
 =?us-ascii?Q?+tuC5lSuIDvt/+GsFuy8PckKXKaQpzWro6LYMHP0bxMJYaRpJevwZkKJmrrW?=
 =?us-ascii?Q?eItrFR6IrPYThBtXKhnZNnYkCr6/9VtCyB6iM/0R6VCUq7VvBNpoddAsFQDi?=
 =?us-ascii?Q?FgSytRHVSDAPOb2w1dcg2Hfe6ISDYJHfIODOEyLcKzaXTJtZgrtHq1hoom2i?=
 =?us-ascii?Q?yndCAISQHzO75RPTG5vznkrjT4A0MXFVRGj8wbFvyPrahRk2vKcyR+0f+3Ar?=
 =?us-ascii?Q?5EJLv7fUxEA+0T8BJMkPW6pI34pjBK+4n0c7Eph/djBeAB9KHdocXHyAnrdm?=
 =?us-ascii?Q?Ih6j+uyU443dMusU3Xf1KTa9VXrqMxv5fbpmc5r0YFADkfyEX7L7PkIndMwW?=
 =?us-ascii?Q?oZGWX74ztqR76lo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(36860700013)(13003099007)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:30:58.0962 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935eee8d-6010-491f-7af4-08dd778c4a52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566
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

The AMD PKI accelerator driver provides a accel interface to interact
with the device for offloading and accelerating asymmetric crypto
operations.

Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
---

Changes RFC->v2:
- moved from misc to accel
- added architecture and compile test dependency in Kconfig
- removed sysfs (and added debugfs in new patch 3/3)
- fixed platform compat
- removed redundant resource index 1 configuration (which was there in
  RFC patch)

 MAINTAINERS                     |   2 +
 drivers/accel/Kconfig           |   1 +
 drivers/accel/Makefile          |   1 +
 drivers/accel/amdpk/Kconfig     |  18 +
 drivers/accel/amdpk/Makefile    |   8 +
 drivers/accel/amdpk/amdpk_drv.c | 736 ++++++++++++++++++++++++++++++++
 drivers/accel/amdpk/amdpk_drv.h | 271 ++++++++++++
 include/uapi/drm/amdpk.h        |  49 +++
 8 files changed, 1086 insertions(+)
 create mode 100644 drivers/accel/amdpk/Kconfig
 create mode 100644 drivers/accel/amdpk/Makefile
 create mode 100644 drivers/accel/amdpk/amdpk_drv.c
 create mode 100644 drivers/accel/amdpk/amdpk_drv.h
 create mode 100644 include/uapi/drm/amdpk.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 11f8815daa77..cdc305a206aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1161,6 +1161,8 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
+F:	drivers/accel/amdpk/
+F:	include/uapi/drm/amdpk.h

 AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39..5632c6c62c15 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -28,5 +28,6 @@ source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
 source "drivers/accel/qaic/Kconfig"
+source "drivers/accel/amdpk/Kconfig"

 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4..caea6d636ac8 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
+obj-$(CONFIG_DRM_ACCEL_AMDPK)		+= amdpk/
diff --git a/drivers/accel/amdpk/Kconfig b/drivers/accel/amdpk/Kconfig
new file mode 100644
index 000000000000..c0b459bb66a7
--- /dev/null
+++ b/drivers/accel/amdpk/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for AMD PKI accelerator for versal-net
+#
+
+config DRM_ACCEL_AMDPK
+	tristate "AMD PKI accelerator for versal-net"
+	depends on DRM_ACCEL
+	depends on ARM64 || COMPILE_TEST
+	help
+	  Enables platform driver for AMD PKI accelerator that are designed
+	  for high performance Public Key asymmetric crypto operations on AMD
+	  versal-net.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called amdpk.
diff --git a/drivers/accel/amdpk/Makefile b/drivers/accel/amdpk/Makefile
new file mode 100644
index 000000000000..826f43ccebdf
--- /dev/null
+++ b/drivers/accel/amdpk/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for AMD PKI accelerator for versal-net
+#
+
+obj-$(CONFIG_DRM_ACCEL_AMDPK) := amdpk.o
+
+amdpk-y := amdpk_drv.o
diff --git a/drivers/accel/amdpk/amdpk_drv.c b/drivers/accel/amdpk/amdpk_drv.c
new file mode 100644
index 000000000000..17c328d03db8
--- /dev/null
+++ b/drivers/accel/amdpk/amdpk_drv.c
@@ -0,0 +1,736 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2021 Silex Insight sa
+ * Copyright (c) 2018-2021 Beerten Engineering scs
+ * Copyright (c) 2025 Advanced Micro Devices, Inc.
+ */
+
+/*
+ * Device Overview
+ * ===============
+ * AMD PKI accelerator is a device on AMD versal-net to execute public
+ * key asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high
+ * performance. The driver provides accel interface to applications for
+ * configuring the device and performing the required operations. AMD PKI
+ * device comprises of multiple Barco Silex ba414 PKI engines bundled together,
+ * and providing a queue based interface to interact with these devices on AMD
+ * versal-net.
+ *
+ * Following figure provides the brief overview of the device interface with
+ * the software:
+ *
+ * +------------------+
+ * |    Software      |
+ * +------------------+
+ *     |          |
+ *     |          v
+ *     |     +-----------------------------------------------------------+
+ *     |     |                     RAM                                   |
+ *     |     |  +----------------------------+   +---------------------+ |
+ *     |     |  |           RQ pages         |   |       CQ pages      | |
+ *     |     |  | +------------------------+ |   | +-----------------+ | |
+ *     |     |  | |   START (cmd)          | |   | | req_id | status | | |
+ *     |     |  | |   TFRI (addr, sz)---+  | |   | | req_id | status | | |
+ *     |     |  | | +-TFRO (addr, sz)   |  | |   | | ...             | | |
+ *     |     |  | | | NTFY (req_id)     |  | |   | +-----------------+ | |
+ *     |     |  | +-|-------------------|--+ |   |                     | |
+ *     |     |  |   |                   v    |   +---------------------+ |
+ *     |     |  |   |         +-----------+  |                           |
+ *     |     |  |   |         | input     |  |                           |
+ *     |     |  |   |         | data      |  |                           |
+ *     |     |  |   v         +-----------+  |                           |
+ *     |     |  |  +----------------+        |                           |
+ *     |     |  |  |  output data   |        |                           |
+ *     |     |  |  +----------------+        |                           |
+ *     |     |  +----------------------------+                           |
+ *     |     |                                                           |
+ *     |     +-----------------------------------------------------------+
+ *     |
+ *     |
+ * +---|----------------------------------------------------+
+ * |   v                AMD PKI device                      |
+ * |  +-------------------+     +------------------------+  |
+ * |  | New request FIFO  | --> |       PK engines       |  |
+ * |  +-------------------+     +------------------------+  |
+ * +--------------------------------------------------------+
+ *
+ * To perform a crypto operation, the software writes a sequence of descriptors,
+ * into the RQ memory. This includes input data and designated location for the
+ * output data. After preparing the request, request offset (from the RQ memory
+ * region) is written into the NEW_REQUEST register. Request is then stored in a
+ * common hardware FIFO shared among all RQs.
+ *
+ * When a PK engine becomes available, device pops the request from the FIFO and
+ * fetches the descriptors. It DMAs the input data from RQ memory and executes
+ * the necessary computations. After computation is complete, the device writes
+ * output data back to RAM via DMA. Device then writes a new entry in CQ ring
+ * buffer in RAM, indicating completion of the request. Device also generates
+ * an interrupt for notifying completion to the software.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/eventfd.h>
+#include <drm/drm_accel.h>
+#include <drm/drm_ioctl.h>
+
+#include "amdpk_drv.h"
+
+#define DRIVER_NAME "amdpk"
+
+static void amdpk_init_cq(struct amdpk_dev *pkdev, struct amdpk_cq *cq,
+			  int szcode, char *base)
+{
+	cq->pkdev = pkdev;
+	cq->generation = 1;
+	cq->szcode = szcode;
+	cq->base = (u32 *)base;
+	cq->tail = 0;
+}
+
+static int amdpk_pop_cq(struct amdpk_cq *cq, int *rid)
+{
+	u32 status = CQ_STATUS_VALID;
+	unsigned int sz;
+	u32 completion;
+
+	completion = cq->base[cq->tail + 1];
+	if ((completion & CQ_GENERATION_BIT) != cq->generation)
+		return CQ_STATUS_INVALID;
+
+	*rid = (completion >> 16) & 0xffff;
+	/* read memory barrier: to avoid a race condition, the status field should
+	 * not be read before the completion generation bit. Otherwise we could
+	 * get stale outdated status data.
+	 */
+	rmb();
+	status |= cq->base[cq->tail];
+	/* advance completion queue tail */
+	cq->tail += 2;
+	sz = 1 << (cq->szcode - 2);
+	if (cq->tail >= sz) {
+		cq->tail = 0;
+		cq->generation ^= 1; /* invert generation bit */
+	}
+
+	/* evaluate status from the completion queue */
+	if (completion & CQ_COMPLETION_BIT)
+		status |= CQ_COMPLETION_ERROR;
+
+	return status;
+}
+
+static int amdpk_trigpos(struct amdpk_cq *cq)
+{
+	int trigpos;
+
+	/* Set trigger position on next completed operation */
+	trigpos = cq->tail / 2 + (cq->generation << (cq->szcode - 3));
+	trigpos++;
+	trigpos &= (1 << (cq->szcode - 2)) - 1;
+
+	return trigpos;
+}
+
+static void amdpk_cq_workfn(struct kthread_work *work)
+{
+	struct amdpk_work *pkwork;
+	struct amdpk_dev *pkdev;
+	struct amdpk_user *user;
+	int qid, rid, trigpos;
+	u32 status;
+
+	pkwork = to_amdpk_work(work);
+	pkdev = pkwork->pkdev;
+	qid = pkwork->qid;
+
+	user = pkwork->user;
+	status = amdpk_pop_cq(&pkdev->work[qid]->pk_cq, &rid);
+	if (rid < user->rq_entries && status != CQ_STATUS_INVALID) {
+		u32 *status_mem;
+
+		status_mem = (u32 *)user->stmem;
+		status_mem[rid] = status;
+		eventfd_signal(user->evfd_ctx[rid]);
+	}
+
+	trigpos = amdpk_trigpos(&pkdev->work[qid]->pk_cq);
+	pk_wrreg(pkdev->regs, REG_CTL_CQ_NTFY(user->qid), trigpos);
+}
+
+static irqreturn_t amdpk_cq_irq(int irq, void *dev)
+{
+	struct amdpk_dev *pkdev = (struct amdpk_dev *)dev;
+	u64 active = 0;
+	int i;
+
+	active = pk_rdreg(pkdev->regs, REG_PK_IRQ_STATUS);
+	pk_wrreg(pkdev->regs, REG_PK_IRQ_RESET, active);
+
+	for (i = 0; i < pkdev->max_queues && active; i++, active >>= 1) {
+		if (!(active & 1))
+			continue;
+		if (!pkdev->users[i])
+			continue;
+		kthread_queue_work(pkdev->work[i]->cq_wq, &pkdev->work[i]->cq_work);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void amdpk_free_rqmem(struct amdpk_dev *pkdev, struct amdpk_user *user)
+{
+	int pages = user->rq_pages;
+	int pagemult = pages / 4;
+	int i;
+
+	for (i = 0; i < pages / pagemult; i++) {
+		if (!user->rqmem[i])
+			continue;
+		dma_free_coherent(pkdev->dev, PAGE_SIZE * pagemult,
+				  user->rqmem[i], user->physrq[i]);
+		user->rqmem[i] = NULL;
+	}
+}
+
+static int amdpk_accel_get_info(struct drm_device *dev, void *data, struct drm_file *fp)
+{
+	struct amdpk_user *user = fp->driver_priv;
+	struct amdpk_dev *pkdev = user->pkdev;
+	struct amdpk_info *info = data;
+
+	info->avail_qdepth = atomic_read(&pkdev->avail_qdepth);
+	return 0;
+}
+
+static int amdpk_accel_configure(struct amdpk_user *user, struct amdpk_conf *conf)
+{
+	struct amdpk_dev *pkdev = user->pkdev;
+	struct amdpk_work *pkwork = NULL;
+	int qid = user->qid;
+	int trigpos, ret, i;
+	char wq_name[32];
+
+	i = atomic_sub_return(conf->qdepth, &pkdev->avail_qdepth);
+	if (i < 0) {
+		/* If enough entries are not present, give back the reserved entries. */
+		dev_err(user->pkdev->dev, "Out of descriptors\n");
+		atomic_add(conf->qdepth, &pkdev->avail_qdepth);
+		return -ENOSPC;
+	}
+	user->rq_entries = conf->qdepth;
+
+	for (i = 0; i < user->rq_entries; i++) {
+		if (conf->eventfd[i] <= 0) {
+			dev_err(user->pkdev->dev, "Invalid eventfd: %d\n", conf->eventfd[i]);
+			ret = -EINVAL;
+			goto fail;
+		}
+
+		user->evfd_ctx[i] = eventfd_ctx_fdget(conf->eventfd[i]);
+		if (IS_ERR(user->evfd_ctx[i])) {
+			dev_err(user->pkdev->dev, "Invalid eventfd: %d\n", conf->eventfd[i]);
+			ret = PTR_ERR(user->evfd_ctx[i]);
+			goto fail;
+		}
+	}
+
+	user->cqmem = dma_alloc_coherent(pkdev->dev, PAGE_SIZE, &user->physcq, GFP_KERNEL);
+	if (!user->cqmem) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	/* Initialize completion queue handler */
+	pkwork = pkdev->work[qid];
+	amdpk_init_cq(pkdev, &pkwork->pk_cq, __builtin_ctz(PAGE_SIZE), user->cqmem);
+
+	snprintf(wq_name, sizeof(wq_name), "cq_worker_%d", qid);
+	pkwork->cq_wq = kthread_create_worker(0, wq_name);
+	if (IS_ERR(pkwork->cq_wq)) {
+		ret = PTR_ERR(pkwork->cq_wq);
+		pkwork->cq_wq = NULL;
+		goto fail;
+	}
+	kthread_init_work(&pkwork->cq_work, amdpk_cq_workfn);
+
+	pk_wrreg(pkdev->regs, REG_CQ_CFG_IRQ_NR(qid), qid);
+	pk_wrreg(pkdev->regs, REG_CQ_CFG_ADDR(qid), user->physcq);
+	pk_wrreg(pkdev->regs, REG_CQ_CFG_SIZE(qid), PAGE_SHIFT);
+	pk_wrreg(pkdev->regs, REG_RQ_CFG_CQID(qid), qid);
+	pk_wrreg(pkdev->regs, REG_RQ_CFG_DEPTH(qid), user->rq_entries);
+
+	/* set trigger position for notifications */
+	trigpos = amdpk_trigpos(&pkwork->pk_cq);
+	pk_wrreg(pkdev->regs, REG_CTL_CQ_NTFY(qid), trigpos);
+
+	return 0;
+fail:
+	if (pkwork->cq_wq) {
+		kthread_destroy_worker(pkwork->cq_wq);
+		pkwork->cq_wq = NULL;
+	}
+	if (user->cqmem) {
+		dma_free_coherent(pkdev->dev, PAGE_SIZE, user->cqmem, user->physcq);
+		user->cqmem = NULL;
+	}
+	atomic_add(user->rq_entries, &pkdev->avail_qdepth);
+	user->rq_entries = 0;
+
+	return ret;
+}
+
+static int amdpk_accel_set_conf(struct drm_device *dev, void *data, struct drm_file *fp)
+{
+	struct amdpk_user *user = fp->driver_priv;
+	struct amdpk_conf *conf = data;
+	int ret;
+
+	if (conf->qdepth == 0 || conf->qdepth > MAX_CQ_ENTRIES_ON_PAGE) {
+		dev_err(user->pkdev->dev, "Invalid qdepth: %d\n", conf->qdepth);
+		return -EINVAL;
+	}
+
+	if (user->configured) {
+		dev_err(user->pkdev->dev, "User already configured\n");
+		return -EEXIST;
+	}
+
+	ret = amdpk_accel_configure(user, conf);
+	if (ret)
+		return ret;
+
+	user->configured = true;
+	return 0;
+}
+
+static int amdpk_mmap_regs(struct vm_area_struct *vma)
+{
+	struct amdpk_user *user = vma->vm_private_data;
+	struct amdpk_dev *pkdev = user->pkdev;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	return io_remap_pfn_range(vma, vma->vm_start,
+				  (pkdev->regsphys + REG_CTL_BASE(user->qid)) >> PAGE_SHIFT,
+				  vma->vm_end - vma->vm_start, vma->vm_page_prot);
+}
+
+static int mmap_dmamem(struct vm_area_struct *vma, struct amdpk_dev *pkdev,
+		       void *addr, dma_addr_t phys, off_t offset, size_t sz)
+{
+	unsigned long vmstart = vma->vm_start;
+	unsigned long pgoff = vma->vm_pgoff;
+	int ret;
+
+	vma->vm_pgoff = 0;
+	vma->vm_start = vmstart + offset;
+	vma->vm_end = vma->vm_start + sz;
+	ret = dma_mmap_coherent(pkdev->dev, vma, addr, phys, sz);
+	vma->vm_pgoff = pgoff;
+	vma->vm_start = vmstart;
+
+	return ret;
+}
+
+static int amdpk_mmap_mem(struct vm_area_struct *vma)
+{
+	struct amdpk_user *user = vma->vm_private_data;
+	struct amdpk_dev *pkdev = user->pkdev;
+	int pagemult, pagemultshift;
+	int requested_pages;
+	int qid = user->qid;
+	int ret, i;
+
+	if (!user->configured) {
+		dev_err(pkdev->dev, "configuration not found!");
+		return -ENODEV;
+	}
+	/* Mapping already done */
+	if (user->stmem) {
+		dev_err(pkdev->dev, "memory already mapped\n");
+		return -EINVAL;
+	}
+
+	requested_pages = vma_pages(vma);
+	/* As the last page is reserved for the status and the starting ones are for
+	 * the rq, the mmap must be at least 2 pages big.
+	 */
+	if (requested_pages < 2) {
+		dev_err(pkdev->dev, "Invalid request pages: %d\n", requested_pages);
+		return -EINVAL;
+	}
+	/* Store number of rq pages. 1 page is reserved for status */
+	user->rq_pages = requested_pages - 1;
+	/* Requests memory can have up to 4 hardware pages. All hardware pages have the
+	 * same size. If requesting more than 4 OS pages, the hardware pages will use
+	 * the same multiple (pagemult) of OS pages. Thus the requested size for the
+	 * request queue must be a multiple of pagemult.
+	 */
+	pagemult = (requested_pages - 1 + 3) / 4;
+	if ((requested_pages - 1) % pagemult != 0) {
+		dev_err(pkdev->dev, "requested pages: %d not multiple of page multiplier: %d\n",
+			requested_pages, pagemult);
+		return -EINVAL;
+	}
+	/* hardware page size must be a power of 2, and as a consequence pagemult too. */
+	if ((pagemult & (pagemult - 1)) != 0) {
+		dev_err(pkdev->dev, "page multiplier: %d is not power of 2\n", pagemult);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < (requested_pages - 1) / pagemult; i++) {
+		user->rqmem[i] = dma_alloc_coherent(pkdev->dev, PAGE_SIZE * pagemult,
+						    &user->physrq[i], GFP_KERNEL);
+		if (!user->rqmem[i]) {
+			ret = -ENOMEM;
+			goto fail;
+		}
+		pk_wrreg(pkdev->regs, REG_RQ_CFG_PAGE(qid, i), user->physrq[i]);
+	}
+
+	user->stmem = dma_alloc_coherent(pkdev->dev, PAGE_SIZE, &user->physst, GFP_KERNEL);
+	if (!user->stmem) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	/* Configure unused rq pages with start of allocated shared mem. Those should not
+	 * be accessed, but if descriptors of a (malicious) user writes descriptors for
+	 * those pages, it will not break the rest of the system.
+	 */
+	for (i = (requested_pages - 1) / pagemult; i < MAX_RQMEM_PER_QUEUE; i++)
+		pk_wrreg(pkdev->regs, REG_RQ_CFG_PAGE(qid, i), user->physrq[0]);
+
+	pagemultshift = pagemult - 1;
+	pagemultshift = (pagemultshift & 5) + ((pagemultshift & 0xa) >> 1);
+	pagemultshift = (pagemultshift & 3) + ((pagemultshift >> 2) & 3);
+	pk_wrreg(pkdev->regs, REG_RQ_CFG_PAGE_SIZE(qid), PAGE_SHIFT + pagemultshift);
+	pk_wrreg(pkdev->regs, REG_RQ_CFG_PAGES_WREN(qid),
+		 (1 << ((requested_pages - 1) / pagemult)));
+
+	ret = mmap_dmamem(vma, pkdev, user->stmem, user->physst, 0, PAGE_SIZE);
+	if (ret)
+		goto fail;
+	for (i = 0; i < (requested_pages - 1) / pagemult; i++) {
+		ret = mmap_dmamem(vma, pkdev, user->rqmem[i], user->physrq[i],
+				  (i * pagemult + 1) * PAGE_SIZE, PAGE_SIZE * pagemult);
+		if (ret)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	amdpk_free_rqmem(pkdev, user);
+	if (user->stmem) {
+		dma_free_coherent(pkdev->dev, PAGE_SIZE, user->stmem, user->physst);
+		user->stmem = NULL;
+	}
+	return ret;
+}
+
+static int amdpk_accel_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	struct drm_file *dfp = fp->private_data;
+	struct amdpk_user *user;
+	int ret = 0;
+
+	user = dfp->driver_priv;
+	if (vma->vm_end < vma->vm_start)
+		return -EINVAL;
+
+	vma->vm_private_data = user;
+
+	switch (vma->vm_pgoff) {
+	case AMDPK_MMAP_REGS:
+		ret = amdpk_mmap_regs(vma);
+		break;
+	case AMDPK_MMAP_MEM:
+		ret = amdpk_mmap_mem(vma);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int amdpk_open(struct drm_device *dev, struct drm_file *file)
+{
+	struct amdpk_work *pkwork = NULL;
+	struct amdpk_user *user = NULL;
+	struct amdpk_dev *pkdev;
+	int ret, qid;
+
+	pkdev = to_amdpk_dev(dev);
+	qid = ida_alloc_range(&pkdev->avail_queues, 0, pkdev->max_queues - 1, GFP_KERNEL);
+	if (qid < 0)
+		return -ENOSPC;
+
+	get_device(pkdev->dev);
+
+	user = kzalloc(sizeof(*user), GFP_KERNEL);
+	if (!user) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+	user->pkdev = pkdev;
+	user->qid = qid;
+	user->rq_entries = 0;
+	file->driver_priv = user;
+	pkdev->users[qid] = user;
+
+	pkwork = kzalloc(sizeof(*pkwork), GFP_KERNEL);
+	if (!pkwork) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+	pkwork->qid = qid;
+	pkwork->pkdev = pkdev;
+	pkwork->user = user;
+	pkdev->work[qid] = pkwork;
+
+	return 0;
+
+fail:
+	kfree(user);
+	kfree(pkwork);
+	ida_free(&pkdev->avail_queues, qid);
+	put_device(pkdev->dev);
+	return ret;
+}
+
+static void amdpk_postclose(struct drm_device *dev, struct drm_file *file)
+{
+	struct amdpk_user *user = file->driver_priv;
+	struct amdpk_dev *pkdev = user->pkdev;
+	char __iomem *regs = pkdev->regs;
+
+	/* Set pkdev->users[qid] to NULL first, so that Completion interrupt handler gets
+	 * to know that this user will not exists, and so it does not schedule any completion
+	 * work on cq worker kthread.
+	 */
+	pkdev->users[user->qid] = NULL;
+
+	if (user->configured) {
+		unsigned int attempts = 0;
+
+		/* Disable RQCQ pages to help the hardware finish potential
+		 * pending requests sooner.
+		 */
+		pk_wrreg(regs, REG_RQ_CFG_PAGE_SIZE(user->qid), 0);
+		pk_wrreg(regs, REG_RQ_CFG_PAGES_WREN(user->qid), 0);
+		pk_wrreg(regs, REG_CQ_CFG_SIZE(user->qid), 0);
+
+		/* The hardware does not have a flush mechanism for the requests pending
+		 * in the RQ. Instead check periodically with REG_CTL_PENDING_REQS if the
+		 * user still has requests going on. If the hardware never completes the
+		 * requests, abort after a MAX_FLUSH_WAIT_ATTEMPTS and don't free resources.
+		 */
+		while (pk_rdreg(regs, REG_CTL_BASE(user->qid) + REG_CTL_PENDING_REQS)) {
+			attempts++;
+			if (attempts > MAX_FLUSH_WAIT_ATTEMPTS) {
+				dev_err(pkdev->dev,
+					"Time out waiting for hw completions. Resources leaked.\n");
+				goto abort_cleanup;
+			}
+			msleep(20);
+		}
+
+		if (pkdev->work[user->qid]->cq_wq) {
+			kthread_cancel_work_sync(&pkdev->work[user->qid]->cq_work);
+			kthread_destroy_worker(pkdev->work[user->qid]->cq_wq);
+		}
+
+		amdpk_free_rqmem(pkdev, user);
+		if (user->cqmem) {
+			dma_free_coherent(pkdev->dev, PAGE_SIZE, user->cqmem, user->physcq);
+			user->cqmem = NULL;
+		}
+		if (user->stmem) {
+			dma_free_coherent(pkdev->dev, PAGE_SIZE, user->stmem, user->physst);
+			user->stmem = NULL;
+		}
+
+		atomic_add(user->rq_entries, &pkdev->avail_qdepth);
+	}
+	ida_free(&pkdev->avail_queues, user->qid);
+
+abort_cleanup:
+	put_device(pkdev->dev);
+	kfree(pkdev->work[user->qid]);
+	pkdev->work[user->qid] = NULL;
+	kfree(user);
+}
+
+static const struct drm_ioctl_desc amdpk_accel_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(AMDPK_GET_INFO, amdpk_accel_get_info, 0),
+	DRM_IOCTL_DEF_DRV(AMDPK_SET_CONF, amdpk_accel_set_conf, 0),
+};
+
+static const struct file_operations amdpk_accel_fops = {
+	.owner		= THIS_MODULE,
+	.open		= accel_open,
+	.release	= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.llseek		= noop_llseek,
+	.mmap		= amdpk_accel_mmap,
+};
+
+static const struct drm_driver amdpk_accel_driver = {
+	.driver_features	= DRIVER_COMPUTE_ACCEL,
+
+	.name			= "amdpk_accel_driver",
+	.desc			= "AMD PKI Accelerator for versal-net",
+
+	.fops			= &amdpk_accel_fops,
+	.open			= amdpk_open,
+	.postclose		= amdpk_postclose,
+
+	.ioctls			= amdpk_accel_ioctls,
+	.num_ioctls		= ARRAY_SIZE(amdpk_accel_ioctls),
+};
+
+static int amdpk_create_device(struct amdpk_dev *pkdev, struct device *dev, int irq)
+{
+	u64 qdepth, ver;
+	long magic;
+	int ret;
+
+	magic = pk_rdreg(pkdev->regs, REG_MAGIC);
+	if (magic != AMDPK_MAGIC) {
+		dev_err(dev, "Invalid magic constant %08lx !\n", magic);
+		return -ENODEV;
+	}
+	ver = pk_rdreg(pkdev->regs, REG_SEMVER);
+	if (AMDPK_SEMVER_MAJOR(ver) != 1 || AMDPK_SEMVER_MINOR(ver) < 1) {
+		dev_err(dev, "Hardware version (%d.%d) not supported.\n",
+			(int)AMDPK_SEMVER_MAJOR(ver), (int)AMDPK_SEMVER_MINOR(ver));
+		return -ENODEV;
+	}
+
+	/* Reset all accelerators and the hw scheduler */
+	pk_wrreg(pkdev->regs, REG_PK_GLOBAL_STATE, 0x1);
+	pk_wrreg(pkdev->regs, REG_PK_GLOBAL_STATE, 0x0);
+
+	pkdev->max_queues = (int)pk_rdreg(pkdev->regs, REG_CFG_REQ_QUEUES_CNT);
+	qdepth = pk_rdreg(pkdev->regs, REG_CFG_MAX_PENDING_REQ);
+	atomic_set(&pkdev->avail_qdepth, qdepth);
+	pkdev->max_queues = (int)pk_rdreg(pkdev->regs, REG_CFG_REQ_QUEUES_CNT);
+
+	pk_wrreg(pkdev->regs, REG_IRQ_ENABLE, 0);
+	pk_wrreg(pkdev->regs, REG_PK_IRQ_RESET, ~0);
+	pk_wrreg(pkdev->regs, REG_IRQ_ENABLE, (1 << pkdev->max_queues) - 1);
+
+	ret = devm_request_irq(dev, irq, amdpk_cq_irq, 0, "amdpk", pkdev);
+	if (ret)
+		return ret;
+
+	ida_init(&pkdev->avail_queues);
+
+	return 0;
+}
+
+static void amdpk_remove_device(struct amdpk_dev *pkdev)
+{
+	drm_dev_unplug(&pkdev->ddev);
+	pk_wrreg(pkdev->regs, REG_IRQ_ENABLE, 0);
+	ida_destroy(&pkdev->avail_queues);
+}
+
+static int amdpk_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct amdpk_dev *pkdev;
+	struct resource *memres;
+	int irq, ret;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret < 0)
+		return ret;
+
+	pkdev = devm_drm_dev_alloc(dev, &amdpk_accel_driver, typeof(*pkdev), ddev);
+	if (IS_ERR(pkdev))
+		return PTR_ERR(pkdev);
+	pkdev->dev = dev;
+
+	memres = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pkdev->regs = devm_ioremap_resource(dev, memres);
+	if (IS_ERR(pkdev->regs))
+		return PTR_ERR(pkdev->regs);
+	pkdev->regsphys = memres->start;
+	platform_set_drvdata(pdev, pkdev);
+
+	if (platform_irq_count(pdev) != 1)
+		return -ENODEV;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -ENODEV;
+
+	ret = drm_dev_register(&pkdev->ddev, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "DRM register failed, ret %d", ret);
+		return ret;
+	}
+
+	return amdpk_create_device(pkdev, dev, irq);
+}
+
+static void amdpk_remove(struct platform_device *pdev)
+{
+	struct amdpk_dev *pkdev = platform_get_drvdata(pdev);
+
+	amdpk_remove_device(pkdev);
+}
+
+static void amdpk_shutdown(struct platform_device *pdev)
+{
+	amdpk_remove(pdev);
+}
+
+static const struct of_device_id amdpk_match_table[] = {
+	{ .compatible = "amd,versal-net-pki" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, amdpk_match_table);
+
+static struct platform_driver amdpk_pdrv = {
+	.probe = amdpk_probe,
+	.remove = amdpk_remove,
+	.shutdown = amdpk_shutdown,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = amdpk_match_table,
+	},
+};
+
+static int __init amdpk_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&amdpk_pdrv);
+	if (ret) {
+		pr_err("can't register platform driver\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit amdpk_exit(void)
+{
+	platform_driver_unregister(&amdpk_pdrv);
+}
+
+module_init(amdpk_init);
+module_exit(amdpk_exit);
+
+MODULE_AUTHOR("AMD");
+MODULE_DESCRIPTION("AMD PKI accelerator for versal-net");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/amdpk/amdpk_drv.h b/drivers/accel/amdpk/amdpk_drv.h
new file mode 100644
index 000000000000..c14c10db5d97
--- /dev/null
+++ b/drivers/accel/amdpk/amdpk_drv.h
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2021 Silex Insight sa
+ * Copyright (c) 2018-2021 Beerten Engineering scs
+ * Copyright (c) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __AMDPK_DRV_H__
+#define __AMDPK_DRV_H__
+
+#include <linux/types.h>
+#include <linux/kthread.h>
+#include <linux/io.h>
+#include <drm/drm_drv.h>
+#include <uapi/drm/amdpk.h>
+
+/* Magic number in the AMD PKI device, required to validate hardware access. */
+#define AMDPK_MAGIC 0x5113C50C
+
+/* Contains magic number 0x5113C5OC.
+ * Used to validate access to the hardware registers.
+ */
+#define REG_MAGIC (0x00)
+
+/* Contains version of the hardware interface as semver.
+ * The semantic version : major 8 bits, minor 8 bits in little endian order.
+ */
+#define REG_SEMVER (0x08)
+
+/* The number of request queues available in the hardware. */
+#define REG_CFG_REQ_QUEUES_CNT 0x10
+
+/* The maximum number of pending requests from all request queues combined. */
+#define REG_CFG_MAX_PENDING_REQ 0x18
+
+/* The maximum number of pending requests in a single request queue. */
+#define REG_CFG_MAX_REQ_QUEUE_ENTRIES 0x0020
+
+/* The first 16 bits give the amount of PK core instances with 64 multipliers.
+ * The next 16 bits give the amount of PK core instances with 256 multipliers.
+ */
+#define REG_CFG_PK_INST 0x28
+
+/* Writing 0x1 puts all pkcore accelerators and scheduler in reset.
+ * Writing 0x0 makes all pkcore accelerators and scheduler leave reset
+ * and become operational.
+ */
+#define REG_PK_GLOBAL_STATE 0x38
+
+/* The semantic version : major 8 bits, minor 8 bits,
+ * scm id 16 bits in little endian order.
+ */
+#define REG_HW_VERSION (0x40)
+
+/* Bitmask of which CQ interrupts are raised. */
+#define REG_PK_IRQ_STATUS 0x88
+
+/* Bitmask of which CQ may trigger interrupts. */
+#define REG_IRQ_ENABLE 0x90
+
+/* Bitmask of CQ interrupts to reset. */
+#define REG_PK_IRQ_RESET 0xA0
+
+/* Bus address of the page p for the given request queue.
+ * The address must be aligned on the page size.
+ */
+#define REG_RQ_CFG_PAGE(qid, pageidx) (0x00100 + (qid) * 0x80 + (pageidx) * 0x8)
+
+/* Size in bytes of the pages represented as a power of 2.
+ *
+ * Allowed values :
+ * ================ ==============
+ *  register value   size in bytes
+ * ================ ==============
+ *     7               128
+ *     8               256
+ *     9               512
+ *    10              1024
+ *    11              2048
+ *    12              4096
+ *    13              8192
+ *    14             16384
+ *    15             32768
+ *    16             65536
+ * ================ ==============
+ */
+#define REG_RQ_CFG_PAGE_SIZE(qid) (0x00120 + (qid) * 0x80)
+
+/* Index of the associated completion queue. */
+#define REG_RQ_CFG_CQID(qid) (0x00128 + (qid) * 0x80)
+
+/* Bit field of pages where descriptor can write to.
+ * When a bit is 1, a descriptor can write to the corresponding page.
+ */
+#define REG_RQ_CFG_PAGES_WREN(qid) (0x00138 + (qid) * 0x80)
+
+/* Maximum number of entries which can be written into this request queue. */
+#define REG_RQ_CFG_DEPTH(qid) (0x00140 + (qid) * 0x80)
+
+/* Bus address of the ring base of completion queue n.
+ * The address must be aligned on 64 bits.
+ */
+#define REG_CQ_CFG_ADDR(qid) (0x1100 + (qid) * 0x80)
+
+/* CQ notification trigger position. */
+#define REG_CTL_CQ_NTFY(qid) (0x2028 + (qid) * 0x1000)
+
+/* Size in bytes of the completion ring represented as a power of 2.
+ *
+ * Allowed sizes :
+ * ================ ============== ==============
+ *  register value   size in bytes  max entries
+ * ================ ============== ==============
+ *      7             128             16
+ *      8             256             32
+ *      9             512             64
+ *     10            1024            128
+ *     11            2048            256
+ *     12            4096            512
+ *     13            8192           1024
+ *     14           16384           2048
+ * ================ ============== ==============
+ */
+#define REG_CQ_CFG_SIZE(qid) (0x1108 + (qid) * 0x80)
+
+/* Interrupt number for this completion queue. */
+#define REG_CQ_CFG_IRQ_NR(qid) (0x1110 + (qid) * 0x80)
+
+/* Control registers base address for the given request completion queue pair. */
+#define REG_CTL_BASE(qid) (0x2000 + (qid) * 0x1000)
+
+/* Count of how many requests are queued at a given time for this RQCQ.
+ * When this count reaches 0, the resources of the request and
+ * completion queues can be deleted.
+ */
+#define REG_CTL_PENDING_REQS  0x18
+
+/* Busy cycle count register address. */
+#define REG_PK_BUSY_CYCLES 0x2108
+/* Busy cycle count  register address.*/
+#define REG_PK_IDLE_CYCLES 0x2110
+
+/* Hardware interface versions. */
+#define AMDPK_SEMVER_MAJOR(v) (((v) >> 24) & 0xff)
+#define AMDPK_SEMVER_MINOR(v) (((v) >> 16) & 0xff)
+#define AMDPK_SEMVER_PATCH(v) ((v) & 0xffff)
+
+/* Hardware implementation versions. */
+#define AMDPK_HWVER_MAJOR(v)  (((v) >> 24) & 0xff)
+#define AMDPK_HWVER_MINOR(v)  (((v) >> 16) & 0xff)
+#define AMDPK_HWVER_SVN(v)    ((v) & 0xffff)
+
+/* Maximum number of queues supported by the driver. */
+#define MAX_QUEUES 4
+
+/* Number of RQ memory addresses for each queue. */
+#define MAX_RQMEM_PER_QUEUE 4
+
+/* Wait attempts for HW to flush all requests before close. */
+#define MAX_FLUSH_WAIT_ATTEMPTS 500
+
+/* Bit 0 (0x1) is the Generation bit. */
+#define CQ_GENERATION_BIT BIT(0)
+
+/* Bit 1 (0x2) is set when completion is valid. */
+#define CQ_COMPLETION_BIT BIT(1)
+
+/* Maximal value of rq_entries is 512. There is 1 CQ of 4K bytes.
+ * Each completion status is 8 Bytes. Only 4096 / 8 = 512 entries
+ * are possible at any time.
+ */
+#define MAX_CQ_ENTRIES_ON_PAGE (PAGE_SIZE / 8)
+
+/* Forward declaration */
+struct amdpk_dev;
+struct amdpk_user;
+
+/* structure to hold completion queue information */
+struct amdpk_cq {
+	/* PKI device */
+	struct amdpk_dev *pkdev;
+	/* Base address of the completion queue */
+	u32 *base;
+	/* tail representing last completion */
+	unsigned int tail;
+	/* generation bit which toggles as per the device */
+	unsigned int generation;
+	/* size code as configured in REG_RQ_CFG_PAGE_SIZE */
+	u16 szcode;
+};
+
+/* represents PKI work context */
+struct amdpk_work {
+	/* PKI device */
+	struct amdpk_dev *pkdev;
+	/* PKI user */
+	struct amdpk_user *user;
+	/* Completion queue */
+	struct amdpk_cq pk_cq;
+	/* Kthread work associated with the PKI work */
+	struct kthread_work cq_work;
+	/* Kthred worker to handle completions */
+	struct kthread_worker *cq_wq;
+	/* Associated queue ID */
+	u16 qid;
+};
+
+/* AMD PKI device */
+struct amdpk_dev {
+	/* DRM device associated with PKI device */
+	struct drm_device ddev;
+	/* Core device */
+	struct device *dev;
+	/* PKI register space address */
+	char __iomem *regs;
+	/* PKI register space physical address */
+	resource_size_t regsphys;
+	/* Maximum queues supported by device. */
+	u16 max_queues;
+	/* Available queues */
+	struct ida avail_queues;
+	/* Total available queues */
+	atomic_t avail_qdepth;
+	/* List of all the AMD users */
+	struct amdpk_user *users[MAX_QUEUES];
+	/* PKI work for each queue */
+	struct amdpk_work *work[MAX_QUEUES];
+};
+
+/* AMD PKI user */
+struct amdpk_user {
+	/* PKI device */
+	struct amdpk_dev *pkdev;
+	/* Indicates if user has been configured */
+	bool configured;
+	/* Queue ID allocated for the user */
+	u16 qid;
+	/* Number of pages allocated on request queue */
+	u16 rq_pages;
+	/* RQ entries reserved for this user */
+	size_t rq_entries;
+	/* DMA address for RQ pages */
+	dma_addr_t physrq[MAX_RQMEM_PER_QUEUE];
+	/* RQ pages addresses */
+	u8 *rqmem[MAX_RQMEM_PER_QUEUE];
+	/* DMA address for CQ page */
+	dma_addr_t physcq;
+	/* CQ page address */
+	u8 *cqmem;
+	/* DMA address for status page */
+	dma_addr_t physst;
+	/* Status page address */
+	u8 *stmem;
+	/* Eventfd context for each request */
+	struct eventfd_ctx *evfd_ctx[MAX_PK_REQS];
+};
+
+#define to_amdpk_dev(dev) container_of(dev, struct amdpk_dev, ddev)
+#define to_amdpk_work(work) container_of(work, struct amdpk_work, cq_work)
+
+static void __maybe_unused pk_wrreg(char __iomem *regs, int addr, u64 val)
+{
+	iowrite64(val, regs + addr);
+}
+
+static u64 pk_rdreg(char __iomem *regs, int addr)
+{
+	return ioread64(regs + addr);
+}
+
+#endif /* __AMDPK_DRV_H__ */
diff --git a/include/uapi/drm/amdpk.h b/include/uapi/drm/amdpk.h
new file mode 100644
index 000000000000..e5e18fdbc2c4
--- /dev/null
+++ b/include/uapi/drm/amdpk.h
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __AMDPK_H__
+#define __AMDPK_H__
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define MAX_PK_REQS		256
+
+struct amdpk_info {
+	/** maximum available queue depth */
+	unsigned int avail_qdepth;
+};
+
+struct amdpk_conf {
+	/** queue depth to configure */
+	unsigned int qdepth;
+	/** eventfd's associated with the descriptors */
+	int eventfd[MAX_PK_REQS];
+};
+
+/* IOCTL */
+#define DRM_AMDPK_GET_INFO	0x0
+#define DRM_AMDPK_SET_CONF	0x1
+
+#define DRM_IOCTL_AMDPK_GET_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDPK_GET_INFO, \
+						 struct amdpk_info)
+#define DRM_IOCTL_AMDPK_SET_CONF	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDPK_SET_CONF, \
+						 struct amdpk_conf)
+
+/* MMAP */
+#define AMDPK_MMAP_REGS		0
+#define AMDPK_MMAP_MEM		1
+
+/* Completion Status */
+#define CQ_STATUS_INVALID	0x0
+#define CQ_STATUS_VALID		0x80000000
+#define CQ_COMPLETION_ERROR	0x40000000
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __AMDPK_H__ */
--
2.34.1

