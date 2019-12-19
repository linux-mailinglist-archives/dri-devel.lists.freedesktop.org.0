Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9C125FCC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060556EB44;
	Thu, 19 Dec 2019 10:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAE86EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:21 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1871945;
 Thu, 19 Dec 2019 11:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752378;
 bh=Jddy46XKE+nqpYvFHEkFbqgtL2B9BJAPLMfQJ7QUEMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O3+L90lHphu+J4Om5PSgQsPCjNWAUOmlbn3kutaT95eiPOhUYy052t/93S8t5Xabh
 H6goxB+512c0jbVFElBAsuPI4KSzfExjxboMWZqkxI94g1uu6/J2ch+3JNfqz/lO88
 WUbdWDrpPxk8QkyWZMNoDpaep8vxm9jaPuS0TTo0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 50/51] drm/omap: dss: Inline the omapdss_display_get()
 function
Date: Thu, 19 Dec 2019 12:45:21 +0200
Message-Id: <20191219104522.9379-51-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inline the omapdss_display_get() in its only caller to simplify the
code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/display.c | 9 ---------
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 1 -
 drivers/gpu/drm/omapdrm/omap_drv.c    | 7 ++++---
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/display.c b/drivers/gpu/drm/omapdrm/dss/display.c
index 8a3f61f5825f..3b82158b1bfd 100644
--- a/drivers/gpu/drm/omapdrm/dss/display.c
+++ b/drivers/gpu/drm/omapdrm/dss/display.c
@@ -40,15 +40,6 @@ void omapdss_display_init(struct omap_dss_device *dssdev)
 }
 EXPORT_SYMBOL_GPL(omapdss_display_init);
 
-struct omap_dss_device *omapdss_display_get(struct omap_dss_device *output)
-{
-	while (output->next)
-		output = output->next;
-
-	return omapdss_device_get(output);
-}
-EXPORT_SYMBOL_GPL(omapdss_display_get);
-
 int omapdss_display_get_modes(struct drm_connector *connector,
 			      const struct videomode *vm)
 {
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 64aedc50cb0b..6ecbc7273032 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -432,7 +432,6 @@ static inline bool omapdss_is_initialized(void)
 }
 
 void omapdss_display_init(struct omap_dss_device *dssdev);
-struct omap_dss_device *omapdss_display_get(struct omap_dss_device *output);
 int omapdss_display_get_modes(struct drm_connector *connector,
 			      const struct videomode *vm);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index e6a065030523..cdafd7ef1c32 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -207,11 +207,12 @@ static int omap_display_id(struct omap_dss_device *output)
 	struct device_node *node = NULL;
 
 	if (output->next) {
-		struct omap_dss_device *display;
+		struct omap_dss_device *display = output;
+
+		while (display->next)
+			display = display->next;
 
-		display = omapdss_display_get(output);
 		node = display->dev->of_node;
-		omapdss_device_put(display);
 	} else if (output->bridge) {
 		struct drm_bridge *bridge = output->bridge;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
