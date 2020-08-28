Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C681625664D
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3633C6EC02;
	Sat, 29 Aug 2020 09:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462406E499
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 11:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaeOkWV3HBGSemGBU4OF2P8UQ6LNb3TZl7kPWGsAOXlE+Iw7mF1UEzdb+hPOpKHmzrdLztJ3jTkeM7bUMDBjNO/wHETBKlIxXm7WfhPPH/beq2woCHqs2p6Bu2MgLCBnCGKgxLtQ34lWaSjXW5uN1/DSWJ5G0/z/7L/oD7ljGdKVJTRP0dhPnzgz1VpstwrV51lOe1K33ODlkUVT/yMsrBn9/cZmf2pCgGwAKE+AsnUhNeuBOUNCcOBTpEHVA00uvnYtK9d7caOhyuCH/a25Rzq5JZ6gsFSF85dL2b+PsXM3uhqWix8VytptbsQIq2tQSLlub78lGV0kZkdlihTFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j2jHNb5ybmUDL4W9WSbHzK04tvMPDMeF0F/UHpidvs=;
 b=hT6qztRk0Sp63HPR0KW7Cg+LVUEoQjmvKtdqQsfLvn6+klY4bNvhSPGmeEuKnFJl5DWg4sXMQzHUG339eaXf9zVxjgIb4EBQ+WCZ9Vz0k70WtP+6ctfg0i5aZwqfokzX5wzIWffEqDEWixV85xJKQVpx1Bl7JrsGAHpF6WEm+UgCyDrNsmnyQDcDHrP36ZdjeK38voJLszedwRWjDfmNg+tGrizBjQrnOxpK9SvGic/mglyDH0Zm5MPBH/TKNgmzwuqkmArXK2LTEwYA3AmcnCYXB8BAc5Z680HNnjejIQHtC7bedr0q7kAySZnVHRf3dwDdpNq2BouwO8suN2wU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j2jHNb5ybmUDL4W9WSbHzK04tvMPDMeF0F/UHpidvs=;
 b=ML/2y5095mjmIT8Gz9yu6mNr0t7E5XrZkkNzBtbd/nFua6ERw9sfyN85HxL1MdgoakOlNfMctmeveuQdJLhcgZ4ppO8zeL0GdEw8SPMAYfo9CXvJiJ355wu0kfLG6SjZDSp/m9oFM58oBOFBqD9+c9TPvkZ+MsfP0XxGx9H0unI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com (2603:10a6:4:39::7)
 by DBAPR04MB7413.eurprd04.prod.outlook.com (2603:10a6:10:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Fri, 28 Aug
 2020 11:13:49 +0000
Received: from DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334]) by DB6PR0401MB2598.eurprd04.prod.outlook.com
 ([fe80::19ed:520c:8c98:e334%4]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:13:49 +0000
From: "Robert Chiras (OSS)" <robert.chiras@oss.nxp.com>
To: Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Fabio Estevam <festevam@gmail.com>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 5/5] drm/bridge: nwl-dsi: add support for DCSS
Date: Fri, 28 Aug 2020 14:13:32 +0300
Message-Id: <1598613212-1113-6-git-send-email-robert.chiras@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
References: <1598613212-1113-1-git-send-email-robert.chiras@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To DB6PR0401MB2598.eurprd04.prod.outlook.com
 (2603:10a6:4:39::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-120.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3348.7 via Frontend Transport; Fri, 28 Aug 2020 11:13:48 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b6f51a58-732f-47c0-56cb-08d84b437042
X-MS-TrafficTypeDiagnostic: DBAPR04MB7413:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB741314FB0E04AE75D6C3DD57A2520@DBAPR04MB7413.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: azTVCz0w8cX5L98998aUl4vY8PsI72f4WnratAx/QNLTW+2CaCf2ohJndvWPd+3WPuI27uNUcHOSdvhR70dz7VoLkcEl817GxM7AI1mqE6JdU7he35ggk69ElApiLTGlCQBb1C+OQpAOV59M+LJOFlugfEgwGQB1mQNEFrKRiTDV2iYdKdPWSaFXBaMP4fzzUCpP2m/WabEHR+tImGRmWs6QlfKk2Gvukb50I+wPr895OK6VubFijsdqfpmGMCJhY3L3eghiDfqLyTR6uQ1ZSpr+WyOevoWx9d82ro/sftHYBDDXM/p3lDvxTgjkp8VT6LbF0r5pGBweOoxUDK7mOS/UjfWSadURRG+qUskgUSm942Kh5Xr40gdcad2Syt8f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2598.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(16526019)(52116002)(86362001)(26005)(316002)(8676002)(6486002)(66556008)(8936002)(2616005)(54906003)(66946007)(6512007)(6506007)(186003)(478600001)(66476007)(7416002)(110136005)(2906002)(83380400001)(6666004)(5660300002)(956004)(4326008)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6Nk7G/QYUYZRMuiO3Ms6aOmx6+j7raiAUkKe1xovzOisfLXDiQI5qb8PjiHJPvaSznh5nzjALcS5KXfn4Fmc+ssLOcyv6OBhpGMRtCmNZw8swt2FIojpDjqo+hDpCGXGZpfNFitplUXJ9snLsgk3oT84DDwm8uwubhfNTxsXnUXHx5xgNzZMm1qVZFIKf0tvdvPHHPvR/fomRyF5AFOyGvYaKQi2GzMFfsW1lzsTI6Wc2789G2z2nV02J152vPmUpJ9JlnVIiE0g5TjilBz5+Y6jH3YLjOu5/f2KUI2HjcDld+9CyOmQoQ8Wjfxiv19Gg+vsD0pibHEcnIySMw80BoBMkHgfH5Tp2zvk6igsQIkUwDJeKdNIy2H1ZuoEG68QWq9J6xP3WE13jzzeZzn5xXwVZbUvWhLgwsicm5wgjdkBDLMEgRZc5ylodhCUzcXAfFL0DPaCdgyS9Juxj9aHN5r73wv8A14zmytPkw30ONdopf5Q1ut1osmc3W6M2v6pkQYF2Gg5D6fNJkjuU4Nkm/HHyryl9sQJtSMxbIR+4i85nFXEsvh2TkBE3dR2N/XE8L9gRr1Vmtb90VB63kJdId97PBiZTL7UuLBBb/+/HCjWRlqyscHuausxZR0DCmDAkpFJ0uhjRKj2uzN8SOHOiQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f51a58-732f-47c0-56cb-08d84b437042
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0401MB2598.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:13:49.2932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ai3lYNtFs1F5dUM0q0vWh62aH5vu+d5ODgaIbPaLf4Q3bgdHEN29wue6QB4XB+Jyqwy9v3JrYvtJzr25DDPd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7413
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

DCSS needs active low VSYNC and HSYNC. Also, move the input selection in
the probe function, as this will not change at runtime.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index ac4aa0a..c30f7a8 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -143,6 +143,7 @@ struct nwl_dsi {
 	struct nwl_dsi_transfer *xfer;
 	struct list_head valid_modes;
 	u32 clk_drop_lvl;
+	bool use_dcss;
 };
 
 static const struct regmap_config nwl_dsi_regmap_config = {
@@ -1036,16 +1037,16 @@ static int nwl_dsi_get_dphy_params(struct nwl_dsi *dsi,
 
 static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
 				      const struct drm_display_mode *mode,
-				      struct drm_display_mode *adjusted_mode)
+				      struct drm_display_mode *adjusted)
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct mode_config *config;
 	unsigned long pll_rate;
 
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Fixup mode:\n");
-	drm_mode_debug_printmodeline(adjusted_mode);
+	drm_mode_debug_printmodeline(adjusted);
 
-	config = nwl_dsi_mode_probe(dsi, adjusted_mode);
+	config = nwl_dsi_mode_probe(dsi, adjusted);
 	if (!config)
 		return false;
 
@@ -1067,12 +1068,16 @@ static bool nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
 	}
 	/* Update the crtc_clock to be used by display controller */
 	if (config->crtc_clock)
-		adjusted_mode->crtc_clock = config->crtc_clock / 1000;
+		adjusted->crtc_clock = config->crtc_clock / 1000;
 
-
-	/* At least LCDIF + NWL needs active high sync */
-	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	if (!dsi->use_dcss) {
+		/* At least LCDIF + NWL needs active high sync */
+		adjusted->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+		adjusted->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	} else {
+		adjusted->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+		adjusted->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	}
 
 	return true;
 }
@@ -1400,6 +1405,9 @@ static int nwl_dsi_select_input(struct nwl_dsi *dsi)
 		DRM_DEV_ERROR(dsi->dev, "Failed to select input: %d\n", ret);
 
 	of_node_put(remote);
+
+	dsi->use_dcss = use_dcss;
+
 	return ret;
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
