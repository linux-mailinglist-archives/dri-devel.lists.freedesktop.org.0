Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A32FA90DB5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 23:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EF810E9C2;
	Wed, 16 Apr 2025 21:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="knJqFyXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126DF10E9C2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 21:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUMCJOiblyIecPpFCG/HaTRz6T/qGli2lo2g51YSAa1JSdHrRRnbLbUymvSm2Et63buIXHYinDMsR2+4lDmRK+q3+heP2pcz9eeQqGSneQb/88gBO3S9g9zxMD9eZmrSWUgwuqtgb9oZthzkXUdp7rpp5uVyN2aQPS3+nAD59uOePxhjavqdjG592ltTv1b6LlVaUWmrW/57hwBmM3o0Y+quV6bj3eccDrCvp5QVdGVxcaP4aAuTL7h/vNLitdtoCV9W77Occ91nk0Me6wlNkdw8vLbEzIcWIWmqC8QrRjEPyCOOagtTlELZqlkLFHKDu9HUk/NHpGWgAnZBjNwzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xoyyEf8/oJVB/YbJmAdCTuQVX+KwI7c8zxmwCOp21Y=;
 b=K6Dpkc41V58x/DstpQZb2tbBFNXe3OBytXi4kdUiCHm3bMfFTkKh5fukMV9r1rCZxxTdU5unSd3frBGfawim3R8+y1nlEdvrVro+VEcW/1h38LJTt+5jH5KemGUMT5k+61MdHfyAnGOIVTApah1/By91PO7KJ8hzSX7OMI8qXBCU36SnMuyCjQVFuCWPZ2KNJ5zJ6DxtsJH6XAgDKoZIgLqNPt858XHL2oI34Aj1gcyjtPXG+H/5CHs7c89rVMLNEswfWDQphnByrpdlxslsEfTgkhmJqX/ZgCQJ19az2Kh/+ojh9frFEVoZPUBsLBG9ddWKWZJqrfCAGEG55mFwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xoyyEf8/oJVB/YbJmAdCTuQVX+KwI7c8zxmwCOp21Y=;
 b=knJqFyXN+xQo6A3vOR8XACHwA5NPUYk67y8DPBguckJfWASeEnSQhMgA22hJo/fTHO/qy64v9n2ckcTqGSheo4N1nqZiKR2yYcFPzVFknbeAllmJIqX9U7QafzXUzgTuBvez0NIkXAN1OxVmASFneXf38NHne3cXjXaegPzlzBIPEvKqIIbHbOmhGsVVptunKmi8U+YnWXr6Fyn7wftb21lCoIG26p7YAeWCXWMLvyCDYLRiI552+l+3MU7aoujBSQI1HAM1Q7YxY7jc+fQX5M4jVwUHfllli7JUxECEG9tyALDr2aNDzcxp2tYmLMRZk8XAuTPw0zW9hrBNtw5lFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 21:19:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 21:19:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE IMX 5/6), 
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: imx: convert ldb.txt to yaml format
Date: Wed, 16 Apr 2025 17:19:27 -0400
Message-Id: <20250416211929.3502902-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0077.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 279c391f-cfd0-48cd-ace8-08dd7d2c69ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P1ojfrg0dG6BAVBce1NWuVkxGIexGL/zj7JORDPaXugH2EGK0aVkqRA4sts+?=
 =?us-ascii?Q?LAAXRcV0BeSaGRqhzubfV8FQ/VTzIdLSO6UjDWS8vsDF939VvJ81qa4RFg+w?=
 =?us-ascii?Q?GVrK4f5dqKAQTjL1u+N5JybAc3fUecoeMV8y5aFRNqWhzG4U3SgkzMr2/iiv?=
 =?us-ascii?Q?DgXYjF/zINSxwlby29aF5ePt8HpIPX6/MhEgylaxKasD3Y0C6Mccb2Fj0QMS?=
 =?us-ascii?Q?dgwDwIwdIYrC6Z64RO+j0KfQ2+zmN4UyZzbg3RxgXpJ9xMyxL+a+nlLAdyqa?=
 =?us-ascii?Q?+G4GUoIRb9wqZYrLNWre0zj+fPOJGTR6Z+MSjezZNqoKb/PogG8F77jojZA7?=
 =?us-ascii?Q?RG5+MspIa35mgewPY6m+w+God2vdP3zSVsB67NXWbMRugpEO1j1dUc3rermc?=
 =?us-ascii?Q?ioec5R2m2j1XVIflfIzupiuhxVNhdFelaZM0DB3gGYL4eBnPcPYfRUkFwZul?=
 =?us-ascii?Q?qHW4E6dDGeyfUgryAyt/Facr2Nk/QZaNEot9j7HZjvmzwSxBGnK7nJ41hByQ?=
 =?us-ascii?Q?7EGkZM2vJaGSNMlOSSDkplfQBJE4Q4XwQ/uFvmvsR8/dVfG2MyB6QX8xlHTd?=
 =?us-ascii?Q?Bl44FYLaKQ8JNXKNP+2aJrzsPjUnjmNNXLXMR6UR4ysMDDJOcZBtpI4zvrmP?=
 =?us-ascii?Q?mQ5UZGYoWWttSHKWDxr1cfssdetPQ6ICamz+MOv1cZ5woItZbXAy7ajQf8Vx?=
 =?us-ascii?Q?hftjwdKrVgXn+RjWdnwSwl5/SU0xbBkz3MYP4sFGqMgYIhqP6sxKxaeaFca/?=
 =?us-ascii?Q?baaT1pscGXYLGjIuaZodswfRSFnA5VL3XPI147f7I+8eGOQhtf8kzkvKhGXQ?=
 =?us-ascii?Q?9UR1Gm9/f/kyLJiBlHMOAf50S+pbayHyXnFv4m3N7LKuQWNhH66rRKcVgxD+?=
 =?us-ascii?Q?DcQpBZmgijpjmBJh6MLzxLH3DGykKhIrpO/ev/x2SJmUuxBUdh/mpvHwNC5W?=
 =?us-ascii?Q?zqbtDIWyg0fTPIyojQiArkjN6U36AuRuhHGlmRxgsI8ZjB7F48yi0M4Ujx1g?=
 =?us-ascii?Q?/TexT1NVzKRHx4wzD99+BhcsocVRcda2YdihZ+V6mAVF7GW8j1PwcIpfDcs3?=
 =?us-ascii?Q?KgVmVzNzlTsMr9/kgWEpaYjSrzyuMgHrxM/AlGl4d7Q5Gsg1JAKlDrWFDy23?=
 =?us-ascii?Q?SJUQkVwKuu8iCLWX5U92DqIQ4t4756CV2w6eIhLHsoVQ7stmmW6YXZTeDsYq?=
 =?us-ascii?Q?YWMqBPNPv6/SrBLLkaf9DfWXjKE8IWBuvDi1AeCYWDiblhxJnWuzL2rqzrsZ?=
 =?us-ascii?Q?tEug4I0BPwgemMM7m9vv+M5ACEBoO1TlwXHPA80YO2Qw3NL90yTaQLWy0kE1?=
 =?us-ascii?Q?ttqVPNVocTGhonLnD9B5Z3H92Cx9wPHXV5Ul5/T9tBYRUPHGJZ9hdImm5Ffd?=
 =?us-ascii?Q?C/uNBn7idW4exeI5UEftjw0fOxjpXuPY7RKjIQi6oP9J3nVQIlKZbgNw3vhj?=
 =?us-ascii?Q?VULtx/L7Y+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MCqFRL9nKb9FSYCo2H/uEPH0gaq108yqbIPv+u/4BwQRUioxw6VoDKlzrC2C?=
 =?us-ascii?Q?DvxRSfekJK2rdUJroKrWbCl8vPilcA5HDB2gHeQVfmR6OaeK6NkijzHlPeql?=
 =?us-ascii?Q?dQI8KBd6VWU/yXWq3Ng1gtd6q7mrtqcWoJt64CAWZAcGqtFYxNpWc5jcmvNG?=
 =?us-ascii?Q?DBBr+SNZDt81AMfU/dAf9wAuCajHEVzRVMj/XA1rJC/qikK5BHpUKJ42LWM4?=
 =?us-ascii?Q?WxyQTAr6bfEsH2MuqmD80x5uBGsGW1p8SWuhNx/EgDEZqmSESBfovrYHYwnN?=
 =?us-ascii?Q?LK+CytWl+I7/R3ZgS85f8ZOkPq45rQ0bSdni3cd8ImsE8H7tiNLnwCdfdQiw?=
 =?us-ascii?Q?XO5R6z062AXK6SbBvqV22hhV/saaaMywChYUXqOeFtaPgn0kxwgFAa8UJzY4?=
 =?us-ascii?Q?0IrR+XEjJn7d5Js//LM+sTMUYLfL7Y4BaA/yXhRevWswJjnY3WAKckdex0vt?=
 =?us-ascii?Q?WyLUlhVWBm39kPlRtVP0eHNN/PkIiQwVWyGYWE01ARhNIlE8BbhN1/u4/EtP?=
 =?us-ascii?Q?Tce+/CkvYvesRI+/OClWuCPaNoJeJQ6osT8Ku/ZhGxBNWMbiRiLwXTnQFN5D?=
 =?us-ascii?Q?H0jR3vfMe8Mw/b1tRA9iC7nrZN59CBLuvU1qjfOT01w0V0MAGWh5c7Af8c89?=
 =?us-ascii?Q?S3ZIVTO0tvD8c/niZUkRTEwq6CCSGtxNj0X3A/NQp+WzUsnFyAF0Pb6Ns0gU?=
 =?us-ascii?Q?CKCo64I3U8+L/PFqdC+ZFtnpR6Z4GE2afxm4lMh1OExWsk6RcWB/tEGFPDPw?=
 =?us-ascii?Q?Et+tC0dP1SFD031j0tk9iVZ/9Za/1whLVk7SX9JwsU0TPzEkDbd/qxTy+Qh1?=
 =?us-ascii?Q?3yirD0PWrS/YIAVOEnkzqG4lHn1+ifWwbB3ttO7+JvdVm8A4zQ5tEu2etf+a?=
 =?us-ascii?Q?fTBeuVkrBp3kbtqz0QSdaoSoymYx/FO5+PfYLFa91fMQ5GpFtb3PyYhmpvxo?=
 =?us-ascii?Q?sQhsJDCo6zEC9NyB1wx/4ob6MZoaX2N5tYqxSP478KdgUU+QCtyqqpPuFtbE?=
 =?us-ascii?Q?DZ0IxDp+H8RlFxwEbm0ALp97Y20+tUsJx5Yy3Bjfzj/Rn+LLGRV2+qOzLO4T?=
 =?us-ascii?Q?VVw0s3LPqZ3poIqELan4G5Jwm8hoEQnbXFq6/UML614lcmY11dc5HZsMro4x?=
 =?us-ascii?Q?9rPfnGNDGysCfFyPmmFaPDPei2eWktm6CGeM/l8EcGrM6uxlrpsScZMDQBfj?=
 =?us-ascii?Q?eUV0yUrCiDytZqWgj6oS8ZV56zceWlgL9/2fCBA8vyvhTweENMTc8c7oTR3S?=
 =?us-ascii?Q?VhfUeP5rvtTVJrSP4DHMyHc34n/RB+dALxr/AY0QZg3EqLG+DxZPjp5RMfC/?=
 =?us-ascii?Q?GjKAPCovVkWAGUn8b7ly4C8dqb5/rbxwncTx/x7UWrTVZYJju/lVbT6eHquf?=
 =?us-ascii?Q?tSBgN5y1yw1ywY0GqnsGIJMyZccerYYAVWhadb9Js1kpCh/tyImcG5DmcNW2?=
 =?us-ascii?Q?WRDvkZRC2VmhA0BhAcv9qsS18ReUraKEgWeCFD0KBMIn3oug3vRElvuUK+ab?=
 =?us-ascii?Q?VHHu4Ob5vRL02H5bH5MDgpWifIOesyz1XE6TICzpAkWVn85ACMt//6U0ZCib?=
 =?us-ascii?Q?HfH0EpmCwjFTgCfs7KmhA+8RPNP5KZtzv79b+RBe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279c391f-cfd0-48cd-ace8-08dd7d2c69ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:19:46.4686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIr/V/qPSjwZWSL2jby/TVsjyVsu+kRDLk+1o4vTATyODAzXQ9mgGh0KWyErZVRbYqhTeVt4CWVg2uoz3prULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807
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

Convert ldb.txt to yaml format.

Additional changes
- fix clock-names order to match existed dts file.
- remove lvds-panel and iomuxc-gpr node in examples.
- fsl,imx6q-ldb fail back to fsl,imx53-ldb.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 182 ++++++++++++++++++
 .../devicetree/bindings/display/imx/ldb.txt   | 146 --------------
 2 files changed, 182 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
new file mode 100644
index 0000000000000..7edd5f28b1372
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ldb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale LVDS Display Bridge (ldb)
+
+description:
+  The LVDS Display Bridge device tree node contains up to two lvds-channel
+  nodes describing each of the two LVDS encoder channels of the bridge.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx53-ldb
+      - items:
+          - const: fsl,imx6q-ldb
+          - const: fsl,imx53-ldb
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle points to the iomuxc-gpr region containing the LVDS
+      control register.
+
+  clocks:
+    minItems: 6
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: di0_pll
+      - const: di1_pll
+      - const: di0_sel
+      - const: di1_sel
+      - const: di0
+      - const: di1
+      - const: di2_sel
+      - const: di3_sel
+    minItems: 6
+
+  fsl,dual-channel:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      if it exists, only LVDS channel 0 should
+      be configured - one input will be distributed on both outputs in dual
+      channel mode
+
+patternProperties:
+  '^lvds-channel@[0-1]$':
+    type: object
+    description:
+      Each LVDS Channel has to contain either an of graph link to a panel device node
+      or a display-timings node that describes the video timings for the connected
+      LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
+
+    properties:
+      reg:
+        maxItems: 1
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      display-timings:
+        $ref: /schemas/display/panel/display-timings.yaml#
+
+      fsl,data-mapping:
+        enum:
+          - spwg
+          - jeida
+
+      fsl,data-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: should be <18> or <24>
+        enum:
+          - 18
+          - 24
+
+    patternProperties:
+      '^port@[0-4]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          On i.MX5, the internal two-input-multiplexer is used. Due to hardware
+          limitations, only one input port (port@[0,1]) can be used for each channel
+          (lvds-channel@[0,1], respectively).
+          On i.MX6, there should be four input ports (port@[0-3]) that correspond
+          to the four LVDS multiplexer inputs.
+          A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
+          to a panel input port. Optionally, the output port can be left out if
+          display-timings are used instead.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - gpr
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx5-clock.h>
+
+    ldb@53fa8008 {
+        compatible = "fsl,imx53-ldb";
+        reg = <0x53fa8008 0x4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gpr = <&gpr>;
+        clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
+                 <&clks IMX5_CLK_LDB_DI1_SEL>,
+                 <&clks IMX5_CLK_IPU_DI0_SEL>,
+                 <&clks IMX5_CLK_IPU_DI1_SEL>,
+                 <&clks IMX5_CLK_LDB_DI0_GATE>,
+                 <&clks IMX5_CLK_LDB_DI1_GATE>;
+        clock-names = "di0_pll", "di1_pll",
+                      "di0_sel", "di1_sel",
+                      "di0", "di1";
+
+        /* Using an of-graph endpoint link to connect the panel */
+        lvds-channel@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&ipu_di0_lvds0>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+               };
+        };
+
+        /* Using display-timings and fsl,data-mapping/width instead */
+        lvds-channel@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                fsl,data-mapping = "spwg";
+                fsl,data-width = <24>;
+
+                display-timings {/* ... */
+                };
+
+                port@1 {
+                     reg = <1>;
+
+                     endpoint {
+                         remote-endpoint = <&ipu_di1_lvds1>;
+                     };
+                };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
deleted file mode 100644
index 03653a291b549..0000000000000
--- a/Documentation/devicetree/bindings/display/imx/ldb.txt
+++ /dev/null
@@ -1,146 +0,0 @@
-Device-Tree bindings for LVDS Display Bridge (ldb)
-
-LVDS Display Bridge
-===================
-
-The LVDS Display Bridge device tree node contains up to two lvds-channel
-nodes describing each of the two LVDS encoder channels of the bridge.
-
-Required properties:
- - #address-cells : should be <1>
- - #size-cells : should be <0>
- - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
-                Both LDB versions are similar, but i.MX6 has an additional
-                multiplexer in the front to select any of the four IPU display
-                interfaces as input for each LVDS channel.
- - gpr : should be <&gpr> on i.MX53 and i.MX6q.
-         The phandle points to the iomuxc-gpr region containing the LVDS
-         control register.
-- clocks, clock-names : phandles to the LDB divider and selector clocks and to
-                        the display interface selector clocks, as described in
-                        Documentation/devicetree/bindings/clock/clock-bindings.txt
-        The following clocks are expected on i.MX53:
-                "di0_pll" - LDB LVDS channel 0 mux
-                "di1_pll" - LDB LVDS channel 1 mux
-                "di0" - LDB LVDS channel 0 gate
-                "di1" - LDB LVDS channel 1 gate
-                "di0_sel" - IPU1 DI0 mux
-                "di1_sel" - IPU1 DI1 mux
-        On i.MX6q the following additional clocks are needed:
-                "di2_sel" - IPU2 DI0 mux
-                "di3_sel" - IPU2 DI1 mux
-        The needed clock numbers for each are documented in
-        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
-        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
-
-Optional properties:
- - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
- - pinctrl-0 : a phandle pointing to LVDS pin settings on i.MX53,
-               not used on i.MX6q
- - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
-   be configured - one input will be distributed on both outputs in dual
-   channel mode
-
-LVDS Channel
-============
-
-Each LVDS Channel has to contain either an of graph link to a panel device node
-or a display-timings node that describes the video timings for the connected
-LVDS display as well as the fsl,data-mapping and fsl,data-width properties.
-
-Required properties:
- - reg : should be <0> or <1>
- - port: Input and output port nodes with endpoint definitions as defined in
-   Documentation/devicetree/bindings/graph.txt.
-   On i.MX5, the internal two-input-multiplexer is used. Due to hardware
-   limitations, only one input port (port@[0,1]) can be used for each channel
-   (lvds-channel@[0,1], respectively).
-   On i.MX6, there should be four input ports (port@[0-3]) that correspond
-   to the four LVDS multiplexer inputs.
-   A single output port (port@2 on i.MX5, port@4 on i.MX6) must be connected
-   to a panel input port. Optionally, the output port can be left out if
-   display-timings are used instead.
-
-Optional properties (required if display-timings are used):
- - display-timings : A node that describes the display timings as defined in
-   Documentation/devicetree/bindings/display/panel/display-timing.txt.
- - fsl,data-mapping : should be "spwg" or "jeida"
-                      This describes how the color bits are laid out in the
-                      serialized LVDS signal.
- - fsl,data-width : should be <18> or <24>
-
-example:
-
-gpr: iomuxc-gpr@53fa8000 {
-	/* ... */
-};
-
-ldb: ldb@53fa8008 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx53-ldb";
-	gpr = <&gpr>;
-	clocks = <&clks IMX5_CLK_LDB_DI0_SEL>,
-		 <&clks IMX5_CLK_LDB_DI1_SEL>,
-		 <&clks IMX5_CLK_IPU_DI0_SEL>,
-		 <&clks IMX5_CLK_IPU_DI1_SEL>,
-		 <&clks IMX5_CLK_LDB_DI0_GATE>,
-		 <&clks IMX5_CLK_LDB_DI1_GATE>;
-	clock-names = "di0_pll", "di1_pll",
-		      "di0_sel", "di1_sel",
-		      "di0", "di1";
-
-	/* Using an of-graph endpoint link to connect the panel */
-	lvds-channel@0 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			lvds0_in: endpoint {
-				remote-endpoint = <&ipu_di0_lvds0>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-
-			lvds0_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
-
-	/* Using display-timings and fsl,data-mapping/width instead */
-	lvds-channel@1 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <1>;
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
-
-		display-timings {
-			/* ... */
-		};
-
-		port@1 {
-			reg = <1>;
-
-			lvds1_in: endpoint {
-				remote-endpoint = <&ipu_di1_lvds1>;
-			};
-		};
-	};
-};
-
-panel: lvds-panel {
-	/* ... */
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds0_out>;
-		};
-	};
-};
-- 
2.34.1

