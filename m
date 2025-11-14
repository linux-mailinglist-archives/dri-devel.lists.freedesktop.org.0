Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4BAC5B978
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 07:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B4D10E220;
	Fri, 14 Nov 2025 06:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="aKZaW3kO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010069.outbound.protection.outlook.com [52.101.201.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A610E220
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLRmx6zzN2LqW1zgxth4l5G+yIkCHZLVjpzYnxUuZdat+dazgnkxKkj2gQrkd5XQq2QFg9HWIbwJVUurEBXc4Zfnsjg8chZFWIeVuAUtCh6L2Dm6oI1EMu9WweP+ZDvLc8kalGatb45P4YvLgoT25aqbXdZL+NHE02MYY9J2JMGChGVvkLmU0KONjzQAr2Uz/lTCnctpa2CXqjudqceha2RuKboKlfRrd1fHLt71fzzUV8pWAFpsk6AxPTIIHZYUrFVWyxm+lqBbbOu8s7wKlF2r1PQR4T/VOTZ5xaErpx+uUKsCWrBu/ReId6YHAixZAlB+HtsSzGg9WsKsqg3w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BDswinoQIY7Yk1G5FoXzN9Wgg0WQq8YzdVVQhwzf9A=;
 b=DczlDSMFyM5kgfbGz7A4mToAPG4WLHtS9E/0vW3Gz7mZD9HaRPUoUx4Pu+hq9cqMDqb23g8ZuSveOz/NM0JOo5lvKfYkb7/xIrLqJyyinpHUGVtQnPlQJ1BJ44H7DCEUQ+7JEbScjOja/NuBBuDghA66ICEoZROXNjDTRRkslbhMGNccFGDjV28BZbhIX+yvmdD/6M7phOLtvUlvtcne6CZDRufZ2jiLYCGRYf2JtNuvY6cOl7Fk5whH+DPhi93qeRs/cwYDeiCoZYPYUzliwBybt+YqwHo3pLR/xbwjuBct/80NRRVLJlF6vtTp0840jMpSpg1eMxig7SY+PwT4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BDswinoQIY7Yk1G5FoXzN9Wgg0WQq8YzdVVQhwzf9A=;
 b=aKZaW3kOJWwVbUBb41jQZcI/n1S1UVPZRvi5Oh1zBGXhT2037yiPOuo5UQpO/0xIuoS3RUkWXaJAChbhSd0LCc0V+BI3hffxh0hVE6ODJaSCRaHRI+U1IOs/x8+wiQsdh6YXUsenbpcRQnxObaoEkd7huy+XQQT5hvOedZZHfCM=
Received: from BLAPR05CA0034.namprd05.prod.outlook.com (2603:10b6:208:335::15)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 06:43:54 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::22) by BLAPR05CA0034.outlook.office365.com
 (2603:10b6:208:335::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.8 via Frontend Transport; Fri,
 14 Nov 2025 06:43:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 06:43:54 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 00:43:48 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 00:43:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 00:43:47 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AE6hbsU1539554;
 Fri, 14 Nov 2025 00:43:43 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devarsht@ti.com>, <praneeth@ti.com>,
 <h-shenoy@ti.com>, <u-kumar1@ti.com>, <s-jain1@ti.com>
Subject: [PATCH 1/3] dt-bindings: display: ti,
 am65x-dss: Add am62p dss compatible
Date: Fri, 14 Nov 2025 12:13:34 +0530
Message-ID: <20251114064336.3683731-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114064336.3683731-1-s-jain1@ti.com>
References: <20251114064336.3683731-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 199baef5-83dc-42f5-f1aa-08de23492df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d0QSHpLfTYmnMCMs3AlvuqAXkLJ1EZJ4kGG7FPvUvwnIl3ZGogKXBJNhx4kC?=
 =?us-ascii?Q?ZLdKGwnl93D53vqr77bovoLbcA8SMha3PXnmuub577OkrTGC4GjbwWpVloW2?=
 =?us-ascii?Q?lVaF+N/HDJ7vV+L/htiQXMwy3r3fPzAeQXNv//F5nGlLDKRn4gqlWPKG7DmV?=
 =?us-ascii?Q?W5ZTJ0iiJjvIr1BySOpSGr8+1IWybWMZ1QH4pgkwJPKwqX3utkVTSytVFMxE?=
 =?us-ascii?Q?/eKtZkEgysOouG3YxTR/Logbwmb2yMCgR6WtUG3PCyQiIDmABvHjQTJq+sgN?=
 =?us-ascii?Q?3u01JSqK4WtpCh+Au8bW8hl4q4/mIvwf5JRbpF8OPO8OtwWJu26YGeA2ZLjP?=
 =?us-ascii?Q?micQQaDHV9SQvHW83eZ//uFTsgiCpL+aNOSWaWJ5DZUfNCtHONZ1p4IBfRtg?=
 =?us-ascii?Q?sKWhKzalh4whOQxrvqbQRriOyFXqwXhwMuTvH+vig7pZ8PFcavdXqv8BPhbm?=
 =?us-ascii?Q?EnNFRSL0Yhi/dTEV3t2/V1istpSYnNRzNqTBW64Zx3a9PSbqX2GOwJivxeml?=
 =?us-ascii?Q?vm/3j2q+DNrOb3BCrt+SjLVBWN+vjFJAODjTI0YUIaq8qdEMBLApVtHo8KHR?=
 =?us-ascii?Q?BKcbiKpj5H30sTVmnm//eUOyBKCBaESoZC3l9sQzVAPeX1dXB5oy/BmhBxeL?=
 =?us-ascii?Q?vhjHCIq0y6yfy0BuiqqkfRgelmSS5n282ZDWGrT3TnD7W6OdEajh0LRobyzJ?=
 =?us-ascii?Q?Ox7JhuHbN7dlpyGQ7g+q56DyOPaQ2bJdVGfZOq5/nS9vYaMSvbHGDLDwWAV0?=
 =?us-ascii?Q?aJ95ecjK0vTgUuWn9SgtuwoH13wGkg34cm23yfYeUOkEsuidMv9CApmWuROp?=
 =?us-ascii?Q?D8ncr0jk7oJZC5l0fpCwp2HLVbVVpPLq4x3Ery0/4F54B5XfIng9EiWdu2Cx?=
 =?us-ascii?Q?4N0pDzZpRKALYW0fl0eeudjzI4YNGySdwSM2768qnAfrdUuGikefihNpFDnb?=
 =?us-ascii?Q?4UsIOVM35hguNh72h8YurjJArKFFBZHfiL0nqUm+UoVbQpF6sZvHCgNQCJfu?=
 =?us-ascii?Q?FfgXCyjQ3YLlk72iJI6BaOv3NMrWX5dsFoBNbBWeETXXnNGFZuXWJqz54Wyi?=
 =?us-ascii?Q?tiGrAMG74IxjHbaw3M5+Q/WsfJap77BGX9FTwX9c5dghZ/64jNYp0vdPRN8G?=
 =?us-ascii?Q?M1WMFf/LskWSOp+opM3gh04vFVUg4AibvGm0XIoJPk+eACb4R9wBfqU19q11?=
 =?us-ascii?Q?RpXSnk3if8yFBExqiRkMYt7QHbIJWn3HgCFLWQd2wjbsjs2SAOCYLPs8MO/n?=
 =?us-ascii?Q?TEAtfsZGLxuzebYxezsj/mmwjhjVz6J0jKy4LpnoiR6NY3Te54Gzz9bN+cgO?=
 =?us-ascii?Q?tNugfAMtcZa5GdC/bSpsqPXaa8Myt1KAFV921pQmf9ludt1SzU/pDZhv8+9O?=
 =?us-ascii?Q?PhxeaxU//F86tSTH8Wa01Yjxfe00YgL3ZVafbrLPldDv2n+hCuObTcuZE+JZ?=
 =?us-ascii?Q?aRiZf2nKDIKhzEJFFCFOD8+UveiXXd2AZdji87WP+PfnLOHdnA855O/e3/80?=
 =?us-ascii?Q?ADAhuAF3mKDaP1dsqbg694DR6ywJV8HVHCoSXIZ2ZA5/HS5qKLKChz+bO9gU?=
 =?us-ascii?Q?YxlohkWc8Epl4qeXerg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:43:54.2696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199baef5-83dc-42f5-f1aa-08de23492df5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
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

TI's AM62P SoC contains two instances of the TI Keystone Display
SubSystem (DSS), each with two video ports and two video planes. These
instances support up to three independent video streams through OLDI,
DPI, and DSI interfaces.

DSS0 (first instance) supports:
 - Two OLDI transmitters on video port 1, configurable in dual-link or
   single-link mode.
 - DPI output on video port 2.

DSS1 (second instance) supports:
 - One OLDI transmitter on video port 1 (single-link mode only).
 - DSI controller output on video port 2.

The two OLDI transmitters can be configured in clone mode to drive a
pair of identical OLDI single-link displays. DPI outputs from
DSS0 VP2, DSS1 VP1, and DSS1 VP2 are multiplexed, allowing only one
DPI output at a time.

Add the compatible string "ti,am62p-dss" and update related
description accordingly.

AM62P has different power domains for DSS and OLDI compared to other
Keystone SoCs. Therefore, add 'minItems' and set to 1 and update the
'maxItems' field in the power-domains property to 3 for the
"ti,am62p-dss" compatible entry to reflect this hardware difference.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 .../bindings/display/ti/ti,am65x-dss.yaml     | 127 +++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896..8bd188e7f09b 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -24,6 +24,19 @@ description: |
   DPI signals are also routed internally to DSI Tx controller present within the
   SoC. Due to clocking limitations only one of the interface i.e. either DSI or
   DPI can be used at once.
+  The AM62P has two instances of TI Keystone Display SubSystem, each with two
+  video ports and two video planes. These instances can support up to 3
+  independent video streams through OLDI, DPI, and DSI interfaces.
+  DSS0 (first instance) supports:
+    - Two OLDI TXes on video port 1, configurable in dual-link or
+      single link clone mode
+    - DPI output on video port 2
+  DSS1 (second instance) supports:
+    - One OLDI TX on video port 1 (single-link mode only)
+    - DSI controller output on video port 2
+  The two OLDI TXes can be configured in clone mode to drive a pair of
+  identical OLDI single-link displays. DPI outputs from DSS0 VP2, DSS1 VP1,
+  and DSS1 VP2 are muxed, allowing only one DPI output at a time.
 
 properties:
   compatible:
@@ -31,6 +44,7 @@ properties:
       - ti,am625-dss
       - ti,am62a7-dss
       - ti,am62l-dss
+      - ti,am62p-dss
       - ti,am65x-dss
 
   reg:
@@ -81,7 +95,8 @@ properties:
     maxItems: 1
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
     description: phandle to the associated power domain
 
   dma-coherent:
@@ -347,3 +362,113 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+    dss0: dss@30200000 {
+        compatible = "ti,am62p-dss";
+        reg = <0x30200000 0x1000>, /* common */
+              <0x30202000 0x1000>, /* vidl1 */
+              <0x30206000 0x1000>, /* vid */
+              <0x30207000 0x1000>, /* ovr1 */
+              <0x30208000 0x1000>, /* ovr2 */
+              <0x3020a000 0x1000>, /* vp1: Used for OLDI */
+              <0x3020b000 0x1000>, /* vp2: Used as DPI Out */
+              <0x30201000 0x1000>; /* common1 */
+        reg-names = "common", "vidl1", "vid",
+                    "ovr1", "ovr2", "vp1", "vp2", "common1";
+        power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>,
+                        <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>,
+                        <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>;
+        clocks = <&k3_clks 186 6>,
+                 <&dss0_vp1_clk>,
+                 <&k3_clks 186 2>;
+        clock-names = "fck", "vp1", "vp2";
+        interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+
+        oldi-transmitters {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            oldi0_am62p: oldi@0 {
+                reg = <0>;
+                clocks = <&k3_clks 186 0>;
+                clock-names = "serial";
+                ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        oldi0_am62p_in: endpoint {
+                            remote-endpoint = <&dpi0_am62p_out0>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        oldi0_am62p_out: endpoint {
+                            remote-endpoint = <&panel0_in>;
+                        };
+                    };
+                };
+            };
+
+            oldi1_am62p: oldi@1 {
+                reg = <1>;
+                clocks = <&k3_clks 186 0>;
+                clock-names = "serial";
+                ti,oldi-io-ctrl = <&dss_oldi_io_ctrl>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        oldi1_am62p_in: endpoint {
+                            remote-endpoint = <&dpi0_am62p_out1>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        oldi1_am62p_out: endpoint {
+                            remote-endpoint = <&panel1_in>;
+                        };
+                    };
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                dpi0_am62p_out0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&oldi0_am62p_in>;
+                };
+                dpi0_am62p_out1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&oldi1_am62p_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpi1_am62p_out: endpoint {
+                    remote-endpoint = <&dpi_bridge>;
+                };
+            };
+        };
+    };
