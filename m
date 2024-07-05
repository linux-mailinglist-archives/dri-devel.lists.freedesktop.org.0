Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5408A928458
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4410E118;
	Fri,  5 Jul 2024 09:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bNTAaoWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2BD10E118
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbzRVJtLdfRfGn1zbZJExTW0Tr9+1Buxd7XYPKyJGg6u4krqu3yMW3sbjbch5J8d6uh61Gv2A8oaAxem4ww6PrkzaTU9Frt8UNxaltBNPSk9R+SwPehDzaUrS7p97+4Z1/og0H5oK3VkWrk6ooKQD3F0KNMoNtHj5gqPjwPFPhgf7/Ca4bhH1r9h2Fb7io0Gk+VTiz+WonWjyTpkTqmJHtvupN6Xzq4nqdSvp8jDIrtWM2NsW1Ghffz6gCF/ITadX44bpT6Z1Ep224m2iCIOif07MmuLixIfYJlIg2GRCNnhLAbkfauDDndxvwhnXrW1hYf6GxOThU3I3blGcZ3DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT6lKM/DwTIOCTJWExf9s6IRdBvwiaST3MXIu+A34Dc=;
 b=ChDwe4/g/jLCNpLv330/eSInmEjrZ3Bi9o945nHdabvUeAlkRXokqx+98enlcy4g/j59QwzPVUBUmnsm4wiPJwU1mJVbMxsZwosXcdTPAYAf9qHXoHdhwh4rlrKpc7vDsobM2nzHLNvFWq8G/pX3jSjvtA0xx8ZTFPgXiW1+C3AUo7sop/NPsMjwIzITNDumqJdutrI1hozBVgHAA1R/vsnmdVHMiZYM+q3rrK+78cfrMjmyk7hDx+wrFJFBDEtWaBSreEaaP3nnRxWulf4kl6dD1oCBJbfZNY/j77rRo3XfKVe4yF+S+AQPRxaD6ObhgxKM8hIeqk+AOxYARHtdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT6lKM/DwTIOCTJWExf9s6IRdBvwiaST3MXIu+A34Dc=;
 b=bNTAaoWWdMvNO5Np5hutGAkyK9QGNodD9aF6Br4H5iGaYjKmt6Mm7A2WVNpORzxy/PxlNKrn0QIY/qpPzyFvd67X1mi7jkAhNkePMQAYFKd3SouB28Ni4lq+3mtNyFiOom4+UmAxtqHHVjTcz5k6UMHr1HjzKV44mEuKXOdUEZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:00:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:00:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 01/10] dt-bindings: display: imx: Add some i.MX8qxp Display
 Controller processing units
Date: Fri,  5 Jul 2024 17:09:23 +0800
Message-Id: <20240705090932.1880496-2-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae038fe5-fec6-45ef-7cff-08dc9cd0f8b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sclk5AjdlXu0LsEZgJZfYA9h+fV3/EPgqpLMenqzmpt+2fz5LwXWxSFBl03u?=
 =?us-ascii?Q?WCJk2XopNuXCGciR9xzrlH2PaezL6T/qFBPwUt1EfqBnF79SCP2l/ZF+QVc0?=
 =?us-ascii?Q?ZlS6oIzAyxZ+k+sGl0NIU8J5dAlxit5/Xs2bLynPLCOcr3vc3yRVy0mTX7Mq?=
 =?us-ascii?Q?D22jzeVVujLVXnsM8ZkUpJQ16t8ui4yRpgNnTkDFGBnEau66mm/kFDgF07nP?=
 =?us-ascii?Q?3OFZinhgipCOLZfedvhVPeGSEZ/5TtQclLrG9BhTrNhTtd8EG9mlnzB9fn8y?=
 =?us-ascii?Q?ugXNVV4k6AjHemAc66RNKUnUc0km/cu7l5714M+E96GqJpFWF0H+SJfR4T9u?=
 =?us-ascii?Q?GxgbwXvjQMQttiNqD7u9t0JEA1kimYo2bmavLNbRcWEwuBqtDDkUgcSr0Ksz?=
 =?us-ascii?Q?d7Vz+XZlUHg2aLpR/nul7Hkdv2vh2BFXMN/rSB+rAum8TFthYcMHaQAgAyL3?=
 =?us-ascii?Q?oJkYNEthHaNPNC41ucDtHu7FHmHvf5xBd/HtWixFdTn2deSFip7tVze0mf3u?=
 =?us-ascii?Q?1JtByndMqhHGJ2o5aLXvDQL7veOAJbS9Dlar0wfdOrem0wKatpuOQ2PQzxsv?=
 =?us-ascii?Q?xJFYCErVdwJFHRv8jbiZ5V4HdhCRUJ4LSlVdeARYFxBcgVtJ9wZeDHhdZBCC?=
 =?us-ascii?Q?yhUyaD7nWFNd6r5/eX2EZHBea/TpH8Sho4ls42O3U3kpGDfzlq7OjoRCv+tt?=
 =?us-ascii?Q?tzB59LqzmsSnYzxfC9avMp/q2+MJZDtSTfcQ9SOx/Hla4TK9AF3lH7lP817G?=
 =?us-ascii?Q?EUPXbagXlqUf6ISp3FGIpVTsulJ88bn7//OZk/voRbycDRDwhXGS36PkhL3b?=
 =?us-ascii?Q?zWoPHHjWBYt63fKAm9IgtkWJbJvmX/NS4xx3Xzf7F2paXM0oF/LxoP4sYqkm?=
 =?us-ascii?Q?HooIEqiWDNKHTmJ1vKFpD0eGZOgqbW/nQFQCCdWjsZ2LOeLzGNKuzecV5dHW?=
 =?us-ascii?Q?VBuPxYrVmiBBNn3SoKPKl1XlBnQYKp2WwYKGIbTFKDay8cKrF2B41rm6euQH?=
 =?us-ascii?Q?WfhPcBg0gkaoRhNp+OmqxY8/vuYCkAmOcMiUXPcr/yJl9m+ozjP7pPn0+npJ?=
 =?us-ascii?Q?FvROdMEXfzHdAw8sM+u7YCjZARwdct6AAHDMg2a/lm3ILa690yQhHK67avM6?=
 =?us-ascii?Q?PP1hOEOo0DiKwpQgp0Duv8tJk6Yg31fuFTEG6aHtMkV6sZn98lppkuHBEqH+?=
 =?us-ascii?Q?70S6dxs7GGE6FQoUR4NkK61t3/Nmbc1FXWyIeKL58NI0ehell/fDBMjVRpEV?=
 =?us-ascii?Q?l4aCFMZABVsPNmwpxZqN4D2t1s+PdVBsv6z5TxMjhU2urj3yc8t2x/3OCEZY?=
 =?us-ascii?Q?zwnq55KHxY1ir6+bUNYWWYQ3aLrQjXzA6oEP+AiWRCaBJoPE+vax1BznXj75?=
 =?us-ascii?Q?FR2sUko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmgMwoxxdyOiBqquIV5Q0L71nTPQfqE0sXnlWbwX3vbM93vIyc3UJ1wtEE+D?=
 =?us-ascii?Q?Sb5+XAzzxMwMswPnmFaZO2dUsEc+wSmAmv6IA9fAazfBKqnj0w5ygwBnQSow?=
 =?us-ascii?Q?5NqCsLswtXpCeLWTeEF1yE6lYml7dAIE0ymlNEhbOvt5nj6dBwWPF6swbexM?=
 =?us-ascii?Q?5z3ar17cxlNzhNZPMIcMCtf4kJUuiogwXJFwpC7ptmnPIKIvkgIm+eoApckj?=
 =?us-ascii?Q?Be9YWGfsDSsFU8J7ITJhJ5wAY/DqkNHr2xrSMcHKpcP1nkflcKj4tCZmE2kz?=
 =?us-ascii?Q?+SaNBuu4tuaymQ8pn3VGyn/51dg+tK5yp4mJd94WoTxywx0T7s5NsWpUYcTr?=
 =?us-ascii?Q?/ygFdUoMrvA5NASbwPfMqZSV4NJcZF2SNXkIVhpEUG6kyuf5DUV60QdRq/2M?=
 =?us-ascii?Q?9FUwfos0C/5NI0+gX/is/ZIOQvaSKuFi+NdXdOVWjts96OTpb1ySvvj1fYZe?=
 =?us-ascii?Q?sJwdlaXUxH7V9/CSSGWXaGvK+r/5Zd/RJctn4/oNsWRMzGtOWWFRWc0WxLL7?=
 =?us-ascii?Q?sNvDwywv0PNe2r4MthcG5n+oq5Zh4omj9ZVwgcg2RQ9iT3dy/jaeOnh1GEmg?=
 =?us-ascii?Q?lIlJFCyoVINGzgBpu7x3nWI1uEUFPx8gLXKkUXtavsaQxV9SLvhQKbuvQiox?=
 =?us-ascii?Q?VHENjGyUbyp/c9q+Dh1ld9T9RF/uWLkbAUfucMKq/nQn+Rls30u5GBhvf3ve?=
 =?us-ascii?Q?5gfMtOynm1rkG1BzeRqYnbSGUAtCns45DoLa8/gGiwrbSAdXKThjFplZatsS?=
 =?us-ascii?Q?gPpTNVSJNOY/I9Drhl/gJqByp6xlAwqkvst1GmDlFPEyNHOO1WehLR9Omzde?=
 =?us-ascii?Q?CnZkD33xxemBmIFpBpjfVFYwJSwjR3BZEYJt93DbwGuFupAQNK3z4bFbJXBw?=
 =?us-ascii?Q?QhKA+5ThGyD7M3zWG1js82fbtciPNOP7AVCODnFZPQ+fAP9D5WSg/715c9IK?=
 =?us-ascii?Q?wP4TlyRaUlUBg9gDifcwvfhYwua+SkWN92LNhAYEsHQx/6sS8TEXeYKwsHdw?=
 =?us-ascii?Q?LhGny7sJ8nL3HWcKvNd6WiM2yUUt3XbdODjKR36OxuAlA1LzC6f+OLG+seoS?=
 =?us-ascii?Q?w/ggP/rp3b7dG3KtGGAsoJ6KjtNnIr7Hke3Tbdr7VBj8m57ElhF8oioMl06c?=
 =?us-ascii?Q?+ZUyaIUK+33WkaaN3mEgn3/29mfepIwI6u55xNjivsnqycwPnTtpY9DQb9Ta?=
 =?us-ascii?Q?Ojna9BYOxcxvB/hDgB3XR0Jkj2xQiaXzIuCkOpkGuFxMyNEHXF2e+eWJ61Le?=
 =?us-ascii?Q?7gpU2wY5B0KgzNe8Ix/8DSdqkjYVsd0iySTvxgX2wNZiP44fpVVnvgxAUErV?=
 =?us-ascii?Q?3TOswFlounkoWVvPVUbfCSZwIHdQG7/oXhW2+Z0HkRFbVXMt6MnSeX8/hP0b?=
 =?us-ascii?Q?qfJt0Gt/eLwRGxtQswGgqxbWB7CyqS33wKp3R83cp//30C0yPsCWza+FD+c8?=
 =?us-ascii?Q?+1GC3GzDfRN8IBHs8kPaI20rVpqEdGeUg75DXtsDQupbZxdv8dtrW8TwUi/z?=
 =?us-ascii?Q?hXzkuM5Jqy6LOFA+uMo4Xy7v/Yf0a/rdMBqD8FCZSOefGSXuuS76zC9BSM6s?=
 =?us-ascii?Q?68mTToYgamrDWioLfUNbeswwE+ZSBj0BHqbyINzb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae038fe5-fec6-45ef-7cff-08dc9cd0f8b6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:00:52.3872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCj7bRH4DQRS3/PF9ANBzfJ/J5gI0EvTIdRcR68ZFbeZv0iVIBjNZe0+q4/2yrp5SmpitGUBfQBX7UyDsh+clQ==
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

Freescale i.MX8qxp Display Controller is implemented as construction set of
building blocks with unified concept and standardized interfaces.

Document some processing units to support two display outputs.

ConstFrame, ExtDst, FetchLayer, FetchWarp and LayerBlend processing units
are in pixel engine.  FrameGen and TCon processing units are in display
engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../imx/fsl,imx8qxp-dc-constframe.yaml        |  51 +++++++
 .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  79 +++++++++++
 .../imx/fsl,imx8qxp-dc-fetchlayer.yaml        |  37 ++++++
 .../imx/fsl,imx8qxp-dc-fetchunit-common.yaml  | 125 ++++++++++++++++++
 .../display/imx/fsl,imx8qxp-dc-fetchwarp.yaml |  37 ++++++
 .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  71 ++++++++++
 .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  46 +++++++
 .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  41 ++++++
 8 files changed, 487 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
new file mode 100644
index 000000000000..80f826289309
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-constframe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Constant Frame
+
+description: |
+  The Constant Frame unit is used instead of a Fetch unit where generation of
+  constant color frames only is sufficient. This is the case for the background
+  planes of content and safety streams in a Display Controller.
+
+  The color can be setup to any RGBA value.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-constframe
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,dc-cf-id:
+    description: Constant Frame unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 4, 5]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - fsl,dc-cf-id
+
+additionalProperties: false
+
+examples:
+  - |
+    constframe@56180960 {
+        compatible = "fsl,imx8qxp-dc-constframe";
+        reg = <0x56180960 0x3>, <0x56184400 0x400>;
+        reg-names = "pec", "cfg";
+        fsl,dc-cf-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
new file mode 100644
index 000000000000..45957db3aadf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-extdst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller External Destination Interface
+
+description: |
+  The External Destination unit is the interface between the internal pixel
+  processing pipeline of the Pixel Engine, which is 30-bit RGB plus 8-bit Alpha,
+  and a Display Engine.
+
+  It comprises the following built-in Gamma apply function.
+
+  +------X-----------------------+
+  |      |          ExtDst Unit  |
+  |      V                       |
+  |  +-------+                   |
+  |  | Gamma |                   |
+  |  +-------+                   |
+  |      |                       |
+  |      V                       +
+  +------X-----------------------+
+
+  The output format is 24-bit RGB plus 1-bit Alpha. Conversion from 10 to 8
+  bits is done by LSBit truncation.  Alpha output bit is 1 for input 255, 0
+  otherwise.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-extdst
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
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
+  fsl,dc-ed-id:
+    description: External Destination unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 4, 5]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - fsl,dc-ed-id
+
+additionalProperties: false
+
+examples:
+  - |
+    extdst@56180980 {
+        compatible = "fsl,imx8qxp-dc-extdst";
+        reg = <0x56180980 0x7>, <0x56184800 0x400>;
+        reg-names = "pec", "cfg";
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <3>, <4>, <5>;
+        interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        fsl,dc-ed-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
new file mode 100644
index 000000000000..d459573828ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchlayer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetchlayer
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+allOf:
+  - $ref: fsl,imx8qxp-dc-fetchunit-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-fetchlayer
+
+  fsl,dc-fl-id:
+    description: Fetchlayer unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 0
+
+required:
+  - compatible
+  - fsl,dc-fl-id
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fetchlayer@56180ac0 {
+        compatible = "fsl,imx8qxp-dc-fetchlayer";
+        reg = <0x56180ac0 0x3>, <0x56188400 0x800>;
+        reg-names = "pec", "cfg";
+        fsl,dc-fl-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
new file mode 100644
index 000000000000..a7a568672dc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchunit-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetch Unit
+
+description: |
+  The Fetch Unit is the interface between the AXI bus for source buffer access
+  and the internal pixel processing pipeline, which is 30-bit RGB plus 8-bit
+  Alpha.
+
+  It is used to generate foreground planes in Display Controllers and source
+  planes in Blit Engines, and comprises the following built-in functions to
+  convert a wide range of frame buffer types.
+
+  +---------X-----------------------------------------+
+  |         |                           Fetch Unit    |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         |                                    |
+  |    | Decode  | Decompression [Decode]             |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Clip &  | Clip Window [All]                  |
+  |    | Overlay | Plane composition [Layer, Warp]    |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    | Re-     | Flip/Rotate/Repl./Drop [All]       |
+  X--> | sample  | Perspective/Affine warping [Persp] |
+  | |  |         | Arbitrary warping [Warp, Persp]    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         |                                    |
+  | |  | Palette | Color Palette [Layer, Decode]      |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  | Extract | Raw to RGBA/YUV [All]              |
+  | |  | &       | Bit width expansion [All]          |
+  | |  | Expand  |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Planar to packed                   |
+  | |->| Combine | [Decode, Warp, Persp]              |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV422 to YUV444                   |
+  | |  | Chroma  | [Decode, Persp]                    |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | YUV to RGB                         |
+  | |  | Color   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Gamma removal                      |
+  | |  | Gamma   | [Warp, Persp, Decode, Layer]       |
+  | |  |         |                                    |
+  | |  +---------+                                    |
+  | |       |                                         |
+  | |       V                                         |
+  | |  +---------+                                    |
+  | |  |         | Alpla multiply, RGB pre-multiply   |
+  |  ->| Multiply| [Warp, Persp, Decode, Layer]       |
+  |    |         |                                    |
+  |     ---------                                     |
+  |         |                                         |
+  |         V                                         |
+  |    +---------+                                    |
+  |    |         | Bilinear filter                    |
+  |    | Filter  | [Warp, Persp]                      |
+  |    |         |                                    |
+  |    +---------+                                    |
+  |         |                                         |
+  |         V                                         |
+  +---------X-----------------------------------------+
+
+  Note that different derivatives of the Fetch Unit exist. Each implements a
+  specific subset only of the pipeline stages shown above. Restrictions for the
+  units are specified in [square brackets].
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional Prefetch Resolve Gasket associated with the Fetch Unit.
+
+required:
+  - reg
+  - reg-names
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
new file mode 100644
index 000000000000..5613f84e6112
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-fetchwarp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Fetchwarp
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+allOf:
+  - $ref: fsl,imx8qxp-dc-fetchunit-common.yaml#
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-fetchwarp
+
+  fsl,dc-fw-id:
+    description: Fetchwarp unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2, 9]
+
+required:
+  - compatible
+  - fsl,dc-fw-id
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    fetchwarp@56180a60 {
+        compatible = "fsl,imx8qxp-dc-fetchwarp";
+        reg = <0x56180a60 0x4>, <0x56186400 0x400>;
+        reg-names = "pec", "cfg";
+        fsl,dc-fw-id = <2>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
new file mode 100644
index 000000000000..3fe666f35a1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-framegen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Frame Generator
+
+description:
+  The Frame Generator (FrameGen) module generates a programmable video timing
+  and optionally allows to synchronize the generated video timing to external
+  synchronization signals.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-framegen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+      - const: primsync_on
+      - const: primsync_off
+      - const: secsync_on
+      - const: secsync_off
+
+  fsl,dc-fg-id:
+    description: Frame Generator unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - fsl,dc-fg-id
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    framegen@5618b800 {
+        compatible = "fsl,imx8qxp-dc-framegen";
+        reg = <0x5618b800 0x400>;
+        clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+        interrupt-names = "int0", "int1", "int2", "int3",
+                          "primsync_on", "primsync_off",
+                          "secsync_on", "secsync_off";
+        fsl,dc-fg-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
new file mode 100644
index 000000000000..7da26d5859d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-layerblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Layer Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-layerblend
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pec
+      - const: cfg
+
+  fsl,dc-lb-id:
+    description: Layer Blend unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - fsl,dc-lb-id
+
+additionalProperties: false
+
+examples:
+  - |
+    layerblend@56180ba0 {
+        compatible = "fsl,imx8qxp-dc-layerblend";
+        reg = <0x56180ba0 0x4>, <0x5618a400 0x400>;
+        reg-names = "pec", "cfg";
+        fsl,dc-lb-id = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
new file mode 100644
index 000000000000..32a57de1038d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-tcon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Timing Controller
+
+description:
+  The TCon can generate a wide range of customized synchronization signals and
+  does the mapping of the color bits to the output.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-tcon
+
+  reg:
+    maxItems: 1
+
+  fsl,dc-tc-id:
+    description: Timing Controller unit instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - fsl,dc-tc-id
+
+additionalProperties: false
+
+examples:
+  - |
+    tcon@5618c800 {
+        compatible = "fsl,imx8qxp-dc-tcon";
+        reg = <0x5618c800 0x800>;
+        fsl,dc-tc-id = <0>;
+    };
-- 
2.34.1

