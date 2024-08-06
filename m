Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8624D949210
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6791E10E36D;
	Tue,  6 Aug 2024 13:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JsJUECnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C72F10E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:51:03 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 388B8922;
 Tue,  6 Aug 2024 15:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722952209;
 bh=ZjLNaR+u/G8uON1P2WcHYHGgw/Rr1V87B+mZrIVeHRk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JsJUECnzteuFb9xN6LSOopSJG2SGhWFOQP2fRZFnatCojJHbMvE/uPX0wY5737jJ+
 Hxt9jf2jj35i6G4ifOXvnc3trtpq6GT2kD9xSQ53fp5VTVpjw7JUcABbKIPgcpPXu9
 qgqFL8R6kb+ppnWXAwzOahcQIjbQe0Ndfn5CYKw4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 06 Aug 2024 16:50:27 +0300
Subject: [PATCH 1/3] drm/omap: Fix possible NULL dereference
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-omapdrm-misc-fixes-v1-1-15d31aea0831@ideasonboard.com>
References: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
In-Reply-To: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4830;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ZjLNaR+u/G8uON1P2WcHYHGgw/Rr1V87B+mZrIVeHRk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmsipDPPj1reZjT33lXW0RLkLAmOPG8g+/b7uBo
 9OMSsJrAz6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZrIqQwAKCRD6PaqMvJYe
 9fuREACu9oLCpfzakd42DZGQyNwffex1cH3W8LhQR3ir800cIiXHbZDsrAcwe7vFUE8FJnMIUia
 ZNLSv8+bXkinIZccO4N+Kf+sgH26ew0UlOcrXOrRTtGCL3dQVLyUmYTDjofNRTquGbi2Y05KdCM
 ltmIhDJfNaZDKUOtRh97eE4mYmfcHegD0dzxCV7T8dAXFKjoMClL1iUXzfqO6wYYTppF+Zbt6cv
 bvN4btA6x4TQ0HyA87Zh65KvwhJpfoUCAL4vOlmbYkcrXCjxkPwoMqmARlbLthO9OqWtEYmuqUt
 tUR8ZbrqiyQGD+RRVp0CfzUg5Zb8h9njTNDQBcX6g+KWoOXqlgKMWUbXBrudnDaTuVP07jmzIDg
 siM0/efoujtfedgHi5abQYlJYuHIkcNvdztTqSrvlj0kbMPBGJ6Iqa9JLQgQaxrv7wKG5TGeqiL
 YYQ0M35pv9g29qq8ukr8hXp6KO+6yk+3BEB7fXaStZIAfz02NP+e/iI1IRPoy1EWpiwdc99UOZW
 BnZqu4nmrzkj5aQmbXka3Eq0PBlJaeEYsYBpveHFaVt65va3EMfn7b+Y40jJEBwK0pU/SRwnxMT
 irCv5hSLQt+GNtChArWsGVuYEpR9hrd2KWczt33nfIV7dTLiaMBMaHht6IfIfbEJGl63Jw4PB89
 655WI6TWWnnHrTA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports:

drivers/gpu/drm/omapdrm/dss/base.c:176 omapdss_device_disconnect() error: we previously assumed 'src' could be null (see line 169)

This code is mostly from a time when omapdrm had its own display device
model. I can't honestly remember the details, and I don't think it's
worth digging in deeply into that for a legacy driver.

However, it looks like we only call omapdss_device_disconnect() and
omapdss_device_connect() with NULL as the src parameter. We can thus
drop the src parameter from both functions, and fix the smatch warning.

I don't think omapdss_device_disconnect() ever gets NULL for the dst
parameter (if it did, we'd crash soon after returning from the
function), but I have kept the !dst check, just in case, but I added a
WARN_ON() there.

Also, if the dst parameter can be NULL, we can't always get the struct
dss_device pointer from dst->dss (which is only used for a debug print).
To make sure we can't hit that issue, do it similarly to the
omapdss_device_connect() function: add 'struct dss_device *dss' as the
first parameter, so that we always have it regardless of the dst.

Fixes: 79107f274b2f ("drm/omap: Add support for drm_bridge")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 25 ++++++-------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  3 +--
 drivers/gpu/drm/omapdrm/omap_drv.c    |  4 ++--
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index 050ca7eafac5..556e0f9026be 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -139,21 +139,13 @@ static bool omapdss_device_is_connected(struct omap_dss_device *dssdev)
 }
 
 int omapdss_device_connect(struct dss_device *dss,
-			   struct omap_dss_device *src,
 			   struct omap_dss_device *dst)
 {
-	dev_dbg(&dss->pdev->dev, "connect(%s, %s)\n",
-		src ? dev_name(src->dev) : "NULL",
+	dev_dbg(&dss->pdev->dev, "connect(%s)\n",
 		dst ? dev_name(dst->dev) : "NULL");
 
-	if (!dst) {
-		/*
-		 * The destination is NULL when the source is connected to a
-		 * bridge instead of a DSS device. Stop here, we will attach
-		 * the bridge later when we will have a DRM encoder.
-		 */
-		return src && src->bridge ? 0 : -EINVAL;
-	}
+	if (!dst)
+		return -EINVAL;
 
 	if (omapdss_device_is_connected(dst))
 		return -EBUSY;
@@ -163,19 +155,14 @@ int omapdss_device_connect(struct dss_device *dss,
 	return 0;
 }
 
-void omapdss_device_disconnect(struct omap_dss_device *src,
+void omapdss_device_disconnect(struct dss_device *dss,
 			       struct omap_dss_device *dst)
 {
-	struct dss_device *dss = src ? src->dss : dst->dss;
-
-	dev_dbg(&dss->pdev->dev, "disconnect(%s, %s)\n",
-		src ? dev_name(src->dev) : "NULL",
+	dev_dbg(&dss->pdev->dev, "disconnect(%s)\n",
 		dst ? dev_name(dst->dev) : "NULL");
 
-	if (!dst) {
-		WARN_ON(!src->bridge);
+	if (WARN_ON(!dst))
 		return;
-	}
 
 	if (!dst->id && !omapdss_device_is_connected(dst)) {
 		WARN_ON(1);
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 040d5a3e33d6..4c22c09c93d5 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -242,9 +242,8 @@ struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssdev);
 void omapdss_device_put(struct omap_dss_device *dssdev);
 struct omap_dss_device *omapdss_find_device_by_node(struct device_node *node);
 int omapdss_device_connect(struct dss_device *dss,
-			   struct omap_dss_device *src,
 			   struct omap_dss_device *dst);
-void omapdss_device_disconnect(struct omap_dss_device *src,
+void omapdss_device_disconnect(struct dss_device *dss,
 			       struct omap_dss_device *dst);
 
 int omap_dss_get_num_overlay_managers(void);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 6598c9c08ba1..d80d24fce79f 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -307,7 +307,7 @@ static void omap_disconnect_pipelines(struct drm_device *ddev)
 	for (i = 0; i < priv->num_pipes; i++) {
 		struct omap_drm_pipeline *pipe = &priv->pipes[i];
 
-		omapdss_device_disconnect(NULL, pipe->output);
+		omapdss_device_disconnect(priv->dss, pipe->output);
 
 		omapdss_device_put(pipe->output);
 		pipe->output = NULL;
@@ -325,7 +325,7 @@ static int omap_connect_pipelines(struct drm_device *ddev)
 	int r;
 
 	for_each_dss_output(output) {
-		r = omapdss_device_connect(priv->dss, NULL, output);
+		r = omapdss_device_connect(priv->dss, output);
 		if (r == -EPROBE_DEFER) {
 			omapdss_device_put(output);
 			return r;

-- 
2.43.0

