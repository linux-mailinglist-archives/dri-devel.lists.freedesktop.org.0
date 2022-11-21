Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36402631A36
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0510E14D;
	Mon, 21 Nov 2022 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70045.outbound.protection.outlook.com [40.107.7.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CBE10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF4SiIZj3RjF/1imkGNhKWomInmFjFVsCVywIWUSpo/qqlyvmue8CRmcELuo4Wdqrsum1LY3DJiJM8L9XJeaVQvSNZI9abwvHgpwevAH8HwDqdMR6Q4TkGH/6oRkCbLd0rgeeMAaAQx9UQmv1bsqFEYWNWiF6BB5Rbb+3j5EJXWztj9zsOVYi2vQsBK1HtPEbLIupBL8k2j5JQ5B4FQ7Qu+bg0Idp2rQEjzKofXOoTukD/6Bn224XdkfG1HvxjjN1RMhpLr9W7M4NBiEoOSOdK5qwZD9+mU0A2/MNfBK/Qgbkmf0Cgmp/gc58Nm433lFqUB0mxKkM9c4ekmr17QWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFjcl24VPSOGAMucHSEg3m4I95NWOuaTcMx2VVyIeJM=;
 b=CekZp9RfyvhNlr2Qvo40A2gsiOAIRPvgeG5PDsTUYdYgDeTxbF/G3PGjdxYYZj1KcSQV5SKmrPa37uwJyOH8Dusp6mMqcRQtfNrEOZuQuQOlq3yfsyT1qs4JsEWYS0gnm7INi77LYBJPfRdBbpRPjNr21YzyEtFkEHSSKYqbCft5N7/ejM/ACeE35/kTcSkDNjtDN9e2OQV7q0wtE9YiByomhm3fX72NRXLRQp63hN2se0H9PWXTT2JglkVciwyh8r4DLno8/aKm/YN8aGC/UFfrko3geRDGqBhOue+t43P+MAPcpAetQXSdTmznpFpy6/+GDuFRML9eI6ZtM9qk7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFjcl24VPSOGAMucHSEg3m4I95NWOuaTcMx2VVyIeJM=;
 b=oTBrDL4Oss33K7QNlk6d4GGwV1qBzCPgZoIImNuRMMwTBSLcaYx6JdUnlOMBLukuybQ+7dyydugsQ1LO5ZmC8z5zY78ZrHAv9rV3o8Q2VZrhjHeDND1GN74eofmyy4xAc2CaGe55Y5RxfMwo39PbnEniyjgCNiKaW78DRYKC7ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:28 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 alexander.stein@ew.tq-group.com
Subject: [PATCH v4 05/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Date: Mon, 21 Nov 2022 15:23:55 +0800
Message-Id: <795381fa1da03e9b1dfaf26298d46dc92e2af11b.1669013346.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 117b46ed-90fd-49da-c51c-08dacb91d7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6kYPcaquSbXxSf30nttkbyY8+cVHsuQTYstkW/YChIiHqlxVkjq9MO9LSCQM58+Z7EFiUqq3MXSbrAOV/8H/6io8q2DVwD//BFk0QiUsbFfSQEa1jaMLXgnJXn/mtccfFWbG56V7ARTDSHphSpesUe84jI/TguEL5GXK/dDiQFuIilZVr3l8d2uqJgWihTB0KjelyfrHT10TiSljEKKkVKJgpEzxBgZyeYkTc0Vq++TyI+Arr0p1C9qhylxRHf4GQj7oOVcBR3p+5kSqYANmUF3cvuuR48MUqBUd3aQgHDSS5uZVNT3pC1pOSLo7xK3QNS1otyQbi7yugMUE/AFx9tknDIIXB5QCbOAUuEJz9U5Z1nJd2iIL6BLz7HpYP2bsmaFRGbVZx6XH3Ft5kfqqM3+ehdzywjCHfz0H+SYjSXc/3KNeFrycyEaYJZ7Gc/iewJP+A9rLmr1zafAVdoTqDlk1n+IRh3LV5FiaXT5V0kVS3lUsOjnQgtWjfgwqEs/MxWBoVfk+m94ahvFKOnDJOVXqiCUWpDjcXoTOhJTLkRTGmiPEl57Xc1iPtOCNLKF12ow7dQAQ1imDe8tVBxP0ViGKlQ0FUksogsV8gabOLhY/ZtH2/36BkPhVkWhbGakVl8PRKR6NCfnuV1WyyuoySrZbj2pL27hM5VWp1EIBI4ie6c932+bYT9QWG0kTOa0rHKe5JyPTYSMl825swg816XYgMGvY0EBDA4zJwGkdGmVwCdIryQI+mkdcE9GOO5ec+DvW8RWBe2fhytaHR6PQB8KlR7OzV5IYp0V/fqs6CJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(7416002)(8936002)(8676002)(5660300002)(4326008)(66556008)(66476007)(66946007)(41300700001)(86362001)(921005)(6486002)(966005)(478600001)(2906002)(6666004)(6506007)(26005)(52116002)(316002)(6512007)(186003)(83380400001)(2616005)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZIoYtiO2pnnS6L+Ut/Ifxel+LevjVBZBVVVVSVXS084L12VU/oBKKchARBdN?=
 =?us-ascii?Q?UwyOMLa+tQZFK6Rbi6M/cNNMbNSOgiYbKd28YJQR115nDByJQ8VH1F0jAM7P?=
 =?us-ascii?Q?7JxNjCJRsdQWtttBdjade20MEObiHQ/cP68JR0tnOG3Nww1/a36Bzzold9lW?=
 =?us-ascii?Q?rnPgsFIzoz/UDH9MvSQiI+YWG4p8+9GZ2CvC56kgcZP7jLal5I7m35x7qPOT?=
 =?us-ascii?Q?w0x6kNiiwBx8CdEM9ThAmNbcUo9P4qlnOEYDNU9+1ouT3RFQnTy92FwY5le1?=
 =?us-ascii?Q?MtZKYf4a8dsELrVY7BRcnEcPQLVH2HO6eLhPAVBkz7GLhdZwB3iVsHtDu8v6?=
 =?us-ascii?Q?rrEG1njWVNUy6Bf++LCO6MjXCGGBcyaykiweJtddQITU2EqM/zGmqIM156FD?=
 =?us-ascii?Q?T2YqB+7iHpLMGCY1392p6wy5mEhEGMiTM95runrDB4kLWoTrkGEhCz3jPHpu?=
 =?us-ascii?Q?yIuOtlLhYhwm0FOzbQ4+amoJNu3NDJoWk/8deMyBfwFZK31NHFTQ/Jx7WcqZ?=
 =?us-ascii?Q?ons88VxfcEN/4EiPT9BepSYr3aoQ5hSYsj6UXfNDtDBpsax4iHUjTqFKGDUU?=
 =?us-ascii?Q?LiFXBiSvxUwhijMcbfgWycgt/2XT9HzOkNSX3Q6wQUk8371BDKbjO4AsSMpq?=
 =?us-ascii?Q?ecCdYZmUjUEs1jlE5iVkcn/hu8RAEIUghFQ1VGbNZgLDZ6/kCL0rvEr8lXP5?=
 =?us-ascii?Q?S5/AbQn/gzmiWJa2Df8ZXAG7jhK2H/JG88tW+GTi20iu/u8DTqpBXN1DRiiV?=
 =?us-ascii?Q?PvN9RIAHiTNpvQ3coDqvJL0UF0aArd+tk2gvHBMw3cvihr6lalwn6NCdCOPN?=
 =?us-ascii?Q?hWAYSCKTFttFUbF3WeQ/D2OwttU8zWrugYYWTzkUvCZv2Olcq0leOCF2Ly+W?=
 =?us-ascii?Q?vUscnKlCEZo6h74SlQIbe86WS4mQFihct7gByJAJq68kd72O63PGXccpz2pm?=
 =?us-ascii?Q?HecyjB894HAysUHMbjTDuz3v1APj8lpL5nLcPVrYcCl+eodUBeagSeX8nywB?=
 =?us-ascii?Q?10TVEAF5MKFIVFESAsK0OM93nb93VYvynsi4hRjVpjAHSFfp3HBo+aeafAFa?=
 =?us-ascii?Q?r7QUa+EQc2HHKeyEqdjn+8I6AkHcXC2Hy1y68ybJXd8zn5zvLZaFiS/Q2emV?=
 =?us-ascii?Q?/XUEV9uK4mjPMBkIkMm7aRnOl8jO8NdFnC1TPD8p6p5SzlYS+shqk7jYDHNu?=
 =?us-ascii?Q?vOXqWFyaFnhZgb0ZqmkyCXKL7X8RaUHFfutn7gu0UJGeaw1TSkBzJDKS/ThP?=
 =?us-ascii?Q?o43LqvuMl/DxeY+Umw81e4JcZJFC9Rs5damaAhFG1TASHjYUW2g1E0rnNboc?=
 =?us-ascii?Q?HTPreO6irABfC/zq9/154j3b3wG5R7mrJ8Myi/Cb0+zF2x3h+iQLUEmdZDsr?=
 =?us-ascii?Q?LEzFdIOtRA7o9bOvbD67wJSt0ycmAB5Qnsm2INfyEtJJRDghB8FxbQaTtJ/7?=
 =?us-ascii?Q?4hTfOmkd0ZxeiXXuQ4cNSHNF1Jbu5kJfQZZQfmYwUWS22Wxcj72J38B4lpW+?=
 =?us-ascii?Q?1GvY0qAqLSyoR9TfjDkq8P+yD7LDDcTY6Z3T2G7HrHYC7K5B+wDQV+YgOVIW?=
 =?us-ascii?Q?mgwwTd4WsfTPO48jTjkc3iVSe6e55gfIVZfJCSt/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 117b46ed-90fd-49da-c51c-08dacb91d7c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:27.9398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tr0kvNJ8T2XvxohuVcrZ+DW+C6qsNRFa2LNTauXUPs3HbeScsthm/GnHiBditG8riAlOKBvwhuVDOIGjYkvKwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for i.MX8MQ MHDP HDMI.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
new file mode 100644
index 000000000000..dad5b12d8ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP TX HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp-imx8mq-hdmi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP HDMI APB clock.
+
+  phys:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to HDMI connector.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    mhdp_hdmi: hdmi-bridge@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-hdmi";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&hdmi_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+        };
+    };
-- 
2.34.1

