Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC5A8AA21
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 23:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD0010E1BD;
	Tue, 15 Apr 2025 21:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="VDbN52LM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE910E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 21:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/7E5FAcbQDgO1Kry+uRVsTP0tJYhZKmywXv79GC931zGFhEI/uJlOHxSJmQGh7+XSXt0kMnfKHEMW0SspsQ0Ex0a8e3PQk6Jfml2BHZJPhILOQ8qTWfJJh755HDOTvDJPOeydqhBR6t08dSxQVUo02vZw0w9M2elQ5YN3fPhOEte5cA5E4eW2y8859v6Gf6+WACzmaK7KU81GYhu8AUulnVDLYPqZzJBowEZKnI3kaRqwdx6sJX/1ER4LNpIsQ8bJNK+X/fjiI4uCSNiSAIhyz+wMMKDStJ/D/Kuv7OTm12/B0FNkSJrVyNRUzmRz/6gZzSYxl0iHbA0zCPONhwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrVQAq1baSOeuNjRCkVasSr2b5/PDXoNjMnqS/jPGYc=;
 b=eJBGrHQCOI7a803oTF6GE36j5ETPulUa9sYzoisjacQhccqQ1a6DardL4+FXhiOldLnv+KfUatdWNhcS95Ai1snEb6qm8BjWBmfJ3Tec95s5MTFW9liWRCZcF98YDsOkVa9EUpy/WjpJOS17vlzvIw9DvGzAksbiuTA/Kd743VxdJh9CUD8hJYAa7mJdNnFdtT+uweRxxRKTtGHj3C0J9BYXw1ZYEcxYoTOXAoFJPDhj3oarys1kMxn2lHjE/jbPrSfigvn14gaEj4BxWIfeOqWpXTdXAXUVGWD2yFPrT/Q9tT5oO8I2dLm68BTWnYc49C6G4NlKKpyXEDQtWxqfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrVQAq1baSOeuNjRCkVasSr2b5/PDXoNjMnqS/jPGYc=;
 b=VDbN52LMX77mkQqwZs74mLHEvP1jUwqLghyjCjQD/dr5ZtKPidJYK61Q21Ip9HrRrri2yjtl2XE9NHQR05bUi+TWpneOZnZe8We87gORFJGQZ+XG7fLqU72YMbGDSaxJBzzBnbRVNAyBIxN5eRNNVxssoQsF2v/+euCUYBW+97T4U+0f4IHrhy/JZzZ4x4qmbfJugIiMwGWQYiwcK8EkhPy4f4f2yWrG8M2PUM23S3ngn516vvvW/kmCN267BRAgr1yLwfq1f1RAZcVMJBq2i1iRQhCu+0vMxRaxFsyCqyMGjNcBju6aGxvzQbgY3Ixa1YjuhNz+Kv/jtTQHXzZFPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU2PR04MB9523.eurprd04.prod.outlook.com (2603:10a6:10:2f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 21:30:01 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 21:30:01 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH 1/1] dt-bindings: display: imx: convert fsl-imx-drm.txt to
 yaml format
Date: Tue, 15 Apr 2025 17:29:42 -0400
Message-Id: <20250415212943.3400852-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU2PR04MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ab83f6-5313-4a56-5739-08dd7c64ad0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|921020|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gq8mr5lq7JaPAWfTFY35m5RVA+SkVW4M5igFVyPSZaQTi/C/UtL+6FboAqbi?=
 =?us-ascii?Q?earzcYq8mgQPAsbNGYuwBaYI7Et8p4CU0cEOuzTwD78t1TJcxosA14iFD8Er?=
 =?us-ascii?Q?04kBRxqkSy0nuWxIFwtNT9jhMaNX+hTj94P8vwJPeT1KvJDssxuj0J3OO7Kx?=
 =?us-ascii?Q?n5p0iTl9zFH9kVsKbooqu9G/DmWOwOBpoXQ/TlwBabQA8XG3feh8GDBH2cxp?=
 =?us-ascii?Q?Y1ETnbrEBkrmNI/JgKEvjM6u/old2Ti5O5FZiP8dS5SwhI/dbnX6TOr98g7m?=
 =?us-ascii?Q?LMAROLDocGHrC4Nsxiro1w7jE/GeaIowJhTT7fArxyEFuff6geXsUhxsi9ce?=
 =?us-ascii?Q?xd+k24eXopfbUnwpjpuFVYDaQczjVaseYy+sUZPOg6pNjOns/KkqPuPh8E1j?=
 =?us-ascii?Q?Hh9XW2OpwQYyuHQfaSBy1iJDRrQYoiy3R1cwb0nkOiuUJp6teRcKoBWfSJ1h?=
 =?us-ascii?Q?YI72PD9CtGkLeZg6nVpE9CZCDSNJeyf1nU8MSYVC/voDhhh5Cq/oskYdy5om?=
 =?us-ascii?Q?4i4JhCWnPOObHppuKUYTTRWA7tWtlN3TDn+lld8rd4qxW5p/l62lvJUb8kFa?=
 =?us-ascii?Q?4eVOeZIuzF1V4yGFII73A9SksglrVDOIwToNKeSh9pLEmIpF3Nk8nfHHKmTU?=
 =?us-ascii?Q?6tSh2VlbiCS9HnwCCuwoWyr7m5cUbHbbXm1/J91XIgNFiytkhsUluJjmlshQ?=
 =?us-ascii?Q?w878uFPB3ZTEwUNvbQzbtA/459O5muZupCJ4MahRF5ja/unZ3laxNv/tdTp3?=
 =?us-ascii?Q?BTP8XiiT3Wp5wASL2Q5VybogKRftTEZEffdlsuzJ/qQRbvlW3lgmo6Z6SrPj?=
 =?us-ascii?Q?EhC5+FIbvw2vVAvCYZTn3jU2lZy9cIvW+OVvfosRQ8APMoOF1EyVaSpOiJbx?=
 =?us-ascii?Q?BCbv/N/vCrejWd8Ylayxk7FsMKMPwvACgpOgyQ44d8o/lkjlf/briKwy4l5P?=
 =?us-ascii?Q?Iyjh0xHEOe/lM6MTObBMis9Kx0H1K8hxItaUANNROGSnnms0WJeJSOYhJXcX?=
 =?us-ascii?Q?6X0XYDoebWa5cFDKC5ZBrv7O6HQFgKrPEd7CJwiuHRRlI09lbjVIAmfkYwqr?=
 =?us-ascii?Q?n8+MDEt+vBuJPLtd3qupRnb1YaDViY1ZrbhH+zXKaBavyOXSbD2D8yi/46Be?=
 =?us-ascii?Q?S4iwBA9YeJRCzr0tX31sM2wUxGJijuIQTvm+GWRB+GCXMJZF3rhx9+EngRTZ?=
 =?us-ascii?Q?BYtzoTzOOhyH2SP2s1uX2V7gBz3XMiBVLrCntwnbuMV8q+DGUPunZu+yQKiA?=
 =?us-ascii?Q?7nroED2tAXUHvUsRo54t0DUtL8+UN9MC8N2agxj3n86fSr/jX3p1y0TpSPjq?=
 =?us-ascii?Q?e7Up6WGQV7QKWQZzQxUypyeDQ4meotgR7I6C9Wh48y7sQTXfzLWh5OOBJyaH?=
 =?us-ascii?Q?AtVqMVUMjtnSJi+D9d0SdIsVCZjOQr3pWc8V9A+6UjiKOdUgt4g8DiMzUE7m?=
 =?us-ascii?Q?vVM3tDB/d5OndqU7Irc2Vf7ZjBW9nzfG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(921020)(38350700014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1joh6Knr+cBIHXSWtgr0dEWEP4Elu6Kw0UxwGpoI0TGfLwbQMc5baAvpeWcG?=
 =?us-ascii?Q?pDfXWtQxjTrZsIikhwRbnAEEMLKNaxl6BfrGUCaDIW23rd1HM0KpFlPOLU/R?=
 =?us-ascii?Q?hxiBPuMdqXSwVmTp1VnDDZeIgSbXGqJgSOR5TSxxGorRjLYrBm4M+Dc+FSmj?=
 =?us-ascii?Q?BcHoaEnHBNcC3gVxvgft4ondFdBBBT5L7pt4InrKQuSsx32p/oH1IX3+C2x1?=
 =?us-ascii?Q?NMcsbIR3BaMJnq3wJSJ+MjQ4Fc+VfA9OXyLj/oNgPwSlbEVBvngzWZExBB70?=
 =?us-ascii?Q?cVT4+Iv+4ugNiwJd2MRJkP/Hmv9t3C8h4Y8rwhwbwZb96qmMkdvpq3e0sO5n?=
 =?us-ascii?Q?rXHcO2QpvqyZsr8ZZ6+kERpOpluexxvumL+nW80gzphCL8pbEDFiEmqDnlPS?=
 =?us-ascii?Q?eUa3Br9jHeFBG8OE1bplGqBrxoZP0KrQLhDpPUuUY1NqVOp28KrAQhvgk/2G?=
 =?us-ascii?Q?PMRtHpRjki7T3ONs3jJ2pJ2qSTO/odasiv+7xCi/bbKwlkMmfOJK0ggMDYrj?=
 =?us-ascii?Q?d2mGR6kQuo+Xv0bVSiobPEY4dkGRWkKkXZILVJ1gNdOdZkmCFjc95y6W1bmL?=
 =?us-ascii?Q?q5G3j10PZGt7sP+G0Y7vV2SkEsc0SyiaB0vZnGFbOrKTgmPkyccfvo97YTZw?=
 =?us-ascii?Q?rOOHRayuMxjUI0YJ6D6Oj/TPspDCeKcfP/+8MidM8FZdDFjpks9VlRhCc//J?=
 =?us-ascii?Q?NIq9KX3T065F3JHymjrrYO8fRkblUEts4dfbBQMpmbPAV8jEEfK5z3doPcvH?=
 =?us-ascii?Q?Z3+CW9ZtZYFxGSkdmGZ7UPnRQOv62G8HzbyTEdZq7NRnT83kdLJp8b+CtR3j?=
 =?us-ascii?Q?hP4ozYK7lVdJVpEdkXAlvVPF/WiOx4c6Q8tQJflUMmF73wsW4fudwyHbJtKA?=
 =?us-ascii?Q?9X7ynmhs16iURXcuEuncFpWIJob59cmw/k7z0/ifjP03Ikt9cLYHw3a2A6qy?=
 =?us-ascii?Q?sDPhdfnebaoC/kYDj5fuXZ87A1ZR7X+uuEO2vNvIFhfcuQN6n88+8leEO8yu?=
 =?us-ascii?Q?zP4GY4dMGA86YM5ftJCnO16z7Va4ITJDUK4zKQ0MeHni+vTNjZ15VGE5Hfjl?=
 =?us-ascii?Q?a0LRkdGnRcUQZhyrIcAN45TiCIZAXyUzE8+Ivz+6udUHp+pCHi0NltBTlm4g?=
 =?us-ascii?Q?27oCwLHIcCvN/ET4ZZVEWuyeCPHlJPdlsmV/c4FD6riywUrFTRGkzIcKE1qm?=
 =?us-ascii?Q?Ykrs26vQcF3XV/5ePPoeOMFU4iP3DJC5a2taeccsbV89XjRRi15zAaYWbHy5?=
 =?us-ascii?Q?QGweSZEja1r3o7tL28+qBzJPEJdhJaUQhDzoVfismYCc/e2RojrqbW1H0zMO?=
 =?us-ascii?Q?j5Z7Lo7aVstSz2D+jJTrPnbjWO8KIGJFhpGpX9tb6uJFRkjLGHhjfDY2OeIh?=
 =?us-ascii?Q?mrndhIkergz5lwaKhyrmlW5M6VMTxQoygEJUSxGV5/6bkR76oSHlL74iRNeH?=
 =?us-ascii?Q?YADIgEdoDNM9NMI5qI0cIrp0EsyE6CqELuQ9wyIRpxn7cWbyz9Nr+VGppLFf?=
 =?us-ascii?Q?emVoriKTFZfGFVLOab5t9rxIqPWVNhJmyw4asq6J0CM4VUhje+rxOAWGzn9Y?=
 =?us-ascii?Q?H7RWjSoRPFUAqqeO5vU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ab83f6-5313-4a56-5739-08dd7c64ad0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 21:30:00.9874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x40x/TJBvMbPVQLqO3yKRc+5XMOHSEkO5FCk7GmxP0Q3KWj4cyikX2D7UQpzzjeo+x9hxkSZwyE/QH0K3WnK4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9523
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

Convert fsl-imx-drm.txt to yaml format and create 5 yaml files for
differences purpose.

Additional changes:
- add missed include file in examples.
- add clocks, clock-names for ipu.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../imx/fsl,imx-display-subsystem.yaml        |  36 ++++
 .../display/imx/fsl,imx-parallel-display.yaml |  74 ++++++++
 .../bindings/display/imx/fsl,imx6q-ipu.yaml   |  97 +++++++++++
 .../bindings/display/imx/fsl,imx6qp-pre.yaml  |  55 ++++++
 .../bindings/display/imx/fsl,imx6qp-prg.yaml  |  52 ++++++
 .../bindings/display/imx/fsl-imx-drm.txt      | 160 ------------------
 6 files changed, 314 insertions(+), 160 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
new file mode 100644
index 0000000000000..92a0a797d099a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-display-subsystem.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx-display-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX DRM master device
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The freescale i.MX DRM master device is a virtual device needed to list all
+  IPU or other display interface nodes that comprise the graphics subsystem.
+
+properties:
+  compatible:
+    const: fsl,imx-display-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Should contain a list of phandles pointing to camera
+      sensor interface ports of IPU devices.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "fsl,imx-display-subsystem";
+        ports = <&ipu_di0>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
new file mode 100644
index 0000000000000..bbcfe7e2958b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-parallel-display.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx-parallel-display.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parallel display support
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx-parallel-display
+
+  interface-pix-fmt:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - rgb24
+      - rgb565
+      - bgr666
+      - lvds666
+
+  ddc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle describing the i2c bus handling the display data channel
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port@0:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: input port connected to the IPU display interface
+
+  port@1:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: output port connected to a panel
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    display {
+        compatible = "fsl,imx-parallel-display";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interface-pix-fmt = "rgb24";
+
+        port@0 {
+            reg = <0>;
+
+            endpoint {
+                remote-endpoint = <&ipu_di0_disp0>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
new file mode 100644
index 0000000000000..ec78645d4de00
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ipu.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ipu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX IPUv3
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx51-ipu
+          - fsl,imx53-ipu
+          - fsl,imx6q-ipu
+      - items:
+          - const: fsl,imx6qp-ipu
+          - const: fsl,imx6q-ipu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: bus
+      - const: di0
+      - const: di1
+
+  resets:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  fsl,prg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to prg node associated with this IPU instance
+
+  port@0:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: CSI0
+
+  port@1:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: CSI1
+
+  port@2:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: DI0
+
+  port@3:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: DI1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@18000000 {
+        compatible = "fsl,imx53-ipu";
+        reg = <0x18000000 0x080000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <11 10>;
+        resets = <&src 2>;
+
+        port@2 {
+            reg = <2>;
+
+            endpoint {
+                remote-endpoint = <&display_in>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
new file mode 100644
index 0000000000000..73bc73ff6e693
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-pre.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6qp-pre.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX PRE (Prefetch Resolve Engine)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx6qp-pre
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: axi
+  fsl,iram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle pointing to the mmio-sram device node, that should be
+      used for the PRE SRAM double buffer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pre@21c8000 {
+        compatible = "fsl,imx6qp-pre";
+        reg = <0x021c8000 0x1000>;
+        interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&clks IMX6QDL_CLK_PRE0>;
+        clock-names = "axi";
+        fsl,iram = <&ocram2>;
+    };
diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
new file mode 100644
index 0000000000000..dea9d3ad43c97
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6qp-prg.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6qp-prg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX PRG (Prefetch Resolve Gasket)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx6qp-prg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: axi
+
+  fsl,pres:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      phandles to the PRE units attached to this PRG, with the fixed
+      PRE as the first entry and the muxable PREs following.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    prg@21cc000 {
+        compatible = "fsl,imx6qp-prg";
+        reg = <0x021cc000 0x1000>;
+        clocks = <&clks IMX6QDL_CLK_PRG0_APB>, <&clks IMX6QDL_CLK_PRG0_AXI>;
+        clock-names = "ipg", "axi";
+        fsl,pres = <&pre1>, <&pre2>, <&pre3>;
+    };
+
diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
deleted file mode 100644
index 269b1ae2fca99..0000000000000
--- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
+++ /dev/null
@@ -1,160 +0,0 @@
-Freescale i.MX DRM master device
-================================
-
-The freescale i.MX DRM master device is a virtual device needed to list all
-IPU or other display interface nodes that comprise the graphics subsystem.
-
-Required properties:
-- compatible: Should be "fsl,imx-display-subsystem"
-- ports: Should contain a list of phandles pointing to display interface ports
-  of IPU devices
-
-example:
-
-display-subsystem {
-	compatible = "fsl,imx-display-subsystem";
-	ports = <&ipu_di0>;
-};
-
-
-Freescale i.MX IPUv3
-====================
-
-Required properties:
-- compatible: Should be "fsl,<chip>-ipu" where <chip> is one of
-  - imx51
-  - imx53
-  - imx6q
-  - imx6qp
-- reg: should be register base and length as documented in the
-  datasheet
-- interrupts: Should contain sync interrupt and error interrupt,
-  in this order.
-- resets: phandle pointing to the system reset controller and
-          reset line index, see reset/fsl,imx-src.txt for details
-Additional required properties for fsl,imx6qp-ipu:
-- fsl,prg: phandle to prg node associated with this IPU instance
-Optional properties:
-- port@[0-3]: Port nodes with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt.
-  Ports 0 and 1 should correspond to CSI0 and CSI1,
-  ports 2 and 3 should correspond to DI0 and DI1, respectively.
-
-example:
-
-ipu: ipu@18000000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "fsl,imx53-ipu";
-	reg = <0x18000000 0x080000000>;
-	interrupts = <11 10>;
-	resets = <&src 2>;
-
-	ipu_di0: port@2 {
-		reg = <2>;
-
-		ipu_di0_disp0: endpoint {
-			remote-endpoint = <&display_in>;
-		};
-	};
-};
-
-Freescale i.MX PRE (Prefetch Resolve Engine)
-============================================
-
-Required properties:
-- compatible: should be "fsl,imx6qp-pre"
-- reg: should be register base and length as documented in the
-  datasheet
-- clocks : phandle to the PRE axi clock input, as described
-  in Documentation/devicetree/bindings/clock/clock-bindings.txt and
-  Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
-- clock-names: should be "axi"
-- interrupts: should contain the PRE interrupt
-- fsl,iram: phandle pointing to the mmio-sram device node, that should be
-  used for the PRE SRAM double buffer.
-
-example:
-
-pre@21c8000 {
-	compatible = "fsl,imx6qp-pre";
-	reg = <0x021c8000 0x1000>;
-	interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clks IMX6QDL_CLK_PRE0>;
-	clock-names = "axi";
-	fsl,iram = <&ocram2>;
-};
-
-Freescale i.MX PRG (Prefetch Resolve Gasket)
-============================================
-
-Required properties:
-- compatible: should be "fsl,imx6qp-prg"
-- reg: should be register base and length as documented in the
-  datasheet
-- clocks : phandles to the PRG ipg and axi clock inputs, as described
-  in Documentation/devicetree/bindings/clock/clock-bindings.txt and
-  Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
-- clock-names: should be "ipg" and "axi"
-- fsl,pres: phandles to the PRE units attached to this PRG, with the fixed
-  PRE as the first entry and the muxable PREs following.
-
-example:
-
-prg@21cc000 {
-	compatible = "fsl,imx6qp-prg";
-	reg = <0x021cc000 0x1000>;
-	clocks = <&clks IMX6QDL_CLK_PRG0_APB>,
-		 <&clks IMX6QDL_CLK_PRG0_AXI>;
-	clock-names = "ipg", "axi";
-	fsl,pres = <&pre1>, <&pre2>, <&pre3>;
-};
-
-Parallel display support
-========================
-
-Required properties:
-- compatible: Should be "fsl,imx-parallel-display"
-Optional properties:
-- interface-pix-fmt: How this display is connected to the
-  display interface. Currently supported types: "rgb24", "rgb565", "bgr666"
-  and "lvds666".
-- ddc: phandle describing the i2c bus handling the display data
-  channel
-- port@[0-1]: Port nodes with endpoint definitions as defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt.
-  Port 0 is the input port connected to the IPU display interface,
-  port 1 is the output port connected to a panel.
-
-example:
-
-disp0 {
-	compatible = "fsl,imx-parallel-display";
-	interface-pix-fmt = "rgb24";
-
-	port@0 {
-		reg = <0>;
-
-		display_in: endpoint {
-			remote-endpoint = <&ipu_di0_disp0>;
-		};
-	};
-
-	port@1 {
-		reg = <1>;
-
-		display_out: endpoint {
-			remote-endpoint = <&panel_in>;
-		};
-	};
-};
-
-panel {
-	...
-
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&display_out>;
-		};
-	};
-};
-- 
2.34.1

