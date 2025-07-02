Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB4AF5DB6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30810E72B;
	Wed,  2 Jul 2025 15:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HcYY723s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26BE10E72B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tftf/svLTBNaZxdapMlE04c5WvX7x9IFddG3A0GDIX3bZEqcYzCxgNwt7lh9oiuBVqVe1h/JT0I6Oizul69ZjpN4GeCURL1u4+UFlghhNA0mlppdiPZ338BCEGNLN/D/BqeXKEKCRgUMyTuNmYyvroQvS1z1OwkuiL6ZTqK6a419eM404Fv/EhRva4D0OIzc+P++QLf7TkeAZkhdpqdPCCgnYKxBi8O9/1YZVDb+1jBI0UaapSeJokIBIvf3/fVV2J1UhCqh3U0WpbKZQaP223fyeJjmgSTifIFTO37wZRxxvjQ/DgQ/wNRFodr6d53417fR8+JcoT4F1Vunxbs/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHgBlvSJaE5Cx6MbWGkLuZrkIpw73ZGCgYzo53uf+eY=;
 b=uUpEpZzanVbD/5dUlSmuxnn76f00qgJ3Lpkizp47rHlOgOAPMTok4ei6r0w/3+6tTvdiAtC/JK7F7UvHnXuKcoSt0PWdJkKPGkI4fL58h+HL36mib/YY+Ih9W1aftgKjGKgTMeUp1QsqbBOgww3QtbOkOGmLSPIG9FnKMXzOZphwt+MOGfqrhB/4Xx0dJ5wKLYMFDKPq+1xZ6mc7I02rqo5Av99V98dh+ZUZbsbeul2YjANjfeH0A4EuCh8NAqYZ6Szv+lgekk6zxvi/FcLhosIxnkUR7m5QrDVIR01i+fm5tD7RRqZsBDGAH79+8ZJUcnVyuKiIML7Me6XPxWWiTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHgBlvSJaE5Cx6MbWGkLuZrkIpw73ZGCgYzo53uf+eY=;
 b=HcYY723szzBUSSqXNyvt3y1x0OTPCihW4BQ+QAR2Bkh2/bnJuiZyAZ3fSGlS0vbteOYJkrao2rLfSfghrSxOu0zp0s0KQLoTYgFirNIR24FGhKWmriEWCMpjqXiQdA5L9rZz0dxOD3jC+2zkRYEXvD3xudVSY5k6gqAjEXterFc=
Received: from CH0PR03CA0263.namprd03.prod.outlook.com (2603:10b6:610:e5::28)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 2 Jul
 2025 15:56:44 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:e5:cafe::9e) by CH0PR03CA0263.outlook.office365.com
 (2603:10b6:610:e5::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:43 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:42 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 4/9] dt-bindings: soc: xilinx: Add AI engine DT binding
Date: Wed, 2 Jul 2025 08:56:25 -0700
Message-ID: <20250702155630.1737227-5-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e214a20-003b-4df2-b2c1-08ddb9810b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eAJZmNEdTIw/8Ai+IeHXb0ol4hgvtkqA5P0Pa4R2heYkPRP8Fcm3wkymDeBb?=
 =?us-ascii?Q?cqPdokQ8H7tHIZVUv3Orph8eDwGUgCLWSDMRulV/nEA7biYWa6r7JbKDXVPo?=
 =?us-ascii?Q?1P2OwEccdexa5pBmDyiK6uF6OwymKJ8NwDDhSkkc83udUKhMDa0XZI5mMDB2?=
 =?us-ascii?Q?LmmaXlMIGhbuRzk+WO5vvQKUWNfQyq0wIfNDRVe0uTDt2ewv1mYfguwK8oKv?=
 =?us-ascii?Q?znsjzqLIwApjZHTruEgJ2qhsmQ8I3Hy2lIxjwqW0on5yiS/QWH5z/WsYBhAN?=
 =?us-ascii?Q?7ZJqzE6UGVQZZMsuNaLCziwot0spIBvtkwOUpqZPxU9h2ywkgZpBsTxxso8l?=
 =?us-ascii?Q?lQ42gyqclfIDzl+z9+p/empD6CJZdGWktrFdLD431VOAfEknlfy9wlPDeYGs?=
 =?us-ascii?Q?U9WwHEcefpuutnTmEyd+9M614TI1jXqiJxmdkBOF81i7radBAUAX+D82vzzD?=
 =?us-ascii?Q?VZmXC2u7OpRYHlGVJkEJwWJcb68jZSAiWKKs4XHLTr2iVXJtVgsUz6bDk3u2?=
 =?us-ascii?Q?q1vap57Ay1yj2rZx2Hr3Qnl5iOrA8QMAAznQjM2/R28h3unxcw983BQ2H5hK?=
 =?us-ascii?Q?DUAD59sRjhrvQ1uErhZSNWPFD7xp7WeiCbFgbG4aeOUQcfDJJa5pJoWUc1nB?=
 =?us-ascii?Q?Mono1BYcnK3A/Hdxto+29bVvLp5pttltkWDsa24xM2kzlU5ZP+5JzfrjtmCW?=
 =?us-ascii?Q?wsdQNMcAWvcKkZEo/AMDMtBWvib5i+arbejNFleLqXve1J4kzHNSGl3phHYC?=
 =?us-ascii?Q?9W4MGkisdJrpBkvAekNbV4uZpp/9mfLEkFhkmnU0pqrqepBCDTkkZvjx6k7E?=
 =?us-ascii?Q?91uacCshnRn1qC00vJyr+NHlJWHc5sQ7b8NkvYdYxSBPaqM/MMYFcBZrkima?=
 =?us-ascii?Q?mUccfDbNVeXvyv7/ZX3cN8VQYwK0hPyMVY3JkZP1QSIL7Rj3BCkbjbir/MAQ?=
 =?us-ascii?Q?tItigPT1VRYRi5QlxV3/OigXhL5PA68nbrzd4nBybGhYmCdjmMAxwMNpTXg2?=
 =?us-ascii?Q?yXhzFecMEJzvcCbryaI/3N7YwzL50+jt8UQUXMiy7HQlOE2HcgtBCqAubjyX?=
 =?us-ascii?Q?bJDH3c9R1FE3u8hLvoYm+eeZ67WGtz6eGB+9S31BmlqGQ9vqYPEHwo4toDn/?=
 =?us-ascii?Q?UvMYPFeZsqPIf8IXAeD8zjqljJworKPyKFTV0Yh437dCab+4Y9Jg/EFHS47a?=
 =?us-ascii?Q?FDtC4tpdnce96cBibDPLlKqaI8D0XheKrx6fl42Oyb2wd5zhGI5qVodRz2/q?=
 =?us-ascii?Q?BNA/ySXzvkzk4J8Rf8AJgcPiOzf3FjGpK7a6xhJXi0tJY8101mB4cy8w6sje?=
 =?us-ascii?Q?IZ0sC+31Seumz1xIwJU175/zDGrDsKZ3Yddrl0tEeGe8u0id+iLODaPGYM4y?=
 =?us-ascii?Q?Z5yW7H11BpPDXJ1w+6o4SsIhUJ4t1ORLGijpJXX3D96cvmIeBlYGU8d9k1HH?=
 =?us-ascii?Q?g7FsRhZXAwaJf6GjXYmdZ7nmRStNG9Skz1MfZ0xcMiX9iHNFdeI3Ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:44.4082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e214a20-003b-4df2-b2c1-08ddb9810b19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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

In the device tree, there will be device node for the AI engine device,
and device nodes for the statically configured AI engine apertures.
Apertures are an isolated set of columns with in the AI engine device
with their own address space and interrupt.

Signed-off-by: Gregory Williams <gregory.williams@amd.com>
---
 .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
new file mode 100644
index 000000000000..7d9a36c56366
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD AI Engine
+
+maintainers:
+  - Gregory Williams <gregory.williams@amd.com>
+
+description:
+  The AMD AI Engine is a tile processor with many cores (up to 400) that
+  can run in parallel. The data routing between cores is configured through
+  internal switches, and shim tiles interface with external interconnect, such
+  as memory or PL. One AI engine device can have multiple apertures, each
+  has its own address space and interrupt. At runtime application can create
+  multiple partitions within an aperture which are groups of columns of AI
+  engine tiles. Each AI engine partition is the minimum resetable unit for an
+  AI engine application.
+
+properties:
+  compatible:
+    const: xlnx,ai-engine-v2.0
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  power-domains:
+    description:
+      Platform management node id used to request power management services
+      from the firmware driver.
+
+  xlnx,aie-gen:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Hardware generation of AI engine device. E.g. the current values supported
+      are 1 (AIE) and 2 (AIEML).
+
+  xlnx,shim-rows:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      start row and the number of rows of SHIM tiles of the AI engine device
+
+  xlnx,core-rows:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      start row and the number of rows of core tiles of the AI engine device
+
+  xlnx,mem-rows:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      start row and the number of rows of memory tiles of the AI engine device
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - xlnx,aie-gen
+  - xlnx,shim-rows
+  - xlnx,core-rows
+  - xlnx,mem-rows
+
+patternProperties:
+  "^aperture@[0-9]+$":
+    type: object
+    description:
+      AI engine aperture which is a group of column based tiles of the
+      AI engine device. Each AI engine apertures isolated from the
+      other AI engine apertures. An AI engine aperture is defined by
+      AMD/Xilinx platform design tools.
+
+    properties:
+      compatible:
+        const: xlnx,ai-engine-aperture
+
+      reg:
+        description:
+          Physical base address and length of the aperture registers.
+          The AI engine address space assigned to Linux is defined by
+          Xilinx/AMD platform design tool.
+
+      interrupts:
+        maxItems: 3
+
+      interrupt-names:
+        items:
+          - const: interrupt1
+          - const: interrupt2
+          - const: interrupt3
+
+      xlnx,columns:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          It describes the location of the aperture. It specifies the start
+          column and the number of columns. E.g. an aperture starts from
+          column 0 and there are 50 columns, it will be presented as <0 50>.
+
+      xlnx,node-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          AI engine aperture node ID, which is defined by AMD/Xilinx platform
+          design tool to identify the AI engine aperture in the firmware.
+
+    required:
+      - compatible
+      - reg
+      - xlnx,columns
+      - xlnx,node-id
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/xlnx-versal-power.h>
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      ai_engine: ai-engine@20000000000 {
+        compatible = "xlnx,ai-engine-v2.0";
+        reg = <0x200 0x00 0x01 0x00>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        power-domains = <&versal_firmware PM_DEV_AI>;
+        xlnx,aie-gen = /bits/ 8 <0x1>;
+        xlnx,core-rows = /bits/ 8 <1 8>;
+        xlnx,mem-rows = /bits/ 8 <0 0>;
+        xlnx,shim-rows = /bits/ 8 <0 1>;
+
+        aperture0: aperture@200000000000 {
+          /* 50 columns and 8 core tile rows + 1 SHIM row */
+          compatible = "xlnx,ai-engine-aperture";
+          reg = <0x200 0x0 0x1 0x0>;
+          interrupts = <0x0 0x94 0x4>,
+                       <0x0 0x95 0x4>,
+                       <0x0 0x96 0x4>;
+          interrupt-names = "interrupt1", "interrupt2", "interrupt3";
+          interrupt-parent = <&gic>;
+          xlnx,columns = <0 50>;
+          xlnx,node-id = <1>;
+        };
+      };
+    };
-- 
2.34.1

