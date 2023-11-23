Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB3B7F5703
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 04:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03810E083;
	Thu, 23 Nov 2023 03:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBC010E083
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 03:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJm2WcZAbhsIrnx2cnZh44RRBZWoCelkVBhsf2hF58j/UEuu5fzucM6MytRwuAHfjMXrAU8Pch6jemip1l0ilY5Mel621UU0fiuVm5AnZF6cXRZl5nXfpiGU01cGl+hGRDbykwGb7jrdPs3hCj6xr2jNTke1jMGeJTXL9KIZfROdrgbr0ERW16qDhBlaN1TvQ2NcJSM95MQr8L0JMvtE9s/r9g2M4KEspEPEcyCqptBfkvXI3I4KZy5VtSeia1JAmKW0Bn99K4yeyrbzN4gjyJoc8T0kT0WhAy+1XdAad7hYjfLRiw0ov/r4iUU6SP7dK+vdvMA1Bddj0ZVICOMMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U94BljzsURCHwN5o/XdMXIDxgiU7/vLR8YAFPUdyOo8=;
 b=PLfmfEpE1duv0vqOoLIyyj6SR5926vXN2ula7JcUA3iGJPeH9LCxCw0EyZ5uagE/HhFXQgUhUeTK8ixrxlf27qRxHZps3PNmbNl0wj39XOeTfoM0GhPsvXDJpJqTchlg3pMmyOsVe+crCVceJk+r9HWkTFfhbZZMRpttklC25/sB4whhA3/XzoAFAuE0MmCrhDTYxavSDWU7CH/6ZE8NxVdsvtJTWZlBdnoENGxnFfYUPj+uCCNdwtoPy6t0kgr3tbkmozg9vYfUVhngfgUNbxSvQpZzPR9YbcTvi3xeIuP+xbq0B66Gl6QUpXvus9XAHsJ7FOxzSygBmhFyyuz/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U94BljzsURCHwN5o/XdMXIDxgiU7/vLR8YAFPUdyOo8=;
 b=JcPnT11MtOnqbEcVQjEzt55ivnoRfAssmZpQ2enqvjN0QtGVAFho7tXRDCiH53bGCseDzy7S24S7i1MTXHmYLUUzMn85CqbKL8ahDzpGj3mFbmZuHbL/yUs73BXGokyUUQ+Pzr9tb9HBrpzelPdVkUmcdXjBjGH7L1rxSBDj7AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DBAPR04MB7429.eurprd04.prod.outlook.com (2603:10a6:10:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 03:22:01 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::710e:18a9:a6af:f2d]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::710e:18a9:a6af:f2d%5]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 03:22:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: panel: Check device dependency before managing
 device link
Date: Thu, 23 Nov 2023 11:26:15 +0800
Message-Id: <20231123032615.3760488-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|DBAPR04MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fe9da7-675b-402e-6f96-08dbebd35b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/jn+6h139bLHRbwZ2cgus5/abEqCwsbtOVRiuA8REFd41IdxtPc4MjSUTSYbmsD/vF6csxN4f6z0yvvFNDW5Fe2AQ7igUCRBmrzJQ8YtlkbH2Rzo9PDpDQpBls5G8xKF1ccRosNRYLsmHd5wDG1KCNVXySPWKTgMC4FJN0OdTQh0T3ltVpByRaRzT5T2J5ZxFkZK5WnRbi7a2InPFngijPqafNfOOKEp16vqtfCJPl5iWqUco8Ix9tPy15V9qX64zvT4wkbDpkY/PIhJj84mc42eu08DJzq2pWOjxb1si5BkY5H4uQJWbXuGS3V5MysqW1ZTgXYM/Iyv8luIvf2vfI0d1/AY7cZWlGhsyhnGpNYqFjLBLI4IVCue3Y+Soiso8jVeRFYaIlIrnYyetuDHFZJpPB5aMmBhvx+btFsHk328QKkKvOKALyB6xFS4IGfGmY9jv4wLFxcW7B8g7rKJpGKJSIE1Pe5mPP5PbpsJE+XVtc93v9copI0b1pA9rATC37gtSTWX/Mn6cLnxhHpgKhQtgYITtPaBjw/rFAvS1vwJzrnwsT6jdWCADbSUOZbrb+2golQKwOtf3asqvdLbdzt1iAXhhPejCY6V7lseqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(26005)(52116002)(6666004)(83380400001)(6506007)(2616005)(6512007)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(7416002)(6486002)(966005)(478600001)(316002)(1076003)(66476007)(66946007)(66556008)(86362001)(36756003)(38100700002)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mmKJCzHqihMxz8oc+ZMAsHRrA7P2CAqkxfcxdWS9/VKswy+MVmFO7R2J67d?=
 =?us-ascii?Q?T6xfP4vhH1rIiv7vAiDQYpYzCucHurEPkj7Y0ucN9Yj0Su2xZYsVJtfeAiPp?=
 =?us-ascii?Q?R1mP4Nq8yo6zDkQhvKsRrjHmfDTpowEgzibCvBhXOEZWn/JadF3GVwmzvx5V?=
 =?us-ascii?Q?6gel7/VrSKpLKOUkAk/jZ6dfwRno3cbbUzTSxHUL6JhXEaREfByHcvxk5yGR?=
 =?us-ascii?Q?KbsbtDAQed8HhMWaSGWTs9g+T8kFZZyxwZErgGxdjsh/IE8vHhXczhpigmay?=
 =?us-ascii?Q?sk3yHBDIhUBdJfcYjfOM1baBJQkDpdvWC9+qtopJESx2hc2LDfbc5I7yjBEm?=
 =?us-ascii?Q?4h+SEs7qf+wQavAOgdbuCsFIDma0Yu6qjIu5PO/STgsEBy1/f62AMyUaepzH?=
 =?us-ascii?Q?X9HzEVticKoTq5pgjhGtUqM0q0KrRJEXss7D1g3jZHrPlFPWGEc5vUsfCtXN?=
 =?us-ascii?Q?AZPPmYd1dPXR4sgm5gr8Opk7yv5ld2mt6AIlHOhGq0t+nNH1dZKH5Mo/KjJB?=
 =?us-ascii?Q?IWvMFjXAijtRc4NnMYissZdac1AFxWNXrtugGpEBKEv3Mc6jmtruvN9S1uxZ?=
 =?us-ascii?Q?3DdI6TkIRjba2JdcElcXBuhe8B0hjv5Q1M5s4tSoWeIU06sscWMK79Dyizax?=
 =?us-ascii?Q?DO8Vt+pHuEHvCkc/S+oaGaQCqrF7udIjvHsDr5Ji3zzNOaxaprE+DJwfAKrm?=
 =?us-ascii?Q?TeHt9Yt6EVgKwea70P1TMinR3llO30C5KL9MHOepbcpn3jCHNDxKlyVfvH6q?=
 =?us-ascii?Q?96GAjeyRQhWb+5rcQ6nsd9vrXVBNVbtNh0I24uYO5WIOH6DIJJOWPXfCT/UO?=
 =?us-ascii?Q?GgGaInfHYzxnC01UYmR+ja/Rqu0C+CCCdaarLmO5UnujWAqu3IiED/wSGujl?=
 =?us-ascii?Q?+OWNRiqYs9FGhIsHkMx7RfmZUY6j5//a2m/h8pe7vi7Ry6JmMCr9aumnFoVD?=
 =?us-ascii?Q?8YivWLUk1C540Yzzm+mA22qjKkdq4gC7H24spTZ5RDj5yvaclY/v1zQuyeIY?=
 =?us-ascii?Q?7uDyzw1YHDJdninLDzIL2N2kMY7KxDimCG42/67r9QlMDYTr8B8wONUy7B1p?=
 =?us-ascii?Q?a0NZCEtI2uWCV5qwtEOnMg+t+dGAtIHAXdkqKNWhuGLi2e8wvBAvjc+dr99w?=
 =?us-ascii?Q?qq8jVdatpySdxd+A/NxNWzSJ+PsuO2Tuo4KJ+Ta5COw1EQhIz4wRlXJsee0Y?=
 =?us-ascii?Q?DCthCvyJ4Rd9YNvQChUYLEsKk3py6dQqU8I0ueVVzuhmnzx+Fvz4sA0pqfA+?=
 =?us-ascii?Q?kw7gAidXZVCFs5A0shVeeqxdOurdqHX7+pvJBJGntxTM+OuDOSeyICNsAfpw?=
 =?us-ascii?Q?CQDuwpyf00YVnU4i176RQa8Dwf81fVBW5lbFYSaxvAZLFntkj8wwfk3I5JNd?=
 =?us-ascii?Q?8OCJXDJ1KkY0dK2tOpF337A8R76GSpwpQ6Vri8+vTKuTBmrrhrCvr+OkXHLK?=
 =?us-ascii?Q?vs3BDZD2LXYG+Nn1/qvq2pN8Fzsbsilu37hC8INuNGKZDakgYEpxa3WaB950?=
 =?us-ascii?Q?wktjUnlchVzJzimuNqzYRhvCAgoC6lvMbQGPTNyqaCu/zRKc3jOj+7ShbU6p?=
 =?us-ascii?Q?joFxo82/F607VkV26L1L8O5K6wDTZbtOPDT+TJ1V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fe9da7-675b-402e-6f96-08dbebd35b87
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 03:22:01.3904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPWRV4A92i6j9E042ULirVTl0lJraLjgZ10gA/QFpqh2vb0Vjk8gIO7gH6wpncu/2366PtAxQDFm1fPB94e+nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7429
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, ulf.hansson@linaro.org,
 rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panel devices already depend on DRM device, like the panel in
arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts, because DRM device is
the ancestor of those panel devices.  device_link_add() would fail by
returning a NULL pointer for those panel devices because of the existing
dependency.  So, check the dependency by calling device_is_dependent()
before adding or deleting device link between panel device and DRM device
so that the link is managed only for independent panel devices.

Fixes: 887878014534 ("drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Fixes: 199cf07ebd2b ("drm/bridge: panel: Add a device link between drm device and panel device")
Reported-by: Linus Walleij <linus.walleij@linaro.org>
Closes: https://lore.kernel.org/lkml/CACRpkdaGzXD6HbiX7mVUNJAJtMEPG00Pp6+nJ1P0JrfJ-ArMvQ@mail.gmail.com/T/
Tested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/panel.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e48823a4f1ed..5e8980023407 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -23,6 +23,7 @@ struct panel_bridge {
 	struct drm_panel *panel;
 	struct device_link *link;
 	u32 connector_type;
+	bool is_independent;
 };
 
 static inline struct panel_bridge *
@@ -67,12 +68,17 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm_dev = bridge->dev;
 	int ret;
 
-	panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
-					     DL_FLAG_STATELESS);
-	if (!panel_bridge->link) {
-		DRM_ERROR("Failed to add device link between %s and %s\n",
-			  dev_name(drm_dev->dev), dev_name(panel->dev));
-		return -EINVAL;
+	panel_bridge->is_independent = !device_is_dependent(drm_dev->dev,
+							    panel->dev);
+
+	if (panel_bridge->is_independent) {
+		panel_bridge->link = device_link_add(drm_dev->dev, panel->dev,
+						     DL_FLAG_STATELESS);
+		if (!panel_bridge->link) {
+			DRM_ERROR("Failed to add device link between %s and %s\n",
+				  dev_name(drm_dev->dev), dev_name(panel->dev));
+			return -EINVAL;
+		}
 	}
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
@@ -80,7 +86,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Missing encoder\n");
-		device_link_del(panel_bridge->link);
+		if (panel_bridge->is_independent)
+			device_link_del(panel_bridge->link);
 		return -ENODEV;
 	}
 
@@ -92,7 +99,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 				 panel_bridge->connector_type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
-		device_link_del(panel_bridge->link);
+		if (panel_bridge->is_independent)
+			device_link_del(panel_bridge->link);
 		return ret;
 	}
 
@@ -115,7 +123,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
-	device_link_del(panel_bridge->link);
+	if (panel_bridge->is_independent)
+		device_link_del(panel_bridge->link);
 
 	/*
 	 * Cleanup the connector if we know it was initialized.
-- 
2.37.1

