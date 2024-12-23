Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C409FAA85
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A6610E329;
	Mon, 23 Dec 2024 06:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="GyNxpJpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474CD10E314
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMxNa2MTmlvDmQLsp8oHOmWRPWqi2cEJctRA0igK1rbyGDC322KTAgSaDad7c95TiOxTAbelDvBtHnSbT1dzB4i6bkQrp+++PYjqip8+NFB9wzQNUA6YNxFhMmj+au/w9Qeck23g/Ha+JtgtDPxi6ZFca8Ya/YlF/kcOz7aLNx/pmvqX+6aEEpMLA9YAr2YjPamR2mw3FeNrrzeBCtLNw9oOyBjseyvppfRf3HbD43NglQhb6YO9qipFRwJdDpxbhaNVVuDZOxFCZkG3aGiqLo0oS1jFVn6iXVK5eBLw6f9/u+hW8mg+C/j/pVUCgXoRhPuenjwqk+BOvEmi/XqELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncpJMUuagEW6GbW6rNX9QgfZojcMMWRKlmdjSnVwn5w=;
 b=rA/J+3j3wsXGxgMJPCI/Oagdqq+PdTfac0OJEvlrp33D1kEB/qWYvy/vCKGNR6D7LIScG9a/v5sxpAi8dOnPPlbISFGhFmtQp654lB8yWHrO2VLJUgpdMQfTnN2ivXCB/OH27fTB/2B3QC3Dt09L/ax82+kuV6CqsNG3J16EiY0py5OPiuYPhVUB81RbZH76rsk86lMqsHJ+n34JtovuDUE3cp3ffAWcf1Xf+cZp1gAKCj33hUmblBSR16+GGwi85H0Hrc9jZrYBUf8igGxGKJRGm4tNS2rEyZlNw52MhzWip342CP3l8JxVsF+NHL443kAOz3N1ArRfVJMksHkaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncpJMUuagEW6GbW6rNX9QgfZojcMMWRKlmdjSnVwn5w=;
 b=GyNxpJpxjgPZ20o+kBEi1mhgT4rgPFV0claU4INwRjjdXzgh4Hxv+2T8y8RPrmyhbKeZR43mJdKwynY9taOMKFEEnAN+o5n0vqTQ7zgkmrvyZBr7VYdogyCMjLGrUInI4nNDiGSHDZTN55iJqjjfoFT7VLuM7PRhmyL2YpgtRTjYsyy3fDLcfH5VUBAcAlZl83j1/pwQ/GwpX7gGs1NyqzZVFBbfpyrysA/w3cqa7qKpHUKlud+h8M6xMVlGRsKsuIkyDKRXynukqSuc+TpkluBCODlJtepQK6OeNE5uBy7i8eFiN15K6zYQji5d+506iHYVQ6ZUI42hsr88YYrt/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 06:42:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:42:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [PATCH v7 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Date: Mon, 23 Dec 2024 14:41:30 +0800
Message-Id: <20241223064147.3961652-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: 586c5ca3-7763-475c-b03c-08dd231ce797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cMnHqQatQ4H4di4F33zY1T7pmxuCDhSOP+mb5fGAkMvVb65diDBkatj9aT5k?=
 =?us-ascii?Q?N7qX2EClL1TkDTJ8J2YJRJff+pmtK2dQCDdoC4396lFd/N7DQr1XGTC2lzrv?=
 =?us-ascii?Q?ae+O3fUkXxR4ch7byb57eIytb6iDJtcppSCcNxpx30Xf3nFPCtRmXIFNxaL+?=
 =?us-ascii?Q?Dpno9FIAqNarJgjiKsXipBv8x5YLGl1a9LTNvLcSnCQIghCToEPkiMPcpOi4?=
 =?us-ascii?Q?gw37amLbuPuLD1AOfCv8dMHqbGCKVoJbCgN3qC4q6jmLTBoYLCJp34tapo6C?=
 =?us-ascii?Q?ZxxPsmvG1PrLraqsim6/J2IjG1/+GgPLF3Lsh/giIc//+qOSvqG3uoxN33LZ?=
 =?us-ascii?Q?T1cyUFe6gJZ90z2BcvXumC7nWFUWFMKSpizerHAZvKTJlU8YHJdvCV30dJRf?=
 =?us-ascii?Q?XAlHYlMaytF9f4rkuKr53FLB5NDU15pOrFXokpJ9fDWRr4l7efSgKVri3fIs?=
 =?us-ascii?Q?ixcQM/YSb8wbUVDs0SbSePeMTqxXXA4IfPrCk9PoXCyTyr7JuB8zZynHkejj?=
 =?us-ascii?Q?6Xmfd2yFbklERdFf227ZZ/yJKZ0OpAmomKBS62Sgo/ziOcZi8GaPU9mVSHQf?=
 =?us-ascii?Q?mTabp7aJVis4mnMj36o3EDpT+XROM+xdSOCS1c3vXR6IMQp9Tj11llNYeV34?=
 =?us-ascii?Q?/U6D0k8wxmFMKw3HyPj4TluUj52RDsgaMPyCz5DYBaVIFC100YYszvHkPDTw?=
 =?us-ascii?Q?SHSEyzYCAyTNCVeo+VNwD42pwlzD5NWMTpusbjINppIMUJnYUBKPbMYiwxcT?=
 =?us-ascii?Q?O2WNHiVkXGqxHAMnPMheQ7mTJtcFD59VcQOVzSHx9AIP8b1GCH2T8d9zirm9?=
 =?us-ascii?Q?kLrowk3Pz+UtuT6G95w8/TV2pTi0bVzNlaJPLkVaIwFPkj1j2bhuc0/rSFVU?=
 =?us-ascii?Q?2S98RMV2oeFYErW/z9Cwcn+i5AK7AwxOd+AiNP/ysZ6g1u4RLNoJ0pdT5LtC?=
 =?us-ascii?Q?WABsPHIHFMxy7xKOch5Q062KoqxrsvmoiGAVUP6mHkH+HNGiTJIk8YmADINh?=
 =?us-ascii?Q?yleN7vyPsPxW0BND0SXcKPZ3CVP6Dkf6grfIcOwjttZwHyo5/PF6FQH5sfOz?=
 =?us-ascii?Q?sPXBuINTXq5uEoUOfaUkF4LuhkZmraYoMzxTceV2E+foZJYyvlLaZ4tX+Ltb?=
 =?us-ascii?Q?EAfIAHTcHywn97p1ximYyHSuWlLttG56AAHJ2Xu8BRCvG1zNgQ+YeOh0tMib?=
 =?us-ascii?Q?QeXIeZfrPqDm/0Isy+a2f3IGuIF7T9DXXQNgUpNyXqGcCvUvxkTTRt2HFrMa?=
 =?us-ascii?Q?VXtoSbzkpthP+bOelI9s1RU4p9PxNw7QueBT/jaoHRjDw4hnuKQKRaiBdN1J?=
 =?us-ascii?Q?EDulNtNsKhBuRs4GUqLizKB+UivMu94LaOKDkK3OS3wi1vKq34gd5NzO4Uvh?=
 =?us-ascii?Q?+zJO6XhJaTIkFJmg1XvtnARgoLkI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcodH2Fiu4k4mj+IQXD7w5yLY0OhYcByo08GmgSuPlPDnfU54qfBoPnXMhTx?=
 =?us-ascii?Q?wsMEGAhr++Hz7VJpfICMQ5P79nH4UhUjWRCZHuyFgspTVur/XcDbmSnlAUxW?=
 =?us-ascii?Q?Or8YH2N67gu5fcmILUXuNCjDU99IxBCAsGa5hIVZrIfj/ajt5292SGfmrDGX?=
 =?us-ascii?Q?qVazKvDKXjIZ1g4GEUCwIlOPjLGj/8DQLf31HN2UqUh5SdPBsmy1pVzAnLiQ?=
 =?us-ascii?Q?roI3BYZLBCZyB79pGadgOBq1r8q5O0s9aYaVBqq0vZroBNAmkotRRRUQwm/n?=
 =?us-ascii?Q?hwouWjwkFL2zYEvBkjqKcbOgZhvR0wJ1Ahk1TWSAjGKQpSnExHogNsQd1btW?=
 =?us-ascii?Q?oHE/KEOjI5dy0j8OrTDNHYDsrdA5p/p8BHGG01MPBAtHOe1rrt5NIDTolXnF?=
 =?us-ascii?Q?PSpGrPqlr2C7etpSdXRjV9Wvp2yB34r4Kt1VLXNXXDCXXIHwb7LQ+sEwrKDQ?=
 =?us-ascii?Q?fM8C+ime3xkfzXiPytced/neSBNS8fyLp9MNlADV0Ew9lYv068NbzIdT3/nh?=
 =?us-ascii?Q?leVYNuGGv6YK4AIflQe3yZB3v3aSZwksBWwPZgv4ZCGJPgkIbKiA52crJ2Ca?=
 =?us-ascii?Q?BRTUYclINepMJwgQCExSEvj2+tRLATYHzUYiz9CLXpFpJeJFoGKU1hHtVUMR?=
 =?us-ascii?Q?nOaxQKnU2qRB/vgT3CJFmAMTns6oxJCw9U3o21R0nG97swDyRj8lfZsbuZVW?=
 =?us-ascii?Q?z8QJe+dmZ6K15hE0uBrAhKlicDieq7ifQcTGgzoVj7PPbF+E3aBKX7GpTclk?=
 =?us-ascii?Q?d1f0vVbQoDO/bWST9kxGdL9O1d8hFnAxpliq6NCPYhwoZJE9G0Lra0puDwDX?=
 =?us-ascii?Q?uOlZDppGBlHILNZXkKetcHX9PPHxtP+2AClcD8GlIWAIvsEGCQ5EZwCn2tqO?=
 =?us-ascii?Q?nSBu6cmuY96QfEqFi4KHrAKl8U4EcbP9HfLlf2Cv3OJ7W7t0S/QnsKqoTfhR?=
 =?us-ascii?Q?1Vi2TCAhBeP1yhVrgWaCkn7BsR1h3YNRXKewvj0m8xycNsFziaMkdR/9N5g6?=
 =?us-ascii?Q?8TkpzirBeIDQXdpEsFZGwDn1UUfSO0GXEQR3iBgHENN+pExbYRTTXIfOfis4?=
 =?us-ascii?Q?6DM9gT9dnoW0gVvCUcvdKqoobUtisoShM5us5dzxZLqhTO+dBPU+uUSvvw9i?=
 =?us-ascii?Q?gJHfnwkqBG+UrZ8JFrg3K+hUc2h+8fqm/f2E79WviieZXzBNkMzrC4KJzIAD?=
 =?us-ascii?Q?Wi8ICPrribXiEMKUOFEq6ivoC8bdEyLpH1nsnTcu3/ZYmircCIpOzQo+icDz?=
 =?us-ascii?Q?nUYYwr8yTGV0oaodCamcJiszEMhPvEORR5UMlnHGkYa3CbYNOkYA84pOwBdX?=
 =?us-ascii?Q?LQ3lOs8d8gag2TNyM7TkbyT4WZFhZKbRNu8JDgQb0T4L+M8u0DXHp+zdUGzC?=
 =?us-ascii?Q?KcmGdza7wY8WVCl7PAL0tJEeOC3LUD29PWLkSK2xSIQ3ZmdbOjxaOUufF179?=
 =?us-ascii?Q?3ciBTrnGBXBuQUlq7XyO9V+JbYJkE5aD3eINIn7hnFSVxDDRky3qvE+iERGK?=
 =?us-ascii?Q?bSK0ihwPwuFz6pK7vBGx2KmtKkBj4iyCu3Ov/rdcTQ9AUn5osiXO9WSQ23xa?=
 =?us-ascii?Q?qIGKr2uGW/JLkLzuqBOY+bMr/HVlM7CvECJcH4Bl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586c5ca3-7763-475c-b03c-08dd231ce797
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:42:01.0148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZgQkDfplJzrlfNwX3rM+AjmG+cUbkm1MwCxN8p4s2Y+xks/+1Ifh4dDwHPvfhTUXUfEGQK+s1X69eFsXmncgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986
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

i.MX8qxp Display Controller contains a blit engine for raster graphics.
It may read up to 3 source images from memory and computes one destination
image from it, which is written back to memory.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* Add instance numbers to blit engine internel devices' compatible strings.
  (Rob)
* Drop some Rob's R-b tag.

v6:
* No change.

v5:
* No change.

v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 ++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
new file mode 100644
index 000000000000..6c14ce653619
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blit-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Blit Engine
+
+description: |
+  A blit operation (block based image transfer) reads up to 3 source images
+  from memory and computes one destination image from it, which is written
+  back to memory. The following basic operations are supported:
+
+  * Buffer Fill
+    Fills a buffer with constant color
+
+  * Buffer Copy
+    Copies one source to a destination buffer.
+
+  * Image Blend
+    Combines two source images by a blending equation and writes result to
+    destination (which can be one of the sources).
+
+  * Image Rop2/3
+    Combines up to three source images by a logical equation (raster operation)
+    and writes result to destination (which can be one of the sources).
+
+  * Image Flip
+    Mirrors the source image in horizontal and/or vertical direction.
+
+  * Format Convert
+    Convert between the supported color and buffer formats.
+
+  * Color Transform
+    Modify colors by linear or non-linear transformations.
+
+  * Image Scale
+    Changes size of the source image.
+
+  * Image Rotate
+    Rotates the source image by any angle.
+
+  * Image Filter
+    Performs an FIR filter operation on the source image.
+
+  * Image Warp
+    Performs a re-sampling of the source image with any pattern. The sample
+    point positions are read from a compressed coordinate buffer.
+
+  * Buffer Pack
+    Writes an image with color components stored in up to three different
+    buffers (planar formats) into a single buffer (packed format).
+
+  * Chroma Resample
+    Converts between different YUV formats that differ in chroma sampling rate
+    (4:4:4, 4:2:2, 4:2:0).
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-blit-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^blitblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blitblend9
+
+  "^clut@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-clut9
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode9
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco9
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp9
+
+  "^filter@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-filter9
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler9
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix9
+
+  "^rop@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-rop9
+
+  "^store@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-store9
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler9
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    blit-engine@56180820 {
+        compatible = "fsl,imx8qxp-dc-blit-engine";
+        reg = <0x56180820 0x13c>, <0x56181000 0x3400>;
+        reg-names = "pec", "cfg";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        fetchdecode@56180820 {
+            compatible = "fsl,imx8qxp-dc-fetchdecode9";
+            reg = <0x56180820 0x10>, <0x56181000 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        store@56180940 {
+            compatible = "fsl,imx8qxp-dc-store9";
+            reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <0>, <1>, <2>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+    };
-- 
2.34.1

