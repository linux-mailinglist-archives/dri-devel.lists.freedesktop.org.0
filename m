Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034686F9F41
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 07:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53F710E092;
	Mon,  8 May 2023 05:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8928310E092
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 05:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3Om46VrfeyfuWOXlfjpiZi97Lk6ZDlqqk/tnB6n/YX70VkLGC+PQ59x6oyO0lAiUvgrkccLmzWhTpAfcN56W6C9z22yvvayf7hz7rDnU0ZzUz3GRFLDlqF5hJsP1fGcZYQ1Yd3+e5NqxhTMVELB80grs3TqR3IB2OwQF2pysaww/6YJyiuI2+U0jcrlC8mbc4JWbqo3O5P155EBPjmW9Og6rWb6J77t7IJY6RqZHfHL+yYttYxcx996vi0bI3V2Ea64HPrXsO9IfjgIJ4uHUTyLG/UwLAwLbOtYz0jmqKMiPvVXUqqwC/6VDMO05X7rgkGfVS30yp1UGpwuwPfNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+T2UgmWqFAqKDrhvvPSzZ+mh+ccd4yNvwL0/htpdppc=;
 b=I30wnUoTWM2QfEsFJyRVEZXiTPE2PW8B6s769OAHRbK5HmpPNx0+1GiPq+5qriE0343d4cpYy2gYI0DBFX0C4iaydUw2qhUJBFG6DGkbhd0S3KsCM8KnOf19ichhxtaTfNVWvdudg4acsP454HUgMhJ2bFgBtFFlTZ2STP9WzhCcfFTjfbJAxre4gcSyJTfopNSyJHDG1QZdTiympNPJSTGyHc+toHBRzWhf0wnqxoiHeB4EE0WizMd6AJC3bHcoa9ULyrtx8S5jtNxB1RpN3zwP7EKykiWLIi6A1N/56utyaB22wvrpLIPBEpvhTU2jYIzvzwTtXjKTVv2exksN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T2UgmWqFAqKDrhvvPSzZ+mh+ccd4yNvwL0/htpdppc=;
 b=alqcUNXSR3z1IrvypODFKOjALRZHrOD7UzdyMFj6gtGsLYsw+7qrYfMGRb0We8iCjOCw6g0kXoUFx2LZwMC8X9WEwsCK+IxR62Aq+Y4xHBq5pO+XFNixxCK2v5lglAhpHxATWIXVU3IJ6oDlrvUl+5K0MyhYZoPmcWtbn2fk0yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 05:53:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 05:53:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Date: Mon,  8 May 2023 13:57:36 +0800
Message-Id: <20230508055740.635256-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230508055740.635256-1-victor.liu@nxp.com>
References: <20230508055740.635256-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb6126b-35ba-464d-2a71-08db4f88859f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1gcnyDVqsj0S3hxFxP5qHO00z1meEGa7Wiyhs60+nTgXMaObJOJhCgODuYpZBdnd2eJuMng9Ru/YTyLkDEojPSmj34Lh+egB5CestK3KHw1LbfBhkv2c6ruIf09Os95QSEHwVh3FWF9WRNnJ5uQC6tySdNd72UlOgsjhGE+DdYHfObqVIxDFjP6AII1WgleeE1BXBPQCdfQBzjWPkn7Ybq26jDomAZLMjxyd/7RT4/HEpLHTOg8BYCPSZZjcYt59jVIV8hM84jecQI1t/K2bLMMjbcAKpqqCbLXaYYaCizfzCL4CIpLBIbCniVCEuRX2dt9kvtn6/0gNdHJ5iNz68L/KdYvwmkv7WBLlEI6a/QY64An3dvoJa8s+A7YyJ3Ir8X2TxddQzyetDZzOItHc3Fru9uEhFANnZ4O6sS+MrUHUiH8oaYRdstPv3JwCr+nLdayFUwDS1KtvlG9UEgepAfvawhfa8wyyPHY9EN6cUxyBmdm//xAZS7O26RVsFD9jKF3+ECOJ4U7ootkWp5j3K5U6Xq7aSRLByFaSv+xMXF0jA8nsWy65xxmQWkJKaMOdJafxjP6nffWflCarLY8f34FAvOprklpye6qp2we0lgRCzVBD3BKWaKDiHanPJJ4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(83380400001)(6666004)(52116002)(6486002)(478600001)(2616005)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(7416002)(36756003)(38100700002)(38350700002)(66476007)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sDY/XlUWavRNrKnsDsQPxHnGGuR6QQLAWMTcvivWxSLLDaUEUww5CBAzG0m2?=
 =?us-ascii?Q?CJTtuQ2QR1sbHFMrxDE3XIXXVKDsVjCXJ1SE9/2+d2slr/+l4hElAyWAlhJr?=
 =?us-ascii?Q?eepNwGKqi3PadvHwpGI/0BYrep6KOz/h/pn37u9XNwDWe2UGrJox7/NjF7lq?=
 =?us-ascii?Q?15amh2bx0kX3Xb/x4AKDNFO55XipKdFqnefmShdfIbnRbzxLlutF/FJXggIB?=
 =?us-ascii?Q?5onUJaAIzGwvWiC9lCDuBGu36Grh8J/ASoI/L+VngIoNP/QwKN+UUBMe1uvo?=
 =?us-ascii?Q?RzJi95yElmnXHZuvDXJpoBWVOmSupRCQ31OM1rPckvb+LxnOA2VQsLI9MQJV?=
 =?us-ascii?Q?4maoh+Hr2XEkAeVFJMpnlP/wlfcrJPuai1x6RDsB6YNloEyaS9+bZ5O7mVkQ?=
 =?us-ascii?Q?K1WmhSwQfRwzcdwnnLBBZpnQ+yU9p8Gqgl6/AWmr3St9fGir3TvWyUuF/A7w?=
 =?us-ascii?Q?tx1o9GyDT+RebkxiNGXYSANgl6RlISkzk1fBgbgVIKcVTr43UK8HUp77xyzV?=
 =?us-ascii?Q?zXDzDzpOoGpUEstC6JPPDx6CFpYNRPFfzNOqiSMWoNexZHb4HzTORdoMfwxM?=
 =?us-ascii?Q?z2pugnasmIaKWL2OL3JQYpxhemOiEGyfdDR4iJwfLWXqtPeYh5RdZzaZ1dTh?=
 =?us-ascii?Q?FHHMGM1o56AIWPlwWqgWObh4gyFWbReqv6Iru6HtLv9kL+A9CAPUjfoV3ky2?=
 =?us-ascii?Q?dEHmEChYCKfaozLyF03bPa9lXiQybtaKRqUXKfTF3dRMsF3ta5iaURmza3Sd?=
 =?us-ascii?Q?yUMdJoi30yoxh925slfxxV2sl8Xpl+Q9wybr7lebX0Phy15ZGnRsLli6VUog?=
 =?us-ascii?Q?sGg+2ymSC+Ciww0Mx1wbf03nxFCTpIgkTr94TaBRY9/+/UsWH1KU1p+mOckw?=
 =?us-ascii?Q?ypeG6gF5k+a83XuV8KaUQk24hTxwGPht4Zo+BETmxFtx8FoyuKYxnufHSAO7?=
 =?us-ascii?Q?Sp2ZgSaTdaLoydg1K1R//GRVfQV5NWRV61FXUFQReaDEXM/4jHW4aNbidTF4?=
 =?us-ascii?Q?JJLc3i/lzFpZ5AGVT1UHvHrGghkl6zcoLgdtzmJWlV8WfUL0E1V9+brtYd20?=
 =?us-ascii?Q?tUzSTv2llWY9BYZCWGnCuH0Ufe/8dV1+ZfPgqhj2kVTJM5VSFuYHWOanx+bx?=
 =?us-ascii?Q?HLto773P8UKSVIylNPO/Qbc7DbxiGnpCuVIbfI64icZ4EYEDvAs5qy3v5QqG?=
 =?us-ascii?Q?f/oo1UkNdpHsdyBu1x94MMwWJP8vVIHWA9MurUistkCnwYG7Xlxo0tb9q2R8?=
 =?us-ascii?Q?DF9kS9e5Qpu6WOJEJYnP3/vbTp347JVBe21+zdwp9ylhm7Bs/DKAuLZwOjsn?=
 =?us-ascii?Q?lZwW0s3NJc1rNsOVEFJFNXVfduLgBbtCGCz7qWICCYHo7Z7j9Lm/Ry7r19+o?=
 =?us-ascii?Q?IN9PpGWBNSv+JiIaKd4vG2eXickGGGWDTuXW5LaSGzyeUdFz8n10US0VRNUN?=
 =?us-ascii?Q?dAd5YZOzkD2Syke1dwlVTFuVJSTXWFGjd02LoZpWkOC3Gw2kkO4O7vZCEtF0?=
 =?us-ascii?Q?Rxz+jpVEuWcZVbm0+qtYYjH1pIlC/C1T4H/LGQkWNgjVxW8e9MKABxpV/pM9?=
 =?us-ascii?Q?lh1NpKUEALDPvagUu6QhH30DS/MhL9CQR89nwlUz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb6126b-35ba-464d-2a71-08db4f88859f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 05:53:18.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KG03fBWWCizHXCHZFZEIgvKTFVebqpD60LP9W/rrHyecOl00lG40gMl0ec0W59dCU1FjT5WxCHnE2wSZ7hikQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523
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
Cc: marex@denx.de, conor+dt@kernel.org, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de, LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A valid bridge is already found in lcdif_attach_bridge() and set
to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
the unnecessary NULL pointer check in KMS stage.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4->v5:
* Add Alexander's T-b tag.

v3->v4:
* Add Alexander's R-b tag.

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 33 +++++++++++--------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 262bc43b1079..e54200a9fcb9 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -394,7 +394,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
 	u32 bus_flags = 0;
 
-	if (lcdif->bridge && lcdif->bridge->timings)
+	if (lcdif->bridge->timings)
 		bus_flags = lcdif->bridge->timings->input_bus_flags;
 	else if (bridge_state)
 		bus_flags = bridge_state->input_bus_cfg.flags;
@@ -463,30 +463,21 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
 	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = lcdif->drm;
-	u32 bus_format = 0;
+	u32 bus_format;
 	dma_addr_t paddr;
 
-	/* If there is a bridge attached to the LCDIF, use its bus format */
-	if (lcdif->bridge) {
-		bridge_state =
-			drm_atomic_get_new_bridge_state(state,
-							lcdif->bridge);
-		if (!bridge_state)
-			bus_format = MEDIA_BUS_FMT_FIXED;
-		else
-			bus_format = bridge_state->input_bus_cfg.format;
-
-		if (bus_format == MEDIA_BUS_FMT_FIXED) {
-			dev_warn_once(drm->dev,
-				      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-				      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-		}
-	}
+	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif->bridge);
+	if (!bridge_state)
+		bus_format = MEDIA_BUS_FMT_FIXED;
+	else
+		bus_format = bridge_state->input_bus_cfg.format;
 
-	/* If all else fails, default to RGB888_1X24 */
-	if (!bus_format)
+	if (bus_format == MEDIA_BUS_FMT_FIXED) {
+		dev_warn_once(drm->dev,
+			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	}
 
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
-- 
2.37.1

