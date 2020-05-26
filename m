Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB151E18D5
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6297889DA6;
	Tue, 26 May 2020 01:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E30389CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9EE411F3;
 Tue, 26 May 2020 03:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455737;
 bh=0ZDXY7ibm3r1cz7yJcFvOFvrMn1aII0p6Lq59Sm7XK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i1SDDWsoSvsmvfn04gZrlATGWpMqQvZGKZNnDMltEhpT+CAQBWxFQHPxg08tJUWVR
 vRfUT8j8oHfC8VsYXfCjLlptNKqAg4YAQhQaxBcmstdeWL6je1eyC4gAVvBPm770gx
 sIfTg/QGPzMI512K92H/nt0XIPQKwKL5MG7AUHvg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/27] drm: bridge: dw-hdmi: Pass private data pointer to
 .configure_phy()
Date: Tue, 26 May 2020 04:14:50 +0300
Message-Id: <20200526011505.31884-13-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The .configure_phy() operation takes a dw_hdmi_plat_data pointer as a
context argument. This differs from .mode_valid() that takes a custom
private context pointer, causing possible confusion. Make the
dw_hdmi_plat_data operations more consistent by passing the private
context pointer to .configure_phy() as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c    | 3 +--
 include/drm/bridge/dw_hdmi.h              | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 2b3f203cf467..6edb60e6c784 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1514,7 +1514,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi)
 
 	/* Write to the PHY as configured by the platform */
 	if (pdata->configure_phy)
-		ret = pdata->configure_phy(hdmi, pdata, mpixelclock);
+		ret = pdata->configure_phy(hdmi, pdata->priv_data, mpixelclock);
 	else
 		ret = phy->configure(hdmi, pdata, mpixelclock);
 	if (ret) {
diff --git a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
index 4d837a4d302d..d0dffe55a7cb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
+++ b/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
@@ -52,8 +52,7 @@ rcar_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
 	return MODE_OK;
 }
 
-static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi,
-				   const struct dw_hdmi_plat_data *pdata,
+static int rcar_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
 				   unsigned long mpixelclock)
 {
 	const struct rcar_hdmi_phy_params *params = rcar_hdmi_phy_params;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 66a811f75b91..09348c9cbd11 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -151,8 +151,7 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_mpll_config *mpll_cfg;
 	const struct dw_hdmi_curr_ctrl *cur_ctr;
 	const struct dw_hdmi_phy_config *phy_config;
-	int (*configure_phy)(struct dw_hdmi *hdmi,
-			     const struct dw_hdmi_plat_data *pdata,
+	int (*configure_phy)(struct dw_hdmi *hdmi, void *data,
 			     unsigned long mpixelclock);
 };
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
