Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCC16FDA8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5276E8A1;
	Wed, 26 Feb 2020 11:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF53C6E524
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:26:02 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C82C14D5;
 Wed, 26 Feb 2020 12:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716355;
 bh=lPmhmjPETchKz+MBMvfF+F+P630fH64W+8UtRDVQ0fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S4TmsHc7qLePry8FZn0zesxOgH40nakP5YghZ+usEhvDBA3zqWkuNCfgZh7CkxdKH
 +3q+H6wW+lTZhyhduslRZ8tRA/oW/5zCza/5Bxvcs2jh88PmjStvXiFKaMCSHSlWdV
 MFOnz4NCcGW11QCl4+r61t9Kwb0p6/YMUC3LTQW4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 28/54] drm/omap: hdmi: Allocate EDID in the .read_edid()
 operation
Date: Wed, 26 Feb 2020 13:24:48 +0200
Message-Id: <20200226112514.12455-29-laurent.pinchart@ideasonboard.com>
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

Bring the omapdss-specific .read_edid() operation in sync with the
drm_bridge .get_edid() operation to ease code reuse.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c      | 36 ++++++++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c      | 24 ++++++++++++----
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |  2 +-
 drivers/gpu/drm/omapdrm/omap_connector.c | 12 ++------
 4 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index dd4a14fe7e59..e15fa3862922 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -405,31 +405,45 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 	omapdss_device_disconnect(dst, dst->next);
 }
 
-static int hdmi_read_edid(struct omap_dss_device *dssdev,
-		u8 *edid, int len)
+#define MAX_EDID	512
+
+static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 {
 	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
 	bool need_enable;
+	u8 *edid;
 	int r;
 
+	edid = kzalloc(MAX_EDID, GFP_KERNEL);
+	if (!edid)
+		return NULL;
+
 	need_enable = hdmi->core_enabled == false;
 
 	if (need_enable) {
 		r = hdmi4_core_enable(&hdmi->core);
-		if (r)
-			return r;
+		if (r) {
+			kfree(edid);
+			return NULL;
+		}
+	}
+
+	r = read_edid(hdmi, edid, MAX_EDID);
+	if (r < 0) {
+		kfree(edid);
+		edid = NULL;
+	} else {
+		unsigned int cec_addr;
+
+		cec_addr = r >= 256 ? cec_get_edid_phys_addr(edid, r, NULL)
+			 : CEC_PHYS_ADDR_INVALID;
+		hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
 	}
 
-	r = read_edid(hdmi, edid, len);
-	if (r >= 256)
-		hdmi4_cec_set_phys_addr(&hdmi->core,
-					cec_get_edid_phys_addr(edid, r, NULL));
-	else
-		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
 
-	return r;
+	return (struct edid *)edid;
 }
 
 static void hdmi_lost_hotplug(struct omap_dss_device *dssdev)
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 8e3790dd8b98..99720dfc5769 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -410,27 +410,39 @@ static void hdmi_disconnect(struct omap_dss_device *src,
 	omapdss_device_disconnect(dst, dst->next);
 }
 
-static int hdmi_read_edid(struct omap_dss_device *dssdev,
-		u8 *edid, int len)
+#define MAX_EDID	512
+
+static struct edid *hdmi_read_edid(struct omap_dss_device *dssdev)
 {
 	struct omap_hdmi *hdmi = dssdev_to_hdmi(dssdev);
 	bool need_enable;
+	u8 *edid;
 	int r;
 
+	edid = kzalloc(MAX_EDID, GFP_KERNEL);
+	if (!edid)
+		return NULL;
+
 	need_enable = hdmi->core_enabled == false;
 
 	if (need_enable) {
 		r = hdmi_core_enable(hdmi);
-		if (r)
-			return r;
+		if (r) {
+			kfree(edid);
+			return NULL;
+		}
 	}
 
-	r = read_edid(hdmi, edid, len);
+	r = read_edid(hdmi, edid, MAX_EDID);
+	if (r < 0) {
+		kfree(edid);
+		edid = NULL;
+	}
 
 	if (need_enable)
 		hdmi_core_disable(hdmi);
 
-	return r;
+	return (struct edid *)edid;
 }
 
 static int hdmi_set_infoframe(struct omap_dss_device *dssdev,
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 82e9bfa5530a..269e143d57be 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -367,7 +367,7 @@ struct omap_dss_device_ops {
 				void *cb_data);
 	void (*unregister_hpd_cb)(struct omap_dss_device *dssdev);
 
-	int (*read_edid)(struct omap_dss_device *dssdev, u8 *buf, int len);
+	struct edid *(*read_edid)(struct omap_dss_device *dssdev);
 
 	int (*get_modes)(struct omap_dss_device *dssdev,
 			 struct drm_connector *connector);
diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index a24cec4b0bb9..c636ae228130 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -153,25 +153,19 @@ static void omap_connector_destroy(struct drm_connector *connector)
 	kfree(omap_connector);
 }
 
-#define MAX_EDID  512
-
 static int omap_connector_get_modes_edid(struct drm_connector *connector,
 					 struct omap_dss_device *dssdev)
 {
 	enum drm_connector_status status;
-	void *edid;
+	struct edid *edid;
 	int n;
 
 	status = omap_connector_detect(connector, false);
 	if (status != connector_status_connected)
 		goto no_edid;
 
-	edid = kzalloc(MAX_EDID, GFP_KERNEL);
-	if (!edid)
-		goto no_edid;
-
-	if (dssdev->ops->read_edid(dssdev, edid, MAX_EDID) <= 0 ||
-	    !drm_edid_is_valid(edid)) {
+	edid = dssdev->ops->read_edid(dssdev);
+	if (!edid || !drm_edid_is_valid(edid)) {
 		kfree(edid);
 		goto no_edid;
 	}
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
