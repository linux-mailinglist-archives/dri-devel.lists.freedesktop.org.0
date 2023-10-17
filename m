Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7CD7CBBF4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0D110E270;
	Tue, 17 Oct 2023 07:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2041.outbound.protection.outlook.com [40.107.105.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741710E270
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:06:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kozlr2uPG5uVpGcUBkMl/AAqCC1qT2a8ggMH8X40xxf9Djwt6GCWsO0Eequjftu57lbg60oYYN/5nYmHxSwzw4fRVLgFTV3TqLPB859UbjW3BgtZS+e3TbQYgN6GmUdUDU2GO0n/Cvucuk/PTlwmb0jARgLQwWOL4Mi0cW0o0Pv0SoI8lUS0N1SXhnT+T8ZuD+fIv9mUJbgj84UKns09Ic4fIsvV0XOOBwoQaEYbjF4RpRJZtWKDzPfWmRGFvXL0xfljwd9Ts4mTMomMxokejIflf5NtisnYQmnEivwGcGSrKJbGkm2YM2pk3x3sg3huUrPOZUbN1LeVQrcwyIsnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEp0wMng0+IEbe59ltNGIo5sT8k4HbZMRs6boqBhKIM=;
 b=j1Ah5kJdtT6Mdz5g2ySfGTebssVjp1knknqyi86XR/TZiPdO0ycpot7Rp1jS2kVOKCTDDsC/C3zc9DwQUZqJig55ECrpKJCzgvRDWIIdEY/hSz0ckm6NY+eAecqu3rklNpCj7CU7AL9/1RME3lA4R6+HYkrNH9rOuJfilLfWoOY43OIckAcWXWC0LH7o6Kxcd7gQdwrnmaoJfe8wq5BuRzz6epcRhgyEQrQf3EcjOQth247yQJH/2XD82DKMOcEz8s6duWMPIYOXfgvzN+BdEeCOjbkjGIq6EVMagwzppA6M6rRPPra8Qgng1wdAqs9kndB9Y2aWYg7HpWD4Vg959w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEp0wMng0+IEbe59ltNGIo5sT8k4HbZMRs6boqBhKIM=;
 b=lcXD2QVRy4hB5x3e8lmYSO8/G7Z+OgudC9cwZjYrRRWNLbwy8ftF45kr42jxqigeIaMaI99NVrdp7cYaKMH1TRxcI5T2H8mhUSGrcOMiCfy3TY9G+hA9DHC8Mh0W6XzLm/jmIjB2hdZGb2i/nQ64GUWRoadoUqqzeHl0pur6dvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:06:10 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 07:06:10 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v11 3/7] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 17 Oct 2023 15:03:59 +0800
Message-Id: <5160e1136dfe78c285aa0196654711d385b0ee9f.1697524277.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca6cd89-a83f-4abd-0885-08dbcedf8a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iakoh6jJSWhUfd1pRvrMoL5TFaSHT+hdAJG1xJZx0donXJnnb+auWMFbF6jOZaiwxcezwNXW5RuAeIugDYRHwPp/eaGJW58tqk4JaWYgbnP0gauDeYZsP8ILcw6DSJL0zh90Vw63iusl/qU+4MYBxn6He23RvuqilILrBpDFNHCT0SdhqE4+6kI+2qEcvKJnPn29ijAWZTxauKCct/j3cYMRkFJslxwx66nJAM+07L6XT7YSYmyayBVaBBrLgmp8B2d612C86B4i69X5mJSlqLxbSfMCdCssiviCO+AHHer5/4bfl7Fjx3g/M23cjRufnal+qMfwIaPrBNHREFDwJbUBkSSiFkqTql6dyh1Q5V56niysXdR2nK2PItb41ui0S5PzU/Zt2tOPgNqGP5zw4JwWC1gq8Ynh41VYrb8oNMRnomi4z4kjgrfuOSlTeLMn1teTfQqMs+6B9yW7mgnBc9qRWj7lfm9F2rYPq9HxMX0ag1HVX9I4FNb6b6EqFXb/YCx5TqcYBpRT0ouWFxO+WDlAx/hPY9F/iCyhkP400zgjsR/2z31JhnatwATSmnoxrxgZVQoOnCujWX6ZKaa+rHibZ2k3jn8PfhzIwe/Q0MXWd6J7PHHAJnEA0PxiPSzB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(478600001)(2616005)(6486002)(52116002)(6666004)(6506007)(41300700001)(6512007)(316002)(5660300002)(26005)(66946007)(66476007)(66556008)(38350700005)(921005)(36756003)(38100700002)(86362001)(83380400001)(966005)(4326008)(8676002)(8936002)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sc2ONp4X2AFlJq83F3RmeFrYLBAHwK3SfFcVlXpwWlUdEC6T8+cpSJMop3m/?=
 =?us-ascii?Q?M0sSEnLHCj1tcJ5UMYlWZGdgnmSmWfqVAT4QxNT1OKqRIOamT4lCM9Zw4IPW?=
 =?us-ascii?Q?yHwcSX/T/Rx5QWplrn/WvzyOY8N1Ke3BhtIzOTF8tNsDbRxvTR7iJmVwEtfe?=
 =?us-ascii?Q?/hRf3IIPJ6vL7Leh6/An4Gqu03TWoC/waCMs6/9RNRUr7ATAnFbJrEfNqZ2s?=
 =?us-ascii?Q?q+N/wgVf2LCvA//QbznLEv4+pmRnUCHqFBiKaWal8QCbmZRlEm3R1Xj1ORu7?=
 =?us-ascii?Q?v3fBdnR9XdEGR7gl8LYpcqLqc2JOwED9SjBjG97q3IRkXLKvdMyl7JVvD0ak?=
 =?us-ascii?Q?GGSJDoFB269tYu/II1v3ehD5gcz/dD5XdcHKcwq12hGjoe5CqBNfs1SluwRR?=
 =?us-ascii?Q?4Y7xttISkx03E0ON4UXlNV5JLdvHBCxkrUl2RhnVMmB3Dbr+TXLxJyzzeMb/?=
 =?us-ascii?Q?Ajo1nfONhqVMTTyccN8+adxwUExSSmI6Xd8t8OBZr/bhxe23OnFFFTHI0Izj?=
 =?us-ascii?Q?19aeGT+yf5l6RjIZgBJ8pV0DOIEmTTKWPSSa55AGOL9kVug1AZ7aZYYpQNRb?=
 =?us-ascii?Q?FpjVVoY85G6vlVxE0g5c/ta+EZqnngbWgqYbEorFjxlAgZEk8M0YLCA+NLVU?=
 =?us-ascii?Q?iKkN5/xzt8HMGtYp07rdABVBo1R4h6FAqjrYit/SRwVAIidDmhmfpLSdVS0M?=
 =?us-ascii?Q?Gp/XEZOhehrdKxpey1MB2yIk3cEjjwm/nSpJqH6eB40sRSQ+ZqZYfzNQdFQt?=
 =?us-ascii?Q?dJ6MvmpQYXdQpOQrmLgEUmhaXzlh5Ct8OY8ezNd3+U3Aleih4gNgmE4jmkmp?=
 =?us-ascii?Q?AwZbBpsJKcA6xyJw3zBpAncMAfqwKXmBl1a7BA3TueXSDXkdHOIWIZPHwPit?=
 =?us-ascii?Q?EmB2dTD2+48NpM1g3ik4pQFVpTiNtPhXINHXuuZ5rNWxxEo84YmZzQbrxppM?=
 =?us-ascii?Q?aN3gdVR1kHPRtKpzTwdTU1GvbBCtlW2TZf56XfwHo1Qr3ATqCQHIZRLqgwHI?=
 =?us-ascii?Q?ZEByXko7AswxAtn8tnivcspowI5w9rGR2cjgRj6zK3wDAIDl4tWt9lE/cQlq?=
 =?us-ascii?Q?Ke9JAU//nrrZBX1Kz0FVx2UKcF86n6DELzcPu1SuWJwvTg6DAGngkYG0BAHz?=
 =?us-ascii?Q?dNysfmjhYndZlsBrymEDob1Qv3NI5rwrZGWqCa1h+eOANSyFtdjK6vH4e+KR?=
 =?us-ascii?Q?txzNTj4J+B0P+id7NA6oe35p1UILJXcjy+moudeU0yFZwTEzY3lk2ygmq7Oz?=
 =?us-ascii?Q?ihgPhnF/tU73hOKuZOvjP9Dcs0HdWlF/oEKBoI58wu3wMYMECxWktJkrSF7r?=
 =?us-ascii?Q?Kk/pysSPUo49heKcnkxoYXGu3Z7g9ff2tT970+pje+GzfCOOin9ovhpPCWvI?=
 =?us-ascii?Q?AtDp7oE0W/s3eeNGo8Ans+BGO9eH8FLEKTgJsg+bWCzvBnE8/i+C6BzLTOOO?=
 =?us-ascii?Q?OzEMxYnnfHm3acsfkVe3WQC6bZOQt1Ui7AJt0QI/EdoItkQOp5mMxyf/Dv32?=
 =?us-ascii?Q?iinLytkrkvevAJy6NFh33tVTbwGn3jc64FGpfgTgJyjZz8yguKz5+F/fl7fR?=
 =?us-ascii?Q?OW0EjNTGHBBD2EjvpceH4cx3d0seFcN/NfRdMfKM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca6cd89-a83f-4abd-0885-08dbcedf8a6e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:06:10.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNFhDuVZW2xgrXyjyPeCJCVXEeriSqfDGy+s46sr7txV0FHYRENAtHuT0WQ9Xm2lrKax1V/gVvtjaSEV0tCZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-imx@nxp.com,
 kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v9->v11:
 *No change.

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..3ae643845cfee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DisplayPort or HDMI PHY
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
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
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
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&dp_phy>;
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
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

