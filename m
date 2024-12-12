Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED99EDF14
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 06:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4964610E494;
	Thu, 12 Dec 2024 05:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="TXgwaO8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E77C10E494
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 05:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvyu7ZdO0tbc29QmTKy6E7ZH48IkdnEtGA4kfJkxpK3R5i3SX7o6GCtnmn0p0iq/spu++qhF0a4W5Sxy/mZis1T3FGrK+CZVxsrICe3MoF2rgqqdW+5aNuvrbChxInkA6ElQZn0WsDbTIksKVrayF7eus+61GI4g8a5LrDuMKPlviAqhz6eLU6JJRc8AipEOlt+198g91ky4z4+5vUrCHV6URkPJC/8Xpc4Gg1Ra0ozSL8nm8T3ZoYDPvAc0s7ekkyBufR/2rvHmDH7YH6BD5VtNBAnvRfVxZ4sVWHyOhx/GClwGA4XFD8TVjLYfRWhtsbG/rzgWFzqNgA1OV7IpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdbJQkcdNq51rm0+JoXwNe0a19DDmRdGxfZCPbLHGgo=;
 b=hyrCQrDeyolqqvY90jMpfutQnAtpkO3K+b7AVjzIcmU5Okw2v1NMVglHPM/OA4gYRE4/YHbpj0M9X1PiN64VJaNGbqCzr6iTyRV3qIElaa91wEut8K/MsR2ggBYoDKITVHM60ey9ppDfMDvcQHNmqY1Gpqx2ielyRVddrBtic4ah00gXaGFbNSOj/Ty4Yl4ORHOw2s/gpManVJShybtiyjPM7BZKnQpUGckRCubZGXe7dB69xfhUpam6hXOyqTDeCRqHe11Z3EqfLpzQhutzbTAukfrlAAqe1bFex5iWR5M7MSjsxbErTRDb2fpkSiPI08parBmptjvMsvEQlFnBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdbJQkcdNq51rm0+JoXwNe0a19DDmRdGxfZCPbLHGgo=;
 b=TXgwaO8Cauc+QWucI0Q5Swk4MaUJj33gxIMyAWZppizgHQWJ/WQOAFQx/U2Snx7EAk+RRmkUkm0T6TLnih5mnjvjUiKqtuaugbvldU8MGSPrY/h93wGGm3ACUOxfwud4tQBtPxhWt86I9tUAPnzL/KPtnFZAZ48XNn3/SwKxxXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BL3PR04MB8172.namprd04.prod.outlook.com (2603:10b6:208:34b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 05:51:44 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 05:51:44 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@google.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/bridge:anx7625: Update HDCP status at atomic_enable()
Date: Thu, 12 Dec 2024 13:51:10 +0800
Message-Id: <20241212055110.1862487-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0026.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::7)
 To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR04MB6739:EE_|BL3PR04MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2a5691-11bb-4f8e-b6b5-08dd1a710ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7AJCdc/SLJV7GsPakstCQpWH3MuIJpdj7c/sc93Br4RnKLWo/eg/NDdhNmbY?=
 =?us-ascii?Q?wi+bF1zJV5Zh8ZoxBOVYIJsOmHdgTqP/VjucaKL014+dAIuQN3AlQf2BV58o?=
 =?us-ascii?Q?IsGItMEx6O/De+lIUWZWpTwLGc+nMYsFklJyjUy5WLnBVZHzaRvK6k4JPXwp?=
 =?us-ascii?Q?dsKkLywJ7uKkjvCEKtrzGfxw9sVbW4lfYgahBaxEH6teXWlisseo9uQKC3ed?=
 =?us-ascii?Q?swKr+IwU62B+6GR7g/saWqCxl3ub48LgSDywDEPdwkpaFEBFZ2MI7Fh+ME2c?=
 =?us-ascii?Q?6zacuJTSI/4HGiYliLgh3F+dr5Ggyh1CS0hDpJlGZVG4aYaw33SVmsSugKW7?=
 =?us-ascii?Q?v8jFrzd3Q7rjnbrhvxoLfNXVHz24GKPVkFR/hKm/GkZ0f8qi+Bj8hDU8gDjK?=
 =?us-ascii?Q?qgU61FR9EQeexuNAwdfSbuo977cPtcVeJF3YdhHoEy4B5y7bi8HIDNuzap+P?=
 =?us-ascii?Q?2/ANvs2cX7Q1oXwYl0l68DzcEBei7Go90fknPTtmCwCMRz6EygVl0yXeUo8X?=
 =?us-ascii?Q?ZRuigRXRcC+9C9uQ53NnxQoIQu3ijmcAifmA8Loi0kH24iDuOaaiqyp+kX77?=
 =?us-ascii?Q?njZAb1yY+BsJfkZFdYTRp2gvorggpzUOPu+enZCcbr7zqYsP70G1MBR6s60C?=
 =?us-ascii?Q?38GJkMOqoWnJ9uvjrcMNAn09sySD5G0ewgnIlbvkuhlmYVrOmgF3DdhopQWf?=
 =?us-ascii?Q?JbPVuT0p/2qLju+bjO1PeLAJtBNJwakD7KGkSvwJkXSX2FXoc2T0u76C0TEy?=
 =?us-ascii?Q?MQNQG/KsMhpgKtWbuVyseBLmI5tJFAxrXXtAnr4ZTOlAkCG73h6AOPYctH/0?=
 =?us-ascii?Q?wP42vNioyhtr9zjSG1XozWuW2gxlWaNWIyW2Pp8LRNSJeZFkdKly3ThRM9qd?=
 =?us-ascii?Q?t64oxoCoDI4kOCZRXRkiJaMcEwSQ6EBnQt7ouX1Dk8uKPYDCAXlalW3YWxKP?=
 =?us-ascii?Q?MeD/n+sbNXBttwylViMK5HR0rO0Cd9vfQ+tuYSHzRuckPxfFRHlNJpiZ64/M?=
 =?us-ascii?Q?Vf1tsO1h9tQRhAswwbxPjeKB7/oOazMf6aXl+4041oA3Ruxd/nWr/BVPoxKX?=
 =?us-ascii?Q?vF98i3u87QXv8tDyfclsSYJNtRvkEnpFWtA7GH2mewZg87lLNZLBEj3I9xYc?=
 =?us-ascii?Q?bNlQZbGb5VEfLeKl2PsGBHtjg47WrAbS+N65191kwk+/Nn3YJqFvLiCH/NPo?=
 =?us-ascii?Q?dmONCfFJUj41YqMRHTf3zovbhsHCekwtehaCCjoVTTCa2IdW2RNckIEy+p9H?=
 =?us-ascii?Q?qfCQAVtk4QrU7SatiIitgM+qpkC9Kp72PLDqCvCZyWs5tKyd1LGmfROoLszR?=
 =?us-ascii?Q?oAnSW8dDFbVcq5h/xfbrvrU+V/DSuteCJrmvy645whw3X6QsjaYt1t2svcAI?=
 =?us-ascii?Q?J6Mzh+8yjGsw1hQBL2swibDB+hkE8rirzw5Ib4NoA7OHf36TJd8ggAvir2qR?=
 =?us-ascii?Q?IXncp/jr34M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnqm0ErxDxa85s5dob1lIT3ieAObnv0crxzuL66f8LGegbOfWXCbCdtNojKi?=
 =?us-ascii?Q?lQHdgjUZeIepLrKowCbWgNz0zpbFR/wTKoerLmGcEu7ScaSxcRc3piXeIqCf?=
 =?us-ascii?Q?Vwscux9BV3FDIhYyVg0QM0TUpZFrHja0KhqKFe9aupTtKHuUT/qdpm2PZNGO?=
 =?us-ascii?Q?2+gsNRVvZPz/C8pItNCrT3sgA/KaBPfFj6B4KHj/HEGsoe6SeiZfAigZVTkq?=
 =?us-ascii?Q?ssFl/m5pKi9tglzXRu4Wxsr614gLZiQ4do0Z7zxHwBJxMlWzPhUQri44Uh5k?=
 =?us-ascii?Q?IvCelynUdJa/kS9EAuUuqKFnrThzyX4IQYriAOD29AyCxdm2BKmhgGUIGKYL?=
 =?us-ascii?Q?kuia3BOIeJJxEDOPjX5otH/Xj3LYA1u13NxcrNKw9fAEU9fyRf6UX1mg0LRu?=
 =?us-ascii?Q?nRges6woe79RlFcPg9ZOpoK4VKkccF0JLk+TAWNu9fOotWJ0GRkZvGUrxHG6?=
 =?us-ascii?Q?MD5BjKex112PLsuGvwYGrkqCLtzVlBjqQHo2vkJzkB/tqW65AgBmBdrdILx9?=
 =?us-ascii?Q?TxexMzZ1o/myNgd2+OHnIv9qYEHvdjeVGRG+bDthnUYCNnMARg79IZcv7om5?=
 =?us-ascii?Q?x/mxOxGo9EOSS2mJWA9x3Quqtxz1dljJj1PpODba0HMv+vwvNnSaogF89QLb?=
 =?us-ascii?Q?BXy5bdrKLbI1U3UJVr6Nd182zV2T0FJWhFUeF09bYgkWuRNpAfKuEEKiP2Ko?=
 =?us-ascii?Q?55nxiiajg3BmIJ6Ip5V6s8s5QNragMbmfdUlHF9pkVgLNZ1tfFT5NoNZf5lZ?=
 =?us-ascii?Q?VdDYlZGGC/GJ3UtRzYV8DjeCssxa7LiIZb12nZWA/ohePP5BDK6YZfslZiDC?=
 =?us-ascii?Q?Sn5IKZz8bK9RHblUYFHbwQGyX2nglXatUuIo6sKAF5/neCAiy7zugbKJTCXt?=
 =?us-ascii?Q?tGvnqt4LOuwBauXh2TK623Ul/uqPaSl36caJxGSXFIuWE5KiknT+Be2RGbXi?=
 =?us-ascii?Q?rF3xL3fR6TZcgP5en1wTIv0FjZ3AL38WSeXA6AFy61xDLx4ck+wMeF7tyLVz?=
 =?us-ascii?Q?3ARjVgKvrBBPkQZu2mN6piz21zpNWDtuR4tTvQssrwxZBw70JobDS0QIAyma?=
 =?us-ascii?Q?7k6E5yM3cxaW5marsdNM5k2f9AlbDkpykF/ukOlR8zoviCH7EFK5aVHYHJ8+?=
 =?us-ascii?Q?5Bw1dR5vXW2VzkaPCpHtdUW0sfrOMUYdu4RxCNRELmyoDgh/xQ8Kj0PlRGDb?=
 =?us-ascii?Q?EFyZGn1AEm6SDGovNs4RaOHxJfedg+NjfdPMdPhxKoglHdwpS44VT8cik7/Y?=
 =?us-ascii?Q?I4opA7VBkZryJjtSTM59/+A9Cpk/puHgIJi3cE+EMHU6oNWAnCZgaPvTIJMf?=
 =?us-ascii?Q?8UmKame8MzV0SLetHev7oZmY3mMY9ID0oFTfdNqGO9wU06RqlxY1JNd48Nnu?=
 =?us-ascii?Q?fpiblO/7sjasWTQshmc7zN1mJj6kq78PyFSG3umIGklFucPO+N3MPzyVLbAh?=
 =?us-ascii?Q?dajanbCZzO8+uLA2OtEA8lUDRpONJszEId3ltaH0Oqe+txWXjdWjTKsthhGG?=
 =?us-ascii?Q?ZHHFMgscxNw/DQIlcFq8jK9A3Mfuv4PFjJYmDYNcWMMJ55cCT2tnGLrkbOu3?=
 =?us-ascii?Q?YmWh7LKWoEJNBf2zoFAZ69Y8fwS/tTLDFSntKfdY?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2a5691-11bb-4f8e-b6b5-08dd1a710ede
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 05:51:44.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Spi2z0YdJcnbjxvYMHbxmHxgz3McxqSH8wRKPKrHTQ6nXB5Zc3wY3Ij03P0occ1fxXPQVAm11gx+SfS+hDCEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8172
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

When user enabled HDCP feature, userspace will set HDCP content
to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
support HDCP feature.

However once HDCP content turn to DRM_MODE_CONTENT_PROTECTION_ENABLED
userspace will not update the HDCP content to
DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.

So, anx7625 driver move hdcp content value checking from bridge
interface .atomic_check() to .atomic_enable(), then update hdcp content
according from currently HDCP status. And also disabled HDCP in bridge
interface .atomic_disable().

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 74 ++++++++++++++---------
 1 file changed, 46 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe4..f96ce5665e8d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data *ctx)
 				 TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
 }
 
+static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data *ctx)
+{
+	struct device *dev = ctx->dev;
+
+	if (!ctx->connector)
+		return;
+
+	anx7625_hdcp_disable(ctx);
+
+	ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+	drm_hdcp_update_content_protection(ctx->connector,
+					   ctx->hdcp_cp);
+
+	dev_dbg(dev, "update CP to UNDESIRE\n");
+}
+
 static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 {
 	u8 bcap;
@@ -2149,34 +2165,6 @@ static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
 	if (cp == ctx->hdcp_cp)
 		return 0;
 
-	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
-		if (ctx->dp_en) {
-			dev_dbg(dev, "enable HDCP\n");
-			anx7625_hdcp_enable(ctx);
-
-			queue_delayed_work(ctx->hdcp_workqueue,
-					   &ctx->hdcp_work,
-					   msecs_to_jiffies(2000));
-		}
-	}
-
-	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-			dev_err(dev, "current CP is not ENABLED\n");
-			return -EINVAL;
-		}
-		anx7625_hdcp_disable(ctx);
-		ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
-		drm_hdcp_update_content_protection(ctx->connector,
-						   ctx->hdcp_cp);
-		dev_dbg(dev, "update CP to UNDESIRE\n");
-	}
-
-	if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
-		dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -2425,6 +2413,8 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
 	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	int cp;
 
 	dev_dbg(dev, "drm atomic enable\n");
 
@@ -2439,6 +2429,32 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 	_anx7625_hpd_polling(ctx, 5000 * 100);
 
 	anx7625_dp_start(ctx);
+
+	conn_state = drm_atomic_get_new_connector_state(state->base.state, connector);
+
+	if (WARN_ON(!conn_state))
+		return;
+
+	cp = conn_state->content_protection;
+	if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (ctx->dp_en) {
+			dev_dbg(dev, "enable HDCP\n");
+			anx7625_hdcp_enable(ctx);
+
+			queue_delayed_work(ctx->hdcp_workqueue,
+					   &ctx->hdcp_work,
+					   msecs_to_jiffies(2000));
+		}
+	}
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+			dev_err(dev, "current CP is not ENABLED\n");
+			return;
+		}
+
+		anx7625_hdcp_disable_and_update_cp(ctx);
+	}
 }
 
 static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -2449,6 +2465,8 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	dev_dbg(dev, "drm atomic disable\n");
 
+	anx7625_hdcp_disable_and_update_cp(ctx);
+
 	ctx->connector = NULL;
 	anx7625_dp_stop(ctx);
 
-- 
2.25.1

