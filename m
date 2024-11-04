Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C777B9BAB5F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B95C10E367;
	Mon,  4 Nov 2024 03:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YSG+WJQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2049.outbound.protection.outlook.com [40.107.103.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BD610E365
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:30:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsZPJxS5W/PsQJkUzBc5bxug84mkVQMYcLSpBnugPw2n1KDl2Qw6B6+EXpP1+9pekfygK8lCX56+Xx6PTPPudJehr1TL3rIobElBJPiHmdG9YBi7sNAvoiQk6SYU2iHpXSWMUfdsW+zJfw+1oulK65/eAi03O5iLvZcxiUS8BJvWWjILk5WZtXePhvwGe6kNckTF10XnxNITjHU5lafL6CdGTTaTpFokY6CfzAco/tedsJLc7D28qYo0PLV8JYa+i6Rsn2kWzVlwwn15N82a5fAO0tnhG45vqAfmrmsCN2p0CLd129Emyg65+vfsl2DgQL7bxrSAUjGvxB9kFRwdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohaPr9IExC+wv9/gn1GZDCyIaQKtOceCuIQJAumDKic=;
 b=Hzpcr5Cs5dMjKOfUS/brdyOd9TbWOjAnZE7I9I28ynRC9K8kRVRUcgC0FzRhFv2IQ2y7ewkf+5Z4Tft0pGJ0As7IJe/SC8qBRDRCpBRbwRTAmdRqDwUvbO3rCwOLWURuwupn7G/OiFfdFbfG19ZAKCPrGDORsYrAbsCN0XkOCLyZLp5x/oLXm1LuDOwdKWx6fLzbMQTrJboUnUPiwORvJcYerrfICNCxFLMjXlnhkUNI4LZJgiMFvHn0hW9ex7XEZRN8XRP1sQqE6HsEY9Yg1lKzVEJqCPLs/QDhbeKF5cXd1wcXNOSsMRAQQjk6EX2afW/+L2VQ7hB6BhD2hJv4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohaPr9IExC+wv9/gn1GZDCyIaQKtOceCuIQJAumDKic=;
 b=YSG+WJQR3BBud86vfOrr7kWOrIkz9U9IPDdr6AEnUt5AIa9Y+Z9JlEY5FqaIBeRkX0mo5JHmBC/nnzhn91delgwvWkL/MhBpjowpeL3YzlJFMyubfcw5CdnkLIC2vlO0Tch9RJu4HpVNmV4txzlFvKFV0CmDkDt31YkN0/i3ttB1n4jHOzefxYAWSg/jX6oVNVpNDVVZ0w1xPNl1vNMMvgtGnIPQIOA5ogp+sI4PT63x2LtckM3ZID4Fl30vlEjD2EnBKs8wGZ1Te0IHUQZVABGcCNbKCqCPBuErBu6HhZsXxf+bS3VhJjy/mlEUj/1Au/9R6rrQfKk74bL3oxfyBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:30:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:30:11 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
Date: Mon,  4 Nov 2024 11:28:03 +0800
Message-Id: <20241104032806.611890-11-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: d1190658-3e30-452c-ff84-08dcfc80fcc1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bpqwU6gawEL5hwHq+que5sb9+KT41nPPsExi9MQjW0sxoMwrzvkdf0TX+sYT?=
 =?us-ascii?Q?NpW4gUsqaTRqhOCJKcbzcx65XJajYmr2nG8BFKSUwfJXSM2Y6ycbsZDD7ONo?=
 =?us-ascii?Q?9Kn/SpomeRZaolItxahYBY5KaJYIfQx2BxLiHrAOS9v6eAOhjZT8/W0GbQen?=
 =?us-ascii?Q?YV9vb97hfHyq7EX9DGClezV6mLcU4tqQ4FSzM3pDijaQ1oOl0uGDRhZFm2WT?=
 =?us-ascii?Q?5HR3FMJ3R/rGh1vJdIjuQeOrslOygI16ZazGHdotE9yBe+N3WvXph/3rC1vX?=
 =?us-ascii?Q?QSlm7TtzzkOc8WLSo+nmAruoNkVCggDln/Awk9RGSa5QNOKXM3ryQTucCzLW?=
 =?us-ascii?Q?FC48g5QS9ptHrK/cIO+D1hHJ6DUH0rbLj6PojGmcdYN0G8WtiopbgfteVa8W?=
 =?us-ascii?Q?s0SBeDYhU4cpX+ewm3KOVqb9O2X2TLzarIHKsqbVqfkIOfKu76tl6dy5gxuS?=
 =?us-ascii?Q?5s7VUG5fTzhj8ucup40tWZBTS1lIfFFPKz/ivW6s5Kqyww3SeyIT78pZZzyR?=
 =?us-ascii?Q?bW/UeqA7eqkU7KVuAFiIOHdkZ6x+n+Hlb2RfGBhPBdmSgoOMcMyCmCzuiBy8?=
 =?us-ascii?Q?Rni83MRyK6IgXXFLkiHnFLxz4MvxMLB7X0LUxSnuWCOl1+NdK3vO5DAA2gqA?=
 =?us-ascii?Q?pWKy7J29FymRi6mboldsdYzlbahj05v+WO3NNVx2J6lDK3ZaM6GW/LM4UDtB?=
 =?us-ascii?Q?A5Coxi5dxl5rr2yXBLGYmMAQPTdE4LaKX2ZB9sBmbpRgVh+sTInKRCcavdnW?=
 =?us-ascii?Q?i5Sb6wP9vc/O2NnUaa4JVURvl2kD2HOvNQnvOwldhO6ZPlBrjDMMAIs1vGqX?=
 =?us-ascii?Q?ZXItG5VW9w6leOMUo3wteKwSpTmwMadRh+3vF+eGuxzHCFwx3Oqiunlm/Olk?=
 =?us-ascii?Q?+Ugdc0yTlrxKnTTEJFpgpHoo0/0l42z1SRtYU2EmIiz6Y5PpyENDJzwc3uJg?=
 =?us-ascii?Q?EybrH2STQtrscYc1MfMtPaecszd2Mpu35c+K3eNnX5/dgibAcEtGkuXuEzJI?=
 =?us-ascii?Q?jG7jEX5pFDPn/rgKZqorO8yWWZzHua9nqVeokN8xzwQUTFnie0FCZC3V5McQ?=
 =?us-ascii?Q?kFt/Ob1X/0Vm1Iu4NGPavkeczeUjGosxajNsDzWcD+R2ofl5JhYoxkaLSFKg?=
 =?us-ascii?Q?ZSXdTU93ykCO13Jk6wtca9yYZRapu/BTVSdNoWLyEbLfSa47J2qb9s+y1gR1?=
 =?us-ascii?Q?EUCfjNk3i/K5CmW0bCzyL6cpH2yPzYuXKdNpCIjCRtkhTq3aNY0R6F3D6F5e?=
 =?us-ascii?Q?2CeIou+ajf4yyflwvp0M/CtmMZDMIWur+0gvdgLqrvEBtqnIQvgKbdAZHCpZ?=
 =?us-ascii?Q?JfuwoLGK55bs2dgW8YFAA0xnOYQ1DbcIuwBaZc0XSQLgcehF5+LbGe1JNqxj?=
 =?us-ascii?Q?Rw8jXXvSZ8OXpgyt2yJ0avIcRocm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uU734XZ/dIwoT93U9NSiMSy8b/FFNlRVk8GM2+xLImwgE18hAJxY5lSipUcA?=
 =?us-ascii?Q?QYdkq7geENU5IvVLKQsvnx4bncEmU1xmk+l8Ly4V1xP9jwPPCg9siUMSkLcb?=
 =?us-ascii?Q?YkYJTm/pL9aGPovuK54YgtQnVeGzgi067hUnqneYBTl7TQvd6QhftSVMBlfs?=
 =?us-ascii?Q?SNXqWhIqffbMNBqIexRl8Iw669Z3EBU9PeL+adQp6CsgvWyOVQKDdpx6wXt7?=
 =?us-ascii?Q?UCbeRezWwlzysEqqv7W+3lRU04tXkSQfxtJhxtp+tn1twr30ocZ3rTKZPbog?=
 =?us-ascii?Q?HahlP6N74JLR1ThbhPg4GaR1jF7FzGSOLYSOCce+tefueskLehs5oFBbtED8?=
 =?us-ascii?Q?qJQ+PeZ7a5ZmsCZ6cI9bgjWdn8RNjLFDtEiNiqlH9cpChHvgS82dvireYn4z?=
 =?us-ascii?Q?kKcia5oDmTnU1wBvFx6oM3L/D0reJlS6jvh+IjouChze9Qgp3dbdYaR4i7Xg?=
 =?us-ascii?Q?R4Hk/d1Sx3OqNisP1J7zJRtM3OT9kkVjLmIgC7KS7G+dJV74yPEzKTWtUquY?=
 =?us-ascii?Q?AWH0cVOvYPy6tPQkdoihlauE1AiXNOCqVPZ7XK6/ntskWaVTG1iFT6IhTEud?=
 =?us-ascii?Q?2deggVi1dN1ceTUVMn0hyt1fS+jk+tIT6wRh8B9het1+MsmzmSvGjf4quXE6?=
 =?us-ascii?Q?+sdDOTS6O0jp3PbzZtuSnRMkf7jQNWPla3sUCKwJG4JqbGtKZsMJmKAPmT3o?=
 =?us-ascii?Q?wZt1vw2n9r7F1l7lsjVqzzLK0UX5rjb4mUa4BU/gGIVOJoXhRxr01vyqlLN2?=
 =?us-ascii?Q?Xv6xR0h6/22RKyVp8zSa4rsWVi7RNjL5kePYOaWJ6y+ln2f6M0QWd6esnZiY?=
 =?us-ascii?Q?MYqNNITSUXQzRTzvHOZFhntlv577ZowuLRn/+oJK5t7EFpNLYKjSn+y61foA?=
 =?us-ascii?Q?rnquPPNcLzl6eHl3+1ZYGUw4asVGOAzsg+lEpLSSWExZVcGIdAHQyGEnZ+J0?=
 =?us-ascii?Q?B7q5UJH+72f/1sNu/zB6g3dIui98+GDZl4sXIrDEzbOLajr1yM0QbLBdXRcr?=
 =?us-ascii?Q?zNzBhlfZVFSPDsw6OE9qIxi9PWa46oAVay04Hv8Pc/RBSEAWsHBXWKE+GP2v?=
 =?us-ascii?Q?ErK0ix2Ib1eK0tLp0/O906FKnJuXKTCC0+HCoEUM+eqZdctcQ42/EHpxZhvt?=
 =?us-ascii?Q?tw4nFUelK+ORAHLuBHQUFHPcWLgReIcWjrrnLkYu+HPqppLRT9iGFQCexm7B?=
 =?us-ascii?Q?6eksi+WGMkdWU8EGYecdwdRptRAlsxJxCBTnkFHsUcKKxB+I/CapqCos/Aqd?=
 =?us-ascii?Q?a53towvMXnEUMI+Oh5Z3oXyB6KsHPiCBgdGBeD7FkDe3NRMpTWtD0hUH3kSP?=
 =?us-ascii?Q?x/20TgSLvaAeL5YYjwFvflTTZnn0SmYyTje25JMyd2qxpS3p+AJVDrwidrwz?=
 =?us-ascii?Q?R8UjQ4hE9uaTf5bAYh9OrJ0xqHSOJtW5vhrPRUXkVAuDFbGfU1epP9CTRCwY?=
 =?us-ascii?Q?B59OnPx1zQjL+heOZWY4dB/zy3RG4sZnXQWz+x/N7gYoCF4rO+iU4ISKCQoF?=
 =?us-ascii?Q?37556+A6hNjUtWP51QNoKGNfgmmw7nzirT56uwS9eP44kqbDs2RyYE8+9aVQ?=
 =?us-ascii?Q?Di0mUzFQFThRTNzglRLu8MhSv6OZCS9r1VMy5Suo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1190658-3e30-452c-ff84-08dcfc80fcc1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:30:10.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhZpWfVSuiAKWQftHwJg1WJCNZsda/HmQettF9RFC7F3uwNKkDHooLDPq8tsitaDUyI00FM/LmwPnQWKX6LfuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

Add basic HDMI video output support. Currently, only RGB888 output
pixel format is supported.  At the LVDS input side, the driver
supports single LVDS link and dual LVDS links with "jeida-24" LVDS
mapping.

Product link:
https://www.ite.com.tw/en/product/cate1/IT6263

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
* Collect Biju's T-b tag and Dmitry's R-b tag.

v4:
* Use local variable reset_gpio in probe().  (Biju)
* Move pixel clock rate validation from mode_valid callback to
  hdmi_tmds_char_rate_valid callback.  (Maxime)
* Document IT6263 video processing throughput constraints by adding comments.
  (Maxime)
* Fix LVDS 8-bit color depth macro BIT8.
* Drop 30-bit LVDS data bit order validation(30-bit LVDS data bit order is not
  reversed).
* Collect Biju's R-b tag and Maxime's A-b tag.

v3:
* Use HDMI connector framework.  (Maxime)
* Control the missing HDMI_REG_AVI_INFOFRM_CTRL register.
* Validate the maximal HDMI TMDS character rate.  (Dmitry)
* Get LVDS data mapping from data-mapping DT property.  (Dmitry, Biju)
* Validate 30bit LVDS data bit order by checking data-mirror DT property.
* Use drm_of_lvds_get_dual_link_pixel_order_sink().  (Dmitry)
* Initialize a bridge connector instead of open coding.  (Dmitry)
* Add a comment that IT6263 chip has no HPD IRQ support.  (Dmitry)
* Use devm_drm_bridge_add() instead of drm_bridge_add().  (Dmitry)
* Fix a minor build warning reported by kernel test robot.

v2:
* Add AVI inforframe support.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA.  (Biju)
* Rename it6263_reset() to it6263_hw_reset().  (Biju)
* Check number of LVDS link data lanes.  (Biju)

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ite-it6263.c | 898 ++++++++++++++++++++++++++++
 3 files changed, 910 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 609f4d0ac93d..6b4664d91faa 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,6 +90,17 @@ config DRM_FSL_LDB
 	help
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
+config DRM_ITE_IT6263
+	tristate "ITE IT6263 LVDS/HDMI bridge"
+	depends on OF
+	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  ITE IT6263 LVDS to HDMI bridge chip driver.
+
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 3daf803ce80b..97304b429a53 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
 obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
 obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
 obj-$(CONFIG_DRM_FSL_LDB) += fsl-ldb.o
+obj-$(CONFIG_DRM_ITE_IT6263) += ite-it6263.o
 obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
 obj-$(CONFIG_DRM_LONTIUM_LT8912B) += lontium-lt8912b.o
 obj-$(CONFIG_DRM_LONTIUM_LT9211) += lontium-lt9211.o
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
new file mode 100644
index 000000000000..cbabd4e20d3e
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -0,0 +1,898 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+/* -----------------------------------------------------------------------------
+ * LVDS registers
+ */
+
+/* LVDS software reset registers */
+#define LVDS_REG_05			0x05
+#define  REG_SOFT_P_RST			BIT(1)
+
+/* LVDS system configuration registers */
+/* 0x0b */
+#define LVDS_REG_0B			0x0b
+#define  REG_SSC_PCLK_RF		BIT(0)
+#define  REG_LVDS_IN_SWAP		BIT(1)
+
+/* LVDS test pattern gen control registers */
+/* 0x2c */
+#define LVDS_REG_2C			0x2c
+#define  REG_COL_DEP			GENMASK(1, 0)
+#define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
+#define  OUT_MAP			BIT(4)
+#define  JEIDA				0
+#define  REG_DESSC_ENB			BIT(6)
+#define  DMODE				BIT(7)
+#define  DISO				BIT(7)
+#define  SISO				0
+
+#define LVDS_REG_3C			0x3c
+#define LVDS_REG_3F			0x3f
+#define LVDS_REG_47			0x47
+#define LVDS_REG_48			0x48
+#define LVDS_REG_4F			0x4f
+#define LVDS_REG_52			0x52
+
+/* -----------------------------------------------------------------------------
+ * HDMI registers are separated into three banks:
+ * 1) HDMI register common bank: 0x00 ~ 0x2f
+ */
+
+/* HDMI genernal registers */
+#define HDMI_REG_SW_RST			0x04
+#define  SOFTREF_RST			BIT(5)
+#define  SOFTA_RST			BIT(4)
+#define  SOFTV_RST			BIT(3)
+#define  AUD_RST			BIT(2)
+#define  HDCP_RST			BIT(0)
+#define  HDMI_RST_ALL			(SOFTREF_RST | SOFTA_RST | SOFTV_RST | \
+					 AUD_RST | HDCP_RST)
+
+#define HDMI_REG_SYS_STATUS		0x0e
+#define  HPDETECT			BIT(6)
+#define  TXVIDSTABLE			BIT(4)
+
+#define HDMI_REG_BANK_CTRL		0x0f
+#define  REG_BANK_SEL			BIT(0)
+
+/* HDMI System DDC control registers */
+#define HDMI_REG_DDC_MASTER_CTRL	0x10
+#define  MASTER_SEL_HOST		BIT(0)
+
+#define HDMI_REG_DDC_HEADER		0x11
+
+#define HDMI_REG_DDC_REQOFF		0x12
+#define HDMI_REG_DDC_REQCOUNT		0x13
+#define HDMI_REG_DDC_EDIDSEG		0x14
+
+#define HDMI_REG_DDC_CMD		0x15
+#define  DDC_CMD_EDID_READ		0x3
+#define  DDC_CMD_FIFO_CLR		0x9
+
+#define HDMI_REG_DDC_STATUS		0x16
+#define  DDC_DONE			BIT(7)
+#define  DDC_NOACK			BIT(5)
+#define  DDC_WAITBUS			BIT(4)
+#define  DDC_ARBILOSE			BIT(3)
+#define  DDC_ERROR			(DDC_NOACK | DDC_WAITBUS | DDC_ARBILOSE)
+
+#define HDMI_DDC_FIFO_BYTES		32
+#define HDMI_REG_DDC_READFIFO		0x17
+#define HDMI_REG_LVDS_PORT		0x1d /* LVDS input control I2C addr */
+#define HDMI_REG_LVDS_PORT_EN		0x1e
+#define LVDS_INPUT_CTRL_I2C_ADDR	0x33
+
+/* -----------------------------------------------------------------------------
+ * 2) HDMI register bank0: 0x30 ~ 0xff
+ */
+
+/* HDMI AFE registers */
+#define HDMI_REG_AFE_DRV_CTRL		0x61
+#define  AFE_DRV_PWD			BIT(5)
+#define  AFE_DRV_RST			BIT(4)
+
+#define HDMI_REG_AFE_XP_CTRL		0x62
+#define  AFE_XP_GAINBIT			BIT(7)
+#define  AFE_XP_ER0			BIT(4)
+#define  AFE_XP_RESETB			BIT(3)
+
+#define HDMI_REG_AFE_ISW_CTRL		0x63
+
+#define HDMI_REG_AFE_IP_CTRL		0x64
+#define  AFE_IP_GAINBIT			BIT(7)
+#define  AFE_IP_ER0			BIT(3)
+#define  AFE_IP_RESETB			BIT(2)
+
+/* HDMI input data format registers */
+#define HDMI_REG_INPUT_MODE		0x70
+#define  IN_RGB				0x00
+
+/* HDMI general control registers */
+#define HDMI_REG_HDMI_MODE		0xc0
+#define  TX_HDMI_MODE			BIT(0)
+
+#define HDMI_REG_GCP			0xc1
+#define  AVMUTE				BIT(0)
+#define  HDMI_COLOR_DEPTH		GENMASK(6, 4)
+#define  HDMI_COLOR_DEPTH_24		FIELD_PREP(HDMI_COLOR_DEPTH, 4)
+
+#define HDMI_REG_PKT_GENERAL_CTRL	0xc6
+#define HDMI_REG_AVI_INFOFRM_CTRL	0xcd
+#define  ENABLE_PKT			BIT(0)
+#define  REPEAT_PKT			BIT(1)
+
+/* -----------------------------------------------------------------------------
+ * 3) HDMI register bank1: 0x130 ~ 0x1ff (HDMI packet registers)
+ */
+
+/* AVI packet registers */
+#define HDMI_REG_AVI_DB1		0x158
+#define HDMI_REG_AVI_DB2		0x159
+#define HDMI_REG_AVI_DB3		0x15a
+#define HDMI_REG_AVI_DB4		0x15b
+#define HDMI_REG_AVI_DB5		0x15c
+#define HDMI_REG_AVI_CSUM		0x15d
+#define HDMI_REG_AVI_DB6		0x15e
+#define HDMI_REG_AVI_DB7		0x15f
+#define HDMI_REG_AVI_DB8		0x160
+#define HDMI_REG_AVI_DB9		0x161
+#define HDMI_REG_AVI_DB10		0x162
+#define HDMI_REG_AVI_DB11		0x163
+#define HDMI_REG_AVI_DB12		0x164
+#define HDMI_REG_AVI_DB13		0x165
+
+#define HDMI_AVI_DB_CHUNK1_SIZE		(HDMI_REG_AVI_DB5 - HDMI_REG_AVI_DB1 + 1)
+#define HDMI_AVI_DB_CHUNK2_SIZE		(HDMI_REG_AVI_DB13 - HDMI_REG_AVI_DB6 + 1)
+
+/* IT6263 data sheet Rev0.8: LVDS RX supports input clock rate up to 150MHz. */
+#define MAX_PIXEL_CLOCK_KHZ		150000
+
+/* IT6263 programming guide Ver0.90: PCLK_HIGH for TMDS clock over 80MHz. */
+#define HIGH_PIXEL_CLOCK_KHZ		80000
+
+/*
+ * IT6263 data sheet Rev0.8: HDMI TX supports link speeds of up to 2.25Gbps
+ * (link clock rate of 225MHz).
+ */
+#define MAX_HDMI_TMDS_CHAR_RATE_HZ	225000000
+
+struct it6263 {
+	struct device *dev;
+	struct i2c_client *hdmi_i2c;
+	struct i2c_client *lvds_i2c;
+	struct regmap *hdmi_regmap;
+	struct regmap *lvds_regmap;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	int lvds_data_mapping;
+	bool lvds_dual_link;
+	bool lvds_link12_swap;
+};
+
+static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct it6263, bridge);
+}
+
+static bool it6263_hdmi_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_BANK_CTRL:
+	case HDMI_REG_DDC_MASTER_CTRL:
+	case HDMI_REG_DDC_HEADER:
+	case HDMI_REG_DDC_REQOFF:
+	case HDMI_REG_DDC_REQCOUNT:
+	case HDMI_REG_DDC_EDIDSEG:
+	case HDMI_REG_DDC_CMD:
+	case HDMI_REG_LVDS_PORT:
+	case HDMI_REG_LVDS_PORT_EN:
+	case HDMI_REG_AFE_DRV_CTRL:
+	case HDMI_REG_AFE_XP_CTRL:
+	case HDMI_REG_AFE_ISW_CTRL:
+	case HDMI_REG_AFE_IP_CTRL:
+	case HDMI_REG_INPUT_MODE:
+	case HDMI_REG_HDMI_MODE:
+	case HDMI_REG_GCP:
+	case HDMI_REG_PKT_GENERAL_CTRL:
+	case HDMI_REG_AVI_INFOFRM_CTRL:
+	case HDMI_REG_AVI_DB1:
+	case HDMI_REG_AVI_DB2:
+	case HDMI_REG_AVI_DB3:
+	case HDMI_REG_AVI_DB4:
+	case HDMI_REG_AVI_DB5:
+	case HDMI_REG_AVI_CSUM:
+	case HDMI_REG_AVI_DB6:
+	case HDMI_REG_AVI_DB7:
+	case HDMI_REG_AVI_DB8:
+	case HDMI_REG_AVI_DB9:
+	case HDMI_REG_AVI_DB10:
+	case HDMI_REG_AVI_DB11:
+	case HDMI_REG_AVI_DB12:
+	case HDMI_REG_AVI_DB13:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_readable_reg(struct device *dev, unsigned int reg)
+{
+	if (it6263_hdmi_writeable_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_hdmi_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case HDMI_REG_SW_RST:
+	case HDMI_REG_SYS_STATUS:
+	case HDMI_REG_DDC_STATUS:
+	case HDMI_REG_DDC_READFIFO:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_range_cfg it6263_hdmi_range_cfg = {
+	.range_min = 0x00,
+	.range_max = HDMI_REG_AVI_DB13,
+	.selector_reg = HDMI_REG_BANK_CTRL,
+	.selector_mask = REG_BANK_SEL,
+	.selector_shift = 0,
+	.window_start = 0x00,
+	.window_len = 0x100,
+};
+
+static const struct regmap_config it6263_hdmi_regmap_config = {
+	.name = "it6263-hdmi",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_hdmi_writeable_reg,
+	.readable_reg = it6263_hdmi_readable_reg,
+	.volatile_reg = it6263_hdmi_volatile_reg,
+	.max_register = HDMI_REG_AVI_DB13,
+	.ranges = &it6263_hdmi_range_cfg,
+	.num_ranges = 1,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static bool it6263_lvds_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case LVDS_REG_05:
+	case LVDS_REG_0B:
+	case LVDS_REG_2C:
+	case LVDS_REG_3C:
+	case LVDS_REG_3F:
+	case LVDS_REG_47:
+	case LVDS_REG_48:
+	case LVDS_REG_4F:
+	case LVDS_REG_52:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool it6263_lvds_readable_reg(struct device *dev, unsigned int reg)
+{
+	return it6263_lvds_writeable_reg(dev, reg);
+}
+
+static bool it6263_lvds_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg == LVDS_REG_05;
+}
+
+static const struct regmap_config it6263_lvds_regmap_config = {
+	.name = "it6263-lvds",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.writeable_reg = it6263_lvds_writeable_reg,
+	.readable_reg = it6263_lvds_readable_reg,
+	.volatile_reg = it6263_lvds_volatile_reg,
+	.max_register = LVDS_REG_52,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const char * const it6263_supplies[] = {
+	"ivdd", "ovdd", "txavcc18", "txavcc33", "pvcc1", "pvcc2",
+	"avcc", "anvdd", "apvdd"
+};
+
+static int it6263_parse_dt(struct it6263 *it)
+{
+	struct device *dev = it->dev;
+	struct device_node *port0, *port1;
+	int ret = 0;
+
+	it->lvds_data_mapping = drm_of_lvds_get_data_mapping(dev->of_node);
+	if (it->lvds_data_mapping < 0) {
+		dev_err(dev, "%pOF: invalid or missing %s DT property: %d\n",
+			dev->of_node, "data-mapping", it->lvds_data_mapping);
+		return it->lvds_data_mapping;
+	}
+
+	it->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	if (IS_ERR(it->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(it->next_bridge),
+				     "failed to get next bridge\n");
+
+	port0 = of_graph_get_port_by_id(dev->of_node, 0);
+	port1 = of_graph_get_port_by_id(dev->of_node, 1);
+	if (port0 && port1) {
+		int order;
+
+		it->lvds_dual_link = true;
+		order = drm_of_lvds_get_dual_link_pixel_order_sink(port0, port1);
+		if (order < 0) {
+			dev_err(dev,
+				"failed to get dual link pixel order: %d\n",
+				order);
+			ret = order;
+		} else if (order == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
+			it->lvds_link12_swap = true;
+		}
+	} else if (port1) {
+		ret = -EINVAL;
+		dev_err(dev, "single input LVDS port1 is not supported\n");
+	} else if (!port0) {
+		ret = -EINVAL;
+		dev_err(dev, "no input LVDS port\n");
+	}
+
+	of_node_put(port0);
+	of_node_put(port1);
+
+	return ret;
+}
+
+static inline void it6263_hw_reset(struct gpio_desc *reset_gpio)
+{
+	if (!reset_gpio)
+		return;
+
+	gpiod_set_value_cansleep(reset_gpio, 0);
+	fsleep(1000);
+	gpiod_set_value_cansleep(reset_gpio, 1);
+	/* The chip maker says the low pulse should be at least 40ms. */
+	fsleep(40000);
+	gpiod_set_value_cansleep(reset_gpio, 0);
+	/* addtional time to wait the high voltage to be stable */
+	fsleep(5000);
+}
+
+static inline int it6263_lvds_set_i2c_addr(struct it6263 *it)
+{
+	int ret;
+
+	ret = regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT,
+			   LVDS_INPUT_CTRL_I2C_ADDR << 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(it->hdmi_regmap, HDMI_REG_LVDS_PORT_EN, BIT(0));
+}
+
+static inline void it6263_lvds_reset(struct it6263 *it)
+{
+	/* AFE PLL reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), 0x0);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, BIT(0), BIT(0));
+
+	/* software pixel clock domain reset */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST,
+			  REG_SOFT_P_RST);
+	fsleep(1000);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_05, REG_SOFT_P_RST, 0x0);
+	fsleep(10000);
+}
+
+static inline void it6263_lvds_set_interface(struct it6263 *it)
+{
+	/* color depth */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+	/* output mapping */
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+
+	if (it->lvds_dual_link) {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), BIT(1));
+	} else {
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, SISO);
+		regmap_write_bits(it->lvds_regmap, LVDS_REG_52, BIT(1), 0);
+	}
+}
+
+static inline void it6263_lvds_set_afe(struct it6263 *it)
+{
+	regmap_write(it->lvds_regmap, LVDS_REG_3C, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_3F, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_47, 0xaa);
+	regmap_write(it->lvds_regmap, LVDS_REG_48, 0x02);
+	regmap_write(it->lvds_regmap, LVDS_REG_4F, 0x11);
+
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_SSC_PCLK_RF,
+			  REG_SSC_PCLK_RF);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_3C, 0x07, 0);
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_DESSC_ENB,
+			  REG_DESSC_ENB);
+}
+
+static inline void it6263_lvds_sys_cfg(struct it6263 *it)
+{
+	regmap_write_bits(it->lvds_regmap, LVDS_REG_0B, REG_LVDS_IN_SWAP,
+			  it->lvds_link12_swap ? REG_LVDS_IN_SWAP : 0);
+}
+
+static inline void it6263_lvds_config(struct it6263 *it)
+{
+	it6263_lvds_reset(it);
+	it6263_lvds_set_interface(it);
+	it6263_lvds_set_afe(it);
+	it6263_lvds_sys_cfg(it);
+}
+
+static inline void it6263_hdmi_config(struct it6263 *it)
+{
+	regmap_write(it->hdmi_regmap, HDMI_REG_SW_RST, HDMI_RST_ALL);
+	regmap_write(it->hdmi_regmap, HDMI_REG_INPUT_MODE, IN_RGB);
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, HDMI_COLOR_DEPTH,
+			  HDMI_COLOR_DEPTH_24);
+}
+
+static enum drm_connector_status it6263_detect(struct it6263 *it)
+{
+	unsigned int val;
+
+	regmap_read(it->hdmi_regmap, HDMI_REG_SYS_STATUS, &val);
+	if (val & HPDETECT)
+		return connector_status_connected;
+	else
+		return connector_status_disconnected;
+}
+
+static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
+{
+	struct it6263 *it = data;
+	struct regmap *regmap = it->hdmi_regmap;
+	unsigned int start = (block % 2) * EDID_LENGTH;
+	unsigned int segment = block >> 1;
+	unsigned int count, val;
+	int ret;
+
+	regmap_write(regmap, HDMI_REG_DDC_MASTER_CTRL, MASTER_SEL_HOST);
+	regmap_write(regmap, HDMI_REG_DDC_HEADER, DDC_ADDR << 1);
+	regmap_write(regmap, HDMI_REG_DDC_EDIDSEG, segment);
+
+	while (len) {
+		/* clear DDC FIFO */
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_FIFO_CLR);
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS,
+					       val, val & DDC_DONE,
+					       2000, 10000);
+		if (ret) {
+			dev_err(it->dev, "failed to clear DDC FIFO:%d\n", ret);
+			return ret;
+		}
+
+		count = len > HDMI_DDC_FIFO_BYTES ? HDMI_DDC_FIFO_BYTES : len;
+
+		/* fire the read command */
+		regmap_write(regmap, HDMI_REG_DDC_REQOFF, start);
+		regmap_write(regmap, HDMI_REG_DDC_REQCOUNT, count);
+		regmap_write(regmap, HDMI_REG_DDC_CMD, DDC_CMD_EDID_READ);
+
+		start += count;
+		len -= count;
+
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_DDC_STATUS, val,
+					       val & (DDC_DONE | DDC_ERROR),
+					       20000, 250000);
+		if (ret && !(val & DDC_ERROR)) {
+			dev_err(it->dev, "failed to read EDID:%d\n", ret);
+			return ret;
+		}
+
+		if (val & DDC_ERROR) {
+			dev_err(it->dev, "DDC error\n");
+			return -EIO;
+		}
+
+		/* cache to buffer */
+		for (; count > 0; count--) {
+			regmap_read(regmap, HDMI_REG_DDC_READFIFO, &val);
+			*(buf++) = val;
+		}
+	}
+
+	return 0;
+}
+
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	return drm_atomic_helper_connector_hdmi_check(conn_state->connector,
+						      conn_state->state);
+}
+
+static void
+it6263_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	regmap_write_bits(it->hdmi_regmap, HDMI_REG_GCP, AVMUTE, AVMUTE);
+	regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
+	regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
+		     AFE_DRV_RST | AFE_DRV_PWD);
+}
+
+static void
+it6263_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
+{
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	struct it6263 *it = bridge_to_it6263(bridge);
+	const struct drm_crtc_state *crtc_state;
+	struct regmap *regmap = it->hdmi_regmap;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	bool is_stable = false;
+	struct drm_crtc *crtc;
+	unsigned int val;
+	bool pclk_high;
+	int i, ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	mode = &crtc_state->adjusted_mode;
+
+	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
+
+	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	/* HDMI AFE setup */
+	pclk_high = mode->clock > HIGH_PIXEL_CLOCK_KHZ;
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, AFE_DRV_RST);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_GAINBIT | AFE_XP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_XP_CTRL,
+			     AFE_XP_ER0 | AFE_XP_RESETB);
+	regmap_write(regmap, HDMI_REG_AFE_ISW_CTRL, 0x10);
+	if (pclk_high)
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_GAINBIT | AFE_IP_RESETB);
+	else
+		regmap_write(regmap, HDMI_REG_AFE_IP_CTRL,
+			     AFE_IP_ER0 | AFE_IP_RESETB);
+
+	/* HDMI software video reset */
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, SOFTV_RST);
+	fsleep(1000);
+	regmap_write_bits(regmap, HDMI_REG_SW_RST, SOFTV_RST, 0);
+
+	/* reconfigure LVDS and retry several times in case video is instable */
+	for (i = 0; i < 3; i++) {
+		ret = regmap_read_poll_timeout(regmap, HDMI_REG_SYS_STATUS, val,
+					       val & TXVIDSTABLE,
+					       20000, 500000);
+		if (!ret) {
+			is_stable = true;
+			break;
+		}
+
+		it6263_lvds_config(it);
+	}
+
+	if (!is_stable)
+		dev_warn(it->dev, "failed to wait for video stable\n");
+
+	/* HDMI AFE reset release and power up */
+	regmap_write(regmap, HDMI_REG_AFE_DRV_CTRL, 0);
+
+	regmap_write_bits(regmap, HDMI_REG_GCP, AVMUTE, 0);
+
+	regmap_write(regmap, HDMI_REG_PKT_GENERAL_CTRL, ENABLE_PKT | REPEAT_PKT);
+}
+
+static enum drm_mode_status
+it6263_bridge_mode_valid(struct drm_bridge *bridge,
+			 const struct drm_display_info *info,
+			 const struct drm_display_mode *mode)
+{
+	unsigned long long rate;
+
+	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+	if (rate == 0)
+		return MODE_NOCLOCK;
+
+	return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, rate);
+}
+
+static int it6263_bridge_attach(struct drm_bridge *bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct drm_connector *connector;
+	int ret;
+
+	ret = drm_bridge_attach(bridge->encoder, it->next_bridge, bridge,
+				flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret < 0)
+		return ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
+		return 0;
+
+	connector = drm_bridge_connector_init(bridge->dev, bridge->encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(it->dev, "failed to initialize bridge connector: %d\n",
+			ret);
+		return ret;
+	}
+
+	drm_connector_attach_encoder(connector, bridge->encoder);
+
+	return 0;
+}
+
+static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return it6263_detect(it);
+}
+
+static const struct drm_edid *
+it6263_bridge_edid_read(struct drm_bridge *bridge,
+			struct drm_connector *connector)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	return drm_edid_read_custom(connector, it6263_read_edid, it);
+}
+
+static u32 *
+it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
+		return NULL;
+
+	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
+static enum drm_mode_status
+it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 unsigned long long tmds_rate)
+{
+	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+
+	if (type == HDMI_INFOFRAME_TYPE_AVI)
+		regmap_write(it->hdmi_regmap, HDMI_REG_AVI_INFOFRM_CTRL, 0);
+	else
+		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+
+	return 0;
+}
+
+static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
+				       enum hdmi_infoframe_type type,
+				       const u8 *buffer, size_t len)
+{
+	struct it6263 *it = bridge_to_it6263(bridge);
+	struct regmap *regmap = it->hdmi_regmap;
+
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
+		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return 0;
+	}
+
+	/* write the first AVI infoframe data byte chunk(DB1-DB5) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB1,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE],
+			  HDMI_AVI_DB_CHUNK1_SIZE);
+
+	/* write the second AVI infoframe data byte chunk(DB6-DB13) */
+	regmap_bulk_write(regmap, HDMI_REG_AVI_DB6,
+			  &buffer[HDMI_INFOFRAME_HEADER_SIZE +
+				  HDMI_AVI_DB_CHUNK1_SIZE],
+			  HDMI_AVI_DB_CHUNK2_SIZE);
+
+	/* write checksum */
+	regmap_write(regmap, HDMI_REG_AVI_CSUM, buffer[3]);
+
+	regmap_write(regmap, HDMI_REG_AVI_INFOFRM_CTRL, ENABLE_PKT | REPEAT_PKT);
+
+	return 0;
+}
+
+static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it6263_bridge_attach,
+	.mode_valid = it6263_bridge_mode_valid,
+	.atomic_disable = it6263_bridge_atomic_disable,
+	.atomic_enable = it6263_bridge_atomic_enable,
+	.atomic_check = it6263_bridge_atomic_check,
+	.detect = it6263_bridge_detect,
+	.edid_read = it6263_bridge_edid_read,
+	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
+	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
+	.hdmi_clear_infoframe = it6263_hdmi_clear_infoframe,
+	.hdmi_write_infoframe = it6263_hdmi_write_infoframe,
+};
+
+static int it6263_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
+	struct it6263 *it;
+	int ret;
+
+	it = devm_kzalloc(dev, sizeof(*it), GFP_KERNEL);
+	if (!it)
+		return -ENOMEM;
+
+	it->dev = dev;
+	it->hdmi_i2c = client;
+
+	it->hdmi_regmap = devm_regmap_init_i2c(client,
+					       &it6263_hdmi_regmap_config);
+	if (IS_ERR(it->hdmi_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
+				     "failed to init I2C regmap for HDMI\n");
+
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to get reset gpio\n");
+
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
+					     it6263_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get power supplies\n");
+
+	ret = it6263_parse_dt(it);
+	if (ret)
+		return ret;
+
+	it6263_hw_reset(reset_gpio);
+
+	ret = it6263_lvds_set_i2c_addr(it);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set I2C addr\n");
+
+	it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
+						 LVDS_INPUT_CTRL_I2C_ADDR);
+	if (IS_ERR(it->lvds_i2c))
+		dev_err_probe(it->dev, PTR_ERR(it->lvds_i2c),
+			      "failed to allocate I2C device for LVDS\n");
+
+	it->lvds_regmap = devm_regmap_init_i2c(it->lvds_i2c,
+					       &it6263_lvds_regmap_config);
+	if (IS_ERR(it->lvds_regmap))
+		return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
+				     "failed to init I2C regmap for LVDS\n");
+
+	it6263_lvds_config(it);
+	it6263_hdmi_config(it);
+
+	i2c_set_clientdata(client, it);
+
+	it->bridge.funcs = &it6263_bridge_funcs;
+	it->bridge.of_node = dev->of_node;
+	/* IT6263 chip doesn't support HPD interrupt. */
+	it->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+			 DRM_BRIDGE_OP_HDMI;
+	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	it->bridge.vendor = "ITE";
+	it->bridge.product = "IT6263";
+
+	return devm_drm_bridge_add(dev, &it->bridge);
+}
+
+static const struct of_device_id it6263_of_match[] = {
+	{ .compatible = "ite,it6263", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, it6263_of_match);
+
+static const struct i2c_device_id it6263_i2c_ids[] = {
+	{ "it6263", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
+
+static struct i2c_driver it6263_driver = {
+	.probe = it6263_probe,
+	.driver = {
+		.name = "it6263",
+		.of_match_table = it6263_of_match,
+	},
+	.id_table = it6263_i2c_ids,
+};
+module_i2c_driver(it6263_driver);
+
+MODULE_DESCRIPTION("ITE Tech. Inc. IT6263 LVDS/HDMI bridge");
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

