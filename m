Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F219DF91E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4A610E2ED;
	Mon,  2 Dec 2024 02:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IKlAFV5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2083.outbound.protection.outlook.com [40.107.241.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4757E10E2ED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZ5up46Fp6qykg9nmB9b2NKe5xR+a+Mg/LjDpbKCG9oXY3L9mSDNZ+St5xr7yxegwU0YIyetWi9b6ymmH/xbmbLzkKiqeDlmnEd6cQS2nDOYu0SYLPo4ufy0Fa9W3wf9gPm+/7SyH0/47rJDx1pjnlZDhOeVPdEPyFG5I9Y3kSf5YEN8u+BMs37vOgZK/7sTAsnelMEw57Znuo6Rh+/XP64QgqAHuBGPtAe/x4XMXJ1d+rdlP/549F9jefusn/Het2Ka1jpSKv2MpUbwg56SeuUm5zGj/UQhPEJk1HdfYc9ivFOETN508bCCSdLqXpK92xpDJul9jsT5s8KQ+ka4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6ur9MuDHAI2yqJbWamXsTVjJFMl2CJnelbodQN5X6Q=;
 b=JFd21ceZICaUtKAjhh+ZI7NqgR1xoKcBWr04BD3An0lZCSSoI+Jg//592oCton+J21pGqAhSPBrU67NNeYCD9deraqasuzReY4/Ms3Ne0oQeMchVVHZl1JzzUlW9Fra+eUAaXprTjx1K21NC40dJjVmeweXrWps/Ry2BLlIRw76ZKIVPNl7mxOed5U6zkPxbB6B0G48I+lbTuJwutzRIPT/CqG8avUWYMxgFrsB+b02j3Cs2+LicVtRAzQKYHQaDsx7ZKkQDQyyJeBUKnTmf2VsFghH1vuqxEvSSnRWK4kqu0XhDE5HS5QZ1SLlbkJmGlI69m6ooxNsRDzCSZnHNng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6ur9MuDHAI2yqJbWamXsTVjJFMl2CJnelbodQN5X6Q=;
 b=IKlAFV5mudi6mmPv4DNHT0/4tjjNhu7Moq5DvT2YxdB5zZus/x/eXg7NzWoMBSph80vvvSWEJKBpOS50WMEuarouZAfvz8gKLZPL26GfGP3Yy8HbQ4AxoZi56bdv6EvIHuQtigekfKTv3/0cHPhyujLR2hQl1zKmYzzzl1uO7i3nGNPjKkw3apHBk2wP1/G7ExEXfxmjcGjAkpjPy0L6G4AfQa07y1CaQ5pIagUPZmyzQaL1LWUqNanR3wdKlmRG2Ss5rWjSxyj2CqRl2VxBFx3ApZhLs8UFCMetRym1geNdXixU509OVHBOcip8y/KRF3dbfKGZEwN1lm7sfrpQ5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 02:56:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:56:49 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [PATCH v5 03/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Mon,  2 Dec 2024 10:56:19 +0800
Message-Id: <20241202025635.1274467-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: a6398cd9-1f6f-4868-9aef-08dd127cf728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qWlRqgQV1lRJEGvq5a18qn+yS+ZKRxkZNNg9KZfLQ+uxdZSQ8GD43e6W5dGw?=
 =?us-ascii?Q?9rqRz4eNjM4nW0RF1LIBWOsm311fPQ8Wn1anFWhFjfUKUq4uztpfF/FmkG8v?=
 =?us-ascii?Q?F7iXj8NdZ5hD8ZgoY8Wa40c7lKRygubkhla/YKmGQR1KoHx9/kaYw99WLAn2?=
 =?us-ascii?Q?8g2fzQ+zCjQmx6nUtPx8TAWYFKmJ0KufBOqej9I7nKaVZbSEi+2B8A00ORGo?=
 =?us-ascii?Q?3WUlP9RB5Zej9VwJCozF++BW+LT3baTEBmdjc0vORyt5ISiP4dCTbsQtyCmU?=
 =?us-ascii?Q?R8iYFOpfg5WZodt1Aoz6P5+mYXtxcet1ZZnsCIxvLYV727LJNB2E/2ZDqz63?=
 =?us-ascii?Q?mnBJh0eYAkvzIKX8WSilmFHaX3B3N+nlm80phLacQm7ZWQd9r6+ICUJFRIvY?=
 =?us-ascii?Q?8i1P/FvbwILxraNdqyPUy57JKXicMHK8Rd/zK9u7RvTpBox5bGm60iHfpHL+?=
 =?us-ascii?Q?L4ibTVQmei7rUL90ICI0Q2MMAMef/4MnBGTzl0zt6ktfmISu3jsA87D/QOb4?=
 =?us-ascii?Q?o9D19LoIpz+SLcHUMtJG1PpH1oXMHU3xyXb166G4ca7gtYeeWpoRKfmPu1qe?=
 =?us-ascii?Q?idCJvvgBzOGtVHtfsAuHaAplKgHdVZvXRfFP+z9qyALVowqWrFLONPhM200a?=
 =?us-ascii?Q?FHPb/PzJvTQS9ANY2xyYm+zrfAic+76tq8gtSv5M1P8nwF3wzHWW7Tik6bKt?=
 =?us-ascii?Q?PKNqwy8evUqVvS2NPZ3aMJJ3UDqg398LpFXePIq+eRxS+VbVG6POkM4V8d95?=
 =?us-ascii?Q?pRXeoJQxr013W9tLUbn9+pAQ9tfjXlpLtk8GLiUa2INSJTN26ykMLyIgvSns?=
 =?us-ascii?Q?CgbB+DLoyEPG0wNnGVIgOOmPrfoelmgXBHVaNGDDbfFYitB2u4auMG77AOM8?=
 =?us-ascii?Q?eZ2tZjYqLVuOh6KIxWL+o3dPOg7heOgJ6BJfcL2DYU/0njvEVoBXc70BBMbc?=
 =?us-ascii?Q?B4a1FMhzkqtGr/eSY8AvUXY34TdaTxwVFPme3/DNxgyjh0aK5aXvJhcJ1DXZ?=
 =?us-ascii?Q?WBmeLYvESflBEILxHgB2VrLk0soOhNaCqbldfWDFx4WGKns7+Ur110OJElLG?=
 =?us-ascii?Q?JrFa2sdXdtGHbxXwgSziz5Z5oPqaB+qAqXF2p44LQcuCLeI3PsSKWE1EQVQm?=
 =?us-ascii?Q?kgu2OGymhRGgDfG7h3W9cWbjgpsJ/NZ2Ks93W0Thw98Js+O7+iL3iocmx/Do?=
 =?us-ascii?Q?0Nv6MK9vp6swH7CsM76mBUzGSO2x8bkD4NiWQSOmety3Qnd4F2bPhxayawkX?=
 =?us-ascii?Q?3bRfv2ySK/AMyuKyqRYg+Ql7wi6p780EvNAlqw5PYJ1/0Ezjgai/j3VIHjS7?=
 =?us-ascii?Q?w/ShHdohKuZVCUm1Elxert6UBUv1QaXTHe/lSc+DKb4sz5WNO2SZnX1t85bQ?=
 =?us-ascii?Q?HXf9leM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7N70rgEg4HgDm0FTtF7oWjf/6uVlHC6pNpBBQYnKpXe+YhqkCTzph6znrY3N?=
 =?us-ascii?Q?Q5Wa/pOSLHbrabNcCkKvshmjx9V/b72Q6ZwuinCsaz6i7zv5LBm88Zyv62a/?=
 =?us-ascii?Q?DtaRpI212ne+Cg30TEP/LzFHKUkcpVrWCnpdKZxUV34fEYA/yB9NhTze8ufz?=
 =?us-ascii?Q?nowUtHFLLtKo8Jdj9Cev/4H3hwcYzUZ21L9o7NP2ECbJjhTl98jLaDoxGkfg?=
 =?us-ascii?Q?TGgLJ6Fl7g8usCA+PnpCeYFLNBXbSelztn8e8Z5plc4bMnb72wD773K2kG4A?=
 =?us-ascii?Q?FX3uTGnfgVgysHehDC/sJS1y0OjPyU9RtH5cpXJ8Q6C8Ph/HKpvpTSsQYUSo?=
 =?us-ascii?Q?4pPKb8nl3rKXK5pYMMBCF028H56G0OZt1KkYjqyGBX6FHE/9PAaPreYVhrkF?=
 =?us-ascii?Q?C7dYzqCDcjBo6lCZ49PrBkc5CGrZ9LiQ3zKIaxcGsUJgaahemCWs9C7bQaBD?=
 =?us-ascii?Q?2Qb+fgO1+rNSiQTUH5kjlciub8oz0bwXKZOPzTugnB8xH3t6zBKnkyLguWMG?=
 =?us-ascii?Q?xgUSadDbWwS/pNHhJOYKbSKzPrQ/HxGQ7ZU8g24aFXeyFciLbCBUxoUQ9rGY?=
 =?us-ascii?Q?+RzxUXMvVXIL06FH69aALlg0nDQhVhZaCTN7odacyVepX+wPMZXDaHbFaQGt?=
 =?us-ascii?Q?Ky8lUU8hi/wVV1G1IF/vpdPYMgPQE5sgjR0trPSPEZBN9lYGOEzV4mkiHpEL?=
 =?us-ascii?Q?VihsarVAO+aZ1QcruD1v+BEsw94ZO8J2iYC7Eydfwp3CMudl2O8g8O7spIer?=
 =?us-ascii?Q?8SKp0ZPBFaLo1JuWQDaDK9pIGuLvlK0aKYcHVJ4tG+W44GX0xo66vXD3O5uj?=
 =?us-ascii?Q?3dPKg9YkXSbV3PY9FM8pxYBM4+DCeiIeRe/82GWas3KBPiCep+iM+OrQRdUC?=
 =?us-ascii?Q?+7ogi5ySmSta+eqpX43eP0gc4l1w2t+QKxe/shOqzt4mw76z8FJJbiU/ygtN?=
 =?us-ascii?Q?Ujuc2qIxPb/m0eZ3FUweB/aKIfs/Vuj5wEp/irozOKF0MTZTGHw6qQWBSYIs?=
 =?us-ascii?Q?3Fttl3ibB+Ka4sJi9d/eX7VOBNOsJof0OzdgVtZa1fCQiHJ13ORoWvIKX2Kb?=
 =?us-ascii?Q?mtXHpDDYnCk2fzluIu0dXm/2wvzaNUHOGGfcOQT7/NVzCMJmrYvL+pI69qtg?=
 =?us-ascii?Q?mqtockJoUwW1zR4eKYdBQH9elmmM1RN280SCvmWuAmTuD8LwRWY+GSGhaIk+?=
 =?us-ascii?Q?yy0MLijNRv++Np/crdtSny2zTpdGMJ2tZGxgVJcb5XOnFUqBMuKa3XTt/Upa?=
 =?us-ascii?Q?TWyrqahoqyR7bhFbwtbPNjaro1Lp/024lFSceeLIOj68Tqy6veNnEBhWLQJO?=
 =?us-ascii?Q?unY8w3uqj0yQV8B3Lz4Hsgpd0yyD+/WjsjnPwxoGuQ9CeqO8KmQnYPla6YGl?=
 =?us-ascii?Q?RP0rJmsywxeREe3sC8KFcMXl3UUzw6lKrqghOCn3IVIOgWNDk8wbCyr2p3SH?=
 =?us-ascii?Q?tOl3XLI57Rw2+FoyW0eTIu9gt57x77i+8bS0J4WySwRSzMWSVfHnSk5ZzGrh?=
 =?us-ascii?Q?i4fDc/zFCE9HmwzHH+HOJgxdKAzZQ+TIhhxu9adqOKMFzmRkiSylMivEkXnH?=
 =?us-ascii?Q?aBAuJcbWqDYc75jWEnE2Cv7Cu6ohtPEH/meplc4p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6398cd9-1f6f-4868-9aef-08dd127cf728
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:56:49.0255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKejvK3gfi11iBpgbj/WaJK9nx6w8hV7YT+sGhdaFLgh9YL6vERbTvp83yqjrVciaNSxVxY21aPYKJYqAyuGCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318
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
---
v5:
* Document aliases.  Drop Rob's previous R-b tag. (Maxime)

v4:
* Collect Rob's R-b tag.

v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties. (Krzysztof)
* Drop port property. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..b5da0bf3a1f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Display Engine
+
+description: |
+  All Processing Units that operate in a display clock domain. Pixel pipeline
+  is driven by a video timing and cannot be stalled. Implements all display
+  specific processing.
+
+  Each Display Engine device should have an alias in the aliases node, in the
+  form of dc<x>-display-engine<y>, where <x> is an integer specifying the
+  Display Controller instance and <y> is an integer specifying the Display
+  Engine device instance.
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

