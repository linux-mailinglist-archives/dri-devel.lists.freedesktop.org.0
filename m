Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B79E89D7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 04:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721B310E472;
	Mon,  9 Dec 2024 03:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ba08iJs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1743410E472
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 03:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUNSPaEa5JXL2yD1J6NCTagAX5q91JpI905jkVTFYv4Ecbr0IkIJ4hmgIuHFzeEFeaa/Jzyhju9xK3nB+uNpCu0f0fXAy+AvqZbeisCuFdXOIe8KkHtbxqQK+MqD+VxIbxsdZ97kxpRjeVVaR9NCPWuf23C2dfYYGWCthoT/ANK08EGbneVholQnkr9AP8NAwxZCpJGZyHBxE9ZhXnhHrO1oLWsf8tJf+HwUB58FMjW0uUX1U3E6xq7BgIQzuqgqY0RxOVwIdbu55IqAp76sgT6L2o/lHT5DKLbNuQJOCNd82JGwZiAJ3flo/ey0/hbkM0TSfvb9d7PKrAbdQTxJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB6bag9hdl2ny3ZXfV+swikKX3XuPVzrj8mL9TUZvBo=;
 b=pgzDAPh6hfCuW9lU6QmjJC+mREdd9xyOcJhOkkzX0DTiX4tpdKRsCTBLGW+JwTzEbnesFImJ9RaqyF6FYZ6Bl4VMvRrDTLgCgQqOFfWRavNsHTC4oph+zEc9bVE4ucq40UdvhN4gGqjs6ctJdxSVxUmMw4PmVUSyKazxsU40Ix8/jj7yLTLx5FRLf1Lum9tPoEWmgpL6OLHez8Bb9x/u4woJNgV2+Cq1xx4+escwg6xl5I9Cqjr9EHjdrldSGbsYM/rQ5tOF8wHIvVhnNIPTVMtFX10HtZayXRNpiqM8tFl2AypQcuSdaa8gz5c6Hf5zXDiNQBO5qLChNl4Bh1k+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB6bag9hdl2ny3ZXfV+swikKX3XuPVzrj8mL9TUZvBo=;
 b=ba08iJs22A3ZkXU588wzHM2GqtsbTMa7XlDn/omi1Yk+GunKu7QIBMwa1a9li4F6Xmbz0wPKIKrJKpYjyr/OJWlNFur5/Tim9KOxJcoeKxuV0gIKM3PAN6mPRj/Z0KGZZjKrvMZ0IazRAro4VPY3I8Fha/0Wbq7NF8GolNzRCUqnPIq96xVjjI9hD2hfR/0Wu0K1nc6BLvS3hNzyjrgkqcAS2uaMf9gA3wbNLC4KESuoBm1hK0Y7f4RFXS/kd2n5LbjdzfkpU6WBUCFkfdh0SK8m/wyFw0HxtEpFKQ17qn//UHfN8WkDC/A9dJsePsvjUAd1huT3Lz1ESU+BejxOSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 9 Dec
 2024 03:41:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 03:41:31 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com, dmitry.baryshkov@linaro.org,
 u.kleine-koenig@baylibre.com
Subject: [DO NOT MERGE PATCH v6 15/19] dt-bindings: firmware: imx: Add SCU
 controlled display pixel link nodes
Date: Mon,  9 Dec 2024 11:39:19 +0800
Message-Id: <20241209033923.3009629-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209033923.3009629-1-victor.liu@nxp.com>
References: <20241209033923.3009629-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 3113169b-0b74-4f9f-896d-08dd18035efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?10qXqT5QOziFRRdCdjQRglG9Ml9HzAU5erLNjTkNQQETICo6Wik72KhKcpi+?=
 =?us-ascii?Q?MWtP7i5woZxA0XqosJ/KSxwmQ2MCFv5cZoBfGArN+j3dO7ZgXukc9I4VcsPb?=
 =?us-ascii?Q?HpGMpkKPxrli9ovI9gel6gdSCudV9NJ8Hk9js9BCQQJQzkWMV0Yq+kkpBePJ?=
 =?us-ascii?Q?R6uLNzEKBernDQ46srv7BQaSSe7Kodkt4jdSUJNoQ0CwsEjPVJi0+orcqiIh?=
 =?us-ascii?Q?slVN/yzOen7rmgbPDwbAaP+40Ik54j69USgh6HRKS9yHTjPAmf9OzUaMV5Cj?=
 =?us-ascii?Q?F1m+NP+/09Pbcr6ot4eBFpk3Ww4DE436ThSGizUsgGLgoJHk3dNdIuVFtANB?=
 =?us-ascii?Q?cxlWe27445cSfn63C2H/xLet+tXokg6y35Jpmd8P9RTc1hJXSbFCrcE5BeqW?=
 =?us-ascii?Q?pSrOzicv3fpXFgFIM6uygmngATE5sa8m4/+1L0YXEnGx7hHc4zUCCPO/iXfz?=
 =?us-ascii?Q?WKR/7f506wIXhkbhp+GUWC97kIBBjeOtYlug4zp0OQX2i9N2OmEJe38fgzff?=
 =?us-ascii?Q?0wHYbE2GoD4eJafEQ1KvBgTR4J+QVkyIzWolFiZA10zNECFyYJsQQcQUJDn8?=
 =?us-ascii?Q?vEYv/Kqv3dj7FiE+7h2vvEDJ3vXEkk0DMcjF0Z1LuF7Xp0FJF+hIw8BPq/6E?=
 =?us-ascii?Q?0sGlyosBYa9nyTzq/3qM/Ey1h1Nu97gM5O/cNsNLy8uHu4gHpmzIn7VFyc+x?=
 =?us-ascii?Q?mfSLeb68nhpjK6kjqPPnIoAJUrEVfMObhkftOImaxLsPO55Xnq4niOa5GRiQ?=
 =?us-ascii?Q?2q0FxwNapw63wLkjSy/ylS9MfHt6qFAbgBO2uE03JdHOT1VvSl4GIiG4hpKr?=
 =?us-ascii?Q?jRebyc1amSC1eTcej9h+4Tb6SaaDfzw0PRnSvqYNYvmLb9qJ/fWLTlXdqJsA?=
 =?us-ascii?Q?HYg+nVk/+cbm2aQUyAZBwJzP/JeF3EL0b7EzdQ+19oQBrZ1q3+U2ENwcyyK8?=
 =?us-ascii?Q?gUOjFS3bGvtP00VGEkyLWm73ofpJwuyUoT+V4g2EUuaa6Ohx1uggTrOudIfb?=
 =?us-ascii?Q?ZCJmC3dKNlHnYov01C4eLnt6tOsuzKyPebFaq4ks6eQSXWgeesJ80piHjQi6?=
 =?us-ascii?Q?v8oO8IRFTpdh51+3O2B4AQlP2CCsoh5CGSl+LUGAvhYnE2bx962vWAd2cUKl?=
 =?us-ascii?Q?y7j5BtcEOE5aZPvU6jf2+Q5tyqjLMa+4PjT+d84UTwi+B/1Hlhn7d1TqKkho?=
 =?us-ascii?Q?KSfo8ju8Kz5KTG/OZ++TVRwlv9igRR4GKzIcykwdvmQbM2+XmZrvvPEv9DDj?=
 =?us-ascii?Q?PPSYGKWC4VogHJPZ/Qo4Fd+JXjERA59sYMHqlkKX963fj4Ko5z45Ri4Kqqkc?=
 =?us-ascii?Q?YS0gzfXYclgom9RwpJN5T3urV49hvSSiPSpDkW0vBWyM8CXU96NvdM7sI5I1?=
 =?us-ascii?Q?OSGIMgKW4UVL5cF7NDh3YKfKAj9IBp+g86DKberCeOALzH9GeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1lymmnFhtwEM5eIi5Ji/LrRalpkli3yMKJDOh2to+dkNjAbNSeFIc8nnnYQV?=
 =?us-ascii?Q?ykGgMhPdssTto2BShPDFWzBHAEa6JZ/4HjjMwFsyv9PasV5RVaze7AS+o3YZ?=
 =?us-ascii?Q?qZN3MAIqwm0vgnF26uBIlUvoLQZ5EBWDV3fs63TrbuAmXqImT6lFhDyEfXte?=
 =?us-ascii?Q?7cg03iPw9jqBHfIYHSp2w00LmzxmrMErJmLBaFHW5Ku13hu6Xg6of5RVShP5?=
 =?us-ascii?Q?iIvLr/MwdpqbBBAp/SoJBKpR5VYtsx+6AA9CtLAE/rtCNpZagV8IGBHp/3DI?=
 =?us-ascii?Q?b1+7MTiO5NUE65sqLbHqUWv5iTs9RL0yqiAjdhme0Q4eOCIRTdK9J53FDvQ5?=
 =?us-ascii?Q?O2hr/E4ecClZ4RxQvwBUQYABva1KMDi8iBiintz3BIWqlITyWQuMEeTXUrC7?=
 =?us-ascii?Q?mfdTCjRJP51TjKgd/4U81sglGJBjSoD6AUQeThGGYbOeTUaBBG5zChR15tzE?=
 =?us-ascii?Q?c2fix8Y0jZ7ITHmdLXrasQAFRsGMQ6FFFCp/ccP8+0hJs3rSfnFyEsprAjsz?=
 =?us-ascii?Q?t67CCCnBjruZYFlmPQf4Z19upe+I4Jz8zaJc2t9gq6HsxtRTRUS7kx6NQHul?=
 =?us-ascii?Q?9m0LI3KOZAiZiJQXW9n+wr8nwoM4CFaioNly2LmB5uVRw8CSKUN/K5OszyeW?=
 =?us-ascii?Q?5evxd0v0b0igaBp13+cJ7JfQvex2wUL4RAGEoh3ysrI0OZc8787SXsUKc+PN?=
 =?us-ascii?Q?jObqa0g8cSNb/QH/Z1FxQY+8XP7aJ4BWzAUmHZru8m32l8YS7MZ1s2mDjmKo?=
 =?us-ascii?Q?ToKfAvQI+IdgLm+xHAjn8eszxQsagdBXiSDppDGx3V2FwuUJnilHxE2RIXRj?=
 =?us-ascii?Q?12VVjCKl8czTOBalPRP2lp6g/S2+Dy6uRGDD8tdDKGxV9ib4Uiw9lgpFNmRm?=
 =?us-ascii?Q?EeSwwh5Jek4h5fU15JVKw0ZywlEEXrem3p1QioL9TQ3/+N2MJ3Myw8yT0gg5?=
 =?us-ascii?Q?6QC8DjlD1kAVYA/PD069NVbosf6RMJzlbs6Mxd6a4IuOrxy9V1uilyFZNRJX?=
 =?us-ascii?Q?UTWifviVQXzglXCPzVTBSY6FuMuoQkRQX++tK46ef5Yy9ALZRKAdnbi/pJpo?=
 =?us-ascii?Q?jqS29tW/YaLP5rpKvDcaWQXZACm8YwhTERydCEFApwFBtT1NT6eEKu6n5jJc?=
 =?us-ascii?Q?Lmbp3YTC/SWjsvj+7lEF/2lGOVHyEQrhBXBB/fPeEwjl/T2wx0e8UIQoyszw?=
 =?us-ascii?Q?dROpJalkQ4nCUbZy7+LGEPdLt/u7l5dUc7eegnge99tasbC4+fcs74VMnFtp?=
 =?us-ascii?Q?6fwt7BumzXwCNfVOkHWTWHEs/Yz6TZzwigP7TxuzftlxXgd6t0eIq6Rxxo+p?=
 =?us-ascii?Q?sQPW0iKiiG43eZHnpaM1Ic88+Nqi7f1iPlwTxUGT7eEDQ4NpHaByjgkST8kQ?=
 =?us-ascii?Q?30iFLKTmZZeVpGf1XSN4VdOvX7/FMlQPHtoZJiers/Qpn1tQfH5/x/NgXiQW?=
 =?us-ascii?Q?N4RtrOmwAFuNVy0D4bIJJu1mGZs5jLVUrb82KdDy7DcNzljpDk9H6wS336Tj?=
 =?us-ascii?Q?qqv/JdCOnq3W2yvvCmRAmwEQyH+NrLUWZOQb/Su99iPV+J6E1tKYEfBOMTjM?=
 =?us-ascii?Q?eYq+zfC98TUqmMtJtw6vTLJ2SG8aMj/jOFFqihoN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3113169b-0b74-4f9f-896d-08dd18035efb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 03:41:31.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5Zr1k0SPhEyizVzMHtemGVj8vuf5C5B1eE0M+mzoq3yuWrYFNBaMsXo/eqmoeeBDTsyediZxzF4EWkys9Aj4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438
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

