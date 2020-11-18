Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6D2B8D20
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9846E516;
	Thu, 19 Nov 2020 08:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6F46E4D2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 23:48:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqQZkrU3fExPp3wOkezJNag6Jr8T0/kjsfFO6g/1nHh88ipISQeuMxWs/U5lGJ48RVBgIeQFBAYiezskqjeE73LUlwwfNfciByxPunwoiY8c05Y/TF3vLcujP3A7vQnF7cUhyoiWzTfDczyA6Xg/dXdjrIKdzhHxQYuvzmVdKhUwWtYOmAaHoDaIgvF2tN3oDwSfA3MYPxsZW6/pepcgYIKmp3ZKRxNMt2OGRQWV7cnmQaOzK8y44T21r3oA55CQ8rNm2zd71Fz7sYpDOz4tJv7UpoI0Q1+RYY01M8cRDnfeLj/kKfEYqVRjcfBBbdcckXIa+bxBiu8XpooZIyICaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbLD9omk481VZRNloQ9307kXdtkzYxMCjfjVWTO/7pw=;
 b=VmMqbuV/jtQCvtSxSabEAFslyi/cG7vcYdni/BLyduH+xvKua/lsFjVdZwzx0fEIzZAblrBBmWVaUzviK5+fpgaaNFjrGUImzHKuApar6wHPE+4roEmVtVx09aWhV+/nwECH6rwMqYZ3jWDP1h7DGO+ZODuxUPbX/4sec1lmNzMn/5B2KiPZyUoRhhS+HROX9rAdECVsRlAPLGNctyuLGoOtQvmJR7EkpW4yH3ZYyiDuAdKzXA8QV9GTWMmUoDVpFQYT46dyyRA8LZODHAOnl8ARgz6KbbddCfKrfhl0QeiDJc6A5wA+xX0OWAp3RMh8vSHkz15nq8Y8lbSlLQlItg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbLD9omk481VZRNloQ9307kXdtkzYxMCjfjVWTO/7pw=;
 b=rVrz0YRYo5iiwrfGbF04hXdR4P9DmACtjGSEt6paXqEOaNh4gfSRcOm5UTThsWjQimc5ALd9V+A/v8W2ZxjRG8K60Pdcei706Dz2qPxC/OM2RQa3TcbjG8YqdR2QgZU0YQx2afzEyHNoOVlc9ViZ5Juxo2xz8WRZRDI/nPAAtyk=
Received: from DM5PR04CA0058.namprd04.prod.outlook.com (2603:10b6:3:ef::20) by
 BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Wed, 18 Nov 2020 23:48:14 +0000
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::50) by DM5PR04CA0058.outlook.office365.com
 (2603:10b6:3:ef::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kfXBL-0000Wz-5H; Wed, 18 Nov 2020 15:48:11 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v2 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
Date: Wed, 18 Nov 2020 15:48:01 -0800
Message-ID: <1605743289-26575-2-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcd07c80-3aee-4ebf-a0bd-08d88c1c6a31
X-MS-TrafficTypeDiagnostic: BL0PR02MB4580:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4580481DC77ABC434850D195B0E10@BL0PR02MB4580.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWIjWU2XjumBmES5vkw//DNS3UxltSjISlrFY2XnpTVbYxnoAt3yfmh2e72ifLUo6KITHxNDHdkoCWY2JQofskY3qA6SzKboKnt4tr3CjxKFOsVX/egFGKsaat3fum8ZpkS0nC3f0WQzu0dg9ltrWYb95aiyQhWGV5dgG2dfG3FE7/FaWhr37oH+NpdP2R26NpBl4vvLjq3402qdSPHfm20i0LH+gNhKwtKqL0M+5f0k1E8ahpqCKSbYfP+Xy/1oJap05pY+TVO+gxWs78orRTdRHq0dWtQ4+wZf1wDnGvGGQuOaQpkzWa2+kgzxlgzLLxEB5kYsV8zaQogQOogETdiEHIyS8DhshyhT8Qzm13taC2uPrlR713k7JcAdSCrHJ+T6Ajlpb783Twr5zw2+xjGy3MrxCytNJkay8q17wk+QEX3r6PtCGB7fCbVH+PsOZ9JXHdQWMjMapNhBapqYXN2P9NZFNZwZwxVUPGYq5EgW1rgi6S9aXFClH18XuQfnOjFNGE83+rXcRsc3Fam1KA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966005)(921005)(6666004)(2906002)(5660300002)(336012)(82310400003)(70206006)(26005)(7416002)(356005)(36756003)(7636003)(110136005)(4326008)(107886003)(2616005)(83380400001)(478600001)(70586007)(426003)(36906005)(966005)(186003)(9786002)(7696005)(44832011)(8936002)(8676002)(54906003)(316002)(82740400003)(6636002)(47076004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:14.0915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd07c80-3aee-4ebf-a0bd-08d88c1c6a31
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4580
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
 dri-devel@lists.freedesktop.org, Wendy Liang <wendy.liang@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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
 .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
new file mode 100644
index 0000000..1de5623
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx AI Engine
+
+maintainers:
+  - Wendy Liang <wendy.liang@xilinx.com>
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
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
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
+  "^aie_partition@[0-9]+$":
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
+    additionalProperties: false
+
+additionalProperties: false
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
+        aie_partition0: aie_partition@0 {
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
