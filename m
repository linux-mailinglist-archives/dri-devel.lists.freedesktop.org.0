Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E442E1E18DD
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7852989DB7;
	Tue, 26 May 2020 01:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEED389CDB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:39 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FFD0DA3;
 Tue, 26 May 2020 03:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455738;
 bh=1aNhGdSchRFWlQ87Ei0sqoA/5L29qr+pa4bLo4AxB3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i29l7ATUIE8Q0//LhmFFRsTxyU74kVuffikEzY+iAoDsdNIef4Dy6ZV6wTZIdgrSP
 W7CgYtdjuUZ1mbS61FAJ/SIELl5z8eAENAOOhO6mcavx77I5iTewuuCpqBpm9q0Ko1
 YQOkToKZd1NoyFaOvC/YWPyu91u2ma85DyHPiQDA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/27] drm: bridge: dw-hdmi: Remove unused field from
 dw_hdmi_plat_data
Date: Tue, 26 May 2020 04:14:51 +0300
Message-Id: <20200526011505.31884-14-laurent.pinchart+renesas@ideasonboard.com>
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

The input_bus_format field of struct dw_hdmi_plat_data is unused. Remove
it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +----
 include/drm/bridge/dw_hdmi.h              | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6edb60e6c784..adc5a95a06e9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2137,10 +2137,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 	hdmi->hdmi_data.video_mode.mpixelrepetitionoutput = 0;
 	hdmi->hdmi_data.video_mode.mpixelrepetitioninput = 0;
 
-	if (hdmi->plat_data->input_bus_format)
-		hdmi->hdmi_data.enc_in_bus_format =
-			hdmi->plat_data->input_bus_format;
-	else if (hdmi->hdmi_data.enc_in_bus_format == MEDIA_BUS_FMT_FIXED)
+	if (hdmi->hdmi_data.enc_in_bus_format == MEDIA_BUS_FMT_FIXED)
 		hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	/* TOFIX: Get input encoding from plat data or fallback to none */
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 09348c9cbd11..5dfa9d83e2d3 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -125,7 +125,6 @@ struct dw_hdmi_phy_ops {
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
-	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
 	bool ycbcr_420_allowed;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
