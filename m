Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7963D6FDA91
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 11:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E91510E46B;
	Wed, 10 May 2023 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83FC10E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjJZB99Vt7n+0IteqvpCHSimNYGihm9CTcElvqz1wlHss+pnxizHsaNDkMel5Vrd7CYZ8LULqP1ptJ3PKPqOpnV6UlUuzRQ6hS7ikfBf/DBfs4+yKwEYRDfNQrjKkTrDa3RWaOzORh8/XHRvn8jlH4WjeLQOCXHI0c08BIoCXNs9uvK+gD1U1kM5cBNM2rxKlJ4FzaYrTJ8ijchBa7ZU/4RQporUe1BUEoZ7lAxC1jOuawkpX/ZSVRLe+X0hcbUumum1aXcvzHsITR5I6gWu6yOmuo2enxSfzImkrt4RXBkD2c740C34dZ36XKo2kQlvQXH+1w/+Y0I5PZjqYd4L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nc0cV36qpOug9d0/gysCL8DoRLyFFfwr6JT3sNylq4=;
 b=JFHKDE0JoDm41hwdYCwGXcXlN9o1amRsNgECq97ptuFz34blNnNmA91AxX2FaX70M6fPq0/fxkJOGH+EoQyHyGWTs8hzIgC/WyavYvYvx+jc8ioRChLpf9lzjlxDHU7mx7PBBrp244j6poxgdwPyzGXgtzeDezPFrsODZIFcD2qS2yOhvFSb9w4SIJNK+7GleZuYq2wPtRvDKsNhD4odz/gw0ZfMSOO8X+7qrGN83pUiH+ASfZgqO40PyA7YWmtQsoyZRs+evFTIrVIn1OEM/WOPo0W21c+RyiPIxkTEkqDfhm3hvo2Glzv9MSUdjknbWuBVw1rqLooYE4rO9GCdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nc0cV36qpOug9d0/gysCL8DoRLyFFfwr6JT3sNylq4=;
 b=VbQ8enALcO4AWTYsaWfq2dxYSsnOmDhrufAtio+QzqsZO9ro9dzKiqTn28H+A4BLI7vqifnBnBYxeflWzf3TJTlzQysY+OwkPAirUQWipQhwnckeQ2sw9X1uZfrRXhVKZHM/Y63jLO8q4A5ecXja88zsO9y+s8mkC6rEhGMt1CY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7711.eurprd04.prod.outlook.com (2603:10a6:102:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Wed, 10 May
 2023 09:20:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::60e3:2297:61f1:4d1d%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:20:51 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Wed, 10 May 2023 17:24:47 +0800
Message-Id: <20230510092450.4024730-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230510092450.4024730-1-victor.liu@nxp.com>
References: <20230510092450.4024730-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1a6b99-fb08-424e-c5b8-08db5137d93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDCG5UMJWrp+VFByHTwhgyzMtq/9iS9kfLjwdC/bl4mdK35KDTv7Q6CPkSoWS0FtYsaJ7rgs6yeXJwyajFRuu/QWktD0fWOqXjA1UBemI5wM43uaVbO0lzyP8LqW/u75vKgLwB9j5T1jVWFRBsQAfJr412R4dbR55g8cMx9zdWPrQGhUTYTfdngYC0+zeEx8WdEc88airfvEQyuGFRNLeoIcANRubz8UBnllu4FY6wbsqFkwAOzof0zUWAetyysP3LSGxyLNEmCWMBHgrG2PSnAA7ExIqWLHzhx2H7uAeOjnD8nVlkE1B8kI57v5XAU7RtTxuS2XHnA4zJ+QdSYpjjfD794QI31Kce5iHvoZaTIjNWkqnHy8gTrLfFkZyyB4YLBnsTKCan5yEzSJaFD4lYR/kaDzptkvVy1VRD4MEFhbhcEq8kmjm71ozmaB+WKIMPIHG5s9r5x91DX3juAIK0yoWLqmhbFt0YxBcdPP46r5985I/o91sw3VQZYh6DTxVZAb7LlLG07KaRyA3mK/30bJ2FCS24Of0SB+LVzvEJvXHS2OykpuhfRNlET09d6zEPQlSFW3PGER9uI9aBNin9lVMjLj0P4YhNQvbgv58h2tr1mgP8qIn85txvaMgTJH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(4326008)(316002)(83380400001)(52116002)(36756003)(5660300002)(2906002)(41300700001)(66476007)(66556008)(86362001)(66946007)(6486002)(6666004)(1076003)(26005)(6512007)(6506007)(38100700002)(38350700002)(2616005)(8936002)(8676002)(186003)(7416002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xUPFy0Wl8fNRN3DQzptxw4WA9mqbmrDktGpFP2OaPBcz0oYH44psXEaEQT1n?=
 =?us-ascii?Q?BEGA9OO/KZ4rJ7kvhD7JKKQrj36EixZx+5jVvBzSqoXywyhmKQWKXcZRgeyN?=
 =?us-ascii?Q?DQXB8UMs/qtsxlawy+p1zLq2OODGrHbccOMOBbfUNT3Uyb5NlK51Nn7eOARW?=
 =?us-ascii?Q?QNvSyQNNtitbQPSNboV/w0cnlJ4DNd5jkotZ5EVCFz2pdd6MQ7ZjlR2uRgzN?=
 =?us-ascii?Q?9Ali5aCbOi4mCLPexhbbYHf4sVooEarmOgGNWM146WphZwEZ7MbZFS2As2Vm?=
 =?us-ascii?Q?iI9xFUjHjPzLy46fWd8uTFcJJGwV1W/BT2hv1Tb+KPZ4t8pbClzQRurZDxRE?=
 =?us-ascii?Q?lBq4pyU6VCVAfeqtb5b4p/C0NhDxWxyM1Ys6VbUIepBhU5ZuMB8Mxd5FiK+w?=
 =?us-ascii?Q?A3U3npXn4K5lmIjKUKZQCDSqPRQiMbEPCGOGGRz2tF+eCGYb20pJWtfPa+Va?=
 =?us-ascii?Q?WlFtG9unqRyqjD12pKAaEGh/LO4SmfmV24UNwupFgEtuwUi2zI5fLNWG95St?=
 =?us-ascii?Q?fkdtsFeLKKv8VGzYLDNWPTqtQEnHzmSl0Ui4HBZtArUfLjynekwpkQ5bBD1n?=
 =?us-ascii?Q?d0HIGg7NIbuARdvTHWYNlAic5TB9u+I9IZKxrRVYrPK2Y6FFvX2855j23XG+?=
 =?us-ascii?Q?xwmtrB7dalHStR7/fj942rHUNWV3Phr3phTAldEJa93ckrfE/y8zEq1NxWdr?=
 =?us-ascii?Q?0jr6ulZk3TS2xbkZW1jGjr+/2CXtPUvvrF4Z/SisNNzUjzHQNTxfYX9Qpluq?=
 =?us-ascii?Q?TsFKjBzjUIhI+ydqrfU4sW7acSxAiQy4CT6YUjJm4aKMK5FugGL60HVjYuFs?=
 =?us-ascii?Q?wcX5d8jSqqwDG7auxvkZoj28FnpSECNjx9xm0Dx/gsFpabsuZmYqaPx7DvjZ?=
 =?us-ascii?Q?Sw4VyIDcfCOQrNVRhpR3+M1qUSqkNlIzidXDkczI9T+wCiJi3yYzCYhj1Ngz?=
 =?us-ascii?Q?RTKZKSaZO45Y5t3bkPAqIy5KdV/sia+yDkpTwrh1Ybd9gLVpVmXObIkiRbEa?=
 =?us-ascii?Q?/ubdUiwPL1S6utZtaYJIRfp4BW/z95o8hMwylBuu/WVgwd+rmAvFkEEVc+lB?=
 =?us-ascii?Q?jOn5JKV0clDUHj/IahIlIB8vXi7EUIiGSHh2toum6/VZW5g/W30R24vgNxwm?=
 =?us-ascii?Q?dmbsLwmPhCqKl8t3YC+8W+tcUS4g1ILQvivh3BUwZMbsmRPPWz32zoMIulRH?=
 =?us-ascii?Q?bQ3tKciAQGVMtVcH0JKXcUb8+VRFAmX+o8qT+OpS4ieNXHl0F61sJijrzAB5?=
 =?us-ascii?Q?zTYBIgUXLeFhrmlvyPKDcyKENokDLT7glh8lyYJXufZu6+9Uk+nRnXY0d9N1?=
 =?us-ascii?Q?DjTqFnnSkyn9nOMUc96VBwMO1cBrkng2s1fBJ6Ydwg8xqZouJiGWG8cy7mgC?=
 =?us-ascii?Q?sleCzwiNVx3MXxN79GpnIvgj+stC+9wpA6m6ICNFvIbOl6h/k/Xn/OgJ+dj9?=
 =?us-ascii?Q?1EGpbXOqrGLwmCkR2vPLMu0v1PGoMSTqJ0/n8HF+8HteUAr1aoVuWegtZ/4M?=
 =?us-ascii?Q?jh0VDBYWh2cffLFEaVVoLspArg2u/LFQeS1KuiZerv+pfHfQzgrtPRhUgVLy?=
 =?us-ascii?Q?p8i/fhC2VBmcg1G5XOUkpR2saUyyTpCL4dxLqZCg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1a6b99-fb08-424e-c5b8-08db5137d93e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:20:51.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlxGYN5GQHqfz9dB9kmqhrLQLNOxiMMBs6K51mhlKttkG7Pfhrg3QvNdEZlm45dNW4fCBeCmy2Hk4IDLw/n6HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7711
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

Instead of determining LCDIF output bus format and bus flags in
->atomic_enable(), do that in ->atomic_check().  This is a
preparation for the upcoming patch to check consistent bus format
and bus flags across all first downstream bridges in ->atomic_check().
New lcdif_crtc_state structure is introduced to cache bus format
and bus flags states in ->atomic_check() so that they can be read
in ->atomic_enable().

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Add Marek's R-b tag.
* A slight change brought from the update in patch 2/6 to keep default
  MEDIA_BUS_FMT_RGB888_1X24 bus format.

v4->v5:
* Add Alexander's R-b and T-b tags.

v3->v4:
* Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state'. (Alexander)
* Simplify lcdif_crtc_reset() by calling lcdif_crtc_atomic_destroy_state().
  (Alexander)
* Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state(). (Alexander)

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 140 ++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index ba00a155d9b6..fab2253e4786 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -30,6 +30,18 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
 
+struct lcdif_crtc_state {
+	struct drm_crtc_state	base;	/* always be the first member */
+	u32			bus_format;
+	u32			bus_flags;
+};
+
+static inline struct lcdif_crtc_state *
+to_lcdif_crtc_state(struct drm_crtc_state *s)
+{
+	return container_of(s, struct lcdif_crtc_state, base);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -385,48 +397,75 @@ static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
 	readl(lcdif->base + LCDC_V8_CTRL);
 }
 
-static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
-				     struct drm_plane_state *plane_state,
-				     struct drm_bridge_state *bridge_state,
-				     const u32 bus_format)
+static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
+				     struct drm_plane_state *plane_state)
 {
-	struct drm_device *drm = lcdif->crtc.dev;
-	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	u32 bus_flags = 0;
-
-	if (lcdif->bridge->timings)
-		bus_flags = lcdif->bridge->timings->input_bus_flags;
-	else if (bridge_state)
-		bus_flags = bridge_state->input_bus_cfg.flags;
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
+	struct drm_device *drm = crtc_state->crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
 			     (int)(clk_get_rate(lcdif->clk) / 1000));
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
-			     bus_flags);
+			     lcdif_crtc_state->bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
 	/* Mandatory eLCDIF reset as per the Reference Manual */
 	lcdif_reset_block(lcdif);
 
-	lcdif_set_formats(lcdif, plane_state, bus_format);
+	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state->bus_format);
 
-	lcdif_set_mode(lcdif, bus_flags);
+	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
 }
 
 static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
+	struct drm_device *drm = crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge = lcdif->bridge;
+	int ret;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
 		return -EINVAL;
 
-	return drm_atomic_add_affected_planes(state, crtc);
+	ret = drm_atomic_add_affected_planes(state, crtc);
+	if (ret)
+		return ret;
+
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (!bridge_state)
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
+	else
+		lcdif_crtc_state->bus_format = bridge_state->input_bus_cfg.format;
+
+	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
+		dev_warn_once(drm->dev,
+			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	} else if (!lcdif_crtc_state->bus_format) {
+		/* If all else fails, default to RGB888_1X24 */
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	}
+
+	if (bridge->timings)
+		lcdif_crtc_state->bus_flags = bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		lcdif_crtc_state->bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		lcdif_crtc_state->bus_flags = 0;
+
+	return 0;
 }
 
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -458,35 +497,18 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct drm_crtc_state *new_cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = lcdif->drm;
-	u32 bus_format;
 	dma_addr_t paddr;
 
-	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif->bridge);
-	if (!bridge_state)
-		bus_format = MEDIA_BUS_FMT_FIXED;
-	else
-		bus_format = bridge_state->input_bus_cfg.format;
-
-	if (bus_format == MEDIA_BUS_FMT_FIXED) {
-		dev_warn_once(drm->dev,
-			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	} else if (!bus_format) {
-		/* If all else fails, default to RGB888_1X24 */
-		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	}
-
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
 	pm_runtime_get_sync(drm->dev);
 
-	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, bus_format);
+	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
@@ -523,6 +545,48 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_lcdif_crtc_state(state));
+}
+
+static void lcdif_crtc_reset(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *state;
+
+	if (crtc->state)
+		lcdif_crtc_atomic_destroy_state(crtc, crtc->state);
+
+	crtc->state = NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
+static struct drm_crtc_state *
+lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *old = to_lcdif_crtc_state(crtc->state);
+	struct lcdif_crtc_state *new;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new->base);
+
+	new->bus_format = old->bus_format;
+	new->bus_flags = old->bus_flags;
+
+	return &new->base;
+}
+
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
@@ -551,12 +615,12 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
 };
 
 static const struct drm_crtc_funcs lcdif_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = lcdif_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = lcdif_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = lcdif_crtc_atomic_destroy_state,
 	.enable_vblank = lcdif_crtc_enable_vblank,
 	.disable_vblank = lcdif_crtc_disable_vblank,
 };
-- 
2.37.1

