Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39B92F7D8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06B010EC76;
	Fri, 12 Jul 2024 09:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ocl4Duao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807D10EC76
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:24:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVwLh8P1AvEa8uiEEcbPtQaGTsAGfum///fXtNn/7D/H7zDbHEqWLIj6+bFZxOwvv+jbwvjx10Lb3vN2RWbfUhcRTRdEQUlORoZH1IZrvykNwqTSObsIxF+R3/gs08mdF7vesOSOkyMMf5IiUs6TN5CMTOfxo7t+cA1aAIxK+fRKamr5jsDfdsh6ommHIaKW/CULGViNvV+I49h9J4oqe6S6i9uVTHd9bYvPydW/FW0MD8tYXGLMMY/p8lgAISLQN+PVYzm31aXijaUOd4jGW7qaros/FxFGntnI3VsjIPqoTqOeBCNZtq9h5KiBZK6VKDU6EHi1rtygXr5ck6LKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CENez7oAf0r0W0vQ5AX0ZaxBA18j2PHzB1COo4ieu+k=;
 b=NhmbL6NjJ67cTdacqEg0dpVR4cmHEbJZpBUczglV/a5g0LPJtD3+8PBXTmEGKTFBSc6w5q0KvfUWuZY6yfFHwwIysEba5eP04zML1AKbrBQAlocAbNu4RIJTxk7zNqiWizhHipx4abge8xfucOWEL4vFl3O78N5aqgby65eLEoXsSBTxxWfaZ7Ei6J2SqNT77ZZ83LHH8HGDpJpbqFb9tRWCEnUOGrCerhPn8Hx6KnXIYXtxgp3tYGnGq9/tsrUeO60dgpLGXHGeu9FcuClrkCrzYCK8vbwja58zPe6IipehgSFYUXVBZWF6xtPI/gLhomwBUToWiKv+IuHECO5VsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CENez7oAf0r0W0vQ5AX0ZaxBA18j2PHzB1COo4ieu+k=;
 b=ocl4DuaoAOMr9XHe1TX3xNKDitihkERoAtYzl90HRV/CrB172u/Oxpa3SYbv1DL6VbLiP5hKOycwJEeesxyNOHvUAb/wWnrfFSFyUDELBLfAbF0tJQNK1omw1cu5BwnXuuHOizW1UY4+fXpn4744zNWaOozXFBEzKHDqLChzupk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:24:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:24:51 +0000
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
Subject: [PATCH v2 02/16] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Fri, 12 Jul 2024 17:32:29 +0800
Message-Id: <20240712093243.2108456-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240712093243.2108456-1-victor.liu@nxp.com>
References: <20240712093243.2108456-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: 99c34d2a-0926-4a1a-8af3-08dca2547b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ab8w0A7j4tpM0KoYlzvIhVw/A6Ze8uSad9vZ7KEBtfMk2DkfwFxhYha0ShN?=
 =?us-ascii?Q?V6vDGJXN6gKLRG1aO4ic5ntnu/oe/f1JvpxEzyWqJnYBhFrkyZdNlJvcwjn5?=
 =?us-ascii?Q?pfozZ1lQ4hq4d1bKE3DvTzxSk2rzobZd20m3Niry2WtN1r2gy2t+HdiuV6e6?=
 =?us-ascii?Q?IV4PCxd3ejuxVrng6cXTzvxo2gtof0X4uNowKLpbqMbeBcSgUeD1kNTX9BJ/?=
 =?us-ascii?Q?XcwQXpN7oAatNRY7MoqS79UDEu7/49e6/4bVOafxgoNom83sO1waPiSazOlV?=
 =?us-ascii?Q?tHw255PW8Hs5TXoh8QxO3AcaUyc8hWo1H6TLJCCgpRswEUD/Uk55vHBmEYRN?=
 =?us-ascii?Q?O6uzG+iFD2VVUtCfr4ugyvsnIOwlHhcMB3tFVs3EpxbPWHoBCEDseOS/ljpL?=
 =?us-ascii?Q?7GgMmsqrqg99sb6zeIzagUDTtBKJIy0AkLSGH5xoKZUdhGu1y1Ds7cuAdAqG?=
 =?us-ascii?Q?ch1uEIlIDF1d61qb5YBQ7Mtlax/nT5BzPjvBGOs+CIBIGfp5NQpa8ofr74tm?=
 =?us-ascii?Q?a8DzazwVkyjCVE6DqpiFJyb0SRVc9t3bFdivxh/fkGLZExMXH+aQi+DWLQf8?=
 =?us-ascii?Q?meNYUQKdPhNkHn5Ztfsmni6V1Y91I7+t1z4k5XWJnmmLcYIzylTfRPfLftNV?=
 =?us-ascii?Q?WfppRGqMw2uVcS5uIEpq6j5YpRqC/XNE2amGqOfdr6c8CuaEXMdXJz27wUtN?=
 =?us-ascii?Q?6srxQt1auxHPYM/WDAopVIxR5sk2zidg7D2YeI6Cwic4jOVXdYC33Ww8B5bm?=
 =?us-ascii?Q?TPS327r/g7+9nknM6/M28TFU2qbnkvvMTq07fxK5N0iKXn1CtGlUDooPLZM2?=
 =?us-ascii?Q?wRvsdyTURUotkv7CbTqRHlHfmPBzz9dLOqxZMUOPGvoDYPiMIdvSKNO9UuuJ?=
 =?us-ascii?Q?RcpL8pbrKuFu+E3dK5CukMcrzybmbpbic6gi5UlwsVu+qlWb93WTI9LVdv21?=
 =?us-ascii?Q?9fvdRtcA9Urz/ayf0JPGEEQ3dOkJExAdl9dqWwx/rfQQolftS/SYipTUPy9p?=
 =?us-ascii?Q?YuxlqOPTMhbK7Fm6E2sKyPO1Tjcl8GKmaavs87yOUZXUir0Gx4dSZCJ5cUF2?=
 =?us-ascii?Q?c5y+0tw63YuJklrTerpsMsLuYo7q4eedYfkas2ZsIi3dpCW+ikMrxk4m9oql?=
 =?us-ascii?Q?rmHEumuFx2EReeUdRBZhYaQGF2r4HtAFCKld5YHi4xET9WMhTBhqpF6qTesa?=
 =?us-ascii?Q?zRO9MgdOU9CCXSokpeN9D6JX83A6Q/0W85J4BTOONbmM1QIc3GMbb22XcPCs?=
 =?us-ascii?Q?7rV9jwjII5cC+ngkuFLLbeb900Syxd5Bt2LUoOlSxRUMwS3lCoL3uhZ2WaU7?=
 =?us-ascii?Q?mAOgBjV9ZkUbFcM3RQIdOFTwDVZ3cqsiUY013Ewa5k7lLqo6ttz4hoiASzTM?=
 =?us-ascii?Q?XQpcQVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joW09tOUhtV0WHp3S58tXwqUuo/OzzfFup4E09he5hBuH5kRQZ9D2WetZgFp?=
 =?us-ascii?Q?qcimMvD7JIoYCprDHxNHsGUWn1ezmUuztv5NZ9OxTgYItgurPo2Q1RqE03A4?=
 =?us-ascii?Q?Wq+T3JEtjxpXAtmb3iKTG6jRs2X2KcGxXh4pbhwsNEeokkOdQtlHw/QdavR8?=
 =?us-ascii?Q?Q3g+V4qUawugk/K7i8Z8oYawDyx920uMY8382xXLqmgeACY55lyzW2HfiQkS?=
 =?us-ascii?Q?0M1HWo5SPG6iz/MirkV7Yk96aFV2UcDwOIeAozh7lZmoFqHcs+UyEjD6il9q?=
 =?us-ascii?Q?o6OuLJMoRQ/OPDbR5g0s8jZ1G6t0Fz04fDnn9NOGFv+J8W0GRHOUOgjvSlMF?=
 =?us-ascii?Q?7MeFKK3o4v9bFGsZ1BNjyNzG3wFg0afydc+O1rRUzjpyVkvg2/oR457mScue?=
 =?us-ascii?Q?ksmxLGVxEYnECvf27XsOiANVE+2ezke9bG9rMXVBiOYrmK3Xrelua1PPvr9b?=
 =?us-ascii?Q?uT7AiusvSfrhekRjFu+e/jNA6ASrHnxiFfEHxhhC/AvBnlbzLGhQ/ZTz6gnu?=
 =?us-ascii?Q?omH2ZpVYsYJ5t3XZXrStVIyLy82bq9zfT4x15zUrkidUgUL3PpydahIl31j/?=
 =?us-ascii?Q?GR8bhF4XPZ8ELn/Y1Rmoad53eMycaItvpXB+KHptf+v5vNkMCNAorj5/2hdm?=
 =?us-ascii?Q?f9YD+SS30qohcfz3IGzwhLm6Zua6UEHAPpu3tvEmNniyCTEfZVl5BRNU2F0D?=
 =?us-ascii?Q?wGkD5CJXIQNykAPJYulzA8ALs14yXitTKhDFTZuhRgalFBh8od13vm2e2DNG?=
 =?us-ascii?Q?GkTnNER430O6pdca7ohUGjeQu6jOAtPDxVRSEGE+9PsgK9kLT1MNdPB6sPnn?=
 =?us-ascii?Q?Kf++D7UQDqC0e2fsYosZQxkdsESDyf8m2J7v3Uwf9Z09fHBvPlfAU4yCFLn5?=
 =?us-ascii?Q?s8bLHmoVePH7gt3Dpb8OVL5pOrdGx2ur0h7IRbuwAdUyy6d5ZqwXDTd+MDMA?=
 =?us-ascii?Q?qZVttTBG7xyqk84lmglzOn9vy59A4QyEzCELa1oJ+sk1o7dIB7PNXNu8GwmT?=
 =?us-ascii?Q?s1QxlObxmCVaBumbmi2GF0WFLbcNi4RBuOmsHamUtlpZ02yDvmckLUqUr4+j?=
 =?us-ascii?Q?wr0RNssRavlBOYqFGsyfHHPJryFYNELIgiLUTnCpsiN1rcYMD+kJfHHOQ44M?=
 =?us-ascii?Q?T8UVij48+DifUJQHJ9Fs7vVUW2LZdAnEtBh7LQT2PrZBlrG05IRbB7Fbcgdu?=
 =?us-ascii?Q?mwCc59/Qzsp/8b5dy7r1tOXK5socN2viYJ+eupjGeXe4K+an/FOKPeQ6SBeT?=
 =?us-ascii?Q?fpXyq0kzC4158oIAx+vCQFK2w1pJEQMQTMBEdwadBcXdmhW6CUJMQXXGdpBs?=
 =?us-ascii?Q?qzVHubyvz8vk6cBkSWMSFUKn6LNWe7vgfVitDj6cffttBgF9mZ7iiDHwBa6o?=
 =?us-ascii?Q?tysjDKLAYZhkItrXKsHcH0K9zULHVz20BtL2heBt4cTctyV6ds98klhAnNls?=
 =?us-ascii?Q?4n5wIkax4RudybKXkM/eBEpHxFW50m4ff3cbsoHb3bE9i3W7TMgI4Ca1px9B?=
 =?us-ascii?Q?qOm2LuN6ycCszHLfladL28BvJ/2FBEJOgciyb95h4hPd0TUAWM+UxPM7Mn2Y?=
 =?us-ascii?Q?6EsM0466IeaiYWg2aE/NbwmW3B+bqnL6teb3OwVJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c34d2a-0926-4a1a-8af3-08dca2547b6e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:24:51.3326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g34BSq89n/4kQ3lUMPZredtZHJynIakyiVoMoEk6UjaINyif1P6RXMYSMuz5aBKIaUcWvZDdj3gs10LH1vuXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10289
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

