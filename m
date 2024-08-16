Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D09543AD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B10810E5CD;
	Fri, 16 Aug 2024 08:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aLUtqBfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B1D10E5CD
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbeyU4vciAlDrd74+BfDkLqONwIaDi23IGbpCoKvUniWH/I9XB0UPtrb8rams+F9h3ABLODN+vR7osfKRy/Lcy/eauHmvpk7DeZtlq/TDdKMFBuqq/gJaSwDFtT8lZMh354e9VJ8jLHMXCseSGMLdAsZ65sfFjxPUaBpikjFeXtfA02Lbf64iYnHorvkFzAMxgzCMTNBfUauFOKM+3CW17qoc2Brx8HmhWGUGaJ3XPVKG0u52nMG8fCzQahz0AOa6KVYpisqflVkZLnNM6bC8zYaUHMCarXdaODzDFF5VBpx3PHjXhBc4J/tDXmyHXFfSHrH4lhHaWfK9VN9I7pzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBgvnV0vGzFUX82obLi1whjT8/21qAXVAUeYAGHmp6I=;
 b=qSf4A+HiLt/58uoz3pgUn9XhhzzzuyfEJKnSBlcSdf06U6MGNBXustjds2JQiDs21AgxYT0Z2erOr9bIoXc0zAgboXMDInPQttlO9RosTsTo2Qv+WfB5BKseYvHIGZeDuvhGgb8svheKbtC2gvtWYF8OPWI9rY4IWYaySpwfB72Ocg3pzi6/SAlD2okXwrUrl+YX7dTq2DeLYOEX8+ZuXa3ZK1OxCP/EU7gefEJzfc8QSjhg1fdE7eZsRK5H+U2F3F0UHWvC7n9zntLnPxQnISPn1lotNEGXzBcVpUyjOjfaMiWlczjsNeY1591zsVeieDrCMvU1lh+eCFcLrQvtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBgvnV0vGzFUX82obLi1whjT8/21qAXVAUeYAGHmp6I=;
 b=aLUtqBfoRAfU+RBNZcnY4xgvUTRDhaOSFrSxNsOiLHb72aGUr6v7qGfBtArZpz0PrUgwPlFEuO3NjATiFlxQn7jtVNmbjePAqWMZD/sFox4jBGRl4Ca4MSFrF90DvNZOp/F/9D5+PTCIbTaFSILePO0x5dTMNBEK+AEfk9jIFHJE7mIfsqUWghjBya8lebtFX6r6U6kGTvxF/u8BcolKLQRBboQcCNztPRMhoPoCZpmB2utrIh8BH/nUfmea2hPU1el9kskWH5LvzSif7bBsMkpmHwWdma4wD4wea5OYVCYX3+pUS3yeHCc572eeQvuWdfdsbMAfvxhyVvggSk2sgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9941.eurprd04.prod.outlook.com (2603:10a6:20b:67c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 08:09:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:09:41 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, victor.liu@nxp.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, peng.fan@nxp.com,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 RESEND 1/2] dt-bindings: soc: imx93-media-blk-ctrl: Add
 PDFC subnode to schema and example
Date: Fri, 16 Aug 2024 16:09:32 +0800
Message-Id: <20240816080933.440594-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816080933.440594-1-victor.liu@nxp.com>
References: <20240816080933.440594-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: fce449b6-d883-4ba4-b5db-08dcbdcac773
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JirXDemJNQQ+vgouMAD2xEaNLW9y/hGrf1lyHLob15PSiO0KdsTH6t9m2evh?=
 =?us-ascii?Q?1TV6hdUN6y4nwCD9n/+01OODN5g4xR5dxySCD4mBX3nNCg87jnfBDrtUGKnl?=
 =?us-ascii?Q?7MT96oSyy3KyaB2c0Bx5QETgRtyWczHwhtbV4VOI5sfBrUSKnF6d3fpPY3x2?=
 =?us-ascii?Q?zy+STzZnhlv8EYbctrHrT1cVbA87EWSQpeND+yeMcLZfcZX/K3QuiznNDmPz?=
 =?us-ascii?Q?v238jQZqGPMJAwQ/T9ATH2CSzMeKdXY33OZ8QlZAgAOvWr9/geXHr+eU/LME?=
 =?us-ascii?Q?b7aBp7vVk3mgFzjqsf9bzefEibrcdYiaCTCK6PSgX1z7GIou3Bd+IUdEoaqs?=
 =?us-ascii?Q?OnwKsm2bQbYw0p+jipH8T21q+qiEIT/6QGGdUaA/fJmqLBn9HxBzrMG3r74J?=
 =?us-ascii?Q?Rkswep9CW9E9Z6bcG3jXgSJWZS8Pgpi+bnrJeejA+Tu7K3hxXgLmkpjyyLDb?=
 =?us-ascii?Q?a9Mww96VJRg8g0KZ6aCsnAgq8EPM9R1ZPJ/5XzBXatwJMySsb20vuY/cxKDZ?=
 =?us-ascii?Q?Yl54cqugsBXvxBJRDsNWUevqizufKG3On8hHfNxvMnGd1WgkdZYZaKCuD4jA?=
 =?us-ascii?Q?1tlzsd0pjtz4lVkdqwfrxI36w6jq0DYU6J2XFWYNSVomjJZgygV38Of6uhnl?=
 =?us-ascii?Q?bbT5ljFLnSIJvI8+JTPag3ZrjFt3e9aGeutp6kTuotqqquRE9EUPdDWTkYKF?=
 =?us-ascii?Q?9O8rRCushkFdfDsIzQCowNARW7X+pue00QadUaY5IMEkpIzM2x2TKK1eFNEO?=
 =?us-ascii?Q?E7xxaWrwqVHxtMTai57bJOO8QVwq5/zWp4d1MjGeR7AE4MgZ0muN6GpSu2l4?=
 =?us-ascii?Q?L7V0DN99J3a96kFdNksJgOIugrC+5Efp8wYHf36vHjrZfaSlfM97ezP9iGOz?=
 =?us-ascii?Q?W4+WuzF1CSPq0gSBk6pBhqqv9YyAhAHCsncMotMiifzgyk1/FHAX6FUgPiWD?=
 =?us-ascii?Q?jo15MfM48IrIlXDH+sxp/94R9vzO8DnXoHrv8fkGpjlZfmSU6i4uY1in38uZ?=
 =?us-ascii?Q?Iqaqtrg/ZnHB2/o9dnrNbCl+bbBLnwwRKn7wB1RVKIV7fwEsZXdsVzCe09b3?=
 =?us-ascii?Q?iwDJBN8/4lrBR1lbd+P0IUrU3W3BwcdoZjBDqXs3ADBNtNjMDdvOmnEy5UcE?=
 =?us-ascii?Q?8uvX2lgIUb112HrggYENSypvAfDy15wanHu1AMTa4pja6hGb1ymodJeA34A3?=
 =?us-ascii?Q?c3Ccc0wvZAYAj7Kq/xr0QXgL44/jCYwPme0/6PLcTvgqwSnOz/xuVZFI3k3Q?=
 =?us-ascii?Q?YGjor2wX/LrnV8mdpaKxljJobjxmJ3o+SLyrzA5zkCwpwh3eHwyPkeGuTdYL?=
 =?us-ascii?Q?caUVAjT2L71znEu95QpmmkbNmJdvuAsi9MYycISkIF+6gwFvzx12CTyyVbqJ?=
 =?us-ascii?Q?qMszytz4DI/luzVWTYAYF99MzYvzrg6PgJlHjE4jc4BizUpOZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XvoxGqyQgY3xTxDqUC9D9ajLqDY8qGjauW1Nbb40lxVxqsVrKWK89iPvojVO?=
 =?us-ascii?Q?0s0nP/CTgPktq9DMbVDrDrndCy5VDF1M5Sgc5kuS1HAqvM0Dfb0dGyH3k28I?=
 =?us-ascii?Q?CeeSTcpwpjqWAwZh/BWW7dj8d2PCwmb75EHDIkfqDWe9u4gs+X02FMg2efQW?=
 =?us-ascii?Q?YiCm2GsCwRIrswzAC3EjyW48hHqjciTUDW3I+ocwYFf6AgN55ezqtasFJYYa?=
 =?us-ascii?Q?MkZj3QbAsuSdF6mB+szhe4GxINWcVvSj4Pm1oXPol719TpKOK/D/2c/YGDiz?=
 =?us-ascii?Q?Q9qRNpxdSnRmPVB081rbacrjPCaAgoPep8n2A2fNbEv4ysY4cN0Lvf8xmGZ7?=
 =?us-ascii?Q?UUBk4HtK3FBchpseunRN23FV9j0ArC+T6eWPC91OMBILcYrrfwjCU+RgVzLl?=
 =?us-ascii?Q?Er/dy9YwqhqhIlVShB1SZHBEH13jBH+Jlmxfg29NRB7f6nTKHdNhptTrrO+f?=
 =?us-ascii?Q?SMhBPw571T0LeAN8C8+f8YUoIq8urUgeGCzQo4JTF+ePMoF5GHREE84xlwGh?=
 =?us-ascii?Q?ZCxI6vOVUH8lSvwe3jsY5mJaTWvchqhGxhVro0cOiVvUQLTta06JNHwjJZ/Z?=
 =?us-ascii?Q?LSLjjAJ93iBWU/OD1GNTfVF+NsniHGAee7xTID4feQZIOfZlQi7NCvz9EdJv?=
 =?us-ascii?Q?SmzcbC1iXNFnNYjx1x7AyNSCCxQ0S49OFhSMJFhg1T2X1B9oTNszpKCUEvUt?=
 =?us-ascii?Q?NDd65GR9T2HpaZFXn/BtKvBPJtNvQGdV/8TVs22Hh31ZGcXPAUIEhGtbbC4t?=
 =?us-ascii?Q?LFmXr5srQja9OVmxUKexVGZwtjBbsvgYmQHCnUh/r0ncr0411ngSlSpDf8b9?=
 =?us-ascii?Q?B8qFiZRQwHSEydBOtf1kzJ5PgPh45+hjCs+PeP46lpUPln4ihzNoKZ+uWvIk?=
 =?us-ascii?Q?upbu2qC4J2+So9/dB6TBzAORjC2OwUrMPhtFmRpx8XEP9P9cF8wyMGaQFQ5+?=
 =?us-ascii?Q?zX4V25VUx+yxgPTF5ewT5Ua9JWJD2u2gyAgr4EdDyCkDBDfkxDdJVT1IaZij?=
 =?us-ascii?Q?qNMaNhc1auZw1qztOBRbfOqpJq9fqNTX3v3HiDiRMBCrybYUK0MNHsEnJc/h?=
 =?us-ascii?Q?if3Ae0lAHMFh63nrZc2ihRPivxc3WeFQNLE/xyVf5D9OxhqXK8HBZNuiivOn?=
 =?us-ascii?Q?5xWojOJ/Lq9mdCz7uoWc+KLv7qsetK9Ws7E/NSpak76gL5WgLrnOynlr369r?=
 =?us-ascii?Q?PPBAMe+amUcAYx8p3kEV4tCpK33LWnsbcyOTI8msM2Ia7a7chPVd9i/rd+1w?=
 =?us-ascii?Q?/vzKbg/GiJYNuJAuFrP+JYO+Lu0T3dJWf6LAvzRLylAI0Sfpxv9I76w4++Dm?=
 =?us-ascii?Q?6cQ/EbOA68jqhl+aPxW/loT1LCMlumlk2/GL0zgfFT4UJiDyMzBBqtc1R8JG?=
 =?us-ascii?Q?dfv/27FKGm9H/Y0oklUMnjM8lRzfYVTqCiHcuoBGAx9HrAlwuKdEg60ZLKxy?=
 =?us-ascii?Q?o0DVn6Xsj3m/25kyfGa3R0RkFzBWeT6fbpVBK2b9dosaoZNCweTXcAS91tmW?=
 =?us-ascii?Q?HjCK4mgTL0V3qEXgewm9B1UlzcswsYbC9OVqSmu54OtKxIx3QyehMxtVK+ww?=
 =?us-ascii?Q?Hsa5pFBybkzmp48bGjTv5YU/NEVAU1Q8AUym3HZT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce449b6-d883-4ba4-b5db-08dcbdcac773
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:09:40.9597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0+IPYVQpC5qHMxmLepl+6iua7TAI2BKVFTkjbrwK9WUdTTE3JazVmA0fm12GIkOGC2Yj2+FBB7XPAS3kjOP/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9941
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

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
* Newly introduced to replace the standalone dt-binding in v1 and v2. (Rob)
* Resend with Conor's R-b tag and with the patch rebased upon v6.11-rc1.

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76..3f550c30d93d 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -24,6 +24,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -46,9 +52,43 @@ properties:
       - const: csi
       - const: dsi
 
+  bridge@60:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: nxp,imx93-pdfc
+
+      reg:
+        maxItems: 1
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Output port node to downstream pixel data receivers.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - reg
+      - ports
+
 required:
   - compatible
   - reg
+  - '#address-cells'
+  - '#size-cells'
   - power-domains
   - clocks
   - clock-names
@@ -76,5 +116,33 @@ examples:
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
+      #address-cells = <1>;
+      #size-cells = <1>;
       #power-domain-cells = <1>;
+
+      bridge@60 {
+        compatible = "nxp,imx93-pdfc";
+        reg = <0x60 0x4>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+            };
+          };
+        };
+      };
     };
-- 
2.34.1

