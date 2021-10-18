Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9987431F97
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268F6EA46;
	Mon, 18 Oct 2021 14:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223546E087
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:28:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r7so41836126wrc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xos3ri9U1H5jfjvfpqCdoDexrK3BD8+5TNiS9KWIjfA=;
 b=GLW3EEI9lukBqzBc/zyjjDzTIKDJ3eKjmMcbRO/8JpwkfZfesNYatflwlIj3vVvKOU
 sLxUFTlzKMYR8BgqG5jqZpK1+DNZjW2GTKafHXI/Cm8xfOuoiC02yx9HQsGtB24j5Bie
 9fb7kLEH7gOmdzS0j6HR7C8gC0HsGyiNd2G3frJiC3+D6XmDce2yL5obD36/+j5iSpGA
 SptJT9PxrwqWwk6w76YbyBVqg1I3d6lusZyZdgVa4z9wWgp9RAgrM9spiGmOY4G5CpH1
 eN3CzbloqRHQD98rYZSrzJgRxhbADDTryVc9LnTXidID1IcaFhrpvy0tFTyaIMOTVk5+
 hh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xos3ri9U1H5jfjvfpqCdoDexrK3BD8+5TNiS9KWIjfA=;
 b=IMEBNJ9nAkl33SYkuqlGZ9njxvY+yQogItvOOl3/0vqGRz0tzq70ve39sUW3zzy67q
 dXVb0krOpd26rv8JrAzYt1TsxKfc57wimDgo7k0qLWAiCfYPEjkvtSxOym0eYjrX0wh8
 rvV72wsP/NO/QFsnhgxD4ME9c5Ys7BIzeJ9nICN9xkF9zcuNJC8N8AE2K8XJprL+IVHp
 7fTEK1MiZnAHVEOxSwjKX9qj9SIu4mjL4iBdOZVdKyA3So9WoUkdKzOVlC7KEP16OMYP
 /BmktFI8B37pzkGy40qxNQBhUiIhVmt5xOk5t38u02hAwJCcziLg5G5Wbib3EdxQsAGo
 rZVQ==
X-Gm-Message-State: AOAM530/JQLNxIir0zvb0qu5nyFnsdQcNT7XSoK669n/EiInMxcFAWk0
 f/3YeDHT+5+Ujdufm37l2ZHfAw==
X-Google-Smtp-Source: ABdhPJyJrKVMY4U+6f9+E3SwdX8lIo6v9rUOYfVwSuyg0dVOL4VbjTOM6DJlPlDP52jI3pbKMSmQwg==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr36970821wrc.147.1634567331452; 
 Mon, 18 Oct 2021 07:28:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:28:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 6/9] drm/omap: Add global state as a private atomic object
Date: Mon, 18 Oct 2021 16:28:39 +0200
Message-Id: <20211018142842.2511200-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6382; i=narmstrong@baylibre.com;
 h=from:subject; bh=Fvw9so5WoaGI+JrbPfR7R3ztRakTQgT6adrx2fLhJCE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSFDkEAMiQ6vpnQFtXgplKartZDABGPywqVCAu8
 lmAkVNeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0VCmD/
 oCgpOOPNnG6UYoUupvQyH9TpyMWGjszGCV2c2HmPBaH3WekKOXmEYcmyOgs5rKYtHK0qkDk5UK3XZR
 OQsvPyv5U3Sjw8m0HeFvD3K6AKmgGKhMb3r1g5iFo2ZqOrAH0osqR15Dn1/A0S36CBAHT0on4UGC7z
 t6GxO+qle95D/r8DEashEUSIzs6CtQFvD4Cryhk9H8aQv8AmNXCcC/3MB1He5jTTV+FVTElct21f6T
 1Kx9KdTSPJuYwZ+9gKBpmlJmM5t0ClPgjfUj2xdg3Rv5zpgkZonqP2WDLgY/0kHr//YMdLRSv6shHG
 15SjB2Jxq60y45GnKnxL7f7qLXDl/XXr6qdPQ4ZBSS5lmxTqbh2dKkek6RYRQ4e5Xgd5OmjGYBhaPn
 RqEwoHLG/n5V313kbCZIBO/TCVm6JoMnd6Vzyus2pWJfc6FS46srUMPICm82Qo6OShp/spDVLDen6G
 EPbCjP3aQqBvQ4I50PZiqxC+z8ZteDVwALHSC3rLpQs69oXOJXdmo0CPzCNYTfp62d9mtCg06RHMnp
 Kd7GaTtQIYz3KplOSivmQOgjvo/EDdjXftm5Z2fsIvGo1kdWzHMZbTda58MITazgzZ7dPrKt5jzrWC
 3jbMBRbUrnCpKNUCLxheUmF40vle9deXCxzZRglaAyT8kUSl3DGG62XZ/7iA==
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
index b994014b22e8..c7912374d393 100644
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

