Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E863C8C3235
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 17:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67210E1D0;
	Sat, 11 May 2024 15:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="f3nmc0DO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 858 seconds by postgrey-1.36 at gabe;
 Sat, 11 May 2024 15:45:40 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B0910E1D0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2024 15:45:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BFUu7V123386;
 Sat, 11 May 2024 10:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715441456;
 bh=JVCLeYkjk+2KS5dCU/Zbfc6/YUsDSBMlJ8VlBcQesC0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=f3nmc0DOghCfOp0p27C5xx2bPHIyFs7SgOaVH8JlLDu8NiFoIuNk/zV7jnWuqH4WS
 sO5Q7z6GUHV+BjPLlm4k8161Te75QRdBPS46rVhucbX3MCgoBqftoJvkngZmkX7BiD
 AdA4vb4SLE2kL1G1ieAFWJzTH8b+9DuJWh2KTfGU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BFUuO4033001
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 11 May 2024 10:30:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 10:30:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 10:30:55 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BFUtpU043186;
 Sat, 11 May 2024 10:30:55 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>, Aradhya Bhatia
 <a-bhatia1@ti.com>
Subject: [PATCH 2/7] drm/bridge: cdns-dsi: Fix minor bugs
Date: Sat, 11 May 2024 21:00:46 +0530
Message-ID: <20240511153051.1355825-3-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511153051.1355825-1-a-bhatia1@ti.com>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Update the Phy initialized state to "not initialized" when the driver
(and the hardware by extension) gets suspended. This will allow the Phy
to get initialized again after resume.

Fix the OF node that gets passed to find the next available bridge in
the display pipeline.

Fix the order of DSI Link and DSI Phy inits. The link init needs to
happen before the Phy is initialized, so the Phy can lock on the
incoming PLL reference clock. If this doesn't happen, the Phy cannot
lock (until DSI Link is init later on). This causes a warning dump
during the kernel boot.

Allow the D-Phy config checks to use mode->clock instead of
mode->crtc_clock during mode_valid checks, like everywhere else in the
driver.

Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 7457d38622b0..557b037bbc67 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -574,7 +574,7 @@ static int cdns_dsi_check_conf(struct cdns_dsi *dsi,
 	if (ret)
 		return ret;
 
-	phy_mipi_dphy_get_default_config(mode->crtc_clock * 1000,
+	phy_mipi_dphy_get_default_config((mode_valid_check ? mode->clock : mode->crtc_clock) * 1000,
 					 mipi_dsi_pixel_format_to_bpp(output->dev->format),
 					 nlanes, phy_cfg);
 
@@ -775,8 +775,8 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 
 	WARN_ON_ONCE(cdns_dsi_check_conf(dsi, mode, &dsi_cfg, false));
 
-	cdns_dsi_hs_init(dsi);
 	cdns_dsi_init_link(dsi);
+	cdns_dsi_hs_init(dsi);
 
 	writel(HBP_LEN(dsi_cfg.hbp) | HSA_LEN(dsi_cfg.hsa),
 	       dsi->regs + VID_HSIZE1);
@@ -952,7 +952,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *host,
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DSI);
 	} else {
-		bridge = of_drm_find_bridge(dev->dev.of_node);
+		bridge = of_drm_find_bridge(np);
 		if (!bridge)
 			bridge = ERR_PTR(-EINVAL);
 	}
@@ -1153,6 +1153,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
 	dsi->link_initialized = false;
+	dsi->phy_initialized = false;
 	return 0;
 }
 
-- 
2.34.1

