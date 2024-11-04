Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A276E9BAB51
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C7110E362;
	Mon,  4 Nov 2024 03:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DBJ6qr7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A3310E362
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xY+eH9CTRjcEvmJb6kA95Asb4sAO1yQIZsGCSwD/U0gIuDJCmWbmhWuK38EgfmzlVDLl/CPkicBcIJVQ2MkY4LOfuqZL3/Yo+ssDknI2Bt+Xg9y0A2A13re7FOsVRx62NS7tnM/cX5i4j1fis9yZd2CQZUwOcNzV3iX3nMnekOrMEKnAn4WJjLNuNqIMSzufK+rAEsxx4bHGBBP2xVcvPxtoecpyAeROcZNoaqHiaIjBVdV8RlAtzicBsVyJcUze60qoWX5HW8Psu0aHR7VeGwpw9pQ1aAtb2bPwtGYKDLiuk07505LDSWz4xjebTQ5XYPQplR8ho0rjxU/2eAyi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL0mXb0RyUjCaD9mY1QBYGt4lvdZd3+bt8lh5XEh3j0=;
 b=XKHA4DPRz7FLhuso4xIvvC0A3sNF5C3zXd6s7HGAoaFuDUTg5V1MQKWpW0y2llzvcECUVtFDX84PuHd35BdOsBXA6zJcC5KCMQtVcxk/h7O0h5t+rzg+Wy58pq0mxsqzCMjLSv0I6wLr6Xv4NDl00kp4DK+T/o8KIvW2okU3htU04aKyW87jQpFGp6JoQdr18JoQABBfGmzRYb5Wx+j+oKGjfoQzVqP9b6qU67gLJ4T6zH8fl2frPFX5qy7rzatpUU2/vQEvBk0OxLmz7+ORYBtuBrdxRGvWOH9Ko8ItENGaaitA5t0J40yEtlC7iw9rjHA2WsfSZc0LKYAARi1KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL0mXb0RyUjCaD9mY1QBYGt4lvdZd3+bt8lh5XEh3j0=;
 b=DBJ6qr7y1HaNiTYbdygyQ+vB4oZ7ka/bTcQR+qXZuUmUYh2XxBrBWydkjG3bNXImCmw/BeDxnk0yrqlwiH2hK+o6Xby8bP4P8PYXSdmKsPAhtQ70nBmFeOTZ7IU4QmuAMpBvekBTVuHUySpmN2x0cSvw2vDJs5BEujBeQDKNNx+QK+1sKtG464HYcDEgmpjFXiQGu3jaXXmtex8qqoUgP4EVdilupnOF5N0hCGt1mvs21mDVWI1BIYztNgm6uaAe2i57znKNd9ZLMO5SZ5M+/9p/ThYztqXm+SswGUnavGBuh5vwEngzNQxd8BcBSWKPaZ5lKkrB0J3dG3I5hbGcHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:29:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:29:17 +0000
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
Subject: [PATCH v5 05/13] drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,
 SPWG} LVDS data mappings
Date: Mon,  4 Nov 2024 11:27:58 +0800
Message-Id: <20241104032806.611890-6-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 64ef8586-0fbb-421e-40dd-08dcfc80dcc6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DtHfB3m34MVaZSH86xEwIcE2S23D07wK0t0Y/R3C9uXk5Ms/9UvEnDe7RgyF?=
 =?us-ascii?Q?ewvd0AQ/j2uyjjhcnlSPc1VZlUxNLtwstxaZHpRzFwRDoawgDML0rFMa/7aE?=
 =?us-ascii?Q?XpCs6ArMZ6nMU/qnjVS3xWDp0FALCmVoufclkP7TNFY7Pbh0KIVmOb8a1O2c?=
 =?us-ascii?Q?XlnAJZ0pIqi9rCgfJrkq5iih0plLi2fVpaV8Bi0pQOh9n3014l7/jyN5lqwk?=
 =?us-ascii?Q?71utYrHFapXn1QZWkIKJIQoWgBJ5hqf6w9YEY2Hf71gVbqElDGLF5zfdjaLL?=
 =?us-ascii?Q?0A0KhCZwwXw5cTbya1u63JegwFEfSdN966iNGZbyPmP5gqXNXiNVOBqPJ2ot?=
 =?us-ascii?Q?cy85ljXKkmG5/p+PDnFjK1tu3oO+d+HDH7oDqzyNVYMzO69E2tqplR3BehAM?=
 =?us-ascii?Q?CEpnil9jvtjrl79ouX3dbdufwhjGOEqrLjsvxz+Zp7983XYa6B0MRYVmVeH5?=
 =?us-ascii?Q?cGCyq87YknEOuhB7GEuwn7Onv0fKjEU/g53Oba1EUOOayYuyTxlw1DyBhVj7?=
 =?us-ascii?Q?HfkzIcHjl46JCcUrCImnzTzI+yv9iGbv5/AfnHLjTreixp4MyOG6nTuOhbui?=
 =?us-ascii?Q?KNIh2j2T34Prd7wch09uHSFyD+wIGsHpd9t+IGVC/VtFLqT2yI7UdJ3E0q5Y?=
 =?us-ascii?Q?uOa+P+XJSeFipRjzq5ExOoZz9G9zOKGEbP9qL3AgquHrgWhjSkEMYGiwXmmx?=
 =?us-ascii?Q?qcb0nQtUYerkge+TKbIPJMv3e7848lOYm3TBKQ7SjS8fK8fz8FpdG3fTsxvZ?=
 =?us-ascii?Q?F3aCcfiQe+HWO1zoFUP5gAW2Gsfth0c5xFMlME+DZXJxaTlsdst1umCNAExf?=
 =?us-ascii?Q?3EaEowLG06l2k6wXw7QGXs86d0IUKIgw2g9ysOAdOM+RS70pG1wa+HZOKTxZ?=
 =?us-ascii?Q?P4R2hmS4YvV0+2AJpBmeomry9DyOsbAMSbRrxO8TbVMM1Hea59JHrHY0yb/k?=
 =?us-ascii?Q?ePEiymKDZKi2HHP1vv5YtxFIs72Tu1n44VhA+NdCi3idDKQ26P1QNRVnOlkN?=
 =?us-ascii?Q?sFOHCTr3tKopIFOXMQuDZzEAqsa4S2jRGCPatClyRjjGyPtE0ebv3oTumvDF?=
 =?us-ascii?Q?THDg3B+3HK7dlOtsdEgo1vDVXN89kBG/231MC7o3SWw0xmj54OZSZsXjoEbs?=
 =?us-ascii?Q?sBvKYXUAIM+N+em0vv1t17VY37Pzso1YAsZTTTVnLG8eKv1r9luX4v+SiPi7?=
 =?us-ascii?Q?SJkU7WRD7rEXfggc9F64WNiewjKj2vyI9f1W9sy2aEnjMpLVJ3vXDBwu1vmu?=
 =?us-ascii?Q?Vew3Mj5VxKPyM0UASiXZOGXh4j6xtTQ4nTbFRre2CgonajO/lR+2Yia4iKEs?=
 =?us-ascii?Q?JeAQmly64tYYjYufoTUkZ4Ej9CejDU3mGBTsiLjy5XU71LUOyhRFjUVVcie/?=
 =?us-ascii?Q?dtzdbcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+nz46/KhMKHCJPVYBm84Q2USbpnKFMa/vGU1F2Ik8oOU1/07BdWQv2gD0vpe?=
 =?us-ascii?Q?KAuaAJqEgwyDnQHPxjxS5wcz/6wYsQ8k5nEy9d4OkzanyvcDQkJns+lXom4p?=
 =?us-ascii?Q?KMgh7qgx/VRJyN6XbR+4dxmVo3lGyZ6BjXRl72Nq73OiyMD5LaC8QXJ4iyym?=
 =?us-ascii?Q?EYdsZHbmQzR6QQBLXAbkwpmoqiBWc8f9jaNIyf5ZkFUN5uJe/BZzHgkRi3hq?=
 =?us-ascii?Q?2OTZDrC/bnp+n/1SJUqKdMQglVo5CKetp4lyLgT7KI+UlXnRbbF4v7dj4A+m?=
 =?us-ascii?Q?/O/Zr1C35mNbmRmcp9nBnF2g7udkvMlIJ9rPG2viTdGvjzQkfVrSk4rXvSFQ?=
 =?us-ascii?Q?/pqLsZXq5Xakcrjq8JCv+CA61UPYGnGl6IYzMy9vy24birhunYx1HPlSetj0?=
 =?us-ascii?Q?a9PY4ehGUf/VtDet6VzCJxmUJLkaorFTUgEtqURNad9d1zwz+8wzVWa6Fb5j?=
 =?us-ascii?Q?VV9fBvH4omo35JEbrmzNt2QqREtLl/y8qUhxVgq/s2q2MTcPtMS4MlsuErAz?=
 =?us-ascii?Q?ZJNGy2MldkXkYZK4Xla4hNsGYwvdbX4LYd7ZZK7eTL0JOthrAvGweM5Qsab+?=
 =?us-ascii?Q?39qg0HL8wkDHAgvXK8PC30Gtx0dz1KGhfbURsJK5CnUqz8EwvYrzP46GXaPS?=
 =?us-ascii?Q?90GWidiR9FXSdOYwXDmuIUAO7t3qkJt9HX6UPh9neBwlQHdq4YH7/DeNilhn?=
 =?us-ascii?Q?fsocDk93FkBC933fxLFq1w89TjlMAE//M7j8NAHc7wOyl/3CKEHvHsx+tgrF?=
 =?us-ascii?Q?3G5OdS49QN4Od27JDTRJkAF14/Bt/HVNk9mlPhoJkt8JbEHhihJs+iibBsPS?=
 =?us-ascii?Q?O2XCy7YhAhd1FS+pvuIx6SElUnTR03Jz+yVTPNNooWclkUz6NbbJH1WL6pi5?=
 =?us-ascii?Q?PcDQJEFmXRo4pJiKBZZJh3Pe4qQBT9MqSxDR4PfhUPRPNjJb+diJ0XA4OxbA?=
 =?us-ascii?Q?lNC3YUXi2LyZjEd2XA/XDts+jbstK8FNAGotCaYNHxIsleb+P79RjITsMCet?=
 =?us-ascii?Q?vD5B5ooMypkASjHiYWWi5KIYGovOYKOkMpYN/OwN9EM5PiuQIajqPsskHOjf?=
 =?us-ascii?Q?s9JVId8IKV3VIRb8DWwh0UOsOXfpBfAdYCNl5K9eMxojSHSMCPM6hEFDhbo/?=
 =?us-ascii?Q?lMz2t2jRKqwMu12hkrx18oJ73jODzbE4v5A0nE610B7ctAkzcb88UU42Bf+v?=
 =?us-ascii?Q?OOv/OM8KFWZoDAJkRha49VW62PcnaIL3mN8/5uRXbRC5YhkHMmR1PgFRrvWW?=
 =?us-ascii?Q?RW2CIgXs192DnRpbb/o3vS3xersuqprMcm6yMDLhQYDZKWNtA35mg1ZEBMkV?=
 =?us-ascii?Q?uPzoyDzRaycz+Bwx2lyOEAoPLtoyMhbOHPScGxc0QeEBcYrASq2EImNMuzNN?=
 =?us-ascii?Q?1xo6NeILQGNFlhONZvpqJ+TE/C/vSWUSswa6s0WYDKycx1KxTsuK28GSbcI8?=
 =?us-ascii?Q?NBjRKr2/q1L7VziCb16Yvz9uHyclJdlv+3TDrTc9IwISCxEeuCV1mGJE6XQH?=
 =?us-ascii?Q?lSzM0LMSi9VLMkaIstUgH//5sUTVTztpxHSsxeI9Buw7LkSYcyd8XfZmoQ+G?=
 =?us-ascii?Q?rFyn+FKUVOJ3i+2FutN3ym+mVf0QA9o/k6v9J/J2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ef8586-0fbb-421e-40dd-08dcfc80dcc6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:29:17.2486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDvq1XXfaZKvx2V/3OKpLZGYHKy2x6OBd2XVqGOYn8iUA0nIiJ/tHkn0tSQLkJJY9khTXUXbZMi8VuGOZR6V6Q==
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

Add MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} support in
drm_of_lvds_get_data_mapping() function implementation so that function
callers may get the two LVDS data mappings.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
* No change.

v4:
* Collect Dmitry's R-b tag.

v3:
* New patch.

 drivers/gpu/drm/drm_of.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..89863a35c731 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -410,7 +410,9 @@ EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
  * Return:
  * * MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - data-mapping is "jeida-18"
  * * MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA - data-mapping is "jeida-24"
+ * * MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA - data-mapping is "jeida-30"
  * * MEDIA_BUS_FMT_RGB888_1X7X4_SPWG - data-mapping is "vesa-24"
+ * * MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG - data-mapping is "vesa-30"
  * * -EINVAL - the "data-mapping" property is unsupported
  * * -ENODEV - the "data-mapping" property is missing
  */
@@ -427,8 +429,12 @@ int drm_of_lvds_get_data_mapping(const struct device_node *port)
 		return MEDIA_BUS_FMT_RGB666_1X7X3_SPWG;
 	if (!strcmp(mapping, "jeida-24"))
 		return MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+	if (!strcmp(mapping, "jeida-30"))
+		return MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA;
 	if (!strcmp(mapping, "vesa-24"))
 		return MEDIA_BUS_FMT_RGB888_1X7X4_SPWG;
+	if (!strcmp(mapping, "vesa-30"))
+		return MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG;
 
 	return -EINVAL;
 }
-- 
2.34.1

