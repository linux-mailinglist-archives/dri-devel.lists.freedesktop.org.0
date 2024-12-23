Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F129FAA9D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 07:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6DE10E411;
	Mon, 23 Dec 2024 06:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="I2BinXru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896BA10E411
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 06:43:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vv/3ZsehJDtl7N4ygYjOEEe1oWCT82snBdaPvJoR3A0nPQDXr3svRCSxgZBtPtgY3EPoOOzLKesPsDfhV0w9lJHt1hApGsMkihG5V3OoVk3HbMq6sx+MPPthKBAJmQPXdzuXbeh73inOjRfam94mRXo6JSlK8OyM866dJYkuWJM76ehwwwEgZ71j0uc0X4rBSBJGUYQIMHKag6ZJrCNPFm81eT68bYCOHOSTcytODXEndvbGbaq7h7kEM5vrVXYCK41LC4l0Vx3zJVYiRps3dIqA9ITP6P6hMpo9+eeJZ2mtPRYKARp+5p7rYL66kJl83DWAVlkhVtrsqBN/U4NGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwqYXc5fhw6NY5r2Dv0HjcYeOweeHaAPoP9ki29LAYE=;
 b=nQ8LhBCU/OzvXcT9PXxE1O3/xWP/ZmPFxhI71EWhvqFYwdxSTP6o/t22Hk1nMW8qgZyHjXUe/KOMtETJxSWGDv6nsDepc210dc4tUSeWg1VxWOTpbc5tPC0Rwm4bzOa1F3gdJ1RJZEGLWbywk8yrvzd6Rw/vlEKrXmDwUhZlGGlbPlwNMdPlsNOFfOdqaBqnsoA3chjY36ZKur8zC3NenNIQ8l3zA9t2PUFDXfKqtB0tZsd8ZlBXTnThJ7LhdTjGyjqZAjYjc4cUSZjC16QShkjBfMYEQEmxMy0YyQYO42ngJWmWGz61/neuEAc0nlDMRQHkMUT7ca427smyebSNtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwqYXc5fhw6NY5r2Dv0HjcYeOweeHaAPoP9ki29LAYE=;
 b=I2BinXruYMeuWQJlqMakqG5GQ0w671kMt64iAxKariU1UUXFS2RW60UVizeT7sWNf98BRyPt4sHc5k2RMnTR7V9nU30MEeVTznKaswppCuyJIZVAjHFWv27f8/jId08X/F/S/2eN3LSfZWhEY35apvp7fFdZxpWxxEAOgryAPXTGWFUVK1eNycilA3m16Yaupln1FF4UREszt/U6nKHdR4L2wTSAefliIUOFuWtDzC0ulOPu4WQ+UWguBIHv0ZRM8hnTJJcKsx2XpjezheIeAPCLEvtmV+hnffqfvWbmzdjvH08WIsWF3vivwBbsxzl0XUtYFSKwgobGhmbxlNHsRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 06:43:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:43:40 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v7 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon, 23 Dec 2024 14:41:43 +0800
Message-Id: <20241223064147.3961652-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223064147.3961652-1-victor.liu@nxp.com>
References: <20241223064147.3961652-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 249638e8-e412-4347-616d-08dd231d22cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vhVLLFYh8gmyqak5yTrlZukeduDmjMIRF5MEcrxqt1xkFtAL0Xm5YGOLCunY?=
 =?us-ascii?Q?yfqTTiT2p9wrYSmFRF+kL0v02h+P81EijdaWn8lkKYIKzRpyb5OfmUgBXaCw?=
 =?us-ascii?Q?wmje2zdoupiv3H34H0nyVwyuSLpbo18YmwEqKuWO0Vo365Zu/bN+L4sW0wzg?=
 =?us-ascii?Q?LU4wicKl39bANcrkrFOgTo3nsSkEI6QCG0dWuJzWQ4E7IyTMuzyotGs2Cmog?=
 =?us-ascii?Q?PYCGFGh2Kn+YxWMxFwQ8BBGbcI9N8VVutkpXaQVuyook400Rv9+1etL0uAwn?=
 =?us-ascii?Q?wDgft7XfzI45XMJwxjasJvQ539A6sudorItd3X0Q6mFBYjaF+V8u+jY/k25O?=
 =?us-ascii?Q?HQQQ5GWGM4kEE0s3B4GEe3FgaEHojCPHxy5FIwsetgAolZt5KH7SIjkBng6N?=
 =?us-ascii?Q?xCHpnSC4p0NFqnG+yre3l5Pag/65kGRQFJNOEZ+a9pkNbyJqDjRw7H8zmzjA?=
 =?us-ascii?Q?qRnyNqPUP16pX5xOsW8BHm1Z1DMLBdGDqcDetCRPqWkZ/CIBBV086ykW5xbk?=
 =?us-ascii?Q?UC3og/JceULE7Pg8iri4jxlnTtjTvfVJM2sZGDMGmuhhufNm4rWjvii8xAM8?=
 =?us-ascii?Q?/FOtZE3E0q/ExFUG5mW/pqw2dnMaYsKiIK8s6eFN0uayrjROh54anpeyumSM?=
 =?us-ascii?Q?N+Dgi0kFp49UxOU8JG1+mgqwJPF6JKyyeqz2S0roMjSGOpO+hvRhVzhDdqbJ?=
 =?us-ascii?Q?snMmzTGLPjEaTP+sUYMpsOEhHOO5sKlRkvYQp7OzKhxG/hkqTvn4fhrh7YW8?=
 =?us-ascii?Q?2ao6rAb2opo4vLS6daGAKUBEI82MQpMd+0s8BfF05u7KrdAdfKHAWCXtA9Ua?=
 =?us-ascii?Q?OBaTyu+W3zutQvmfL6JJpIOfY4trh74sYbtsznOTT3oY32EzTN8DflUzd98d?=
 =?us-ascii?Q?zN2frCIh9jlsEHr8Y2HMjAAqLrClJRV7t0k3Y0hPwF3gma6O+37ALO15wszT?=
 =?us-ascii?Q?bCsg1Psq+lPGH+bx/Szehz8B24TEjLbpl5RVtEDmem7xmljwNNlJsXeBbMAo?=
 =?us-ascii?Q?J+UuZzE7GNaapVrF7IM3xkU1CtkZ6Jakr3bLeCd++o2sm1rPx2spXpTcvodS?=
 =?us-ascii?Q?KZepilW89nF8XgiM6f2aD+PkXr5SvwiAdzKlff4++OVRzomiJPnHDeLDeb+W?=
 =?us-ascii?Q?bGu037dc5LFw4cZ9d5eG08f02QnL0ILUV6HZXsQbo6oXvpBaYABuorS1tbb6?=
 =?us-ascii?Q?B4X9PdKENHzODUjGGJlThvuoE3Hf1z7BkNqZ5VXjaoCkmfhOznPgQ++nm821?=
 =?us-ascii?Q?uUHrEO3H4zrLjN/5zVhUpwNceY5Sa1ofa3hm0RfmO8zHe0fC68fjQKJ9MrLM?=
 =?us-ascii?Q?cmMAKhvXh9sdl0dcKvyGvaNnFBD2D5BqlCOb2Jnz2to1k491zCPc0N0wJDLq?=
 =?us-ascii?Q?NvlhqXIOwPOEvOi5z73jtBYqxsQuTHPOpb6SVHxy+qk86rt1b1R3CY/YxUan?=
 =?us-ascii?Q?5AN1kp9vDT9KDZYxdFH/GyeklmCWaBpV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TZai4iVXmSOgiFl44zRoGoIR9ZkP1Res41w4FCRlYJLyk+E8GHRT9W/wk0W?=
 =?us-ascii?Q?CWfIiZ5o1t7OOYtOaqXZce4x6xY4+nmQJ+0d8D0tNndHiGcoLO5fiy5i2kGT?=
 =?us-ascii?Q?0uJrF+u6xuVxO3dt59bYLVCdRG08J2BtT/39qO7aJmu9JVFHUfaHevrE3DrC?=
 =?us-ascii?Q?oYn04mZiSGcsABbF3XjGm+1RxwGOK8OU6UlhNy3grWKDLisN26ilc3ZFW/2A?=
 =?us-ascii?Q?IPiIUB1Uuu5QRN/DFTXsTJfzhiS3vwlGvjjGUARREEBumxNVsktYq0ZUurwk?=
 =?us-ascii?Q?jw/iEZvpwp9O6rlA7vFoQoxNFKhzlO7Rnj/HqaRxjdoexCrSm3PQN4L1GsqK?=
 =?us-ascii?Q?aVoG2mjfircjipPG0bmUspR4y9KLHvBFCOa33ooCXntJNO3dq5POYTov9ukJ?=
 =?us-ascii?Q?gim2lTuxt8K8eRuoMee3qhKAPSa8HWZsoSR6UnNv+rSz6k7KGCnNcYEQcMZA?=
 =?us-ascii?Q?NxKVE/4QdmkY27WjtuPFhGNRtp8e6OwdzIwT9a1k6hmXApANYsk7AIRmpz6D?=
 =?us-ascii?Q?k5CoidKnoKBCDP2N1hn/jQWslsqu1xhkY3pNE3XGUqwm5xHBGCG18c1ex3vo?=
 =?us-ascii?Q?mxBk3YUrC6Wp5LFqVyL84F6HqBXRQRhDsz29wjIsJGdcyQ/znVJDJf1SVcB/?=
 =?us-ascii?Q?kwdYf/jl0jQ1eqJl62PPDgLK5jNQw9Mo1t/G7Twzd3CRQ134giStjELnquNl?=
 =?us-ascii?Q?0Uc5WQYYrmMHsvMZgvzFrzo/IaH53up+dB+E+I5CtJ7KshM0cNj+4POshSSR?=
 =?us-ascii?Q?J0HtzCEP6I601gR2yxs/Bm4kSmKqJPopHonAmZWY6a7iigdNnChK21WuB5fL?=
 =?us-ascii?Q?AfDSS49g2JZQxtu/rsXqMFtRhtkPO0HYzJcuYDh+Fc8z4/3xC/3zh4am2rwK?=
 =?us-ascii?Q?2nt7lDeaoRApY5ABQlLI+OYgmJNWGq4ctRenRnfKo2ljRr6yDO3WVkxNMiAe?=
 =?us-ascii?Q?963HPEjxlVlewzcpq9H5bzwz41J8Bl0sgWKkMuLlbn9nyifdIG8e7Msv4Fgq?=
 =?us-ascii?Q?A4HlqXa1ucRj7fmC8vkek+E++Sjss3k93GqKLN/ufQt1zWpFiV00u58I1UJF?=
 =?us-ascii?Q?jfoKc+ETDYGnR0xGipv0XZMc0dd1d5L1Ax8lvtomLGcWwxYpkuC5k9CCQ/wT?=
 =?us-ascii?Q?kjhRqs2/VR0Q18oz9QWCFJ/qQjWw5gq2ZSOWVV4q9nQQzdrVxRk1CyDEODVi?=
 =?us-ascii?Q?psZTSOppUjp6mLzV0pMVo7JAHcL3EmiSptQ4/g2npgTWLgCcDPcQ/4EzSkwv?=
 =?us-ascii?Q?ashyeIif2Q8PCpSMdSPRWbA1u+dMO7mbcgETsXl7n22yAuPmhgJ0gEs8TGse?=
 =?us-ascii?Q?6ftU1nkgnI7p5NOpdfW59rAVi3kByIiI42ZfpsQguHUuc3tqHoPurRBsZNJ7?=
 =?us-ascii?Q?bilEeJFnu8Et9luKJpiuzBk1K5076So0AzKDx6aewJ8XDxLwcujevuVtzzNb?=
 =?us-ascii?Q?h3VQuqWqTiXVACZ0kBMp3SyHT+vGPBQaok7VEAMpxeyJR5htch25TMKhwGDQ?=
 =?us-ascii?Q?FM3+7NlbGhf21J4pkpHfLBrkbIK6MAkJhgoahd58QpkTd1t/3V3FmolKNCn+?=
 =?us-ascii?Q?2BVx9+K0lYAcIxc5p0japnz476T6TihyN3Q7QEoZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249638e8-e412-4347-616d-08dd231d22cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:43:40.2611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7YBs4q7pQqU6P1e8EOlvUkl3dNV63t0esnFEnP+NGcU3kstSm41fDdecJayB8t23qbrJZH8GgTkw2bamhgrVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941
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

Document SCU controlled display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by display controller subsystem device tree.

 .../devicetree/bindings/firmware/fsl,scu.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c2..1a920f013ad2 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs
-- 
2.34.1

