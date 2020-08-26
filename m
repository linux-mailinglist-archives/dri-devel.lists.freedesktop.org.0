Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6F253E70
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9E56EB5F;
	Thu, 27 Aug 2020 06:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213076EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 21:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598479127; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=bRCp5vcWTky3iTd5PZ1Z6XLTrhMKj3XeGXpN/nxGfeI=;
 b=hY4vPD5GE+0PDSFtB4yHUAnRiuQli9jupWKrivpuPhvhOxGe+DkVuJabYstRjHvFTqmeDD
 k5Liu+qzUlm6IXouOMy+iWQhlQ5S+LKuzTfYGgoaY6E8ldC1VZ2QK9IbVXblUg4eL1k9xF
 6xk4L47EhZDgnJgHNEUTErkxREIDv5g=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/ingenic: Fix driver not probing when IPU port is missing
Date: Wed, 26 Aug 2020 23:58:41 +0200
Message-Id: <20200826215841.131707-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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

Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index ada990a7f911..216b67f1672e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -673,6 +673,18 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
+static inline struct device_node *ingenic_drm_get_ipu_node(struct device *dev)
+{
+	/* IPU is at port address 8 */
+	return of_graph_get_remote_node(dev->of_node, 8, 0);
+}
+
+static inline bool ingenic_drm_has_ipu(struct device *dev)
+{
+	return IS_ENABLED(CONFIG_DRM_INGENIC_IPU) &&
+		!!ingenic_drm_get_ipu_node(dev);
+}
+
 static int ingenic_drm_bind(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -808,7 +820,7 @@ static int ingenic_drm_bind(struct device *dev)
 			return ret;
 		}
 
-		if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
+		if (ingenic_drm_has_ipu(dev)) {
 			ret = component_bind_all(dev, drm);
 			if (ret) {
 				if (ret != -EPROBE_DEFER)
@@ -970,12 +982,9 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		return ingenic_drm_bind(dev);
 
-	/* IPU is at port address 8 */
-	np = of_graph_get_remote_node(dev->of_node, 8, 0);
-	if (!np) {
-		dev_err(dev, "Unable to get IPU node\n");
-		return -EINVAL;
-	}
+	np = ingenic_drm_get_ipu_node(dev);
+	if (!np)
+		return ingenic_drm_bind(dev);
 
 	drm_of_component_match_add(dev, &match, compare_of, np);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
