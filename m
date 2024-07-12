Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4692F7E9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 11:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F183410EC84;
	Fri, 12 Jul 2024 09:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Xy14BXzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3DF10EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 09:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlLAXh47rYhdgjfc0kOwYua5VadNxVNeMpufQs23WPGwI4T37leY6rpY1xPhvovsqyjfDzx0qF6p/U4rAZDPAEHuJPFkB0It6BSPwJy2wt5dvZ6MGpw5MJE3v9Z38frjRg9rVDg1fWjQ4JmI/pIms6QH6n49MkXfV1xrMN1MeDcrmWeV174T2iaMtVEAm1lCNHEWR1gmew1Pb0xbj8ZUaKJnL7hxcFlMO+IlwYNoQVUYzfjBniLr46NwdKcwh87QB/yvcDEgARdIGcbGGFzFR+uALLbiSYkaQBTVKfXykzhO0lqMSETjZMLK/UNeVKfKlLuQGmjek6P5hpTkXL+Vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmvX2scr93brJc2U9InTcLVs2K0BGgJzpqM9K6qFG7c=;
 b=D359NeIwCtC2q8Kh2s5L7dDEx464o16WIf/btyfb6QV5u6jxD+aekkmK8zgMQ6/YvH89J++GrIWy6esZbXhFvIkNj8zIWkPUBHtPhbcNvRymqOEEhBheb09mYFomR/OODdhrOF8iOpNKZpObSnpoHYGUguWxajotp7npDmjX2thLzKRJC4A8KR6fQeEEP4grPMknkL3VMc/8OOrmpjna92sPIGVzC5wSMgWaW3Xfc+plFhhRoGxIoF4w3OLJ2n8YaUge7J7FuIRvpCsGECQ3UV2IZ2oWEzFrqq03mP9nEZhEBmC2o45McSmHD28mbXBieVgXMjeWllg2D5ctadN5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmvX2scr93brJc2U9InTcLVs2K0BGgJzpqM9K6qFG7c=;
 b=Xy14BXzJbJUQx1r0rszPAA9MuZiAxsxWC/0afurQGFkrgYUn/BMtZsw6ltxCF2TK9E1AFdbMkR5FhInAWJPXk8iEMkM4AQg2ar8HJZMkxppQc7Df7WLzvTulgMFTDQt69kOisi9blCNyBAjXwNW0IvmFx1FnpPifU+OSU3RW58w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 09:25:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 09:25:48 +0000
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
Subject: [PATCH v2 10/16] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Fri, 12 Jul 2024 17:32:37 +0800
Message-Id: <20240712093243.2108456-11-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 853a5dce-d4f0-4549-7a7b-08dca2549d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?20f4sgIeBN8NY7Xp1OwRQSFZixfRsJ+jyj+4HPFMc7v/pAaf2RaRsY2mS15M?=
 =?us-ascii?Q?7vU3WOBDIBK4swvDY9RhyZ/z88oXrKdxNLfCY4QOGPVIE+4mKsyPPMA9o0NP?=
 =?us-ascii?Q?rJsRo1wcWq13JdCz4A7O4gEvGglfqFG49FTOWBcORu652ayv3YHGVG9j9Vt/?=
 =?us-ascii?Q?CBPt3pWwG0qOUHs6dPNWsLAc4nNcdEPTmeQgQCeTTLVzzh1joNN9nXy1DuZw?=
 =?us-ascii?Q?t1yMA5176K1I4oqeM+V/+iWaGnwus9fxpdlH/9hkg74PhPECH64HghMTDHpv?=
 =?us-ascii?Q?KQz0oaVRsU7DvUfQs7uFWSrX6sBnGzfHfnelNYb/1eA+5lepy6DtTJV2fH05?=
 =?us-ascii?Q?DofwJ2pfq/8aPyleWDoQ4kg98cz8+jHPyjEZtT9hhnzvM1dK8jWeneMJE3vb?=
 =?us-ascii?Q?N1Fzq4Bvo+aG3yX0AjEqoYRpl1RwAiervQj9YYoQgdFF3Puj1I2it9+AVPI4?=
 =?us-ascii?Q?kaiyvGfqjtZBf9n4TrGux8jlKXPLfwwqUrYNUuoiaxjFyG10ScObrFV7M9E/?=
 =?us-ascii?Q?MHpaywl2RX2uMT1/1MqrVfng9ks9ncBy0bhvwLyrBZ2vVekyVvNqZrQsgBcx?=
 =?us-ascii?Q?s6ZFKpWZOX1yY5+ZBNc8JaVxeX8TLHT/qp9YS1b1R0KNayRbXiUCPJzDHDcF?=
 =?us-ascii?Q?daBep5208Fz1OChnAXqHguUKUsBbLUiU9d9Y++H9lhYq+fmnSaFjEpWprOVc?=
 =?us-ascii?Q?Uk4V5d42lPZpkeXLVb1qrbriifc+tokMC35n3Lqd0XZsEfk7PCJ2/es4fKSb?=
 =?us-ascii?Q?KTj9CuJXYgq5sCtHAXBIW6FJr1VbaPfTdWRMgN9pYP5fbhfdj9rP4lUAU0hz?=
 =?us-ascii?Q?grwwO4bNRYCGZsJwKrXyvzGBLarjsEEW/FA+dMQdmGGb4nULpPlgqihXz1a9?=
 =?us-ascii?Q?LYghnhEZ2IZslvMq1SxT4+iASWvsBltYlwtCsRAPNLgWJdjC9TmkZ5LmAwPY?=
 =?us-ascii?Q?5gBNtopsebR7ju7h0DPYIOliQbGJUDLh09OXOBbnCU+RZpTw9AeQ2soab05K?=
 =?us-ascii?Q?NldWw6uWVMx25mCCdRKUj1mxakz8bbDolqb9espu0aySuBXgSL1jNRchCf/N?=
 =?us-ascii?Q?Uk/gpawm/quodrKrR3Wv4Zzw60TPoP/nPF9W1z58CCVngMIP+2sri5nUv/hv?=
 =?us-ascii?Q?kAszVZHYvPVOyhLi7PAqdPBMmoSsrKQ5kgEod2t0yH9AV2e054nIXNBsfxyw?=
 =?us-ascii?Q?or9X9w6NF8eKRER6hMBx+Zm42H3OnTk75vbXxMB0fVIR0fpU316mXWzfmc3w?=
 =?us-ascii?Q?sBLPgTOXrul24cken+OwFofSQzqJnKDdHkvBCKmmtQSdu69jhONSkznC0ZCC?=
 =?us-ascii?Q?yNdr90e/UAHMWcwaSWODmefXsOwr3EsM+PoMsMFydt2Z3kMRkd04wf7kcFVn?=
 =?us-ascii?Q?9gAWp2I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mE/xK87NgBsaxTU6NZY43za/eH5R9MwKP0hjh72WUzUhYvZE79jNrnkmg/o4?=
 =?us-ascii?Q?LbE2m4Ubq97h1hq3H7E7v+Q2W/x0obkHVWjXz+6t5o6iqHg1EL/13zRvfKKL?=
 =?us-ascii?Q?kFWBg5s1QyPcTSnPWwsQbZGE0uNxzC56IsIBvej1qgyhFbTYZDjIIJgSt7Au?=
 =?us-ascii?Q?HXw6vttKkKWojZVRVPUZt2tQDcSNcydiJUMDcXAGlUaJ2uT1yWljQmq3fSJ8?=
 =?us-ascii?Q?SHAQp3QaGFpFn5SU2lC7PQ+S6Ux7gS7wo8C6OT0mKw9i2o0F62F4Z5Hm9hLO?=
 =?us-ascii?Q?kKRjLVyUd4flpMZAgczA2waGBdxhUbQiHqLCFBkFWJHneOHNbO3+8er3ExdF?=
 =?us-ascii?Q?QmG3zdzBXcl0gpvhSSz2RoXENv+E/slzX2SLqyKgjq59f169rJlySnVSQMwb?=
 =?us-ascii?Q?BW0F6rsmdMpUMzJU/sILSs+jD9A/OQlDz3t0LojeD4YDK0SHRO6/yqwRoUob?=
 =?us-ascii?Q?1+UCKoaV1XxSnq8yOqUHV+nYWrlzSFdI03zCtaBhCMPkQAWbR7LQj2lY0Nb4?=
 =?us-ascii?Q?TbGWIU1W//j7TpxVMqkrYq6cpvdpIK7bE85g6MxoHwWsQZ9woyrrOt0UNGbH?=
 =?us-ascii?Q?XgNMUc6AFxLjSa7RN4c9rax7kRxYuKXKvv+W343dfu+oUeFrGmGN5Dqk1xdy?=
 =?us-ascii?Q?2vrgOMLHjy03nh8Nv2pXxdPL0V4KOKJ7qRLjLDTrtywbZv8/Pgz4Wdz8j6j6?=
 =?us-ascii?Q?dQlWUncL3a7YySFtsu72Cddu+27ONTeHOVtxwAwHrBJ8aAi7skSGJfA+DTV2?=
 =?us-ascii?Q?K9sJtIVdodnDNBdIhLoIwrzmO7JE+2kL5MSjlT4oP8yzpW87sOmak8y4QRvT?=
 =?us-ascii?Q?huY8+B1zveX2Mhgz7oWUFn48SI/Prt3rUCc5dm0iOCcla7ehYm2H01/pKZKp?=
 =?us-ascii?Q?I/rLIzV7NU9r3kLXihZo35eKwlFPKjL7guJWt53sT4/svsox5fa4mZ4ieCMQ?=
 =?us-ascii?Q?asye97irJo2IIGV//Ia7a1XXmk7M8C+veRj1kpeihCJbggDoNyPhnjiKOI0Q?=
 =?us-ascii?Q?FVoc3HSkssukb6AB6IpYnK71rUGmI8Z+CnSy/XmWBuEcov/JN8dJVZPGddeB?=
 =?us-ascii?Q?lu7JsSrwahXXfgGBSp4sOK9Szd3ySKcfdSy61LsDcv0oAL/tTlj+OIIk9tS1?=
 =?us-ascii?Q?qT1IvdgvLxyRYm/e/YD6WsO7HIi55tjtsk5t3ZlV1RM+DQIutl2fgsUYlgec?=
 =?us-ascii?Q?2caA8H0LH++il0uVn1joJpwXdx2qEA0Rt/gIqKGhUuwEBHlXyGRfkZ+YKC02?=
 =?us-ascii?Q?w+0OZ3dEUTwBudILu7GNIVvlWXD13SI69Y24I1tw7Kr2OoUgvAsd3MFoVO2Q?=
 =?us-ascii?Q?faQvf8RjWsb0IJqfKzE0H7HEZatGXeosxYheHP/9pZc5DDwGQObovR6z8DZ5?=
 =?us-ascii?Q?XrYrdJ8P1jYWhERsEioLr4i5WfreXzMY54qpOczrXzUdkizkurD4Mb6aTjTv?=
 =?us-ascii?Q?LHwv4PzceuMjyx035tPGy7wUoO+DS/9hTT1EWZTVzYg+0AslET1Go+mXYTg9?=
 =?us-ascii?Q?EWDICcgjUbDUvoqO7QmGM+bEPea4JBibyzWilUK8FBzWMNlC2MEf4I94GBk5?=
 =?us-ascii?Q?hvh6hyQAmulYTOXlErQpdIsNsNW/IhILDeKO+CCn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853a5dce-d4f0-4549-7a7b-08dca2549d77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:25:48.5523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TpwbTaSW6gCvVu+a0tBjlAbK5uTMzLCnuk5OhCqr9VckolVXJG2eqiPKP8W6Y5g1zp/+hXymjWbcWty56lI3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
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

Add myself as the maintainer of i.MX8qxp Display Controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 278c1ec148c1..487fb417fca7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7499,6 +7499,14 @@ F:	Documentation/devicetree/bindings/display/imx/
 F:	drivers/gpu/drm/imx/ipuv3/
 F:	drivers/gpu/ipu-v3/
 
+DRM DRIVERS FOR FREESCALE IMX8 DISPLAY CONTROLLER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc*.yaml
+F:	drivers/gpu/drm/imx/dc/
+
 DRM DRIVERS FOR FREESCALE IMX BRIDGE
 M:	Liu Ying <victor.liu@nxp.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.34.1

