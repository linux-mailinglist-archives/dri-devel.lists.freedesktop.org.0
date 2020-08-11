Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F424143C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 02:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AD26E49F;
	Tue, 11 Aug 2020 00:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416C6E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+prMV7CwWEPc2AFxOEixfwdu8kK4alzNuNcePucJs2+sTMpAUdVy59HfB1ThP5uEPBUJ57G8vwLlZa+Y9Viya5QptqotP8sW0KEX/F2HsHMsEE+utT7fNZD1hWbwnCNoxZvmU1MZqCh0kP1a/KiA6T7y0B5aR3KbH6C1xdlQ+JtPb5TfmyQNKQgScsTZzpw+kwiM/AovM42y5UBU40OpHyyRphOub+yqCAtvN+EP1ElZGCLAEE0bM8KRVqXVslZpWNFzo4uXoPBWThYJ6yuIMhoJusASyYY5WX8N15a6TCl+s/lEstGmbvekMa7o8K2xkcktIToF+d+2T0mXaWrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0S3NQXdDbUa0dsoTv92gaCcrt0WDkqlXndG6oLFFxY=;
 b=a6MxaqJNZ7tbmmb9G9xHrmUyIjJSa3e6GD5IRhyzUGrcFS7gO+AcEK0oUkCkRS3Nd4Pljs6HHAupNsueOkCbe8bqsmVGtSC+UqssujTH+rx3I/o29s4SVrCLMaBdL/wfU0W5XECtZK2vGjJp7Le5Fa1jEOJ6qKrE3h0tL1WjoflBgCULlASboxWO+FEuox+fM0zIikYGIkDvC46VRlPeha2LEG55eY4LkdOg1cJXcppJmgxO9rCIb+l4BXhmX5yAPqwZoz8nVojHSwaXsPYiEpwrHePu0mcqapqgDywlVGRS1lPQdKGVDxPG6eGo83TuBInLpkD6qwwTrVoksttJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0S3NQXdDbUa0dsoTv92gaCcrt0WDkqlXndG6oLFFxY=;
 b=Vbkeid9rEHjatIUt3D/9KuPePDSSqEVwx1HsgE7aZlNZWPOesklh9QSpqk+qF8GDO0eeUCW5iockurLbhWClrVPlFrjcyTqMxizqPYcsjl8xB9vkA4G8H1tzJ8LWWN/efT3oc05Bzl6Tnl+Px1Kz+c90CVQ0jWJINV+czqrSsoo=
Received: from SA9PR10CA0022.namprd10.prod.outlook.com (2603:10b6:806:a7::27)
 by SN1PR02MB3741.namprd02.prod.outlook.com (2603:10b6:802:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Tue, 11 Aug
 2020 00:46:41 +0000
Received: from SN1NAM02FT0010.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::56) by SA9PR10CA0022.outlook.office365.com
 (2603:10b6:806:a7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20 via Frontend
 Transport; Tue, 11 Aug 2020 00:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT0010.mail.protection.outlook.com (10.97.4.76) with Microsoft SMTP
 Server id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 00:46:41
 +0000
Received: from [149.199.38.66] (port=39382 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IR0-0006Xw-RK; Mon, 10 Aug 2020 17:46:34 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IR7-0000Bj-8j; Mon, 10 Aug 2020 17:46:41 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 07B0kXbB005582; 
 Mon, 10 Aug 2020 17:46:33 -0700
Received: from [172.23.155.151] (helo=xhdengvm155151.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <venkateshwar.rao.gannavarapu@xilinx.com>)
 id 1k5IQz-00009x-11; Mon, 10 Aug 2020 17:46:33 -0700
From: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
To: hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH V2 1/2] dt-bindings: display: xlnx: dsi: This add a DT
 binding for Xilinx DSI TX subsystem.
Date: Tue, 11 Aug 2020 06:16:16 +0530
Message-Id: <1597106777-30913-2-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
References: <1597106777-30913-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 38a46f70-2633-4709-c6f1-08d83d900373
X-MS-TrafficTypeDiagnostic: SN1PR02MB3741:
X-Microsoft-Antispam-PRVS: <SN1PR02MB3741E1704DA245B73DAD7720B1450@SN1PR02MB3741.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bgs6/a7hAVk3yMx/Hf9+hPc7ulQZQcY4vj8/6RsQwBN8Tv2KW97S7Ez3kubRwyFOZFmoVsISKNcbAQ6DILp1GPhTO7ZmoXr0Max8GFlXZO/JTHRfgaoKfmb0ZOjaU7bvHrjde7lSKWSJM9BLw0T4pokB5Vt/7Vku/8lyexf/3dx8SbR+E4zoYSQpL76RFE7AK2fuyydrrYY+biwBLSbsLflt8CmRYh9avA4yh5GzvXN1ty0CaUrjXpo93tWtvjA94I+0SbAajhAZKwzrx9ykd0TcOGic1C08Q03XaNBN7lyRjm3+HMmQ6t7qU68jM0OQ/7FA0wCPq5J9J9U+u956eA8l1VheSIFmOqPX70mGFay+1OGsPKhAF3keDx9Ko70Uw3uUFt61UpGEzoqBJBcovZ00GzfOa+1Ysdxtho0jcwGSCpPJalKmR85utOMk6m22GQLXJWN+Rgts7V+lNT1k/gKYaCMk623hU/HZ8+SUxXbBe7+L3qreE+Ual9lG42Yf
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(346002)(396003)(376002)(46966005)(336012)(81166007)(36756003)(107886003)(426003)(82740400003)(47076004)(7696005)(9786002)(4326008)(316002)(2906002)(8676002)(478600001)(83380400001)(5660300002)(186003)(6666004)(26005)(966005)(356005)(2616005)(8936002)(82310400002)(70586007)(70206006)(21314003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 00:46:41.5279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a46f70-2633-4709-c6f1-08d83d900373
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0010.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3741
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
Cc: sandipk@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org, vgannava@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Xilinx MIPI DSI (Display Serial Interface) Transmitter subsystem
implements the Mobile Industry Processor Interface (MIPI) based display
interface. It supports the interface with programmable logic (FPGA).

Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
---
 .../devicetree/bindings/display/xlnx/xlnx,dsi.yaml | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
new file mode 100644
index 0000000..73da0d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,dsi.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/xlnx/xlnx,dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Programmable DSI-TX Subsystem
+
+description: |
+  The programmable MIPI DSI controller of Xilinx implements display pipeline
+  based on DSI v1.3 specification. The subsystem includes multiple functional
+  blocks as below
+
+  +---------------+                +-----------------------------------------------+
+  |               |                |                      +------------------+     |
+  |               |                |         v----------->+AXI CROSBAR       |XXX  |
+  |FRAME BUFFER   | AXI STREAM     |         |            |                  X   X |
+  |(DMA)          |       +------->+    +------------+    +------------------+  XX |
+  |               +<------+        |    |MIPI        |                          X  |
+  |               |                |    |DSI-TX      |                          X  |
+  |               |                |    |Controller  |             +------------+  |
+  |               |                |    |            +------------->D-PHY       |  |
+  +---------------+                |    |            |             |            |  |
+                  S_AXIS_ACLK      |    +-------------<------------+            |  |
+                 +---------------->+                               |            |  |
+                                   |                               |            |  |
+                  DPHY_CLK_200M    |                               |            |  |
+                 +---------------->+                               |            |  |
+                 +                 |                               +------------+  |
+                                   |                                               |
+                                   | MIPI DSI TX SUBSYSTEM                         |
+                                   +-----------------------------------------------+
+
+  The DSI TX controller consists of multiple layers such as lane management layer,
+  low-level protocol and pixel-to-byte conversion. The DSI TX controller core
+  receives stream of image data through an input stream interface. The subsystem
+  driver supports upto 4 lane support and generates PPI trasfers towards DPHY
+  with continuous clock. It supports Burst, non-burst modes and command modes.
+
+maintainers:
+  - Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
+
+properties:
+  compatible:
+    const: xlnx,dsi-1.0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: List of clock specifiers
+    items:
+      - description: AXI Lite clock
+      - description: Video DPHY clock
+
+  clock-names:
+    items:
+      - const: s_axis_aclk
+      - const: dphy_clk_200M
+
+  xlnx,dsi-num-lanes:
+    description: Maximum number of lanes that IP configured with.
+           possible values are 1, 2, 4.
+
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 4]
+
+  xlnx,dsi-data-type:
+    description: MIPI DSI pixel format.
+           possible values are 0, 1, 2, 3.
+
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2, 3]
+
+  xlnx,dsi-cmd-mode:
+    description: denotes command mode support
+
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1]
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          output / source port node, endpoint describing modules
+          connected the DSI TX subsystem
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - xlnx,dsi-num-lanes
+  - xlnx,dsi-data-type
+  - xlnx,dsi-cmd-mode
+  - ports
+
+additionalProperties: false
+
+examples:
+ -  |
+    mipi_dsi_tx_subsystem@80000000 {
+      compatible = "xlnx,dsi-1.0";
+      reg = <0x0 0x80000000 0x0 0x10000>;
+      clocks = <&misc_clk_0>, <&misc_clk_1>;
+      clock-names = "s_axis_aclk", "dphy_clk_200M";
+      xlnx,dsi-num-lanes = <4>;
+      xlnx,dsi-data-type = <1>;
+      xlnx,dsi-cmd-mode = <0>;
+      ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+              reg = <0x0>;
+              dsi_tx_out: endpoint {
+                   remote-endpoint = <&panel_in>;
+              };
+          };
+      };
+    };
+
+...
--
1.8.3.1

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
