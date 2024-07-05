Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371792845C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101010E160;
	Fri,  5 Jul 2024 09:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WZDlSXdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6CF10E160
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUv2klcb3JrRtmusjZ/UVl3p+CllP3tG9N/VVcmQyzsHSJ1mfDqyV33Jwg0UCrLb/2TkNddpZ8bJT0O6Srrh3OlF4KmrocuCJj5hlT0a6iYolMgMbptes8l62AAJEZwGldiCNYg18sruIYD+/QZJf7aLooTjQe8ZTSbDq4rCPYXa2KtKqepGPXm3LIgr0ufit0zxHhR3hB094UJD/gkAGGNQqpBgvjsK5YHHVvlX5WfG5879k9f6RXhTcckP0JBOY21kU39U/mTNh/CCxtkd5/nq2dAi24HYMNXuRrdfYlhP2ugnSss7bvZa7o6sCokdRsl+ISilTtj7UtWO02Gk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiZ26clii4/2nXnsdndzlfTHDA83GF83Cj3Xcy1sCTo=;
 b=B1TaVvplnqOmpbvpXOb0aGblZlTcR78Yu/rP7V7zkLB1GxexJeu05IpC34xOgVY+eAGNFlJBkdKfNoqONrs1R74iWFf/3gVUk2w9vOAphXm7mTQ5O7NNR/TUBrlvhqj9Gmf1amkGdakENFM605Z+UAe0T5Tjuhn3PZU+QZAdRrLxr5twQ7SxjK/FKhu+ajhP4/G4DPLGDHmmY2yM0neOS6wC2bSMQbj6RqP3ZxdlYmNteTJf1q+j4696AtyjDrgWaqev/Qa64rZiAydZ5K6xFPd++Fj+DzadyhFGik2aUq/GVIbbAMyS6aIiWQ5ohR9nnouhey7895syqjqRcybAJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiZ26clii4/2nXnsdndzlfTHDA83GF83Cj3Xcy1sCTo=;
 b=WZDlSXdR3zvj3UMErGbjDhPiWzoGkXasqGW81WZzqtz/YPv90QWtSo52/cv0odunpAl5HlrZX9tLz9/uOLyZrzRX9TFHPC4VU9OCV9M63NxQfm2jBGPwMtMaagDBrVnzkYsryqfR1eq/9+jI5MouUVRdhdJL04kBR6aVGeHMzbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 03/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Fri,  5 Jul 2024 17:09:25 +0800
Message-Id: <20240705090932.1880496-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240705090932.1880496-1-victor.liu@nxp.com>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0110.apcprd03.prod.outlook.com
 (2603:1096:4:91::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: b18e6f44-6c86-40a5-481e-08dc9cd100a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lCeovX+/jeonaD5e8W4QX9tFxrHPZAZ5pGsgAH/wMdlB7/mSxFf/jeqlmFWo?=
 =?us-ascii?Q?vdz7OURCYy2Z9IavPju4jhM+ISrmk87OU2ps+rf+mDpKvoxDDGANzfmTS1sv?=
 =?us-ascii?Q?4xrrv7fx0oQOpMW7+5geu+pis4fnGpRjJZJrH1AXvAPCEGLU0YxC5bCOTK+a?=
 =?us-ascii?Q?MChgfhqV3FngPvMXoCsYXRK2HNYDpNBYM3WuOkFQvjFqAgLki9AoBNQEz3jz?=
 =?us-ascii?Q?DZg6w42uvCRxgSMtclzOsT+hdWyJWqWPdjB7+tF3tomBgAH1xGztErNH5p1D?=
 =?us-ascii?Q?pLtknLVvxQQPiVsdSHcYmUVX+Bsiah/uhkFCY4e2p8TcpzuTQT0Gpsc3w3oy?=
 =?us-ascii?Q?ZJC+xQalV79fK90/CKwYgaHCm0G1GJ0yLNx+cLVivhoYpG0gVbZSwvQisqsA?=
 =?us-ascii?Q?qKCVvtaUcpvjSrUV+Evd60ha2FUBZz1vA39U9h/E3ThR35w5tMy+enJFdsyB?=
 =?us-ascii?Q?vZ3AjOsrXDlz0Au49iGgQEkZRyJv1JHirWE/Yewu+0cF/Oej4mu9linDY0Qg?=
 =?us-ascii?Q?UTIOh8apGbJK2lGokPMNE8954hLAEUK7033UiPe/zYGM387edUT+OyBstn0Q?=
 =?us-ascii?Q?3wI7/dDj1kL7rLpWjzvKjehSrdPsodUl0BXycSesnjdPl2EKmBaZuoU158sF?=
 =?us-ascii?Q?3V8LnRnTMyEvaoqn+QJRDb2M2agApgiSSIswJS1/yMCAuBYe+y16ksSfT3wb?=
 =?us-ascii?Q?tLXDqTvkbK4T0DKJPIpNMm1dp55PFPbvzwObIrv9O9U1iuTPkIaq45qw437z?=
 =?us-ascii?Q?71SA6UcRfsGqwDKv38zTtqal4UX8mlCo6Csr2wJ2hlxjK8tYlCPNkVnV35G2?=
 =?us-ascii?Q?fWv81HNSYSRgdQjWSrmFvej99oXKDHG87p9I4tc45B142dnOruGR0pSI//dg?=
 =?us-ascii?Q?xT+ISSEuBe4Gw6ciKK96enUAr7X8UbvW8cY5ONYxx1XvUCBH1L4oCMZMM/yQ?=
 =?us-ascii?Q?EvnrLBUsreRE5UNHylNwY//5dDdHaatkqwcGmEDvGIo1E02t6oP2zCEijhEC?=
 =?us-ascii?Q?K5IWsGn42ERKfCInzk0paqP3wJ7/adyHt1CoDdxpM+1ZRh+AcqSDXETnNbHD?=
 =?us-ascii?Q?MkITJh32kqgDfqBDH9ViRZuc24ZBlppvX/8hpIqxyfRhWfWZNJvirlr7qIij?=
 =?us-ascii?Q?wNoFC8WGSjM+sD3S/YhPRjrwR5GjNiQ/zdkqdHAvdP1Ga/dK9FiMEDzfoSJN?=
 =?us-ascii?Q?3sXIdcgLSgfSuhqBoB9MdEbHMbyjMT/X9yf1lHX2wgCWkPmYxQJBtiNvAbWr?=
 =?us-ascii?Q?2au/7m7IMAQJgzRgOVTjvi1A8kxmngkPOqgU7JyNscsiT+fmtb8FdYbEn8D5?=
 =?us-ascii?Q?73dIY7hsyxU6BsO+yiqNgY9G6GDo3lVbQN9QO/nldiLy1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZ3diDldRnnZIdU7yLPJZTU513KyJuEx3dyyrRn9huiw+srSQ/d3FJIeIEn1?=
 =?us-ascii?Q?WCzhBM66BpmFTPtrU3/MPWDyeSzmLMH9GdZER84qCNYPYfnfX1PHybz5yyRN?=
 =?us-ascii?Q?oQLEKb8tiwknkPPTR1xgwIypnnH3gEBbnhRZhwZ0pdlhvjliciVxKyKkVg39?=
 =?us-ascii?Q?JPd2D6JYEYJ94rm9YzA/FUWUuSIfjFuPceOLR49tosKIKgS5aTys2H+pbwoo?=
 =?us-ascii?Q?nIZDZxGRBS+qmWEMpD/fJf5oXUsUuoAQQMraPkFzatsqKhgaEAL1qTxWXIwW?=
 =?us-ascii?Q?GfVWDh+3+NYOlfv0W3c9WvqatrJKR8m7QrpPpCV+M6uSlZJrVcBGsobrtDno?=
 =?us-ascii?Q?nRtem0jAkfViE6q1H+pTSsPqLdgM2APMt6VN9nsJPXVnsQDC+75H9a6OIRv1?=
 =?us-ascii?Q?GyPKgRjjraek8J1ve1krmSgEcaCE2v78c8TH1erk70kK8F+UoWQC8Q908rsr?=
 =?us-ascii?Q?Mv/+bOHWkYHKqeCd0zMRE8XVyAaAkmUUoPzk7NK8/OtssSLH7PBaQfesJbgH?=
 =?us-ascii?Q?tGnJ8E+G7owwjeNfeN4s4urNrcv/j0aUgjUrjnPFZTPmq2gggsPHJonh/hfu?=
 =?us-ascii?Q?wpXbxM2nKByGyAVHqcv8oNGM+fD7vAl9Kao/dehmq5jgu3eGkgvYGktt5wGC?=
 =?us-ascii?Q?AXT7M8vU4WdW1ml68F7pLv20R2Knd+T4lZSh9HF1LyQe7ojm5R12SvUlCBj8?=
 =?us-ascii?Q?CrPUZMtNvAsRqrOd/D5MbgFW3MxcK4WV2kF6Fcc+pNASTz3De7SIYtLbgIgU?=
 =?us-ascii?Q?OTjoc6x4i1UfRhxoPQ5Ku72xIVSUK7aMvn6XV2SboVtUyfqSAYMqVQJ+nt4b?=
 =?us-ascii?Q?yu5zhPgIm18hqN7uwbbQ3GYnocBMgXf1b9PfHG9Hdt6y1aA9uDIc5GUDE4Mf?=
 =?us-ascii?Q?1MSdhEDB/usBIBQZZhEOu8mlEbviXDkDpVotqp6TItAqDzdfTKu28J9LDis2?=
 =?us-ascii?Q?9pfpCQIFRxhZIL8rTJSTbRBbTNVoymIUmsg39ltbeM6K+XadvCWLN4VDfcBD?=
 =?us-ascii?Q?ISaDWUNkY5/4CLX8wtv+ZqsYtknyhbtLotFhOP8pzVLPu8J0sE9bwzS407JI?=
 =?us-ascii?Q?k+3pN49EuJaMHdeUkiuoQ+5IVZNakHVdCVIKTs1+aQGQFMwWrLKOqnElxnlF?=
 =?us-ascii?Q?NyKdjOxi51Q2+ERImrWH82GzBu7kZ+hlGWYdK9FM18eiRyi4s4j9Pc3wi8Dw?=
 =?us-ascii?Q?j+ZKmlQNCp0p6tXSctYHOP0n9tA7hrkLcg6HUib0GEB1i+c2cAReUZcrtR7q?=
 =?us-ascii?Q?taU7t+HW7m9Mj/U8csyIaMr6TzpuFCyHKASEbENtBb6Z1IlPw1B2x2uxAYMZ?=
 =?us-ascii?Q?xU8dgHisPrFfZCq3NS4nFmauV6L5S7bzdKPkHDUqX2LnwQj7bskBWc5lMbTx?=
 =?us-ascii?Q?ERye8XnhT5Y+5NbBkbc0Tno4R16XV0JttR05p7ny0CcC30BLgwrhSnV6vEoO?=
 =?us-ascii?Q?BXWZeN2s6hSlQGYJe14x2XWK1VdaNATLFeGCc88wJD4rnCfAcLGhNKiHGJe1?=
 =?us-ascii?Q?Wjei+f0q7uWEzLFZIzloa2TT/m8KH/cQQK4+2I5V1SjgUvWecTBdR8KaxNWx?=
 =?us-ascii?Q?4wvhmv57UA/NxIj8nHNhUQTgItTMlgbgNEOESCFi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18e6f44-6c86-40a5-481e-08dc9cd100a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:05.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fd0SVxve/kfEUOR1t+6I81c1xBHMtQ3MNHQshWHNSRuEUfpQFT8zNAiiwEdWHJI7L1okGQVdIvpjQoezg1Y8GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9073
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

i.MX8qxp Display Controller pixel engine consists of all processing units
that operate in the AXI bus clock domain.  Command sequencer and interrupt
controller of the Display Controller work with AXI bus clock, but they are
not in pixel engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 264 ++++++++++++++++++
 1 file changed, 264 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
new file mode 100644
index 000000000000..29dd7bac6f7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Pixel Engine
+
+description:
+  All Processing Units that operate in the AXI bus clock domain. Pixel
+  pipelines have the ability to stall when a destination is busy. Implements
+  all communication to memory resources and most of the image processing
+  functions. Interconnection of Processing Units is re-configurable.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-pixel-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
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
+  "^blit-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-blit-engine
+
+  "^constframe@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-constframe
+
+  "^extdst@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-extdst
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
+  "^fetchlayer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchlayer
+
+  "^fetchwarp@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-fetchwarp
+
+  "^hscaler@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-hscaler
+
+  "^layerblend@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-layerblend
+
+  "^matrix@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-matrix
+
+  "^safety@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-safety
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
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    pixel-engine@56180800 {
+        compatible = "fsl,imx8qxp-dc-pixel-engine";
+        reg = <0x56180800 0xac00>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        constframe@56180960 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180960 0x3>, <0x56184400 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-cf-id = <0>;
+        };
+
+        extdst@56180980 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180980 0x7>, <0x56184800 0x400>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <3>, <4>, <5>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            fsl,dc-ed-id = <0>;
+        };
+
+        constframe@561809a0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809a0 0x3>, <0x56184c00 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-cf-id = <4>;
+        };
+
+        extdst@561809c0 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x561809c0 0x7>, <0x56185000 0x400>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <6>, <7>, <8>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            fsl,dc-ed-id = <4>;
+        };
+
+        constframe@561809e0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809e0 0x3>, <0x56185400 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-cf-id = <1>;
+        };
+
+        extdst@56180a00 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a00 0x7>, <0x56185800 0x400>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <9>, <10>, <11>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            fsl,dc-ed-id = <1>;
+        };
+
+        constframe@56180a20 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180a20 0x3>, <0x56185c00 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-cf-id = <5>;
+        };
+
+        extdst@56180a40 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a40 0x7>, <0x56186000 0x400>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <12>, <13>, <14>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            fsl,dc-ed-id = <5>;
+        };
+
+        fetchwarp@56180a60 {
+            compatible = "fsl,imx8qxp-dc-fetchwarp";
+            reg = <0x56180a60 0x4>, <0x56186400 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-fw-id = <2>;
+        };
+
+        fetchlayer@56180ac0 {
+            compatible = "fsl,imx8qxp-dc-fetchlayer";
+            reg = <0x56180ac0 0x3>, <0x56188400 0x800>;
+            reg-names = "pec", "cfg";
+            fsl,dc-fl-id = <0>;
+        };
+
+        layerblend@56180ba0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180ba0 0x4>, <0x5618a400 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-lb-id = <0>;
+        };
+
+        layerblend@56180bc0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180bc0 0x4>, <0x5618a800 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-lb-id = <1>;
+        };
+
+        layerblend@56180be0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180be0 0x4>, <0x5618ac00 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-lb-id = <2>;
+        };
+
+        layerblend@56180c00 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180c00 0x4>, <0x5618b000 0x400>;
+            reg-names = "pec", "cfg";
+            fsl,dc-lb-id = <3>;
+        };
+    };
-- 
2.34.1

