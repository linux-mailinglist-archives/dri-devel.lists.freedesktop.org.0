Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426374FFB3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 08:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D95110E499;
	Wed, 12 Jul 2023 06:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E6F710E499
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 06:49:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1CF82F4;
 Tue, 11 Jul 2023 23:50:32 -0700 (PDT)
Received: from R913NWR2.arm.com (unknown [10.163.48.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6FFD93F67D;
 Tue, 11 Jul 2023 23:49:48 -0700 (PDT)
From: Faiz Abbas <faiz.abbas@arm.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/arm/komeda: Remove component framework and add a
 simple encoder
Date: Wed, 12 Jul 2023 12:19:37 +0530
Message-Id: <20230712064937.25192-1-faiz.abbas@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: faiz.abbas@arm.com, liviu.dudau@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Komeda driver always expects the remote connector node to initialize
an encoder. It uses the component aggregator framework which consists
of component->bind() calls used to initialize the remote encoder and attach
it to the crtc. This makes it incompatible with connector drivers which
implement drm_bridge APIs.

Remove all component framework calls from the komeda driver and declare and
attach an encoder inside komeda_crtc_add().

The remote connector driver has to implement the DRM bridge APIs which
can be used to glue the encoder to the remote connector. Since we
usually pair this with a component encoder that also implements a
drm_bridge, dropping support is not expected to affect users of this
driver.

Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
---
v3 -> v2:
* Rebased to latest drm-misc-next

v2 -> v1:

* Removed additional instances of component APIs

 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 23 +++++++-
 .../gpu/drm/arm/display/komeda/komeda_drv.c   | 55 ++-----------------
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 11 +---
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  3 +
 4 files changed, 30 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index cea3fd5772b57..b615d625c244f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -12,6 +12,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_bridge.h>
 
 #include "komeda_dev.h"
 #include "komeda_kms.h"
@@ -612,9 +614,11 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 			   struct komeda_crtc *kcrtc)
 {
 	struct drm_crtc *crtc = &kcrtc->base;
+	struct drm_device *base = &kms->base;
+	struct drm_bridge *bridge;
 	int err;
 
-	err = drm_crtc_init_with_planes(&kms->base, crtc,
+	err = drm_crtc_init_with_planes(base, crtc,
 					get_crtc_primary(kms, kcrtc), NULL,
 					&komeda_crtc_funcs, NULL);
 	if (err)
@@ -624,6 +628,23 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 
 	crtc->port = kcrtc->master->of_output_port;
 
+
+	/* Construct an encoder for each pipeline and attach it to the remote
+	 * bridge
+	 */
+	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
+	err = drm_simple_encoder_init(base, &kcrtc->encoder,
+				      DRM_MODE_ENCODER_TMDS);
+	if (err)
+		return err;
+
+	bridge = devm_drm_of_get_bridge(base->dev, kcrtc->master->of_node,
+					KOMEDA_OF_PORT_OUTPUT, 0);
+	if (IS_ERR(bridge))
+		return PTR_ERR(bridge);
+
+	err = drm_bridge_attach(&kcrtc->encoder, bridge, NULL, 0);
+
 	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
 
 	return err;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index c597c362f6892..cb2a2be24c5ff 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -8,7 +8,6 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/component.h>
 #include <linux/pm_runtime.h>
 #include <drm/drm_fbdev_generic.h>
 #include <drm/drm_module.h>
@@ -28,13 +27,11 @@ struct komeda_dev *dev_to_mdev(struct device *dev)
 	return mdrv ? mdrv->mdev : NULL;
 }
 
-static void komeda_unbind(struct device *dev)
+static void komeda_platform_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct komeda_drv *mdrv = dev_get_drvdata(dev);
 
-	if (!mdrv)
-		return;
-
 	komeda_kms_detach(mdrv->kms);
 
 	if (pm_runtime_enabled(dev))
@@ -48,8 +45,9 @@ static void komeda_unbind(struct device *dev)
 	devm_kfree(dev, mdrv);
 }
 
-static int komeda_bind(struct device *dev)
+static int komeda_platform_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct komeda_drv *mdrv;
 	int err;
 
@@ -91,51 +89,6 @@ static int komeda_bind(struct device *dev)
 	return err;
 }
 
-static const struct component_master_ops komeda_master_ops = {
-	.bind	= komeda_bind,
-	.unbind	= komeda_unbind,
-};
-
-static void komeda_add_slave(struct device *master,
-			     struct component_match **match,
-			     struct device_node *np,
-			     u32 port, u32 endpoint)
-{
-	struct device_node *remote;
-
-	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (remote) {
-		drm_of_component_match_add(master, match, component_compare_of, remote);
-		of_node_put(remote);
-	}
-}
-
-static int komeda_platform_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct component_match *match = NULL;
-	struct device_node *child;
-
-	if (!dev->of_node)
-		return -ENODEV;
-
-	for_each_available_child_of_node(dev->of_node, child) {
-		if (of_node_cmp(child->name, "pipeline") != 0)
-			continue;
-
-		/* add connector */
-		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 0);
-		komeda_add_slave(dev, &match, child, KOMEDA_OF_PORT_OUTPUT, 1);
-	}
-
-	return component_master_add_with_match(dev, &komeda_master_ops, match);
-}
-
-static void komeda_platform_remove(struct platform_device *pdev)
-{
-	component_master_del(&pdev->dev, &komeda_master_ops);
-}
-
 static const struct of_device_id komeda_of_match[] = {
 	{ .compatible = "arm,mali-d71", .data = d71_identify, },
 	{ .compatible = "arm,mali-d32", .data = d71_identify, },
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
index 62dc64550793e..9299026701f34 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
@@ -4,7 +4,6 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
-#include <linux/component.h>
 #include <linux/interrupt.h>
 
 #include <drm/drm_atomic.h>
@@ -305,17 +304,13 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 	if (err)
 		goto cleanup_mode_config;
 
-	err = component_bind_all(mdev->dev, kms);
-	if (err)
-		goto cleanup_mode_config;
-
 	drm_mode_config_reset(drm);
 
 	err = devm_request_irq(drm->dev, mdev->irq,
 			       komeda_kms_irq_handler, IRQF_SHARED,
 			       drm->driver->name, drm);
 	if (err)
-		goto free_component_binding;
+		goto cleanup_mode_config;
 
 	drm_kms_helper_poll_init(drm);
 
@@ -327,8 +322,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 
 free_interrupts:
 	drm_kms_helper_poll_fini(drm);
-free_component_binding:
-	component_unbind_all(mdev->dev, drm);
 cleanup_mode_config:
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
@@ -339,12 +332,10 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
 void komeda_kms_detach(struct komeda_kms_dev *kms)
 {
 	struct drm_device *drm = &kms->base;
-	struct komeda_dev *mdev = drm->dev_private;
 
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-	component_unbind_all(mdev->dev, drm);
 	drm_mode_config_cleanup(drm);
 	komeda_kms_cleanup_private_objs(kms);
 	drm->dev_private = NULL;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
index 3a872c2920912..6ef6553263570 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.h
@@ -84,6 +84,9 @@ struct komeda_crtc {
 
 	/** @disable_done: this flip_done is for tracing the disable */
 	struct completion *disable_done;
+
+	/** @encoder: encoder at the end of the pipeline */
+	struct drm_encoder encoder;
 };
 
 /**
-- 
2.25.1

