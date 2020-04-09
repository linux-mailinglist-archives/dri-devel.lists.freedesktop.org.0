Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 565031A2D10
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 02:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBF66EB22;
	Thu,  9 Apr 2020 00:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46076EB22
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 00:46:28 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74619DA9;
 Thu,  9 Apr 2020 02:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586393187;
 bh=C9f4odax94eP4i9VZy3pXQwwa1m4F/vBYX5rWUnMTUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ovi0biAOLlncXG7sZsjhxvUgEhiWqiJze6+wqNRBe1zzd8Rk0z5L0TDxlYKG0b4fP
 BLcgFLYeVWPx1JZ9jc7cYRzQS7Ir9wd4Ch1F2jUuz1bi2WlIed+LY2CEe7/zztXQ7m
 M9OUeh6FCRYABTsqCaq8Ilxfs0azGhUPgeHG15f8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm: bridge: adv7511: Implement bridge connector
 operations
Date: Thu,  9 Apr 2020 03:46:09 +0300
Message-Id: <20200409004610.12346-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200409004610.12346-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the bridge connector-related .get_edid(), .detect() and
.hpd_notify() operations, and report the related bridge capabilities.

Output status detection is implemented using the same backend as for the
DRM connector, but requires making mode retrieval at detection time
optional as no pointer to the connector is available to the bridge
.detect() operation. The reason for the need to retrieve modes at
detection time is unclear to me, and this may benefit from further
refactoring of hot plug handling code.

Hot plug detection is notified through the bridge HPD notification
framework when the bridge is used without creating a connector, and
falls back to the existing implementation otherwise. CEC handling of
disconnection is handled in the new .hpd_notify() operation in the new
code path.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 43 ++++++++++++++++++--
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index e3b62ad95389..723560b36ee0 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -443,9 +443,14 @@ static void adv7511_hpd_work(struct work_struct *work)
 
 	if (adv7511->connector.status != status) {
 		adv7511->connector.status = status;
-		if (status == connector_status_disconnected)
-			cec_phys_addr_invalidate(adv7511->cec_adap);
-		drm_kms_helper_hotplug_event(adv7511->connector.dev);
+
+		if (adv7511->connector.dev) {
+			if (status == connector_status_disconnected)
+				cec_phys_addr_invalidate(adv7511->cec_adap);
+			drm_kms_helper_hotplug_event(adv7511->connector.dev);
+		} else {
+			drm_bridge_hpd_notify(&adv7511->bridge, status);
+		}
 	}
 }
 
@@ -661,7 +666,8 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
 	if (status == connector_status_connected && hpd && adv7511->powered) {
 		regcache_mark_dirty(adv7511->regmap);
 		adv7511_power_on(adv7511);
-		adv7511_get_modes(adv7511, connector);
+		if (connector)
+			adv7511_get_modes(adv7511, connector);
 		if (adv7511->status == connector_status_connected)
 			status = connector_status_disconnected;
 	} else {
@@ -917,11 +923,38 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
+static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	return adv7511_detect(adv, NULL);
+}
+
+static struct edid *adv7511_bridge_get_edid(struct drm_bridge *bridge,
+					    struct drm_connector *connector)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	return adv7511_get_edid(adv, connector);
+}
+
+static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
+				      enum drm_connector_status status)
+{
+	struct adv7511 *adv = bridge_to_adv7511(bridge);
+
+	if (status == connector_status_disconnected)
+		cec_phys_addr_invalidate(adv->cec_adap);
+}
+
 static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.enable = adv7511_bridge_enable,
 	.disable = adv7511_bridge_disable,
 	.mode_set = adv7511_bridge_mode_set,
 	.attach = adv7511_bridge_attach,
+	.detect = adv7511_bridge_detect,
+	.get_edid = adv7511_bridge_get_edid,
+	.hpd_notify = adv7511_bridge_hpd_notify,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1250,6 +1283,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		goto err_unregister_cec;
 
 	adv7511->bridge.funcs = &adv7511_bridge_funcs;
+	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			    | DRM_BRIDGE_OP_HPD;
 	adv7511->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&adv7511->bridge);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
