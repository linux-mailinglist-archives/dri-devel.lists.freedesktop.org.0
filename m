Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B68249C5B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8876E277;
	Wed, 19 Aug 2020 11:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EC36E239
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AB7022CBE;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=KWEjyOM9tGVg0C0GKN7wS+Us7AJUfqxVGXkNhaLsaFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2d6+ikCj4LW5e3rFscEobFJq1KoViLK1P0gNhihXFho2fRmADWQr/SChXiAHy7orM
 Ir6t3VQNoQIrriwpqIkKmwpdZaQFJ1R3AWntjBaBsUYFoyqOWCRo6gi0iEU1/frgJm
 bVJ6Yurcogb1CYrklGrGIh5Pmnjd0lT+Ow3LbpfM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Eub2-CZ; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 25/49] staging: hikey9xx/gpu: do some code cleanups
Date: Wed, 19 Aug 2020 13:45:53 +0200
Message-Id: <9fa944021373ec5b82c2c1e118c15d9effe7f964.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Get rid of a global var meant to store one of its priv
  structs;
- Change the name of the driver, in order to not be confused with
  the kirin6220;
- Remove some unneeded ifdef;
- use drm_of.h helper.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   | 81 +++++++------------
 1 file changed, 30 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index fee686760c78..cede6ccc2dd5 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -25,20 +25,22 @@
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "kirin9xx_drm_drv.h"
 
-static struct kirin_dc_ops *dc_ops;
-
 static int kirin_drm_kms_cleanup(struct drm_device *dev)
 {
 	struct kirin_drm_private *priv = dev->dev_private;
+	static struct kirin_dc_ops const *dc_ops;
 
 	if (priv->fbdev)
 		priv->fbdev = NULL;
 
+	dc_ops = of_device_get_match_data(dev->dev);
+
 	drm_kms_helper_poll_fini(dev);
 	dc_ops->cleanup(dev);
 	drm_mode_config_cleanup(dev);
@@ -78,6 +80,7 @@ static void kirin_drm_mode_config_init(struct drm_device *dev)
 static int kirin_drm_kms_init(struct drm_device *dev)
 {
 	struct kirin_drm_private *priv = dev->dev_private;
+	static struct kirin_dc_ops const *dc_ops;
 	int ret;
 
 	priv = devm_kzalloc(dev->dev, sizeof(*priv), GFP_KERNEL);
@@ -92,6 +95,7 @@ static int kirin_drm_kms_init(struct drm_device *dev)
 	kirin_drm_mode_config_init(dev);
 
 	/* display controller init */
+	dc_ops = of_device_get_match_data(dev->dev);
 	ret = dc_ops->init(dev);
 	if (ret)
 		goto err_mode_config_cleanup;
@@ -209,27 +213,17 @@ static struct drm_driver kirin_drm_driver = {
 	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
 
-	.name			= "kirin",
-	.desc			= "Hisilicon Kirin SoCs' DRM Driver",
+	.name			= "kirin9xx",
+	.desc			= "Hisilicon Kirin9xx SoCs' DRM Driver",
 	.date			= "20170309",
 	.major			= 1,
 	.minor			= 0,
 };
 
-#ifdef CONFIG_OF
-/* NOTE: the CONFIG_OF case duplicates the same code as exynos or imx
- * (or probably any other).. so probably some room for some helpers
- */
 static int compare_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
 }
-#else
-static int compare_dev(struct device *dev, void *data)
-{
-	return dev == data;
-}
-#endif
 
 static int kirin_drm_bind(struct device *dev)
 {
@@ -288,57 +282,30 @@ static const struct component_master_ops kirin_drm_ops = {
 	.unbind = kirin_drm_unbind,
 };
 
-static struct device_node *kirin_get_remote_node(struct device_node *np)
-{
-	struct device_node *endpoint, *remote;
-
-	/* get the first endpoint, in our case only one remote node
-	 * is connected to display controller.
-	 */
-	endpoint = of_graph_get_next_endpoint(np, NULL);
-	if (!endpoint) {
-		DRM_ERROR("no valid endpoint node\n");
-		return ERR_PTR(-ENODEV);
-	}
-	of_node_put(endpoint);
-
-	remote = of_graph_get_remote_port_parent(endpoint);
-	if (!remote) {
-		DRM_ERROR("no valid remote node\n");
-		return ERR_PTR(-ENODEV);
-	}
-	of_node_put(remote);
-
-	if (!of_device_is_available(remote)) {
-		DRM_ERROR("not available for remote node\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	return remote;
-}
-
 static int kirin_drm_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct component_match *match = NULL;
 	struct device_node *remote;
+	static struct kirin_dc_ops const *dc_ops;
 	int ret;
 
-	dc_ops = (struct kirin_dc_ops *)of_device_get_match_data(dev);
+	dc_ops = of_device_get_match_data(dev);
 	if (!dc_ops) {
 		DRM_ERROR("failed to get dt id data\n");
 		return -EINVAL;
 	}
 
 	DRM_INFO("the device node is %s\n", np->name);
-	remote = kirin_get_remote_node(np);
-	if (IS_ERR(remote))
-		return PTR_ERR(remote);
+	remote = of_graph_get_remote_node(np, 0, 0);
+	if (!remote)
+		return -ENODEV;
 
 	DRM_INFO("the device remote node is %s\n", remote->name);
 
-	component_match_add(dev, &match, compare_of, remote);
+	drm_of_component_match_add(dev, &match, compare_of, remote);
+	of_node_put(remote);
 
 	if (ret)
 		DRM_ERROR("cma device init failed!");
@@ -347,13 +314,20 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 
 static int kirin_drm_platform_remove(struct platform_device *pdev)
 {
+	static struct kirin_dc_ops const *dc_ops;
+
+	dc_ops = of_device_get_match_data(&pdev->dev);
 	component_master_del(&pdev->dev, &kirin_drm_ops);
-	dc_ops = NULL;
 	return 0;
 }
 
 static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t state)
 {
+	static struct kirin_dc_ops const *dc_ops;
+	struct device *dev = &pdev->dev;
+
+	dc_ops = of_device_get_match_data(dev);
+
 	DRM_INFO("+. pdev->name is %s, m_message is %d \n", pdev->name, state.event);
 	if (!dc_ops) {
 		DRM_ERROR("dc_ops is NULL\n");
@@ -366,6 +340,11 @@ static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t
 
 static int kirin_drm_platform_resume(struct platform_device *pdev)
 {
+	static struct kirin_dc_ops const *dc_ops;
+	struct device *dev = &pdev->dev;
+
+	dc_ops = of_device_get_match_data(dev);
+
 	if (!dc_ops) {
 		DRM_ERROR("dc_ops is NULL\n");
 		return -EINVAL;
@@ -376,7 +355,7 @@ static int kirin_drm_platform_resume(struct platform_device *pdev)
 }
 
 static const struct of_device_id kirin_drm_dt_ids[] = {
-	{ .compatible = "hisilicon,hi3660-dpe",
+	{ .compatible = "hisilicon,kirin960-dpe",
 	  .data = &dss_dc_ops,
 	},
 	{ .compatible = "hisilicon,kirin970-dpe",
@@ -392,7 +371,7 @@ static struct platform_driver kirin_drm_platform_driver = {
 	.suspend = kirin_drm_platform_suspend,
 	.resume = kirin_drm_platform_resume,
 	.driver = {
-		.name = "kirin-drm",
+		.name = "kirin9xx-drm",
 		.of_match_table = kirin_drm_dt_ids,
 	},
 };
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
