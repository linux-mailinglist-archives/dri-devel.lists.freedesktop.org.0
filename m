Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C61BD92D1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E866B10E5CE;
	Tue, 14 Oct 2025 12:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X18iwwcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A44410E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1075B40B4C;
 Tue, 14 Oct 2025 12:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBDCC4CEE7;
 Tue, 14 Oct 2025 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443242;
 bh=lisukAuBnfd6rhWHBziN9/6MsN/P2e2DwZFVhY6KtHU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X18iwwcjXAwfDkJS+qQDKlEt+jtnCKJoESFZdT5qHcOkhnHB5FHFSI+r93LOKVgg/
 ZF0zaN/c/XXGusXwfedLqt4GS78Lrkg+sYmv42e7YtoPu6uSQ5tFglduygpFhHmqc3
 /QQsmjQva8mNqZN1wDoYsIsD8v10ZwKjkZrkOLXAE1oRTD5txjGGov/Mc9B+KNm8YK
 7TeR0ZPgXOmulfSMsH/6praXHRx0jQ3k0JXXps28Yy3Wb8c+0FjVXWVy7lI1Wbe91y
 CGbJz2CWGP1AVnUEXH5RXkotYHSFL3tf1IvkUO9XedYuxjI3++5KPVZQuYoY7I+D9R
 2vs7etDGf49aQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:54 +0200
Subject: [PATCH v2 10/16] drm/ingenic: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-10-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lisukAuBnfd6rhWHBziN9/6MsN/P2e2DwZFVhY6KtHU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrN211F+HpcZqvXr08PLx7D0+T5sisz/fN/NxdYl+X
 HTiqjJPx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIfAfGOpXlhh3btuu+ZVn7
 d/VjXw2LrMoVOu8XLgq062W291nSVn7u7gn+t3PiVv/+5PGW/70bD2N9SPTyZ6Y1DIZv2R7xPp6
 g4b5XPnfPsaOpbf4XeJIzFPaqB8WtUXuzyvBBIKPSp60xfz8CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The ingenic driver relies on two drm_private_objs, that are initialized
by allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 +++++++++++++++++-----------
 drivers/gpu/drm/ingenic/ingenic-ipu.c     | 28 ++++++++++++++++------------
 2 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 9db1ceaed5188a4ef0897280dc72108eb3815b5f..4aca12de0b16aa56dcd7a5942b868c792b08c9c3 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -947,10 +947,24 @@ static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_drm_private_state *priv_state = to_ingenic_drm_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static struct drm_private_state *
+ingenic_drm_create_state(struct drm_private_obj *obj)
+{
+	struct ingenic_drm_private_state *priv_state;
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &priv_state->base);
+
+	return &priv_state->base;
+}
+
 DEFINE_DRM_GEM_DMA_FOPS(ingenic_drm_fops);
 
 static const struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name			= "ingenic-drm",
@@ -1027,10 +1041,11 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
 static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
+	.atomic_create_state = ingenic_drm_create_state,
 	.atomic_duplicate_state = ingenic_drm_duplicate_state,
 	.atomic_destroy_state = ingenic_drm_destroy_state,
 };
 
 static void ingenic_drm_unbind_all(void *d)
@@ -1080,11 +1095,10 @@ static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *pr
 }
 
 static int ingenic_drm_bind(struct device *dev, bool has_components)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct ingenic_drm_private_state *private_state;
 	const struct jz_soc_info *soc_info;
 	struct ingenic_drm *priv;
 	struct clk *parent_clk;
 	struct drm_plane *primary;
 	struct drm_bridge *bridge;
@@ -1380,23 +1394,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	if (ret) {
 		dev_err(dev, "Unable to register clock notifier\n");
 		goto err_devclk_disable;
 	}
 
-	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
-	if (!private_state) {
-		ret = -ENOMEM;
-		goto err_clk_notifier_unregister;
-	}
-
-	drm_atomic_private_obj_init(drm, &priv->private_obj, &private_state->base,
+	drm_atomic_private_obj_init(drm, &priv->private_obj, NULL,
 				    &ingenic_drm_private_state_funcs);
 
 	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
 				       &priv->private_obj);
 	if (ret)
-		goto err_private_state_free;
+		goto err_clk_notifier_unregister;
 
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register DRM driver\n");
 		goto err_clk_notifier_unregister;
@@ -1404,12 +1412,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
 	drm_client_setup(drm, NULL);
 
 	return 0;
 
-err_private_state_free:
-	kfree(private_state);
 err_clk_notifier_unregister:
 	clk_notifier_unregister(parent_clk, &priv->clock_nb);
 err_devclk_disable:
 	if (priv->lcd_clk)
 		clk_disable_unprepare(priv->lcd_clk);
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index 26ebf424d63ec21ccee80221745c3e8bcc6b3d7f..9af95b775dd6cb1a8ba9a5c32e6dae824453eb7c 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -748,11 +748,26 @@ static void ingenic_ipu_destroy_state(struct drm_private_obj *obj,
 	struct ingenic_ipu_private_state *priv_state = to_ingenic_ipu_priv_state(state);
 
 	kfree(priv_state);
 }
 
+static struct drm_private_state *
+ingenic_ipu_create_state(struct drm_private_obj *obj)
+{
+	struct ingenic_ipu_private_state *priv_state;
+
+	priv_state = kzalloc(sizeof(*priv_state), GFP_KERNEL);
+	if (!priv_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &priv_state->base);
+
+	return &priv_state->base;
+}
+
 static const struct drm_private_state_funcs ingenic_ipu_private_state_funcs = {
+	.atomic_create_state = ingenic_ipu_create_state,
 	.atomic_duplicate_state = ingenic_ipu_duplicate_state,
 	.atomic_destroy_state = ingenic_ipu_destroy_state,
 };
 
 static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
@@ -791,11 +806,10 @@ static const struct regmap_config ingenic_ipu_regmap_config = {
 };
 
 static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct ingenic_ipu_private_state *private_state;
 	const struct soc_info *soc_info;
 	struct drm_device *drm = d;
 	struct drm_plane *plane;
 	struct ingenic_ipu *ipu;
 	void __iomem *base;
@@ -885,24 +899,14 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
 	if (err) {
 		dev_err(dev, "Unable to prepare clock\n");
 		return err;
 	}
 
-	private_state = kzalloc(sizeof(*private_state), GFP_KERNEL);
-	if (!private_state) {
-		err = -ENOMEM;
-		goto err_clk_unprepare;
-	}
-
-	drm_atomic_private_obj_init(drm, &ipu->private_obj, &private_state->base,
+	drm_atomic_private_obj_init(drm, &ipu->private_obj, NULL,
 				    &ingenic_ipu_private_state_funcs);
 
 	return 0;
-
-err_clk_unprepare:
-	clk_unprepare(ipu->clk);
-	return err;
 }
 
 static void ingenic_ipu_unbind(struct device *dev,
 			       struct device *master, void *d)
 {

-- 
2.51.0

