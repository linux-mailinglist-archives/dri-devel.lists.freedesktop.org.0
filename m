Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF499B1AF
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FDF10E304;
	Sat, 12 Oct 2024 07:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="R7pF5U1w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2050.outbound.protection.outlook.com [40.107.103.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A881410E304
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcZb0q2Lf+kEGG+EZOloNb25Zib69lQ+ZhG5jVoG80G1m7BEdC+xy7oBPCovCsCjfTpeqs0fnhHpuwSLzM2Kb/0kKg2owz9iQDLhHifbw+aAF/+uKjs19OT68qhI7Qnh0fFypge69sPuZoQfpRF3PS3u+8ngFGEYpECqUPkR35PJ7lnZAddEVy6jvQmun+A+vcoj4e8ot50Po37W4h3af8J7wOmKeesSDnHTVicgzhRfWAHfF6OnmY8CKNrAOK9IqS/EEokVyHLVhyXSyWy7RvPbmwPy0/3BQpIUI/vkZdvU1R6x/ivOaErqoyLHow1HNoZa7w0nmTCjLwp+19PVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yg9nP+KJXNjtCc7Z2i52U0XHXzuTAvUbcU3UyfrGOw=;
 b=D9ox10/1Fsemdnbw0E8Ekp8AAbtv3VY4blZ1olMT68gzm5IJsVowYwuIkdRw2eRBf1aIw5S75ja56t3hEe1u28Ssgq0XTUAnZ9fGWZy8WWJHYzZ995TQhTDRLFVMSKImhVeIOXZMZLYBUlpiDA6kkddMNygR5sLEZvjaLtXIn5Otq8KWdNprXI+p1C0hA1IBaUj6cRyNVInxboldKMiMXf85vQjEUF5FXsoVf1+2iLU6VVUNbi3HF/7Ho+xIz6edk4p23TLvAbsW927vB2nhlrkAaypCEGs8ek/0CF+scy3+0TgfHiP39KJNpkoTH6k2ppThJYtKGpC7CIHSrmJbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yg9nP+KJXNjtCc7Z2i52U0XHXzuTAvUbcU3UyfrGOw=;
 b=R7pF5U1wxaypJGdpTU6iECfsvH1+SvzkHelGakh8oVDsRjPpJeQvED9RLZSmiJZZYTKpGxG7WI3lt7gLt48gR/HiIN/9iA59CxIHDhEKYjJEZBfwzElYv64YDw2kcHeKXk7V8Lvfhw7m7eXTChmgyRYeCY8npGlBobmdf22whtHbKoVf6/RhFy0BN9encJeFNQReHHLz1GvbhWO/eqyMLYVAIgkmRVZH4b7e721cFT/5KTSw08demr8/sdWwREOW1YflsMfFgwXBrOTXwDkC8ysSeC4DEoQNmQlKGd0Sj16q2hZ9cmKHMaPTZgOdXxr3uXCY6HBmiS5XAwAYv7YYtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:38:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:38:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 9/9] MAINTAINERS: Add maintainer for ITE IT6263 driver
Date: Sat, 12 Oct 2024 15:35:43 +0800
Message-Id: <20241012073543.1388069-10-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a235fb-07a3-49c8-a030-08dcea90cf9d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ePa143aC7s5LjdiwCIrpCS8Xi64l2U4elQbIqQ7HqQm59ciawMyGJqwJH+A?=
 =?us-ascii?Q?KlkhN+/q77DodI76NUt/mDTCpeIIOmiWzq0xfwVCboAsEDwWGbTiw0xYiwp5?=
 =?us-ascii?Q?bKPj3iqQOEfc3ZOO83UK0ndjLVfTpoia9iivEhp4uKVGO2rRsYY+RxWm9Sdi?=
 =?us-ascii?Q?HALa0Rq44tCPwv3S/hXwCOWA/UCrIaA4RssL6gtpHJDTgI1kbZgSv5zS1P/R?=
 =?us-ascii?Q?LzjkXs346Bg8qUlC1P/8S4j14WXiLT/SaJNU7W0Lyjvy4lqK11baU7LhL7TK?=
 =?us-ascii?Q?rGkveeIxPCRPvQJHp4y/nObeVwjX7M63a16wNBSj8LAuZpp/Z7dpF4ay154m?=
 =?us-ascii?Q?HscjWaxEVW5+y8NpxdOZ35+2XbJXTo61YDk2YdHExeCj7v8lpQ3jOyB3JcS1?=
 =?us-ascii?Q?sV7aSpkQeUSDIksok8cFgIOFG4lU+667v52hmDupsf8mci6Q6TEv03NXQX03?=
 =?us-ascii?Q?sSn6v1VC2VBaRxNOmFcwevz3e43i3DTG5og5njuVG9/+6NTgijLTsO9SNQhv?=
 =?us-ascii?Q?d2t/x9K1PB5EgHIQhpQrliESXB54kEsgHCEF3+R+LgQ2Ms4j4Kp40XdLpHyo?=
 =?us-ascii?Q?Gw0QA3GssImxsDvBC2NJoKTUA70KrqsRSX3d8aYLasLtw0OV0eajVzEla/81?=
 =?us-ascii?Q?0vvzpmuT1fi+dppNKRp5QVRzjEUgFEVPe42V/ffN9qVvFSwC0A8IqpCV65Ar?=
 =?us-ascii?Q?SsOWLU31DyH3c95beZO6ULa79pljjvNPFTSqfj+1CPQqS/ldSs2mbbBCySWj?=
 =?us-ascii?Q?G4i8ko6jSaDzedE+t7lOv8aodCOhWNZ90u96d52sK5simR1RqxXRhptAo2Eo?=
 =?us-ascii?Q?sbKiUgMSXQEnWjKmahZGdC0x2mpAUFlsriG0P96nu+fqxSZSNVUEX/LrFvMZ?=
 =?us-ascii?Q?jK1vfwK91otf4HFchOpUrQ8iqfRsFxk66X6DA0QCGZGbJfAPrf/QB9vixQid?=
 =?us-ascii?Q?KzHhdK4oj/L7xo1DCOph+scVlDvCj8OOlg1YbVmOeH0puseK/woY0RksuYEV?=
 =?us-ascii?Q?ipaFY3m0ZKd9uw+0XBXGcd/iFrct0s6olR3PKjQwihf7vXu4GJZmXg+/dOI7?=
 =?us-ascii?Q?uITJJB1dG7VTWsTLztT5BNnfgU+8edMxE5k4diKiJQU85H9JYKUTWUdCHgqQ?=
 =?us-ascii?Q?EYpSdxtY6joNBmFzzLPwGdISSXLFcY1vBtqhtOJw2u/4Evd4pTW0mRd2B5uJ?=
 =?us-ascii?Q?n9qPhxrFXSRsBx3t5lHEfRHQQ8tUnViq6hL0l1QUomguXRp+LtwomKMWoaT5?=
 =?us-ascii?Q?ot2HO2wN82nGV7wdCObwJus/5OQUrnCosAuQ/0BDCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Gpf0T1hudNcG/3Fs72zaiK0TL2GQRmq07JLCfrOuA8L5/lisDC150vjeTvT?=
 =?us-ascii?Q?N3S63esb6ph4kPB4Z6FydIx2MVOtMTDBhSTfCJBou9PQR6z1n9DdpyGLLqmx?=
 =?us-ascii?Q?aIifmDrAWfK7jhkZTHnNhj+JvI0O+YvALmJP7v4miuCCTxdGKltQ9h/YeDul?=
 =?us-ascii?Q?xgBUYKfZ2tTi135uqKqklgcaS27sjXSvX3IkHmk1xsHUYOwnglXJ59iypVGb?=
 =?us-ascii?Q?5/irqh+0nSk7yxhoqjdrOSzoOpF3lVvv2OK5MGTY5XAQxlKc6LWRZekTRbVo?=
 =?us-ascii?Q?6W5Ta9TFgkhxcasHK1/33m8NC1f4sBOApaG8JcqdEo+M7RzZIAOq3xtoB1rH?=
 =?us-ascii?Q?Pk7srI5W4OerlbbWrdZrh7CO8+2Pnpg9iBm+WAYi2muSlraIV4J2upynCzHe?=
 =?us-ascii?Q?HMZuQdIoQmSrxZ0unUBEU4i2M5omIPhsAOJaQNo+EUzUxciPQIGa/5Hc0oVf?=
 =?us-ascii?Q?coEhqUoG+fylLFzMlfilJJ/hcwtezym8eyLF54cIbcbStndzeJGcsmcl2DW1?=
 =?us-ascii?Q?Jl4whertdHJ84uB2vFY3nfbO7bmLsDT+9G6UvsNZZyxEJu+zU2encafx4LBf?=
 =?us-ascii?Q?AivEN3i8d39tAApB438L0d7H5AHXDAGGJ6nLnF10iK7jKYnh9JnK01leayhX?=
 =?us-ascii?Q?SOBP6a682sHMqAUxB16GqZKJN5B76jOAYSMM1zel+RjLjt/TpwpGdF8efg0h?=
 =?us-ascii?Q?1JLAgh4zT4Vs8KO/fkMXKdcA5jWeYMeS15vFot9cwMWl9rWhFo1NtF2QrLMl?=
 =?us-ascii?Q?UL0iD+1y6TAwQI3bMstyHhvBwZxORIuXYjPb01lPzWI8Qy9itve7/PQHwaVQ?=
 =?us-ascii?Q?GAv3bCt1PwQjryOeoP2xwMU8iml1hbPAQD6BfXPAo14bkoFhOt6N7SloTcYC?=
 =?us-ascii?Q?2Q6i4QKK/jlH3wpBOqrY3H71lnpQLE7HgMs3piO9Iz89CLYNnb1rQqGllzCb?=
 =?us-ascii?Q?Y1qw58oufb1K8HOKUHqc3SPwDcGuDS3pZXqyoaFU20l8mlIAoJNOHLHztxcK?=
 =?us-ascii?Q?BYLCtAjUk9cEWYvT/9iQLHPQUy09e+MAkBJtaqh4EyPA7Yfwp5tCHVRApOgs?=
 =?us-ascii?Q?lTYlV/Cr/USEOdmzRRHrur6ToX2lit8NbR6Yls9+X/HR2MYKEoKFQ2Fjl83k?=
 =?us-ascii?Q?aNBLrh17K0epae8Nn1qfyafx5YTjczPXTvB8YsLZBhc+VhcMaL9ONQ+vJC32?=
 =?us-ascii?Q?S8Q0TsPW0vJs0XtR9tW7L7gXmOG2N2+CZePMkgq7SBEDTttJquKqK8rrq6JJ?=
 =?us-ascii?Q?5LINU6w27/R+GgXebwj/TDkijCPU2O55Mlvh5tufw9Luu2t5CSKJFZWnt+dR?=
 =?us-ascii?Q?CoCO4pZiva/lFYe86mVxjAiHR56jvc5vSYhu0K8vzMcaPRDi2jLN8q8j3Rjl?=
 =?us-ascii?Q?MIyUQjs7ijeaKXGVU+z2RJ0/No7/LDhF0uC3PhwtAQMZ7yx8U2T/D8PHElkR?=
 =?us-ascii?Q?4F6O7lm0QgwGDNz1pWl3asyou/9T3Q40Fkf07obvXql4TA84zMJGF5Kc7eKF?=
 =?us-ascii?Q?9FV+x+WAjtnUTJkLj1IjGiV80KRmKwZsZb2AFj4XHuMQdBtBp1d6s15Dtgbw?=
 =?us-ascii?Q?/T3lWCC4JKtAOhMhY1QYALMw2tquB4LRoJdIRoAN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a235fb-07a3-49c8-a030-08dcea90cf9d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:38:06.2196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfak3b+Zc72vzt2vs2tTN0QpQrAOJQRJCGH6zO3GGYLh61Q96E70RsN15/U/zFPZ0tixicnUwXaZJlo3MLFePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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

Add myself as the maintainer of ITE IT6263 LVDS TO HDMI BRIDGE DRIVER.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* New patch.  (Maxime)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a097afd76ded..3ce9ab8327e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12142,6 +12142,14 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/tuners/it913x*
 
+ITE IT6263 LVDS TO HDMI BRIDGE DRIVER
+M:	Liu Ying <victor.liu@nxp.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
+F:	drivers/gpu/drm/bridge/ite-it6263.c
+
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-- 
2.34.1

