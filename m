Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779538C3CB7
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD2410E2BD;
	Mon, 13 May 2024 07:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KeCVmwyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EE910E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXstsC6ccLamlhO989NZ3YwIy427VU2Bs9162colSgLCpaeC2Gx8Bqz2czHiK/39+BFlSuhnEEThwm4I/jLXvMNS1d6sA+JscNJSNHos2JLv050yCs6e/GJvKGUTSscYgwOx+ym2/bMRfUnU84PFDYSsGZ/QJ8jI3Momeo8VhzSUWdATjkpSqPy4OiSJ7c5e/B276nmOfFJdiJ8EccWk5qyw3KzPrzxiJ01eYhaq+cfX2qsfFeaVyACvEDMaiv8x2uNmUIHPKIjtDJ9dadkuLF02Mo1LU3yDDGOqPe6UqBtRvNTKGmexCR7fgy7K9Y5PtzQOwSmffPh2dJHyNkXeQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CehvpRZ6SLcC8HjwubxbY4iMS7lPFJU1Mnh2vcavGA=;
 b=GgB5rZEpH4bSCR0OsEKQ/8zvxUZg2XeYcMFwTiy1LPxKRVlFwNg5aZ/uojig7TMrCy6yp1w8lEjHg8LUM5zyme21+2xqp/O/kUA0ur8ioETeskYxR7/N+MqKiVGEwUDFXRbJNAGFp+BRa5zrDbaXZC7XLBuVY/nWCBUGXHxLtZC8f13rJUnDQ8sLzA8t+U7G+cqQfMn+/WQglmSTyYthVdbTHuiCb57w2KuD3f/jnpq+D7XHcheP9x+7qmURewPdGBNmJXTWb0HpxarJceuuxSVZ6yIm+cixSHFynZNfQnq1oXGVMI+GxwUNNzb4y5eDABshmw/jv0bv3vyNs9bK+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CehvpRZ6SLcC8HjwubxbY4iMS7lPFJU1Mnh2vcavGA=;
 b=KeCVmwyECXqRTZZxr1xcdfGgBLZL6oVYFUM/o6RlG89CVnDGERKDrwRCyhXrt4oVdvgv+yceJObP54l6asWkNcFkVTiYJg2lT3glDCXDnylPq3vQks5E+jv9sPMUPaE5mwdt4pBmdBX1Fqqr5dKxQiLRJUptWZVeZpwSAI5MsUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 07:55:10 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 07:55:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, biju.das.jz@bp.renesas.com,
 aford173@gmail.com, bli@bang-olufsen.dk, robh@kernel.org,
 jani.nikula@intel.com
Subject: [PATCH] drm/bridge: adv7511: Attach next bridge without creating
 connector
Date: Mon, 13 May 2024 16:02:43 +0800
Message-Id: <20240513080243.3952292-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 714afeda-1190-4b58-4581-08dc7322030c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|52116005|366007|7416005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ivFclt3C4PIZ2+E/T3/Nf3sIVh+6oEu6qmHneJRilN2rl8AQwLajxuWftfxg?=
 =?us-ascii?Q?YYT/aSSqSSZIXzocMYQhix+tsqGVwCd9WxA2EjV8HAJe2RKXhcGJqYuort5o?=
 =?us-ascii?Q?vRT7WU+5OyFzwFRGmE/KRiaP3/IqZJLEqLp6AvP0Xy9l68XGdQ86VOXB92VT?=
 =?us-ascii?Q?UEegub/VkTi/VFbj8xekYvvocrMVot/eBHQ1rbTkEEMfK5Rb46tkfPjJIy9k?=
 =?us-ascii?Q?V2Y3w5nbMEdwhcGek+G7G4HbGoAtAsYppZsV/dWr5WnHFIiZxV8i5HmfXXud?=
 =?us-ascii?Q?lRx0QjeZZ8HUMGQ4B2E1x4Ahp1cvpSwm90tyYXpZls1139VGHRfVd+xvGxUs?=
 =?us-ascii?Q?uk4aoYrRaGMlTH9Si94Ig/LAzxVEuMMMoIT1mLj/7YcnYrE2kawY3525P6Bg?=
 =?us-ascii?Q?MLz5vepRBzFX8rPxHM2DwDgZVjzGuUlMYYdrsRfRPOk/Gr211MDAOL3cWMNS?=
 =?us-ascii?Q?pXxZhnTzFZUABE0qVEWQzf9LPLnw50RJkVIbvlLg4NxerPJxwZMnqxxNJMGt?=
 =?us-ascii?Q?H5U2kbDJBGrqyZ+G/MXutRXl8kum8qmVEPL5YUadDyZLC5MUJmHv9E6m9wgr?=
 =?us-ascii?Q?6alJ1yp2p6b5AXhokL96go/ycu5eWigmMkWLeffQn/seuPMZrN8e+WsX8TGF?=
 =?us-ascii?Q?Gbb2fY+oWVG6JniIDZjUhhyGv7Idj/ORzHpdpmjE12FFzJ+Wd9Hbzpf2cf3Z?=
 =?us-ascii?Q?l0R2W3DIsk5uYI/oXAnfcO5lOajaW+CI/eIeO36aSHNh03XaBZ2qLH79iUKV?=
 =?us-ascii?Q?dMGRwUFY7Jr///G3pMipWBvZoyG9Ov4/dt4BlLN1sVCUnFqZ18UTpfLmDPKg?=
 =?us-ascii?Q?jkllXZSCV6n2LVzc2UjI/1FYDoSWHJ8GYMHoqTrvTOpGri4+E5m0owaOl5pT?=
 =?us-ascii?Q?A7zttejKQZ0eYD3kmgwXUzCvnITFaR9gkxFgNoTlPN/vbKDI/iej9uLTqFBj?=
 =?us-ascii?Q?RWoYdvxAGQtToqJqZK7bUO/DCw0yym9mr6yUIesDJUk6XrhuUG91XuWWyu//?=
 =?us-ascii?Q?2Ztral91Qfdph+UHCilih9RlkdL2Js98aD25cpa1IprTZUmVb7rZPR+reAkh?=
 =?us-ascii?Q?ppaeWl7XvDRoBJxCYcEKc18zSpEzitNP5hJ1GN/yvYVWyrl5qgWCufHnID/E?=
 =?us-ascii?Q?VR6vXvueejh7WD3QbyxsJJudgS6GHbmI/GpwxcttJmHduqvojjZP6jl/DNyC?=
 =?us-ascii?Q?hDj4Vp0UzQSzWfMtUT78CdBeHWhVUgfdKi+JIqdzKuG8tKQyK1j2OSIi3dpb?=
 =?us-ascii?Q?Ry4HD6cSWl/FTlm/CUzUROvrduigFWaNTXth7+l3BwqGva5fBKsk7H5vD+2u?=
 =?us-ascii?Q?ikLzafxtWrIOofcEfTK77KLL/tssh/ClvZ8iwD1j829a7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(52116005)(366007)(7416005)(1800799015)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9vbjX+KB1y8vdH9wCtz0PQZVF5mTGEoLMx8SQs8QTtCVNTy8ynyFXqeAVVMF?=
 =?us-ascii?Q?tW8uhNV2jHc/pGKXQBAiH7jZ065/5jlr5DQmM02j+oHKOafhoAj7s8CUfvVG?=
 =?us-ascii?Q?qlyLPupcbFk4HqSh3hdXPNH3LpzMBkfm1bkHwqdzDmMHlEmUJ5UDQAAa9BvT?=
 =?us-ascii?Q?AG0Mh0E0g/63G1hr4mfz/ppPO8wTHTn8EfI64DNczCXb0McK0OOa4CwG9sLy?=
 =?us-ascii?Q?MFmF5FyAOq6ccQWDnHdvNd/G3q54W3+AOXWIKrwsTjv1aNWWKDXE2PnC+j5K?=
 =?us-ascii?Q?yvKaRfNU2Wp4ilil0ymp8nqcm0tDJAZGhgeRdXLdCBAiye8WaEvj6OCUyAiP?=
 =?us-ascii?Q?iT/KYH9gc37mmyIcd4RulO0qklWNgJhMnX6UYBx9QFmsadAhI2gxfl3A8iMK?=
 =?us-ascii?Q?Gd05kijgdwmNZvsvv7n3Y4ymnG54UpCRgRBgJn4qqQABMLZvIVuz7MQgUuDe?=
 =?us-ascii?Q?9xplJDMyMGkD+73BVErM6QCp6PKsZB9Mdhje9aqBCF94UDZ7VpsAHTw38J99?=
 =?us-ascii?Q?m8S6EqqkZz5H49zyx8w1qVrFxcNg2gLFv4FVXIEylgoIWvzX1fL5+Ha8JeJr?=
 =?us-ascii?Q?qSiDwG+n9HDRVld7/EFGlqSj3fSw9cxqZthlbpH2Cu+gx1S6NXypxl4FRNwX?=
 =?us-ascii?Q?8cP4IxCZCxAxf9SFsxkI/KWChf41RPqk5UN8Bzi/5R9v5s6ajPMP44Fr4sWs?=
 =?us-ascii?Q?VW6zW8vSFri2IuDr6hfIH1bZPcsWLyOG5w54H27lJbkKWU0bQcyo7MLIehPH?=
 =?us-ascii?Q?se7+xCsTZEuZem2BqQHJbZtsQw8yoNwyVO44v2zOwxiiv6eTxUrrByDpA1o9?=
 =?us-ascii?Q?RpAgcrdJ5XdcZHrLYbid2rDS85cXZZ4hjM1n15hnMHdhQvWTkn3/nKGDohee?=
 =?us-ascii?Q?QTdBKc5TFj8rJeEdIUxAYxahyYse/KFAccfne2EXqLGMHo3J7pRElqQBfZCt?=
 =?us-ascii?Q?16sepomYz9dYMOalJQ4GjJMT0yhlsW3qkyQmRoe8EnEp0EHTSWtMZvjhoI83?=
 =?us-ascii?Q?f0doDvEP6j/Nxblm+Gl3X9uQw16oAQHHHUknAbFYmT4qS6bBnigbrnMHc3zB?=
 =?us-ascii?Q?b/iuTg4FKnQQf2lJ7DFH5Bl43I+/AERk4g479jLkooH8Dk6NSvvf82NGMXeM?=
 =?us-ascii?Q?A6tLHWyYxNXXewQDxPvWV0YqEZS56L+Q8L14CsB2j7ITBBHhlC1UGKhxTIMq?=
 =?us-ascii?Q?2lD/r70lNUPRi0WZJBDjGeJ33YRdDAqzjMEHnzPZtylcwdv0JWmJq1jZeVO2?=
 =?us-ascii?Q?MTCHIIt8/kLcr9WAIEYEBCuZKNYKJOmdVbbQRRdY3iQq8ml5xjHCupcSWyha?=
 =?us-ascii?Q?4NpcaEZBmA2jRSbawOqHiWAwmWch9or240spTFg4JGdG40Ivz8igat3eR2bp?=
 =?us-ascii?Q?1HShEMHOHwa9lHMwgmnRGe27pO5KZVIV+h40axvW4OKqpq6C6gthwMaHrU4q?=
 =?us-ascii?Q?hrfFPkv/OoUqcT7NzYKFgoKpNKTJoyZRnGJ+4F5tarhXrdn8gjJr1IGk+Oxa?=
 =?us-ascii?Q?crgk4IxVQU4iUdLcwQfwWr//oKKyYfNyaCEYMNsLGFCJHVWDeShOg3Xb26fA?=
 =?us-ascii?Q?yE1fmfDDNlfftZuP1sDuOVRXH/WICzD6V0YN5ZWL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714afeda-1190-4b58-4581-08dc7322030c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 07:55:09.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKW4QlNd1iG1D/V5NyD0ACcZjvqokHsNGhD67HB8bkBDRmM1NaizEUu0hQ04v1KZaX1n8TgnGKk7tYzhHipphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149
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

The connector is created by either this ADV7511 bridge driver or
any DRM device driver/previous bridge driver, so this ADV7511
bridge driver should not let the next bridge driver create connector.

If the next bridge is a HDMI connector, the next bridge driver
would fail to attach bridge from display_connector_attach() without
the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

Add that flag to drm_bridge_attach() function call in
adv7511_bridge_attach() to fix the issue.

This fixes the issue where the HDMI connector bridge fails to attach
to the previous ADV7535 bridge on i.MX8MP EVK platform:

[    2.216442] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /hdmi-connector to encoder None-37: -22
[    2.220675] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
[    2.226262] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/i2c@30a30000/hdmi@3d to encoder None-37: -22
[    2.245204] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c00000/dsi@32e60000 to encoder None-37: -22
[    2.256445] imx-lcdif 32e80000.display-controller: error -EINVAL: Failed to attach bridge for endpoint0
[    2.265850] imx-lcdif 32e80000.display-controller: error -EINVAL: Cannot connect bridge
[    2.274009] imx-lcdif 32e80000.display-controller: probe with driver imx-lcdif failed with error -22

Fixes: 14b3cdbd0e5b ("drm/bridge: adv7511: make it honour next bridge in DT")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index dd21b81bd28f..66ccb61e2a66 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -953,7 +953,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	int ret = 0;
 
 	if (adv->next_bridge) {
-		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
+		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge,
+					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

