Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83C989A12
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 07:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF3D10E2CA;
	Mon, 30 Sep 2024 05:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kCsI+avZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013049.outbound.protection.outlook.com [52.101.67.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FDF10E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 05:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXU7zLlEKSHkc5rtKCoYHWp3zvI9kvGgtpSrRF7sjs5kCJZ9UUQLFizxw7DtCQ4Gn+gDKGerV1C9MSw9fkrf2GIrfQ2NA/oOmKY+X6u1aH78yRHhDJ9DjpGUg4j/yalaMubMhukheF2KZB2JT2UTbkfh0hH827mkjrTDE2IuxPf1+EtvfzBhO9l5ElhJ6lC0PhxQnQddkqj5oXKRrkmxMcZwS13YPrDwYbyAee/zgn4lrqOMrRCyfX2S8S3LvQfGpTpa+52a+8DOIlZNZteX7HTPovwD9aVZzWsp31siBdBMkPuIceMitQPYFrpgeLKu9SVKZOO/HqppaTaLfZNuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT7Al3DtqnMMP2cs0aRtB5qJBO0kxfvL8uECLjeedu4=;
 b=YYGr/5StyZnw2CO2EkCx1F+jxi43myWEOEsMSmPBkYnHAX8P9Pm4cPaK+aMQMPBsXlbh9vi78c3iosJHaCaEzjJg+FWD8i5hjdOUqFk4+tvY3UNk8PVSkM0+m0w7x/Tn3fqiWqDyzp+3MpCbjm8cURFvF7q1j+/JENVhbAsNH5cXYXjTRBv9mM/qxzJlfrIqmJggGy/PcNxQT/LO/GKqlAV5mFMwnZB759yxR5AujaF87xnz+gF/vRzpAcQpvlxI+qq+bRLWW+bqoYLvMcwAcdmn34PCBbG++SIeTbI+VeyHJLlsfXhqTeFempDMh7zL25hIi3wK6nOnbNvws2/+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT7Al3DtqnMMP2cs0aRtB5qJBO0kxfvL8uECLjeedu4=;
 b=kCsI+avZT35FwLrdlygL3UYkN+cBKfHvqO0+iQW4inl5+j515Rrt8JDS2cqYeSeIvl62/NAdfixlxvpkLISIUOd1YaIU43YGmJ1dxdblOLU49F+DDskd5CfNHyayqFstqp1xSllBGcx9iGVU+wJazh6BNTslK1vwwiF5bdMfO02iTASU7Yt+WuWvJT1O8KwiDBEPWSKVzw9EIpC6GSV/jh7S0ZAdcXFDSqLUR6nqdtn6qQTdga4yKl4VUeXG1WGCoLYWH3XgLxpxQIB+b98iHQ3yPOlt9mOOYaWhrAltjwxKLLwkZ5hEfcEUh1qNaZ2np67+Vg0o5UeJVqmww5ranA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 05:29:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 05:29:36 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de
Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI
 converter
Date: Mon, 30 Sep 2024 13:29:00 +0800
Message-Id: <20240930052903.168881-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930052903.168881-1-victor.liu@nxp.com>
References: <20240930052903.168881-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0678ad-9385-45ed-8a33-08dce110df0b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HHWAp5vUv8Ilb+ouyMhxOEPvkkso964+tCseag7xQLp6xkzOkbqT3D0zQc/o?=
 =?us-ascii?Q?fh8Z9annYWZJpvGTySI1EL5lIsvWkxImAAxrC+61xNkVErtMmeJyUrw2oqjY?=
 =?us-ascii?Q?gVUPoMPiD4Kng4nvMo2eUCg8a7N8m4Z/tFq3AQnBRSoSuFT+7HINHSRko4r1?=
 =?us-ascii?Q?yCPPC6qr80d4ndd9UHd4sgfplMCjkYVcDfbEywkqWRAUq2RFHl0/aVvRZiXs?=
 =?us-ascii?Q?ggn10+ndLPHALv3Yq7mxGMLfDXsv2fML5qMUdaCAoQUhSr4QdPpsIjaIXgIZ?=
 =?us-ascii?Q?xvKsck8GQyV65+YaNnQpUlGEdree57qVPQ+3DaXTTq3we3P7TrGCe/OdZGJP?=
 =?us-ascii?Q?6VynigbzRJ2XCzjWkuSEWBArzW0N+CDSMlXjrFnbZ42BBMgEd/Y96IfXDGdT?=
 =?us-ascii?Q?OIG87VCh6qgbzGlfbcmzvrO+ERhVjEjZUjvu2tQ5ios5nsWE1qvGyyZ1wglw?=
 =?us-ascii?Q?mG+PsVr16AQE6J6r9J3T8THruN+jfxrWupOBKRjHUyJfR89naToT1kK2Egcm?=
 =?us-ascii?Q?KtlICB0myV01YVXMk0Angl7hLf5VtyCuuUjYtsW1F/k8/x4J4LBDyWNDjayW?=
 =?us-ascii?Q?LWUDQ7ZEkhCWufp/+aiDX1wmNvXwEymG+2XKOg2xTRdqt6paEw6sBmga6O0h?=
 =?us-ascii?Q?1wELMoIeDUli2fk5opdSL75KzJ1kB0FzKYysh8ie03qLMmF4o7o6fobV7nZV?=
 =?us-ascii?Q?AFEQF/LZ/w4Sd5UB5KBu2zWyccNZ/Xp6+UC47eTf6Mezyrz31MkkKzD8Yj3r?=
 =?us-ascii?Q?lazS4lLBgDgIQzy1KwX+ACVXviLSM78YRVffWijJ661KCGarRLRLscxm2ZPH?=
 =?us-ascii?Q?48+KBEAde9A2XsGylGIDxy4AN+kH2sF1ewVEQSVQj0aYe9WOzekk0ADVGEq9?=
 =?us-ascii?Q?L2zut/enJET0wx2+029R1OS0NJrXPzxsuZJSNnBOQwZpVO3RjeX783EhyGLF?=
 =?us-ascii?Q?IpddQd5nhWOD641z4tcDNyO5xZN4lQA/B4u774WdpwBksJTa8PxAXN7W0Wej?=
 =?us-ascii?Q?jAapr4o+xfv/Uj8udfc/iy7/34LXCo/LZB6jRErroWDeH/FHWNQkUaNaLyeL?=
 =?us-ascii?Q?TAx7ES8WRpJninxbP9r5HrfTbKFUkVFfBWLIdejrBpmvKHKw2bIMRlOL8Qns?=
 =?us-ascii?Q?c/YIp+8mw4loc2yaQeQAb8VzEscBNzJSJR7HTBm2ie4Fa9D2+nPk2AxC14bg?=
 =?us-ascii?Q?Asa5Zpck7eaewQ3bsEiJIazKGaN8RJa+5Vks/zSyHB3MZwfHRB78qxcSsNmv?=
 =?us-ascii?Q?KYNnVbiroooQ7C4vYu21E4F/hx3/UzVMW9107rFaIGg/7Jj44Rz0WcNd6s5I?=
 =?us-ascii?Q?GV5oE0E1bsbhkpAqw5o5S77o/NaY6umRQr+AoVpC7vDIIEnVUi/OODSepmfl?=
 =?us-ascii?Q?7Lly4Y0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e5KdCJ34OMOO1zqlkBStZiGYpySBOqYRcOmP/9bniatIz/hDw+/0P+1MCuzw?=
 =?us-ascii?Q?SxrDG16WrEWi8mmZRZIThRcove4/E+kb5gq3ro6oEMIHu01IxhWwhYWk43Q9?=
 =?us-ascii?Q?S4Ca9pg5JP86W4qWwgEbzGX9daCWNC7p8Ra9F9FeuHkcGpbDx2ytEcWlf4iS?=
 =?us-ascii?Q?QeihranqqNdDXLTPCCfRt7tvlD6hdtR5/Dn5RvCQx3mmZsntNalGCzkVylzX?=
 =?us-ascii?Q?6wd6HcwcICyile6gMR3Ef/MBNVhJGpkSzDtoCI/DNAdvTYRn5IDpRAE2sYBJ?=
 =?us-ascii?Q?EAFGLmMPKFtfPWiZMnOLBK1+jFEOmSZGO0K6iI1BxGN9pkTyx/l+kdUd3g4v?=
 =?us-ascii?Q?v15+7OWXnCSxRA1GyPu+YgYAG2/I/kl4e68/RnxSA3GD79dvdJV93q3hD1/U?=
 =?us-ascii?Q?ycm5/7GmDUmNQ8nUSirftYAXrbQs0N+Z3wAPAdOkoZhwV9QKlyk9xHOJdoLh?=
 =?us-ascii?Q?0YpCphiQYAaivSQDv38y6tRSP3z2beAcE/JEhBeSHEeYPi4ACt8O9gXrfCG+?=
 =?us-ascii?Q?fDF12G1HL6d9ZEF2mP9sAgxq0Tw5pxlnijs6A31U51tiKPtpN5k0Y6+yZZAk?=
 =?us-ascii?Q?ULWeNnNJgiGz/gFqql8ULoKExNytU8fD2Qcsuv0UnXpwfuGbJjbUNCbxBdiL?=
 =?us-ascii?Q?YmogbUOl76Io2cPjlWMk7NwvO/D1SCR7usI24yGYiGhVpb6hxrl/jlDfhUp1?=
 =?us-ascii?Q?J21oke6D1azuo0fA0uKtczglh8/HmGg1uq7mj9V7XgilScc8lJg+bGxJlqW8?=
 =?us-ascii?Q?fa91FabLWERHdrpGTusxf6TLOJrFxDBubCU4JuPm8iH1kLmDk4MLlBzMmCPJ?=
 =?us-ascii?Q?gS2DIa/rpf8s/q/xPQjQXyDWuws4NFnJXz4J8NuyQGPm1F/qYip9FRemLl0U?=
 =?us-ascii?Q?Z4zR2o1O7VyoDgLudP0+LL6RgtU0PigTqTVWkNgh5dWEzwxeqldtUY/CzNRz?=
 =?us-ascii?Q?iGz28EbgroQYUMR/P/VW66wQ6kT6JCuGtIUr6sIhCXGodcg6vcnLxNlOV+ig?=
 =?us-ascii?Q?l0UoCoHmsiS/r8Fs6eSipyn8SmROrKT2GKxgHET8Bl8XjKZd7HLDG7zEnKPR?=
 =?us-ascii?Q?60B0UOV62uwUPgerH7E0ZtEj9fzUwJ3iECyuMgkRcMjvuxqOqIa6ruR/bszK?=
 =?us-ascii?Q?037uKaQbfZVLl4PNS1wHHYx8cmgWZebWpuPI6msIGaZ7mo9lJPoK8P5MWWxE?=
 =?us-ascii?Q?hB50lgDAjRhBanz1RF58cRFT2UWdMr5BbVzV+pDY7hLYHt5E3Jk5irjphf2u?=
 =?us-ascii?Q?+zdgR/8d3yFLP/5ITcUdUIXQc4WCWwdb2wUnfo1oi5Xs7Id+bccBxIsPo5yB?=
 =?us-ascii?Q?V2rhNpNwHJeCxryuV1qD96vwSHTzsOtvZyl1vg0l/1uK3FC+0DZ+4uCn6Um5?=
 =?us-ascii?Q?QSgrsozQAKfNvsV6/NLzz9S23sPQTrC8oFd79yFhDzMS+sl0zmBAPthyx8/0?=
 =?us-ascii?Q?8qDw+0cofSC0ODX+q++8K6C6TLl9+I3jRSFD5bLsBzCek33XUvLr+WjvxX2H?=
 =?us-ascii?Q?TQXOwyzDdlCuI8KmrCWRBnhrsV/qnO+DEs97kFNw0SF185AV6Nex4uZ8uC1t?=
 =?us-ascii?Q?A8VXKMxgUov6IvQxnxpokgYaxRG7ZsdHkagzYO5W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0678ad-9385-45ed-8a33-08dce110df0b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 05:29:35.9971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuUeqIICVOqkur4YQcInOZX4pNNPkXuUMeUcMsWPTw7iW4T8BJHieI+BXa6aLHa9RBSKe8Ad6Js9yFH4jGIDDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536
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

Document ITE IT6263 LVDS to HDMI converter.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
 1 file changed, 310 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
new file mode 100644
index 000000000000..97fb81e5bc4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
@@ -0,0 +1,310 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ITE IT6263 LVDS to HDMI converter
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
+  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
+  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
+  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
+  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
+  1.2 and backward compatible with DVI 1.0 specification.
+
+  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
+  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
+  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
+
+  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
+  provided by the IT6263 in two interfaces: the four I2S input ports or the
+  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
+  is supported at up to 768KHz.
+
+properties:
+  compatible:
+    const: ite,it6263
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: audio master clock
+
+  clock-names:
+    const: mclk
+
+  reset-gpios:
+    maxItems: 1
+
+  ivdd-supply:
+    description: 1.8V digital logic power
+
+  ovdd-supply:
+    description: 3.3V I/O pin power
+
+  txavcc18-supply:
+    description: 1.8V HDMI analog frontend power
+
+  txavcc33-supply:
+    description: 3.3V HDMI analog frontend power
+
+  pvcc1-supply:
+    description: 1.8V HDMI frontend core PLL power
+
+  pvcc2-supply:
+    description: 1.8V HDMI frontend filter PLL power
+
+  avcc-supply:
+    description: 3.3V LVDS frontend power
+
+  anvdd-supply:
+    description: 1.8V LVDS frontend analog power
+
+  apvdd-supply:
+    description: 1.8V LVDS frontend PLL power
+
+  "#sound-dai-cells":
+    const: 0
+
+  ite,i2s-audio-fifo-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates the pin number of an I2S serial data input
+      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
+
+  ite,rl-channel-swap-audio-sources:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    uniqueItems: true
+    items:
+      enum: [0, 1, 2, 3]
+    description:
+      Each array element indicates an audio source whose right channel and left
+      channel are swapped by this converter. For I2S, the element is the pin
+      number of an I2S serial data input line. For S/PDIF, the element is always
+      0.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    oneOf:
+      - properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: the first LVDS input link
+
+          port@1: false
+
+          port@2:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: video port for the HDMI output
+
+          port@3:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: sound input port
+
+        required:
+          - port@0
+          - port@2
+
+      - properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/$defs/port-base
+            unevaluatedProperties: false
+            description: the first LVDS input link
+
+            properties:
+              dual-lvds-odd-pixels:
+                type: boolean
+                description: the first sink port for odd pixels
+
+              dual-lvds-even-pixels:
+                type: boolean
+                description: the first sink port for even pixels
+
+            oneOf:
+              - required: [dual-lvds-odd-pixels]
+              - required: [dual-lvds-even-pixels]
+
+          port@1:
+            $ref: /schemas/graph.yaml#/$defs/port-base
+            unevaluatedProperties: false
+            description: the second LVDS input link
+
+            properties:
+              dual-lvds-even-pixels:
+                type: boolean
+                description: the second sink port for even pixels
+
+              dual-lvds-odd-pixels:
+                type: boolean
+                description: the second sink port for odd pixels
+
+            oneOf:
+              - required: [dual-lvds-even-pixels]
+              - required: [dual-lvds-odd-pixels]
+
+          port@2:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: video port for the HDMI output
+
+          port@3:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: sound input port
+
+        required:
+          - port@0
+          - port@1
+          - port@2
+
+        allOf:
+          - if:
+              properties:
+                port@0:
+                  required:
+                    - dual-lvds-odd-pixels
+            then:
+              properties:
+                port@1:
+                  properties:
+                    dual-lvds-odd-pixels: false
+
+          - if:
+              properties:
+                port@0:
+                  required:
+                    - dual-lvds-even-pixels
+            then:
+              properties:
+                port@1:
+                  properties:
+                    dual-lvds-even-pixels: false
+
+required:
+  - compatible
+  - reg
+  - ivdd-supply
+  - ovdd-supply
+  - txavcc18-supply
+  - txavcc33-supply
+  - pvcc1-supply
+  - pvcc2-supply
+  - avcc-supply
+  - anvdd-supply
+  - apvdd-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    /* single-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    it6263_lvds_link1: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    /* dual-link LVDS input */
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi@4c {
+            compatible = "ite,it6263";
+            reg = <0x4c>;
+            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+            ivdd-supply = <&reg_buck5>;
+            ovdd-supply = <&reg_vext_3v3>;
+            txavcc18-supply = <&reg_buck5>;
+            txavcc33-supply = <&reg_vext_3v3>;
+            pvcc1-supply = <&reg_buck5>;
+            pvcc2-supply = <&reg_buck5>;
+            avcc-supply = <&reg_vext_3v3>;
+            anvdd-supply = <&reg_buck5>;
+            apvdd-supply = <&reg_buck5>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dual-lvds-odd-pixels;
+
+                    it6263_lvds_link1_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch0>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    dual-lvds-even-pixels;
+
+                    it6263_lvds_link2_dual: endpoint {
+                        remote-endpoint = <&ldb_lvds_ch1>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    it6263_out_dual: endpoint {
+                        remote-endpoint = <&hdmi_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

