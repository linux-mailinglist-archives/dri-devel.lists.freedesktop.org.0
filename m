Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CA21E18EA
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85989EB1;
	Tue, 26 May 2020 01:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E654489DA6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:44 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2746A1452;
 Tue, 26 May 2020 03:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455743;
 bh=vcRzJcX5fTs9TL9pKQf0FVlaSPtFqlAume04Y1cxyQo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tkMloCF48liKmvN56dq3lod353wF2rAZBgXQofTZidyblrAhUfck+b723d/6jk7pF
 cv5Xa2UkBgw885ZfjHzcLVKfgEKsuMclTahAjGD7tFM8E3QfN7j0VCuhLTpRikYwSX
 Iz0LeMEeFbTDZ9F3xFD1B4LI05k1yyra907HakfE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/27] drm: bridge: dw-hdmi: Constify mode argument to
 internal functions
Date: Tue, 26 May 2020 04:14:55 +0300
Message-Id: <20200526011505.31884-18-laurent.pinchart+renesas@ideasonboard.com>
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

Several internal functions take a drm_display_mode argument to configure
the HDMI encoder or the HDMI PHY. They must not modify the mode, make
the pointer const to enforce that.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 6e6a3d95e68e..5b5f07a23400 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1628,7 +1628,8 @@ static void hdmi_tx_hdcp_config(struct dw_hdmi *hdmi)
 		  HDMI_A_HDCPCFG1_ENCRYPTIONDISABLE_MASK, HDMI_A_HDCPCFG1);
 }
 
-static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
+static void hdmi_config_AVI(struct dw_hdmi *hdmi,
+			    const struct drm_display_mode *mode)
 {
 	struct hdmi_avi_infoframe frame;
 	u8 val;
@@ -1756,7 +1757,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 }
 
 static void hdmi_config_vendor_specific_infoframe(struct dw_hdmi *hdmi,
-						 struct drm_display_mode *mode)
+						  const struct drm_display_mode *mode)
 {
 	struct hdmi_vendor_infoframe frame;
 	u8 buffer[10];
@@ -2112,7 +2113,8 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
-static int dw_hdmi_setup(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
+static int dw_hdmi_setup(struct dw_hdmi *hdmi,
+			 const struct drm_display_mode *mode)
 {
 	int ret;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
