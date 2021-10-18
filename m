Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFDA431F8C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ADF6E0C8;
	Mon, 18 Oct 2021 14:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FAF6E087
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:28:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m22so41970341wrb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hw2kEKR6GmnnBJZdGv76AQIzp59u7C1ygXfbc46hMPQ=;
 b=STRSn80K8xFeuDT1GUtZ23w28p8j9zCCXyyGsgatqj0XQZViCN0dQXkXWJZJ5ph6qp
 ukFV3XqBEOTCqouiKt8xVDL74UTn8EnPaHiZ0SyS6/NN7YlWkmqf+h+jsVq2g3LKaYsg
 bHt3xSZnt3fHBeAc94JT9wcVtaL05J8SefRltV7u35N5XX1ZBMu8LImdqI03dMlToVXm
 8ZBzNLlo2ZkDB/xHGm72qOY3E/W0YuWU39gaRfxAHN86kGG/r6dvlG89WBZLKS5NEMsE
 lJd2Q0CMdBKuTA9F1EY8R87s0UrELaLNxIz+l9QzvGQPoF7moDkxXOaE5bCcZoWdg/p9
 y06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hw2kEKR6GmnnBJZdGv76AQIzp59u7C1ygXfbc46hMPQ=;
 b=op1tUOgtGxElk4O+YeE+evBEZ+n39szYcY5Tvq/I1HIP1wbPmU+b0vfO0iRmEGzF/F
 p+/NIC1pg2VmIPxeFjdStMqZDKxAtN7rvygg/MpHfsgxEmjOjXrC2ts3jRUPVUuo/bqV
 nBNji3lIMhxBBpor9U6roMcMYXR5uowWt6zXfk6H1jhTeJ4df2VetNzWxx3RA3A2wQB8
 nQZdlYhgUXtbGABH8VSqYbIPTrpNEgwf9sUFnDFEjO/9f1Y4/wB8z4qk/hWjnljL3YSx
 GVkAl5anW0saBSaRqKKAkzdNB/tToKPFlV4P5c9TARgRHI7+r5BGRmH8jW5xkLLkl0qq
 Dm1Q==
X-Gm-Message-State: AOAM533K7oK/vUuqDP7jLRd0EDEJV5oVv0+Y8i19gjgUFM65l4mElUHn
 MFeZs6xbztIC01vNom2143o48w==
X-Google-Smtp-Source: ABdhPJzJo0KXcw4cLD2aXyoy3q8sTwjyaiihQvTga6rkNUSQMX3jBs1oLWIx/lqUK4hM6/CwrwhtTg==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr36190044wrg.328.1634567329249; 
 Mon, 18 Oct 2021 07:28:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:2dd7:d5eb:6e87:f924])
 by smtp.gmail.com with ESMTPSA id b3sm12908495wrp.52.2021.10.18.07.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 07:28:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v6 4/9] drm/omap: introduce omap_hw_overlay
Date: Mon, 18 Oct 2021 16:28:37 +0200
Message-Id: <20211018142842.2511200-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018142842.2511200-1-narmstrong@baylibre.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11087;
 i=narmstrong@baylibre.com; 
 h=from:subject; bh=aEE0xUn7b5AAjVaKpKWX5+pDRvalC81eBzrYp9/xaPo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhbYSFcKA21Y3ZS3pe5nf5a9h3Cz27EjCHpp/0XBFG
 G8eQ6NuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYW2EhQAKCRB33NvayMhJ0V3iEA
 CYpyRojgjK/UbFxgoYQN9/s/DfsiQpD7h1tmEPuVqzoG7YWRrUEnwTQ7OMNE+hWbii9FY27E9jyUas
 U1NIF9NJ0AZ9cvPWlMoRBBT18rfHam5byW9Kxy8fxCRRLO2B4OBztX4nkg1O5UyrGzT1S8UfZGbBh0
 sv1swmTXomdcO/9cjgDCpzObIdd5r0WJnCsx7RpWUKoTcweEWsW86fWgi0SsubVwT6oSLZD8AUPbHS
 jwinCoxbFzvJ7pAzhy5c3hZ/9kTZxkwl7PJbAeHrh6mOye5jc+mCPjVIZ5pznAjLcw7bAMYZrZgeYt
 B7WdtsL1/NbYyX5k9NqHEEwgYYTna0DudHluKm3UDrW+wHvYoChEViQ2Xva5RgTzZ/LTXDUDquXYzY
 nv6un/lSwYUrKnGHXoI3Eff4HvW3Wsu1DFvxTpVDa1zIZO1oFLb8PxbJhyFfGU+ndlJZrP1S+y1VoJ
 uetoVso507VsOMQYNIxsRBBqqG+nLf46nUzsZR/nwserkr+yZFUGYsxpPKyNNpPfwIN4CuP1/1iwWD
 /uNdXzk7ru3CO0gjm3y1SawkaToMK2rRQ2HkxCiyhwFWAaKVW8z0PO8RZtXkQYNp+JcJFKvoJBzwAI
 /C23vBE5ji01wxZ5M/A5Hd/CMYsNSHng57lFuS1Buxf/LmK+82lNO+HwzADg==
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

Split out the hardware overlay specifics from omap_plane.
To start, the hw overlays are statically assigned to planes.

The goal is to eventually assign hw overlays dynamically to planes
during plane->atomic_check() based on requested caps (scaling, YUV,
etc). And then perform hw overlay re-assignment if required.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/omapdrm/Makefile       |  1 +
 drivers/gpu/drm/omapdrm/omap_drv.c     |  9 ++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  4 ++
 drivers/gpu/drm/omapdrm/omap_overlay.c | 84 ++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h | 30 +++++++++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 54 +++++++----------
 6 files changed, 148 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h

diff --git a/drivers/gpu/drm/omapdrm/Makefile b/drivers/gpu/drm/omapdrm/Makefile
index 21e8277ff88f..710b4e0abcf0 100644
--- a/drivers/gpu/drm/omapdrm/Makefile
+++ b/drivers/gpu/drm/omapdrm/Makefile
@@ -9,6 +9,7 @@ omapdrm-y := omap_drv.o \
 	omap_debugfs.o \
 	omap_crtc.o \
 	omap_plane.o \
+	omap_overlay.o \
 	omap_encoder.o \
 	omap_fb.o \
 	omap_gem.o \
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index f86e20578143..b994014b22e8 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -583,10 +583,14 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_gem_init(ddev);
 
+	ret = omap_hwoverlays_init(priv);
+	if (ret)
+		goto err_gem_deinit;
+
 	ret = omap_modeset_init(ddev);
 	if (ret) {
 		dev_err(priv->dev, "omap_modeset_init failed: ret=%d\n", ret);
-		goto err_gem_deinit;
+		goto err_free_overlays;
 	}
 
 	/* Initialize vblank handling, start with all CRTCs disabled. */
@@ -618,6 +622,8 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 	omap_fbdev_fini(ddev);
 err_cleanup_modeset:
 	omap_modeset_fini(ddev);
+err_free_overlays:
+	omap_hwoverlays_destroy(priv);
 err_gem_deinit:
 	omap_gem_deinit(ddev);
 	destroy_workqueue(priv->wq);
@@ -642,6 +648,7 @@ static void omapdrm_cleanup(struct omap_drm_private *priv)
 	drm_atomic_helper_shutdown(ddev);
 
 	omap_modeset_fini(ddev);
+	omap_hwoverlays_destroy(priv);
 	omap_gem_deinit(ddev);
 
 	destroy_workqueue(priv->wq);
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 591d4c273f02..b4d9c2062723 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -24,6 +24,7 @@
 #include "omap_gem.h"
 #include "omap_irq.h"
 #include "omap_plane.h"
+#include "omap_overlay.h"
 
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__) /* verbose debug */
@@ -57,6 +58,9 @@ struct omap_drm_private {
 	unsigned int num_planes;
 	struct drm_plane *planes[8];
 
+	unsigned int num_ovls;
+	struct omap_hw_overlay *overlays[8];
+
 	struct drm_fb_helper *fbdev;
 
 	struct workqueue_struct *wq;
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
new file mode 100644
index 000000000000..de67b39529bd
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot <bparrot@ti.com>
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "omap_dmm_tiler.h"
+#include "omap_drv.h"
+
+/*
+ * overlay funcs
+ */
+static const char * const overlay_id_to_name[] = {
+	[OMAP_DSS_GFX] = "gfx",
+	[OMAP_DSS_VIDEO1] = "vid1",
+	[OMAP_DSS_VIDEO2] = "vid2",
+	[OMAP_DSS_VIDEO3] = "vid3",
+};
+
+static void omap_overlay_destroy(struct omap_hw_overlay *overlay)
+{
+	kfree(overlay);
+}
+
+static struct omap_hw_overlay *omap_overlay_init(enum omap_plane_id overlay_id,
+						 enum omap_overlay_caps caps)
+{
+	struct omap_hw_overlay *overlay;
+
+	overlay = kzalloc(sizeof(*overlay), GFP_KERNEL);
+	if (!overlay)
+		return ERR_PTR(-ENOMEM);
+
+	overlay->name = overlay_id_to_name[overlay_id];
+	overlay->id = overlay_id;
+	overlay->caps = caps;
+
+	return overlay;
+}
+
+int omap_hwoverlays_init(struct omap_drm_private *priv)
+{
+	static const enum omap_plane_id hw_plane_ids[] = {
+			OMAP_DSS_GFX, OMAP_DSS_VIDEO1,
+			OMAP_DSS_VIDEO2, OMAP_DSS_VIDEO3,
+	};
+	u32 num_overlays = dispc_get_num_ovls(priv->dispc);
+	enum omap_overlay_caps caps;
+	int i, ret;
+
+	for (i = 0; i < num_overlays; i++) {
+		struct omap_hw_overlay *overlay;
+
+		caps = dispc_ovl_get_caps(priv->dispc, hw_plane_ids[i]);
+		overlay = omap_overlay_init(hw_plane_ids[i], caps);
+		if (IS_ERR(overlay)) {
+			ret = PTR_ERR(overlay);
+			dev_err(priv->dev, "failed to construct overlay for %s (%d)\n",
+				overlay_id_to_name[i], ret);
+			omap_hwoverlays_destroy(priv);
+			return ret;
+		}
+		overlay->idx = priv->num_ovls;
+		priv->overlays[priv->num_ovls++] = overlay;
+	}
+
+	return 0;
+}
+
+void omap_hwoverlays_destroy(struct omap_drm_private *priv)
+{
+	int i;
+
+	for (i = 0; i < priv->num_ovls; i++) {
+		omap_overlay_destroy(priv->overlays[i]);
+		priv->overlays[i] = NULL;
+	}
+
+	priv->num_ovls = 0;
+}
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
new file mode 100644
index 000000000000..51d26aebf77d
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot <bparrot@ti.com>
+ */
+
+#ifndef __OMAPDRM_OVERLAY_H__
+#define __OMAPDRM_OVERLAY_H__
+
+#include <linux/types.h>
+
+enum drm_plane_type;
+
+struct drm_device;
+struct drm_mode_object;
+struct drm_plane;
+
+/* Used to associate a HW overlay/plane to a plane */
+struct omap_hw_overlay {
+	unsigned int idx;
+
+	const char *name;
+	enum omap_plane_id id;
+
+	enum omap_overlay_caps caps;
+};
+
+int omap_hwoverlays_init(struct omap_drm_private *priv);
+void omap_hwoverlays_destroy(struct omap_drm_private *priv);
+#endif /* __OMAPDRM_OVERLAY_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 846698c21a4a..8cc2b899f20c 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -21,7 +21,8 @@
 struct omap_plane {
 	struct drm_plane base;
 	enum omap_plane_id id;
-	const char *name;
+
+	struct omap_hw_overlay *overlay;
 };
 
 static int omap_plane_prepare_fb(struct drm_plane *plane,
@@ -49,10 +50,11 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->id;
 	struct omap_overlay_info info;
 	int ret;
 
-	DBG("%s, crtc=%p fb=%p", omap_plane->name, new_state->crtc,
+	DBG("%s, crtc=%p fb=%p", plane->name, new_state->crtc,
 	    new_state->fb);
 
 	memset(&info, 0, sizeof(info));
@@ -77,17 +79,17 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 			&info.paddr, &info.p_uv_addr);
 
 	/* and finally, update omapdss: */
-	ret = dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
+	ret = dispc_ovl_setup(priv->dispc, ovl_id, &info,
 			      omap_crtc_timings(new_state->crtc), false,
 			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
 		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
-			omap_plane->name);
-		dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+			plane->name);
+		dispc_ovl_enable(priv->dispc, ovl_id, false);
 		return;
 	}
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, true);
+	dispc_ovl_enable(priv->dispc, ovl_id, true);
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -97,11 +99,12 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 									   plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->id;
 
 	new_state->rotation = DRM_MODE_ROTATE_0;
 	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+	dispc_ovl_enable(priv->dispc, ovl_id, false);
 }
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
@@ -184,7 +187,7 @@ static void omap_plane_destroy(struct drm_plane *plane)
 {
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 
-	DBG("%s", omap_plane->name);
+	DBG("%s", plane->name);
 
 	drm_plane_cleanup(plane);
 
@@ -290,20 +293,6 @@ static bool omap_plane_supports_yuv(struct drm_plane *plane)
 	return false;
 }
 
-static const char *plane_id_to_name[] = {
-	[OMAP_DSS_GFX] = "gfx",
-	[OMAP_DSS_VIDEO1] = "vid1",
-	[OMAP_DSS_VIDEO2] = "vid2",
-	[OMAP_DSS_VIDEO3] = "vid3",
-};
-
-static const enum omap_plane_id plane_idx_to_id[] = {
-	OMAP_DSS_GFX,
-	OMAP_DSS_VIDEO1,
-	OMAP_DSS_VIDEO2,
-	OMAP_DSS_VIDEO3,
-};
-
 /* initialize plane */
 struct drm_plane *omap_plane_init(struct drm_device *dev,
 		int idx, enum drm_plane_type type,
@@ -313,27 +302,26 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	unsigned int num_planes = dispc_get_num_ovls(priv->dispc);
 	struct drm_plane *plane;
 	struct omap_plane *omap_plane;
-	enum omap_plane_id id;
 	int ret;
 	u32 nformats;
 	const u32 *formats;
 
-	if (WARN_ON(idx >= ARRAY_SIZE(plane_idx_to_id)))
+	if (WARN_ON(idx >= num_planes))
 		return ERR_PTR(-EINVAL);
 
-	id = plane_idx_to_id[idx];
-
-	DBG("%s: type=%d", plane_id_to_name[id], type);
-
 	omap_plane = kzalloc(sizeof(*omap_plane), GFP_KERNEL);
 	if (!omap_plane)
 		return ERR_PTR(-ENOMEM);
 
-	formats = dispc_ovl_get_color_modes(priv->dispc, id);
+	omap_plane->id = idx;
+	omap_plane->overlay = priv->overlays[idx];
+
+	DBG("%d: type=%d", omap_plane->id, type);
+	DBG("	crtc_mask: 0x%04x", possible_crtcs);
+
+	formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->overlay->id);
 	for (nformats = 0; formats[nformats]; ++nformats)
 		;
-	omap_plane->id = id;
-	omap_plane->name = plane_id_to_name[id];
 
 	plane = &omap_plane->base;
 
@@ -363,8 +351,8 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 	return plane;
 
 error:
-	dev_err(dev->dev, "%s(): could not create plane: %s\n",
-		__func__, plane_id_to_name[id]);
+	dev_err(dev->dev, "%s(): could not create plane: %d\n",
+		__func__, omap_plane->id);
 
 	kfree(omap_plane);
 	return NULL;
-- 
2.25.1

