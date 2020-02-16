Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD2160692
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552756E4CB;
	Sun, 16 Feb 2020 21:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0806E4AF
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:08 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A0BFDBD;
 Sun, 16 Feb 2020 22:04:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887046;
 bh=gdfNIg0sj7u5Etbv41BA46NZOh1LrAwICMfAtS1vC0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dWzy51TcHCZy6lvSbD6OTUSnsP6OWphcHDw4fsQGFgzCwMrZlc/XLhkrhikWiDZ6G
 ZvmDfPsRiAHqUUayCAfkotSOlXFCrfNSr5jSAm7lcOq4ZC/3rj3lAWF/GUOQMh/cYB
 A+DdNubqX4OjT/NGPxn69DRhfflBsagOHI+PMo0M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 41/51] drm/omap: hdmi5: Simplify EDID read
Date: Sun, 16 Feb 2020 23:02:58 +0200
Message-Id: <20200216210308.17312-42-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the omap_dss_device EDID read operation has been removed,
simplify the bridge-based EDID access by merging multiple functions
together.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 86 ++++++++++++-----------------
 1 file changed, 35 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 6cb709c775d6..4d4c1fabd0a1 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -307,50 +307,6 @@ static void hdmi_core_disable(struct omap_hdmi *hdmi)
 	mutex_unlock(&hdmi->lock);
 }
 
-static struct edid *
-hdmi_do_read_edid(struct omap_hdmi *hdmi,
-		  struct edid *(*read)(struct omap_hdmi *hdmi,
-				       struct drm_connector *connector),
-		  struct drm_connector *connector)
-{
-	struct edid *edid;
-	bool need_enable;
-	int idlemode;
-	int r;
-
-	need_enable = hdmi->core_enabled == false;
-
-	if (need_enable) {
-		r = hdmi_core_enable(hdmi);
-		if (r)
-			return NULL;
-	}
-
-	mutex_lock(&hdmi->lock);
-	r = hdmi_runtime_get(hdmi);
-	BUG_ON(r);
-
-	idlemode = REG_GET(hdmi->wp.base, HDMI_WP_SYSCONFIG, 3, 2);
-	/* No-idle mode */
-	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, 1, 3, 2);
-
-	hdmi5_core_ddc_init(&hdmi->core);
-
-	edid = read(hdmi, connector);
-
-	hdmi5_core_ddc_uninit(&hdmi->core);
-
-	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, idlemode, 3, 2);
-
-	hdmi_runtime_put(hdmi);
-	mutex_unlock(&hdmi->lock);
-
-	if (need_enable)
-		hdmi_core_disable(hdmi);
-
-	return (struct edid *)edid;
-}
-
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -469,18 +425,46 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->lock);
 }
 
-static struct edid *hdmi5_bridge_read_edid(struct omap_hdmi *hdmi,
-					   struct drm_connector *connector)
-{
-	return drm_do_get_edid(connector, hdmi5_core_ddc_read, &hdmi->core);
-}
-
 static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+	struct edid *edid;
+	bool need_enable;
+	int idlemode;
+	int r;
+
+	need_enable = hdmi->core_enabled == false;
+
+	if (need_enable) {
+		r = hdmi_core_enable(hdmi);
+		if (r)
+			return NULL;
+	}
+
+	mutex_lock(&hdmi->lock);
+	r = hdmi_runtime_get(hdmi);
+	BUG_ON(r);
 
-	return hdmi_do_read_edid(hdmi, hdmi5_bridge_read_edid, connector);
+	idlemode = REG_GET(hdmi->wp.base, HDMI_WP_SYSCONFIG, 3, 2);
+	/* No-idle mode */
+	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, 1, 3, 2);
+
+	hdmi5_core_ddc_init(&hdmi->core);
+
+	edid = drm_do_get_edid(connector, hdmi5_core_ddc_read, &hdmi->core);
+
+	hdmi5_core_ddc_uninit(&hdmi->core);
+
+	REG_FLD_MOD(hdmi->wp.base, HDMI_WP_SYSCONFIG, idlemode, 3, 2);
+
+	hdmi_runtime_put(hdmi);
+	mutex_unlock(&hdmi->lock);
+
+	if (need_enable)
+		hdmi_core_disable(hdmi);
+
+	return (struct edid *)edid;
 }
 
 static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
