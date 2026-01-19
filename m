Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5DD3A968
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F1D10E446;
	Mon, 19 Jan 2026 12:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cuexDE9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B75510E440
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0170543473;
 Mon, 19 Jan 2026 12:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81825C19423;
 Mon, 19 Jan 2026 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827036;
 bh=9hx70GljbGo7g0nZKPkSzoNYyzu7O2UWDMBctX08yTA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cuexDE9x+PIq6uxWDtQRThCDJXclYL66DtyokGBywKt4bvKV97Cf2v1otnlvObp/H
 Ubj7GD8AIO8NyW0x1hs/HdICCywQj4RSCEfArs7qMsVyAD6jKUk0BANmVU+MnprTrC
 rE6oakY4CIrR54XeYxl91kXXV46AC/tNDZom0BFelAPVj5y62EYWLHmceoPdQHsDI5
 toqo/psvDDE1Owu4REqwyYd9+NR5GjFuLuUMNduTLd28n3LMJAsgxC8PnEiDjFgeaM
 LL+mMAw7BhBUrSNIRZtX6236jNstd68xRP83m2zauWiqDE1EXRqUT5T5xC+KJdFjoP
 x9VdcciWZAKzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:05 +0100
Subject: [PATCH v3 09/15] drm/ingenic: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-9-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6355; i=mripard@redhat.com;
 h=from:subject:message-id; bh=9hx70GljbGo7g0nZKPkSzoNYyzu7O2UWDMBctX08yTA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GrVuhoKXZ1VF9V4J1elo0lokYa4s7abvkrJS6268a
 dDyaxc6prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwESSExnrix50WRwWrXo31/PC
 xidnXFf4WCWtWnyjqG45a/m7hqIgX1HTQ347S2U72w9N2ar2RWQPY63Aqn+xU8OPem02rCqe8my
 Ce8XOb2Wre2M8vV9eeP2y4x+bvbFstETL8b9HuNvC7T4+LwYA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
index d3213fbf22be14b177fc1b7100c5b721d5f17924..862691991ed2770d30342bf531e828e34bd7080a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -952,10 +952,24 @@ static void ingenic_drm_destroy_state(struct drm_private_obj *obj,
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
@@ -1032,10 +1046,11 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
 static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail,
 };
 
 static const struct drm_private_state_funcs ingenic_drm_private_state_funcs = {
+	.atomic_create_state = ingenic_drm_create_state,
 	.atomic_duplicate_state = ingenic_drm_duplicate_state,
 	.atomic_destroy_state = ingenic_drm_destroy_state,
 };
 
 static void ingenic_drm_unbind_all(void *d)
@@ -1085,11 +1100,10 @@ static void ingenic_drm_atomic_private_obj_fini(struct drm_device *drm, void *pr
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
@@ -1385,23 +1399,17 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
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
@@ -1409,12 +1417,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 
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
index 32638a713241abbd4eaed09f0aaec2b790650cc9..253a1ce30997308547b61339468d52e6875785d3 100644
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
2.52.0

