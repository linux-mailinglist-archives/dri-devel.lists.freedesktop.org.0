Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F73E3A95
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480689AB5;
	Sun,  8 Aug 2021 13:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1AE89AB5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:46:17 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 4/8] drm/ingenic: Add support for private objects
Date: Sun,  8 Aug 2021 15:45:22 +0200
Message-Id: <20210808134526.119198-5-paul@crapouillou.net>
In-Reply-To: <20210808134526.119198-1-paul@crapouillou.net>
References: <20210808134526.119198-1-paul@crapouillou.net>
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
index 3ed7c27a8dde..3fc01cffb00f 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -63,6 +63,10 @@ struct jz_soc_info {
 	unsigned int num_formats_f0, num_formats_f1;
 };
 
+struct ingenic_drm_private_state {
+	struct drm_private_state base;
+};
+
 struct ingenic_drm {
 	struct drm_device drm;
 	/*
@@ -98,8 +102,16 @@ struct ingenic_drm {
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
@@ -769,6 +781,28 @@ ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
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
@@ -839,6 +873,11 @@ static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
+static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
+	.atomic_duplicate_state = ingenic_drm_duplicate_state,
+	.atomic_destroy_state = ingenic_drm_destroy_state,
+};
+
 static void ingenic_drm_unbind_all(void *d)
 {
 	struct ingenic_drm *priv = d;
@@ -851,9 +890,15 @@ static void __maybe_unused ingenic_drm_release_rmem(void *d)
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
@@ -1132,6 +1177,20 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
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
@@ -1142,6 +1201,8 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	return 0;
 
+err_private_state_free:
+	kfree(private_state);
 err_clk_notifier_unregister:
 	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 err_devclk_disable:
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index aeb8a757d213..c819293b8317 100644
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
@@ -679,6 +691,33 @@ static const struct drm_plane_funcs ingenic_ipu_plane_funcs = {
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
@@ -717,6 +756,7 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
 static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct ingenic_ipu_private_state *private_state;
 	const struct soc_info *soc_info;
 	struct drm_device *drm = d;
 	struct drm_plane *plane;
@@ -810,7 +850,20 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
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
@@ -818,6 +871,7 @@ static void ingenic_ipu_unbind(struct device *dev,
 {
 	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
 
+	drm_atomic_private_obj_fini(&ipu->private_obj);
 	clk_unprepare(ipu->clk);
 }
 
-- 
2.30.2

