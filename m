Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BE1E18B7
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624D789CB8;
	Tue, 26 May 2020 01:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564B989CB9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:27 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 615F1814;
 Tue, 26 May 2020 03:15:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455725;
 bh=kf4EJmTwgc32zxKqxdC4W0sDrp/0RuppckiLOUzdao4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vhADncQwBofeKK03SOLt/bwsSNnOj2B0H6SwPj7J9rgiZ/qyHNxyc4UBY3Cx1CsX6
 lcSUnuQGW9lSDKZ7uiCAhinK/BPEGHImFCd38lvogLG6XU8gBRpQxblzXfgRSpbWo2
 LV8yb4ePf3prsopgd+kRg38iqz/fJqsqWVtJ4xeg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/27] drm: bridge: adv7511: Split EDID read to a separate
 function
Date: Tue, 26 May 2020 04:14:39 +0300
Message-Id: <20200526011505.31884-2-laurent.pinchart+renesas@ideasonboard.com>
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

To prepare for the implementation of the DRM bridge connector
operations, move EDID read out of adv7511_get_modes() to a separate
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 23 ++++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 87b58c1acff4..58d02e92b6b9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -589,11 +589,10 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
  * ADV75xx helpers
  */
 
-static int adv7511_get_modes(struct adv7511 *adv7511,
-			     struct drm_connector *connector)
+static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
+				     struct drm_connector *connector)
 {
 	struct edid *edid;
-	unsigned int count;
 
 	/* Reading the EDID only works if the device is powered */
 	if (!adv7511->powered) {
@@ -612,15 +611,25 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
 	if (!adv7511->powered)
 		__adv7511_power_off(adv7511);
 
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-
 	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
 			       drm_detect_hdmi_monitor(edid));
 
 	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
 
+	return edid;
+}
+
+static int adv7511_get_modes(struct adv7511 *adv7511,
+			     struct drm_connector *connector)
+{
+	struct edid *edid;
+	unsigned int count;
+
+	edid = adv7511_get_edid(adv7511, connector);
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+
 	kfree(edid);
 
 	return count;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
