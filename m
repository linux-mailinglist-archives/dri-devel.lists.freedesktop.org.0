Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B439391E
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C00F6F504;
	Thu, 27 May 2021 23:21:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDDB6F504
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:21:32 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 03/11] drm/ingenic: Add support for private objects
Date: Fri, 28 May 2021 00:20:57 +0100
Message-Id: <20210527232104.152577-4-paul@crapouillou.net>
In-Reply-To: <20210527232104.152577-1-paul@crapouillou.net>
References: <20210527232104.152577-1-paul@crapouillou.net>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now, the ingenic-drm as well as the ingenic-ipu drivers used to
put state-specific information in their respective private structure.

Add boilerplate code to support private objects in the two drivers, so
that state-specific information can be put in the state-specific private
structure.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 61 +++++++++++++++++++++++
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 54 ++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 4e41bdf2f3fd..e81084eb3b0e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -64,6 +64,10 @@ struct jz_soc_info {
 	unsigned int num_formats_f0, num_formats_f1;
 };
 
+struct ingenic_drm_private_state {
+	struct drm_private_state base;
+};
+
 struct ingenic_drm {
 	struct drm_device drm;
 	/*
@@ -99,8 +103,16 @@ struct ingenic_drm {
 	struct mutex clk_mutex;
 	bool update_clk_rate;
 	struct notifier_block clock_nb;
+
+	struct drm_private_obj private_obj;
 };
 
+static inline struct ingenic_drm_private_state *
+to_ingenic_drm_priv_state(struct drm_private_state *state)
+{
+	return container_of(state, struct ingenic_drm_private_state, base);
+}
+
 static bool ingenic_drm_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -790,6 +802,28 @@ ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
 	return &obj->base;
 }
 
+static struct drm_private_state *
+ingenic_drm_duplicate_state(struct drm_private_obj *obj)
+{
+	struct ingenic_drm_private_state *state = to_ingenic_drm_priv_state(obj->state);
+
+	state = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
+				      struct drm_private_state *state)
+{
+	struct ingenic_drm_private_state *priv_state = to_ingenic_drm_priv_state(state);
+
+	kfree(priv_state);
+}
+
 DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
@@ -863,6 +897,11 @@ static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
 };
 
+static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
+	.atomic_duplicate_state = ingenic_drm_duplicate_state,
+	.atomic_destroy_state = ingenic_drm_destroy_state,
+};
+
 static void ingenic_drm_unbind_all(void *d)
 {
 	struct ingenic_drm *priv = d;
@@ -875,9 +914,15 @@ static void __maybe_unused ingenic_drm_release_rmem(void *d)
 	of_reserved_mem_device_release(d);
 }
 
+static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *private_obj)
+{
+	drm_atomic_private_obj_fini(private_obj);
+}
+
 static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ingenic_drm_private_state *private_state;
 	const struct jz_soc_info *soc_info;
 	struct ingenic_drm *priv;
 	struct clk *parent_clk;
@@ -1158,6 +1203,20 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 		goto err_devclk_disable;
 	}
 
+	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
+	if (!private_state) {
+		ret = -ENOMEM;
+		goto err_clk_notifier_unregister;
+	}
+
+	drm_atomic_private_obj_init(drm, &priv->private_obj, &private_state->base,
+				    &ingenic_drm_private_state_funcs);
+
+	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
+				       &priv->private_obj);
+	if (ret)
+		goto err_private_state_free;
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver\n");
@@ -1168,6 +1227,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	return 0;
 
+err_private_state_free:
+	kfree(private_state);
 err_clk_notifier_unregister:
 	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 err_devclk_disable:
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 61b6d9fdbba1..007cd547b285 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -45,6 +45,10 @@ struct soc_info {
 			  unsigned int weight, unsigned int offset);
 };
 
+struct ingenic_ipu_private_state {
+	struct drm_private_state base;
+};
+
 struct ingenic_ipu {
 	struct drm_plane plane;
 	struct drm_device *drm;
@@ -60,6 +64,8 @@ struct ingenic_ipu {
 
 	struct drm_property *sharpness_prop;
 	unsigned int sharpness;
+
+	struct drm_private_obj private_obj;
 };
 
 /* Signed 15.16 fixed-point math (for bicubic scaling coefficients) */
@@ -73,6 +79,12 @@ static inline struct ingenic_ipu *plane_to_ingenic_ipu(struct drm_plane *plane)
 	return container_of(plane, struct ingenic_ipu, plane);
 }
 
+static inline struct ingenic_ipu_private_state *
+to_ingenic_ipu_priv_state(struct drm_private_state *state)
+{
+	return container_of(state, struct ingenic_ipu_private_state, base);
+}
+
 /*
  * Apply conventional cubic convolution kernel. Both parameters
  *  and return value are 15.16 signed fixed-point.
@@ -680,6 +692,33 @@ static const struct drm_plane_funcs ingenic_ipu_plane_funcs = {
 	.atomic_set_property	= ingenic_ipu_plane_atomic_set_property,
 };
 
+static struct drm_private_state *
+ingenic_ipu_duplicate_state(struct drm_private_obj *obj)
+{
+	struct ingenic_ipu_private_state *state = to_ingenic_ipu_priv_state(obj->state);
+
+	state = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void ingenic_ipu_destroy_state(struct drm_private_obj *obj,
+				      struct drm_private_state *state)
+{
+	struct ingenic_ipu_private_state *priv_state = to_ingenic_ipu_priv_state(state);
+
+	kfree(priv_state);
+}
+
+static const struct drm_private_state_funcs ingenic_ipu_private_state_funcs = {
+	.atomic_duplicate_state = ingenic_ipu_duplicate_state,
+	.atomic_destroy_state = ingenic_ipu_destroy_state,
+};
+
 static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
 {
 	struct ingenic_ipu *ipu = arg;
@@ -718,6 +757,7 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
 static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ingenic_ipu_private_state *private_state;
 	const struct soc_info *soc_info;
 	struct drm_device *drm = d;
 	struct drm_plane *plane;
@@ -811,7 +851,20 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 		return err;
 	}
 
+	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
+	if (!private_state) {
+		err = -ENOMEM;
+		goto err_clk_unprepare;
+	}
+
+	drm_atomic_private_obj_init(drm, &ipu->private_obj, &private_state->base,
+				    &ingenic_ipu_private_state_funcs);
+
 	return 0;
+
+err_clk_unprepare:
+	clk_unprepare(ipu->clk);
+	return err;
 }
 
 static void ingenic_ipu_unbind(struct device *dev,
@@ -819,6 +872,7 @@ static void ingenic_ipu_unbind(struct device *dev,
 {
 	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
 
+	drm_atomic_private_obj_fini(&ipu->private_obj);
 	clk_unprepare(ipu->clk);
 }
 
-- 
2.30.2

