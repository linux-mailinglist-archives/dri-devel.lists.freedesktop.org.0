Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E257CBBF6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D87F10E273;
	Tue, 17 Oct 2023 07:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1264510E272
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdDSO2tak0//fYHP89x2q6D2cjSxQ1mXfLy+Xdz1JqcAEaW7zPcZ7owjeI9i1r/gh/faVb+dvkGcHClvxNux32EyAqlfBVkh0UDBJlw9D6YWUptGYqXWNVgnC5pVZ+rX3SM+6uXMDApb85hAdJlDRDfFQNe+moWTdAHbrWC8A/XKYCkuTiNFmc61Rj3yoe0p2Bh9W5FdUC7QmI8PvwBYalxwMt6qiwj1j0x7bMfx0bOCFGVm3Q3mTfv5Th8YaycQiBy23CelBszY6nGvHueShx/wwwvly2XTx6Iu0WuESg88ssx/66QkUSOnNOGXK1JXC3Yuzb+dgYkUBw8acjFGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LylzINp7jCLe6sz7uje0e2tlF3cKV/Hd+SMAqgTnx4=;
 b=KzI5P+Xm6psLHLCDEhgP6RHGk78VjUIEZbBiXV8GiXPEFEDGcupqSYhARREKo3+sAkiEe0zOGWuIyewSdBM8GcK3QZhgBuzFzMgE5OW3mjghrxkEdxZ0GXNYhiRyA02C85hBoPLKp3tZw4Hm9LPlU/BVfwSPnjqNC3EkMPgFW3yvTDZdhbhxE1VDQfS3U0KrpDLZls9YeWxzr4aX+Sm8OZ7rrzJcH2tOLJ5nY8hYeaqpULcuWFCjrObSSe3BBAc333adfA9X2amlO8nhOWzpbr/X4hOqOatBe1/CxnbsBZV1FK83k1iR+awyNseY++AA0dD/BeFZmM3w69tb6998aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LylzINp7jCLe6sz7uje0e2tlF3cKV/Hd+SMAqgTnx4=;
 b=AH2dTt2+qdmE1RUzr2s1rHqYPXvvIHkyio2WBs1ae75RTPxaFHiWBSfYWU5g8Q0xpcKr9UF7DNiBeLJXwtYmnQ24TT2UAdppXlU1kCinVhfPqIG5KwXoZpjVMRETZ+F7XdtjIOwmaR0NGUhzixn802YNpc4tDnrWjew92DQX/v8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:06:24 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 07:06:24 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v11 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 17 Oct 2023 15:04:01 +0800
Message-Id: <3b01b288d7427726568e9a89e8ee91e444b39044.1697524277.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697524277.git.Sandor.yu@nxp.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: b0981f2a-189f-413a-bfe0-08dbcedf932e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EksuN+4aDaqyCkF9fjuhycav05H4HkVsrpql9LPXSLdquSUPtReGif3+j4+pdaXHFmkM+9Hlv+31y6mN09gvinlx2QRgdLDv+g5XEjDyM6spGFTAD4RadWvOfwLMn7Uf6M6d/CraSEsVAMg9TqEhh0Ampvlw8llxL+An1YDVgiJYPKODQeZwMN/YKqyNEGk8hZ5EKm7JiDTTWgI+P3VqsesSD5D6Wgj1US3o8YzRzmLCmls01r5E5irDtOhdn5q2LY2ZKwzMdZds7WptWXNoPqZk3NZ7a06iPt3KikDQ+x4mBACyJixiEpD6nh+lztZ5mgiaiuysRG877e8L53B9HWV0PwdjtcqfrIiy/cUWeJO1Ww6LM1bqV4YhcF+Uqy9/lzBJvpYEf8QjtkKeE9B9aLZYs6JQPK0AUGCpz/7f04/ocXo8w/RrILnevLQVDXQ+YJ5YEn2n5uJE/WMPBYBVjm+QX+BDSIF39evd1OJNkhMjUmYNVSbPa85275LSc5pFOfMmrPOnnMl5NmbvXmeHFm3LS6z569ZEZ0ywxaGfbppMXiRE1cdLZ3Kl2OfkxglBtmsgQR7juLNR27jVlIY3Myueqyzu+5prvaJCLBZrNrnY6FXY2dKzftOnmla3plPp7tx3xOWRZTjqAn6oodOgWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(38350700005)(36756003)(26005)(478600001)(6486002)(2906002)(6506007)(5660300002)(41300700001)(966005)(6666004)(921005)(38100700002)(2616005)(316002)(8936002)(66476007)(8676002)(66556008)(66946007)(52116002)(4326008)(83380400001)(6512007)(7416002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9i23x3VPCd+7AkireSoUW/mu+2XFb7pBzSrmF7y2pKW9ur6W73+9dgieTMP?=
 =?us-ascii?Q?X5tqgz/QkGsCn9vMeJSyrEZ8cs8heB9xx/d0RT4sbWStQrR47QZv90cJG+AA?=
 =?us-ascii?Q?ERXvKyAtN1nxOMjNXIdP4/jl6sk9mupg7mXPQZnIMROD3foWPj3csj/dIqnM?=
 =?us-ascii?Q?FF6lb0IWEQbF0KozYxeYFpDorNX2t/4AI3UyUl/KPs3BbOnn/HbD9S/Re4zK?=
 =?us-ascii?Q?kp3C2ELZ1arPSJM9dtHiMPvW+A5y5VzB22trazL21N1BgwNiM1YT80P66v6S?=
 =?us-ascii?Q?tKA29UGq8AW0Hei1ORRLtzoYQoSLABBVgKEblFtG+wAVvBTQsnUgnZinolR8?=
 =?us-ascii?Q?mOrORhSuGWoHxJRNFvFSbxliuQLzPiWyY6XyqaELewJoeZRWL9PxanrfJXQX?=
 =?us-ascii?Q?tYG26tj7MNBx5WRsbwb417zBN3xv0ubamGw2Satf6H8VyarDxrrjQSYLZHgk?=
 =?us-ascii?Q?svwVCe6ARFDCeqfGjNdwrkLaGCb5OmTLxl9hHWhDyU8oSq4c/D+NExSVdZWs?=
 =?us-ascii?Q?SFZUEvyC7LOVHy1beU1INDTyVBxkN55pOssPyt//M+YOYGBfwqj2HguILkWM?=
 =?us-ascii?Q?fETGuycUPyDaE44CnEcy6Jl6x8YE18fsF186Mw17Bvk0ADUbcTX610PKjAqH?=
 =?us-ascii?Q?IK0xeF4HLqY990Yw5ZY0+kpVg5VGodqIhXdq6iqL7Vb+TwxIwcAH3Cg+Lmpk?=
 =?us-ascii?Q?iXcQ1zqB0PdXlYLsS9y74nk9ECom4a0+xtnp4/h99C+5axYkV+vKQx77Turi?=
 =?us-ascii?Q?ZfaGDqqv2pPIQixLqwM5FmkHZ1ESInbcEEKLy7dYhGB+BAwfS7vUK+KiWdMv?=
 =?us-ascii?Q?1fc5xkvNbbL/NxwerOhwd2bvsMeUPNcTQTvUOkBzSRp+DnxoWu20QGx45RhT?=
 =?us-ascii?Q?l6a7RljhghmYGzBhSCZnctjgKzqytn8GlVCeANvorkfRDXYWOAix1TeQxQy1?=
 =?us-ascii?Q?iz7o/tPa1XNZ/4GdYgNYlZkmPG9DM1cN6UkmPtbJgWYxR5qXwBrHkKn8MiL7?=
 =?us-ascii?Q?aXfJh6qCv4oZvUkthWdyf41knbETmLmdiFdotwajj72PNpjbjjUt95o/1fTe?=
 =?us-ascii?Q?G7+BBxdsZ4Rf50mNRBHJ8Zbx3yzadauGiuJa2y5P572WPNYQzEFQ8XpppSs2?=
 =?us-ascii?Q?ktKpboYlnyporCwAJZznmpV2WPXjAWK+N3pwflOnTm6ddKOye5tpGfwSwiAw?=
 =?us-ascii?Q?Syn339Rz1dGEtU7uD3lH3YSsjLiOImke5cD6TanAJofVXzAyocVodrHjAVgj?=
 =?us-ascii?Q?EXhCOx8N4VYo4HkgPEqn+EH7Rpfc9BUE1yVhodazTzH0+Y3sObMOENPP9eV2?=
 =?us-ascii?Q?pmXoCQrOCrRJ2a/rGudlPm5lZjj/eYmFlQn1iBr82SDfAtqBlRV+gS+vHVYt?=
 =?us-ascii?Q?u1FIbVFQ44/qqqTvgwdHSJ6snrVS/8mpr+DDRE9h06O3lwp/Am/5m2fsVYFu?=
 =?us-ascii?Q?mLkcjOLiRtDd/4O/haz1QwhgxIZL1ZtAFP4XtfUSA0wOHPE5QlswMnJjFYNW?=
 =?us-ascii?Q?l2GnvGxBji1DfjYi65b4mX05Sgw2wu9jtBRi1SqM6ZpHBZyAmsQ1vVNtPdkT?=
 =?us-ascii?Q?d7AIyjmBYuFtkRyRrnTg2DGvRgFdiN32NrNGi3wL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0981f2a-189f-413a-bfe0-08dbcedf932e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:06:24.7406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAxVOLsgmE220R+AVVz8i6/9kR9e0+7Sx5jhCpXKKzTGtroW9iTG3MCkETb9IILV3xsPJy7clQZdmY05YSuA4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v9->v11:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..917f113503dca
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-dp-phy
+      - fsl,imx8mq-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY reference clock.
+      - description: APB clock.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "fsl,imx8mq-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

