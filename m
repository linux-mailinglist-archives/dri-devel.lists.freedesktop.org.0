Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBF9D8258
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA210E3C3;
	Mon, 25 Nov 2024 09:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eQKjXPEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2078.outbound.protection.outlook.com [40.107.249.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C110E3C3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1cEz07s0mc24MeTseyjzV9CslGRLffFpg3PLr7KSAwPwtAQqhd7vbx8Vg2oLwRN0xKCirRRfoUx2x9J8tUnDvefJ4pXOm8pxbfv26JzC6Z59yGAiURhGGbbgoCzqsZn/k7nofwUQg3aRM2q1gzwNoJljMG4H+J/VfycvZaz6cF3OyMLiI0W9GUvEqCgfGm75bpuEsnN2ad/HUy+GltfmpQcQnbcfBVzPanXy9yO+g0/uTDQog0ht27YKJ6G6SU8PVNAXzFxgPp7+e/734BwTSI5rCtsBWWYB7xaKYYVFdai2mcaeBwRhjCexze6mG9IJKvIXbgSu/kGoyRI9VpxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0I5FyeBk8jMYDJ6WmZ2e2HaqvaP/Fo5SJbZIyerfwoY=;
 b=yXu6qtesr18Ajkm86IB0otJW0sweuuCQ74SGBbKpAVMfJGMCKNOsH55BQW0XfwTU4COsHvGdPFQZA/ktwCQ/h7tdszTVsVLl4U8XR/LhYC39MdxJE00eXFh/luH5uG2P7iAScS+iW8IwLrk8l3robsZNlstvMuwRkYPnTh0uyuLhdTl7Ve3EBW61mxGy/FGf6SF/XHJOZ9bto85DB+PdKrjnd3skKwA73i/8YJoy8wtoJkyo/RCv90KkKxST1ZRW1zi08hX0oUGRNJ89buO5hgw2J+aWAWprFhhS3e6U0cSXeF1KGJp09m8+RBn9qaaidpo0i5fGL+lZrZMOujLc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0I5FyeBk8jMYDJ6WmZ2e2HaqvaP/Fo5SJbZIyerfwoY=;
 b=eQKjXPEmYPGyIB9LHifpqtwhHYHS7k8RUI/MagbWxxX6t6Qp/sZwC1zc/N+qgu0FMdKO6XmHAitg+GhiZNGmPRBL8DLJbJE+xKPTExKh7uDkbel+BYmVjGdTf7cWvjynHAXKDROUr/3P1MKFMDCfqUFd1v+R0tx0CThEUzB6Kt5DAb3MVjxTUhELBGS62J3I3OrmhY2k8dGjrrrW12QuDTcpznwX4KkM4axWc7c71oXMbqscaAPDPQJVszy5/P1KPug/e5xCKLxvS3aa2/xaCTwxPBg0Nj5fsuu/Nre4XwR/VPWDq+3Dty6ZVP2WraeSjNfUeRopkikl2HbGYqEifw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:33:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:33:51 +0000
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
Subject: [PATCH v4 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Date: Mon, 25 Nov 2024 17:33:03 +0800
Message-Id: <20241125093316.2357162-7-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: b8438431-3139-4770-664b-08dd0d344552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IC6Hd8b36KJibcuBGTsBgnyMkDMk50OB6BDVLLUQ8YWpsFdaoTWULpuwLQc/?=
 =?us-ascii?Q?F1sPqQrdNvHVun7w1opy7khaXld+Na59+xe1i5+jjw11DOE7+gNsIoN3ZDJU?=
 =?us-ascii?Q?tSaxSuRuMWtbx6HvMb1bs+OTZUjBRCBLjoL3l2ri9Bd/Osrq70yc0oPXLIGZ?=
 =?us-ascii?Q?z6pQHApNJNEI+VPqqKtrLLAf1+ZixBxNRgGP1Qnk77AbpT+mZy7wh8gIkqGB?=
 =?us-ascii?Q?/Eet7OAg68pagzeGTJFXpnkGZ82Eih65RLbG0GnePtWZ/xwgGtSjy1g2Frc5?=
 =?us-ascii?Q?MduUzHvRZFeEJ6PpMxOD0RUXuFFmO//I2XXt4LjPOhrAQ7Ssg7O0Sa8Uj4bJ?=
 =?us-ascii?Q?cc+eMQkRuLaWV3/bkmfO+s8Hj2hspzmDuDJB0RzUUVvs5/E/eJGE+4tkp7Sl?=
 =?us-ascii?Q?f8cClhOXoX/TWwpsY26B99V5psfqlXmwfqha01pD/70KjdgAH/iciVIkISPN?=
 =?us-ascii?Q?GawOHNKZcsoCIwIvVW3YDKx6ckOFegKQgsau5VMKdmDlkSLHGCc1wST8D6up?=
 =?us-ascii?Q?da3ZFswR95uvm7+6z641hCVxDs3MD4UZ9lJJ/Icp9ZBzTqx9G53C+d6oO18u?=
 =?us-ascii?Q?jyXY9l8JKV/FdIrdT8nn3gfeiuz4mEkF5VAFYLvQVfn3rIiXLOnNtqgaSZAG?=
 =?us-ascii?Q?+o3BnPfUdCuBgyWbWgf4gxP4QciETBxmOeQciyMejclJchFLHpqahCDox8kM?=
 =?us-ascii?Q?HHA31i1EHJibOleam4TXTluAXBAZy6zp3vCCe1JCMaHem8VKCDOeWUHUtgyB?=
 =?us-ascii?Q?5FN3nCsklEBYxO6/N86KX1rt01I/p38krtcW+3yM1VAyRKeF/MRyt4DmRE2r?=
 =?us-ascii?Q?dkgSKmoQDEVXbbXxR1bRlPHh6KqjnKfZWDwu32qERrPR8cr1rOSmKxoTwpJ7?=
 =?us-ascii?Q?O+MQCRcQmSJfkF3nYrfIu+GJXPYilzrBiBtt9ayTzYArzvGVDee4u5caAo76?=
 =?us-ascii?Q?P9fBA/STdmfQFAk50llxu5PVYHpY5hc139e8t8jMVTXGaProhXeB209fITPq?=
 =?us-ascii?Q?yshqtHscE7GwtMcOkmFCQzumconV+5ZkkcTyjiGYcSyp4uUoOLH9TNdl18TC?=
 =?us-ascii?Q?PlvYBGPyeiM/sxZJOLmFqq7rUWFsR8hk6WAbcH5hQwzj+v5UV14BDlemSaDL?=
 =?us-ascii?Q?KjzQoXmKWHJ8k0VDDAzF2WLTr6jyM+L41nXIsNe5RgenNIZBsR+gLX7/YDLe?=
 =?us-ascii?Q?0u7F7ybYsCfCjITdayswhst2hBWmEccF6lB598APTCb7gOjDClfMOOIi9if6?=
 =?us-ascii?Q?jixtfbm7Y5qvuesXo63p+v+BMf8g6Rmsz7ncQM4+AhCc0cKAc7Ly8Awa4TxU?=
 =?us-ascii?Q?otZMWAinou+39z/ro3rpuAccdbVvZrmMsAd1/+MwZVEv5A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UGDirLkkcjaLnmn5Ub85ykh3HsfxeZEmG332xjmnEFLIjqYizBW+VVxNYBuq?=
 =?us-ascii?Q?wHA6vyzLfSPFrv8SxpGKBVtXm0S+0QtpmZGDhryVwr/xCFesmHNuebOCEXLV?=
 =?us-ascii?Q?Ow0v3dIKFptlG63993yEayvMMhsoDzqVIig10rYaJXioT6wNrX0tesfo1PMj?=
 =?us-ascii?Q?UIJVpsKShIYVYfjBSf0RZu7fjmFGI0iIJ5cZgAQmNhKoxbdo+YtRbG7GKFXl?=
 =?us-ascii?Q?9qpEVilce9nHsZixgfuudvyvqUvsVYE/VBoxtzuIVq/ykfLhsmg070s7V6xe?=
 =?us-ascii?Q?R49U5iWvsY9udSIT7fxIRkexrpRYCroqu5kdnI87Yb2/54P+I9yc3E+5ckKa?=
 =?us-ascii?Q?1rBee9qb4FzibLtdduQ8snJE+OdvsXZj6ASny/EyP5ldrXqsMrG0ZBnRT91R?=
 =?us-ascii?Q?AGgf2BarJ+demaxldc5iLujVMqqmK/T9LwBo+IjOQLd8N7cYI0QNu2WFMeYp?=
 =?us-ascii?Q?QN82QlwrsQIZBDs8sWtL2gxOzLffmxL59yJNXj23NxnlN+qBADgRTO7oSY/A?=
 =?us-ascii?Q?dmcxST0KRqMEio2ww9aJsz7L0wnYE4O7LrI4GxqNej1dXZJJiIRdQQTT58IV?=
 =?us-ascii?Q?g6Y7zUIM2Qshcq7YCNkA4BuCnvbALrgacPFBerNQvfl+EY4/scVkM+uTYhNF?=
 =?us-ascii?Q?Ny7EmwPgbEEdlkq7DhszrUcYauxOivYi50iAojZ2GoiEIIeMuTqzLL5EKO92?=
 =?us-ascii?Q?pG/gMacqJXOXaOlcvVD+QWStw5KHi968R1dAmT7uBkMLVkFclA05GKstLb9G?=
 =?us-ascii?Q?XtlwocAEzsU2c9bwMnNsytT0DAlopcUmO5VjyloVUwKyPt0ZWONhHOfNHO4H?=
 =?us-ascii?Q?h7kbGujOhBE+wAiwph7S3pIDMxjD6x/dUdUhDThcrKQrfcjKT9nD/Yw6G0nc?=
 =?us-ascii?Q?BnQVM066H09n9WoVDclUG2Hr7KfLr2XJ8TSn48kAxUcmxKyPvlF9S2wpzCF4?=
 =?us-ascii?Q?KCaSmDzgSkUUFnrmGNOMYSCD+uyI8hntL8uhhmMXXQb1igZkvZk3bANqN1TM?=
 =?us-ascii?Q?Ecserxoi6dQ0LBHSuWREGq0kU2Hg7bE46gyrLebcLaRNIjTeRB1lIXk+Cft8?=
 =?us-ascii?Q?Nz5sYev3LgKAvBV6JMixICvjW1LHLoFjU4LIcVj4L3y0hgHBmVlQBjQiVsuC?=
 =?us-ascii?Q?Cxd8en49QZrQYy7AkDKo4o6B+OHcKBOf8+95GW6CM7TTnUEVBIZ0SjJdkmmL?=
 =?us-ascii?Q?vYhOO2zRnUpduRWtBbnBE6nuItVBzNKAAFnzCVDanvjL91NEKLvtYlbSIWt2?=
 =?us-ascii?Q?mf9toy+/BR4lYr+qfzUzhTwzGxhPhS4VW8NlD+a0Aok/cuPIi6a7CRE9iOq6?=
 =?us-ascii?Q?WARMLJLh6q/Hj5WiGwebhAAm5KQq5vvrVl7fXzdjGAknmMEaxr8Kycfmbwvh?=
 =?us-ascii?Q?eWCO3YCckG0wbtt1Tig7cGPeXw4dkHMqJQuscvjO+TM0zziLurtuq4/fiGnc?=
 =?us-ascii?Q?h/PjdV4unMYp6gk/vTSg7rKLId+PEt1JQF+qgPe+46aViWduSPhHDn8/RhA6?=
 =?us-ascii?Q?aiz3p+rqgPCXyeNdCcAqHJ5gWm6KZ+anxnvrBBsns3Mz9s2/HTHRgeZlGYqX?=
 =?us-ascii?Q?EaaMlq9XsKMHll+X6wWZnOkh8bhg4i9mZgh5a7EA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8438431-3139-4770-664b-08dd0d344552
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:33:51.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgD43DY4RiaeDmXq+Q3Kj/9E8ghOH7lmZ3JWTJUCWUtdoQm+/p+t1ar/UuTdI1d61SLqf9j0XlSg7C2CSylskA==
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

i.MX8qxp Display Controller contains a command sequencer is designed to
autonomously process command lists.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* Replace "fsl,iram" property with standard "sram" property. (Rob)

v3:
* New patch. (Rob)

 .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
new file mode 100644
index 000000000000..27118f4c0d28
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8qxp Display Controller Command Sequencer
+
+description: |
+  The Command Sequencer is designed to autonomously process command lists.
+  By that it can load setups into the DC configuration and synchronize to
+  hardware events.  This releases a system's CPU from workload, because it
+  does not need to wait for certain events.  Also it simplifies SW architecture,
+  because no interrupt handlers are required.  Setups are read via AXI bus,
+  while write access to configuration registers occurs directly via an internal
+  bus.  This saves bandwidth for the AXI interconnect and improves the system
+  architecture in terms of safety aspects.
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8qxp-dc-command-sequencer
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: error
+      - const: sw0
+      - const: sw1
+      - const: sw2
+      - const: sw3
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle pointing to the mmio-sram device node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8-lpcg.h>
+
+    command-sequencer@56180400 {
+        compatible = "fsl,imx8qxp-dc-command-sequencer";
+        reg = <0x56180400 0x1a4>;
+        clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+        interrupt-parent = <&dc0_intc>;
+        interrupts = <36>, <37>, <38>, <39>, <40>;
+        interrupt-names = "error", "sw0", "sw1", "sw2", "sw3";
+    };
-- 
2.34.1

