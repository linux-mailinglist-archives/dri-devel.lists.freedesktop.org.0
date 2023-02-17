Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488D669A5C6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC610E3F6;
	Fri, 17 Feb 2023 06:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58E710E3F6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js9ly/1aXv87mt4DrP7JMTb3pCeDhC5L9Nk9D+AKklJIJ/lk5tC+EX/HnqT7FwXa3cFbRHA2/INBWQmcg73ezhSbbPjJGAuDQEuM+sNSQyjN97VvFawUsM80PjR6Ww9zc1+De4JluMd5lxexs+Gq3nbLnFUK7iO8oY4PcgGuko0dLnV8R0r0OWWEirMp6pIiuEwaZVzKZJ1QWwpaHljb9F1MCOa9Ajfn7sUEOpWWM9LCowDSYJ8snF0d6CtK16B5R0R/wdxxKD5/oav+gyKMK1y8803eCbBulHWD8mlIjm0Y4PsmzNIXTK5CZZ1SM1BpGw5Pzh+L3RjGex2dlqCzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rm+uXIrRFRUERyeKGHyZ+IJuwEHT8DMieRjce/w6qNk=;
 b=BiTrls11YNZtkGjmz1r3fX2K5wsq3zAlX5i3RnB6QE+0JqGjyN4bfjjIHm8ZST+BEbdTV9kQHj4yofhTtLD3KlgTGxp+No4QpbJLCrwpcDIqCSIU0gAr4vNITlqHKymHJcWTgkkXPOyjJE3lnApDVI7x9/IUWZmJySyT/mL6GPeyWtDNd/OAx0yL6txFYXz2fAFxfsWNUXx1YtlXeP/EY+3w1Xe2s6GIfkhO74Ov1BszkEkuJbTeS8/XeavmhJewqE/WTS9f9sig3JUqCRADt71QPwlxWTiHsMtKYO6fN4wWh5okiiL09dkVDF3b7wEcdfWYOtbCm6MqAF5K0Dff/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rm+uXIrRFRUERyeKGHyZ+IJuwEHT8DMieRjce/w6qNk=;
 b=jUgrHHGcwOwnHx3yFNMcdyIV9Np9m0eSXtvdPd1h+TYmwOUkNrKpPadlIOHBNDqIEWKEVwg0x5CH/KxrWr1K1n3aU3MWZ8ZDdQeiKSqu9O6kc0fuXz/i/ZJI0K1tjHjlRRa/318R7aqJiWHuqyDvz2BlmMsAJsbzhIfmuzfqWl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6840.eurprd04.prod.outlook.com (2603:10a6:20b:10f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 06:53:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 06:53:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Date: Fri, 17 Feb 2023 14:54:03 +0800
Message-Id: <20230217065407.2259731-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217065407.2259731-1-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM7PR04MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ab0cf8-4f8c-4a26-a745-08db10b3a40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8d1GnZ2m5rQ35jZiIWBPcdF7F1UDb9+1sM2dpSqHNmqu2VkBpoOt8y+YGbeVYsEYqANAAzNtW9vh4A9d198Lyz6j0H0vjhgY59IMEpMaDSs1LbGbetxbEXu3joB1kgwUe6nmIOVK52J+hTmRAg6i0WTjZrIztaRp4i8aE8iNbEsulQq5rlrj2hi+r5BdDMp2N/KCosywzdcGM3yA1bnm0MyCgDBQyV+zMzTzCHGwCJ+fPeshxR0KPLG5MmgoFDmOBTS4GX9KfPqLE4S+G0KjmHCKtEdqmeTFs5IvLaMaLZu70wJk0baVxlbB55sRh4vSfrsJGHZh4mak02Aog0dTRDfA61rm2zYvVuv+2W37EW2Ijopl4bmEReXBlHlO4vE8Wwc1B0YaaawoOXPT2UzdJoZzkoHpLTs05w03LwpvgMDMsU2Gt2e6h5cXWh/VdZ4Cg+ZN2HYVrYQ2Qt+Icg+tTYCU/gjjmype/FiN5Lejx12Mruh7AaTq5jA8byQ+i3Ao/NQDu1bjRb+k7MtXIxP+XyiVxZgx8t4HK2vpEGe4ZUks1SK271WdklwNBxTRJ3KbM/Gibv9w5Cv0VJCKx563uD0DhOlODx0t2rMIX5xtR4127IiaDiQyQoTUVeCpuJr/KvaJDkbqZSLECDjcTO2tRuetUpAYJZTCIqjA9r5FvvcUYkcXvelud4cCdRZ5GuH96uh30LLoWk0bQHnWJLBdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199018)(36756003)(66946007)(4326008)(8676002)(2906002)(66476007)(66556008)(7416002)(38350700002)(38100700002)(478600001)(1076003)(6486002)(41300700001)(52116002)(316002)(6506007)(6666004)(5660300002)(86362001)(8936002)(83380400001)(26005)(186003)(2616005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vU84hCMpHpPheIzeOt+fBU7tcbW7+iZZKXfqxSHAYdVvYeDlwqrUjbdwemuO?=
 =?us-ascii?Q?cT4f5pI0J6hLze/z3qsedBT7nmTaU1xSSbzm8EJzLdAERJFEFhA9WdkQztGi?=
 =?us-ascii?Q?IPgbjoxb0j5gfzhnK8zfAmpcXzM/9r0ND/uI6dB9E0zv5UVb4J76LZKvSdJQ?=
 =?us-ascii?Q?XNAeaJyhpmIIFEBgi1ITI7nlrP/kHvxTBcu1bnblBHSyEu6EIgP5PFsuDVcn?=
 =?us-ascii?Q?A9ZAlxzXfyWF4UCq3H2/U4Ai1lVIEf4oiDYtblwOgShNO25fZ7qwcYkvb+hr?=
 =?us-ascii?Q?GHV+6uK3DzZlQHhfqCIANKcvBudFnBVItqrzslCXn9xTBF7ex1GMGzsfrNN9?=
 =?us-ascii?Q?/Pv+iDQdE13UMgkUtz1jwJSgNKTBiD2jtKgxAuor3rRB4K8fhB0LnF6FUQS8?=
 =?us-ascii?Q?pRMWPpGryOKYgxquY+ulv0X57d8uXgS/pyRRKDdDm9lkhBan9RAvjormNX7N?=
 =?us-ascii?Q?q/vk1UOjSrkNyWCKeYbc6Dy3elTGVjq3zr82R5NdG+HpIP3vgMW1WpvJ71pz?=
 =?us-ascii?Q?H9Qkh4mwdBUh1FQlPGH/I5bkwnPfJceBinxYc4w45R1CGDMPMKBIiKNQ2aR7?=
 =?us-ascii?Q?AFcvDfEMLBppuV0ukvHfD7mL79lE8dSEb0WvEuQo0zDKwTnaFmRUDXXiYJUm?=
 =?us-ascii?Q?fIEhDN2vcJqdpUBcnQzygz0WaViKAbuijrc0bZZ1FbHLKMz3pbnO9j/0qdlv?=
 =?us-ascii?Q?YgZpnjqI4ImYgawhG+XiOsFaxOJ6kopwl9sUZCVacEboV0Y73TIjV0McSMjH?=
 =?us-ascii?Q?pthr9keUVJglyLZ5oWDfRNsTaVD3aQvMK2cz2bwmpn4kHcrNlbZceF01MkGO?=
 =?us-ascii?Q?noPSdbEexnhrAKFDauI58Wi90tuqpBDivogiCHhdwT3dsWc8fMsPz6G+AVNf?=
 =?us-ascii?Q?1whQrO0kiqmeqX7ZCIFkCKIVFt+MSSTzImlxVJTPkXbvPUcYXdY4ij4/vo1L?=
 =?us-ascii?Q?jcdSgOgU87CCqteTZbDzxAGHprsYYQRmE1xUGh9UPy1trx7vMPgt1UJTF6k6?=
 =?us-ascii?Q?c5vS89CM3cLuiU8NZgDR9vfRm0/t/dxUO7DVq3WcV/u9gahYrGBhx3qpmBDP?=
 =?us-ascii?Q?8RwCrELAw7y9QwKivyh11YhpbKXDjkJYb0vMNVfF/AVBmt/CFonbeWF8yswa?=
 =?us-ascii?Q?zgAO2Ku+oeR/pF3/B6LhjVjZgYHGR8jukEpe8dlbcgboPAdP/AfokjaSpj8P?=
 =?us-ascii?Q?XFdEbxPFYYP/yZfgOZ6Pc1svveNrgrHnldsjpbnEFgNh83oDVis1YRpYxvs+?=
 =?us-ascii?Q?qWWmXOXUvcJAu52UfK5QMeh6IaGtK/VdzppsaNZ7M2Jo62uNe+JbvRqTAwoF?=
 =?us-ascii?Q?EmFnnA6CVjIthQYFp5t0m2R/mf9BGgSK21A8X9rQqeRLm+1MRvIMAcGcaGh1?=
 =?us-ascii?Q?WvQ72fu4Ohn9h7LtS01vmgmKFT5A58jRh6LMKUrglVcjfWQZFkwQCnKKKo7Y?=
 =?us-ascii?Q?Kp7qpThsFvr/mHW05JiHA11/r/Jh/h1FyqPOYhDn4xb1PPe3GLZrcB16yw6o?=
 =?us-ascii?Q?UYCi1Fi7BT2LGojCMF18Mabja8wWwruW8/phfo4MqsZnH/TJjjstW5KoVvGl?=
 =?us-ascii?Q?9x3zTm6SuTO5yCYo02VsMlr/y4X4hCMJxzC2O8fX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ab0cf8-4f8c-4a26-a745-08db10b3a40f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:53:14.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH2srvnDAfQXhA/EEGrqwXutmIevRECFy/nbIn2HG0QcFiczHIzSm9nJmRsB3pUuFBvOMfM7ULsSv0ec2nVu+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6840
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A valid bridge is already found in lcdif_attach_bridge() and set
to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
the unnecessary NULL pointer check in KMS stage.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

