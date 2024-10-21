Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA99A5ACA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC6E10E41B;
	Mon, 21 Oct 2024 06:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="A7molt7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2077.outbound.protection.outlook.com [40.107.241.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B910E41C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrWeaTrY/PO2DiBkAPMOOEiruOWhTmLlfKaElixNjd3sCB3bFejuETqlOCKGlpo1zbT33AmMRKBj5l+YqvT3vc6kZXNFtoTtR+9kn7AL9wWBVLEBOZZtjwUCheUInXC46WBrufiBhiK4ECpny0wE6ESYbAAUk0kbw9Su8ath2AVHz/hqPxg7sdu06Oop6TgOy8Ddw+u+VGgMe6eDYASfdS+m7Jo9o74KKq2wmo7FZ1yQk1vEIMlPf3M0bv6G1TVuyUQ6nJZqdJNrW4idrfm3svpBbniYU5bm1+S2jlP2e0K2B4XkbJBlhaOvv37AiUMOyALcxhOvc1DmxPKsIRp1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DM6oCeQgNkjVgjNjV0uebscUNG8h/jY71tmJ2Utz6A=;
 b=K1l7vKoYNmalc/tCr9sPD1PcGw5W0ZeMB3IgfBdMCNOW9S4yfoPIN16uSwYHCn3tN+X1mOk4VP9YdziQgp6pCbQozhEFL657J8mBEhqri2DZnA4MFBgzmnSCedBRRui7hxc6Aywo0U2rtBe/S/VpJhZ/LRI/VaP0BAyykdSlgGORgFLU76tf78y5mdMxUS0Ip8t9RGHhEltwcLhYkh88xf01pHcMiReaOJBrwIbRPK212v/+TbhMXZHS2a+DjOGj5G+B/1VhDk7UtJmc+8aoa08jbap92khTb2Dn9V63I2IvdYC2s0rQlT2jW0CJy1J/Zp+eMTQJg7JxT3AKODG1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DM6oCeQgNkjVgjNjV0uebscUNG8h/jY71tmJ2Utz6A=;
 b=A7molt7PA9BlAE4D0zEr7BfX9+aKoS9+p8oUGu0lot1r5C9uvaTrBTzfvZQzMx3n8tcP3NQhrOrsbtkbZ3Pxpp+FGIRDUaInTY/2fg8tJWxyS3gDw9ugfvCpPd+iGwk+/iRhFFUIFJkRppGTbeCKxYB1+VkaRCtMEOnAPog97F/q7zAGrNbUDVHRLdkdz2sc/NNNBBqsuCOOJMuCii0h0RpojCVCJLV+m4B3PegcBaOiGtOtb94bTa7mrEOxXqlHBHeyV4t7NqRTIC1/er73lCj67WvTGVHdnqKjGZl/gM131Gmm+aDaTLro56vjipDYXyfKz9iq+wVeN/v4HzR2Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:48:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:48:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 15/15] MAINTAINERS: Add maintainer for ITE IT6263 driver
Date: Mon, 21 Oct 2024 14:44:46 +0800
Message-Id: <20241021064446.263619-16-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d05aea2-5233-4215-538c-08dcf19c4e10
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J8Z7767AtUQ7Ca5MlwnurpMoyACX0RscxUNbYrUyC8soHiv/K0qgyObGh7Bb?=
 =?us-ascii?Q?8iqpbwHT8GxnpUFiTpBMTWYiqZc00qffkOn0+PW4j6nznITGhO8uZfCXFEvg?=
 =?us-ascii?Q?aIA9iuUVumxKjktmyAaG3d63MyZ/tlV3j3AAXkYUMNdd4T27hyPGpFYUpmGH?=
 =?us-ascii?Q?dwOfWmSElymmWs/UJ0m6/OQAvmdU+fFrScV1dR/5WvUL38sO+5BpndXBuCfs?=
 =?us-ascii?Q?Cyq3JKi2O05H1O1G2KO3gaoR5htxxIq+YSm0T0c1rT7lE+xKNv4765/kdLnd?=
 =?us-ascii?Q?K4FnnBMp6lSMRG/fF0dolc2P8EnKRXy0NzgpVYUMhpJg2JMmEhsFU3pYf1My?=
 =?us-ascii?Q?7sODaZYgh+/2ko0fmEhLElMN/4XMlD5NnRNkIV7yZmmsYIWxcElBKTtaSAGC?=
 =?us-ascii?Q?GrrOoxZgQ3sKqMUWskAn3CXSXsbe9j/Iqx+YyiYNvyqF+1p026DLdsysTqNF?=
 =?us-ascii?Q?vKVEJ0FLvh0lgjEAd2E4dSjYZ96ELKLEbs/S1Cv5YWdKbHtD2dIMGPU1cVHS?=
 =?us-ascii?Q?eeTP7iKIjUNsgvdWNfz5tODI3IAXod4PPpx7H/zUTQnye6/QwwJ6GTxLNgKr?=
 =?us-ascii?Q?lG4ODtYbyxDS0CRHaZv6J4rba5F7m2obaPOsY6lUPjvI3wq/mTgQWmlCCgL5?=
 =?us-ascii?Q?QqWHHADyxchkZdanPETDAY2VPtJCfOMKDeCnLK4fPJb3ZcwZpZFncDf/c55q?=
 =?us-ascii?Q?oKIes9rlicSWekIg67f+YHyJrMLUc8mhXwFmW1P00ybLPUhJPoYA+/LbtD5+?=
 =?us-ascii?Q?mAG2R2XqIRyM3mze0yAPt2ozBZO6m8vi25Fhwy7swGZX35ruH7ErSCAqTg89?=
 =?us-ascii?Q?GqIVserWatAz8wrq+N0grz8YrMRBlnjWAuFTs1Z/DgiAUm2j5Hfbuw/e5S4+?=
 =?us-ascii?Q?S3TK/mMGrA7JeJRgDX/YqajDF5scTiXvDZEh3os/PXRHBe3eD3XvvDmvQbqi?=
 =?us-ascii?Q?oMK0X/tkp6LbtjFiItrmO5iSH3sr8uuvafjrKI4cnHHHiPkVGBfPX93+9Z5C?=
 =?us-ascii?Q?6RhC5aqy3J+IQiABBiV2wEIj4a3ceqhRGcnJHA4lOE65j2jrEEo0tEyJUm9B?=
 =?us-ascii?Q?Yz75YA3npFU6BLI4lP2ZUvDuKGu34TUSeUu2IpPRYcPeK2ZAL0QCfiYga+32?=
 =?us-ascii?Q?fdnN7PywavRTGrCJiiz4ZV76RkSZ6yV1cZK6PWhYl9916rqIfZ3+e5cKiqaH?=
 =?us-ascii?Q?50sdPBuHo0u8QQgg9EBo+L2/oBCx2LNR6eKPuYce02OgOLTZySPaUdDADCwz?=
 =?us-ascii?Q?/tivtqBN86MViwtNaCQuHV2HMqbXF7fTgORx7RVO7826nxPSall59HSoN/7k?=
 =?us-ascii?Q?evhGXujr62rG02d2Fgzp8fCn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5SBi5Lukd8ne2i6bOn8Gbs3+BnN75wieshO51T6K9ZP1aOEWBytQfZayLar?=
 =?us-ascii?Q?/4LIDAvrcdkmsFmS7WCm9vrKxYTia8FeIzrfQUWINUERxRsQxBCLoOsMiy6z?=
 =?us-ascii?Q?KVxb8/A5oJr8USotCz2hbTXyHX1IOwNcCLQcpnTU8QcaDIJxdicfJuOU6DqP?=
 =?us-ascii?Q?99CQkU714DIrcIhEZwktKEAPx9cYrLJUN54k6Dk6dFQ5SNqy58aqJQO53Pmk?=
 =?us-ascii?Q?r2txeJBYbnYTLOXw+XY3ZpQcnMP7Y+PR8wI39hTqF8OJmjJQPvM4t2GfvpKu?=
 =?us-ascii?Q?jgmSSvkFrSAWrNZpyRyfZYsD/yAyvLphnzXUPyHK6FcEa4lN3hnBHkHJovzs?=
 =?us-ascii?Q?OKKovMZ8R9Srsw6FV0HhBqTD1CvpXxR/FUZDTcPKkQ52cd/Oaw7Udf1DR5gU?=
 =?us-ascii?Q?LHsrE9C++iFfWNXz5UIUjnBdJvh+/EAtqU0zXDDYM4CEPYYqve16Q63SSg+b?=
 =?us-ascii?Q?TX10Y9WHpBv4QGTRRGawsgb+eTEnUbP0m21OAn1Vqk57zbjsBj1PK+0fhNra?=
 =?us-ascii?Q?r+a6/nI08VKsOxwz6bF5dcj9A/OtRtwAwQ/dCKAGD8ZQHrDkg3dWXKTbwua3?=
 =?us-ascii?Q?6WkPKATrvMGFKx0G+T4SeP3wYbGhoT+I/OsaMKEqr4CRVvsOl1a9KI6Ob1RW?=
 =?us-ascii?Q?AhcyAnhdIJzKShmrYcDEWIAg3K8cTSO9m73bS3bZThYUFW/vjsWhP1J3zGdO?=
 =?us-ascii?Q?LRcb9pQPf08NybZrSUzTON32RVFX/frmdUy9ehV6mG4oXuX97FVycnm/24/y?=
 =?us-ascii?Q?UZ0HxadKN1wQOiC2sR0ViFrh5Qu9zsNUcaIjb/oyTbQT3XY3onIdB4Hk8/Sm?=
 =?us-ascii?Q?bNaAj3ctOAS7OeWQmH48S2jscxi0X/fVtdUMssoGEpbv7Qa5YOdd/RunkZO+?=
 =?us-ascii?Q?xEAgEh1jaY0P1uwRnWBqEuGhfOmvhd+juakvtKPSuRw/tIIIw21hJ/aXZc1E?=
 =?us-ascii?Q?IJ/SzADEz2qSA4EfQOiOTwKvllo23RKyis+2vQWHzEtEmynSas/98cWl4icx?=
 =?us-ascii?Q?JZBZqi/h9a7r94S5pqG4TSIYXQYfbn7GDT6KppXtASPM6LuaCe+42n1DQwC4?=
 =?us-ascii?Q?NLIKeadDL0tMh74xbsFpPJOzPmzgMxAerQY+/20eO2SIuFxOw+SNER4yol/S?=
 =?us-ascii?Q?vVHkvC1U6HGWfWlY9fiz+zXpEYDELNv7N/GF82pe/K8Fo3NjiqeY8w1S9an1?=
 =?us-ascii?Q?b6pXO/vC3CDiPw8lJGQdu9dJyLuFkgPe935UDccZLUG58G/Hou+FxcTsbJ6d?=
 =?us-ascii?Q?26j0M6fjdmgxxocVbqPo+yfaG8NKu5bFi6NqgR//I43rBikfi+jSwweZCNhX?=
 =?us-ascii?Q?zYBl0zI/Wf+s1nNrO6xTNxXjRXzXis2l+0vsYTxTqCnVU6M9WFszgAmXZGsa?=
 =?us-ascii?Q?oGUz+4Tahy5b3rrcu61NKIi9SU4UcowQTthQbBiK5txxdvuy+Yu4m4igbIcn?=
 =?us-ascii?Q?mnRzPTJ/uCu31dCBDZBJekgLFN/q12515/dItNK2NfxzkNjOK8DHwlbMLfZP?=
 =?us-ascii?Q?TJAqF0fNE8vI+tk1rssOIh/CNiu9QQ9nClGVNVwMpKLGQQkSJJgIP6Y/O2YD?=
 =?us-ascii?Q?YJQNgml1w2vyVEoLgY75xzpEoBPtzr6/t53Z8jTQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d05aea2-5233-4215-538c-08dcf19c4e10
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:48:00.9521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47K9q6cjrb14AmNBx5Fr0BrvcElKOwNlvRB/pkqNndRio2CT8IN5R9xYjcE6lDB04IS8dXP0dz2/89HgEJu4aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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
v3:
* No change.

v2:
* New patch.  (Maxime)

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a858224b59d5..615ba0e905af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12234,6 +12234,14 @@ W:	https://linuxtv.org
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

