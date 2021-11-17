Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64102454864
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 15:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C852B6E459;
	Wed, 17 Nov 2021 14:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8572D6E459
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 14:19:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s13so5052216wrb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XFN1iAlCGNW7IzWbu4eDHGUjnr+W3i9LZHVoBYu01+A=;
 b=U1vhbfIXppOzwTzeLpz6GRfxgAXKL9kRt1mPqlWDeuNYlcfIYYGWZmaaiSItzyFqBl
 aRUU528UUXfUpX71PHiOfhZMBGbNG3ZE3dfxTKxyrRNGpGJhs+mTX9fwvXLN0DIB1kpz
 UteBtDzslGwp5ACz3kuYLDCd5/In1x0Ju14vQGjizIDc0Id1RFeV3kE9VbPhTvl0uDnt
 etLdJppogMRGf4OQMNK1LglozOMp2fM/ArhpTwLHKByd5wI+SSFGtPuRgJu4HLYiFVK0
 HUHzoacLlywHZQprlVmMZxTHvAMamFOz1sfBHqzK1qCXbX1GdOkOi1QAyDrkKDtHq/86
 nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XFN1iAlCGNW7IzWbu4eDHGUjnr+W3i9LZHVoBYu01+A=;
 b=PdNXT9GRXSXwL2s4IXtjlAUgO0v8UPkQp2nLWDtSspdGtgwaj5E6MewZp/HxTIVa6f
 G0FTsBTcfqJ+L4ohtXXmwZUHLNT3sWcTWtU847qzEF1jg011NZI/7nfZIZBDBlKjK4a7
 0bwVzf6Syg/szE0dlYRN7BY4u+oZ0dGb7z7GGiZbHAX16MBQFBIPJL/Tl4FAMqfgYg5L
 SY+w+Amgp/oZJyTk1tUftJAWpQmpJxX3wETTmvFRL39j5AwM5KtiN+ZibjIouvYwIoTp
 1kQqAFqevCClD71Vmvjv1GaraR6G0uE24vaLXMhy9+mmiowz5v8SNHXScfgV23hp/fCO
 QgkQ==
X-Gm-Message-State: AOAM530ERC0jarwBhH8VXDsSkC3Rk60zSI4OIgBFJ05tJ1j7BgvYsXjF
 R1L0ibTOsHNlIqKGTb6ISUL5kg==
X-Google-Smtp-Source: ABdhPJyEZTXvCuAnDxowItg/gHq8mZEnMB4Gr/92Syg9xsfEMKJA3tuoQ8+M6gfvbOI2RZc121tufg==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr21256460wrq.397.1637158778918; 
 Wed, 17 Nov 2021 06:19:38 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f98b:434c:566c:492d])
 by smtp.gmail.com with ESMTPSA id o10sm33803wri.15.2021.11.17.06.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:19:38 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Subject: [PATCH v7 6/9] drm/omap: Add global state as a private atomic object
Date: Wed, 17 Nov 2021 15:19:25 +0100
Message-Id: <20211117141928.771082-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117141928.771082-1-narmstrong@baylibre.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6382; i=narmstrong@baylibre.com;
 h=from:subject; bh=xnZMVWOIQ7dDQHmJjRrc3xW37tyCw1rW1wJyrCeCLpE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhlQ9MuUGjpRhFrMXdqdfEi+koF6aDbsMOGLujcIr8
 p/Jx2eyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYZUPTAAKCRB33NvayMhJ0ejuD/
 9KReaF6hyhi6iQ1XCUqsvxNI83Acpi3+eRVmklA2cqdDjn8GBpDbQGpayY73JrHFg3jEj0FdVBHczO
 r80ahjcia+9WetezrGM4KWYYLrl6wO58jnS1dyw/rep3ZMKgN9+1klhszoeV4dxHwsch0OkPgSxIEw
 XNIKiC/64Io4lxVfGFGYKPcZOintbrtst2fUYQkaVtAd+m4lPvZMZXd9LUmAT32yoF7B0BKtVrokdu
 mJSF5lLMjGJE415mjb7w6GoxczhPi5pLbBs9r9QEr1l7Fs/pEkIEpsIxDE6uQOFaiaLhDY/WIK2Cs+
 4yLjjDjEdbSuFJs+V2jffgpx9FNiVhQCi+VUL+sAcwrOKkaHN9LTKkHQYd0IA4/KvdnKCihLm+0p8q
 oVnODxvHxKhwUi248LrDBHH4J+BQnu+Yv18BbAJgTJjuAUD9blwN9KHB94oMbKilW2NrapzdKu6jN+
 wr3zoEadY8nGAcOCfe1toWql+521/pwA9Cp43bzhAVBVbYRZWGwy0H52ceyfMdGxCT+2SwRKlpy9l5
 8UlRTzmg+nFfPz8ca73DkknEe5sBWlV/7C094Mjh2OdOGfRk+mxMiqAogxQD3BMvHzil+3G9IfD5pI
 TNI2/cfT7CZKIBy8Oiii0/Fmul/TMzU+oq/hNh8gINKT6QIR5XVZ8tbv9g2Q==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Benoit Parrot <bparrot@ti.com>

Global shared resources (like hw overlays) for omapdrm are implemented
as a part of atomic state using the drm_private_obj infrastructure
available in the atomic core.

omap_global_state is introduced as a drm atomic private object. The two
funcs omap_get_global_state() and omap_get_existing_global_state() are
the two variants that will be used to access omap_global_state.

drm_mode_config_init() needs to be called earlier because it
creates/initializes the private_obj link list maintained by the atomic
framework. The private_obj link list has to exist prior to calling
drm_atomic_private_obj_init(). Similarly the cleanup handler are
reordered appropriately.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 91 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h | 17 ++++++
 2 files changed, 105 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index f17a72a4023e..44a9dcb3100c 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -128,6 +128,82 @@ static const struct drm_mode_config_funcs omap_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/* Global/shared object state funcs */
+
+/*
+ * This is a helper that returns the private state currently in operation.
+ * Note that this would return the "old_state" if called in the atomic check
+ * path, and the "new_state" after the atomic swap has been done.
+ */
+struct omap_global_state *
+omap_get_existing_global_state(struct omap_drm_private *priv)
+{
+	return to_omap_global_state(priv->glob_obj.state);
+}
+
+/*
+ * This acquires the modeset lock set aside for global state, creates
+ * a new duplicated private object state.
+ */
+struct omap_global_state *__must_check
+omap_get_global_state(struct drm_atomic_state *s)
+{
+	struct omap_drm_private *priv = s->dev->dev_private;
+	struct drm_private_state *priv_state;
+
+	priv_state = drm_atomic_get_private_obj_state(s, &priv->glob_obj);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_omap_global_state(priv_state);
+}
+
+static struct drm_private_state *
+omap_global_duplicate_state(struct drm_private_obj *obj)
+{
+	struct omap_global_state *state;
+
+	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void omap_global_destroy_state(struct drm_private_obj *obj,
+				      struct drm_private_state *state)
+{
+	struct omap_global_state *omap_state = to_omap_global_state(state);
+
+	kfree(omap_state);
+}
+
+static const struct drm_private_state_funcs omap_global_state_funcs = {
+	.atomic_duplicate_state = omap_global_duplicate_state,
+	.atomic_destroy_state = omap_global_destroy_state,
+};
+
+static int omap_global_obj_init(struct drm_device *dev)
+{
+	struct omap_drm_private *priv = dev->dev_private;
+	struct omap_global_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
+				    &omap_global_state_funcs);
+	return 0;
+}
+
+static void omap_global_obj_fini(struct omap_drm_private *priv)
+{
+	drm_atomic_private_obj_fini(&priv->glob_obj);
+}
+
 static void omap_disconnect_pipelines(struct drm_device *ddev)
 {
 	struct omap_drm_private *priv = ddev->dev_private;
@@ -231,8 +307,6 @@ static int omap_modeset_init(struct drm_device *dev)
 	if (!omapdss_stack_is_ready())
 		return -EPROBE_DEFER;
 
-	drm_mode_config_init(dev);
-
 	ret = omap_modeset_init_properties(dev);
 	if (ret < 0)
 		return ret;
@@ -583,10 +657,16 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_gem_init(ddev);
 
-	ret = omap_hwoverlays_init(priv);
+	drm_mode_config_init(ddev);
+
+	ret = omap_global_obj_init(ddev);
 	if (ret)
 		goto err_gem_deinit;
 
+	ret = omap_hwoverlays_init(priv);
+	if (ret)
+		goto err_free_priv_obj;
+
 	ret = omap_modeset_init(ddev);
 	if (ret) {
 		dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
@@ -624,7 +704,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_modeset_fini(ddev);
 err_free_overlays:
 	omap_hwoverlays_destroy(priv);
+err_free_priv_obj:
+	omap_global_obj_fini(priv);
 err_gem_deinit:
+	drm_mode_config_cleanup(ddev);
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
 	omap_disconnect_pipelines(ddev);
@@ -649,6 +732,8 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 
 	omap_modeset_fini(ddev);
 	omap_hwoverlays_destroy(priv);
+	omap_global_obj_fini(priv);
+	drm_mode_config_cleanup(ddev);
 	omap_gem_deinit(ddev);
 
 	destroy_workqueue(priv->wq);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index b4d9c2062723..a3079aad7ae3 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -14,6 +14,7 @@
 #include "dss/omapdss.h"
 #include "dss/dss.h"
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_gem.h>
 #include <drm/omap_drm.h>
 
@@ -41,6 +42,16 @@ struct omap_drm_pipeline {
 	unsigned int alias_id;
 };
 
+/*
+ * Global private object state for tracking resources that are shared across
+ * multiple kms objects (planes/crtcs/etc).
+ */
+#define to_omap_global_state(x) container_of(x, struct omap_global_state, base)
+
+struct omap_global_state {
+	struct drm_private_state base;
+};
+
 struct omap_drm_private {
 	struct drm_device *ddev;
 	struct device *dev;
@@ -61,6 +72,8 @@ struct omap_drm_private {
 	unsigned int num_ovls;
 	struct omap_hw_overlay *overlays[8];
 
+	struct drm_private_obj glob_obj;
+
 	struct drm_fb_helper *fbdev;
 
 	struct workqueue_struct *wq;
@@ -89,4 +102,8 @@ struct omap_drm_private {
 
 void omap_debugfs_init(struct drm_minor *minor);
 
+struct omap_global_state * __must_check omap_get_global_state(struct drm_atomic_state *s);
+
+struct omap_global_state *omap_get_existing_global_state(struct omap_drm_private *priv);
+
 #endif /* __OMAPDRM_DRV_H__ */
-- 
2.25.1

