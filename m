Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F093119ED9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C4A6EA06;
	Tue, 10 Dec 2019 22:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761626E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:42 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20F3E1A54;
 Tue, 10 Dec 2019 23:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018719;
 bh=MHYHpKGfYDIywGEK8cVvm9Y4+Fs9UJBfc1zlE3mpIPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ps3qEjIXJFCu/rn8hFRZjXEX4iVhkSu6w5KJPXsF7Sx2ZJsMO/sd3lsAd0P6Zpulv
 o4qdbl3RWTLQcXhI6wdvLt1mk2ZD+R3DCaUJn+VQMdjAyt2z8YUhNRh10AoI4YqTS3
 nKFDCYnUx7pSGQbRdaanZVEBdjAmapAB2o+Z1um8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 40/50] drm/omap: hdmi4: Simplify EDID read
Date: Wed, 11 Dec 2019 00:57:40 +0200
Message-Id: <20191210225750.15709-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the omap_dss_device EDID read operation has been removed,
simplify the bridge-based EDID access by merging multiple functions
together.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 96 ++++++++++++-----------------
 1 file changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 34db86ba6193..aa253d4902fe 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -308,55 +308,6 @@ void hdmi4_core_disable(struct hdmi_core_data *core)
 	mutex_unlock(&hdmi->lock);
 }
 
-static struct edid *
-hdmi_do_read_edid(struct omap_hdmi *hdmi,
-		  struct edid *(*read)(struct omap_hdmi *hdmi,
-				       struct drm_connector *connector),
-		  struct drm_connector *connector)
-{
-	struct edid *edid = NULL;
-	unsigned int cec_addr;
-	bool need_enable;
-	int r;
-
-	need_enable = hdmi->core_enabled == false;
-
-	if (need_enable) {
-		r = hdmi4_core_enable(&hdmi->core);
-		if (r)
-			return NULL;
-	}
-
-	mutex_lock(&hdmi->lock);
-	r = hdmi_runtime_get(hdmi);
-	BUG_ON(r);
-
-	r = hdmi4_core_ddc_init(&hdmi->core);
-	if (r)
-		goto done;
-
-	edid = read(hdmi, connector);
-
-done:
-	hdmi_runtime_put(hdmi);
-	mutex_unlock(&hdmi->lock);
-
-	if (edid && edid->extensions) {
-		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
-
-		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
-	} else {
-		cec_addr = CEC_PHYS_ADDR_INVALID;
-	}
-
-	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
-
-	if (need_enable)
-		hdmi4_core_disable(&hdmi->core);
-
-	return edid;
-}
-
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -483,18 +434,51 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
 }
 
-static struct edid *hdmi4_bridge_read_edid(struct omap_hdmi *hdmi,
-					   struct drm_connector *connector)
-{
-	return drm_do_get_edid(connector, hdmi4_core_ddc_read, &hdmi->core);
-}
-
 static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+	struct edid *edid = NULL;
+	unsigned int cec_addr;
+	bool need_enable;
+	int r;
+
+	need_enable = hdmi->core_enabled == false;
+
+	if (need_enable) {
+		r = hdmi4_core_enable(&hdmi->core);
+		if (r)
+			return NULL;
+	}
+
+	mutex_lock(&hdmi->lock);
+	r = hdmi_runtime_get(hdmi);
+	BUG_ON(r);
+
+	r = hdmi4_core_ddc_init(&hdmi->core);
+	if (r)
+		goto done;
+
+	edid = drm_do_get_edid(connector, hdmi4_core_ddc_read, &hdmi->core);
 
-	return hdmi_do_read_edid(hdmi, hdmi4_bridge_read_edid, connector);
+done:
+	hdmi_runtime_put(hdmi);
+	mutex_unlock(&hdmi->lock);
+
+	if (edid && edid->extensions) {
+		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
+
+		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
+	} else {
+		cec_addr = CEC_PHYS_ADDR_INVALID;
+	}
+
+	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
+
+	if (need_enable)
+		hdmi4_core_disable(&hdmi->core);
+
+	return edid;
 }
 
 static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
