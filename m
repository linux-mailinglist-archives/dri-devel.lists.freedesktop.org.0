Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB267AA6D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE5210E726;
	Wed, 25 Jan 2023 06:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776710E725
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahUWC4iM9wXk1DZ4c4GTqBHijMPoe/K51PrEW5LJZf2zdcaBKNWtY0Xs2tPhQgK8z+7GOtyvtOwxG480zoaUiMKhiudtyt1TgLj34FvdMP6h1HIWFCPp/wy34Toww9zT8NuYyvDN406pAEI8vHJ3OXZI4og0VdW29Y18B35j6D6PL+/l+2GLjRWK6O+wj8qdTdEx7W/EU4eTgF2O4/Kirnb93clIq78695ML1/mp/v0YqTTwHg7KGjDDL8ADtaORNxhkwTk5P/TCsuegKOIE4aoJMpNtZxuiEkpqTWKDPykK4j5fRvCstYjnnOryD+hamPRX5iR9YHU0ri+nOqh1DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U0gbmUoC4+W5rjQLnYtTRF9r98eDVl9pbLgOQspI00=;
 b=ehmu3DReYW2Qrr2JmaR0jbP5YcZ2ghyP4+TAKL3UpExhqbBqwDcSkVWBfxUySB9rrtB3LOuxxukPNdupSvKdX/moNdV2UeCdGTwJcXib7vntQmzlf64SarXujzTLXv7qUErxOIuRd7kBqAXR80OslJ2OiXXe4LTPUOd/BF4yfloJfmJusmZLexyjDPyP/t6EOySoR/BSHV+xCa6hhei0IlS6jRha1vV3YEmOQP+fZTCqmf4wCWks313OpRDywUZmFBoJhUIcTrDV2VlhhGdHFQxMTtpHJ73F1x+0YPhPw3nnJxiKzcB28Xx0gl/+QDTQidHE0DdOzQbwrI+Xg0Mbqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U0gbmUoC4+W5rjQLnYtTRF9r98eDVl9pbLgOQspI00=;
 b=cYyDVcB4qXpc4PgBqagPKu2BYoHezPAW08fwxDOaXi+7gXkSNRPOPhCch+KB0EQRQA1JpbMTJhBILu4BSbkICudVVZzQX6K8y5t1ptTKG3cplgVAwkXaitVo97Qi1k6YQgy157u1ExiVq+CH/sUDbExhmwc0qcEBSwJyFefg9ZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/6] drm: lcdif: Drop unnecessary NULL pointer check on
 lcdif->bridge
Date: Wed, 25 Jan 2023 14:40:26 +0800
Message-Id: <20230125064030.1222121-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230125064030.1222121-1-victor.liu@nxp.com>
References: <20230125064030.1222121-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: ebda579c-04e8-474f-eada-08dafe9ee9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LLth+mLn7crIGRpH/l3k13SIwmzeNDHiMOac6OlG3ZBgznT0FaxDeYKr/1mjK2bnZ+w/92kSe4jvuaxNFav9QMuijeREu5wWk5pX2in9B6QlutnpzehzJoexpoEBNohmmT+5n19mK+VAN/NM5if1Wr98TxQ+dq5WUyMKulSWUxrejzCf8If1wUXOK0iID1pdoi1/Dsa0qxPTqDelyEKVXw0d90IitSzvedE3apazNy0dm6x/YSRE81uO8M5wUyr4rWO9HeNucrgcY+D4EX9Q0Jo17x2Seu5qDDu7790OYrOPacY0MgMmDA/nf79o66QRTgtkcM0eVy4cPbj5e4bhNcRPHUo//2N99xbg/fqbiu8WMh158T1rey7VcpQyoawNYHzJ/M2GgLtU9kgobFINfoIcjKxS4Ml3RNr6sCf2YLlmePQ817hIvrE3W+EaW9dADVW70jUrOvL5JourU+KxksgldcXoGPNqD4tzZhZBua2rVwa+cX9tOWiACeabK74V8SffzzB+q/7f68xK1g3pUO93cBuTk5+ap/XvBC6vIfcuOaZtRnTXWvquvUh+OHvOMq42elUJ7+Tt9LIlRmQQE67VvqrjdJY69ZYboPbQQcz+vbsGoFJJ1I03BOk+HdBOjrey8ygtoaJ5OCBgUk2aRs5rbr8OJ/ukEEGinrBIJc2/LnEvXw+NhlL8hndxeeUU3oCSdWVFJWAckz0MKKRgxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(6666004)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbOZTeP5OTaLqLek23Ejj8VlXtMnboI21oZ+PsBanW1wrqZiLjntyZJfffYv?=
 =?us-ascii?Q?2VppWvXW+A1xu3daOx218CjNdr22vGrYy1o8PHgX0H+/P7p1Y7LdJtMQsloY?=
 =?us-ascii?Q?C5ZgFgiyEZUJBHsVLtong/lAX6Ksay6dNFVepk3lBOcwkSAlZMVooNyrCIbL?=
 =?us-ascii?Q?n2SYrrSjNw3THYQEmondKdRqWCMJz/Y4Pz+z/xAqGzMTdqbEf+pXAfoLJgq0?=
 =?us-ascii?Q?JDdGark2+WVrPbWEloK9AzDPj/lw27isWZgnV3wpN+5QPpYjAvYapk+HV2ZG?=
 =?us-ascii?Q?oi2wYtzGA9wN2fhb6vkl1rdMX5irW508ZbI/+SuOOVCwrJSbvfT2wliRtzsn?=
 =?us-ascii?Q?UMKV++6mdqzTEadORqDTXRUdKIqwZPexCB5pcIUPqGtH7ffPDSrGs4yiLjIa?=
 =?us-ascii?Q?aSkXLYCzz05IXmh/Ty7qniCPcD3auhuDWHpXX3kK1IhsCBXKuTdC6P24LqyK?=
 =?us-ascii?Q?1T5IaAvWrFA9w3dq1lLUKJREnapWCSAWD0svEzSzTjTw15KXuGIO9JxWHVm4?=
 =?us-ascii?Q?XEarC4+sRbOYkStbXbafpFp/FElQtsqhwTb2n22e44Tv1QnOitf2PTyhiQwl?=
 =?us-ascii?Q?pI5GwGMW+9r89gIm/0uAoOu6TtyD6F+EtWyou9jjHyhQgNLSWHViG0cg6xPe?=
 =?us-ascii?Q?q+Sc7W5mOJTSQTrdFHNpqs4GsEtwXOTmUCUsdNi4oe4pFrudW6l+hU1vnVaa?=
 =?us-ascii?Q?rFox+m7Oxnop2vu0HOmxpMxUEbkpiFsBjxiEH5NilbyB/rzFlUM4GaB9eozy?=
 =?us-ascii?Q?Ik5h49ZernnROPVDE1KuKjZNRZOcFuYUxAPdoLOArQI19pcsyBwB3BzRIYEC?=
 =?us-ascii?Q?UaayxGHRzhUUqQtpvBcY+LhMGQFIezdYrq3QsfOdRiKt3JZLDj4HK3lC4L4n?=
 =?us-ascii?Q?MN5vbt5gYtRzWA1Gah9PYLhs1533yVWX0txT1/ip9N8+op/1xpRTQR8/dpgm?=
 =?us-ascii?Q?UCc3wIrFewstnc5CBZuClkbPdFpewoCHQnSpt28iUtv/hIT866QXzV6XNBcZ?=
 =?us-ascii?Q?k/JEzW1EEQ4DmVmlizYgNhJO6TvSyBqkl8b4PhyyLCdNbJ+mr8cmkcAB53ps?=
 =?us-ascii?Q?7L+NnSykgeyTTor/6GO6oK0XW9W8aFfN6TiDBkGqhFn1ytzBCSwvOIXz2qNu?=
 =?us-ascii?Q?T7wFiYRz9WYXe1IQNIC3L8HEoTz4SM0xpOLGeK3RbvbeRyw7tcXAp2kinSxU?=
 =?us-ascii?Q?tMF01u3oJ9MQAi+J40b2p2KGFoscC8VRpCqcK7A2GPG0kprBYsR9ukMHbVLy?=
 =?us-ascii?Q?ZQ+6BzfTBfcHNfq1cLik1uUjUR0EPpT90QUteiIcY2awPMyulmFTO6UlU0XR?=
 =?us-ascii?Q?+a4HS85IR+rWRIugxfaAFVv6SOhbllblXnQ+JI1MJWRJYFDvNXyvlpj5BW1c?=
 =?us-ascii?Q?MnM0V+fbLALq2b2NYUcWDAX/aImG70Mtq56sUMQPm/l3wotfD6Aoj4pgB3EZ?=
 =?us-ascii?Q?5vTxGBovqubzUnrXu6ejKHPToQlBsFlLEFOpAWCg0oiv1l8nQmVfsCl/KqtF?=
 =?us-ascii?Q?1lOIc8QJ0U4yOE2V+TWNuK0SXsEeFDpKrupZ+d0vhogS7HGBkQX6xSQl0MlI?=
 =?us-ascii?Q?PQGpdfPtoHQ3kFWhY9cXYLnXdGRN1NnXfGxDHNDF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebda579c-04e8-474f-eada-08dafe9ee9a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:30.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BUyxYH44GP/L/YjQtnziTMfepEx1jcGERWJ1NHP4N1KE1ed2hs+Np5ddSqAIfk2wYcWPNH8p4mbUo7mInZLY0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
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
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A valid bridge is already found in lcdif_attach_bridge() and set
to lcdif->bridge, so lcdif->bridge cannot be a NULL pointer. Drop
the unnecessary NULL pointer check in KMS stage.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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

