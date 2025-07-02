Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84FAF5DB7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A495310E72F;
	Wed,  2 Jul 2025 15:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qG2sYTWU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07910E72B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md+eSfYI0oUvvFGzzsnPGq4eq1cf5vxy3k/X46d0jH9RsNGkhfYyn2t1++eRqwfK9wdraeNrHQgtFowGfDHT8uyzq4n6/RJm5yCyRSmgzdMsUt82970uP7qRCxBEy4IGS44tRkeS/1rf5BTDDQ8iP9xTqClL0ookPoi6d01fCjX9hnE65oGOWCe54qGznqruYnJ2DTSHgZByHbQ8OS95lGxhO7jjHXhZS/ybOLrlqI84ZAVq4iwJ7Qdph3AXvVpTqPtuF/3HGQVmwzWZzZASVO7+yfI39BxlrZd747amZEiN2WILLp5QKTfP6JD1tKw9HxpTRsWwmeFHdGlYi8Aq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+nn+hs0Q1OrwLyWQKiy94FCYUBd1Iu3JrZEjhGT6/w=;
 b=SHwDF0pOMkw/dla4vxVoxCDH05yFQVh+px6XbXz9c8UrFXsTIFyChZX9zF61lVMN6gpAWGvv1hC92w6FMKJiZWZyYEEeGu4lzA5ToI4XATJEo5IOL9wLElmsONHSznFvnQJY7QagMHZIlsDHIOQOvnNmNANTAMhaVQkZbBHiIUB+LqGqYyI93yFy/HsLq6SDFMDkyidAYK7vJ8B128NnarwDjYL5OQsrIf1JyKdwgZYUNMFMnqjnBixcPkXcts4L0IN0SeIR/V/00dj+ruAJsPVlXcYpsGV4+KnTybMKgphlqGCIyioC1odRTPOeKgrfdi5U+kksJRCPczsZdcIAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+nn+hs0Q1OrwLyWQKiy94FCYUBd1Iu3JrZEjhGT6/w=;
 b=qG2sYTWUbIRKHO4Ibw4Wx337p8g9U8DgDBc3Y8CAA75iEOs0frBCFj3oWO6s2Z5s1pOQmWDyQIOOmH48CSWOf2BTXxMWB8gQksDGqW7bp1X6cDSrxWcKGk4FxMCgb+aCHy16BBSHLw7R3cRAfzoz6WcIs79eKKSQH77eG+L5rF0=
Received: from CH5PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:1f1::10)
 by SA5PPF5D41D38AD.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 2 Jul
 2025 15:56:45 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1f1:cafe::d2) by CH5PR03CA0020.outlook.office365.com
 (2603:10b6:610:1f1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:44 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:44 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 5/9] accel: amd-ai-engine: Add AMD AI Engine device driver
Date: Wed, 2 Jul 2025 08:56:26 -0700
Message-ID: <20250702155630.1737227-6-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA5PPF5D41D38AD:EE_
X-MS-Office365-Filtering-Correlation-Id: 0850674c-19cb-4a4d-d8fc-08ddb9810bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BrP4efakdEaN/37i0kzXH3mijuwEUMyg9QnB1IHz0Nh9lNP6UGbh8dKXeLFY?=
 =?us-ascii?Q?AAT6zbb9Tv6ckqwzDHoHpLB66E2/tr39QkiiBMeyw0rw4FCvCLS4LXM3TUVs?=
 =?us-ascii?Q?aEaJPLYlN6lOlm1ZBWPCpoey9h0mS966NfuVtH9DDGEvbYxn0K6IZU5E3B9e?=
 =?us-ascii?Q?Gmcx588YyEvFjTz9J2VohpF37C5zNFjDd7t1sJ4FWQygOC9PoFqvsC4mjH4o?=
 =?us-ascii?Q?uk7M70U4gnLGtw9we32Sio38UqQsnXynZVptVTNGh7MuGDjipvjx4oC3WN7A?=
 =?us-ascii?Q?HzvWdEf/L9ilt6fydK7g1ikjq//6FrelmGYA6VUYzFFWCUt85ps7zfdmJrPk?=
 =?us-ascii?Q?FwCM/NTAM7/5ZZUSl3NWDvAQ2QFuM3ikMJZKZ6emkS9S+nUkdeqZKPwikFpA?=
 =?us-ascii?Q?TqKO/HLO0NVLVJhQB7zuqaTA9ckxRhG7RYXqYnsyVs0YRyMwoidgBlwfpqdC?=
 =?us-ascii?Q?C8ywCSE07AVaJnOdtmGwwgvTJfgLk7n1HC409mtW4d+aSS9xo4DxCZAPBGeK?=
 =?us-ascii?Q?HF9RoNtWtV7Uj3JUz0X6T+51sZv6cRxcWQzatOWkx2tW67BmHbBravWJEdv3?=
 =?us-ascii?Q?J5UoS1Z6ZJtUogjMRJZC0soltbGvhkTFS7H2g3QCNr014AgHuBA86C5RxAQ1?=
 =?us-ascii?Q?tfC52hLWXlvC+EIiuIEKM6w/KIFYuR0fG8frmYq70Nbjj9DVq+fZRwzldNhW?=
 =?us-ascii?Q?gwsBsWWh+ADE3XvBCeZEb7eoSvmpjn8etB7Bebhto7ji7dPLCAdK6mzT9+WI?=
 =?us-ascii?Q?Kv1OFQ/eGkKI7APdBZ+cnrSl6aQlZDj3Zu5Gzdm4xkfjCRVpZyJIkAk+JTaM?=
 =?us-ascii?Q?GAF53dQV44RjBpexK3PuAEvPC8h8/DpGhRcowMnRILovpIZPbTD+uwi5YgSg?=
 =?us-ascii?Q?rIIRW22mfZHHIsCJhRu6ZEQ6xK8l2aBsdEgaml/etEmR+a2WTYEMauTmZU+Q?=
 =?us-ascii?Q?bIiGWO0mCBnj/BaJSih1Ito8rHcSjZEy1zJgOvkj61vNoeAtGXrZovaKMtJz?=
 =?us-ascii?Q?SKdzgKxe7PXce8Ycn3rYhZqzzGzY3fOyFL+vwHfWYRc0k2IXThWqEuWRXmmM?=
 =?us-ascii?Q?uyPvU8OuSv6YyuDZMOXfVL0cHRazZguUwbj2b2oEKpxKHG6QeOQ8RmTu/Gzm?=
 =?us-ascii?Q?5cyiZL8oBQpRZ9BtIhLgA9Xbd9GzN6iZQty7bPKtEkhKqJyKEjJg+nXu+AYZ?=
 =?us-ascii?Q?wB15FqMdXYihLkTEzIyZhQ7TDbVjDoKTBDjRKt/I9Y2fKW1r634gaQIcLZoY?=
 =?us-ascii?Q?Macu/ugKE7ZoEfQq5321UWX58TPcYkTsYGBeDoQNZuH+i/3JEuex816SoBWl?=
 =?us-ascii?Q?QsilJGPloi5YiqK6UY8EdCmfpaNR1SQslkM7iCIcl2M/SpfUWCZ7OBVFZd24?=
 =?us-ascii?Q?HdXrEtKhR18ONLPc4LKXocjtBTs0Q5diygeiFSjm2ljlmeG8K0Sq328FDxkI?=
 =?us-ascii?Q?q9eXsXi69n3gB3tbspo4wfVQdiXcJiRnM6ffQJDq6VZbtEVt7cGtew=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:45.6677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0850674c-19cb-4a4d-d8fc-08ddb9810bd9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF5D41D38AD
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

Add support for AMD AI Engine on AMD Versal devices. AMD AI Engine is an
array based accelerator for applications like beamforming and machine
learning inference [1].

AI Engine device handle can have multiple apertures (groups of AI engine
columns) that are isolated from one another. At runtime, applications can
request for multiple partitions within an aperture.

The driver architecture:
  +----------------------------------------+
  |               AIE Device               |
  | +----------------+  +----------------+ |
  | |   aperture_0   |  |   aperture_X   | |
  | |----------------|  |----------------| |
  | |   partition_0  |  |   partition_0  | |
  | |      ...       |  |      ...       | |
  | |   partition_X  |  |   partition_X  | |
  | +----------------+  +----------------+ |
  +----------------------------------------+

The driver provides the following functionality:
- AI Engine device probe and aperture probe
- Partition request and release
- Setting partition frequency
- Partition setup and teardown

[1] https://www.amd.com/en/products/adaptive-socs-and-fpgas/technologies/ai-engine.html

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 MAINTAINERS                                   |   9 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amd-ai-engine/Kconfig           |  15 ++
 drivers/accel/amd-ai-engine/Makefile          |  12 +
 drivers/accel/amd-ai-engine/ai-engine-aie.c   |  46 ++++
 .../accel/amd-ai-engine/ai-engine-aperture.c  | 195 +++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-dev.c   | 228 +++++++++++++++++
 .../accel/amd-ai-engine/ai-engine-internal.h  | 230 ++++++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-part.c  |  65 +++++
 drivers/accel/amd-ai-engine/ai-engine-res.c   | 114 +++++++++
 include/linux/amd-ai-engine.h                 |  46 ++++
 12 files changed, 962 insertions(+)
 create mode 100644 drivers/accel/amd-ai-engine/Kconfig
 create mode 100644 drivers/accel/amd-ai-engine/Makefile
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aie.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aperture.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-dev.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-internal.h
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-part.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-res.c
 create mode 100644 include/linux/amd-ai-engine.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f69a86b9610a..cf03943d2d7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1007,6 +1007,15 @@ L:	dmaengine@vger.kernel.org
 S:	Supported
 F:	drivers/dma/amd/ae4dma/
 
+AMD AI ENGINE DRIVER
+M:	Gregory Williams <gregory.williams@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
+F:	drivers/accel/amd-ai-engine/
+F:	include/linux/amd-ai-engine.h
+
 AMD AXI W1 DRIVER
 M:	Kris Chaplin <kris.chaplin@amd.com>
 R:	Thomas Delev <thomas.delev@amd.com>
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index 5b9490367a39..22a7a7f19d9a 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -24,6 +24,7 @@ menuconfig DRM_ACCEL
 	  different device files, called accel/accel* (in /dev, sysfs
 	  and debugfs).
 
+source "drivers/accel/amd-ai-engine/Kconfig"
 source "drivers/accel/amdxdna/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index a301fb6089d4..a79c97a39ca1 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+obj-$(CONFIG_DRM_ACCEL_AMDAIE)		+= amd-ai-engine/
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
diff --git a/drivers/accel/amd-ai-engine/Kconfig b/drivers/accel/amd-ai-engine/Kconfig
new file mode 100644
index 000000000000..c82b2ab58f71
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_AMDAIE
+	tristate "AMD Versal AI Engine"
+	depends on ARM64 || COMPILE_TEST
+	depends on ZYNQMP_FIRMWARE
+	depends on DRM_ACCEL
+	help
+	  This option enables support for the AMD AI engine driver.
+	  One AMD AI engine device can have multiple partitions (groups of
+	  AI engine tiles). AMD AI engine device driver instance manages
+	  AI engine partitions. Applications access its partitions through
+	  AI engine partition device instance.
+
+	  If unsure, say N
diff --git a/drivers/accel/amd-ai-engine/Makefile b/drivers/accel/amd-ai-engine/Makefile
new file mode 100644
index 000000000000..ed635a2f2602
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for AMD AI engine device driver
+
+obj-$(CONFIG_DRM_ACCEL_AMDAIE)	+= amd-aie.o
+
+amd-aie-$(CONFIG_DRM_ACCEL_AMDAIE) := \
+	ai-engine-aie.o		\
+	ai-engine-aperture.o	\
+	ai-engine-dev.o		\
+	ai-engine-part.o	\
+	ai-engine-res.o
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aie.c b/drivers/accel/amd-ai-engine/ai-engine-aie.c
new file mode 100644
index 000000000000..7b4be8d2c5eb
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-aie.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine driver AIE device specific implementation
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+
+#include "ai-engine-internal.h"
+
+#define AIE_ARRAY_SHIFT		30U
+#define AIE_COL_SHIFT		23U
+#define AIE_ROW_SHIFT		18U
+
+static u32 aie_get_tile_type(struct aie_device *adev, struct aie_location *loc)
+{
+	if (loc->row)
+		return AIE_TILE_TYPE_TILE;
+	/* SHIM row */
+	if ((loc->col % 4) < 2)
+		return AIE_TILE_TYPE_SHIMPL;
+
+	return AIE_TILE_TYPE_SHIMNOC;
+}
+
+static const struct aie_tile_operations aie_ops = {
+	.get_tile_type = aie_get_tile_type,
+};
+
+/**
+ * aie_device_init() - Initialize AI engine device struct AIE specific
+ * @adev: AI engine device
+ *
+ * This function initialize the AI engine device structure device version
+ * specific elements such as register addressing related array shift,
+ * column shift, and row shift; AIE device specific device operations, device
+ * columns resource.
+ */
+void aie_device_init(struct aie_device *adev)
+{
+	adev->array_shift = AIE_ARRAY_SHIFT;
+	adev->col_shift = AIE_COL_SHIFT;
+	adev->row_shift = AIE_ROW_SHIFT;
+	adev->ops = &aie_ops;
+}
diff --git a/drivers/accel/amd-ai-engine/ai-engine-aperture.c b/drivers/accel/amd-ai-engine/ai-engine-aperture.c
new file mode 100644
index 000000000000..80346a0a18dc
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-aperture.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine aperture driver
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/device.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_aperture_request_part() - request AI engine partition
+ * @aperture: AI engine aperture
+ * @req: AI engine partition request arguments
+ *
+ * Return: partition pointer for success, and error pointer for failure
+ */
+struct aie_partition *
+aie_aperture_request_part(struct aie_aperture *aperture,
+			  struct aie_partition_req *req)
+{
+	u8 start_col, num_col, end_col;
+	struct aie_partition *apart;
+	int ret;
+
+	start_col = req->start_col;
+	num_col = req->num_col;
+	if (num_col == 0) {
+		start_col = aperture->range.start.col;
+		num_col = aperture->range.size.col;
+	}
+
+	end_col = start_col + num_col - 1;
+	if (start_col < aperture->range.start.col ||
+	    end_col >= (aperture->range.start.col + aperture->range.size.col))
+		return ERR_PTR(-ERANGE);
+
+	mutex_lock(&aperture->mlock);
+	ret = aie_resource_get_region(&aperture->cols_res,
+				      start_col - aperture->range.start.col,
+				      num_col);
+	if (ret != (u32)start_col - aperture->range.start.col) {
+		/* Column range returned is not what user requested */
+		if (ret > 0)
+			aie_resource_put_region(&aperture->cols_res, ret, num_col);
+		mutex_unlock(&aperture->mlock);
+		return ERR_PTR(-EBUSY);
+	}
+
+	apart = aie_part_create(aperture, start_col, num_col);
+	if (IS_ERR(apart)) {
+		aie_resource_put_region(&aperture->cols_res,
+					start_col - aperture->range.start.col,
+					num_col);
+		mutex_unlock(&aperture->mlock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	list_add_tail(&apart->node, &aperture->partitions);
+	mutex_unlock(&aperture->mlock);
+	return apart;
+}
+
+int aie_aperture_probe(struct platform_device *pdev)
+{
+	struct aie_device *adev = dev_get_drvdata(pdev->dev.parent);
+	struct aie_aperture *laperture, *aperture;
+	struct aie_range *range;
+	u32 regs[2];
+	int ret;
+
+	aperture = devm_kzalloc(&pdev->dev, sizeof(*aperture), GFP_KERNEL);
+	if (!aperture)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, aperture);
+	INIT_LIST_HEAD(&aperture->partitions);
+	mutex_init(&aperture->mlock);
+
+	aperture->dev = &pdev->dev;
+	range = &aperture->range;
+	ret = of_property_read_u32_array(pdev->dev.of_node, "xlnx,columns",
+					 regs, ARRAY_SIZE(regs));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"probe %pOF failed, no tiles range information.",
+			pdev->dev.of_node);
+		return ret;
+	}
+	range->start.col = regs[0] & aligned_byte_mask(1);
+	range->size.col = regs[1] & aligned_byte_mask(1);
+	range->start.row = 0;
+	range->size.row = adev->ttype_attr[AIE_TILE_TYPE_SHIMPL].num_rows +
+			  adev->ttype_attr[AIE_TILE_TYPE_MEMORY].num_rows +
+			  adev->ttype_attr[AIE_TILE_TYPE_TILE].num_rows;
+
+	ret = of_property_read_u32_index(pdev->dev.of_node, "xlnx,node-id", 0,
+					 &aperture->node_id);
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"probe %pOF failed, no aperture node id.",
+			pdev->dev.of_node);
+		return ret;
+	}
+
+	/* Validate the aperture */
+	list_for_each_entry(laperture, &adev->apertures, node) {
+		u32 start_col, end_col, check_start_col, check_end_col;
+
+		if (laperture->node_id == aperture->node_id) {
+			dev_err(&pdev->dev,
+				"probe failed, aperture %u exists.",
+				aperture->node_id);
+			return -EINVAL;
+		}
+
+		range = &aperture->range;
+		start_col = range->start.col;
+		end_col  = start_col + range->size.col - 1;
+		check_start_col = laperture->range.start.col;
+		check_end_col = check_start_col + laperture->range.size.col - 1;
+		if ((start_col >= check_start_col &&
+		     start_col <= check_end_col) ||
+		    (end_col >= check_start_col &&
+		     end_col <= check_end_col)) {
+			dev_err(&pdev->dev,
+				"probe failed, aperture %x overlaps other aperture.",
+				aperture->node_id);
+			return -EINVAL;
+		}
+	}
+
+	/*
+	 * Initialize columns resource map to remember which columns have been
+	 * assigned. Used for partition management.
+	 */
+	ret = aie_resource_initialize(&aperture->cols_res,
+				      aperture->range.size.col);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to initialize columns resource.");
+		return ret;
+	}
+
+	aperture->base = devm_ioremap_resource(&pdev->dev, pdev->resource);
+	if (!aperture->base) {
+		ret = -ENOMEM;
+		goto aie_res_uninit;
+	}
+
+	ret = zynqmp_pm_request_node(aperture->node_id,
+				     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Unable to request node %d", aperture->node_id);
+		goto aie_res_uninit;
+	}
+
+	dev_set_name(&pdev->dev, "aieaperture_%u_%u", aperture->range.start.col,
+		     aperture->range.size.col);
+	dev_info(&pdev->dev,
+		 "AI engine aperture %s, id 0x%x, cols(%u, %u) aie_tile_rows(%u, %u) memory_tile_rows(%u, %u) is probed successfully.",
+		 dev_name(&pdev->dev), aperture->node_id,
+		 aperture->range.start.col, aperture->range.size.col,
+		 adev->ttype_attr[AIE_TILE_TYPE_TILE].start_row,
+		 adev->ttype_attr[AIE_TILE_TYPE_TILE].num_rows,
+		 adev->ttype_attr[AIE_TILE_TYPE_MEMORY].start_row,
+		 adev->ttype_attr[AIE_TILE_TYPE_MEMORY].num_rows);
+
+	aperture->adev = adev;
+	mutex_lock(&adev->mlock);
+	list_add_tail(&aperture->node, &adev->apertures);
+	mutex_unlock(&adev->mlock);
+
+	return ret;
+
+aie_res_uninit:
+	aie_resource_uninitialize(&aperture->cols_res);
+	return ret;
+}
+
+void aie_aperture_remove(struct platform_device *pdev)
+{
+	struct aie_aperture *aperture = platform_get_drvdata(pdev);
+
+	aie_resource_uninitialize(&aperture->cols_res);
+	zynqmp_pm_release_node(aperture->node_id);
+}
diff --git a/drivers/accel/amd-ai-engine/ai-engine-dev.c b/drivers/accel/amd-ai-engine/ai-engine-dev.c
new file mode 100644
index 000000000000..ba28257cbd04
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-dev.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine device driver
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_partition_request() - Request an AI engine partition
+ * @dev: AI engine device pointer
+ * @req: AI engine partition request arguments
+ *
+ * Return: pointer to the AI engine partition, error pointer value for failure.
+ *
+ * This function searches through the aie device aperture list to request a
+ * partition given start column and number of columns in @req. If the partition
+ * can be found, it will try to request it. User can only use the AI engine
+ * partition after it is successfully requested.
+ */
+void *aie_partition_request(struct device *dev, struct aie_partition_req *req)
+{
+	struct aie_device *adev = dev_get_drvdata(dev);
+	struct aie_partition *apart = NULL;
+	struct aie_aperture *laperture;
+
+	if (!req)
+		return ERR_PTR(-EINVAL);
+
+	list_for_each_entry(laperture, &adev->apertures, node) {
+		apart = aie_aperture_request_part(laperture, req);
+		if (PTR_ERR(apart) == -ERANGE) {
+			continue;
+		} else if (PTR_ERR(apart) == -EBUSY) {
+			/* if requesting full aperture, try next aperture in list */
+			if (req->num_col == 0)
+				continue;
+			dev_err(laperture->dev,
+				"failed to request partition (%u,%u), already in use.",
+				req->start_col, req->num_col);
+			return ERR_PTR(PTR_ERR(apart));
+		} else if (IS_ERR(apart)) {
+			dev_err(laperture->dev,
+				"failed to create partition (%u, %u).",
+				req->start_col, req->num_col);
+			return ERR_PTR(PTR_ERR(apart));
+		}
+		break;
+	}
+
+	if (IS_ERR_OR_NULL(apart)) {
+		dev_err(adev->dev,
+			"failed to request partition (%u, %u): invalid partition.",
+			req->start_col, req->num_col);
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_info(adev->dev, "Partition (%u, %u) created successfully.",
+		 apart->range.start.col, apart->range.size.col);
+	return apart;
+}
+EXPORT_SYMBOL_GPL(aie_partition_request);
+
+/**
+ * aie_partition_release() - Decrease refcount of the AI engine partition
+ * @apart: AI engine partition device pointer
+ */
+void aie_partition_release(void *apart)
+{
+	aie_part_release((struct aie_partition *)apart);
+}
+EXPORT_SYMBOL_GPL(aie_partition_release);
+
+static const struct of_device_id amd_aie_aperture_of_match[] = {
+	{ .compatible = "xlnx,ai-engine-aperture", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, amd_aie_aperture_of_match);
+
+static struct platform_driver amd_aie_aperture_driver = {
+	.probe			= aie_aperture_probe,
+	.remove			= aie_aperture_remove,
+	.driver			= {
+		.name		= "amd-aie-aperture",
+		.of_match_table	= amd_aie_aperture_of_match,
+	},
+};
+
+static int amd_ai_engine_probe(struct platform_device *pdev)
+{
+	struct aie_device *adev;
+	u32 pm_reg[2];
+	u8 regs_u8[2];
+	u8 aie_gen;
+	int ret;
+
+	adev = devm_kzalloc(&pdev->dev, sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, adev);
+	INIT_LIST_HEAD(&adev->apertures);
+	mutex_init(&adev->mlock);
+
+	ret = of_property_read_u8_array(pdev->dev.of_node, "xlnx,shim-rows",
+					regs_u8, ARRAY_SIZE(regs_u8));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"no SHIM rows information in device tree");
+		return ret;
+	}
+	adev->ttype_attr[AIE_TILE_TYPE_SHIMPL].start_row = regs_u8[0];
+	adev->ttype_attr[AIE_TILE_TYPE_SHIMPL].num_rows = regs_u8[1];
+	adev->ttype_attr[AIE_TILE_TYPE_SHIMNOC].start_row = regs_u8[0];
+	adev->ttype_attr[AIE_TILE_TYPE_SHIMNOC].num_rows = regs_u8[1];
+
+	ret = of_property_read_u8_array(pdev->dev.of_node, "xlnx,core-rows",
+					regs_u8, ARRAY_SIZE(regs_u8));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to read core rows information");
+		return ret;
+	}
+	adev->ttype_attr[AIE_TILE_TYPE_TILE].start_row = regs_u8[0];
+	adev->ttype_attr[AIE_TILE_TYPE_TILE].num_rows = regs_u8[1];
+
+	ret = of_property_read_u8_array(pdev->dev.of_node, "xlnx,mem-rows",
+					regs_u8, ARRAY_SIZE(regs_u8));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to read mem rows information");
+		return ret;
+	}
+	adev->ttype_attr[AIE_TILE_TYPE_MEMORY].start_row = regs_u8[0];
+	adev->ttype_attr[AIE_TILE_TYPE_MEMORY].num_rows = regs_u8[1];
+
+	ret = of_property_read_u8(pdev->dev.of_node, "xlnx,aie-gen", &aie_gen);
+	if (ret < 0) {
+		dev_warn(&pdev->dev,
+			 "no aie dev generation information in device tree");
+		return ret;
+	}
+	adev->dev_gen = aie_gen;
+	if (aie_gen == AIE_DEVICE_GEN_AIE) {
+		aie_device_init(adev);
+	} else {
+		dev_err(&pdev->dev, "Invalid device generation");
+		return -EINVAL;
+	}
+
+	/*
+	 * AI Engine platform management node ID is required for requesting
+	 * services from firmware driver.
+	 */
+	ret = of_property_read_u32_array(pdev->dev.of_node, "power-domains",
+					 pm_reg, ARRAY_SIZE(pm_reg));
+	if (ret < 0) {
+		dev_err(&pdev->dev,
+			"Failed to read power manangement information");
+		return ret;
+	}
+	adev->pm_node_id = pm_reg[1];
+
+	adev->clk = devm_clk_get(&pdev->dev, "aclk0");
+	if (IS_ERR(adev->clk)) {
+		dev_err(&pdev->dev, "Failed to get device clock.");
+		return PTR_ERR(adev->clk);
+	}
+
+	adev->dev = &pdev->dev;
+	dev_info(&pdev->dev,
+		 "AMD AI Engine device %s probed. Device generation: %u. Clock frequency: %ldHz.",
+		 dev_name(&pdev->dev), aie_gen, clk_get_rate(adev->clk));
+	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+}
+
+static const struct of_device_id amd_ai_engine_of_match[] = {
+	{ .compatible = "xlnx,ai-engine-v2.0", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, amd_ai_engine_of_match);
+
+static struct platform_driver amd_ai_engine_driver = {
+	.probe			= amd_ai_engine_probe,
+	.driver			= {
+		.name		= "amd-ai-engine",
+		.of_match_table	= amd_ai_engine_of_match,
+	},
+};
+
+static int __init amd_ai_engine_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&amd_ai_engine_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&amd_aie_aperture_driver);
+	if (ret) {
+		platform_driver_unregister(&amd_ai_engine_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(amd_ai_engine_init);
+
+static void __exit amd_ai_engine_exit(void)
+{
+	platform_driver_unregister(&amd_aie_aperture_driver);
+	platform_driver_unregister(&amd_ai_engine_driver);
+}
+module_exit(amd_ai_engine_exit);
+
+MODULE_AUTHOR("Advanced Micro Devices, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/amd-ai-engine/ai-engine-internal.h b/drivers/accel/amd-ai-engine/ai-engine-internal.h
new file mode 100644
index 000000000000..4f1d8ace2977
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-internal.h
@@ -0,0 +1,230 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD AI Engine driver internal header
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef AIE_INTERNAL_H
+#define AIE_INTERNAL_H
+
+#include <linux/amd-ai-engine.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define AIE_DEVICE_GEN_AIE	1U
+
+#define KBYTES(n)		((n) * SZ_1K)
+
+/*
+ * Macros for AI engine tile type bitmasks
+ */
+enum aie_tile_type {
+	AIE_TILE_TYPE_TILE,
+	AIE_TILE_TYPE_SHIMPL,
+	AIE_TILE_TYPE_SHIMNOC,
+	AIE_TILE_TYPE_MEMORY,
+	AIE_TILE_TYPE_MAX
+};
+
+#define AIE_TILE_TYPE_MASK_TILE		BIT(AIE_TILE_TYPE_TILE)
+#define AIE_TILE_TYPE_MASK_SHIMPL	BIT(AIE_TILE_TYPE_SHIMPL)
+/* SHIM NOC tile includes SHIM PL and SHIM NOC modules */
+#define AIE_TILE_TYPE_MASK_SHIMNOC	BIT(AIE_TILE_TYPE_SHIMNOC)
+#define AIE_TILE_TYPE_MASK_MEMORY	BIT(AIE_TILE_TYPE_MEMORY)
+
+/**
+ * struct aie_tile_regs - contiguous range of AI engine register
+ *			  within an AI engine tile
+ * @soff: start offset of the range
+ * @eoff: end offset of the range
+ * @attribute: registers attribute. It uses AIE_REGS_ATTR_* macros defined
+ *	       above.
+ */
+struct aie_tile_regs {
+	size_t soff;
+	size_t eoff;
+	u32 attribute;
+};
+
+/**
+ * struct aie_single_reg_field - AI engine single field register attribute
+ * @mask: field mask
+ * @regoff: register offset of the field
+ */
+struct aie_single_reg_field {
+	u32 mask;
+	u32 regoff;
+};
+
+struct aie_device;
+struct aie_partition;
+struct aie_aperture;
+
+/**
+ * struct aie_tile_operations - AI engine device operations
+ * @get_tile_type: get type of tile based on tile operation
+ * Different AI engine device version has its own device
+ * operation.
+ */
+struct aie_tile_operations {
+	u32 (*get_tile_type)(struct aie_device *adev, struct aie_location *loc);
+};
+
+/**
+ * struct aie_resource - AI engine resource structure
+ * @bitmap: resource bitmap
+ * @total: total number of resource
+ */
+struct aie_resource {
+	unsigned long *bitmap;
+	u32 total;
+};
+
+/**
+ * struct aie_range - AIE range information
+ * @start: start tile location
+ * @size: size of the range, number of columns and rows
+ */
+struct aie_range {
+	struct aie_location start;
+	struct aie_location size;
+};
+
+/**
+ * struct aie_tile_attr - AI engine device tile type attributes
+ * @start_row: start row
+ * @num_rows: number of rows
+ * @num_mods: number of modules of this tile type
+ * @mods: array of module types of this tile type
+ */
+struct aie_tile_attr {
+	u8 start_row;
+	u8 num_rows;
+	u8 num_mods;
+	const enum aie_module_type *mods;
+};
+
+/**
+ * struct aie_device - AI engine device structure
+ * @apertures: list of apertures
+ * @dev: device pointer for the AI engine device
+ * @mlock: protection for AI engine device operations
+ * @clk: AI enigne device clock
+ * @ops: tile operations
+ * @array_shift: array address shift
+ * @col_shift: column address shift
+ * @row_shift: row address shift
+ * @dev_gen: aie hardware device generation
+ * @pm_node_id: AI Engine platform management node ID
+ * @ttype_attr: tile type attributes
+ */
+struct aie_device {
+	struct list_head apertures;
+	struct device *dev;
+	struct mutex mlock; /* protection for AI engine apertures */
+	struct clk *clk;
+	const struct aie_tile_operations *ops;
+	u32 array_shift;
+	u32 col_shift;
+	u32 row_shift;
+	u32 dev_gen;
+	u32 pm_node_id;
+	struct aie_tile_attr ttype_attr[AIE_TILE_TYPE_MAX];
+};
+
+/**
+ * struct aie_aperture - AI engine aperture structure
+ * @node: list node
+ * @partitions: list of partitions of this aperture
+ * @dev: device pointer for the AI engine aperture device
+ * @adev: pointer to AI device instance
+ * @mlock: protection for AI engine aperture operations
+ * @base: AI engine aperture base virtual address
+ * @cols_res: AI engine columns resources to indicate
+ *	      while columns are occupied by partitions.
+ * @node_id: AI engine aperture node id which is to identify
+ *	     the aperture in the system in firmware
+ * @range: range of aperture
+ */
+struct aie_aperture {
+	struct list_head node;
+	struct list_head partitions;
+	struct device *dev;
+	struct aie_device *adev;
+	struct mutex mlock; /* protection for AI engine aperture operations */
+	void __iomem *base;
+	struct aie_resource cols_res;
+	u32 node_id;
+	struct aie_range range;
+};
+
+/**
+ * struct aie_partition - AI engine partition structure
+ * @node: list node
+ * @aperture: pointer to AI engine aperture
+ * @adev: pointer to AI device instance
+ * @range: range of partition
+ * @mlock: protection for AI engine partition operations
+ */
+struct aie_partition {
+	struct list_head node;
+	struct aie_aperture *aperture;
+	struct aie_device *adev;
+	struct aie_range range;
+	struct mutex mlock; /* protection for AI engine partition operations */
+};
+
+#define dev_to_aiedev(_dev) container_of((_dev), struct aie_device, dev)
+#define dev_to_aieaperture(_dev) container_of((_dev), struct aie_aperture, dev)
+#define dev_to_aiepart(_dev) container_of((_dev), struct aie_partition, dev)
+
+#define aie_col_mask(adev) ({ \
+	struct aie_device *_adev = (adev); \
+	GENMASK_ULL(_adev->array_shift - 1, _adev->col_shift);  \
+	})
+
+#define aie_row_mask(adev) ({ \
+	struct aie_device *_adev = (adev); \
+	GENMASK_ULL(_adev->col_shift - 1, _adev->row_shift);  \
+	})
+
+#define aie_tile_reg_mask(adev) ({ \
+	struct aie_device *_adev = (adev); \
+	GENMASK_ULL(_adev->row_shift - 1, 0);  \
+	})
+
+/*
+ * Need to define field get, as AI engine shift mask is not constant.
+ * Cannot use FIELD_GET()
+ */
+#define aie_tile_reg_field_get(mask, shift, regoff) ( \
+	((regoff) & (mask)) >> (shift))
+
+#define aie_cal_tile_reg(adev, regoff) ( \
+	aie_tile_reg_field_get(aie_tile_reg_mask(adev), 0, regoff))
+
+void aie_device_init(struct aie_device *adev);
+struct aie_partition *
+aie_aperture_request_part(struct aie_aperture *aperture,
+			  struct aie_partition_req *req);
+int aie_aperture_probe(struct platform_device *pdev);
+void aie_aperture_remove(struct platform_device *pdev);
+struct aie_partition *aie_part_create(struct aie_aperture *aperture,
+				      u8 start_col, u8 num_col);
+void aie_part_release(struct aie_partition *apart);
+int aie_resource_initialize(struct aie_resource *res, int count);
+void aie_resource_uninitialize(struct aie_resource *res);
+int aie_resource_check_region(struct aie_resource *res, u32 start,
+			      u32 count);
+int aie_resource_get_region(struct aie_resource *res, u32 start,
+			    u32 count);
+void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
+
+#endif /* AIE_INTERNAL_H */
diff --git a/drivers/accel/amd-ai-engine/ai-engine-part.c b/drivers/accel/amd-ai-engine/ai-engine-part.c
new file mode 100644
index 000000000000..3675a72971d5
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-part.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine partition driver
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/amd-ai-engine.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_part_release() - release an AI engine partition instance
+ * @apart: AI engine partition device
+ */
+void aie_part_release(struct aie_partition *apart)
+{
+	struct aie_aperture *aperture = apart->aperture;
+
+	mutex_lock(&aperture->mlock);
+
+	aie_resource_put_region(&aperture->cols_res,
+				apart->range.start.col -
+				aperture->range.start.col,
+				apart->range.size.col);
+	list_del(&apart->node);
+	devm_kfree(aperture->dev, apart);
+	mutex_unlock(&aperture->mlock);
+}
+
+/**
+ * aie_part_create() - create AI engine partition instance
+ * @aperture: AI engine aperture
+ * @start_col: start column of AI engine partition
+ * @num_col: number of columns of AI engine partition
+ *
+ * Return: created AI engine partition pointer for success, and PTR_ERR
+ *	   for failure.
+ *
+ * This function creates an AI engine partition instance.
+ * It creates AI engine partition, the AI engine partition device and
+ * the AI engine partition character device.
+ */
+struct aie_partition *aie_part_create(struct aie_aperture *aperture,
+				      u8 start_col, u8 num_col)
+{
+	struct aie_partition *apart;
+
+	apart = devm_kzalloc(aperture->dev, sizeof(*apart), GFP_KERNEL);
+	if (!apart)
+		return ERR_PTR(-ENOMEM);
+
+	apart->aperture = aperture;
+	apart->adev = aperture->adev;
+	mutex_init(&apart->mlock);
+	apart->range.start.col = start_col;
+	apart->range.size.col = num_col;
+	apart->range.start.row = aperture->range.start.row;
+	apart->range.size.row = aperture->range.size.row;
+
+	return apart;
+}
diff --git a/drivers/accel/amd-ai-engine/ai-engine-res.c b/drivers/accel/amd-ai-engine/ai-engine-res.c
new file mode 100644
index 000000000000..6bbd7273686e
--- /dev/null
+++ b/drivers/accel/amd-ai-engine/ai-engine-res.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD AI Engine resource implementation
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/bitmap.h>
+
+#include "ai-engine-internal.h"
+
+/**
+ * aie_resource_initialize() - initialize AI engine resource
+ * @res: pointer to AI engine resource
+ * @count: total number of element of this resource
+ *
+ * Return: 0 for success, negative value for failure.
+ *
+ * This function will initialize the data structure for the
+ * resource.
+ */
+int aie_resource_initialize(struct aie_resource *res, int count)
+{
+	res->bitmap = bitmap_zalloc(count, GFP_KERNEL);
+	if (!res->bitmap)
+		return -ENOMEM;
+	res->total = count;
+
+	return 0;
+}
+
+/**
+ * aie_resource_uninitialize() - uninitialize AI engine resource
+ * @res: pointer to AI engine resource
+ *
+ * This function will release the AI engine resource data members.
+ */
+void aie_resource_uninitialize(struct aie_resource *res)
+{
+	res->total = 0;
+	if (res->bitmap)
+		bitmap_free(res->bitmap);
+}
+
+/**
+ * aie_resource_check_region() - check availability of requested resource
+ * @res: pointer to AI engine resource to check
+ * @start: start index of the required resource, it will only be used if
+ *	   @continuous is 1. It will check the available resource starting from
+ *	   @start
+ * @count: number of requested element
+ *
+ * Return: start resource id if the requested number of resources are available
+ *	   It will return negative value of errors.
+ *
+ * This function will check the availability. It will return start resource id
+ * if the requested number of resources are available.
+ */
+int aie_resource_check_region(struct aie_resource *res,
+			      u32 start, u32 count)
+{
+	unsigned long id;
+
+	if (!res || !res->bitmap || !count)
+		return -EINVAL;
+	id = bitmap_find_next_zero_area(res->bitmap, res->total, start,
+					count, 0);
+	if (id >= res->total)
+		return -ERANGE;
+
+	return (int)id;
+}
+
+/**
+ * aie_resource_get_region() - get requested AI engine resource
+ * @res: pointer to AI engine resource to check
+ * @count: number of requested element
+ * @start: start index of the required resource
+ *
+ * Return: start resource id for success, and negative value for failure.
+ *
+ * This function check if the requested AI engine resource is available.
+ * If it is available, mark it used and return the start resource id.
+ */
+int aie_resource_get_region(struct aie_resource *res, u32 start, u32 count)
+{
+	unsigned long off;
+
+	if (!res || !res->bitmap || !count)
+		return -EINVAL;
+	off = bitmap_find_next_zero_area(res->bitmap, res->total, start,
+					 count, 0);
+	if (off >= res->total)
+		return -ERANGE;
+
+	bitmap_set(res->bitmap, off, count);
+
+	return (int)off;
+}
+
+/**
+ * aie_resource_put_region() - release requested AI engine resource
+ * @res: pointer to AI engine resource to check
+ * @start: start index of the resource to release
+ * @count: number of elements to release
+ *
+ * This function release the requested AI engine resource.
+ */
+void aie_resource_put_region(struct aie_resource *res, int start, u32 count)
+{
+	if (!res || !count)
+		return;
+	bitmap_clear(res->bitmap, start, count);
+}
diff --git a/include/linux/amd-ai-engine.h b/include/linux/amd-ai-engine.h
new file mode 100644
index 000000000000..2a13362edd0c
--- /dev/null
+++ b/include/linux/amd-ai-engine.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * amd-ai-engine.h - AMD AI engine external interface
+ *
+ * Copyright(C) 2025 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef _AMD_AI_ENGINE_H_
+#define _AMD_AI_ENGINE_H_
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+/**
+ * struct aie_partition_req - AIE request partition arguments
+ * @start_col: start column of the partition
+ * @num_col: number of columns in a partition
+ * @uid: image identifier loaded on the AI engine partition
+ * @meta_data: meta data to indicate which resources used by application.
+ * @flag: used for application to indicate particular driver requirements
+ *	  application wants to have for the partition. e.g. do not clean
+ *	  resource when closing the partition.
+ */
+struct aie_partition_req {
+	u8  start_col;
+	u8  num_col;
+	u32 uid;
+	u64 meta_data;
+	u32 flag;
+};
+
+/**
+ * struct aie_location - AIE location information
+ * @col: column id
+ * @row: row id
+ */
+struct aie_location {
+	u32 col;
+	u32 row;
+};
+
+void *aie_partition_request(struct device *dev, struct aie_partition_req *req);
+void aie_partition_release(void *apart);
+
+#endif
-- 
2.34.1

