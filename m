Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAFA8D4370
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D9810F2DD;
	Thu, 30 May 2024 02:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="lXJD3iAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2043.outbound.protection.outlook.com [40.107.114.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8110F2DD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB7F0480Ty3MpotYWgVwK6DDRlpXKeOZ0PDv2/c+HhQuvgrpj38cTBJHDZ1TPWTWcF4JcFW9pQPc2ve7+B7lopM2XG6Efk3RMwX274tC/ITnTbxPMpoTI0u9G4w7hg3fel/QlVLZd7vZNgbqWDMbve3tYxWdGqWuy+vYN0rUuU88TslmcbviUxlS5lneEjYDXZp9vOKSG3TaDKos9X/1iCfWnemr5YMGComeK9jvIv6FTk96blphUUUPjo4qogRukhyH8geGQXInZ7ZLmOpwuhicxCOr/6gsSsJrUooldiMeWRHIXzGKj6LrEbPbkVrr2FdbqiU2r/4bzjZ+mijMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=n/dJh2LJQT/EGG+0RSEETpU3/B01Jkp8v8srZeHw8aqNcavGBZJ5QSnnuZ2iVkDn2GuJknju97/4s8psUjFVipTT4qORlGXQi4KUvGn3r5JnJ5bmQL43jsnhmd+ltlzj7I+53NFfN/64JBEhwJKOFzWsS42EZV3g2iEfXpTdUPnF2HQilg7lA8UQTlCrDSKfM0/XXL/dIDiQSJrnaYTjGPV27Nxw2fewmftiDa+rPYcgxJOHr1Ms+9dFw0M7+GAk3yswh7+ewlTxPUsaUqOZzIXCub7Y22YYt6WWMVMLVWNOJ/66jcxVt8aUqiazWB+6KgjQzkfiShvKbNCCOY7KAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsagpA/5pNrylws56rjc/fEA7kqQPMX4DxQt4ow3FTA=;
 b=lXJD3iAPv219Q3jIOHpzlTCtoJ3hY2voJ45HYN3jkwMWKEKLa9N4Jwq3AfN/5u3Wlcy7ke0EmGoDQALEn39FpxDVEttZ6rIztxjdiUJor1J7EugFG3Afbw2CbgLjBS753nVqy+cakeATFu7o8boMWHNRfHg4rAysGAjnKuVPYRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10240.jpnprd01.prod.outlook.com
 (2603:1096:400:1e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 02:06:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 02:06:35 +0000
Message-ID: <878qzsoxxx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 9/9] fbdev: omapfb: use of_graph_get_remote_port()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-staging@lists.linux.dev
In-Reply-To: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
References: <87le3soy08.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 02:06:35 +0000
X-ClientProxiedBy: TYCPR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10240:EE_
X-MS-Office365-Filtering-Correlation-Id: 010c2cb8-4815-4cf4-9f30-08dc804d2235
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|7416005|1800799015|52116005|366007|921011|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rLh75B2clWn/ViVXcd14xojT8yvQT9zmUbXumD4xwdY/wzuh+1XH+DX37zyG?=
 =?us-ascii?Q?9Uh87LOCIHyp1GhSj6uTBOfpRsdQfJgUrTNqqA04/CFePu5r2Thnus+9r7Y+?=
 =?us-ascii?Q?/PQi0k01DvCNNOw2xlu+wXy8MwRo00mbOfE30Af8dfUafJCwM8nti7Zumehq?=
 =?us-ascii?Q?GbUBXV7gOw78LpHm8rF8rM/98THKRVWR6DcpLXGK0kI1dd31Yd6bfFvGAMnu?=
 =?us-ascii?Q?K9oicu+kMiH+xZTRi6JcR5S1+T36+FL8vJ6O8JDwesWApeAY1yoytQ6bH+2S?=
 =?us-ascii?Q?jh7r1JwmHx0yuHo7xHM96z+4CNz66mtO2Zp+N79jjIatMA2hYkX/LsM+l3fk?=
 =?us-ascii?Q?0YXqeHND3G8hm90arOPQnpTZSSmDKIJoLIsyClvxwqoUuPWJOmzpV1JyiDun?=
 =?us-ascii?Q?xPhhUDaSeHfBoko5Shn/CwhC/UFZ26uAqWg+YP+laT2PsrRrIetK94nnlFa3?=
 =?us-ascii?Q?+q5HwMesSSTST/Hxe6PzV/OxD99XnMWohCLVjCectZP+xTyA6QVNjlkYEkes?=
 =?us-ascii?Q?ByvrgkEj0ZRrMHB5cZUuDFS9cJPXxkMgm9/kw1F0FvEctGsOam7rlLF//MIv?=
 =?us-ascii?Q?SoON0rC/HyUKpvwWBLJzWIp02jdBEqysSoRj/yGmFYT5vzGlQBTQFN6Lz/8R?=
 =?us-ascii?Q?+TOzYPxsqAckCZo3WqDCBqn20opDHZpY2E1k9xodsX8CeK7dt11NrxQXqsuu?=
 =?us-ascii?Q?uJeKdj7pMGiamxtRjws7jPlru+KX/6K0DymgOa3gRkCdXvya2uQfkV5o0UfI?=
 =?us-ascii?Q?9bOMgunZVkI+Y833aLx0JzSX3nZWUP3gr+umEW82I5E4TblVKtL1rlXfjSbK?=
 =?us-ascii?Q?Z1W8MrdFA+bZaOPD1ZsvJTpOW1Irs2OR+ckwyfrIFMQ2djdAUEAr9JOZtywg?=
 =?us-ascii?Q?x4nNOCfG0DgwqkVXk1y6xuXfMh6WtwRQ6+vCk7J0SFudOlF1PsUV3+Xh8ckv?=
 =?us-ascii?Q?6TB7LXe4dz7wYYXJqoSIjt5X0px69Qt7+WZU3JNB8Ty/zgQtaJxCbBTJZyrP?=
 =?us-ascii?Q?/39OfCm+QW5tH6huCkC2zKWcbnJmoTGYPBhEY5OLbbBiu43T6OB5Asoee5tr?=
 =?us-ascii?Q?U+v3j3f5A5ghvVx38mcY8qNi4WVVDw8hfeGXcyKswtjkEYBN8TXnZvn1rC97?=
 =?us-ascii?Q?4N4K4Yw0Ul2AHD1qpLb3sgdrU/58+75t4moxq9Nzpz/QpL3AQQyVrrdyiQMu?=
 =?us-ascii?Q?IW37zD6VK0KoyJSEXlEpjkU+9u1KQ9I5ty/2RxRWLyuCFeVTMzKFlDGlY3qy?=
 =?us-ascii?Q?MurSkNTDFYWf9e0aeaIAurtLdWHCChZEfYbO9I/0Kr8lT5j/WSJ1Lggslik9?=
 =?us-ascii?Q?fgDTP3DSjZGhwSVKWKPep/a3QzPefEYM63FcvGonOZ9fNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(52116005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fX3g7BwxqQdzfd9NKLRQLP37QeHA6Wvt59E86mNnvgah5kKTxdlUE/PZl6Ew?=
 =?us-ascii?Q?eHZA+geOMR/uz1wMbAzbDCZW1nPABXSDbPZLkhYO8eYR/ugmr8H+vjnrb9hE?=
 =?us-ascii?Q?EdM3XYmIZoxpArAKhHwfHcsbOMHGExQW/CCI2T4RKE8D4jCXBEVxQj24YH4C?=
 =?us-ascii?Q?0mJG3EY0m1PjExOTpNSOuJdMREn5fECODt+q+QAP4pDjPfAuX2oJVo0SmSqW?=
 =?us-ascii?Q?2a6KUDLJ+dRBKBqFzPKE0165V3SefVi7npAggOIOyhTKtLynpeRdJH73GwFM?=
 =?us-ascii?Q?pXUpH5J/c1nbeX/G/wCXDBLK4Ig7bdctmRicXbrM7uG8rKDo5ssrYF8a6TCU?=
 =?us-ascii?Q?ZLCyJCf44HQ/y2N/laQqYJA6uLSsZMA9D2VrBO+fYFqrX9yiR618CoMHl6Gm?=
 =?us-ascii?Q?yunOf4AHzYzlhuhNW9YbwO0FxHGsFZ1WkrcThxhii/4Flk/2Y/YxsX3IkDd8?=
 =?us-ascii?Q?Z44dn6Ovgqpe+ZXTTy9DAdcvNL93Ax3XHMCh751f6lAoHUdcg7YLWw2+vNz3?=
 =?us-ascii?Q?2McIwQ5pMEDI7E7hlmmUSKTK5Nx/uQ5/+b+/Z4hS84YwzR3iYWFl7oryW5WL?=
 =?us-ascii?Q?AIfaZ1LjmfGCGnLCB8nCdrX5DAZXATn6u7xJcH29xHxue3p+DzuaqSTJS+ii?=
 =?us-ascii?Q?Y6G6Q10z2t5C9imIRJtn8r2PtfppWe73ryvGMyk8jnYUAznOeUybfdFciKXl?=
 =?us-ascii?Q?E+0+6SHDAqrmIeWc5vrz9GrdW4qxYJVFCRYb+C4B8UkjopE8czw0lPENB0g5?=
 =?us-ascii?Q?kcbeSxPdABBGAkvzFztHVQXGY1sLxYw3YT9+vXYj6lP1/AbqZOL198bFbdWG?=
 =?us-ascii?Q?ng+Ddz5ctLRTBB0Jfb7TI0KkAwJrkOYtxLe34O4XP8rW5Co62HqkfMZQUOvB?=
 =?us-ascii?Q?7NNh2REfq565y2RHgAhlWn0ilxhsr3n3Pje1l76YnCZFZynLHXPdTWqubKrs?=
 =?us-ascii?Q?J13z2vTeU+D1o3eefZ6yw/IHjrDTvihvunkerX4u+j7SL59JVAa0GjkO4UOg?=
 =?us-ascii?Q?4vPvyoNk5vLMYA244gFz+jb8B9BIGxxACzh9TVI9yaG6So6JVyTq4KpgBjVD?=
 =?us-ascii?Q?dwx702FW5zrDhqGyRb13GxaIwGLfbg75sYAcQnI1iFoYYXMdn6kYW7H+41hh?=
 =?us-ascii?Q?s0CYXkq37JOozfwmxj2er9TxDNof112eBgf90Osd5Mf4NpYtdXHgHP43j3JT?=
 =?us-ascii?Q?pKmctcNV8Hk/SaFGUv6fZ/vlf4ALn8Ru8eP5zl4TT0TiRDCYHEsNRT+PRpYY?=
 =?us-ascii?Q?wcliWaAb5DFQH3nX3kQ/lYSt1wA7vjq6mCooazbuq4DHuj5nLpCPKktcW2mT?=
 =?us-ascii?Q?26xFSLL2bh/uGrcFQzUFt+UTKCYN5m8oLEai7ZBMhlU5DTvMdTR2GqiGKyA5?=
 =?us-ascii?Q?GPwJf51fzcqoU+EJCpWx9HS0wPVWVGQSEGdi0gffLml6LenEBCVisndGb5Fj?=
 =?us-ascii?Q?2WSd8AbY2cA/FSLafYpEZbtyZtzqdaERkY5rSytVT1fzphBAYDu8tLKmHJd2?=
 =?us-ascii?Q?IxPydlnSObGtPT2231cp3uP+E6jk2CQbkteop6jfy8RvFxFyfdpXtuieRtaA?=
 =?us-ascii?Q?waxggDlf8eGSOd4STwK4t96JVe0TMP//th02dih2DmjVo+3+ETtpqhFTcslL?=
 =?us-ascii?Q?9bWGqQaVGoWt7qZtgj0JSXc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 010c2cb8-4815-4cf4-9f30-08dc804d2235
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 02:06:35.5532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGYfLmdPPc3gNwbTffUbgFy+VlBKfaMviXZyGG+aBtoxTLNwg9h1jgrQNQoFVornARPOM+D2pM4XfC5Q9JsUBieUOm+2KQuGytwL0tFE7sUsFaBF/eSwRbU/iCZ0lqr8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10240
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

We already have of_graph_get_remote_port(), Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 14965a3fd05b7..4040e247e026e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -117,19 +117,6 @@ u32 dss_of_port_get_port_number(struct device_node *port)
 	return reg;
 }
 
-static struct device_node *omapdss_of_get_remote_port(const struct device_node *node)
-{
-	struct device_node *np;
-
-	np = of_graph_get_remote_endpoint(node);
-	if (!np)
-		return NULL;
-
-	np = of_get_next_parent(np);
-
-	return np;
-}
-
 struct omap_dss_device *
 omapdss_of_find_source_for_first_ep(struct device_node *node)
 {
@@ -141,7 +128,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
 	if (!ep)
 		return ERR_PTR(-EINVAL);
 
-	src_port = omapdss_of_get_remote_port(ep);
+	src_port = of_graph_get_remote_port(ep);
 	if (!src_port) {
 		of_node_put(ep);
 		return ERR_PTR(-EINVAL);
-- 
2.43.0

