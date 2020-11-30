Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F7B2C7FB1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928106E409;
	Mon, 30 Nov 2020 08:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911FC6E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKdsLjrFBXvgSVmARnARiwxtq6ZYbVvr3iKefiIe3IfwibqTUMrVCgh0YcriKLI3RDQarYIYb3tsAqLLodczvyLq/gKM0YXNr02V/6BdWUdj5WZ/ATv3oetitVuddc+77VsdqDlEpXBVElE4t4+A4/VloD7VpbzvZYZ5W4gHLyeiQekaLZAYaxR8OPTaw+1DIsFqfGCg5VLSvslV6lxGOrPq5k7h+Hx8ZPs5MyLoFIcJ3Un9Mp07+27upyi6kadh29Dge0EnyHVvhXD1/7KL9I9DIBptu8ZEYxSphOAtlCT2w5RsI7YAIigAcR5DKHG0+0dZAn8aUDe1c/1zQyMYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbLD9omk481VZRNloQ9307kXdtkzYxMCjfjVWTO/7pw=;
 b=FVyUb37H3RElLPqLEt3d55V21b6Od20VyoupRX4xKGpnauTKF/XA0qbZ6o5VAmvfCEQPz9EulYc4QWISkYdXlvp0ap4KTComIY08HhHDiQtzpuNY+u8wEQdOdckeDu7W52vWn5mO9D+s1GXvfeljCXT+xybDQBn0gk0NQdo39vbXhV0D3TGQttJ1h9NeDMPnRMtTwEJ7Htiem2jEBpqfClXXzK0Y2VoeWsoGzRC9ZkzwwmQ77DoG1joPe1b7Sn+oOSwpB5nuD45ZnOO2uDRfJneeKFwg/5dx1xk2alxTBlGkCDKy92oSc/ry4UuMXCRVtaUhga+yXh6d4sD/nj3S3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbLD9omk481VZRNloQ9307kXdtkzYxMCjfjVWTO/7pw=;
 b=srJxH95qraKQRs/Moz6tO2EfGpswm24mAmG8RigDSAHLHI72Sw1mijq3oaNXhYBcbFH0bJDWkNHadmiLzJ0PK/oIDCRi6q3goKo0yhUF6h1adNlJ3pAR4+3eJ5936UFcxzeut0sBqJHZu2D/25o7PMDKru87JoaoWwC60b5c80k=
Received: from CY4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:903:33::13)
 by DM6PR02MB6284.namprd02.prod.outlook.com (2603:10b6:5:1d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 07:48:43 +0000
Received: from CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::c9) by CY4PR03CA0003.outlook.office365.com
 (2603:10b6:903:33::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 07:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT037.mail.protection.outlook.com (10.152.75.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Mon, 30 Nov 2020 07:48:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 29 Nov 2020 23:48:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 29 Nov 2020 23:48:30 -0800
Envelope-to: michal.simek@xilinx.com, derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com, rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com, manish.narani@xilinx.com,
 ravi.patel@xilinx.com, wendy.liang@xilinx.com, robh+dt@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=48528 helo=xsjjliang50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kjdvC-0006Pm-Qv; Sun, 29 Nov 2020 23:48:30 -0800
From: Wendy Liang <wendy.liang@xilinx.com>
To: <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
 <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
 <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>, <ravi.patel@xilinx.com>
Subject: [PATCH v3 1/9] dt-binding: soc: xilinx: ai-engine: Add AI engine
 binding
Date: Sun, 29 Nov 2020 23:48:17 -0800
Message-ID: <1606722505-16194-2-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 176fd299-bc60-42b2-41cf-08d895045c0c
X-MS-TrafficTypeDiagnostic: DM6PR02MB6284:
X-Microsoft-Antispam-PRVS: <DM6PR02MB62841AEBA55620960AD423CBB0F50@DM6PR02MB6284.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPp2iSe9r8AbCsmzWvELiwm1P97Pb4QdVyEjhAjyIBKAX+kUO+eggp+bhGbqoFK1yXq3ejSAs3T3Ei/BBfhewm37H5yL2bs4RWrgmbImbE8VPOJgcNoML8nF2ZBQSSymfIEtcU4nKJ6Myv7RaAyjgYFQCGkBzRh/NQJvjJ8GqrsmZK7Kxlir6j3WkIpxUfJV4IyVLeNAhHGEzZFG1tDLseZyDvLrJeLPjYHG9THp5dVNByjEle8JOlyYK3Tpc3m6xirQldE1imLna4Hl5X6IVblPxijTP3i5H+pfvjrQBQUFZJTXt4rpF8AX641Z1fy4XpNMPy5tu/8N0XQkOZfofDdShPuKIu9Jx60ZDM5e3d/LIiV7sujYjMSfyH69JoaRceQl8J2TOPIjUdj/wZA6KmGvuADUarLJPrnJoRqvn4Afrww/xb783MtbUpuLcVfnCqUIHZ2dyOYPDM48kccTvXO6ReJ/YzQ44bnokOjWn+8pJD1Pw9R42OpWTC4v10z6UjmrtqV2Xn1U7b9K2gJiwA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39850400004)(346002)(396003)(46966005)(110136005)(2906002)(54906003)(921005)(4326008)(83380400001)(7696005)(47076004)(336012)(82740400003)(966005)(478600001)(316002)(7636003)(36906005)(186003)(70206006)(26005)(44832011)(2616005)(426003)(356005)(7416002)(6666004)(8936002)(9786002)(82310400003)(5660300002)(6636002)(8676002)(107886003)(36756003)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 07:48:42.9000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 176fd299-bc60-42b2-41cf-08d895045c0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6284
X-Mailman-Approved-At: Mon, 30 Nov 2020 08:25:11 +0000
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
