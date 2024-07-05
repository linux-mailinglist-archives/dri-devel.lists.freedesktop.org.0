Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FAB928460
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4E610E1F5;
	Fri,  5 Jul 2024 09:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LsVs8nhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D310E1F5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 09:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxqGrMtZ5pAaTGj1Gqr+o0omvWL1F+7Xgq/txLiqiqZXUpCRplWj9mkAYiFO3FVzLL8fTz517rWNHMMidVVutl5I0Q4BaLF8MIvI8WBKE007jTYjLBiLF+B60MOAm3vtI9Wvbex1ODOiU9nosZSoKqKOqhUaAcVm8s0Yse1RDg69hd814OYYRpoVPM53arGR0AReG82a2/jaLj8f+q9IVhT+Nk1hUg1KpgnPjf6CcDXBAudGtHG2FeM/rJI2vdO4ely4GByfM8A6gvtObRMi4L42b1PRfcwpnySrYj2XIbq+Khgf5sGWy3ZZ83mg6RTVv/5h6m20hiviHAaHiEpibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6ubKGAFKtGjOB8UXplivvNBDmBEZpvz78U8EbO0yp4=;
 b=B+19j6ivFydNTJAZnIAfVfNQID1D1IrgmM1wJKi2ctfmGOziICZPYcmUSpy+9wHg9GqwehTL/cMAJsqslwpq/wTFlmpQ+9Y8O1JLvVYFhgxNuPVa8wNlTV3NsOZnHoZUi+GMEihHYkhb7X5KOmW++/swcvAUKxe8VCgEZks6XKtMQqO/d63xwMaqjJTPujEbFSvc+rqPsWbp1swmr85VVBLK4rIqU3avppeLNTBcN+SnTl6gRwzLwGbVogTMkt2iS8yd0DExtgLeBSnD8hjwomX0RNMTPWC2ogw1YHhvjOl9qbKJTvmeNNJWX1hrLwD6Jp2UcTRqRmLEjIu5+NP5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6ubKGAFKtGjOB8UXplivvNBDmBEZpvz78U8EbO0yp4=;
 b=LsVs8nhKD5tfvBpylhhxg0jhT58I1DcgQ4mJGOJNhfLnvyrKK2WvgBAHEEB235YqYEP2/M6XWCx6etNOWvY6wYrKgl/aW6lwgGQZarEKZm6zgCmsNSuQaABfj1TR0Es3f4YSqQcbB6jo8mcWq8ElMyGn4eAponPfnRK+Sv5H9iI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9073.eurprd04.prod.outlook.com (2603:10a6:102:225::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Fri, 5 Jul
 2024 09:01:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:01:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: [PATCH 05/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Fri,  5 Jul 2024 17:09:27 +0800
Message-Id: <20240705090932.1880496-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d9e4df9-8c8e-451b-feec-08dc9cd10836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MxkvzPRkOaVobFCSzGjfs2zi6qRGwNkCHU/le3JWbnQjEhtgSF0tuztj4l81?=
 =?us-ascii?Q?pRdq173ybdvFUiTFRHKi28dAkA6MNotfgbGGBCRRqxsXaQZ1wrkNaNEVqAmI?=
 =?us-ascii?Q?9YwFpnHyA2Xa67LAd93JiZxZRInM8VDG6LNAFsmtD2PACfq3+aOYFk+dL3y2?=
 =?us-ascii?Q?1lKgIMRJhUPiUonNATP+1P8qbhugR5WxRKq4gFNRH6LRQTL9SUtkDlkArcpl?=
 =?us-ascii?Q?YdzyLayvm9UnBL0vcp82ZpO1Dr1htnk/ZGTD+R1UguGtN9V2ZDEIY/8jr40p?=
 =?us-ascii?Q?qwm5ltVTsMpPyXdbgHEicFlALdQcN+QuJI7sXKP32dBe8oj/hUcxka79y+g5?=
 =?us-ascii?Q?IvfGqIxNqVunuHQM1Pnl5zzqwDpAG/FMbUeT7qbZKtEahSHhootKUkLHZ/SE?=
 =?us-ascii?Q?XkZ+8g3QHWNtf2nAFxdMOHZROhjalzwkNQ5X8OfuFkSZg7oGmnlBjO8Stn5l?=
 =?us-ascii?Q?Z0fpPhcSS5B9r1MrOL/XXv6KWicMuQuEdktuFFudp574hoBqi/AyQDMbApM7?=
 =?us-ascii?Q?yUARG1JeNACxJS6wziP3FNn7F4vGSN/Cyfd3h0isg+ukeSoBGxwZhbURgfIj?=
 =?us-ascii?Q?WHwdDkDn/QhUDM8et/D8WZ7JtDO1YBdNaqAqVmulYqSTrlo9wiPndi9kwzrS?=
 =?us-ascii?Q?qeNxzp35AqLgdWxWbATd8JOBDMhEBB8I/ogQRXTEUOA5unBLkZRBE4O4PMuy?=
 =?us-ascii?Q?hkcmojZXsBQmmdr6PY1dAttPxydW892q0O85sW1esoQmPIfdnxf8/NbowW7R?=
 =?us-ascii?Q?9eDxtaFX4d60BTReCMpeo8GRaoEyfQ6lumyoZj8mN+F7TyWgjGYvkbWvktC+?=
 =?us-ascii?Q?s0PCdvTAELct42nO+O+Vy6RCXFNkfVjzuGVSXIfoPZvhnHcJZHH06/TXXupn?=
 =?us-ascii?Q?xnxSMUhhcygh1heCae8VW1T4GsroQBKVlmEKaitERKNY2Cm/nLRxiGT1V56V?=
 =?us-ascii?Q?rnxBlwO1yXrmsvLxpaEvgqUF2P2kXDbvQmuVWwiFyqyAiOu9uq/P2L5Yfd0S?=
 =?us-ascii?Q?OTfmbA8FpEqhO/yHn75UIRcEaOj1N6iiPh4bmdt2+k7GkY+shrXh4JS5HomX?=
 =?us-ascii?Q?Aq6iyTxqIZyxT4w7sMgQLEg8v8U2K757fIdTZDWYI7ed/r7n0Yx6g2iimbfm?=
 =?us-ascii?Q?ZdEQA6wBVXtF4unSHlLNc1irIAtDJVs1KKWEH75/wHQ/2Iso4KGFTZK/ocwS?=
 =?us-ascii?Q?72nCzjnSuk30UbF3itvsr0CeiLED8h1L+ykZ6/Dwag4g4MC3aydd8bRin0MK?=
 =?us-ascii?Q?HxD3WoKYB4hkQak0ZiTdiXttGPSMn2xiX+eGUk+Frlw8Qi3AhESG8oGJh6WT?=
 =?us-ascii?Q?48htSFgeJ+GWz+8bgPy+UWAn2W+fJkHWE6OAs+dA8MPxmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Ybkz7Wp9qA/yXWlwsYjT+x0DC7SB1BWCFUZtAmeFoJorvqeH1+LxHr/V5u+?=
 =?us-ascii?Q?NCSspBCwSX8aWqyuJ7934MAOhIo7WF5e+uJtGVh4j6ruDRsMDRWHiog9R3s8?=
 =?us-ascii?Q?1+jnY+ykuXXZEnFKEdC6uJUE1bAQIb1gwGjd6nf+DxNz2toEkCb3NTSoh7Ch?=
 =?us-ascii?Q?dSVgS2gEshWEsaE4JFrcImRdXhM5VIJJdupqGqC+XHqFh11X9NNo5HjU5PRa?=
 =?us-ascii?Q?nSVLanHPv7GWBJF4g3m5cvJAdTn0YU1mDToQiM+JszftNrH/Hoq6pGK9CUBw?=
 =?us-ascii?Q?5sBzp0FffgkdwyKjWMeSXj0MKetbUIqsnofN9oDOR+wwUPQSs+89XsKad4fR?=
 =?us-ascii?Q?girKngIVdnbYPpQCTXO4e59liKbd7R1NjMWKFoUBEZrAlpGl/QDP8FVLLG5Z?=
 =?us-ascii?Q?jXTyliq5MyMwb7jDBX6fhbSrf+Ei/xPsdXVAzMvNLaS//F1saTRjlC5fvc0i?=
 =?us-ascii?Q?2uuN5i772H7cCYxoFgawT0GyYuZU6WulDmAPVM8k3fnkuZKijh7EhxfJiSXT?=
 =?us-ascii?Q?yJqDHivBeS04XAMig6CYN4/bwvLrzxMWKPTJCcgRUd1fl61uTmdHmo+0hqHR?=
 =?us-ascii?Q?TQPGTwXxt7Smv8BoYQYZ3yV2jXGeXL5dYoSLskVdvO15pBiLiFK8zwhN6Qma?=
 =?us-ascii?Q?CA8Ytxob+xr8MK+iTBoDbjnbnWiiY4oyXhgBQVPwFcbDRj5PIbEg63JGMpxR?=
 =?us-ascii?Q?0aNRdSsOUgcqPpEZe9S7kR/TNhtrRmReme52Vglf/GmQU4cbGXb1sVU5floR?=
 =?us-ascii?Q?9vq1y9dJZABW290/Sl2AVksQOOMr+Q75BquSZO6ed/EPVoQTdSU+HJsD9Gdf?=
 =?us-ascii?Q?fgygzb2+KRxCCuQumf7B6UstfpDnFgAkQRY9qcwx4CkJnkWEsEQNXbs+Tx3x?=
 =?us-ascii?Q?QnR64qICHcS0yddTyspB75agRJk3ZFi+gYPBYM5J7I0tnlM8QSKqVg1wAcnG?=
 =?us-ascii?Q?BxnuhfSmYLNxHuFmSoDW3TMcAWvkCif5LEmTrdOhGNRD7uR/pAxvZN4q9yFN?=
 =?us-ascii?Q?KTS1PrA4+FTsKHkMU0RfbkfBuNar94AfrsZor82GUvaQf4Ys4RCrGmfW4Gpl?=
 =?us-ascii?Q?5MrpjR2uks8MMgzH0h2vqQ6O6zHCT7QqRFRBLjJXcFWHINJ/9wHwLWkvp5y1?=
 =?us-ascii?Q?3+mrfbazPEAkebeYLxavMyA8AkH6oewXxbXXdLubSWXN07taBGL0pjzG6GXj?=
 =?us-ascii?Q?5OwvIqCyxBUkbBKKu93OKEm7wsIog9PAb8ELqkM/YHiwuuu3c1BZVAW0u/Sl?=
 =?us-ascii?Q?M96VV0FSNQEp43ezO5MUYu0oFgxxLgz42ZmtIMTPCWvyC8Phyvq4RGpL2qKD?=
 =?us-ascii?Q?8gYKnA1lOruSvDumTzml3QW9HurbxBLpbkL5CLo2zEMeyeO2NE2h87kLXq2/?=
 =?us-ascii?Q?+qv+9/dRfhSxT50NHWci+f/fDZq5Xvqnu7ExjDJspfswa0KroYkBSErdjlxg?=
 =?us-ascii?Q?69RLDFskjWaLfY6DK/dvgtnhBkG2Yp924hhg30K4HeZ9czk3S5ywBB3hu+eS?=
 =?us-ascii?Q?M8RNXkFS4G0Hdh7jdtVePh5HyDVp7s3EahRl8ZJf9TfhJUfsrqpGPtZdd+zA?=
 =?us-ascii?Q?ilr5gl2MCB9YrQDSnt9gxNSbRF9gaBH5PUyoRkZi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9e4df9-8c8e-451b-feec-08dc9cd10836
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:01:18.2059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8hv1Y9yRkdjuPKqSmmlRz7m3cy2eQcDuAdYP0mKPCcptUzT/H43J/tsne+nVH1piU88u4O+C8dJZuEB30gQVw==
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

i.MX8qxp Display Controller(DC) is comprised of three main components that
include a blit engine for 2D graphics accelerations, display controller for
display output processing, as well as a command sequencer.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 243 ++++++++++++++++++
 1 file changed, 243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..a2ad280d2839
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller
+
+description: |
+  The Freescale i.MX8qxp Display Controller(DC) is comprised of three main
+  components that include a blit engine for 2D graphics accelerations, display
+  controller for display output processing, as well as a command sequencer.
+
+                                  Display buffers              Source buffers
+                                 (AXI read master)            (AXI read master)
+                                  | .......... |                  | | |
+      +---------------------------+------------+------------------+-+-+------+
+      | Display Controller (DC)   | .......... |                  | | |      |
+      |                           |            |                  | | |      |
+      |   @@@@@@@@@@@  +----------+------------+------------+     | | |      |
+  A   |  | Command   | |          V            V            |     | | |      |
+  X <-+->| Sequencer | |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |     V V V      |
+  I   |  | (AXI CLK) | |   |                            |   |   @@@@@@@@@@   |
+      |   @@@@@@@@@@@  |   |       Pixel Engine         |   |  |          |  |
+      |       |        |   |         (AXI CLK)          |   |  |          |  |
+      |       V        |    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    |  |          |  |
+  A   |   ***********  |       |   |            |   |       |  |   Blit   |  |
+  H <-+->| Configure | |       V   V            V   V       |  |  Engine  |  |
+  B   |  | (CFG CLK) | |    00000000000      11111111111    |  | (AXI CLK)|  |
+      |   ***********  |   |  Display  |    |  Display  |   |  |          |  |
+      |                |   |  Engine   |    |  Engine   |   |  |          |  |
+      |                |   | (Disp CLK)|    | (Disp CLK)|   |  |          |  |
+      |   @@@@@@@@@@@  |    00000000000      11111111111    |   @@@@@@@@@@   |
+  I   |  |  Common   | |         |                |         |       |        |
+  R <-+--|  Control  | |         |    Display     |         |       |        |
+  Q   |  | (AXI CLK) | |         |   Controller   |         |       |        |
+      |   @@@@@@@@@@@  +------------------------------------+       |        |
+      |                          |                |       ^         |        |
+      +--------------------------+----------------+-------+---------+--------+
+              ^                  |                |       |         |
+              |                  V                V       |         V
+       Clocks & Resets        Display          Display  Panic   Destination
+                              Output0          Output1 Control    buffer
+                                                              (AXI write master)
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: axi
+      - const: cfg
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
+  "^axi-performance-counter@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
+
+  "^command-sequencer@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-command-sequencer
+
+  "^display-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-display-engine
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-intc
+
+  "^pixel-engine@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-pixel-engine
+
+required:
+  - compatible
+  - reg
+  - clocks
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
+    display-controller@56180000 {
+        compatible = "fsl,imx8qxp-dc";
+        reg = <0x56180000 0x40000>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+        power-domains = <&pd IMX_SC_R_DC_0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        interrupt-controller@56180040 {
+            compatible = "fsl,imx8qxp-dc-intc";
+            reg = <0x56180040 0x60>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            interrupt-controller;
+            interrupt-parent = <&dc0_irqsteer>;
+            #interrupt-cells = <1>;
+            interrupts = <448>, <449>, <450>,  <64>,
+                          <65>,  <66>,  <67>,  <68>,
+                          <69>,  <70>, <193>, <194>,
+                         <195>, <196>, <197>,  <72>,
+                          <73>,  <74>,  <75>,  <76>,
+                          <77>,  <78>,  <79>,  <80>,
+                          <81>, <199>, <200>, <201>,
+                         <202>, <203>, <204>, <205>,
+                         <206>, <207>, <208>,   <5>,
+                           <0>,   <1>,   <2>,   <3>,
+                           <4>,  <82>,  <83>,  <84>,
+                          <85>, <209>, <210>, <211>,
+                         <212>;
+            interrupt-names = "store9_shdload",
+                              "store9_framecomplete",
+                              "store9_seqcomplete",
+                              "extdst0_shdload",
+                              "extdst0_framecomplete",
+                              "extdst0_seqcomplete",
+                              "extdst4_shdload",
+                              "extdst4_framecomplete",
+                              "extdst4_seqcomplete",
+                              "extdst1_shdload",
+                              "extdst1_framecomplete",
+                              "extdst1_seqcomplete",
+                              "extdst5_shdload",
+                              "extdst5_framecomplete",
+                              "extdst5_seqcomplete",
+                              "disengcfg_shdload0",
+                              "disengcfg_framecomplete0",
+                              "disengcfg_seqcomplete0",
+                              "framegen0_int0",
+                              "framegen0_int1",
+                              "framegen0_int2",
+                              "framegen0_int3",
+                              "sig0_shdload",
+                              "sig0_valid",
+                              "sig0_error",
+                              "disengcfg_shdload1",
+                              "disengcfg_framecomplete1",
+                              "disengcfg_seqcomplete1",
+                              "framegen1_int0",
+                              "framegen1_int1",
+                              "framegen1_int2",
+                              "framegen1_int3",
+                              "sig1_shdload",
+                              "sig1_valid",
+                              "sig1_error",
+                              "reserved",
+                              "cmdseq_error",
+                              "comctrl_sw0",
+                              "comctrl_sw1",
+                              "comctrl_sw2",
+                              "comctrl_sw3",
+                              "framegen0_primsync_on",
+                              "framegen0_primsync_off",
+                              "framegen0_secsync_on",
+                              "framegen0_secsync_off",
+                              "framegen1_primsync_on",
+                              "framegen1_primsync_off",
+                              "framegen1_secsync_on",
+                              "framegen1_secsync_off";
+        };
+
+        pixel-engine@56180800 {
+            compatible = "fsl,imx8qxp-dc-pixel-engine";
+            reg = <0x56180800 0xac00>;
+            clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+        };
+
+        display-engine@5618b400 {
+            compatible = "fsl,imx8qxp-dc-display-engine";
+            reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+            reg-names = "top", "cfg";
+            interrupt-parent = <&dc0_intc>;
+            interrupts = <15>, <16>, <17>;
+            interrupt-names = "shdload", "framecomplete", "seqcomplete";
+            power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+            fsl,dc-de-id = <0>;
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

