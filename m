Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23149DF93B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584D510E424;
	Mon,  2 Dec 2024 02:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jT86+ccB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D3B10E424
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuX7uVKAaJk60Hcgiu4VHtb+LTx0pN4xH6Vdt4ss217046Zk+N+Ttszj80UmHpHo2W2vD9/XpPqokm29PiSt9RCD2laPykWeGMQb5aE1KxCcjgNmpcXTxer7BPrceDxQyzQ6jyeAFFSUwKsoYc1pTFknNDvQNgGX3UARpVo6awS7VgMA6QPzE8cKo4/gzvHcDvQrRth+EIVC8msLIhfqnrF43kfGBCwETM2jYa+ZKXQ02ACTNNm/f2rpCFnCrZbX/cWZDNVAje0x9j6qjn6tRWnCNJgTTHQavCPyxC/V4yD+GmDZ4le1lNANJkvxQDwQeT4CGJ542SYJvaWhB5FQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2rpw4+VdCzP73kx14mXkiJx7dXMdbtWGLz75wnBuCs=;
 b=kVUA1m2vH73cfIrfZbbb4lu3dbJhSrQgBRkUj6iHkWsnleC6YcVpAmN/ZAfbIdTw8qGelrpXbgXRFJKCWqt48BsctbTc327RGuBX9G4nn0ZG3hnEnuUFgHqMtUtjqlRbWLKmLM/LTSOxwe/lIu/ORt/wTu+Uz/vgHFw6HOrUqgPEyHXjGnupQrKv6hzmRkwZnScxPjB5yddSylBH/Z8ZMxmcJTaXRIXDAq3jBLo2kIzFoThm73U3ltNlbqAQUiMsy3SsS4DOe5f6yfa5iL2RhCVBZqlXAUb2GGHF4K9DZYP0cJQEnuHyPV5GEfT0a5vdJuvA7Jk6dm0yQN9zrpMe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2rpw4+VdCzP73kx14mXkiJx7dXMdbtWGLz75wnBuCs=;
 b=jT86+ccBzKgNTtzzfUyfRa+GoXg8nlI5E87olNxR5gwAAwLR79DNFo70ro5opFSnzOXTG+ieGbAK5hvAKFSATEuF3G+iSK8QCfiYEX0bzwQgOftkzfM5ruYNjIr1pImkdEvDw24kMtfhAi+RDhnEP4UjdYmOlVQjMhDEXcvHOgEKpkJzFZ2SrtELUXJ0fBI82dqXFbKQ3SB6rS4wYWmdA69L6VTwaAmn+I3mm/viq2Jmr44BC9+amztfdud/13bSHITK9za1NUPBSWY0lImBxWpmR7RtHuMCbG4kGKOy5tB9zw/xiiXrihmkCct0ghNFc5bEgTgpSDz22QXaaBZDUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7643.eurprd04.prod.outlook.com (2603:10a6:10:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:58:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:58:22 +0000
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
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v5 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon,  2 Dec 2024 10:56:31 +0800
Message-Id: <20241202025635.1274467-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202025635.1274467-1-victor.liu@nxp.com>
References: <20241202025635.1274467-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 49be9403-b250-43f7-951e-08dd127d2ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u9ia4ZGIg1s0LXVU7s8vJmU0B4Idm/yVCFMU948+59BXoT3ML7fTK2NEj6mU?=
 =?us-ascii?Q?a+NXB7MizWmO/cBduHX7A2MIf/HB8WTBOXViJa1XurMo+OjIjMZR6kCzBaYh?=
 =?us-ascii?Q?MTEsErdmA0vPmc7rcNZVcLFpmZqKfxQFrCQhxgtPjyYo0DGTtYwN6B5KK4E3?=
 =?us-ascii?Q?GbrfzKj1az5sbqwqfKrv27JBdipvIxh0XT9ELKTi/S/9aDaVB+UuxdFEALj/?=
 =?us-ascii?Q?/kvaHzAar2Ect+5bvrNFBqnOAAqsWE9rCZviAW14fuYp593CME6oDuwE3elg?=
 =?us-ascii?Q?iLNhNGBO2ZGxskzQ3wxo3oMsFRAya9uVa0VsKHGO8JpP8zRpJuvMgZu4LXMj?=
 =?us-ascii?Q?IxloZVkaHMS+zWwsiVVuM9I1xYUO8q3QvZtFKKlBZHGJLdkJmpzF/4OR0D/U?=
 =?us-ascii?Q?9HM+RxUvlYo7jdb/3WgSC0wNrsuNOjmycS81fwg1oe88O7fAvmWRY/HmOCNc?=
 =?us-ascii?Q?MO+xCKZkpAFAdz4P74nCoVph0muf7EmBeAd9KoJCrj6hAoFCOyBGTcZ/oeT5?=
 =?us-ascii?Q?MTPhB4i/e9vQh79x3mljPt5uaLO7RAgZ6+gqty2C7XK3cRbdBYTvW28QZMHJ?=
 =?us-ascii?Q?e24VSIvFBBWhIycJdezio7gXpuWAgl/ZR33my06E83x31YbAoEPD8ekIDIXh?=
 =?us-ascii?Q?luQYB4bcmfF1Yx55dMn3Qeq0xCYIOHQFRg1E1mEmH2t1AEvk9VsBMnEvFasP?=
 =?us-ascii?Q?/zMu0+0HWyBBkfpOTD7OiYIaTF0b4VQFZhrNg28lJm3kZStARSugQyqEyL44?=
 =?us-ascii?Q?0R2jkr9RXKwtv7IZ5j3QV29gQ9e5g6wiDLbjiH8SNt3Bk4bmYQOFd42zFIXQ?=
 =?us-ascii?Q?ZzkgetwUjaBa9n7qUP/04xoXK1qlY+ihdIyCRcm5I4pN6jX3bYHj39TUOPGo?=
 =?us-ascii?Q?m3y2pAz09/RbGdlNRTz2D+3t9LgtuZM7HKBKT19x48rwi5CLvlTc7fD2eZrU?=
 =?us-ascii?Q?3pKhAgu91j4XhFfjXXZGHbWscdOE5Uv6dDwFKlwxFSsm284YBPUCRaSNalsN?=
 =?us-ascii?Q?xqvo2RBkp+KSJx/0vOdr5mFTQhnsJ75rB1XlYbuQQVTw00UBiMSa6nYkXcyJ?=
 =?us-ascii?Q?bGlNdNhnyqqDI0rV8zKDeLdkdnRhIkBaqfSBgXzxC3oLOpZ7r+qDm0QSUbdK?=
 =?us-ascii?Q?c1p6GEUClcPRxpZRfb061y9u8/iNKimAXVDbKrheLs01+jgfkyfyAbzTaElX?=
 =?us-ascii?Q?4Linzy4TPGu6SJy/aKE8vf8bEtbG/EovIybLrNSkR2kD1RmblY7Bhz3kG1W/?=
 =?us-ascii?Q?tT5ApjeKzvZZmm+ULBj5T3N56lpT0yDbc03IrdTOQKDz5UyhURNdwIJb58/g?=
 =?us-ascii?Q?aw5BJF2vEqO/Zd+CfpvpxgL2T2dFWZMj0dbh+njX7RcDSQJYhNiczQdtdL4v?=
 =?us-ascii?Q?NQeF/TsW4v4I6WK9Z4ll67Et3LqmbJ/ws7CTafaKfeaDkVG/kA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?magPwY3bVgANWP0oi33UBpv9sRRLStObib85/fUI6PKsUCAmY++7pZlOcmw/?=
 =?us-ascii?Q?XdMb3IAZC1ARA9pJzxyPh6gYY5TyQihHHmpMMDrqsi6o9jIuh145vrMe1o6/?=
 =?us-ascii?Q?Li6fPWUR5dojJZp3PDtHed08zjQ5lUydAzJecMBuWzOlGYmdiZy0zviGrxkY?=
 =?us-ascii?Q?eto2Pd11JImncgG0rDO4UbFMOGrOLX2AVcsgmrkBYT2SUpMnj3Zj9CPSRCcW?=
 =?us-ascii?Q?5DsLFZULGalABtidSS+Tw76ZQNqmBqYO+wkyDs5U+oUZtSgjbOPl9iNt46pJ?=
 =?us-ascii?Q?J6bUYxbxnsecU7BudPSj6n9ZvnRpsnjZqOAaSw4efv3xbkGWl1rzJPYqf4mq?=
 =?us-ascii?Q?PB5TH7G8GEYCc46GTIJzHyHzb2BAcuc1FReTGA6naRwpqezcJ4nYa6ZHTZXG?=
 =?us-ascii?Q?9oku9nNV0jmTiQsNVQtw72lG/Zbcd80NPu5FrXUMAI9JB1DcQCgL3QYsLWaK?=
 =?us-ascii?Q?Tc6scsdn2qPhfnUDhMulYRurofYrXePzi1CpRcWucTOnq/KFSEwnxreHEYS8?=
 =?us-ascii?Q?dD5mDHQ7iMTkeC/F2ywgNJaZstZKxTGnb/kDpnLsvc4vaaa9AiTK1f2MAHJq?=
 =?us-ascii?Q?mB2b2ELF9WNld5ex4aXPfagDmnWbqoE/VH0HtkVxHxkpwxEw5NiBgI/SCU0q?=
 =?us-ascii?Q?psMYF7r/Hv6UUp3QUP50SySgvky5Alw9tYNpXdA1oblxVCLhuH3eqsUfm5nh?=
 =?us-ascii?Q?SDOGl/WfxDezRqHJF1vKVfOnDUJJvYSJ18wW7crfmN3ERGHrIbTx7jrjVbii?=
 =?us-ascii?Q?lGFjVUpziOORBYUKlpceAEGXcApuNJIFc/gUi2fzDy9Dxe6TFizu1/772lmJ?=
 =?us-ascii?Q?L43rSKpKNnHTYMKGRQW3P0WN+giw9BRRmmMxTySX1Wpszs2bFyrsWYsDY/Pt?=
 =?us-ascii?Q?BWOVjl8vU2cAYaEEIBh+Tn4khnaWetsxyGygvse+0EIal27w/g02P9QwXcR+?=
 =?us-ascii?Q?/fQahuQKBMlgf4KJOwBAV4BzG4HxRdIUqaE06UY28HqZlxg4DzQt/dx/d6lD?=
 =?us-ascii?Q?IbDEt2ixUCKDDe/IASGhs2y1bD5xGPhGnpx8G1TvLAPMuDiEXoxSFAOqIhId?=
 =?us-ascii?Q?d7eUJuhyeCHP1ZzAWZ7BA6UdzUR9RpAlPVaWRtq94tsTp1wqEMcKzuQ68z/q?=
 =?us-ascii?Q?PM+4UtDlR+xg2QEuoN+Gwyw5y2rNc+zdk6sjVtJ5hrb2PvyYaFPQFLkYz10A?=
 =?us-ascii?Q?nOXf2E43baAmf1G3EmSv17i1VdrqK0eilaG7wIvi012w1JCQh9P6nzVh75Nl?=
 =?us-ascii?Q?Qs2u+XMNRlyDkUxzO4dnBGnGgj8oH/NStmr0Xhht2E+qa5fm0uAmJGiuXPiM?=
 =?us-ascii?Q?iFXmUAbpQd2LFzj6Q2Ewrf6CxwqZD6qnyQYKLVo0xyMZplvi8TzVCKH+efUW?=
 =?us-ascii?Q?NxbXEVQwsC3hZpxRehPY9yLNjktTL4Ti4JmuhFQX/nt9XWuOQIy3+8kVpH8n?=
 =?us-ascii?Q?vepklhmD70MsLwbabFrtXcK7rFrAGz1vm+GZgK1+nehdhBkpSfAr4gD7JWC6?=
 =?us-ascii?Q?H80Utz5Eyi6byRYTTIrmW5GWkUN18oWAW9b4mZR+2Q7syVG6Mz6prHbvrwuy?=
 =?us-ascii?Q?oAaqVvjukjgFMo4yKm3UlbJOrQZSAodAX2eJTHSW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49be9403-b250-43f7-951e-08dd127d2ec5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:58:22.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qalq2sCxlQLsc64t0dtAj4oFkePYZYgjQAUKhzMF5VeO9wMSsO+QH6fWZviPAFZOaUY78tD0GlZN/4PvAC/9Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7643
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

