Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522C92845A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF0710E1C5;
	Fri,  5 Jul 2024 09:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z3ixAxAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10810E1C5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8xmHBnwj3uoszSXgciNKM7EqSu7ZPLQTNnuntEVA6RQVxZIio3MJp3Fi8uxwW9uI/qnrNsSbfBGSHdSCetVYOQJQ4ZugWdsRhfQNA7LgnUbA2LS9Nk7zZDaRqE203Zt6D6jsBYB0Ry78R3sjs6RuCn0Ofj3Hj4xk3MEc3aZg5BN2LSkkzptLpUaAoSk5TqxM7IC/ixBI/nTnvPN5dPUSqXU6j6FZ04K8yo4rfqOJgDNvLXBfhvjWa6SMRNQAwXPuXKq1wBSLeK1FLqQ0O9lgBbe6go3WcX4MIA0TCZ82RpX2Acbo8GwoEENX86royaCHPmXxigopimnqj3AWWAu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZAptmPe51rTdPCzzBOBzkwam0POn6Ee486LLAmiX08=;
 b=WKzSBFe9UdntdFI0ZThyxt+tta5cnk1KfSG3DMegPAcUzDC9QMpGUw7Pq2uZFbTaxHA8t5Wetp+ahp5jRLs/N6B0KKoGCXFnEVnUSxBGl7EFCDY/i1FZqFWq4GTLRn0rts69DQBud6+ISG01jOWteOHskVM1GIgXLBfdvniGe/Os+RPQuT3zW0LADThtZClI3EtwyyGNjrOrp6PwtO5GqLdRRy7Zum5UAYkdAL2aQ3dyly+FFo6EhWul8i+1dMwU/X+Wc85Qk0VuZ8qLCbuKJJx2Cuicwl8tw0nxnd2c+c7zSqBNyM1ktKj9T/jqO5P+Rl3asg3Bzp2B+U1dGt2Mcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZAptmPe51rTdPCzzBOBzkwam0POn6Ee486LLAmiX08=;
 b=Z3ixAxAp7HpjRYfjeuWk2ul+c0aaK9pNmcuoHuO6GkYUl+a3RMWPVoeb9+8LUhbvMMF9n0puMIeoxVqEGgLVVBgh44CaZ52bRcL2Ho5F8Maf7TbclsQ6MN/tdLa8gla6k4sDRkWM8lp7sneGHybkM7BmxW3Lt46X7lpxBLf2AFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:00:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:00:59 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 02/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
Date: Fri,  5 Jul 2024 17:09:24 +0800
Message-Id: <20240705090932.1880496-3-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f825db7-d15a-4d83-03c2-08dc9cd0fcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f7973bJq7w3h7YU96tPyFvdwygimpctuR6r4Z8sxrsSn6Sx5y3hvy8xRzbbb?=
 =?us-ascii?Q?Vvxq749bUMNKn/KaHhqQ4AW0VYsDIEtcC4ThvghkUvDCA6IL0T8iXpjsFft+?=
 =?us-ascii?Q?g5qmSnujaz5RFb5lCofAJ0mkRDoSpL6eC72DJ4LNTdxQwugp2dn01x5dc59/?=
 =?us-ascii?Q?7P6E00ZE5Otnxu6VxSpBvQeAWqXSHD4yXobuwkjZ118JikNKOfU00MUOV4H0?=
 =?us-ascii?Q?fP9ji7Y3Xx9xGeVRhQsknS0iriQDhqJGI7JFFNpg1KxFz5l+yJhsg2ZRfs+X?=
 =?us-ascii?Q?anEPag1Ap23AcTp6GcKwIbwnVuvtzVLlsCn+RzC5QfCUm3qzdgtLkRDSw/ki?=
 =?us-ascii?Q?onoSRuWQR4WG56PFhMDjbacIJ3xKf7U3wPlZv6qQXG/a5GKOXj0Q3GfmHbcc?=
 =?us-ascii?Q?JZNCaOd2UcMwxQATr0avnoAJUQi/1b5bSn3M5Av2iCmaQL5swYq4qyAYihUK?=
 =?us-ascii?Q?8+oM17Z/HmA+gM+MjeAakFvB0MVBHVroHEIDxLFf0ZJjWxINEZFxyHD6VMUD?=
 =?us-ascii?Q?VhWOeENrg0sJZI6BQpfImQev6WTEIcNaOfGIoPcRpQFXflZy2VsHKTavgBU/?=
 =?us-ascii?Q?NAeXawt88IEGc4QmYBpvkWfxHgeT1VJPmDGUudUtY6b5NgQa+h9pRI9TPVwj?=
 =?us-ascii?Q?acnnYH+CyPj6ijrjmbGJox7uMTa8Zw9NILwscQgjEEerqS6cZFiTfoEcmG5K?=
 =?us-ascii?Q?3DZ7t9DVUsCr1GVDaFUkX4ZKiQgzC79Nz0d9xah71alDbcVIzVlVryMbO8G8?=
 =?us-ascii?Q?5AW1c0SW9iPqgWamEpGrgk8QXDWMRRJZ55EbJgDNjXC//0918HE0xwVLS+Yo?=
 =?us-ascii?Q?pmmuixpkIaRCYVcuJwJ2blKAO2eVy7ku4y0bE+V880/RO7q1LAwfLrm6KhFw?=
 =?us-ascii?Q?1PAHJHiWuMiY02N3qfS/6kDCay7kDR4ebuZa1zMLHckGltawkgTq4F4irSgQ?=
 =?us-ascii?Q?7apC22uPjp4iIruMJrqrEjGlwlbmD1IATRQiytNwdomOhxut2lEi4zAtu8lu?=
 =?us-ascii?Q?0MiFtpyYMXlY5REvRVT/DZpXitEV43FlP99bpCauttpYZ93XNyaomQlpREEC?=
 =?us-ascii?Q?NIbqyh4oAZ4SYCMeTIAWYpYw1bbZYICR5BYxph4mC9QKnvjbVtTSrT/1DH1+?=
 =?us-ascii?Q?wC1GLEKXrDblUbVgJU31n83lBpJmmZzKY2Wqlj6oo9GB/QEbwEilYVnsuzUT?=
 =?us-ascii?Q?xv6kC0K+sSB7lUQKeP/JUgqhuxt6CwjeN1G1nuPPMqphzELSFCHcNVNC/ZB5?=
 =?us-ascii?Q?aNe1Fpc7YfFrJ+KU2MmuOwBLEk/RvTeSRUSFSvxJ1X9i+hLKYXToh1Gq0Ex1?=
 =?us-ascii?Q?yRjIdXPkLnM8hzmgqJOiXXRlzpRiASPPlyEo7As3qXnDXW7xac/K8kJQHOhx?=
 =?us-ascii?Q?HU9TQm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqDrCMASE+7JnpjgnSuVD+tyxqe/FqjI9fFK/SHDtEoBGcFcCySRjGUjFuT4?=
 =?us-ascii?Q?0l0R5Njluz2wH1s1L0eio5X2b7W9pU8bL1FxqoWUiKpdHCeaS6pZpQcAOsbN?=
 =?us-ascii?Q?ghHYs9hFNDjazxhdoHe3HgBiRVI5y6uWd1vBywGKAVzfO0l2wo7aQfDDQGGk?=
 =?us-ascii?Q?01dcYQf9EyOZtO3MHCW0E4MdYTK4j2YkLur26j9nRJRRCQjT19eyEuXjYSnz?=
 =?us-ascii?Q?0D0De4st5SHajqj2INhEa2PjQ8qLnDTct7QxBMFX/FRnnyOhl7Alj1VD4BHo?=
 =?us-ascii?Q?cN53dcnDAK+ld/hKbX+La8JRpMJ3JdVQwDpv+gsPvvwd5Ghq4LLfOrB5WIOe?=
 =?us-ascii?Q?crXo3iJp0odahhTBH/+H/0E0nNWZBnL4QdABwNW7CODuHQp33BO+UKKhTKmL?=
 =?us-ascii?Q?tiW2tb7cb/eBaWsemZpQpfzovUWyDUomzSPpubqWR7vGDRLSaP41UucPenU3?=
 =?us-ascii?Q?ss9XNgLoj/qSu7s8lO9o8I2QILlLqsPdA838DxYKf/ArCG40LCmufPMoMvqu?=
 =?us-ascii?Q?ZD3t0y2p83Z7OwpROqy9AOVyj6bh68dX2O3aOC8vnGs9lDIy7XSp2rOBJq0h?=
 =?us-ascii?Q?vU/S4rZl/DAe3KuvZtm5vbzyZ3Z4vah5henu7RZwWsmYjDvPm/5HAJ+0xsCd?=
 =?us-ascii?Q?OhLbLKC8UaVgpyXT8lDXmNrRoWUrBfpoEjLR8hnM/MIke/cnrQPtsPdQsX3W?=
 =?us-ascii?Q?CZJjOjm85/v0gL7rItd4m9D4gXlt0HBF904PiH9QRCyhcOrH4WOsjnPve3Gq?=
 =?us-ascii?Q?sSnTqT2YsY/p9QJPLN7uQ3TnVhKr7pLXJ96Y4Jzp5MqVrwDL32tnJjIl6U/9?=
 =?us-ascii?Q?VExsZwqbq3AF7SA53Fa9WrkGaKplLh9Svh11jtWkTnJwNno9Gra6jAh8vDEe?=
 =?us-ascii?Q?zBM5YFb03PSYpizLQ+Jrgl9eWDOmAQTplX0e6OleESQFIYGme2plv03irnJ7?=
 =?us-ascii?Q?0ppPduJa0C+vaZ6/U84JZgijZRe78tYKpSD7TqY+ECiHg7X2rKqbJbLDvJkH?=
 =?us-ascii?Q?erUdRY0bOYs8VrPD5fUVKro+K6M+CC+YJKqO7OORUoKV52KQHBWMqaBMVQN2?=
 =?us-ascii?Q?sasT0tqDxlaMKay0t58F2Zl9G8nXETh3HJi6tUy2DIt3TUuKp7vOdN8cKzmd?=
 =?us-ascii?Q?/4ont7J3oz7YvqhacKykT0Cx15/Lw1nzv23OtmaEEn6PFuho9d7GOo91GPy3?=
 =?us-ascii?Q?4nauDn1v1UvM3iXlWgcwtyD6v4zW/iRD9fAXS4uY6EMd49OiEC7+xc9or5Rh?=
 =?us-ascii?Q?X/mCU66/3gQBu19xdbOfvwthEYm9ENQ8TyCLYAOGHGzqTT6E4PJlw4RLrPyq?=
 =?us-ascii?Q?84gJMCEPp2yvimVET6bArE5I6fOr1AMxyWR64pGrGOFGqwELcnJG6TD23aMX?=
 =?us-ascii?Q?Z73dGoZs+LoMJbiD02EZXkXHuBzSSjyJgH+qR52vw7A9+dKQPYejYIXg4AvW?=
 =?us-ascii?Q?IK2JCOCpSM5rMAfeedNwbQaaLeyD3iatMFfXDyevTDVOI+TkOILbFez5RUlp?=
 =?us-ascii?Q?siWkjIfNwrhrGXD3o+KcAsbIBahwRgQunlYa8HMbemjjz4EX+KPVVwJvYOwY?=
 =?us-ascii?Q?6IGY81x/epJFCgVVkmLOPz4AEQvUERcjYuQIWXE+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f825db7-d15a-4d83-03c2-08dc9cd0fcda
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:00:59.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: odU7V9t4+XpuVRPbopL3Cf/ykawM5+JiSidi6KT0YKxgr+K2LbYcPUYZKaxH91pbJOxted/XvCGxJmQv1BvvJA==
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

i.MX8qxp Display Controller display engine consists of all processing units
that operate in a display clock domain.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
new file mode 100644
index 000000000000..dc9579897b76
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
@@ -0,0 +1,166 @@
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
+  fsl,dc-de-id:
+    description: Display Engine instance number
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: video output
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
+  - fsl,dc-de-id
+  - port
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
+        fsl,dc-de-id = <0>;
+
+        framegen@5618b800 {
+            compatible = "fsl,imx8qxp-dc-framegen";
+            reg = <0x5618b800 0x400>;
+            clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <18>, <19>, <20>, <21>, <41>, <42>, <43>, <44>;
+            interrupt-names = "int0", "int1", "int2", "int3",
+                              "primsync_on", "primsync_off",
+                              "secsync_on", "secsync_off";
+            fsl,dc-fg-id = <0>;
+        };
+
+        tcon@5618c800 {
+            compatible = "fsl,imx8qxp-dc-tcon";
+            reg = <0x5618c800 0x800>;
+            fsl,dc-tc-id = <0>;
+        };
+
+        port {
+            dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+                remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+            };
+        };
+    };
-- 
2.34.1

