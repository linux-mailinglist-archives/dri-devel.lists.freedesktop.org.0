Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FE416068F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674DC6E4C4;
	Sun, 16 Feb 2020 21:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E916E4A7
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:07 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F339122D;
 Sun, 16 Feb 2020 22:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887046;
 bh=PyDimOAmzBZSbrlgVQ8SE7w1zf9Nog3ZFBVlqkLi/7M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VWG6wxQ9h/RYrWqXv3Tj5Y1RYfUoQd0MTbkjwr1rIi01RH30C5RaPfMXqOBstq2LG
 YB3YfJ1TbFyPp2nEGOWTaLISzq1ahgXj2rgfa0vi5q+i+3e429+gTtQ+ip0KeExZdA
 vBWpcH5gy+9resfQ7fGuhuaBiQKpXeIlE45jhd5w=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 40/51] drm/omap: hdmi4: Simplify EDID read
Date: Sun, 16 Feb 2020 23:02:57 +0200
Message-Id: <20200216210308.17312-41-laurent.pinchart@ideasonboard.com>
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
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 96 ++++++++++++-----------------
 1 file changed, 40 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 96ef7bd52199..2578c95570f6 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -309,55 +309,6 @@ void hdmi4_core_disable(struct hdmi_core_data *core)
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
@@ -485,18 +436,51 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
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
