Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8055817ACD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1846B10E396;
	Mon, 18 Dec 2023 19:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FEB10E390
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1702926928; x=1734462928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6bpzhwW9R8BYF0pBX9Lwvsu/ntZ/dkI6vpAeUOsKdA=;
 b=Jo+AgxTLjzZg1Olxj53rbRstQ0DOgEWJZDcnNwM+1wxExZza5h7doomR
 wf4pV5opGFAz6KHG+3Q7l3u9/MbqFCrTRlHmirtoy/wSS4g9Jys3i5mKQ
 mzq6ohkm3+gg9M+9yu+wGHS+BBIp0nB+VQaTwiz7m/3XBaTRwvxbjwVMT
 7vocQkIYx5WQjWQQRX0SkurMSwCDdh2ex6u763SUJvnjvXsLXk4EqFw+L
 ERYni5AtdtrJNWwPhR1Pyn85cT8rNuHMHeZGPutcdmKba+9cUpZr172NR
 yYtBEuLmHvnbgkEvnCT/s61PgYsqst29B9ZvwfoUwLs5Djx5rJYWmuK05 g==;
X-IronPort-AV: E=Sophos;i="6.04,285,1695679200"; d="scan'208";a="34559830"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Dec 2023 11:57:21 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BDD10280084;
 Mon, 18 Dec 2023 11:57:20 +0100 (CET)
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
Subject: [PATCH 1/6] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Date: Mon, 18 Dec 2023 11:57:13 +0100
Message-Id: <20231218105718.2445136-2-alexander.stein@ew.tq-group.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 4a886cb808ca..3a1d5795d002 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -403,20 +403,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	p2d->regmap = syscon_node_to_regmap(np->parent);
-	if (IS_ERR(p2d->regmap)) {
-		ret = PTR_ERR(p2d->regmap);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->regmap))
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
 
 	ret = imx_scu_get_handle(&p2d->ipc_handle);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
-				      ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
 
 	p2d->dev = dev;
 
@@ -427,13 +419,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
+				     "failed to find next bridge\n");
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)
-- 
2.34.1

