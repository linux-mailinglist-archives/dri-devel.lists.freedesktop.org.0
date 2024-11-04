Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5F9BAB65
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730B410E36A;
	Mon,  4 Nov 2024 03:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CsILl/mF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2047.outbound.protection.outlook.com [40.107.104.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E7210E36A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtA4IKEDK70cT+yB1T8NDVjZpqpHkCQkk3Ja9H98/1yUrWd9f3FAsVxNsRzry2G1TVQuP3o83dOQAls6R6Nl/bv2wWBTg/ffucEK967xYKHz+aQjN5ZmGOelDjhZaiaXKTTsKAVoklRdUoCKk0ibANjhja3u2WENnkhUfQDFX07kQ3ZVhcHQ068xSoePozaQWNhwzuwsgtoQ11IzlR240xYJl6l4Eu/QtNnODiCELnbGudHM03jbJN6kWbsP+sP2jOSIUijIkyGavzL4lpX67UOa8h+38eHlOPYEp95fx0nTm63Xh5YOtL9foRgwFjBTQnJy0ef0sKIFI4Ty09kY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIc+lX3OIioeIXuIEmaHftGv72E9ULzY1LMqyYKFO5o=;
 b=av9yQPaxZ1+761QczGQTTGHdyRxXjfXOk/v4vDHbS5ixqQ+9zOI2r63ZZcRZjeSf49Lv968SegWxeYiHCx+Rqif+vrbWyyFW66gNWF8VC09PyXdBOPvycFw/USyd5mYXxqw7NlW1jXM0pAd6NW4Xp+9ZUWk/7nsFpyZnOAYiCum9wJ5J57RR0yiumcCJLJouYkTt5B5aWHvsmNCl0qglbb0fOS3CcpfxjEldzI/NMAt4w6KEly6McKsJ1EOPeNDYMEdB8c08IWtlwf/d0tmDDO089EMQ2V1sM1ImX/Z0IvtWDsOhCLcvdP+TCVblYn3IYZI6/TRUyceEoKXPxRDO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIc+lX3OIioeIXuIEmaHftGv72E9ULzY1LMqyYKFO5o=;
 b=CsILl/mFaWYFw1wpP45Orcaxqck367i7cBeX2BgsPzEdFyfdWLZkC6qBxkQqRX3MNOLbnCSGOQsqIu1iDCTbroTPJ6vVl5vLJng1Vk6FQKCJuNSfxaOmmKpY7GqyZWVx5p3Bw+HxXwAdi0EWQlo0nAsApXjJUMXVWwp8ttl1BARspyDK3WaOxPfaILZvAtdZlXAJpaVLltl72HySmGFjAVGWg9RHXUbQoYQm1s8tfKlRh0xp9h3T1/sFEe6yqvfjFqLKDv3ANasMF3eC4deG5YWJwT1BthozW0LZQPBjy41We8Fp7ExNzvl4FNk5NqIblvZecxYUjfSjTUqicNiL3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:30:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:30:32 +0000
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
Subject: [PATCH v5 12/13] arm64: defconfig: Enable ITE IT6263 driver
Date: Mon,  4 Nov 2024 11:28:05 +0800
Message-Id: <20241104032806.611890-13-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 74ebfa18-1a92-4d5f-e732-08dcfc8109be
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?plQPRsFlGxj+ZSNZmBmoJfrrhgC8sVL/LfZm8ZP7lc2uJgNiZ4AzUTBeQTcN?=
 =?us-ascii?Q?Cos36U4VpbosPYVTuoEouQkQeIWwoZcWXxR+WWWNC7CR0Be5lS3wm2y9ZPwl?=
 =?us-ascii?Q?XysmtZPiN7cFT7XcSNfnB9yh8F5pXCM6gSvoL3Xfg1SKgbqShSnBqfWvNFTM?=
 =?us-ascii?Q?y5tulP1+DTq6Nu8hnp5VbTVxG1mhvVjuTJ2dsw1YTZKwEUY1ISDKynB0hBAp?=
 =?us-ascii?Q?prAtHx59xfJ9oOd0W9m64ZYX3Ke5btak1Z0oPRvc/+rXsB7EZ6nJkFrUsNT+?=
 =?us-ascii?Q?cZYvQTmupF+vjCIoazbi0yX29gP0Sa7dPCHNYdvltFHJaxlwx/pprvwLGOY4?=
 =?us-ascii?Q?pxxVZ23vJX0iUKqOTzoaPrtpmlhaakddn8vJn4wfys9e6+AFYjqe4gdjvxmZ?=
 =?us-ascii?Q?CzVgroUksN1hPZdxNNLn2HPyIzowIemwYpvHWfKCgkplDKk4xh5+sBzbB1uq?=
 =?us-ascii?Q?XcOnALkUgHfJwhdR5oBZ8Atots5Q1sw0WoEuTcxXUxy7A/C3V5gOReS5DgNV?=
 =?us-ascii?Q?vD5MW3blpfm3sxsQ29AfjI1rwca9RT1PpJUVceUKXHpUDIlPYeaNREDYlF/l?=
 =?us-ascii?Q?EVM1gipaUXH6IvLSnaSjhfWKM+CbKmspb3a49BNfOUGxe5N1RhTueDFu7PE0?=
 =?us-ascii?Q?RJjRBhChA9vF40mGP7Bpk3fPG8sFsiTxE4GaBv09UAu7zt1bC5QtvgeH6Ddc?=
 =?us-ascii?Q?H4Was6u48z3zY479Fk/RR9NANKVz8bYUhYsVcBGzLqm1und3um1+ti0ptAlL?=
 =?us-ascii?Q?+DNIPHj/dqSiqrSn/WpFx7XWZN4B7F0j75/SsajjYXPkIkKIkYIWTu5Iq1sw?=
 =?us-ascii?Q?6PGuxbJpUD+xK3YnSDzis5f9Q8xX7vaYUoPZzzq5chqbqMZr6D2aAmJKs6Zw?=
 =?us-ascii?Q?TF1IYg4WOnPUn9KpEoME6Qt54uHHGVGkPTceWgY34H6oSIHgHOVkjH3DXEEm?=
 =?us-ascii?Q?efc67Q8zKS1yAaXsIu99iOQzpgd6aMa+86jl4Gg/X+5e7MBpHbJwoLzYQqAA?=
 =?us-ascii?Q?HTtqf6ref3epG5rmyLCy6BfaRiOuJZXSVnlWzMmVSYBQ5EXiptuviFE8gDUC?=
 =?us-ascii?Q?z4P3unM4jXoyE+B6R8XWHJQwzciGwoZoX6X2YamwahHWdKfnjiaEvPiJbckb?=
 =?us-ascii?Q?leGaWLTsjGI9n8xWmAkbwXfhzzUEimABkc2vrTm2w2PhlLNyh8eh8BRb2FC0?=
 =?us-ascii?Q?X6J4EqCNnndoctS5pLgtFxHXc0xEW3hYEEJN5e7k6jrbTotk/m/VGmD88WwM?=
 =?us-ascii?Q?aLOWHxjoF2RSaZEfycdt61P2iNO4hh/7CyT0m6RBDl9nQBNm7kYcjxDXQ+OS?=
 =?us-ascii?Q?j2zftzt3m2M1vTEzinR5deCFbV9kU0nAMFO4Id4pongdr42fcOoHXK6Mi0cz?=
 =?us-ascii?Q?cory+F4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tobQimvUdbb6+CUCE5sgvvXuKPOn7kLIG3OJ0SRRetjuILt0UlSMb197khhg?=
 =?us-ascii?Q?4Hq+SUPoLqu+nYvZbphfX6a1bVTwmRQhNvoBuOXNgM9StJdtPdxi/Z/mT6qL?=
 =?us-ascii?Q?+c+KL5IUzzuFeAv1thbklj0Rw+EIpI4kmSSyD58E/DrY/Xh6O1BdXN/KGF/5?=
 =?us-ascii?Q?7UhOWzxxnG2/rVFzSL5NswRRAqosEw7JqZ+URllW9MjIiIhAoIPRNUDSMZSG?=
 =?us-ascii?Q?Jyzgu4oBaTz7wwXqngpEKZ//t2UoWj6EQZOGrJXRzLgBZtR8IaEu18gNJKrw?=
 =?us-ascii?Q?lV2lBhK6YareEitxSBujtc+mreYKeAVPMnglj64ealrBi4RisbfH5O2I9ho/?=
 =?us-ascii?Q?BCddGnPa/2jXwID1q8eJDAm65d6P4BgTSTuXPfLkUCX0Fqvw/srWiMHbMltc?=
 =?us-ascii?Q?gOsf1doRPzkRm1FL50XeWD5aRt3vvNg94h5qS8eMjLOCgIsGfL5lalbXFMLJ?=
 =?us-ascii?Q?8OXO35gupgT5dFSPldPI+2uAMJesSgSeOFB6K0ERW5oiRRUX/nBZMgvNIpkx?=
 =?us-ascii?Q?v9YURpuynJmGDxnEot5/zozTaYvYgNPOXR4ODO4RcldaP85yQWdzQ8vQrHK2?=
 =?us-ascii?Q?Rwi4Rg7u4SwNRzfFmBXnihqurhWvekT+PJ79vdZf0Mzy0WrIXFm1zy5pUOyq?=
 =?us-ascii?Q?qqtTaVrfYuOQlSli/1jg+De1aTbuVeplJmRsbLHp9VdmK4fcsfHFwBpqivsT?=
 =?us-ascii?Q?LbseNrHm7RbQEij8EPYQQCEq0U30/P88Wfxt+f1IwVI6sRk5w2oa3b93BGA3?=
 =?us-ascii?Q?1q90Q07JQDtyzcnhLVPtkk26vY49xP7WD9xS0IdO9McPRRbHIIsZy1gQR9Mm?=
 =?us-ascii?Q?IyTt5VecpUarStNKrSWUfLb9C4AKkgroaFqkndSFghcjvwDc6b4vUSHASnhz?=
 =?us-ascii?Q?UVZ2qL4/mwTfXTbHSg94Zyie2yYNlg5GmJiyYPXBOfPsz/NP3IaJSYIAB8zj?=
 =?us-ascii?Q?hlMLmBzdWHjbcuNmTOfXYa9lZqyrXR/nz+rsK11o6uCbDSfHpVzSKC6B06KG?=
 =?us-ascii?Q?LzMXCjiN36oyQN8ZrWIwnPvHE4cuhWE0e12mYRQs8ezxFEV+XaBEAqNh5wAr?=
 =?us-ascii?Q?ma9ysUQ0fKMsusSA5RSBZserfr4kaaSAYlJKKi/n9kJAsO3RQB8AohkQtg8j?=
 =?us-ascii?Q?gytBOw59Yzovkg3+QhT0qv7OOQjiXBXypgEohrXekCLQ3DwfNp7jCwpx5UZ3?=
 =?us-ascii?Q?MT8hu3bG1ZqagEFFmSsOw3WGIBsIAQLgNhsy3Wub6eyedEUVE8usEYmzlNfj?=
 =?us-ascii?Q?95vkXEN0Fp0R/b2zJyX8UxE+hgXTtLHidRXzw2d9P7Uoykjga/F4KncVRRho?=
 =?us-ascii?Q?u6q68761e+0dGPdAuVKU2jsy8gYi9GV1Hnel/argHSXU7c8J52+wFvbo4+75?=
 =?us-ascii?Q?+0uQ7ABqZxSx+LKLegV4340uCNaD1HSwM0qbJoTx1Y/pFVYpIrc6gG8kBcS8?=
 =?us-ascii?Q?KLiHFEgnVynFR9dSremiYCJNfGqx9imPdheZ6qVlRnd5vUvz0Pa9xevwAX8W?=
 =?us-ascii?Q?9bf7RPhRMQLv80XlX/8GSeNbjtCf7mRIOJ/7eYnYORtXEUdd78ecnNxE9mNh?=
 =?us-ascii?Q?sPwtoIZF94eK4j9R+2L0cGTvKYxawTPzCy+YRIi5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ebfa18-1a92-4d5f-e732-08dcfc8109be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:30:32.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkQ8tMAWp/AqDhPzuCKWP4Q5W3hKNlsvRrD+pibbrhGxgy4j3EpgHSw7FEw+0APcAryXG/sNRPANTX46Expe6Q==
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

ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
i.MX8MP EVK base board to support video output through HDMI connectors.
Build the ITE IT6263 driver as a module.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* No change.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0fad83642034..949aa0b392c0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
-- 
2.34.1

