Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE325552B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CD06E2D5;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FD16E423
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598528653; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaXO/FHoFYfgXhxVRq9pV9SMEDuKES3g1VebrWz0buI=;
 b=n2YHnww1LEhzxT1imiV3w0YTWRTyD1v56Sum2sZyzWs4tiwlhplZsosAq+Kd8elGfdOXD6
 /zva/HE8BKHUu9FhJylGX7G78PxmwcFxbFv4k3BGHSGCAIcSmPJEZFPeWrdGTR/nymnzqh
 zaqwvZgFDmPcDI4hBpvic0KVkiVL8cM=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/ingenic: Fix driver not probing when IPU port is
 missing
Date: Thu, 27 Aug 2020 13:44:04 +0200
Message-Id: <20200827114404.36748-2-paul@crapouillou.net>
In-Reply-To: <20200827114404.36748-1-paul@crapouillou.net>
References: <20200827114404.36748-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even if support for the IPU was compiled in, we may run on a device
(e.g. the Qi LB60) where the IPU is not available, or simply with an old
devicetree without the IPU node. In that case the ingenic-drm refused to
probe.

Fix the driver so that it will probe even if the IPU node is not present
in devicetree (but then IPU support is disabled of course).

v2: Take a different approach

Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index c1bcb93aed2d..b7074161ccf0 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -673,7 +673,7 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
-static int ingenic_drm_bind(struct device *dev)
+static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	const struct jz_soc_info *soc_info;
@@ -808,7 +808,7 @@ static int ingenic_drm_bind(struct device *dev)
 			return ret;
 		}
 
-		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
+		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && has_components) {
 			ret = component_bind_all(dev, drm);
 			if (ret) {
 				if (ret != -EPROBE_DEFER)
@@ -939,6 +939,11 @@ static int ingenic_drm_bind(struct device *dev)
 	return ret;
 }
 
+static int ingenic_drm_bind_with_components(struct device *dev)
+{
+	return ingenic_drm_bind(dev, true);
+}
+
 static int compare_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -957,7 +962,7 @@ static void ingenic_drm_unbind(struct device *dev)
 }
 
 static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind,
+	.bind = ingenic_drm_bind_with_components,
 	.unbind = ingenic_drm_unbind,
 };
 
@@ -968,14 +973,12 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	struct device_node *np;
 
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
-		return ingenic_drm_bind(dev);
+		return ingenic_drm_bind(dev, false);
 
 	/* IPU is at port address 8 */
 	np = of_graph_get_remote_node(dev->of_node, 8, 0);
-	if (!np) {
-		dev_err(dev, "Unable to get IPU node\n");
-		return -EINVAL;
-	}
+	if (!np)
+		return ingenic_drm_bind(dev, false);
 
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
