Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12831E18C4
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA3889CC4;
	Tue, 26 May 2020 01:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75E489CC9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:31 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F1AAE28;
 Tue, 26 May 2020 03:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455728;
 bh=QKlcKwFQJdG75/rEwggBUXyEhxL/pMX2ebHUG0GEZ28=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LSVpOeqtIqZk1MoazTBVGSkbo1z6VFzdXSTRiEy+dvjYmdYnCudywim+TeyJ0l1YU
 zZBkomseTiDLaPoJ9pDPJZssw0nwIXTSqcXv8KrbZfwgtCB4c2JcCHcDxpNim+clib
 oKoITPqt7sqgnVhW3VFutOA98y6yCn/purjeRd20=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/27] drm: bridge: Return NULL on error from
 drm_bridge_get_edid()
Date: Tue, 26 May 2020 04:14:43 +0300
Message-Id: <20200526011505.31884-6-laurent.pinchart+renesas@ideasonboard.com>
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

The drm_bridge_get_edid() function is documented to return an error
pointer on error. The underlying .get_edid() operation, however, returns
NULL on error, and so do the drm_get_edid() and drm_do_get_edid()
functions upon which .get_edid() is usually implemented. Make
drm_bridge_get_edid() return NULL on error to be consistent.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 10 +++++++---
 drivers/gpu/drm/drm_bridge.c       |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index e3eb6364c0f7..f065a96a0917 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -51,11 +51,15 @@ static int tfp410_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int ret;
 
-	edid = drm_bridge_get_edid(dvi->next_bridge, connector);
-	if (IS_ERR_OR_NULL(edid)) {
-		if (edid != ERR_PTR(-ENOTSUPP))
+	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
+		edid = drm_bridge_get_edid(dvi->next_bridge, connector);
+		if (!edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
+	} else {
+		edid = NULL;
+	}
 
+	if (!edid) {
 		/*
 		 * No EDID, fallback on the XGA standard modes and prefer a mode
 		 * pretty much anything can handle.
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index afdec8e5fc68..fe1e3460b486 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1086,16 +1086,16 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
  *
  * If the bridge supports output EDID retrieval, as reported by the
  * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
- * get the EDID and return it. Otherwise return ERR_PTR(-ENOTSUPP).
+ * get the EDID and return it. Otherwise return NULL.
  *
  * RETURNS:
- * The retrieved EDID on success, or an error pointer otherwise.
+ * The retrieved EDID on success, or NULL otherwise.
  */
 struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
 				 struct drm_connector *connector)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
-		return ERR_PTR(-ENOTSUPP);
+		return NULL;
 
 	return bridge->funcs->get_edid(bridge, connector);
 }
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
