Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0F87A058
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 01:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB05310EFCC;
	Wed, 13 Mar 2024 00:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PRQDGoIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EBC10E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 00:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqchYmqxidhisvc0szxE2ThZ5OU8u8vW5mt7Gc4GqMZtA7N9ASg+2FSNv5TM5cd1RcpDOTiNdWQhrihABiJrNgejcZ+Y+yQ4/1qPAlu0dydKS8xQN2pPHjT2H8ZhIQ/5Qe4xOmM7C2U7FWo+98k7ghsbJAq6q4jf+oisdu3wEFPDNMoB9SsfxdagxPtvg9RYxTYt+zp0SF3zWHHI10TTVEsTSW8GSshjEE0EWI0OieuILtw5c4reopm+9d36Yq62zA3R7EgWs/c5YUgZ2A57QYGPgXwH0OAjGDSO3jJtLXzGzDl/wgdI7PTGs1xBkRWYAvHtpaGySwFHbLqroJwvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzFR8JuzwQFAHUgF/Kyf1Su9JFwzSXxWGVcOG23T+yk=;
 b=JcU7hlm2utu/BB32w+OtmHe/QYbBeAqkJ5BmMfAM0CmgVak9E2AixaNmK2rEmRlWvd6n/3tFGpzsN0tBqvWvIUJC7NteEJrTMRftVRTlyffg6sJIQRe8+VL2LYyJ/tPIgROwuJwbaFykakZGytP6JxU6PxmRNAdo910E4KXr2B+sC3ZG2PRtyZCt8BZXb/7iEM5nkMbWC/T8B0+1dn5gevnhlpjMQokk4bqLuHPXjitJaQ6bpSJvfT6hUshA8yL6HWeh9Gwn5gSxiKAT4l/oEPgto6oz7BYtVtbIXO9TdE54kTKAZFMWhBGf9h/vHFGRAk25QuCwrv6dKCTTkz/7SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kwiboo.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzFR8JuzwQFAHUgF/Kyf1Su9JFwzSXxWGVcOG23T+yk=;
 b=PRQDGoIK++e4tgJdMT1c3jjQuwlvdxBc9Lh5VbekJ+5sLR/zZMxAf1VDyloxK7Pa5CgwD/6U4wvePpJAmg5JmcFgYM47BKsrwHZKG8iXW52IzzcPb9iNJ5vHcASfpB28VotkLdsobKGuMi0ZTsy7GFj7fVsdfOkZTItNKXqhR8k=
Received: from CH2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:610:57::17)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Wed, 13 Mar
 2024 00:55:14 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::39) by CH2PR12CA0007.outlook.office365.com
 (2603:10b6:610:57::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Wed, 13 Mar 2024 00:55:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 00:55:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 12 Mar
 2024 19:55:13 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 12 Mar 2024 19:55:12 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Tue, 12 Mar 2024 17:55:04 -0700
Subject: [PATCH v2 7/8] dt-bindings: xlnx: Add VTC and TPG bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240312-dp-live-fmt-v2-7-a9c35dc5c50d@amd.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
In-Reply-To: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: a3088f8b-ae50-4eaf-d837-08dc42f83e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jpzBrltvqwJnFYeTy9X1I+1fAvA0p2g6Jv3kpBesUMJtR/6Agcv3RlaHMCCTg132xWzxqSabOVLVqg6f2dSlHYELA6otqyB8phXn1CCeLoKs3+t4JxlcNdh84y7R0XpiIM/umB21V/3fzLorg/koYGSzKTcQJammZh+ueTyIxtIdN3edRd57M54MRyfHJN73YXwmZJ3/ya8d5FogWo11BHzgDU4o9yb6zjvrnST8qebwmRhDqZNMPSaRtPKT6fLUoh7yiUG6K9dGKsx8nPhzfVVhbmE2oLDzMtOAbrYd+1s/n29TyxLFrTUhuR6oEGXG7BNLFYIIl3Tf7y12U0n70nOgqjFyYbmryTFPKMdcYqil+5bvzQen2QFmaYrUKZDqVlB+27BLsBganvHLbmfLXnRqHKlPuVYGRyWz4TlIQ9H5OPcxBpqRu9m1QVN2AwT90jSsWZ4BcTKc7ai2FqnI4XMq/Q46ErpG0gsRQr/+d48k6tcD7Eh1qNrNBIGwtVqJKeSue+TiKlmFiisy190FoJCh5rTudy182W2X9weUfIjwGU3/KB9qi3EjLkbDgwvwBGm4QAJKp5sYlQW6HcoVz0S8eOsx5xfXARVTRINKGR8Nl959/wTgh7vHIjkHxLXOrxqGtaRJAxGuMcTQ80hj+YErMO+k+Mx87GpJXzaUBt+0yja+dJguGoAxT5JyEaB5hgiUj7jgQrWE2VksKbpy1IdQYvEABUsycq+NjbdyLsY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(7416005)(82310400014)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 00:55:14.3517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3088f8b-ae50-4eaf-d837-08dc42f83e47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
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

DO NOT MERGE. REFERENCE ONLY.

Add binding for AMD/Xilinx Video Timing Controller and Test Pattern
Generator.

Copy media-bus-formats.h into dt-bindings/media to suplement TPG DT node.

Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
---
 .../bindings/display/xlnx/xlnx,v-tpg.yaml          |  87 ++++++++++
 .../devicetree/bindings/display/xlnx/xlnx,vtc.yaml |  65 ++++++++
 include/dt-bindings/media/media-bus-format.h       | 177 +++++++++++++++++++++
 3 files changed, 329 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml
new file mode 100644
index 000000000000..df5ee5b547cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,v-tpg.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,v-tpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Video Test Pattern Generator (TPG)
+
+description:
+  AMD/Xilinx Video Test Pattern Generator IP is a soft IP designed to
+  generate test video signal in AXI4-Stream Video format.
+  https://docs.xilinx.com/r/en-US/pg103-v-tpg
+
+maintainers:
+  - Anatoliy Klymenko <anatoliy.klymenko@amd.com>
+
+properties:
+  compatible:
+    description:
+      TPG versions backward-compatible with previous versions should list all
+      compatible versions in the newer to older order.
+    enum: ["xlnx,v-tpg-8.0", "xlnx,v-tpg-8.2"]
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  bus-format:
+    description: Output media bus format, one of MEDIA_BUS_FMT_*
+    maxItems: 1
+
+  xlnx,bridge:
+   description: Reference to Video Timing Controller
+   maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Connections from and to external components in the video pipeline.
+
+    properties:
+      port@0:
+       $ref: /schemas/graph.yaml#/properties/port
+       description: Sink port connected to downstream video IP.
+
+      port@1:
+       $ref: /schemas/graph.yaml#/properties/port
+       description: Source port to connect to optional video signal source.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - bus-format
+  - xlnx,bridge
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/media/media-bus-format.h>
+
+    tpg_0: tpg@40050000 {
+      compatible = "xlnx,v-tpg-8.0";
+      reg = <0x40050000 0x10000>;
+      interrupts = <0 89 4>;
+      xlnx,bridge = <&vtc_3>;
+      bus-format = <MEDIA_BUS_FMT_UYVY8_1X16>;
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        port@0 {
+          reg = <0>;
+          tpg_out: endpoint {
+            remote-endpoint = <&dp_encoder>;
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,vtc.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,vtc.yaml
new file mode 100644
index 000000000000..51eb12cdcfdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,vtc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,vtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device-Tree for Xilinx Video Timing Controller(VTC)
+
+description:
+  Xilinx VTC is a general purpose video timing generator and detector.
+  The input side of this core automatically detects horizontal and
+  vertical synchronization, pulses, polarity, blanking timing and active pixels.
+  While on the output, it generates the horizontal and vertical blanking and
+  synchronization pulses used with a standard video system including support
+  for programmable pulse polarity.
+
+  The core is commonly used with Video in to AXI4-Stream core to detect the
+  format and timing of incoming video data or with AXI4-Stream to Video out core
+  to generate outgoing video timing for downstream sinks like a video monitor.
+
+  For details please refer to
+  https://docs.xilinx.com/r/en-US/pg016_v_tc
+
+maintainers:
+  - Sagar Vishal <sagar.vishal.com>
+
+properties:
+  compatible:
+    const: "xlnx,bridge-v-tc-6.1"
+
+  reg:
+    maxItems: 1
+
+  xlnx,pixels-per-clock:
+    description: Pixels per clock of the stream.
+    enum: [1, 2, 4]
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: clk
+      - const: s_axi_aclk
+
+required:
+  - compatible
+  - reg
+  - xlnx,pixels-per-clock
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    v_tc_0: v_tc@80010000 {
+      clock-names = "clk", "s_axi_aclk";
+      clocks = <&clk_wiz_0>, <&misc_clk_0>;
+      compatible = "xlnx,bridge-v-tc-6.1";
+      xlnx,pixels-per-clock = <1>;
+      reg = <0x80010000 0x10000>;
+    };
+
+...
diff --git a/include/dt-bindings/media/media-bus-format.h b/include/dt-bindings/media/media-bus-format.h
new file mode 100644
index 000000000000..60fc6e11dabc
--- /dev/null
+++ b/include/dt-bindings/media/media-bus-format.h
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Media Bus API header
+ *
+ * Copyright (C) 2009, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LINUX_MEDIA_BUS_FORMAT_H
+#define __LINUX_MEDIA_BUS_FORMAT_H
+
+/*
+ * These bus formats uniquely identify data formats on the data bus. Format 0
+ * is reserved, MEDIA_BUS_FMT_FIXED shall be used by host-client pairs, where
+ * the data format is fixed. Additionally, "2X8" means that one pixel is
+ * transferred in two 8-bit samples, "BE" or "LE" specify in which order those
+ * samples are transferred over the bus: "LE" means that the least significant
+ * bits are transferred first, "BE" means that the most significant bits are
+ * transferred first, and "PADHI" and "PADLO" define which bits - low or high,
+ * in the incomplete high byte, are filled with padding bits.
+ *
+ * The bus formats are grouped by type, bus_width, bits per component, samples
+ * per pixel and order of subsamples. Numerical values are sorted using generic
+ * numerical sort order (8 thus comes before 10).
+ *
+ * As their value can't change when a new bus format is inserted in the
+ * enumeration, the bus formats are explicitly given a numerical value. The next
+ * free values for each category are listed below, update them when inserting
+ * new pixel codes.
+ */
+
+#define MEDIA_BUS_FMT_FIXED			0x0001
+
+/* RGB - next is	0x1026 */
+#define MEDIA_BUS_FMT_RGB444_1X12		0x1016
+#define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
+#define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
+#define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
+#define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
+#define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
+#define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
+#define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
+#define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
+#define MEDIA_BUS_FMT_RGB666_1X18		0x1009
+#define MEDIA_BUS_FMT_RGB666_2X9_BE		0x1025
+#define MEDIA_BUS_FMT_BGR666_1X18		0x1023
+#define MEDIA_BUS_FMT_RBG888_1X24		0x100e
+#define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
+#define MEDIA_BUS_FMT_BGR666_1X24_CPADHI	0x1024
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x1022
+#define MEDIA_BUS_FMT_RGB666_1X7X3_SPWG		0x1010
+#define MEDIA_BUS_FMT_BGR888_1X24		0x1013
+#define MEDIA_BUS_FMT_BGR888_3X8		0x101b
+#define MEDIA_BUS_FMT_GBR888_1X24		0x1014
+#define MEDIA_BUS_FMT_RGB888_1X24		0x100a
+#define MEDIA_BUS_FMT_RGB888_2X12_BE		0x100b
+#define MEDIA_BUS_FMT_RGB888_2X12_LE		0x100c
+#define MEDIA_BUS_FMT_RGB888_3X8		0x101c
+#define MEDIA_BUS_FMT_RGB888_3X8_DELTA		0x101d
+#define MEDIA_BUS_FMT_RGB888_1X7X4_SPWG		0x1011
+#define MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA	0x1012
+#define MEDIA_BUS_FMT_RGB666_1X30_CPADLO	0x101e
+#define MEDIA_BUS_FMT_RGB888_1X30_CPADLO	0x101f
+#define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
+#define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
+#define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
+#define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
+#define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
+#define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
+
+/* YUV (including grey) - next is	0x202f */
+#define MEDIA_BUS_FMT_Y8_1X8			0x2001
+#define MEDIA_BUS_FMT_UV8_1X8			0x2015
+#define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
+#define MEDIA_BUS_FMT_VYUY8_1_5X8		0x2003
+#define MEDIA_BUS_FMT_YUYV8_1_5X8		0x2004
+#define MEDIA_BUS_FMT_YVYU8_1_5X8		0x2005
+#define MEDIA_BUS_FMT_UYVY8_2X8			0x2006
+#define MEDIA_BUS_FMT_VYUY8_2X8			0x2007
+#define MEDIA_BUS_FMT_YUYV8_2X8			0x2008
+#define MEDIA_BUS_FMT_YVYU8_2X8			0x2009
+#define MEDIA_BUS_FMT_Y10_1X10			0x200a
+#define MEDIA_BUS_FMT_Y10_2X8_PADHI_LE		0x202c
+#define MEDIA_BUS_FMT_UYVY10_2X10		0x2018
+#define MEDIA_BUS_FMT_VYUY10_2X10		0x2019
+#define MEDIA_BUS_FMT_YUYV10_2X10		0x200b
+#define MEDIA_BUS_FMT_YVYU10_2X10		0x200c
+#define MEDIA_BUS_FMT_Y12_1X12			0x2013
+#define MEDIA_BUS_FMT_UYVY12_2X12		0x201c
+#define MEDIA_BUS_FMT_VYUY12_2X12		0x201d
+#define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
+#define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
+#define MEDIA_BUS_FMT_Y14_1X14			0x202d
+#define MEDIA_BUS_FMT_Y16_1X16			0x202e
+#define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
+#define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
+#define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
+#define MEDIA_BUS_FMT_YVYU8_1X16		0x2012
+#define MEDIA_BUS_FMT_YDYUYDYV8_1X16		0x2014
+#define MEDIA_BUS_FMT_UYVY10_1X20		0x201a
+#define MEDIA_BUS_FMT_VYUY10_1X20		0x201b
+#define MEDIA_BUS_FMT_YUYV10_1X20		0x200d
+#define MEDIA_BUS_FMT_YVYU10_1X20		0x200e
+#define MEDIA_BUS_FMT_VUY8_1X24			0x2024
+#define MEDIA_BUS_FMT_YUV8_1X24			0x2025
+#define MEDIA_BUS_FMT_UYYVYY8_0_5X24		0x2026
+#define MEDIA_BUS_FMT_UYVY12_1X24		0x2020
+#define MEDIA_BUS_FMT_VYUY12_1X24		0x2021
+#define MEDIA_BUS_FMT_YUYV12_1X24		0x2022
+#define MEDIA_BUS_FMT_YVYU12_1X24		0x2023
+#define MEDIA_BUS_FMT_YUV10_1X30		0x2016
+#define MEDIA_BUS_FMT_UYYVYY10_0_5X30		0x2027
+#define MEDIA_BUS_FMT_AYUV8_1X32		0x2017
+#define MEDIA_BUS_FMT_UYYVYY12_0_5X36		0x2028
+#define MEDIA_BUS_FMT_YUV12_1X36		0x2029
+#define MEDIA_BUS_FMT_YUV16_1X48		0x202a
+#define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
+
+/* Bayer - next is	0x3021 */
+#define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
+#define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
+#define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
+#define MEDIA_BUS_FMT_SRGGB8_1X8		0x3014
+#define MEDIA_BUS_FMT_SBGGR10_ALAW8_1X8		0x3015
+#define MEDIA_BUS_FMT_SGBRG10_ALAW8_1X8		0x3016
+#define MEDIA_BUS_FMT_SGRBG10_ALAW8_1X8		0x3017
+#define MEDIA_BUS_FMT_SRGGB10_ALAW8_1X8		0x3018
+#define MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8		0x300b
+#define MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8		0x300c
+#define MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8		0x3009
+#define MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8		0x300d
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_BE	0x3003
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE	0x3004
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_BE	0x3005
+#define MEDIA_BUS_FMT_SBGGR10_2X8_PADLO_LE	0x3006
+#define MEDIA_BUS_FMT_SBGGR10_1X10		0x3007
+#define MEDIA_BUS_FMT_SGBRG10_1X10		0x300e
+#define MEDIA_BUS_FMT_SGRBG10_1X10		0x300a
+#define MEDIA_BUS_FMT_SRGGB10_1X10		0x300f
+#define MEDIA_BUS_FMT_SBGGR12_1X12		0x3008
+#define MEDIA_BUS_FMT_SGBRG12_1X12		0x3010
+#define MEDIA_BUS_FMT_SGRBG12_1X12		0x3011
+#define MEDIA_BUS_FMT_SRGGB12_1X12		0x3012
+#define MEDIA_BUS_FMT_SBGGR14_1X14		0x3019
+#define MEDIA_BUS_FMT_SGBRG14_1X14		0x301a
+#define MEDIA_BUS_FMT_SGRBG14_1X14		0x301b
+#define MEDIA_BUS_FMT_SRGGB14_1X14		0x301c
+#define MEDIA_BUS_FMT_SBGGR16_1X16		0x301d
+#define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
+#define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
+#define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
+
+/* JPEG compressed formats - next is	0x4002 */
+#define MEDIA_BUS_FMT_JPEG_1X8			0x4001
+
+/* Vendor specific formats - next is	0x5002 */
+
+/* S5C73M3 sensor specific interleaved UYVY and JPEG */
+#define MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8		0x5001
+
+/* HSV - next is	0x6002 */
+#define MEDIA_BUS_FMT_AHSV8888_1X32		0x6001
+
+/*
+ * This format should be used when the same driver handles
+ * both sides of the link and the bus format is a fixed
+ * metadata format that is not configurable from userspace.
+ * Width and height will be set to 0 for this format.
+ */
+#define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
+
+#endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
2.25.1

