Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445559D8267
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C016A10E5EB;
	Mon, 25 Nov 2024 09:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fZ2yfjLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20410E5EB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:34:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1oHJr0Av0R3WadHrBl12nz1dTwv0xeNDSUAe9/HCwSAv3Z89PPtc6RCNUaOk1WPzYCL/iRPWsnFdyIFfiIpvBE9QdeuuITBg9OKZtx1BiIC4uCB+Qn8QptY3aDS9WJRu7RDYZ4fuyfF/4cMziK9WVUXfQkA4yKX3kUf5GSj5LFyQuQ3VOn1yOCIDOZ8RmwdUeV7gx2UexUUuYQdLkZSKpekTZsJz6ht/e+m59gZ+aww+DqVfRFVJDigt6zAqnyioEv3FDPyuuc9z1rgVMPobLEQO5p/McuK08kQDNQ3jX3KXw42gBjD1r9FRVbl+x/xHqkojAFe7ArKQ7q7VAPycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShraxEBbCC5O2c6noH3HRMuQla3K0Cop6E5AQptnTpA=;
 b=f/yIN9948R4IIthlkhd7zRTgnSgmyUxFjMTk74u1j3uusy8Sykuk68cBmmK3JaG39h2XJHACzOmj+dIlsZ46krQj3Bme588bhT3lr92DVdInMAcvBJqyjd2cNxfxQeh9CQ9WPJBU+pytOvHs3uGNwOJMD62jtBuEVbKYY4UbbPQWYoen8hRnkETi0AwEhPoUtKAfE0+XvatHIOG1nth9O2W60Pq8LaRjQdVVr0hRhtRhrKahSv1BtQQc/BsfHsgiilVOueAyOGA0tu5AR4XbXc2TIAn7UayPCOJSihs9Rc4edMWdUJsHtUZmanGRblcnIJuS2JCaAj0r+aof00LwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShraxEBbCC5O2c6noH3HRMuQla3K0Cop6E5AQptnTpA=;
 b=fZ2yfjLgyMpEnBnvIqlvyaBdwjXiuEbkZkQteRz1VdAqPdDJjG+rfOR6XjOfSOvusrw7Oxupk70SsOuM758VPp8F9Xvcyp6Z6iEiq59+Bp4iZnkjkp2U5D5+vqJdzovSYts8unaT8EcDf8qOF5mqZ89Zpqs/XjXpPBnHY6u+jmMAmQPPbQa1MEyov9Hhnx5+Ej9FJ5mZKTBSqGt09z+60xmquL6+FExUix7CmSUvmuueIRTMCgCMZh07g4VuBrF52J/2Ad1ovP/Lm2vFcV8tCRqV3cD12HqbvrW3hBeMXGojC3qKCuMLHz/yhBItKDeQdRvlGkvyv3m5v6hHBH8JoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:34:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:34:42 +0000
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
Subject: [PATCH v4 13/19] MAINTAINERS: Add maintainer for i.MX8qxp Display
 Controller
Date: Mon, 25 Nov 2024 17:33:10 +0800
Message-Id: <20241125093316.2357162-14-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: df89ec27-1995-4e6f-7805-08dd0d346402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dp+gRvV5PHg6iPtdXJynDcijEeAofy+5emy0RMdEKGT39kP3y5rAbPtVBMFZ?=
 =?us-ascii?Q?b5V6stPWFgfqBZwH0mh6U/5sFzYfn1E+N2y4m8uK1F+ULlkJXs/SfFVhf+Y+?=
 =?us-ascii?Q?KDYqwn5EeQUEuf1jIUVqmraPNKU2CyX/riJ78NUtsHCTlBnEQYUt3yWP2lRk?=
 =?us-ascii?Q?oMyCHkOx3URAM1AyglCS84XAKqlsFHdGsNcXh7p5v6qcYB3CySGqMlhAVR7c?=
 =?us-ascii?Q?+gOr/xuuVxeRthIuDaXpsOdf+Y3+5audYq3T9Vx+1LZZCwdw2FkCydPMnlk2?=
 =?us-ascii?Q?dW+VJ4+ccX11Y6DqBXtrehH3hklyjqzW5VXroRn5q1kMYVaIsORhy96VuMnR?=
 =?us-ascii?Q?50SoVtmzWQhEdaLGfNYSy06KKFdc5FDX+NaLSVBldmBMag7m69zD9SSIisPy?=
 =?us-ascii?Q?nNuITMbU3R/azHQgbARLvK5hIHtYpuQAChHp72WOaQxScUyHYlWfPUCpjO6C?=
 =?us-ascii?Q?8SK2lTKpO665vHq/axtd+7id9smpMKEvAx9f9seGFRtFvbIKvn6ogXCjzLs8?=
 =?us-ascii?Q?UohqUixN/BRQ9yao+B36wKUe3kgHLo3tl8dhcwcfNeGWwe7NKbyFEBAbXvYf?=
 =?us-ascii?Q?tf4rDBUR8eHbc79jIEoEkjxO6oEPXHvfIQeezZ70tOuhD1MoJqGi/GylZbz/?=
 =?us-ascii?Q?m8jnVl5bXJxLAVwteSwEORVQd3y88eOiPzxB+FG/gjGa1VfV+ZMC9jIEfW/G?=
 =?us-ascii?Q?/ezgix+JojZeWlGy57HjTu3nV+5VJscl15yEEkeAyHQnDjiPXhzjaIRJ2j+A?=
 =?us-ascii?Q?opxH84furEDNbZ3czrmbnYUddYLR6hkx2u7yOS4tnqPnpl3E+eqJ663fqr5l?=
 =?us-ascii?Q?w/41ECnkcP/w2jinQ7M2s7oUcbipS/scSk+4as9D+piVRtQiMN7F0CHh5F4m?=
 =?us-ascii?Q?1iX0Vzy44NxFEZ+LIFzfEyMRQ3ysiDheIy8M3tdJLIycWCHgvxPnTBpqkd8P?=
 =?us-ascii?Q?xSDZKHw/RJQoFBvrZSg8UPV+I6QFlKO2mdI6NKHkRw4dWI10Bozfzq9hCnJi?=
 =?us-ascii?Q?c8qEODWaEr1PssfcmG5xdEMMdopsQnHT+T6l+3xjI2d2AIKzj37hNqv/XsZV?=
 =?us-ascii?Q?5enBixmQ1fa70qOrqvKT6PcUiL/NiqjaWyPHkU5/7xqbekSc6nePVHS32kJL?=
 =?us-ascii?Q?iQfgCcsLGA6jIm66AmLNz5G0fjbJHZuhmnEsq63hBO0izj0ztX1m03dFCns1?=
 =?us-ascii?Q?j0N0dwGohmsg9le4dnJUQfTU5+De5FWm/gnd43JdSxjxhGVo+Gj2+fvLTOnV?=
 =?us-ascii?Q?rEZhXv1BikFMLhy3CmgCZZxPcmWQUXFjRAgINdDRZEysbVmCjFJhpKti2XlA?=
 =?us-ascii?Q?L8BCWaJFxOzqtYZd1P0ZYq6aLQ4y0PuoSZno7GPVIPRsQmVoeV1PgKDh8xSN?=
 =?us-ascii?Q?Zi8HiY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XCQKFvs//zApz1DMkNIai71dakGb9BdP2kulyM3DVbj2sJtfKSy8pdal3eXK?=
 =?us-ascii?Q?5CoYd3JdrBcP/cjP0xjpV6B/Mqph4TWQR3+2lHDdf7iZplPiZ2y5nLKLV+uj?=
 =?us-ascii?Q?CgfslyC14JGbO2znM3o8bXmyaRohR11deBjhs7hYpc+rRn9AM3PhhP58qZds?=
 =?us-ascii?Q?Z3Xu5hHk8KgEkPvW9Hqw1G4YQsNdrAPrvyrF/9az6uGpr7A9mZujvlSRA5JZ?=
 =?us-ascii?Q?PKm9ZfmG7WarjWotlDHLUjhnL+OTjTdpii1F5WNDCNzfqX2SNyco5jadKqsM?=
 =?us-ascii?Q?7q5Ney68rBAQmVOpvw9e1wgqp6rLYu/GQecBffrSEzmHlRk4yh4jup/cgHrE?=
 =?us-ascii?Q?79rl9RSMVYL1fv9Tf+ENoBxjSnBgEqJSCAnIDj1jyopJuCOG6t9SokAHGyId?=
 =?us-ascii?Q?TRahnlkYlmu3bNAVoe64OlWJuMmlhRBzz/C7/sNka+tbPhQDBXCkVVE5jvbm?=
 =?us-ascii?Q?IicDcCYs3G3bB0sgIU4u/YQdkLUfAzLaNWbFHfOwEe/HV0z5BvrJpiswqtAk?=
 =?us-ascii?Q?7LGLz4YxrbGpzxlmxviEU8+33X6NnNjQn+FsSaEw+7Xds/oBEo7m+Dhq2S5R?=
 =?us-ascii?Q?TjOx2XWVmzt+l7MgGravUscAVswboGkDJ+0T/ZiS1g+xPwd3hVDsxFgMuTWJ?=
 =?us-ascii?Q?Rr1w9aABp1x14+BnOCIZOzDvRPN/3ip+fWpbivpLgst1Zxu2SIyqm23kcEHg?=
 =?us-ascii?Q?hUxXlU8ENOY/l61juPwXVDO+NIPHIBpRykZSwLNc59QkpsOcMypg77C/yH6F?=
 =?us-ascii?Q?+t/5FAFx/AG3+FxylfIuqh0wnp+4koEBPgZpjIDJW8Ti08eAyiRQJ37d6fn/?=
 =?us-ascii?Q?zzdriAWUkl5HtHMkq0g8F53oiVozFs+yJ1WzEeKBIqfFEdXmFUNi0BzbU9FQ?=
 =?us-ascii?Q?L5+62XBfyK4JI1HCi2kR4c1ZmiRUNd1ksiA2+5rpUVHdKwvWISRJ3Uu+dVWi?=
 =?us-ascii?Q?Rxjy7GxYhIv6Q6tD6vI+i+5XzUtZ0SApup7mXuecs+sL6iDm8yJ7tVv/RoYW?=
 =?us-ascii?Q?AaxzldCNN5Y1TiO2uhUOkX4+CuCqyX34Z/qQkOEWdm8ZqXjvw+eRY2X4u3PO?=
 =?us-ascii?Q?oPYYmeqPfMPMw6uztawPokcZ+lrRtv7K8E7y8BpWK0/U1nH4Me4SXvJsn0Zy?=
 =?us-ascii?Q?/MFmRwIc+aCLMJlzWmvgfpkDhhSlyz0Nyrs/vtE2eQafMrRdUv6sdt6xHsXU?=
 =?us-ascii?Q?L4CqztN+LbCQjaj2ehA1IYEwY8kSslnA5wW2FVxemuqaHwx+WnlzTWvbWHPa?=
 =?us-ascii?Q?rOPHx0bYnq7qwpnkd2txikvI+i2bkYPjppZx50Xc3ua7hWdIGKRtJraGNfB7?=
 =?us-ascii?Q?rRfxylE/jTD6PLaQli7OHebbZKSiaEbNcQcll8wQI8HdWYOckA2/BH/6DWNu?=
 =?us-ascii?Q?CdKr0pQYPhy0Ypn7FawdXp3PoSGhgh4/EF3CQWf8HececqNVPRMPNcSdrKbM?=
 =?us-ascii?Q?SfWy/c8BBhye8KtcimP00U14zLV5b0wpcGmSrM7IZZe3nOBFQtq7MVmRC52C?=
 =?us-ascii?Q?naYBCt0dhRpohDKNePXcdM5F3yAjgmQP751BuhcHslo3/i3mYBrvIil0kF+A?=
 =?us-ascii?Q?inTQgJWZ0Nhk3NU3RFfcdPgxRE9LWN8ZEogjWLxU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df89ec27-1995-4e6f-7805-08dd0d346402
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:34:42.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRffq1N+CouqD+KuQCx7iwwF7vo7fRRLotlXKRUJr248ucZy22N1vZuK50JnrrmUuXROjbXgbpVPdw1AYUFjDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
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
v4:
* No change.

v3:
* No change.

v2:
* Improve file list. (Frank)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf1d81bd04a7..3a1489236d43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7675,6 +7675,14 @@ F:	Documentation/devicetree/bindings/display/imx/
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

