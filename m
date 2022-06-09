Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BF544428
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44181113DE8;
	Thu,  9 Jun 2022 06:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50087.outbound.protection.outlook.com [40.107.5.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E86113DD6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:49:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py6W+qx+HhLzGY6WUOu/yyLoQA39SYQg7wS1OjrO39+oACf6sOfRSSsxNMY+j89ZWtIrVAB9PBg7tdsvy2NskeMQIjpqb5WZ7oc1vsmWC+Q0jinl8HVtnxW25r0yX8et3tla0U/zUEV2OTJQZ+WBqPMtTMcJ6dRi3RQWBsq+r7A3Fy9zPpSgh2LTCye23tyi6hZNaMdEFygNszXdiIAnZT0yqHXRyU7aflwOlV4uPHuotb6wGVK1Bh2N6lBZBfuszTIUl0hxT1VZZqT+Li9jOHreIVwCoeOLSCIQ1qNncC+4GYjZPRU4jyyLx49C2lLM6tdEWLpNiTNBI42TQtUTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kFGAuMfeqghlzlehk4cpF0tsCIDCVbzlolp64+HsIo=;
 b=a8oBkeU94m5W1v4RMV/BthEUPxpATA2jMaoj0LhKmwzaChzhF9skZAND9N8OiXr2ItEiiJITXB6okPGcVrMTBnhwqwc6gdHWAYv54te+ue6XshiDHlPSPwAPsIAyniGiq4U40+cTVXGsjdfA5GHNCwYvSDxTqBUaVPwqpTMPcaoDAkMcgWzVOMVxmIhn8qZ8LODoInROx6Zyy1zNuuRFD3oXXxYa8y2dPd0gdhTxgR0BqVg0ddHzkc65DraX9t3F5vWD2TM094OiaupeBw36PX8ZmlvQOKv/SRfGE1wkONoUIuWpp9XcUM4gImNIzzwgNwBuGXKGwONwqdp60pmjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kFGAuMfeqghlzlehk4cpF0tsCIDCVbzlolp64+HsIo=;
 b=I+sURJsHX0t0w/Ajb6Vf8LrUS7bLPp841gAvjuqoEM8COGAyoAZwxpiCIEoFCivOaZaMrUW+x4AvT6mseLJ0mZwv+MpqaGIB2X5Lu49jaiGSwBFW/iycRTEm2Bw8EGrm/h1VxeTvknTsI+oEz8FnrmILHP5Q2RqMK1ymZO6yTTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB5280.eurprd04.prod.outlook.com (2603:10a6:803:5f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 06:49:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:49:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 13/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status
 Registers module binding
Date: Thu,  9 Jun 2022 14:49:30 +0800
Message-Id: <20220609064931.3068601-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609064931.3068601-1-victor.liu@nxp.com>
References: <20220609064931.3068601-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cac97f16-9920-465c-829d-08da49e435fa
X-MS-TrafficTypeDiagnostic: VI1PR04MB5280:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <VI1PR04MB528022075F456A1008947D3F98A79@VI1PR04MB5280.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otSWNK3JxdsRe/nNVqPqXXbBqPjOJ6PPuBTiq2gpEGx7bCNBhE99NAdcvPW7WHS0BKLUubFGTfLEL92dbo3Uozrg2CtmCniEF132b7ynjFdiUWQk4fI/bb2u8QlSG8cU0A3m4PGZIO1Sd3Z4pTl/hZe8TMnRFr3gGvX8H52seIeXmo6a1Djge6tu4uxoeXoDPhg9mXb1+QkhH9dPp5KflL1D7j7HJ/rqkcDGd34Xi3Ts5WX4jF1raK79bPDQXegdIIJKC/s3u5jTH3IcOaGoOAiZWEznPPMn7KdVnZn+H18ZuJl/ppri5jiX/jtigFWM6I9MzCX+jPemMF2I/l760ui1pCR0y6h2ojjarEpPDK5hTP+Ab25pL5A+dA1DYY8BhwynSXWVL3LDghB7cwgL/Dq8fLjjqjelqgiXntEVouCN8eC7TxjggLNrlgkA5fII1LtRh01lQ6I750uBfcXZjgUnwK5lIM0yBdt0WpX+rkFFBskCv/sH2/zkk+O4y81xH+F31rPY+mqsxd2nQtceP+OSnu93VxjlfzaCLyValt4qZTFGaQDDZ2b7lBs8eufsh3aWUPSy9RhoQEBotIqvmEW5wChepCJ7qHZM+BTgOFw8t74ZqULTmP/htvmacSBvxrreqUzXUPjFzlWHGo53Mnx3nbhXBMYfa8J10gHAUmeaGMJj3mBh18S0iBNhhA6uwH4P4PH0A+bNt36ubJDcWNqqVDNhHnbtQBIYM1QuM29+3HlXoPKjy4R4/mSFRF51y55hTJ152azTM3QLeRNEUZVXpAmZbZKQ7UH0fIF9bhMy+YeLi2//3+lv2iEbCemD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(186003)(83380400001)(38350700002)(38100700002)(6506007)(36756003)(966005)(2906002)(52116002)(316002)(6512007)(508600001)(66946007)(6486002)(2616005)(66476007)(66556008)(8676002)(4326008)(7416002)(5660300002)(8936002)(86362001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X6xoMVqqdCzpv5vfCAL428VR/YmWmDk/byCY59MYMGbEoNSPYJUik+F9vhRy?=
 =?us-ascii?Q?8nd0GWYzViq5sP4RPs63QrXMvXIVryZg2NPT71aKl789moD7tkNog6bttmPT?=
 =?us-ascii?Q?hB/96jAcb6/xlKBNtN2DQzOC1GrBR83/nepR691h0DSCikblhbAdie4KDb/7?=
 =?us-ascii?Q?L9ztqw052P+CQeVnNA0wZ6TdEg7Sm3bTuCCgKBVSYoDMxtGAao/3EP4mxFzS?=
 =?us-ascii?Q?Zbz+n/yBMsCh46uuWrM88OxBt8muy0g80zsmfqSdH05CzLOQaT9f6or/dHF3?=
 =?us-ascii?Q?W/YCa3ri4J+2PKLjP6NgBhfRdqLemx1Je45WXi4ub+pb50xQd+l7ESKXer1d?=
 =?us-ascii?Q?sNv5lvdJnzav/Oue6Dku2Uox3dASYmt4JRJXlCf8goXOrfbUfLiQxIG7f0qP?=
 =?us-ascii?Q?TAkpXSGRV5q3ffyvlCRkmvwgq0wf6vZn9JBgyww0/uPDYtiYOeF3nX27BDBR?=
 =?us-ascii?Q?fJBEqALzohQkNdHfDjSnpWEtXUz94ZQ24TsxwxUYNzwcZJaFcGpbHt5xCOPd?=
 =?us-ascii?Q?cy3RUCxENpqvlWiZfSnKNP7Mboc/IkolF7Ed/znOHFxpJZvi3AZaTZBvP0z0?=
 =?us-ascii?Q?JEGGdHZn+4qWeXRwuNTWQx/vihlhhlrVWIhZhtlnJLozAVIQIZ67/neS2L4C?=
 =?us-ascii?Q?+8SQot7Om7Ekw956wbol71RIm8EgCSQhF/tplt0bfBMWZWk1zk+mOryeXKeY?=
 =?us-ascii?Q?QhvmaDJXoE340YfwU6yX0Hu5AzKlBcQ5HqMp2z97o3i98Vt/lgC57iCEofiO?=
 =?us-ascii?Q?ExAPOFYotmUJ+h0ulH4vHDZ0d3taa+UZOwMdyo13r2wm5b3INjHlsgG3zDEQ?=
 =?us-ascii?Q?4gshhpHzYbis3yRlgDChWdz0V/eJ3pFwYnB78gUlkVjjjqLrg8xmh6vVBp2U?=
 =?us-ascii?Q?94ic7iqo0Gj4A6nc7jOruTCUUWlSBKR3XiqAKgLd4t+k0rBeQOX6Y/cuSDR1?=
 =?us-ascii?Q?XUMV7rSj6m/8cqBewtJdx24hNBdLq6pSltRKOPIkObCNleW1omtVjGhb9PAJ?=
 =?us-ascii?Q?R44TXVZpgrReY9l2mty2YbgjZfZJyqIFR42JX0k+6J0eGe9uxUKIpA32bks6?=
 =?us-ascii?Q?VZbIQC+cA+F1wdtzPkyoVVvg4yJ03EdPvr/3UiK1L4id/EGlWh0qHuTWPH1U?=
 =?us-ascii?Q?B5Z1Y0tRkM26yrJqLZioNX339xehKAkDkgUs4DwxO88P9f+aNTF555bt/Cvg?=
 =?us-ascii?Q?GaELBHI13peFh8xjT+2PPiLiFCiVy9Zs1a+pu6cfh5qV3Ah/vBFKmPM2gh13?=
 =?us-ascii?Q?7gVH6cmpx9coQ5NNGllhyMQLTrIxSAKCnoBwCGnw7hJKgKe1nhXhCktuSZCP?=
 =?us-ascii?Q?sK0QkoGNxyQpFH1jG+UGBBBUf4PA6PALWUGDhXRRqme/8btSn0vzB/yqGdbU?=
 =?us-ascii?Q?j/iTCaPjvhnjX4Cfuj55bPaBGbvfT+cz0BC1Rcir6h7Oyr6QjfcOSe9Yq957?=
 =?us-ascii?Q?4S5SKCMk2fPJxcWZz4H9qhDJyhAkml4MgaiyxWZQj3m/tiX4X+gFFddgmtRp?=
 =?us-ascii?Q?h7DJz6HThR9VQSWTt34rzwsZuba+59tfyNa3SD6UB4Ro5qjrYCL21S6NPwFx?=
 =?us-ascii?Q?XoYFwyFxnJB0RxUfoiagi0K8szYCCo9ThGf8/X8EDJ9dzcnuAYf+kC2ZD3Su?=
 =?us-ascii?Q?BQ1IUPp/P33PCYKUK1LktFemyjuhEf5K63RFsUr52U+TxfTcS75PwXK7V98w?=
 =?us-ascii?Q?qcjvdhmP7fZ2x5N26almKHsNYe7fqaEhNq8lUwInK9t7hhUOVUAUaY9FMcIT?=
 =?us-ascii?Q?SBAJtE/l/g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac97f16-9920-465c-829d-08da49e435fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:49:33.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYnwGkkh1poHi9VzIuZLqZcBWNiIYtvZlutdG4QpEGGNhB1ULx30NSxubmJjQp1rVOxIaT2W+uN9wLdmDrDGdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5280
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* No change.

v6->v7:
* Add Rob's R-b tag.

v5->v6:
* Drop 'select' schema. (Rob)

v4->v5:
* Newly introduced in v5. (Rob)

 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
new file mode 100644
index 000000000000..f09577105b50
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qm/qxp Control and Status Registers Module Bindings
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  As a system controller, the Freescale i.MX8qm/qxp Control and Status
+  Registers(CSR) module represents a set of miscellaneous registers of a
+  specific subsystem.  It may provide control and/or status report interfaces
+  to a mix of standalone hardware devices within that subsystem.  One typical
+  use-case is for some other nodes to acquire a reference to the syscon node
+  by phandle, and the other typical use-case is that the operating system
+  should consider all subnodes of the CSR module as separate child devices.
+
+properties:
+  $nodename:
+    pattern: "^syscon@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - fsl,imx8qxp-mipi-lvds-csr
+          - fsl,imx8qm-lvds-csr
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ipg
+
+patternProperties:
+  "^(ldb|phy|pxl2dpi)$":
+    type: object
+    description: The possible child devices of the CSR module.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-lvds-csr
+    then:
+      required:
+        - pxl2dpi
+        - ldb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qm-lvds-csr
+    then:
+      required:
+        - phy
+        - ldb
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+    mipi_lvds_0_csr: syscon@56221000 {
+        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+        reg = <0x56221000 0x1000>;
+        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+        clock-names = "ipg";
+
+        mipi_lvds_0_pxl2dpi: pxl2dpi {
+            compatible = "fsl,imx8qxp-pxl2dpi";
+            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+            power-domains = <&pd IMX_SC_R_MIPI_0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+
+                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
+                    };
+
+                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
+                    };
+                };
+
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+
+                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+                    };
+
+                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+                    };
+                };
+            };
+        };
+
+        mipi_lvds_0_ldb: ldb {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "fsl,imx8qxp-ldb";
+            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+            clock-names = "pixel", "bypass";
+            power-domains = <&pd IMX_SC_R_LVDS_0>;
+
+            channel@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                phys = <&mipi_lvds_0_phy>;
+                phy-names = "lvds_phy";
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    /* ... */
+                };
+            };
+
+            channel@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+                phys = <&mipi_lvds_0_phy>;
+                phy-names = "lvds_phy";
+
+                port@0 {
+                    reg = <0>;
+
+                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    /* ... */
+                };
+            };
+        };
+    };
+
+    mipi_lvds_0_phy: phy@56228300 {
+        compatible = "fsl,imx8qxp-mipi-dphy";
+        reg = <0x56228300 0x100>;
+        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+        clock-names = "phy_ref";
+        #phy-cells = <0>;
+        fsl,syscon = <&mipi_lvds_0_csr>;
+        power-domains = <&pd IMX_SC_R_MIPI_0>;
+    };
-- 
2.25.1

