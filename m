Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1792F7DA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCCC10EC78;
	Fri, 12 Jul 2024 09:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YAcdrkz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057F10EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcSBLDDIT1AlMy5m+18REqwCSi/DlaMWs1RIeZg7OKbd7X7KiypWp/QnzwQyvqsfBymT61KQUaNS5FyrLFaXw1lMpUb8ucQJUyYan3uWLINnmdyef6hOqFF1bcJxFp7beHDGKqBdWS/wMcGVA7/cJCFtURvAgz1jDjX1r1nD86QHEgXAu31kVcXbob5FvLiSGz3QYhCJZbGZ5iDbz82NJ5DPg85h4eOzI3kDo19FHwVdh+ORt2OLQEel1XEqPitUEXmElcfcKGUu1MH9gckMLB6LC2hi8hk70wJWHdCEtE74CvsUE8OuEz/nPYydyPorG/WozGaeMp+1QUBXE9Vemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KfSvTno9qe5Gx7g0CpogAeVq6qj0WVPG1gvPK3lLzQ=;
 b=xdcV1TylH/L4YU8pTPbrR8u4RiFdjh7Xs3k6zIl5lLcHOlOrkg0egSJsvkGwmay6MZ6PQ0oD8IdGVF6B/hqUpWuvxvrhN/j6jsOEKGSVsDK8fX0A1pHIzCOPh2dg65GByjoKOoKtE4yM3s16JNswLH/iDVio8PtjdFAKmuLG+z6I4fqSCJuI13TBcGtTRIM5HeUjnnN52LXQ9hiaypswHyibdZc2De+G89gU+5Cs0BjBlwM4ik9YNdp2+ljRvVAEO5uKoCkPDkIWKvS36xfNj8rB7H5PnRNp0CX7EvPnnxphhpohNnASsZ6U93LAHY6Y97eAyevLZhygJwRQRSiOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KfSvTno9qe5Gx7g0CpogAeVq6qj0WVPG1gvPK3lLzQ=;
 b=YAcdrkz8iCyX3RBY5/nij6qqAV3UPzgc2Y0sbUNj0S2rqwxODB10JbmjbJDIY5Mez/+cMni6AlX5b+JX3xHc6dk8Eop3KjyJFmH4K1DQ0u3P7/n9JyWeHF/6jTI3y9/QOn8mS1FiCcbTz/D0xN1GNnGCcXPcXo1HsffM85L6f8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10289.eurprd04.prod.outlook.com (2603:10a6:800:242::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:24:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:24:58 +0000
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
Subject: [PATCH v2 03/16] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
Date: Fri, 12 Jul 2024 17:32:30 +0800
Message-Id: <20240712093243.2108456-4-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 975c2dde-4b1f-4298-8ea3-08dca2547f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FBUh6UTHoBud+ZZ/+2QRQo7iLBHgqLAo/jOD2orqR3nNYYP1IyfLfvw+Y+DR?=
 =?us-ascii?Q?2yTLj5npvBWjaoBCnwAj6xHyXtOJ4WhpwSq1b91hXNZ1/A/BWiAq7j9D/hdp?=
 =?us-ascii?Q?DOAEPYzam/QfxffCjJvfTf5ICNF+dfi18P4akoRtWdp4jd5ns3hlnCcyWxpv?=
 =?us-ascii?Q?TrlL6X0/5pw7ZivjLYuxZjVxYespLwdPhlPoZv1bdofLekHuPTD8k74c3jK/?=
 =?us-ascii?Q?xBBkI+cE0JWEKRVUmP0GVKzSXzi7Pn7JecjtNJE+eowTmacI2POXcXBpmKQL?=
 =?us-ascii?Q?M7Xy+zV7BIQc9rRwzo/3v6CZKqOFvWMqa+tRynFf4a0Vl9bZdZUb5bnfTJuJ?=
 =?us-ascii?Q?2NjB74QaoEx8ynoP8iOC4UD625yg6FaXHoRGL9OYpBFOuQWn4lT42LAroChe?=
 =?us-ascii?Q?YMZpm8nZIEPYvxQHb4UGD2xz4MEMWEh1kf56G5IP2ft3tU5JibIdNvNXTD5B?=
 =?us-ascii?Q?PFTWAmyAynnC7Rk68rTz/K40pfhGOj541bPTfIjNpDCrsTIs4C4x8SFYlTSM?=
 =?us-ascii?Q?jScQ9VOYMKP5pjqGXn9yMYJrgZYA1fDXTEAXGEQXvPGYgJiBheadHLbGMsMZ?=
 =?us-ascii?Q?3FE+ekeOmbPAT5aqo3T/fGVmH2+BId/XQeWJmBegzi5C79vw3jD5DMzmQjfz?=
 =?us-ascii?Q?FWZCwlrLqkGRPLZ8gfGYxqN0ertUWO/BIy9IOv3KsVDbIITDc1lJGXMHU48+?=
 =?us-ascii?Q?X0vIC4i977aFQxsxZiLpQHfOhoyFKybLV5oFXqomolmrQkYdYjsDQL/3X/SM?=
 =?us-ascii?Q?NagRRIXXauUMveIqS1WkjL8Q3/tV0w97OpvqoqPjfwUl+Ab2MPssQJigv/bk?=
 =?us-ascii?Q?fGSHlh++i7SThvOPT8c2l/BbMb+VI4sT9k3YoI/fPVzotIeDKLsIzJq09yFA?=
 =?us-ascii?Q?tLJStKnCU8WEDueLh1NvdDZKik821cFXUb//nKEK7iDgu8DL95X0sDKbTxhH?=
 =?us-ascii?Q?9KJaKGFxqAGUKXenccZjEqMO8ynVjOibEuUxZKJ8HY4xDbpvyf4CMcJPQ+JG?=
 =?us-ascii?Q?McLu4JhTbFeaxKR1qKbyuBbOa1IC7pL4r40HsNNtSIEGX4BX62Ftb1K3R6Em?=
 =?us-ascii?Q?14wHdT3QGIDr6197CVnfYNEHCicgaLG8iQK6AAGGCTkgYHYXYa3hxhhatjmP?=
 =?us-ascii?Q?K/jgcTLkK4AS7RDDQ2TBZ9nbkDfifoRyLJ5N2oS7JV80Ppmo6Dl8ZyrLMqxG?=
 =?us-ascii?Q?7ybjmJKEh8CbQU4VwCNWUptK0c3+r1Q3mryDSuRaZDpr1eBSxXC968l6KdVp?=
 =?us-ascii?Q?Jwq334x6otZJMzMZZe4feqF0QALjT56roGsgztcOxxWVCkNWYnn9P9Gaoeb3?=
 =?us-ascii?Q?0i3L6b4q1n+foK2y1E/SfPXfEjINDpc0HwLNeBRYxll4Pg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dhNs8R+N4pL0KNhRF3CZ1aCE7VHoeROgbZGNwoccnlWzsrBx/wTYWHXPIVho?=
 =?us-ascii?Q?uSkwikdc+Nn6yjfQeCxRB1xz0Q1r9R/gvSzkqY0FlDI+p4iSEdc8h9M02R+7?=
 =?us-ascii?Q?TBEy0fQ7yo2L5d3E/fVJkQgUruTLUSSs186EqDe6qu89JIxOAXJOmVSwTwkW?=
 =?us-ascii?Q?hJJKXskLJ29C+sX5t11eWFcUrnZ6LqQBxNSwWdlVR2kBilQ0R9egsSWHQmaS?=
 =?us-ascii?Q?d9lUDkn9J8lpiRBsOUFvYcXWgdkUn+lGhSQv+JdElcd6vvbMPy0syH089Cwa?=
 =?us-ascii?Q?S9L3uSfW71JFhW3BMFSjWg2NH5nX47nrh87mKrdVy2VvfGivmBOXaKwlOLk1?=
 =?us-ascii?Q?rJEtm4jA4tXx+Lzeve2N4u47VQNIRDBNHIJqCFjvgtTC0eq4Pn7QdarbtVNp?=
 =?us-ascii?Q?IyrVq3l0Xv6yOqC4MuQAbK4i5r85fAdIQUgxOSATVswpSa4kErPcWeSrWEHl?=
 =?us-ascii?Q?ZNp4gad4I3F4DRDROkWZcWKMFN3sd9lVys+WuZqTTZfpzMZZK1HAZPnyCARf?=
 =?us-ascii?Q?oWhudSpG1jlMXMJlusrLYvAIuaxR+wJRihezplQ3aByyN5/7lN4YnswalQgZ?=
 =?us-ascii?Q?isO45d8k1lovfRGyBGlERqo9GmPh5NzTiTY+BrDZvkSC4DOamJeniKhCURnK?=
 =?us-ascii?Q?CwZtiNzXsszA5iaWR7c8PWdH1XVY1bsS2s5it/e4INbOgaKdOyBsreKZWk+k?=
 =?us-ascii?Q?Fw/RhJFYZBwe85Jlcar3zKSBIBn9VoZUmJb0PG0flov78hq1MwUklOWlVhAB?=
 =?us-ascii?Q?hTUXizEeBe1EQl87p9lJ9JVJh1GmsLQyHVLMdljyP+5V/GX3lwZfVIfJTdjI?=
 =?us-ascii?Q?p/LymzJM0kytatLTswLv10w6gXJKcWGoQWvIJTbcJ/jkGh3AZbkhM4kyzVIJ?=
 =?us-ascii?Q?vjYJ6di+ndtTt31f67xqXGZiGgMChXXeNYeygyGZqsf0sMI/GC2N2qIAulGb?=
 =?us-ascii?Q?40ZhyyH0z+7WSPYASJgwwOCuMKZYNY8MBzhZ6+MwT4h4J60U8pe3O+JV7HUp?=
 =?us-ascii?Q?5ovbK2Bgi3n9rIRarm6Ru6lmj6nvWXAIIEDIzb+bYrQA4EGToN4yEUaM/ZxV?=
 =?us-ascii?Q?sr/90IPX89/endW2hfrs0TIbb8MNEHQUNcU0cd6pD/SEpUQvYBzS4Ut4PY3P?=
 =?us-ascii?Q?GXjFTD2lfYVq62PzuH59dU7ojFN26estGXjzEI997iG9KljWbW1BOd/ABjGp?=
 =?us-ascii?Q?I1HXqCEB4bw0qUQw/E3Bq3xHZC/fGLBjVcjzeKBe/7o1r2LRo7iv7dU6GNL1?=
 =?us-ascii?Q?luKdOQdMwunuHh8uHSR20PGxUJTWuEgBxYpC83sD13yPjJu1DsNAQkeMCcYZ?=
 =?us-ascii?Q?YJGpOZItwRyXGMZeWIoizjjI++w0e8TGU36AuutPCoonT5g8N1NWL5A21Ynt?=
 =?us-ascii?Q?cbzPOg9BPl6xyBmGQeHWkVgycpYrfQMizwS2jb0xC/vRMxc2II5GxGRuJGdV?=
 =?us-ascii?Q?ftFYWX59Hw23798BoEDvRT8C3rY8zy5wuT56/kcnmt292FBFjbk1V41dtnaq?=
 =?us-ascii?Q?yWcaFnHrRHhFPlQZu6SAxj+30EfLdNBOYVx2eStwrGro9VH67dpwMJSy+VZF?=
 =?us-ascii?Q?WlygyGHI1pYrAFJa8ZZttyXKa5N0tHAISGOU3Uuf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975c2dde-4b1f-4298-8ea3-08dca2547f96
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:24:58.3072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+aKLebGYqvYhNtlyl4GIf6Tr5D2keSUPPoGpGNhyHdFCItapvirbxiH/fxlj1YfdbGJo3+LqEpGN3VFKk564w==
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

i.MX8qxp Display Controller pixel engine consists of all processing units
that operate in the AXI bus clock domain.  Command sequencer and interrupt
controller of the Display Controller work with AXI bus clock, but they are
not in pixel engine.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Fix register range sizes in example.

 .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++++++++++++
 1 file changed, 250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
new file mode 100644
index 000000000000..633443a6cc38
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
@@ -0,0 +1,250 @@
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
+            reg = <0x56180960 0xc>, <0x56184400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180980 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <3>, <4>, <5>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809a0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@561809c0 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <6>, <7>, <8>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@561809e0 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a00 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <9>, <10>, <11>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        constframe@56180a20 {
+            compatible = "fsl,imx8qxp-dc-constframe";
+            reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        extdst@56180a40 {
+            compatible = "fsl,imx8qxp-dc-extdst";
+            reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+            reg-names = "pec", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <12>, <13>, <14>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+        };
+
+        fetchwarp@56180a60 {
+            compatible = "fsl,imx8qxp-dc-fetchwarp";
+            reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+            reg-names = "pec", "cfg";
+        };
+
+        fetchlayer@56180ac0 {
+            compatible = "fsl,imx8qxp-dc-fetchlayer";
+            reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180ba0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180bc0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180be0 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+            reg-names = "pec", "cfg";
+        };
+
+        layerblend@56180c00 {
+            compatible = "fsl,imx8qxp-dc-layerblend";
+            reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+            reg-names = "pec", "cfg";
+        };
+    };
-- 
2.34.1

