Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBC89D8253
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA5110E3B5;
	Mon, 25 Nov 2024 09:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gB2JP+5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4EB10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZaBorrESA2lwOIOCO8DsFyjpS8KHQRfa0fmfGao1ojnelCmq3KK5lM2m7ODPlo9wGO5K4DVwjrncDPHsYnLJMuHXPkvrr2TjAvN9Tt7QKLDbQ6QpDpMu1sb4V5GN1/3DVmtPX0ie31auQW5k0KPUrJuk4V974DERiNg1Yvv1zxVCY7bdh53o+JA97J2jTy7hd4FYoiEyoeMxTwxi+GkBqXUQmvPfcPan4KJKEitLu6VbBn4u8EMR1qo0NIgZG1htU8Q53QSn5edyb56y1vOcNkoBs4kKk8dkB+0QqsVw2ariZ1mWrzRp+KnNKPHP8oyQTK7dhgLp12R4Z6HxOmfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYsJ70fQLkj4LylT139lES0KvUmGHk1J/dvMOAt40Qc=;
 b=jJ78ABOSZ9khSN/mXE8gHn6oPW81inAZLsCXikluIHuqp17OaH43kNkk6YjGdWa6Cr94111nN8lSIWWadxLDE69mhAIsWWpLinQ6SK+bKaz27IKl+up0gWbIduXS928XqG/+zgt3hSIUri+/u5MudgnLPtZAYBs0550OxKwVTALNmaAccGfoTj8fOBzraN5rEvucFglonWDRcHfumUg85Rai4ju/07dN1Cd3CUPpii/AhLdTP+6n84nXGr6rvpEbnQzdJc78rId3GHOO3lyheG11VBbKuwa7LpAEpktFGy2oN5sKf0tr+4pB8JsbjnYbP4GXeU2mOmshq+tocivulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYsJ70fQLkj4LylT139lES0KvUmGHk1J/dvMOAt40Qc=;
 b=gB2JP+5vDztpony9QpFy9EPKNkzvr447ugrh+gV4Bu/G1RtlFilUemEwNYo28tcEZddvItLnFV4xyR9BTDIn8RXvwie21doXLvBdcok3p/azn4lVBBXLMtGynrIaNxDwlNghlcdE+MS7WAPBNx10A6gJp+CI/ixxbCjGs1v4ZgBqf4uuNWH+LhlrzwyPhxPqMUpuH1kTsuxmBObDxRsQVx7qNBTeqtoSlWyECwPeCIj6zVbYXSyIMkj7hjEYPqKVTdZ1f7lIgMnJbjNB9phuiHNpOYHAKZsVQRijZTl4ZrkUWkR2oqZf2rDWMxcJEvFNITL93CeYmztD6RbWnxvcaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:28 +0000
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
Subject: [PATCH v4 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon, 25 Nov 2024 17:33:00 +0800
Message-Id: <20241125093316.2357162-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 26d692c7-3307-4537-301c-08dd0d34380b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Z1GVrQd5+hly2kGu3Vvk6nQ0E4G1kxbYTXpZpCaUZQ90m4reZIgUMDol9Dk?=
 =?us-ascii?Q?t9xdchKvbO31i0ieJ643ujErMkbJHYdz2ArDOfP6I0yEzFXmLabNXRGoNcW1?=
 =?us-ascii?Q?o7TLR1Kij2Vwe/Ir7lb49btyxZVSIks69pjFxDvtgosgmxGPhBtQ12CNbuGB?=
 =?us-ascii?Q?H61uGkQ8wCv26ZyLL0RkEc7epzPX7pvG3WJh9zfDRk19MDixKGNnw75zYooP?=
 =?us-ascii?Q?fVDSY2+lS9/KEN0mhdu3oFZnoyzdTtbZZUhjtKeMNksSzwv0TewVdMjgF1Gx?=
 =?us-ascii?Q?gSzkuVBMMUesBYqRPAM5Ewm4ICW4/Ho9XvkdtF8esmrIVwn3EyIQBPR7LCdE?=
 =?us-ascii?Q?Issqy45hcumxGw0b5rRbZuXfpveJBaq/L0xIITZVX4yBbQCbeQ2pKhWoEnrd?=
 =?us-ascii?Q?5cQ9tyiKCHs6kH9KrdFlZd/gwA7j7a7kHGnd7CZEjhmg5gtypwEarGWxYOEq?=
 =?us-ascii?Q?8rXa4jEGka8l8Ko8varvvIWF3aWAoootGZxHPKy2xaQQmmuVVo6kKd12x4pR?=
 =?us-ascii?Q?X4eqydK4mff1XZqOCJPTcl4n1/98HixSYS9cvJ8VGNZJPl0yHy+9R3L6Wnp6?=
 =?us-ascii?Q?lPicYgU0lYJ4b1wiJ7JkwjE2G/AbvuL2NXtSVc9lGpK6f8p2MPUPPX9UYsI/?=
 =?us-ascii?Q?bsPkyQX2RxJlLYnsERovOlr+Izbn4LvnRSv2TXTir3hUJwSZoNL0CB2kI0Eo?=
 =?us-ascii?Q?9oFz4iN02vmwaD+qXaNNftyWmALRCnpP39eIzDU30iTMB6aMkVn7TyvnL7Bv?=
 =?us-ascii?Q?W0OsKFQgglTbJfwGg0m3Xi2Mw0+cRXHFgKErVpMA+8Pv+StA2KxzXSX+C69f?=
 =?us-ascii?Q?4LoJxJnq3xwMgSa4k9h85n9G+oXU71juNhoVWaMAdZsAMARvRSGLRNJHU31m?=
 =?us-ascii?Q?j+AFH0iCkY5Ivo/dq9aPyjphHVcst4iNBOfqMn2CjyyrTM8HCFdrDZ3NUhrl?=
 =?us-ascii?Q?xuLBwta1p+WBa/vbtHzDrwSmjehK0l8WetQTaZRsyEoUmnLPQyu7TNBfQzmK?=
 =?us-ascii?Q?tMIwEixEx7zAEbkTTu37ZV+FUFb3T+vWytJTFqagMKH3TGX03/E/5DQraVEW?=
 =?us-ascii?Q?S+RacV9SJBJdp6nCFa3nLQdAg1jmtEm9G70i0uoC3va8vGtOgbgBg+aUOYpI?=
 =?us-ascii?Q?3nr4aLUp/VdeDM6gh+VMnmhjdqh8fisYSJPkwaT0cKnQVIkPuPOKiRLwLqPt?=
 =?us-ascii?Q?T/MIZsWpO+phpHRLvT19BpZkgE46LVqrr4qjZ2oct+bwlZMI0aOhFahMmLyN?=
 =?us-ascii?Q?maimTzuGtniwaPIhnOV0/Huxyuh0sSxb+Oj6yO95RWqyeDyhEXTdR6vhjL+q?=
 =?us-ascii?Q?YSFlxlUk7oqPPIjlOqtl4xcmH+luWajwq0MXEYOYKVO6CFXBeo5ZjSsnn5KR?=
 =?us-ascii?Q?byaA7DA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xAb9xTfV12Qgm9A4EzYEmnplX/TA8Rz9L03SDJhJ9VlxJcXB/LNaZ65OJXm6?=
 =?us-ascii?Q?HWevujeT/8krD3+JJYx43+g5eZTe0bK91ziDF72vVGD8plqhc993Ar6uNVgo?=
 =?us-ascii?Q?x9w+m70CGOmSxVGcgbnzwUfiWl4RJbkICgEuXZWhDESM/KC2nr+JEgQgxTxq?=
 =?us-ascii?Q?hupmzmWNHljFKRRoKP08Uu1uIGyXPkXwOMqsQvIkTs/8j/PKUc0ByF2A0vz+?=
 =?us-ascii?Q?8MpyPpjArW7/U26UfyOfQ3CKq3xUJ0XXjvdCF1cZcDiF3te4UmJNoBeq5M/X?=
 =?us-ascii?Q?Tw1dr3E6MK3ufJVjWvFf/+WU7KJTWAg+mmFLwq2pk20RY4BgMDpAVqPgluz1?=
 =?us-ascii?Q?iWZZCftgh4vuW5y66/WNOhsxZ0TN7UWAkNxwecKawHerNDb1gr02fUhwzSEZ?=
 =?us-ascii?Q?GDx99/nX46+HS1clPov6GfduIzyhq4zge1YHoOlPymEQTkF1hcKrD/JGCwe4?=
 =?us-ascii?Q?1JuOPFxJ77kwSra0CxMM1E/Ve0j3yOBuaGY92C9cWZCJZ8eFxzLlXESimxVu?=
 =?us-ascii?Q?EUdBfOWddjzvxewRyT1V8404jILpqdwlmuzFdGAh7Dit8645JEuXNQUlI2cg?=
 =?us-ascii?Q?wH8dtvP92hIJZZp1pBhSVamDY2dpsh8IhoB49ixZwv5nE6D0vCSjChuQUKGv?=
 =?us-ascii?Q?myY4Cf84dBw+5Z0zx03P6uC1EMgpozs5fothShz6S6vIsIXTm/aVouBLvFbF?=
 =?us-ascii?Q?fsDrzE1/bj5Lhba5Jaz6fqRjmm8Fshtvw3nrfPbFe1dc2twIMD3dC1WlnZIG?=
 =?us-ascii?Q?Po+FVMe7SSVjeH7S6vJRee94nIThkcQe+8863angOwucl886zvi0rhFTYXNK?=
 =?us-ascii?Q?vdyaSdUvHKLV1ueQQsuOnWHuNhXnv/AXEi4H65ckl4dUc/nREcgRwvTTMJJ0?=
 =?us-ascii?Q?v7Qeo60fY8qSonQaS1DHGaHaU8kRl/ZkGtDnC2a1FbDWTXpaMOMwz1y86QLj?=
 =?us-ascii?Q?g8N5xs6XXH5k+Ph6ZSs3tc0bGtvpxStZc+KkjTFQUmRRlRX7D6hvm6/0A3/O?=
 =?us-ascii?Q?7BFKDljrnWI8Bi7m8zCBiwuj5Ge0Oj/RGcQwa1OyKTogYZvsZvM6HalwI1Gd?=
 =?us-ascii?Q?VrXxa9QhP0lRCafJVjhxqkdsyBS+j9daFTDcTy7v7+VuzaMKOT2v03/TV7Kv?=
 =?us-ascii?Q?BDqfqjSz9/58g8G8RpoCxm1TXwH3syNR31NorANVbV0V/OWoaxQd2ofuUCjD?=
 =?us-ascii?Q?vYLpXl4uf2CrcpHLYFWQ4MjbTkMV42HD2oHwnVphTo+2zwYubbEeWlbf7YVK?=
 =?us-ascii?Q?34me2i982xBRN80gMTLyLXR2diAjT0Xoy0TRXCp49kvGRRpi0KtZDj3KD9Mt?=
 =?us-ascii?Q?dCe0RWhUMDs76SfntmHXJH7RIQMiR4prjS64qNEGmMSe6uHxZenSbaexhwfG?=
 =?us-ascii?Q?81IzneRvDM+vSw4CJ44dqwoSPUZnoqjU1fcpLrqsMtBPMVE7VhmNd4asfN1Z?=
 =?us-ascii?Q?3/KGdGh7kraTSm1HiRZIFRiRa65CAVudQHQSalOQ1RwNEcxARIOOBeeNOSTN?=
 =?us-ascii?Q?/ZV+usTCSGHwgGvTWuUqJ0wm7PhApsg5Z5PuzEO/8IEh1j7RnSoyt3nYsrDa?=
 =?us-ascii?Q?fWOE/UXjsBCNNeT3FfZfk2VzwTo5Z2fK+kVs0ZAV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d692c7-3307-4537-301c-08dd0d34380b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:28.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA++CqIMJ4slGoVkZNtMtuoMoIWEZ2Gjvy0/26OhWvlh4nJnESqHC/uivUqlrftrmXVUUBmDpg1NfUYrdtSd7Q==
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

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Drop port property. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..91f3bb77d8d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description:
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-display-engine
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: cfg
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: shdload
+      - const: framecomplete
+      - const: seqcomplete
+
+  power-domains:
+    maxItems: 1
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
+  "^dither@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-dither
+
+  "^framegen@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-framegen
+
+  "^gammacor@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-gammacor
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^signature@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-signature
+
+  "^tcon@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-tcon
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    display-engine@5618b400 {
+        compatible = "fsl,imx8qxp-dc-display-engine";
+        reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+        reg-names = "top", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <15>, <16>, <17>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        framegen@5618b800 {
+            compatible = "fsl,imx8qxp-dc-framegen";
+            reg = <0x5618b800 0x98>;
+            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+            interrupt-names = "int0", "int1", "int2", "int3",
+                              "primsync_on", "primsync_off",
+                              "secsync_on", "secsync_off";
+        };
+
+        tcon@5618c800 {
+            compatible = "fsl,imx8qxp-dc-tcon";
+            reg = <0x5618c800 0x588>;
+
+            port {
+                dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                    remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+                };
+            };
+        };
+    };
-- 
2.34.1

