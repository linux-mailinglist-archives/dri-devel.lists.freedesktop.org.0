Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F413817ACB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584010E39A;
	Mon, 18 Dec 2023 19:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F4610E392
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926929; x=1734462929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gAuxvxpZNby/nD/WwNhshNTVTgcfNR7TyfNbdg9IQig=;
 b=B/PWZh+KbUucNS2QTz6WfGoAW0U1jE9GuuQ7+CRw3g73e9ipwXTPKVP+
 NUC/124XqtKFAoqQVVeF/g5vPjEi8I0xy6bXVQjTmAeJuDQmz/SvyNWnH
 gZ+PyyQ62Sz8dXZmKeAN/1YXSeBhdzXYY+Z2h6QW6GoVRUHUlVNdQWtid
 edR4fBvYGJRxCgkD9mvFhQcij0/S+PrclR/Gug+uQreDdxh0LTsY93nhM
 fvDYUtl8TbCuPNhMjzdh8qf54J0dUadnFquj2Y92Uyh2FDJSt2CvxiX5B
 nDnd8laycMuzV+5JU9l0bJpvkSXvT4jcKBGL+bunFVAeU5O/z3Z1RnkXF A==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559831"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:21 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1E73E280075;
 Mon, 18 Dec 2023 11:57:21 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/6] drm/bridge: imx: imx8qxp-ldb: Use dev_err_probe
Date: Mon, 18 Dec 2023 11:57:14 +0100
Message-Id: <20231218105718.2445136-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
References: <20231218105718.2445136-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7984da9c0a35..423196d2204d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -557,10 +557,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 
 	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
-		ret = -EPROBE_DEFER;
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "failed to find bridge for companion bridge: %d\n",
-				     ret);
+		ret = dev_err_probe(dev, -EPROBE_DEFER,
+				    "failed to find bridge for companion bridge\n");
 		goto out;
 	}
 
@@ -590,22 +588,14 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
-	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get pixel clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_pixel))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_pixel),
+				     "failed to get pixel clock\n");
 
 	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
-	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get bypass clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_bypass))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_bypass),
+				     "failed to get bypass clock\n");
 
 	imx8qxp_ldb->dev = dev;
 
@@ -640,13 +630,10 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	}
 
 	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
-	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
-		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
-				      imx8qxp_ldb->active_chno, ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb_ch->phy))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb_ch->phy),
+				     "failed to get channel%d PHY\n",
+				     imx8qxp_ldb->active_chno);
 
 	ret = ldb_find_next_bridge_helper(ldb);
 	if (ret)
-- 
2.34.1

