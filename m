Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F85A82DA2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0310E26B;
	Wed,  9 Apr 2025 17:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dEujMkv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0FA10E26B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:30:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKUNITZrQinrxkOpIpxLElshWxSoFRvioUA8sivKLPfe3mk1wY3Hi2bUv82yzuGDRZMVcu9vF8ehTkcFGrtNYzxm3/FAx/5HSTjBAfKVoHb5thKFZwwqrkGoHQH7tn8EgrUVtpBPx1B/S7OPS/WUxeodX5FEQNWQ9LiArMflbI4lNx2pVlIGfIcmLrqWMf/WMeaHj7ao4wsO1FN9QAl5VkMTTii0LeGWUK76MYHoJnIWsnhIOWAvoopqDQKhbag32LPkQfQyaf7HmpGmB6/qPNTVdmDPcB0dZXNWqBFc3PnDYnvo4RMMeVVxgmRqcC/VCQv1GlldQuFw7l4AlJUQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSGwJnoUUE1B7uraxshnA1DLplKEz/j+HYGZ4mOKKfo=;
 b=XO/v+sFAcmwQ52gMOLQsTSc3IQc0cUmUwKwLB2Bky7pNAkhnh7gF63LnC5U+glCZhVhhT/51+v+5byjvfMSNbTuBB5P6zmUWTmtvGzyAS8c/UPk+AODv0OEuobHanSYDcxAQp4aYJDVKhcZaDS8DTHLd5gmMF5NSKAKHU/zHLL37SnAmW5ZjseqeBfJNXNJE0DS7lrVgEr9lWQywEZ/p+pEq+BcGUc0QUsssD3h0ZNXuuQFI/U8qU3wDIkuzxXMGC2Om1JVr484ebC/MqwTgdbhlIxPcnUPdzM56jyxvUkPr7nsSYdv7u7HtCEcla0/XNhXlBYo5rnf4gjnkiE0XWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSGwJnoUUE1B7uraxshnA1DLplKEz/j+HYGZ4mOKKfo=;
 b=dEujMkv+GJFYxGhSrkedIAeEIpcHHFHt9ycJDY0CSsGH29EH5eBAhn2couIVUpkxZICrZzXTGsg43d+TrvOrgzWLWTS3/j7rrXWfzJ4Dlsn5QiH9hkulmNTxkYZmMNin0Esd3mNBCe94kl7+RLbkCgKzsEnBbPsQbgCppdLjlfY=
Received: from SJ0PR03CA0238.namprd03.prod.outlook.com (2603:10b6:a03:39f::33)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 17:30:50 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::4a) by SJ0PR03CA0238.outlook.office365.com
 (2603:10b6:a03:39f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Wed,
 9 Apr 2025 17:30:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 17:30:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 12:30:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 12:30:48 -0500
Received: from xhdipdslab69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 9 Apr 2025 12:30:43 -0500
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
Subject: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
Date: Wed, 9 Apr 2025 23:00:31 +0530
Message-ID: <20250409173033.2261755-1-nipun.gupta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|PH7PR12MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fdfcb19-3117-46ab-2cbc-08dd778c4549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5Ku3ZyMN5qpgQ9mLvRF1lLWVkMQihRY+vKDDAFYbgpH5IsQWAqyB59fWeQXM?=
 =?us-ascii?Q?RCbwV3h3JcMGD36H7VQ0cvvhA/yU6G4ZdhriIRYfzRCtrRFnQw0BoI7Vp9OK?=
 =?us-ascii?Q?VHieQ8kP2Wi/babCeT5GXEVqcTYCQ9e2oGBhUd/wG/WtAPbgXY+Wj4WkjRnf?=
 =?us-ascii?Q?HqVBT8qGXYDv02N+uO4uyPeq/7KZfK0ilDET8jy+LOuekWzbnMyMgpY7GMhZ?=
 =?us-ascii?Q?pgTwChZ2cnF/IGpThaPRztJtkM7tbHVtOWh3cMYmv8PL8lv5o6p6R+IbF7gH?=
 =?us-ascii?Q?7IRZYts4LGRPL+WVkFORFwLIaIlxUwue14KA1DNn2dvHCDl0MWE28lp0YUKg?=
 =?us-ascii?Q?1FaJ6R53+alzVJtTg9PnjWp5RborFEwp9iLWjs9cpeMptd3UveJErLBQV9Lg?=
 =?us-ascii?Q?R4yq9eFqTfrYtJ2muiG89OwHDKKAChZOqCGWIpxyvpeAfZXFfLzbFf7wjHQ+?=
 =?us-ascii?Q?9LhMcYbbVuqPbcn3sdID8r3sK/4PCgxr9WOR2vdHWgK5a2CZhqZI2tspfyWy?=
 =?us-ascii?Q?W/8JzVs+SOisWj3RU8pxSzsoKXR9CuEmjaHja+wfLFFJ40mK6bx3HhX8Wx2E?=
 =?us-ascii?Q?KNogZNaHbxyyrIQGqMq7ydCSGNDYMVk0rjiExWYZpSa5zD2XdW5P8mM+VkgV?=
 =?us-ascii?Q?vEpxZ9JNNJCJxxLGtwlla6fOqJ9ZGNp5hgNqEjYRMpvNJWUSncIjxJ0C/QFs?=
 =?us-ascii?Q?kx507zQnsK+owAruQSksQpEylLQ+AhX1labLdUBPdS/aGbrA1gW29xeR/Cmm?=
 =?us-ascii?Q?12EOpdjT8Vzp0cuyqjLf8JLUZMsvjXKCOgS7xrS86xmjMSJn0MAk9glby5Z6?=
 =?us-ascii?Q?GHuBYl/74gZunCMuqsSnELgg0Frwzjr/I9wvBJeM/x1w1lS4ySkJO+rYdWuH?=
 =?us-ascii?Q?utt+WgOIds7GvNtlU07RKwUiDFuozxGszTsHUgiw8bJn9wOEUL5f3p3VZbq+?=
 =?us-ascii?Q?kzmhA8CLjn2EGQImAW5QNdS7jqPnTfuQlNXPp3SGn7dFXxAogtVp8SuiFjza?=
 =?us-ascii?Q?FDaGHe9MRDCfrfkKYxGXIj56TvNJctbS9Z4lVp5qy0pLCPvrfgOxa5kSGels?=
 =?us-ascii?Q?Ps88L7IklFmSxWQf7rbrCJOH4yTfe/7ZY7HM7/oJwztwX6kpj9ZWYTUd0/xu?=
 =?us-ascii?Q?WzO0uoO+dbxnclSYnerQtvfnrMEHgHAJgOnjYA8hejOMRyucYRDEImkN8HI3?=
 =?us-ascii?Q?9i41zwDzWI5q+ZCb5UBsIXqRkCUUPLEunAGqCJtRLbL0XdA3M1wlssoHtaf5?=
 =?us-ascii?Q?QWVvvWaPwWTL2iYp9pOSBEAs751Jy8YYEhJrMaLVVOqeGyvk+JLaBkLW1GPZ?=
 =?us-ascii?Q?MD6/vZdka9YZ2221myRTdwMwgadXi1nIuGyFgUItr+0h2avQ+UAeZQG8olPM?=
 =?us-ascii?Q?NsuPD8G6qbwsEqLci6LszOnG2luWQ4/RFtFYRojGC8gQDV5z2ETTWMKrgWKH?=
 =?us-ascii?Q?mdQCYnbUE9AcT5vZRWG58yJBjHCPd3imMjAgJGqsaMWMvU6hEYl9B0Nc8rkK?=
 =?us-ascii?Q?bx/i/CiWGdsUja0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:30:49.6622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fdfcb19-3117-46ab-2cbc-08dd778c4549
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760
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

Add binding documentation for AMD PKI accelerator supported for AMD
versal-net SoC.

AMD PKI accelerator is a device on AMD versa-net SoC to execute public key
asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high performance.
The driver provides accel interface to applications for configuring the device
and performing the required operations. AMD PKI device comprises of multiple
Barco Silex ba414 PKI engines bundled together, and providing a queue based
interface to interact with the device.

 +------------------+
 |    Software      |
 +------------------+
     |          |
     |          v
     |     +-----------------------------------------------------------+
     |     |                     RAM                                   |
     |     |  +----------------------------+   +---------------------+ |
     |     |  |           RQ pages         |   |       CQ pages      | |
     |     |  | +------------------------+ |   | +-----------------+ | |
     |     |  | |   START (cmd)          | |   | | req_id | status | | |
     |     |  | |   TFRI (addr, sz)---+  | |   | | req_id | status | | |
     |     |  | | +-TFRO (addr, sz)   |  | |   | | ...             | | |
     |     |  | | | NTFY (req_id)     |  | |   | +-----------------+ | |
     |     |  | +-|-------------------|--+ |   |                     | |
     |     |  |   |                   v    |   +---------------------+ |
     |     |  |   |         +-----------+  |                           |
     |     |  |   |         | input     |  |                           |
     |     |  |   |         | data      |  |                           |
     |     |  |   v         +-----------+  |                           |
     |     |  |  +----------------+        |                           |
     |     |  |  |  output data   |        |                           |
     |     |  |  +----------------+        |                           |
     |     |  +----------------------------+                           |
     |     |                                                           |
     |     +-----------------------------------------------------------+
     |
     |
 +---|----------------------------------------------------+
 |   v                AMD PKI device                      |
 |  +-------------------+     +------------------------+  |
 |  | New request FIFO  | --> |       PK engines       |  |
 |  +-------------------+     +------------------------+  |
 +--------------------------------------------------------+

To perform a crypto operation, the software writes a sequence of descriptors,
into the RQ memory. This includes input data and designated location for the
output data. After preparing the request, request offset (from the RQ memory
region) is written into the NEW_REQUEST register. Request is then stored in a
common hardware FIFO shared among all RQs.

When a PK engine becomes available, device pops the request from the FIFO and
fetches the descriptors. It DMAs the input data from RQ memory and executes
the necessary computations. After computation is complete, the device writes
output data back to RAM via DMA. Device then writes a new entry in CQ ring
buffer in RAM, indicating completion of the request. Device also generates
an interrupt for notifying completion to the software.

Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
---

The patch series was originally submitted as misc driver:
https://lore.kernel.org/all/20250312095421.1839220-1-nipun.gupta@amd.com/

As suggested by Greg, the driver does not fit in misc and should be part
of accel or crypto. Accel is well suited for AMD PKI Crypto Accelerator,
and thus the driver is updated as an accel driver and yaml moved to
newly created accel folder.

Changes RFC->v2:
- updated device tree documentation to be the first patch
- fixed subject
- added documentation in commit log
- fixed compatible string providing correct prefix and SoC
- updated description to be more elaborative, providing datasheet link
- fixed the example

 .../bindings/accel/amd,versal-net-pki.yaml    | 58 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml

diff --git a/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
new file mode 100644
index 000000000000..2dca7458f845
--- /dev/null
+++ b/Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/accel/amd,versal-net-pki.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD PKI accelerator device
+
+maintainers:
+  - Nipun Gupta <nipun.gupta@amd.com>
+  - Praveen Jain <praveen.jain@amd.com>
+
+description: |
+  AMD PKI accelerator handles the public key asymmetric crypto operations.
+  The driver provides accel interface to the application for configuring the
+  device and performing the required operations. AMD PKI device comprises of
+  multiple Barco Silex ba414 PKI engines bundled together, and providing a
+  queue based interface to interact with these devices on AMD versal-net SoC.
+
+  Link to ba414 datasheet:
+  https://datasheet.datasheetarchive.com/originals/crawler/barco-silex.com/34b540b9dc5db40c5bc01999401cf1e4.pdf
+
+properties:
+  compatible:
+    const: amd,versal-net-pki
+
+  reg:
+    description: AMD PKI register space
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        amdpk@20400000000 {
+            compatible = "amd,versal-net-pki";
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            reg = <0x204 0x00000000 0x0 0x10000>;
+            iommus = <&smmu 0x25b>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..11f8815daa77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1154,6 +1154,14 @@ F:	Documentation/networking/device_drivers/ethernet/amd/pds_core.rst
 F:	drivers/net/ethernet/amd/pds_core/
 F:	include/linux/pds/

+AMD PKI DRIVER
+M:	Nipun Gupta <nipun.gupta@amd.com>
+M:	Praveen Jain <praveen.jain@amd.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/accel/amd,versal-net-pki.yaml
+
 AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
--
2.34.1

