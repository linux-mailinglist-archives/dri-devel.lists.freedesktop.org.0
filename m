Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B44A34F908
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF16E9E9;
	Wed, 31 Mar 2021 06:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCB26E9E9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:49:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mm3HguuodfPb4x4w2oCFYS8U6wpiMx1Ipv02Mewn14xtq9cXeVv96MER4zX0e/qpTJMSYMCjE0Pa+b5/IcNyC1uTKTLwmzWhA+GUBdYvgxZNXuwnkvQ3QpPLDYy4XtCpAey1s0bjQuACAi3qULzsIziwEVF96dhRCFVH+iFVA0ZREnnoFTu7MP/xVUcW4dG2sPJDP7PT2W5FZnTh+LuMTrUz/fUxgxhOkVXNF489KpaC8tvpjxsV1XmhNDlp63MI6xsmMLH6ZOjr1LmOBuf8C1b/DIdgcpmy5pwy+E0oq0mtUUwN1Dg+7NC0jOF/XIz2XNHXZXI4B8ag1YUXn2Zvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eWm4JZlqv4rFyeApcpbnQveIqn7YBMJJvZQNJnEf38=;
 b=jQ44dkxZZ733MFqTglMIzXfSeD5Dxe4FmAlYP7WqTf76pXPx4CWsEioHISKT0p0cvyrzx4psAFqE87RO2qlmnlKDUM0Hcq7vCGVBFkzK8q3owHsKZ0Ud+VKv25nPT0YS+csDrp7MK/z73mtTG36P1fAUuVe7D6WUHPhKRp4xqj3A5pcgSfoVJZBXjoCl/RpOebbemTRCl0qSKKqxU3KRuzXIXr/k86DpSOoMfFcpJPF2ZNN9cV+L1v8Yh9+E7x3zxruUNc8VfSz49W84GrVtGrjAzGyf4SKLiTyuV32Z0k3IqzcWQfBSN3d+i/2wi5ovdiOgscVcLvGWhboGa1046w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eWm4JZlqv4rFyeApcpbnQveIqn7YBMJJvZQNJnEf38=;
 b=gR/McfiX9QzZRE6AXahPgKn7dRQQ0R15RrlnYi/v22rVlrngCxHmLZjJD8tKjupw3f4Qs5z5tZGPSrR+bZ4l9IIlMHdWbTtFMLlLwomVBZ3FxbkIxkX1+/cTRN668rgFozvhXSlekQGrEkELieu6/GWhorN4L9O27DfPFtXz1S4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB6349.eurprd04.prod.outlook.com (2603:10a6:803:126::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 06:49:15 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:49:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v7 07/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and Status
 Registers module binding
Date: Wed, 31 Mar 2021 14:33:18 +0800
Message-Id: <1617172405-12962-8-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
References: <1617172405-12962-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::21) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 MA1PR01CA0105.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3977.26 via Frontend Transport; Wed, 31 Mar 2021 06:49:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9030067-a03c-46f7-4796-08d8f4111967
X-MS-TrafficTypeDiagnostic: VE1PR04MB6349:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6349187C6FB16FBBDD2291FF987C9@VE1PR04MB6349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: et23n0cKrgjNG23PMqfC6WTW863TFsmRyzh9WSiBfNkiDWjtlC0KtGle6ADr5d3IYq6YgmHMgEw9UD5Gq0lz+i/f/PKb2R+T8ADnPk2ZYlP149bxAp2IBdnqXfR3bsvMDCeTj8AitErrhN3x7AQzk7gS0u+wrPCZPjGcaU8kJ2af2Cws8PaQkvbjhNL7F3nddaZkPj3qlxHOfyeJSpnfqrpM4RWIMZnXPN6kBFxFsN5obTgrKKUyQiHQQiKg6gEuR2Ztiu7mtyCGJu1ZvtSTKBfYCZPnAb30a/SNorBQ/R8+WQV8eZVoqKjg6l1kiqQKt0ynQzXqr0PTkKyP4yeHiZf1UqGTPYSuRBt6r81NuHDvTAf7zJ0qlp69hXHWLdWfmPw1kPbTGG8OSDQdXn3V28KqzmBh4tJsLjCjuYo/ZvZduHIErKcWothuF/4GNi1vgcIOcJDyfHNK1L+sZt3oyCGfNcrR/ms4UtjuQQxsmZEMAsCVpaLQcOFcdIZYy1TzdZBbGDZpe0wW9qoBscqYysZlIpY0wyAkPJoRNVkathRv100ioOmqlgxAAcxIJM4mqYFRzIp/C8FjfBnAuHwryCoCeHYdaXtMuglI0zjlpWXllHrdjkwOu5CYqIjDNSnO7cIny0z9fXwc5aUuUJCN9KHeggFX5vKLQyrl25b9RqfaPWdjac6Wtya/mFOcuUQdNlEnUbYEaJ1IgS9t40cJ0JENvuQKhngDRKKvH21+NxQ9PISFqUPURegTjbg+74CO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16526019)(7416002)(52116002)(966005)(86362001)(6512007)(8676002)(6506007)(69590400012)(186003)(66556008)(5660300002)(26005)(498600001)(66476007)(38100700001)(4326008)(2616005)(956004)(83380400001)(36756003)(2906002)(6666004)(8936002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZAAZyaZ+sNUPB8BhUzqNWMZjXXUld283hBTG//CadEFiM+qDMoXqaRKDyS+k?=
 =?us-ascii?Q?P3tnSkgc0RDtpi7jOcbsbA+G8CUf1/OZ657wT2zivckynG+rvm32DiLG4ROs?=
 =?us-ascii?Q?377PkSEPuHrDqiYOeHywxntnPnkgLMVJquAPCx3l8zELR+F6erDpRFNMyX7D?=
 =?us-ascii?Q?vmDV6Qghl8os3W5Wr5fqN4wzLnKJglxJnu/0jrMqlqkhAfRR6y+/FZaBePii?=
 =?us-ascii?Q?j9KG/UhAnYhyn2+6K9qUR4sNd9bU8WSWFKPyiurvqVYfOQTaz1RZWhF+5q5m?=
 =?us-ascii?Q?QEfKuzUGc5DEleeF2+hOTTfkb3cgpHYUUFmCMuDpUtWMaCw6f8QhtG6xGxGq?=
 =?us-ascii?Q?dmwDCdc2rJBCd3pPcUAqhb+yPXcoa0uCkAS0wAxskZylgKmE7m8/zIpOTFvY?=
 =?us-ascii?Q?OTdpcdvmcQDveqysg6UTzL53/RDzEgW1oKOIhbMo+s3cmDU3OpRuLkgijF8A?=
 =?us-ascii?Q?RJy9hWcUcUQ2rO9LwgeQI4lrmvrwW7wDQkos6XmGyO/rvsClpOQ8zn6zJd6D?=
 =?us-ascii?Q?36g0IlzIodU5i3+PkOggbT8/v6dgZwhQ5OQDKkqPx2+omy/Is8e7Aj8gRHKn?=
 =?us-ascii?Q?WY4NLblWmCwPm2qxF1WLOdME8c9tWiB2AJXWgKR/bpbZ7plu1IaKdx3tpMXP?=
 =?us-ascii?Q?juAyYZnxYqnFFHPeOZG0Z2OTUQa7xHnBIFwP65E50iXaBte7XxqdHrDZuDPC?=
 =?us-ascii?Q?xNoFE+TOElp/Kk76wVQb+RP2R/OM8h4r9274zapLNP3Njcen2iwdodmFCSEv?=
 =?us-ascii?Q?4ny3q1bn74b6nDP/DBaFWtf/sCRUxyckDHOYEfMAmdL7vTAjOmltZG4W2+9Y?=
 =?us-ascii?Q?rScQKICvxyvz/9+k74Aqdeca8djiEgzrDIGyAaxGMkRTY3MQi/xvUA03oY7M?=
 =?us-ascii?Q?dT+q4jUS6lQunogPdHLirWwLKEZ4icr51AeLbOAegqa8mZYxM5NWMiofAFgo?=
 =?us-ascii?Q?rvW0MP8IIhkaSOywPyrkrAF2dfzJuPacsbvvWDIsCVzHwUGqX3LL8y+E/QFw?=
 =?us-ascii?Q?TCAdFpFKWPQ9fChSZ18u61olC7d2w9M7eN0jX5WAKBYHMMTIdYIIFUcILalW?=
 =?us-ascii?Q?aDlM6gDm61pUdHzON+cZXjrzvLb1vNOlKFpVYYgFhKJhHeyprLMoN38seweV?=
 =?us-ascii?Q?w/CdffFnxBxlf6Ydi/31K58OREjieAfhelDSXRj6eK2YghrJkVFS5uGB6sIE?=
 =?us-ascii?Q?4Qs5i1WBGm5RZtOJ8MEpBjAQN1cxileGnz8Nq/GIfmcRu+8Yp4CoP4r9hama?=
 =?us-ascii?Q?xKxmx4gt6VtlYmhy8AhmZxFCqmW0MtSTHyslrz+UK0ck7akUH5go28QLZ0Ng?=
 =?us-ascii?Q?sfr3gOIyOZmdMSlmuks2ppXC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9030067-a03c-46f7-4796-08d8f4111967
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:49:15.3284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ein9F7T8wcGugqmkBRZSFB+tJvJfz4s6NBxiU6snc1CVix2wQy9RGZrJrmQ3ftlVqhrzotg4H5tbh3RjGcuNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6349
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
Cc: jernej.skrabec@siol.net, marcel.ziswiler@toradex.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v7:
* Add Rob's R-b tag.

v5->v6:
* Drop 'select' schema. (Rob)

v4->v5:
* Newly introduced in v5. (Rob)

 .../devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml   | 192 +++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
new file mode 100644
index 00000000..f095771
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
