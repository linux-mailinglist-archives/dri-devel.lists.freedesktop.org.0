Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000DE93AECB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB75710E621;
	Wed, 24 Jul 2024 09:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="OX2vouLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338310E617
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2qEKDNNDL3lt9a/O9WXW5PB92BhujQBLIx1G1zRoJuweIDroBxFEIdEXdMmC1pEGnu+xgn0hJ/x3M8WqiyBb9AoEMtaqgHScaHcTc2C4y8wUdqzrhuOnd6h4++BpxpIgU2+TzI5ZH6EvK0h62xS4oTn4RTcGmARvHC+u3MtmCE0ksMnddjrSWX7m1NIwRkCorJAPiWB5HQ3V+2o2Ju7tO22vshA0VVlu2WKCNr93CnAQSbJe/+MlGuhUTrGGEBLTVtwApEskik5orhEzxk6Uk6Qu222pVwI4eA6m2q44nE5PyqdEwWrjXWKTcDPyR6YiC40mjsK0akarr+H6nNBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoIk490rb6d3ctxZmL2CTX23KKQGKq01L7B8sQF628A=;
 b=YW7Z9Bxc2u9jfqHh0tbcclxkPEv8n2TxwcsRQSdpO019eQZbhJnD9zHniM3GPwyX44ph4X/AfL9o4h6lnwbX1rzCEJfR1pz0xjVOjg2EAfM8ydXpo0NnHhO5VcCz5k9Nkit73R26TnPz5YF8LQumppb+sdYCBimxgJXQLq3EdD/ynjPYYRlphtR6ZMRiYLkVii9Edxror1cdKjP32MSPYRZ8q/O8+dcLF7jFtiSHra/hzhneBsspwZbBXXpB8RSJYDDTLhSLr2onP1beZe1AiQkxVnydV96cpNqGy4QI+OnL2X1YCfw8nu11R9YnfFqFaNLDxdUc35C0Q/7Nn69Hfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoIk490rb6d3ctxZmL2CTX23KKQGKq01L7B8sQF628A=;
 b=OX2vouLmmBxbqj2XdeHn8AY88XSuPF9o3SWWgmOc66RPkQP0dXB0RAkt5bMaP5S/9VnSW1uN04SGntQwgY7m6LZADanNGRcpYV919OaZdbS7edXiYdbBR1UAX+l1Mbp2xuPRxzZGM8i75sJ1Zc4sv6UHfCOG2gv3fmCC4zgUKj0rkZd+5Q4QGC+8jstKPtfJz+Hy01Rv6W3lnV+cmWFdi5uzb7ohp2hvY2c2gHXx/ryO/X+InpPTOSrnMNBiDZCB0Tz/1kV1Rk73Wl9Uee0xWeaKmJ/mhalzrQIhgxgWviS7C4CzgNg2I1KIjMlZI6hKWM1686HIxEJZXA2xCR/rhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:21:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:15 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [PATCH v3 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Date: Wed, 24 Jul 2024 17:29:33 +0800
Message-Id: <20240724092950.752536-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: df7f2d28-ca8b-4c5c-5af6-08dcabc1f76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdD5mu0iAU7iSBTYtn9T451KCUa5oawKupLhMFc+l6g39CfScdtJSoyrjQSI?=
 =?us-ascii?Q?UgIN1+QEqiwXInXSjOR+jS5gxkvGDB6TyHhBUvhzSCq82mZRtkNg67ZOIBo0?=
 =?us-ascii?Q?j5Ca50BAekTSpxU3nXG1I++HgFNl6V6HS+OmZDhgP75YllY9hXfdSqBPauwA?=
 =?us-ascii?Q?nEs25ftDd9scUPIvUgBpkDvp3EnjApvpOZahHHkZ4CJe5epogcqEsEd56NLc?=
 =?us-ascii?Q?IQJEu6mW3Jl1UD2KIwVYX1QY1WsbVi10UP77YHXfReGalqLE6leS76v0R8wF?=
 =?us-ascii?Q?AiYY165IuAOXrw+49uPOrNuSRLExsIBDF8hXN/Cl3EDZ8u1tOqAnrnQqK1aV?=
 =?us-ascii?Q?MX8vftOw/BM74j6Dih3HVKfgEBeC2RuoSHaHjUWNgRSC0/z1sOzqUYb0vBIK?=
 =?us-ascii?Q?lB95CsYoFT2ATmPEyAZQLfgLhwXo8LerXPZbV2IdMKLuWziux6OSgBo/y5wa?=
 =?us-ascii?Q?zv3eApqN1/O01FXjOA6AAYoTMLVolgUMLCvpPcWK50tKE8XHkkxtjyBfFxU6?=
 =?us-ascii?Q?yKrthhVx+lFUc5A7E0OoaxDRtwds10kb0U+FsKb1lhcX+OXZX1ivVtkq1QB9?=
 =?us-ascii?Q?XtSPGSG1l3YADzrMoSMhWAshbtFRJwfjdjm0dAIwwx32s5pbZkg6WBzviZqO?=
 =?us-ascii?Q?aBmG50WgfNn1/eqDDVAxoGuR0TrpsGQSPnyw05xlzRm/z+3tFNuMPg0E5WAW?=
 =?us-ascii?Q?jHbvsixf+t9uYx1QrRIUrn73GhjBsdNZAOP6pvtI/4O6DSkIQI/vgkxEdeo8?=
 =?us-ascii?Q?1vHCUC4XJIgxCq60/8Q1febE3gNWVNib0iJEqLaASVpHi8bnZvKhQjzvHzrJ?=
 =?us-ascii?Q?YRRK7FZp3fRq6pBi+ZYoc+PToaboFdI9e4EtTx9b4J5jyyH9We1j/SibN0Pn?=
 =?us-ascii?Q?Z/m0MXDUzG7oD1pREV8CAatoDK3IxVzFYEjl+8DMYb8aUfXv58BreJIo/xr8?=
 =?us-ascii?Q?InhEeQ9HK+PZpBZKHpSN5ciRudG+7SI+lMffLdYiudMcdN5y3wKfZ/KHNj73?=
 =?us-ascii?Q?sFmZPmZehRQ/q7ng3YPkXkMZbeFPV2EpU0HOJmvbLr0C8p8orzoQcY6COE5t?=
 =?us-ascii?Q?OXkjbLos4NC4k1YvdB9tJgekEnjUP65BlAYOoigLgA4/E1IHVUOw6w09luJM?=
 =?us-ascii?Q?0awPlHa8NxfT6oCGRKKGlf/RVVxe4vefDjhO3V7cs9YA0EvcV277REKfTYN5?=
 =?us-ascii?Q?eIUARX9JnOZnS7WU0Yf2Lj6gCBpkAO2UA4YfSr44KTvFRmd9ZBzkN9kAuBdZ?=
 =?us-ascii?Q?xMc58sFhukn293kuq15K2IrGnyrIFVqt6amjDvO0+0Q+hXBvDPRSQO+H3nn4?=
 =?us-ascii?Q?VuwK5IDqJCRWqm3KP7b3jqIPs556klzAl4FWUJxUg3cmbw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?11NOZXzP7YCs7iT41tBEKwOotZSmuHuIencj2kLWNKxmWHnqc7YOa5k37/RZ?=
 =?us-ascii?Q?l3wrr8QwNSrXO1XJe7fNo/N5ExSBrxoYYMEZgQvxQF0TsJN/pDUwIi0DURSC?=
 =?us-ascii?Q?FQAe62IycfmhFix1DidRRo8UzlemTWStHrWpJAdycqdQ7H18wRvt+oIjMHhP?=
 =?us-ascii?Q?DJlA6t/g54Xkl+rw+6zllDjJ5TecitY9rPkxUQFqPxIP2yJz3+h8Vu/keuu6?=
 =?us-ascii?Q?lit0NSTDybykSOu7NdAzL3O/8L67aKsvLYbMQb1h46Jc34Wo0gByRacn5aFb?=
 =?us-ascii?Q?oplkhGjNHpYIiWKsMdmR1SoiUpUloHx6M5tnbYjgMCBhEuEAZtd7+KhMn4rc?=
 =?us-ascii?Q?SxKXpi3WHWBY66TrNOhmcl27qKtvOUcKxTA7IUigxTCKm60GyaEUK7GysfFu?=
 =?us-ascii?Q?ovs90ori6FwricPwuDhLRxBOjiK0mWciuBaxBCBZoefcNozwXuUku4CX+vK7?=
 =?us-ascii?Q?YmR48QCEvAkfZ80dKkqAD2wuX1HZS5YvD8U/l1HsU+gkIJeBcO2Zy+G1bJrl?=
 =?us-ascii?Q?eDYMNZko3+iGIjqrXisXqJB061NjAS9eqePMGRRI3FdNeoOxhdOosfcuT8IF?=
 =?us-ascii?Q?NZQnteAHtewmp9Ez5n/gt3vQRTuJGCy3sCV1NnFTKpzh8UTAaXG+tAywmULj?=
 =?us-ascii?Q?icY6ImQExRMwR0dK4sJltmuWn9VM0apk4Bqgwbg/l7b8fSxHdP+OX8yhm6me?=
 =?us-ascii?Q?GdLR0o3tbwg714hC7LTfpCaOMmQdSy9kCHl4EHhi0DwjPor1Q7rH1kZMBjE1?=
 =?us-ascii?Q?fsE7RV+vY/qLxVVI9pXt+ZSEJbMBSnLCDNbDNNjXXOs2MPWku6YWgMGPDKo2?=
 =?us-ascii?Q?iicqfdqYdisfdnM0/LaICMWf/6ppCnLrueDyGJtUSMdjJMAUf5REHI9V1G18?=
 =?us-ascii?Q?pWKeKJ6cocYsGNcTG948KFbXcJ7loyNfX+qkm3HY29lKG8kA5zzwJY4MkTQP?=
 =?us-ascii?Q?edO3StWNrMo/iHIDXXKYaaXCaj4X6OpNQthoozkDbYQXi+KY55OQDY4pDQxc?=
 =?us-ascii?Q?79lqUl+qCxMsmxwF2Eg0/Rh2uGTmSSMN74xyWddf1KWSPSOSpZYkq4pocYk5?=
 =?us-ascii?Q?x1DPB6sAZ2uP1I3AKJWd3U7SxQvufrd0WcCnJpzRQl1mpEwCwjqJBrOijbHY?=
 =?us-ascii?Q?6Tl4kLXMkOwINaAy+bY+S1stXf21uvV6kCBTcXdKyQM/ICYlylYCFBhHu27/?=
 =?us-ascii?Q?z4xaD8PTzxG3XTCw/0772lLxNeMOb9V9aTtILpJwHXQ5wmUx8NpjM7qJqtrs?=
 =?us-ascii?Q?rPia2YXcLgds7GCG51LoTWZ8zhRPYSj3eDhkJGKOXcrse44yp4ZcuknEcUP5?=
 =?us-ascii?Q?qXaONJ29+gCtGIuxFq8KAojuwo0kPsPlB9ncSSAURvU1T3vFqYOEdbreK6Y4?=
 =?us-ascii?Q?6FQw5EE9efE0x5mVpwQh3Pz47MYqPnGvbrYkCgKJdC3Pmrty40tXN8eqkqkU?=
 =?us-ascii?Q?DK/XtFiIrg4YFqoXof5uMGYr0ZHJPOy6Fmz4nm2HOdbKixDcbldNrztMBiWu?=
 =?us-ascii?Q?tafM3nyFVHkP+CItD2JORY7nxfYwubeCIaa4Tvehvv55NjpSLL56VtDYWFEc?=
 =?us-ascii?Q?xlbtiCTVwjdNRA+rr3Z2wm31tuU/aA6ZINU3W3tO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7f2d28-ca8b-4c5c-5af6-08dcabc1f76f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:15.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi67xRJwyccQf2ED5AVoBxnTvUWQW3ACJC6hGNpt+ZScvd9zpOuriwYCXkI8Bmj4Q0K3FyrgaESOkR+cC0vqGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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

