Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E12B8D6D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782766E507;
	Thu, 19 Nov 2020 08:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A646E428
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:06:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX/CytrE2lgOZn9aRqvzSYSMxqRcmORPjBsIvxsJJaCC/wD/iL6Dti5h2VGCWUBq1kcAjgVSX6hJ3lbsgekm8gmK5wdxyhpwQI14b1ihNWmbACN6qH5ZGyKAmd1wR6Hn1buJ9nVFEQ/qw8yCI05LHMxMV8b2ashRTsxqo9A58KWV90sgZ1XqcoiOcHrxfEQM4sGvKJkwLlZfTyOojqQWgffBe4IN2/DvKzAZs0RfgEDq2C577e6s+GrOID6VoNsFPv0jNA7IC2lWbURockUUsV/LwAnUnQKHsKojb4GuPnDhz+kjXqxSvUC+NzOmX+RX1s/l2BIvnGp4qwEFMTbP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUPuJo5XWSfgBhKGuXALykKjX10O+b+opGKDMEzds/k=;
 b=kuXO2h2Mb9oqCwJ/QfqQqF76GcheUwWXT3vrju0RNi/ucbdPv2t8QQOsscZod0NcBRLbYxcUFsBioUwrdY7jHHfhrVId13URUp6gNwaUuIahw1trM4EZzlL3G6AkTarImqMAfOdzYpkscucK5p8U6lqASvD1q/IPuXmgVOc9q2M0dFFmg/6pGe9w3AJyqmjLfkQ6P1vLkI38uw5DoH6NpQlM5tHwmfsTUvYgzTThqpLcksYdWb1uCy7G3xyCzFgVFqoRdLPMxXdSRFrMVyhCBFMWTx4qY6buUGCFShTxOUs1vnd7TLi5ZX5UxlhDcO1hvdVxCJ0Rg4in9dGxgpYS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUPuJo5XWSfgBhKGuXALykKjX10O+b+opGKDMEzds/k=;
 b=r3QnKOKFy1rCaQU3IFEokaDISpHNnjjlk/bZopGEhsvCjNSr6X0Xef3pyzTvMQzlFXK19hWBir6uHsSJeUCRRLLLj/PYAEb9pEjBtxvzAiOiwbxmDjhHThAk24B0tle6rEfem7moZ0OCtVhOcTKhB4qozPRxHo07lFXbQ0In1cg=
Received: from CY4PR22CA0067.namprd22.prod.outlook.com (2603:10b6:903:ae::29)
 by BN7PR02MB4098.namprd02.prod.outlook.com (2603:10b6:406:fd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Wed, 18 Nov
 2020 08:06:44 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ae:cafe::bb) by CY4PR22CA0067.outlook.office365.com
 (2603:10b6:903:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Wed, 18 Nov 2020 08:06:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 00:06:33 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 00:06:33 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [172.19.2.167] (port=35936 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfIU5-0000Nk-HN; Wed, 18 Nov 2020 00:06:33 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine binding
Date: Wed, 18 Nov 2020 00:06:12 -0800
Message-ID: <1605686780-17886-2-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
References: <1605686780-17886-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee8aebb6-bd4e-42cc-5318-08d88b98e3ac
X-MS-TrafficTypeDiagnostic: BN7PR02MB4098:
X-Microsoft-Antispam-PRVS: <BN7PR02MB40983BB2BF381F48880A034EB0E10@BN7PR02MB4098.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: szaCN751K3IWGxY8AkuBALWaulmtXbObtY1Vwh7xuhdUoeRnE4GaDNa8G0rmXA9p5ag6VhUJXq+evNVjIvNlCM7BW1dK2KHtnxcHq6ckhmro8VD3frHX3HDx1Sa5784oZiTUT8zmp9BpX7WK4YIKt1HdyMzXVJMlARX8MM+yZiJnoJW6R5sDxwYj8+62+cVhZ6rw0kgCG5BRZrAEmSl3XjST3ze11tjk17YXFvcS/au4eWARgQetvco69BDUIyi3HwRF7y7WGQzhPxzW79dbDrxAf2bu/sUJmDonSofcI6RTroVZEPrOjb1cvbvsH7Gr6wkOveFmOQD7lQCaEbSE2EYzNQgnaY3rgIyJI80FqUlRX2USReiUKjAqZQjn5AchCworWfDZjHOVNVQA2500PlFsi1nR4oCKvzauHfDYtMqR5gu7EMkaQ4V38Gm8C4Cx2GDADHsKgjB5tJDwJRBnhvwimeKgK8eaxwTHZuQM4li7DORWeVkEvdFa/GowyD4iCFyr0Vn+712/FqWuypvUXA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(46966005)(44832011)(9786002)(6636002)(5660300002)(36756003)(478600001)(6666004)(2616005)(426003)(356005)(47076004)(336012)(7696005)(70586007)(82740400003)(921005)(26005)(70206006)(7636003)(4326008)(36906005)(8936002)(110136005)(316002)(83380400001)(186003)(7416002)(107886003)(54906003)(2906002)(966005)(8676002)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 08:06:44.3306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8aebb6-bd4e-42cc-5318-08d88b98e3ac
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4098
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Wendy
 Liang <wendy.liang@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xilinx AI engine array can be partitioned statically for different
applications. In the device tree, there will be device node for the AI
engine device, and device nodes for the statically configured AI engine
partitions. Each of the statically configured partition has a partition
ID in the system.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
---
 .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
new file mode 100644
index 0000000..67e64f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AI Engine
+
+maintainers:
+ - Wendy Liang <wendy.liang@xilinx.com>
+
+description: |+
+  The Xilinx AI Engine is a tile processor with many cores (up to 400) that
+  can run in parallel. The data routing between cores is configured through
+  internal switches, and shim tiles interface with external interconnect, such
+  as memory or PL.
+
+properties:
+  compatible:
+    const: xlnx,ai-engine-v1.0
+
+  reg:
+    description: |
+      Physical base address and length of the device registers.
+      The AI engine address space assigned to Linux is defined by Xilinx
+      platform design tool.
+
+  '#address-cells':
+    enum: [2]
+    description: |
+      size of cell to describe AI engine range of tiles address.
+      It is the location of the starting tile of the range.
+      As the AI engine tiles are 2D array, the location of a tile
+      is presented as (column, row), the address cell is 2.
+
+  '#size-cells':
+    enum: [2]
+    description: |
+      size of cell to describe AI engine range of tiles size.
+      As the AI engine tiles are 2D array, the size cell is 2.
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    description: |
+      Should be "interrupt1", "interrupt2" or "interrupt3".
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - power-domains
+  - interrupt-parent
+  - interrupts
+  - interrupt-names
+
+patternProperties:
+  "^partition[0-9]@[0-9]+$":
+    type: object
+    description: |
+      AI engine partition which is a group of column based tiles of the AI
+      engine device. Each AI engine partition is isolated from the other
+      AI engine partitions. An AI engine partition is defined by Xilinx
+      platform design tools. Each partition has a SHIM row and core tiles rows.
+      A SHIM row contains SHIM tiles which are the interface to external
+      components. AXI master can access AI engine registers, push data to and
+      fetch data from AI engine through the SHIM tiles. Core tiles are the
+      compute tiles.
+
+    properties:
+      reg:
+        description: |
+          It describes the group of tiles of the AI engine partition. It needs
+          to include the SHIM row. The format is defined by the parent AI engine
+          device node's '#address-cells' and '#size-cells' properties. e.g. a v1
+          AI engine device has 2D tiles array, the first row is SHIM row. A
+          partition which has 50 columns and 8 rows of core tiles and 1 row of
+          SHIM tiles will be presented as <0 0 50 9>.
+
+      label:
+        maxItems: 1
+
+      xlnx,partition-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          AI engine partition ID, which is defined by Xilinx platform design
+          tool to identify the AI engine partition in the system.
+
+    required:
+      - reg
+      - xlnx,partition-id
+
+examples:
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      ai_engine: ai-engine@20000000000 {
+        compatible = "xlnx,ai-engine-v1.0";
+        reg = <0x200 0x0 0x1 0x0>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        power-domains = <&versal_firmware 0x18224072>;
+        interrupt-parent = <&gic>;
+        interrupts = <0x0 0x94 0x4>,
+                     <0x0 0x95 0x4>,
+                     <0x0 0x96 0x4>;
+        interrupt-names = "interrupt1", "interrupt2", "interrupt3";
+
+        aie_partition0: aie-partition@0 {
+                /* 50 columns and 8 core tile rows + 1 SHIM row */
+                reg = <0 0 50 9>;
+                xlnx,partition-id = <1>;
+        };
+      };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
