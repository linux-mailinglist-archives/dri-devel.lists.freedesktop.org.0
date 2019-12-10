Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CD119ED6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F70C6E9FC;
	Tue, 10 Dec 2019 22:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9FF6E9F1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:40 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B53411A4D;
 Tue, 10 Dec 2019 23:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018718;
 bh=cmDx7GWEKU+9q/KURAsjzNeUNXe+Wfk73bEC9DeOgRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZtRiFht0VS8pymScKczOPM9oT65F06VZmtAgcw8WBoFgMF0LXYMOFwlt2BybQGSuh
 P34yelleDrfVkBYPJSk3QdPXehBkmmjg05wlAmV5Dt1RjhMpAnyIyrgrpbeW1rm5Yb
 H7lpLnc4/IvtLN1KYb0n4Uns83sr6cutd1i5v4xI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 38/50] drm/omap: hdmi: Remove omap_dss_device operations
Date: Wed, 11 Dec 2019 00:57:38 +0200
Message-Id: <20191210225750.15709-39-laurent.pinchart@ideasonboard.com>
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

Now that the HDMI outputs are driven fully through the drm_bridge API
their omap_dss_device operations are not used anymore. Remove them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
index 7d411f5c4193..34db86ba6193 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -308,18 +308,6 @@ void hdmi4_core_disable(struct hdmi_core_data *core)
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
@@ -369,11 +357,6 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
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
@@ -736,7 +719,6 @@ static int hdmi4_init_output(struct omap_hdmi *hdmi)
 	out->type = OMAP_DISPLAY_TYPE_HDMI;
 	out->name = "hdmi.0";
 	out->dispc_channel = OMAP_DSS_CHANNEL_DIGIT;
-	out->ops = &hdmi_ops;
 	out->owner = THIS_MODULE;
 	out->of_port = 0;
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 0490393101fd..69b0d0cc7593 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -306,18 +306,6 @@ static void hdmi_core_disable(struct omap_hdmi *hdmi)
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
@@ -362,11 +350,6 @@ hdmi_do_read_edid(struct omap_hdmi *hdmi,
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
@@ -710,7 +693,6 @@ static int hdmi5_init_output(struct omap_hdmi *hdmi)
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
