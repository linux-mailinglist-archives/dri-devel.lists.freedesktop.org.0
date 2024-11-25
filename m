Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5EF9D8252
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7667410E3B4;
	Mon, 25 Nov 2024 09:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dv4xNX87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF3610E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnDaaxRtL3moSlGd0lp9o7lU/CUb46GiKYReFyNKd1isszxniPntpWkglS5KGwDyB8Ucgm/dEHQa3msiEhlY1ZMo9PNaUjUX3wZ0/9LY+ZhtAZoA5wtW12uJzLYNn/m6rYPCQvoc4/d8vojqQ9rD3jkqkuE20jfk+2YJWGxUa7M+tdPUHklyxfzrt8Ro8tkZZFNNgl5UREcIQD6NvwysyFUj9Ab6qqPtGwZQeSG+YaDuAt7nHjRmvn+3A46aNhmJTcaQCSHgLRz8BxWxSyH+hzqtQiDhDQ4EBN+LENfdOk5iwlBZudHKOZ+KqPPoKB6jePjCuTHO6tVwdNU40bLXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=espCUnrHoiLKKN/NVAOKiZE6b9OVjp6fuUrI2Bto1T8=;
 b=IOML6iVsuq8VfvWH3GbiVSWnG7i3udFJtUK8+/ukt6GdGGqq4Wvn1u7poRoOACMj9kfpRYqS26oaCMWCz6in8lFR2mV4IgMJ+TcVyR9Gu4nryw0jE/nqo/xbWy2b9jatUI+hfSmNL3llgw4L6kh56AVbywCQC9ApVgoQKDU0xpgM3eVPXm4AbdOE4DPeCno0wZ9iFmmK2zCQlOGxdVNFiAs6DSiYf9aOzPpqhRGJsjETweHzgnhACYpn6D+ubo9SNZO81XYKDJNXHBe4Gyk5q78mXa04HGLg3FhNn96q1YGYzKrPPO3KBEwwZoC9dNwEIIv5fGuwfkAZrrYoSBy/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=espCUnrHoiLKKN/NVAOKiZE6b9OVjp6fuUrI2Bto1T8=;
 b=dv4xNX877R/Cdvq414KxZkmFJ/HBWZ56utNkcg/K4L+Q0JBq1fQxFPk/W9zDKfhrarZ4cGz+3YcuVtaO1cI3/PtZ+vCccnuawPca42Zu0St1/iMSub03a6Cxkr/8pFVLDLZ/u317jnaS4VCDjLVRMLvwB/tmpkQjnL0DUFm224u9U/561F3znF7W6GbMdLzBr2b0ZAJmr4OgC8B/z6CfF2XHHA2w8qTYlswrJg3JQ8R2utko+/DmzlC+O3JVOt9d8hvFkvBc1l7pNIyhl5/Xz4Yf/gC/Rk5aEvIQ6DVmlKnSumtRE1SmuBrpdQMmwEASuByMG5DuoMDiWFMgDt8QIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:21 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v4 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Date: Mon, 25 Nov 2024 17:32:59 +0800
Message-Id: <20241125093316.2357162-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: 420b2b57-3c88-45a8-33f0-08dd0d3433c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ic6y6wQyBYDymknL52m4NGdrQE2l10276VGXGMTSmWDEyevPBaLg5sv2QA62?=
 =?us-ascii?Q?lzeM4MQrjpJyTMnthzJwZi9rSoAbrgDQ/JFJ9w54CmLFmfI0/CWnprdQjL6f?=
 =?us-ascii?Q?sbLr3UFo9yZ3MrngXCVrgmwZWwQkP1Sv2c/yVqTds1IVruE0F3CuHER6y7d/?=
 =?us-ascii?Q?+dKwe+uzLsFcYYkuwQBxWPnA4aaSfJHUYWs+3hf6k4B+XvXDkLF7iKMsXfPy?=
 =?us-ascii?Q?TVzYses4BmX4WkLCk06yYPEGsyZ2cad/X7IRbJoXLYlUmbLvl5Fo5p1SuREL?=
 =?us-ascii?Q?mTVmGbBWzV1hs8j3aChNphMhegxePznULNmbR7hRPibaEEWH3o/MBsPpClNE?=
 =?us-ascii?Q?nLDTkri6frPr/30pOx9DTmfQ87maJWhHJpOmKYraI/OG38Jmd7qgGvI72ZRG?=
 =?us-ascii?Q?IoV6pgMyS1VI/W80sljv8CanM0bUf+PykAXuKyRXqNSfgdhrmPpRK+6dxk6h?=
 =?us-ascii?Q?ldMZfK5X1oH+C56NdDFLqAhL39GisbuKJUXZAdoYxNoSiGlfRImHbA5PBhh7?=
 =?us-ascii?Q?oytx+buWBUvFd3meE3O4+ZqMenURtwclxyuDFjaT/FY8shAwlVZiTmEMxeuT?=
 =?us-ascii?Q?0N0fTX3xcWMlV+9SL+IeBqItJyKukGxNuUHFZP4byaxGh10gbAK7b0ZRatny?=
 =?us-ascii?Q?K4PgSh+EYhaJGhVZKhOeavakV6UTgqqjJK4ARrPaZUx4FkZIP/ZFwqx8lXmD?=
 =?us-ascii?Q?XXkR2CwVhnDmUEL9H29mO4tHVvIG18VkJzC7ZWFvU7fDJ+K1KgcMheaz8wc0?=
 =?us-ascii?Q?JvIpyhtxLS8xlBQmpae+Q4oDkiVkD+OZsqc8zpIEeUeDKUtjx10WvKe0VwZJ?=
 =?us-ascii?Q?reA/TFsc3iloB2YCZUNBa6h+0oXJa6SJAoQc32+o24pH7Z3JR91opvP1hXU/?=
 =?us-ascii?Q?XLX9JJrGSv7iadpkPtB1XoJ49/FJgmsPeTm2Napo2l5lBWm9Nkd1iivmOJIP?=
 =?us-ascii?Q?/hlInr5UeHK1ux0FAQOh+v7p4BJxEaHu7SIywUQwH0XeyIz69sqE1nxc4Uhj?=
 =?us-ascii?Q?99JREuaO+6V7EYnUwP+jpgHbQ8dBKNsNoGwoMnKnGjZirISmNxDjJhl77pZd?=
 =?us-ascii?Q?mzdAhXCZzegPpgwHm7JXPsJ9LCd8o6d0xxrsJ+GD4jMY2n+Kow5My07zxpI7?=
 =?us-ascii?Q?lO9d5fhEqIMYcAo/x91L8rDed3mUjlUy66InWFrVoWmvjezVY4UrCpihi7U5?=
 =?us-ascii?Q?T+2lRImCGiPCytguhz4f95V0vtLbE5oyAOfg+933oq3Oq15DTU1kZC04eEdu?=
 =?us-ascii?Q?ynuaucFTtmr9VQ73d+c7gXfcPDwOaalgQn6RcWTBx2kDrPGizZwuq4+shflN?=
 =?us-ascii?Q?1O+kO9P65dgvlg3nzr2SEv51XngahVp5X9mWwlZHXNjrzg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZOlsLTVt3HbOeO4iPq0zjIFZsHvIrFq14PGFwmmvgPXdXVYmv74Pnq+39AgN?=
 =?us-ascii?Q?rxyPjbP4W5BiWhwzXRzjuOPvogo+zupbqocxR3DP+nYV4KnLUHEurkz4a/p8?=
 =?us-ascii?Q?A5UWkw5h6tBkuqIDNx440wmw5ixTxTajoVNLu3MriBNahZ1Oyai6A74lLwmi?=
 =?us-ascii?Q?zdjkzBV8Q3tjt2xflOY3gAOjYM8ady7e0PBpk13Vm1xHSy1d7e5jyRgNqYMP?=
 =?us-ascii?Q?cBSRQrOLLYK1E+0GrfBj2XWJXZMF6xSD+ByIak6ETM6ekDKG0WBduoiM2AKL?=
 =?us-ascii?Q?r2wqsEt2zE5fsc59ikMoqo3FRl7LFhCapBqxw8F0DQ+i7bCKJqw9ZKNPEkcu?=
 =?us-ascii?Q?VsXl3u8a1VNw2wnHhO2rS8XV/EhIY+R3ldZQZ11sUEs4b4YezfPHU+Pbe235?=
 =?us-ascii?Q?BJR1Rj96Ryeyf+F7/1Qw+F3hl2HsamOlkZAOQx3yXeWYKOFkYP8uGS0Z2Kcn?=
 =?us-ascii?Q?MIRUlwr/WgFTzh6c8VbGhSr+tDwmaNhZUV3LVtCKqFmI6zc6iQS9APcDQ/PF?=
 =?us-ascii?Q?sSFwUti+P1yF2zumow9gODfz3SDHr4avG05TJAJprpYhKJ31uU/vsKt/i474?=
 =?us-ascii?Q?ZaVb+BWdREvwTzaESppgNr+8b6DKkW3UM0/FUiQzMozQtXPV7ZXrXD3oRxJb?=
 =?us-ascii?Q?UgMoY0tyY+V+meCfwZLG5Dyu7/nIzK4ckx98cTuHlTEZHtjx2P/acGSValQp?=
 =?us-ascii?Q?SU5tnLgYVzvKvruzmKdHGlYqaA284bOLHR/euJIhKNB2dUN0RkGTv3MKrwlr?=
 =?us-ascii?Q?hj1MBBieN81pON+5T7YsDRJ9DGgW9pYIKafwGoPNWgr2OvgrG347hBHkeHPe?=
 =?us-ascii?Q?/ri2ZgudL/HGEC77xwUicEBTrOg7mkaagywnf/XzdvX+tqDxSRIDwStwq8bF?=
 =?us-ascii?Q?aBa7iA5uYIiTMLMslsUOu2uPkrQN7f2ysKI61BkvcWxLCG0aQpYLOl702NlM?=
 =?us-ascii?Q?EM3H4napsL68YAEcqNTno2C+QJYmo39Ab+iNDnpfjOE3Ejgg1tK6JCJWv+iK?=
 =?us-ascii?Q?WjxefIqozhtivwXTuKGw53nygOg6cHGq32sJb7sYIKPvM8MUrZmrtIL7ROeC?=
 =?us-ascii?Q?iidVLf2Kyblem8/W9Ie3jAD7Vp0Tla3T5MoDo8EbPi6vsZ5S1fikj3xXaCCX?=
 =?us-ascii?Q?pKjQGh3Aa8C2s6YwtrMiTWowRBhXG0AqedW77MtseaOvPXc6M5I3QTS8FyhK?=
 =?us-ascii?Q?bOq7YBjICDqTUdwiqywF4sHkZyxyn6GIG7FTs5WeG683rF5tye6AKEmWfmBy?=
 =?us-ascii?Q?F52T/FPEWh3cV1QwN5p7VZimvG/jz+0pHGZXmjCHH/EwWgTEDDzIiX1YVcNr?=
 =?us-ascii?Q?hfe8m/EmooutLeGB+OOCeFlnbl7dOCk95JK4b3N2rkbVG37rFYBE/mDANqMJ?=
 =?us-ascii?Q?C4YKmDWGEHdA9aIeXkxk8AJIgzCpB2n4h3BFj6e9VZ1TJFcecma/Hx90f0+H?=
 =?us-ascii?Q?828b8WvXRrzOhK5nNiHEP4WmltmmlsTcQgGIP0Px1IqyYnqTGPiwwVb/rNdm?=
 =?us-ascii?Q?3+maVkZNnk9sevsnlxay3s+HusYT5NyiXeyf81eys8IK0LPZqjVWZbofNRap?=
 =?us-ascii?Q?gzuIpept4o6mO7DXdhHAaPQBhtFq2YUjskKqE0fh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420b2b57-3c88-45a8-33f0-08dd0d3433c0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:21.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68t7NC4cUciKz15rfs2PS6ELIpY22HmpSWAzyUMnq4bX4/zJEcNVCyhGt3Iz+o4mhPp9n7VmiikkI0OnAF5UvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* Collect Rob's R-b tag.

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 ++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
new file mode 100644
index 000000000000..45db6da39e20
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
+        const: fsl,imx8qxp-dc-blitblend
+
+  "^clut@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-clut
+
+  "^fetchdecode@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchdecode
+
+  "^fetcheco@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetcheco
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^filter@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-filter
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^rop@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-rop
+
+  "^store@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-store
+
+  "^vscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-vscaler
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
+            compatible = "fsl,imx8qxp-dc-fetchdecode";
+            reg = <0x56180820 0x10>, <0x56181000 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        store@56180940 {
+            compatible = "fsl,imx8qxp-dc-store";
+            reg = <0x56180940 0x1c>, <0x56184000 0x5c>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <0>, <1>, <2>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+    };
-- 
2.34.1

