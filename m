Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5A16FD8D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C09E6E858;
	Wed, 26 Feb 2020 11:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3AC6E525
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:26:02 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F85A1D7A;
 Wed, 26 Feb 2020 12:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716354;
 bh=2Gtdj8A1BCtIH8P3oWoN7si/Rx9qjO0C6UdRZ4psRh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iKtqEyAB/sV4A9SyKmJccnf3LJ4TcY9Hv/12NQccy2VEVpgQFPe/gT8JXY3YopQuN
 IXEkLrYecKO893hJ3YLBbdDRNr3Ng5FlfPIht5B1fcvjaMbtC+kVEoDZlUabRQ/3w6
 4l8J/1WEPcacGy4ze1AKMVZQ+flKGZdwGUYjPJ0U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 27/54] drm/omap: dss: Make omap_dss_device_ops optional
Date: Wed, 26 Feb 2020 13:24:47 +0200
Message-Id: <20200226112514.12455-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
References: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As part of the move to drm_bridge ops, the dssdev ops will become empty
for some of the internal encoders. Make them optional in the driver to
allow them to be removed completely, easing the transition.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c       | 21 ++++++++++++---------
 drivers/gpu/drm/omapdrm/dss/dss.c        |  3 ++-
 drivers/gpu/drm/omapdrm/omap_connector.c |  2 +-
 drivers/gpu/drm/omapdrm/omap_encoder.c   | 12 +++++++-----
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 80d48936d177..2db3bd2f19db 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -195,10 +195,12 @@ int omapdss_device_connect(struct dss_device *dss,
 
 	dst->dss = dss;
 
-	ret = dst->ops->connect(src, dst);
-	if (ret < 0) {
-		dst->dss = NULL;
-		return ret;
+	if (dst->ops && dst->ops->connect) {
+		ret = dst->ops->connect(src, dst);
+		if (ret < 0) {
+			dst->dss = NULL;
+			return ret;
+		}
 	}
 
 	return 0;
@@ -226,7 +228,8 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 
 	WARN_ON(dst->state != OMAP_DSS_DISPLAY_DISABLED);
 
-	dst->ops->disconnect(src, dst);
+	if (dst->ops && dst->ops->disconnect)
+		dst->ops->disconnect(src, dst);
 	dst->dss = NULL;
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disconnect);
@@ -238,7 +241,7 @@ void omapdss_device_pre_enable(struct omap_dss_device *dssdev)
 
 	omapdss_device_pre_enable(dssdev->next);
 
-	if (dssdev->ops->pre_enable)
+	if (dssdev->ops && dssdev->ops->pre_enable)
 		dssdev->ops->pre_enable(dssdev);
 }
 EXPORT_SYMBOL_GPL(omapdss_device_pre_enable);
@@ -248,7 +251,7 @@ void omapdss_device_enable(struct omap_dss_device *dssdev)
 	if (!dssdev)
 		return;
 
-	if (dssdev->ops->enable)
+	if (dssdev->ops && dssdev->ops->enable)
 		dssdev->ops->enable(dssdev);
 
 	omapdss_device_enable(dssdev->next);
@@ -264,7 +267,7 @@ void omapdss_device_disable(struct omap_dss_device *dssdev)
 
 	omapdss_device_disable(dssdev->next);
 
-	if (dssdev->ops->disable)
+	if (dssdev->ops && dssdev->ops->disable)
 		dssdev->ops->disable(dssdev);
 }
 EXPORT_SYMBOL_GPL(omapdss_device_disable);
@@ -274,7 +277,7 @@ void omapdss_device_post_disable(struct omap_dss_device *dssdev)
 	if (!dssdev)
 		return;
 
-	if (dssdev->ops->post_disable)
+	if (dssdev->ops && dssdev->ops->post_disable)
 		dssdev->ops->post_disable(dssdev);
 
 	omapdss_device_post_disable(dssdev->next);
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 67b92b5d8dd7..b76fc2b56227 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1552,7 +1552,8 @@ static void dss_shutdown(struct platform_device *pdev)
 	DSSDBG("shutdown\n");
 
 	for_each_dss_output(dssdev) {
-		if (dssdev->state == OMAP_DSS_DISPLAY_ACTIVE)
+		if (dssdev->state == OMAP_DSS_DISPLAY_ACTIVE &&
+		    dssdev->ops && dssdev->ops->disable)
 			dssdev->ops->disable(dssdev);
 	}
 }
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index b0cb2ecb30ab..a24cec4b0bb9 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -228,7 +228,7 @@ enum drm_mode_status omap_connector_mode_fixup(struct omap_dss_device *dssdev,
 	drm_mode_copy(adjusted_mode, mode);
 
 	for (; dssdev; dssdev = dssdev->next) {
-		if (!dssdev->ops->check_timings)
+		if (!dssdev->ops || !dssdev->ops->check_timings)
 			continue;
 
 		ret = dssdev->ops->check_timings(dssdev, adjusted_mode);
diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index a270173a2411..b232acd3bc3d 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -77,10 +77,10 @@ static void omap_encoder_hdmi_mode_set(struct drm_connector *connector,
 	struct omap_dss_device *dssdev = omap_encoder->output;
 	bool hdmi_mode = connector->display_info.is_hdmi;
 
-	if (dssdev->ops->hdmi.set_hdmi_mode)
+	if (dssdev->ops && dssdev->ops->hdmi.set_hdmi_mode)
 		dssdev->ops->hdmi.set_hdmi_mode(dssdev, hdmi_mode);
 
-	if (hdmi_mode && dssdev->ops->hdmi.set_infoframe) {
+	if (hdmi_mode && dssdev->ops && dssdev->ops->hdmi.set_infoframe) {
 		struct hdmi_avi_infoframe avi;
 		int r;
 
@@ -139,7 +139,7 @@ static void omap_encoder_mode_set(struct drm_encoder *encoder,
 	dss_mgr_set_timings(output, &vm);
 
 	for (dssdev = output; dssdev; dssdev = dssdev->next) {
-		if (dssdev->ops->set_timings)
+		if (dssdev->ops && dssdev->ops->set_timings)
 			dssdev->ops->set_timings(dssdev, adjusted_mode);
 	}
 
@@ -168,7 +168,8 @@ static void omap_encoder_disable(struct drm_encoder *encoder)
 	 * flow where the pipeline output controls the encoder.
 	 */
 	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		dssdev->ops->disable(dssdev);
+		if (dssdev->ops && dssdev->ops->disable)
+			dssdev->ops->disable(dssdev);
 		dssdev->state = OMAP_DSS_DISPLAY_DISABLED;
 	}
 
@@ -196,7 +197,8 @@ static void omap_encoder_enable(struct drm_encoder *encoder)
 	 * flow where the pipeline output controls the encoder.
 	 */
 	if (dssdev->type != OMAP_DISPLAY_TYPE_DSI) {
-		dssdev->ops->enable(dssdev);
+		if (dssdev->ops && dssdev->ops->enable)
+			dssdev->ops->enable(dssdev);
 		dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 	}
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
