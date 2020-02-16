Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B41160694
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2020 22:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A6F6E4BB;
	Sun, 16 Feb 2020 21:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBFA6E47A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 21:04:06 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 723E4D9A;
 Sun, 16 Feb 2020 22:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581887044;
 bh=4wm1+wsfEJU4lBu3k6S/ZkANZJPxqFFsNIkGwB458gQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=emktxaK9CYSDlKirMy+9akmJeIZnFG3l/Pb2yrGoh27QjY26/5j56fHX8ZfcUwdDf
 qPmUf1PWxX+GDYmgkQR+nU5ZdWRV3zYLlnmQwbZ58facD7wpk5NmkmbRN0/SvS7MJP
 v/TPJSw32Yue0/WB4rSRPYilApyjqTaECF/27J2I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 38/51] drm/omap: hdmi: Remove omap_dss_device operations
Date: Sun, 16 Feb 2020 23:02:55 +0200
Message-Id: <20200216210308.17312-39-laurent.pinchart@ideasonboard.com>
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

Now that the HDMI outputs are driven fully through the drm_bridge API
their omap_dss_device operations are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi.h  |  1 -
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 18 ------------------
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 18 ------------------
 3 files changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi.h b/drivers/gpu/drm/omapdrm/dss/hdmi.h
index bd43f6abf27b..3a40833d3368 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi.h
@@ -380,7 +380,6 @@ struct omap_hdmi {
 	bool display_enabled;
 };
 
-#define dssdev_to_hdmi(dssdev) container_of(dssdev, struct omap_hdmi, output)
 #define drm_bridge_to_hdmi(b) container_of(b, struct omap_hdmi, bridge)
 
 #endif
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index b9bcd6e681e8..96ef7bd52199 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -309,18 +309,6 @@ void hdmi4_core_disable(struct hdmi_core_data *core)
 	mutex_unlock(&hdmi->lock);
 }
 
-static int hdmi_connect(struct omap_dss_device *src,
-			struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void hdmi_disconnect(struct omap_dss_device *src,
-			    struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
 static struct edid *
 hdmi_do_read_edid(struct omap_hdmi *hdmi,
 		  struct edid *(*read)(struct omap_hdmi *hdmi,
@@ -370,11 +358,6 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
 	return edid;
 }
 
-static const struct omap_dss_device_ops hdmi_ops = {
-	.connect		= hdmi_connect,
-	.disconnect		= hdmi_disconnect,
-};
-
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -741,7 +724,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index effe4a9401ff..6cb709c775d6 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -307,18 +307,6 @@ static void hdmi_core_disable(struct omap_hdmi *hdmi)
 	mutex_unlock(&hdmi->lock);
 }
 
-static int hdmi_connect(struct omap_dss_device *src,
-			struct omap_dss_device *dst)
-{
-	return omapdss_device_connect(dst->dss, dst, dst->next);
-}
-
-static void hdmi_disconnect(struct omap_dss_device *src,
-			    struct omap_dss_device *dst)
-{
-	omapdss_device_disconnect(dst, dst->next);
-}
-
 static struct edid *
 hdmi_do_read_edid(struct omap_hdmi *hdmi,
 		  struct edid *(*read)(struct omap_hdmi *hdmi,
@@ -363,11 +351,6 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
 	return (struct edid *)edid;
 }
 
-static const struct omap_dss_device_ops hdmi_ops = {
-	.connect		= hdmi_connect,
-	.disconnect		= hdmi_disconnect,
-};
-
 /* -----------------------------------------------------------------------------
  * DRM Bridge Operations
  */
@@ -715,7 +698,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
