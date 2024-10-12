Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265F399B1A7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA8E10E302;
	Sat, 12 Oct 2024 07:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="c/ocL+Cn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2089.outbound.protection.outlook.com [40.107.103.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9169410E301
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NO3OXT8jPSCNZKqKrhuR1ZJz77fkqlOYSI4nBw+vGWeei5MQtRmrjSAYZr34np3NGTEYR89RSDv773GCB5NV9YowUvQ/RBXwym7cWQHW12sD0Iohz0JEIuraa9lsDvhYVIAvMmjeSio1ucTukWviX5k34vFzq5hkYZUNCnWxIg5zg/Y4D9ZeWcmuT/yEGqmRWQ104m7MsAPzA0MpXij5wSkak5sE6gt2n4C+w/VXj4GX1s0v5piqV9ZlvU+nknxpt7alOc3qD96rvqFUjFiQdb+EWG5xqzvGn0WuzQKBbQuNEZ3N8EG/8CwEy3MIXiGfoX00DMg8CxI4L9qLjf82gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqmQl9n3MEBRz7/bWlLrxMgcGmirVscKRM6+IgsxO/0=;
 b=csF+wMKkCxkyaL/WeayXS2llRLk3WCnmIqDKigOpbLjj0UufxgH2d4ca8zWCyh1ZNyunXV2dDOaIQZsizYBbkftMS9wws9L/Y+0fsVTyLrxn03h99DW8+1FBgp4AKFMAKhAoX89vGQbJIRnM5pL8uU8p92Fh0MjxwmaiIRgWi6cSmMIgWw2/nQYPLHgMDWgMh2CEbdDjDEphEtQECB1BzebGZnj1RvY/BUyzyDE9/wY/kyLgZh/jzsTluzGnRrdMVmgDxpg1Qg9rZjusrvToRexe7FkrDTaeemMAEzBGwalVXWCW6d5mpqErC+dKnxdDcBrBK3BN/ZVyE6oLWg49cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqmQl9n3MEBRz7/bWlLrxMgcGmirVscKRM6+IgsxO/0=;
 b=c/ocL+Cn3zVS+4VUdNWWZIObvpJmDk4yG1AZR8Np0yYmviPRqYxNeQR+GeF3ATctDI3RVRDjcNQBY3ZcwxZz+EsZ0maJXvIFxbVTcgeVvId06MVSef9/cLFxHpXjuUb3KLMKHyOrTiIjRAtxE1wYD8BVcsNcEIxT2XjCaxuZ7ZoOs2Dzo5rTFMOdOPwpXphnwGs90Itn1yCGLEKcgSMcuqXc+yLLu6p9U47skHFlAZPFhe/aQ+2ZMC3OcxdWJcQpoopMxzideZ7WbmUUrW1uJFzTyISI6OKl3G749xiNcXuopmyK7E3/dksSewE/xyu1LwCqB2daaJOgSULTkysMIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:29 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
Date: Sat, 12 Oct 2024 15:35:39 +0800
Message-Id: <20241012073543.1388069-6-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f421681-2de6-46ec-cbb7-08dcea90b980
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O4Lo4bgOHPz6/yPAyZYIn5x1oZ8yZvQi2Sv3tVjcKAQGgSGmdblar4GC2yvX?=
 =?us-ascii?Q?piy1x/Md+CrSYjNfmkxIUJJNjEczDaKhT1LWthGlG0R10wFVWNSKKrYdn1R5?=
 =?us-ascii?Q?h9Oeiwg04Da/cJyTw//A8JhopSJSaxYXlFcCVYr9UNxxKGpehiBeqkLn45/f?=
 =?us-ascii?Q?fNGXhHYUhKrZIRjWec+vYBMtAhEM4FvNwszecKNFzDD4zrW4JWfjzbg60FNU?=
 =?us-ascii?Q?CBq0Q/yGRtd5RWpxdOLFET3OdNjFaQbFsbrgYOrHQ8JDRhR1SMVSWC2bYLBS?=
 =?us-ascii?Q?jrEgj1Uat7p2v1W3gKiB/MTmRS/8MnWzHPR6xZ4jKdd8hghmod7V8eIGSXjA?=
 =?us-ascii?Q?SSh9X0QdCqLM0w6h+CARnFCRt1jVAUao5sFuwWHyVjhdql250GMpEkuH+DFS?=
 =?us-ascii?Q?R94n7YAyZcD5jEvrcAV7vUcRsWxA2elhRu4KZb+X4eOVlomI9vY5seflC7hJ?=
 =?us-ascii?Q?c9/N61jzm0drdsUqN5H4Behs0XYgwEOf+ua+4Go9yhQ6y2QkEfGJtxluye1W?=
 =?us-ascii?Q?jweEpQKm05tpCexTbBuNp0THnBxZcd8Ig+p8UWbux/yzfBR+uVPdB1gf+0sN?=
 =?us-ascii?Q?sUqQSSS4ogZD+rt5/Q3G+jFTAHdcuteJnnYZBTjjjAFkQWaUkjXcdMmYO1yz?=
 =?us-ascii?Q?UFvsLBN0m+8FAr2/AW7sLYGo/7XC4Eb7G+KoxEpVav2bez9CG+KApA6Y60T9?=
 =?us-ascii?Q?HrZKwuFKVCWyQaGH5GVkrlmToDnU9bk/RIeM8n6PMZ2VBVYqQr8Xn83UjO4R?=
 =?us-ascii?Q?dmWlWMYPSLiukO/Ql1mO/BF/9wSI+RiO6wpeV1YKc84NELhyyKkdiw2IeRNa?=
 =?us-ascii?Q?nGxJkQBFjgtHD24S60re93nwE36qAEGhfS0HbhE4Bww2wSiRkmsfV2o/5ew0?=
 =?us-ascii?Q?NA2a080LKWcsrNALNNSII89AefOboSyPiZSPPYJeKjreK/HY3a6AnyDIwTfv?=
 =?us-ascii?Q?EJFyEpcYDSANloCFB7Q2mJOdIfpKuFo+9a6eaq/CBjp1D9HW0PSsfyL9Rqht?=
 =?us-ascii?Q?oz7B6BIPAMjrgF52Bb0vz4mDmxN0HrQPNagFrKIQGNCZWofVFv4Z2PuCgBMa?=
 =?us-ascii?Q?nCdRR0c9YsnL0Ss6GUmlIiECPrcr1T4LhOS2e8Q2BUGHYyiM4FSpV9UcUHOz?=
 =?us-ascii?Q?tf1P88tFytowcz6aNn3EqqXA+wjJcnqQrD3xCpqQoR+LPpHbRLT2F59H/1/S?=
 =?us-ascii?Q?37+IMxnquycLUcdHAqyv9QWz/fXqpzYvn6SdiPzzEs98ijalbRm1Gy7aXkOw?=
 =?us-ascii?Q?0J8QJBpyP38iJu7oWnp90Gc1EI9YD4PquGJvmnTuDQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OPq5ra3XxUFTOhLZdYKc5EzmAndGgTq5rZq0yoKshg8U7mrSBxeDGSzhqiSo?=
 =?us-ascii?Q?0vghuPTseTRLh0wFnWZv4owuA02vnJ5hiuwpqjdyOxVdWQIdMCVHhWqhy7Kt?=
 =?us-ascii?Q?UWVuOaIW9RUySBhH37P6PS33KrlnOlKIttTkyXXo2tZ+oO0DrLfJTqR+2DMb?=
 =?us-ascii?Q?t2ShGmSPYxm5Qs6UMx/kkEr3nHNXtIDVNgzhB/0z6xCdxe0peOqm7xPkQAuO?=
 =?us-ascii?Q?0S5KH2r1RNYrp5znApYPsXzMoIjdcJ+y/biY/I2tTEsbV2e/Kq4rDsa4IV06?=
 =?us-ascii?Q?Gh6p8MMKz1xTm0uTBEVALg0y6FgngvObDFYlSIkZYAYPakamz6xHwxQBbarG?=
 =?us-ascii?Q?km3s2BBzKDhCSmxIRG9nGvbGJBXbRxB99zO7f/SAJ9wWlHIIujEjOmnJeOUZ?=
 =?us-ascii?Q?2b4RXDGBNY1jAPd5juPYGUWXTwW+fTYRoc1KDUUExLA0WkfgSZ8VlKFn4HAm?=
 =?us-ascii?Q?YflV/tnNyzxlBTvehHEIUMRa7dpi0+xyXhwnjPz7ViPwZzZJ2qt7gbo98dq0?=
 =?us-ascii?Q?M2AdVFp3XYjYcljmokmSHACaYl9B6OMiUfLKI+S2vNoCbqCt1NaFVNe61xDz?=
 =?us-ascii?Q?HbpWSunJ1TXkK1HNh0v6uOYmihi41tJt7uZ0uiIdK0JLzmRXouRItAzd4fhf?=
 =?us-ascii?Q?hoRsbXwvVTH6qmhRJfNflxp66njtBGS45GM3W1fmB4741qM0Fs+yA5UebXKq?=
 =?us-ascii?Q?6HLn2uR1GC0/5PVWiqUgAIU+3uw1/W/aKNI86v0uY/nlg7KifBmNQcxxHl1k?=
 =?us-ascii?Q?c9Y/tYNueNJADCNppki3Jd0AmKkJSMElYX2z8EKu0Cke1rpVwDn6S2iHTT89?=
 =?us-ascii?Q?8e5DFp7D8L/8BGMKAfnlV02YgooruPRMzIdYO5KkGw5BlQLtdCrmPE7sLp5r?=
 =?us-ascii?Q?ByH3iGlqtW7AmsGuYMGy/tJMvAoMGAw+x3UHucCIVug9hacdPYXtrx9qK7eF?=
 =?us-ascii?Q?sgAD188VyGJBWZSXwy+fXbDeBIrTheYo0FXqINLx02OzPEec5c2ebu5THmDW?=
 =?us-ascii?Q?4vJ36d0iw0bAfv23pDUl6pM5BX1KpkYYtchZDqv0fPwoXnHqo3gOjXFnN/P+?=
 =?us-ascii?Q?VTy1iNF5O02ZGOFb5ZoU30ewhqSITcKLreIKbZ0Y8MVeVBMU46Vhoqs2D321?=
 =?us-ascii?Q?mKUfIL5+KbVqvm9lP87kBi3l/t/3Ne/zrh/XcfRUK2IKIPUenoJE8KcNywEW?=
 =?us-ascii?Q?RYYmDha5IirakjUwlCvYIRXS3k83cggHgtNLO78ZQGU4LMn4rSGwdHiX5hQz?=
 =?us-ascii?Q?sHzsgJIdpEVfHbsFmJi5pMs5wqK6X5bKQsYCbzDNHLVrI22zDnREfD6R3nNn?=
 =?us-ascii?Q?D7BjIwu50ewYj8krm53Nowb3yNrNw1R/AbyrAa5lGWAQzlcJFidhGIBIZqh3?=
 =?us-ascii?Q?EfVoIrQmNrhm2so0lUTrAhEcaVgVt1B7CQ1iNZmBJ23OydAliy197O1pnhGG?=
 =?us-ascii?Q?X7Px30Xh2WwzRQ3McRm8SNnhkzmFRUvvYSKdsdy0YDzJPgLXfhOh215rGMzC?=
 =?us-ascii?Q?CSeUzKS6GPpkFjebqhltHDPmQf9Je7RQWiTvvyioOT7BQNmNTvfWSoOO/wrs?=
 =?us-ascii?Q?bMZRxLL/4r1Z9SubBW4COr/ilL5zZkLTyazIWxoY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f421681-2de6-46ec-cbb7-08dcea90b980
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:28.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4+oIGH/A7pAZsmI0NDM5Rv3F9I3jUk6cKYYoJ32TjcR5SgmpKtdSDllKBEjdcfJO/7AdnCEGwMU6F4Vqc7OCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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
v2:
* Document number of LVDS link data lanes.  (Biju)
* Simplify ports property by dropping "oneOf".  (Rob)

 .../bindings/display/bridge/ite,it6263.yaml   | 276 ++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
new file mode 100644
index 000000000000..bc2bbec07623
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
@@ -0,0 +1,276 @@
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
+  ite,lvds-link-num-data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [3, 4, 5]
+    description: number of data lanes per LVDS link
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
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          The first LVDS input link.
+          In dual-link LVDS mode, this link works together with the second LVDS
+          input link, and one link receives odd pixels while the other receives
+          even pixels. Specify the pixels with one of the dual-lvds-odd-pixels
+          and dual-lvds-even-pixels properties when and only when dual-link LVDS
+          mode is used.
+
+        properties:
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the first sink port for odd pixels
+
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the first sink port for even pixels
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: the second LVDS input link
+
+        properties:
+          dual-lvds-even-pixels:
+            type: boolean
+            description: the second sink port for even pixels
+
+          dual-lvds-odd-pixels:
+            type: boolean
+            description: the second sink port for odd pixels
+
+        oneOf:
+          - required: [dual-lvds-even-pixels]
+          - required: [dual-lvds-odd-pixels]
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: video port for the HDMI output
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: sound input port
+
+    required:
+      - port@0
+      - port@2
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
+  - ite,lvds-link-num-data-lanes
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
+            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
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
+            ite,lvds-link-num-data-lanes = /bits/ 8 <4>;
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

