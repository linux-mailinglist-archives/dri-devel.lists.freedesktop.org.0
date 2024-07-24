Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC593AEE6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAA610E65A;
	Wed, 24 Jul 2024 09:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jZpVovH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915E10E652
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH0qftSqCo/3pcZ2KB4sc3m3d8gIuGGho/OaFbZZNI5kHVBir66OoSU5rJFBi7zwCFWWdLy/LE3593QiZs0NWc1exUizF6INz+6z73OoS9K0ETz05Xl2u6BQEBGwqeViJq0e0B/CYIhRW8GsHy76C9Eu6IFb36cyIfFZWhdmU6VKn+KApf3j7ZRdpF4cky6FWaEdQF1UWZWIjVWQXsIMUzd/fUR78jPBd0DkEExThLqzxuax+Q9ozN7xMVrRbcqvsQp/hLESa5cpHbmwC/wh1COntqXfzCsQ5r3ZKKTCWHfobxd0xAQMSkKqd6s1yFMdDOfoRPcPkQ/nI9HRP6JERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL8LsBibdmF7//ooawnphJQevOv1k5AHVkf0eax+55o=;
 b=n7BDmrzkyLKEeJC1aIqSP+fsY2eUQox9b7kLzsdXlrN3mXQ/o9M4s/4HMonz236E5RtfUvpdgS6I8dziIMfLBpux+pP1/YpIhWFjjl7/JZs4P+HNBf9vymSy4Q4qRAY/rsPwUiQ9ww0bIzsWIYKj0T1XyM85ANcPtoRd1Uhcr6lAqxeqI4a8gd5Gv3+M8NaeJAAyIsq1FhkoWdq0XTxEVQ1rv8/3vMVend9njV0EQxiO71X58RIuDTHNt8W926Zmxq13CFiv+MvU75ti25t8snxiL4DSemub53Iq/f3JgynFdkix3Do0fVUb7g3ssbpRnr99doQh7U6W5mPxpEz3dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL8LsBibdmF7//ooawnphJQevOv1k5AHVkf0eax+55o=;
 b=jZpVovH1A2aAVVsHK64EXUurKxVSXFiI99fQIbTcZxIzMfXUPYXls5sw1yY9QMBJWtMd+n8nAX5kW0Vy+dMLv0zhiNLPcxuublWv/k5m3cAF8W9HNf5/qpTZfexHL9XaRp1IyBqsr7wuKo/Ua0OBHw0D8cu2Ft0sDLIyP10A+lUVFNJuk/Sz5Wg7bh/jWysEMhlJadod1MIQ11IK/bHlUHHfbigbqgosnh/H8G+QY7J4C07Q9lDqtsAC6qPmElaYawSbukhfQEC/v+xjGNvPJUVUljluPFsaKYs9jNEBhDzG1MlC1tQQNDckd9ZyUTM89ryHwaxyjoLuljoddWKQfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:21:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:21:58 +0000
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
Subject: [PATCH v3 08/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller
Date: Wed, 24 Jul 2024 17:29:39 +0800
Message-Id: <20240724092950.752536-9-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c17a18-3d49-4d55-27fa-08dcabc2111c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z816E2WrstYkXJh3mNDB5NbJQRRAoars5bB+g/vMFCxLGjQYFhJ630/qU5hL?=
 =?us-ascii?Q?KyLlgzDcLCctrAeYDaIrlxtzDexQxvkgVZA7mJ3HDFvDSTm1tpKU/6L82L97?=
 =?us-ascii?Q?NvmkWAzKW/h20CPExGv1L9lV3GoaJ/MVz3v11uvkAoZnRx7VAzBOmtDImRPK?=
 =?us-ascii?Q?gT3ozjoysqxTTAhgrI8x3XsaGRpXuA+vs6k5RmldLB4XnxB5YFTZBIZyLB0Y?=
 =?us-ascii?Q?ij4anjzAwT2/xu9vjpxRfRTbNRwjuCDgzb2iersPsq7QxgFM1f/NWJKv2cf6?=
 =?us-ascii?Q?D4FxCpA6j0d60N2GhEXDJMy4LdskJCdnrdiS56F4umOVhEpT85NggTwOclC2?=
 =?us-ascii?Q?JmjZMT6yAcEOxdHPBfcXmt4fRLLyR8b6hxJ2tLKN/YoUNUBJP4vMdEhdOLff?=
 =?us-ascii?Q?z0mYoFmkoeh2MwrJ/xDn29MWSBTDQXPF8mwzgwPytLdAl5GcpsBrjbBJCMkV?=
 =?us-ascii?Q?2VIN+C3GzNH1t53yvIVb6Ks4BJ9+MLSwOOGAGGObo18M2RCTXvEjTOBekjS4?=
 =?us-ascii?Q?f13pEwcOlPmykdivb7jz9GuDR0BxViHzW/SEUPk+wl/I0v8erWWcwnNvspl2?=
 =?us-ascii?Q?3NzFbKYndPdv6TQtK2X8b7a1pORWqNXIbzpLUuKpWQGXxfOjd1Fc5YDrbBGk?=
 =?us-ascii?Q?dTNXodDZCMMt2pGd0h5lcwocjKxqnyOtMGikqX/dqZMrd3+ZKp6FMiMnp8Gk?=
 =?us-ascii?Q?352EcuboLpUBcFlG11mYUZ9gezIqixbPvXhL1RGbFSCNklkqx0g+kLmelLl5?=
 =?us-ascii?Q?X4xNNVXp5HGYlKCVRlYIdb5hN8H8FgVGjCueA700TU1QwiVIfegoQzgUaG0q?=
 =?us-ascii?Q?ay3j5+0HZkku0NuiAz8A1204tiG22fEpAWEenI1dVNfmAzRxxJtxzSzSsZym?=
 =?us-ascii?Q?CyTnvN5Cp6eQJFm+mJbQiENvNKSUqdPmijuAf8/RO/S3kA0kfDUhiOdChjbx?=
 =?us-ascii?Q?9Sx79N4pGqIf4DfniD5tuDsOhfezRm1VsNuM6h91R7AQQeVIIN5/RHm96jf1?=
 =?us-ascii?Q?xgdaa/Rp/Gyv8/4ABMWFVIluOdAk7lTXkwEcoNUTIijEs3BX/W79VjqS+ln5?=
 =?us-ascii?Q?BucvVQooFpOjTACrD4j2EwIfqEM/Tnqy6CxNuFILd+W0P8/z0gmFkw8etKtQ?=
 =?us-ascii?Q?kS3Yqew2+q4zzpBanFtSs8HUmRrYi0wNZeRTDnnEKuk/ACGGf+9/FhQKFq9L?=
 =?us-ascii?Q?tV+ic8dXVZhElGKJ25nX/wUSq6D7T4h6CMKBippUMWrimxrVcT484aTMADtW?=
 =?us-ascii?Q?taFXbMzlgHCV5evo0afRv+nrtIhAMpz4EPeGvm3yq3mmhKyBPlDwdPHPryKc?=
 =?us-ascii?Q?hYgd4kVtghEoN80L9+YFP2kqcTVeJ1rfDmScu4Ydgzn1Hg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQijwZn44nCuoV7ulTxKAhOr1xALMlzqBzOMnbNn0rturpbMFyXv3smrVmQq?=
 =?us-ascii?Q?VaH1cnEOX0zWWHkp73WeWXTsuF5cbuWOJpVdS9ZXvTVnBmA9qmQ3wDomCBPv?=
 =?us-ascii?Q?C0uJq2b4a9o1GKWR81pRKbh3dDlyG4ynrBUuQPjslvwceCk88qUYowEfhkWc?=
 =?us-ascii?Q?mxYe6p88rb9DmqzID/VerTyPxesDKOjSvPrBaOdEn8E1vaoZqVtZs6EXPPeR?=
 =?us-ascii?Q?lS1ACsokvf4dVonITUDzTiVByXMejUYHzHnlI2Xyi5HWW9kHTCgWO5/SK5i2?=
 =?us-ascii?Q?U/JMoDzAEGfNGmYX0yro4C1kgh3do0jBkeqIubpkLz5aNWp3T9+PLru+UVVN?=
 =?us-ascii?Q?fBAJz7xLuVYx1hGDPg/Y+FJ4tP+HcdYFR8kiiPNgdQpvXEB295OAR/AnBI04?=
 =?us-ascii?Q?WU+Sl4IGTev37TqXfZJKmNGBIvMhzvKYBKsZ3g95ih9z70m2RKr4vbQdMNTa?=
 =?us-ascii?Q?BrwT3+trXOnT40iXK2eV3Qi8MohSCJoMKIW5qqy6Z0jPrrD2EGr4ngCl2D9W?=
 =?us-ascii?Q?WivdemxCHt9JJlCLkTzScRICl9gIJDo4IRTmbqz6aNG+PR/uUIvuxbC3Fkpg?=
 =?us-ascii?Q?gm68fo+SgXPfROCDDL9kz5j9xx0xbb9UjhTcpKCaZ6SdON0hiT0XNpPHb8Ba?=
 =?us-ascii?Q?xSh7E5cjOGrYbBYsnK3NsjTZFW6eFcXIaGW/FhF5pnweF4KJ9A6hAi5d/Zoo?=
 =?us-ascii?Q?OSFjvO+p2kaMiOg18oeVUALmOXlIu6QLsLrfx3F8j0HQyRUR8xFoNOnPmShD?=
 =?us-ascii?Q?0c1UkMDs8eKvcKtvCNWzAB6rDgR/iub5zzPoai+bmcOGrjRwXcjGbiQvnOVw?=
 =?us-ascii?Q?1mckzh7h+N3IUn8VbWW60R1KdAIguQyNfGTTiLFJ2q6HFfq9g8LIU1jEL4GS?=
 =?us-ascii?Q?i7MbppZnyjAWoRYNRNRh8czdQ7jjPIL1iAQxYQde6iN5b9j8u/dE9pQ9Q9P4?=
 =?us-ascii?Q?14LzXc01haJgUpZKo6tN5Uej/aOWNrJ7TcDSFG8LmMC1BCjCu/v+2rBEySJ+?=
 =?us-ascii?Q?bRq8/278VnQItPMzfUX2GOaMVpa24kHNm4Km0yLX8cfsRq+8Iw1eDMGvpEMD?=
 =?us-ascii?Q?9xfWW2DtAtn+eW8CvlDc0Pyzp16ydbILdnDKt8J5M4Mega8WyRRy6w0zX1Ij?=
 =?us-ascii?Q?nidWuih6zBs6TSILshAuvrSnj5nDHU2Gsr0pWJieTUHKHX+OF5h5HFEGeqov?=
 =?us-ascii?Q?JBJu4HgPITfkuFyYO25Imcy9VBmv+B/y2UriHZkl/ENp/TMb2RFnL2EO1XVS?=
 =?us-ascii?Q?stG39RYrs+5zhe3q8WWwXHbcL4wGkcnQogU8xwVvXwyZWt4slOSVbkJPjHAJ?=
 =?us-ascii?Q?j0DECJKiueA/MFNC3xs5N4Ko1MpQa3dXk//Mia0v8NNpKAX0VDJDsMDvCLRd?=
 =?us-ascii?Q?0avMcxNE9AXV1XhXd+tBwFHwaV7z0VBp6PrqcqgGZZh4klPprFGfjkv2qRsH?=
 =?us-ascii?Q?9ocNFwfD9XJ0tuCyv7h0n8Kp8/49eN265UCgdDS6SYwF79iUnyeDK6nyeZg8?=
 =?us-ascii?Q?Dlqee+E68X8gXRJlmB5qBlBZLINMeFfgpTdS7pzR49bKWP4981Mj4Jdqxj18?=
 =?us-ascii?Q?0/Aadmc3EV1O264/7hD8ndb570EyXrfq3vGUyKm+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c17a18-3d49-4d55-27fa-08dcabc2111c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:21:58.0618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An7H+zsKVM+SJqCVyVSoXQ+UAEC3KJgT/uq39ct3hfGD4oKxme8d9tC42woWuHLIKaP6+JrAKW1Sbxh3mH7l2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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
v3:
* No change.

v2:
* Drop fsl,dc-*-id DT properties from example. (Krzysztof)
* Use generic pmu pattern property. (Krzysztof)

 .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
new file mode 100644
index 000000000000..0a72f9f0b5fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
@@ -0,0 +1,236 @@
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
+  "^pmu@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: fsl,imx8qxp-dc-axi-performance-counter
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
+        };
+    };
-- 
2.34.1

