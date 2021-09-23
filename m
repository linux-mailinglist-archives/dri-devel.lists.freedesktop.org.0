Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0684158C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C956ECE0;
	Thu, 23 Sep 2021 07:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4509E6ECE1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:07:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w17so14083262wrv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wl17Sf97iY4+CSQLIuQXO5q/f+FclNaJ+Vy/LLxmins=;
 b=wadVxuPECaq6jBXx+vE0dAlmtjq1K60UUU8UhDYaCZaHgp0OWgpQMOby+IVKehWhqL
 eJ0O5eHemyoNQ95y9RNhE3NqzFwxJt/jWpyk5Q9djCPV9ZZFj6jloHuixhs+CTvZ1hx4
 Dluu7ru+cCV1hPjkJhanveEw5S/mSqeBEQqdbRb2ewoRM/KW/cUvsp5PxngGMAN7lg8D
 utMqD2TOFguFdpxs9+hrR2DPbYpppAq4PhlHGA1PNxYAPCnfGsz32s41qFvYFZp0H7m2
 GDcY2xUC7Y7kCwDuCU6HmtuZHjAW9gbsUBwO8xCYdVSsAVT8svO0N5HrUFaVm50H8tPg
 RdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wl17Sf97iY4+CSQLIuQXO5q/f+FclNaJ+Vy/LLxmins=;
 b=Fc4lxWfCnSI0bFqep3jrvlRsaShYKk0VHRVONu+jWRJNaAJCN1iq38U5RiH04ZNxcT
 hj3k3nb3gEX8rx5/DNTeDR58j/M3tdOQ9mPWIMkyRJpjcJdAI0m6ScETHMxM0yQREbbZ
 vkCei5OdVUgMMTSfcyviLDpP3aokHLCMdfauFy2+9H3XDre+RkkiQ0ZbsSzRspM84Z7R
 X+e9AsQRUl0TE2D9bjDZ4ISHIG1ZUzGmcCuXJtDQvmZ27G0HqIL6XgXto6GCcm3s0TvY
 Kyb0rVgfQK3RRCbRk+2e88XGfz4wyJRVwLQi/owPJ8XCeGm1PqSnAstLUXAZ3QsQzkoq
 YYkA==
X-Gm-Message-State: AOAM531p24Hf4h91UZ1N8vDkyTLDnDpBkJQJLXZwe0+cc3FxiTcurasa
 EdQyja6PQHS7bCmJVZF27Hmj7Q==
X-Google-Smtp-Source: ABdhPJxlI3k77jX0qdlzsxLuFwk8s3QEwsT66ZecdMTqZMnzud3Vhe7JYcVrPxsky/1ouVvDy9PhXw==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr3359188wro.2.1632380826327;
 Thu, 23 Sep 2021 00:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 3/8] drm/omap: introduce omap_hw_overlay
Date: Thu, 23 Sep 2021 09:06:56 +0200
Message-Id: <20210923070701.145377-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923070701.145377-1-narmstrong@baylibre.com>
References: <20210923070701.145377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11056;
 i=narmstrong@baylibre.com; 
 h=from:subject; bh=PNSPGHwtK+8fALF03jz6BERDIiy/R3kVBjpu2V6TpVI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCchwo1qrutd22RgDCRkGmpEVtqHb96qLhns2I+7
 M3TmmnmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnIQAKCRB33NvayMhJ0QQQEA
 CA/CcJ4NmZvtmXYpvTCYmRsM7FJVX391yp01vJTwnQgnxCP+mpcFeLXqxLPrV1E2yeNAZBvxZ050+o
 7QaLkZklHGqY1gmxDewdX6roJFK7CQM2ierO0LnbmrK/jIz6R5zbO7h/GkjQ5SyQ1LiIBbsoKFnJZE
 u7B4ea22cN9SuKTRo8ERDRT2QI5K6Bq7pIdyaRsngbj2EOOaVy2jCsO4BsOcvi7KFqcr3A1o3c23z5
 kmHZP8PRfMT6/WNMs/GrmoIn+ihrQkYJBHEgkEXYU3Zo4gji4HrCD+1o0+9V7cChcqCRGQZRsiWXce
 Tb/rv5vzh7eClozu7+qxfbTQAtfrLhzD5IUQ0kgM2bvgB+q172cI2L0stwzkuEOxLL4f8wD7rt0564
 M5O5YHK4iRedxV1M21o0dU1CxhUrrjJRM38SQvRVoZ2huvjw6A0n9uUPkYt28LLSi5agYUMHRal+iV
 zyhErLA1qhi/OSyLHEFoiIJI/5lTJZyZPyHWBKgeY189aHRJeFmEqeOI9erWVRro+QaZwgN2LUlKuW
 DadcLbivBKMHC/NEM6vm/dwsQJUIOPpwmA3nv5nLm0kulnJ2ZPC6SJCh8L3iWZuPCkad8s9MNXnPpX
 sP8f5fjoOyWnOq6Qbu/ieBCShKk9K1h8n3VM2gwQ34cSDlTk8KrWK6tlFChw==
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
 drivers/gpu/drm/omapdrm/omap_overlay.c | 87 ++++++++++++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h | 31 +++++++++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 42 ++++++-------
 6 files changed, 151 insertions(+), 23 deletions(-)
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
index 000000000000..2b1416d2aad2
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot, <bparrot@ti.com>
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
+	overlay->overlay_id = overlay_id;
+	overlay->caps = caps;
+	/*
+	 * When this is called priv->num_crtcs is not known yet.
+	 * Use a safe mask value to start with, it will get updated to the
+	 * proper value after the first use.
+	 */
+	overlay->possible_crtcs = 0xff;
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
+}
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.h b/drivers/gpu/drm/omapdrm/omap_overlay.h
new file mode 100644
index 000000000000..892fecb67adb
--- /dev/null
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Benoit Parrot, <bparrot@ti.com>
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
+	int idx;
+
+	const char *name;
+	enum omap_plane_id overlay_id;
+
+	enum omap_overlay_caps caps;
+	u32 possible_crtcs;
+};
+
+int omap_hwoverlays_init(struct omap_drm_private *priv);
+void omap_hwoverlays_destroy(struct omap_drm_private *priv);
+#endif /* __OMAPDRM_OVERLAY_H__ */
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d0a67b7ed1a0..0df5381cc015 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -22,6 +22,8 @@ struct omap_plane {
 	struct drm_plane base;
 	enum omap_plane_id id;
 	const char *name;
+
+	struct omap_hw_overlay *overlay;
 };
 
 static int omap_plane_prepare_fb(struct drm_plane *plane,
@@ -49,6 +51,7 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 	struct omap_plane *omap_plane = to_omap_plane(plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->overlay_id;
 	struct omap_overlay_info info;
 	int ret;
 
@@ -77,17 +80,17 @@ static void omap_plane_atomic_update(struct drm_plane *plane,
 			&info.paddr, &info.p_uv_addr);
 
 	/* and finally, update omapdss: */
-	ret = dispc_ovl_setup(priv->dispc, omap_plane->id, &info,
+	ret = dispc_ovl_setup(priv->dispc, ovl_id, &info,
 			      omap_crtc_timings(new_state->crtc), false,
 			      omap_crtc_channel(new_state->crtc));
 	if (ret) {
 		dev_err(plane->dev->dev, "Failed to setup plane %s\n",
 			omap_plane->name);
-		dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+		dispc_ovl_enable(priv->dispc, ovl_id, false);
 		return;
 	}
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, true);
+	dispc_ovl_enable(priv->dispc, ovl_id, true);
 }
 
 static void omap_plane_atomic_disable(struct drm_plane *plane,
@@ -97,11 +100,12 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 									   plane);
 	struct omap_drm_private *priv = plane->dev->dev_private;
 	struct omap_plane *omap_plane = to_omap_plane(plane);
+	enum omap_plane_id ovl_id = omap_plane->overlay->overlay_id;
 
 	new_state->rotation = DRM_MODE_ROTATE_0;
 	new_state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : omap_plane->id;
 
-	dispc_ovl_enable(priv->dispc, omap_plane->id, false);
+	dispc_ovl_enable(priv->dispc, ovl_id, false);
 }
 
 static int omap_plane_atomic_check(struct drm_plane *plane,
@@ -213,7 +217,7 @@ static void omap_plane_reset(struct drm_plane *plane)
 	 * plane.
 	 */
 	plane->state->zpos = plane->type == DRM_PLANE_TYPE_PRIMARY
-			   ? 0 : omap_plane->id;
+			   ? 0 : omap_plane->overlay->overlay_id;
 	plane->state->color_encoding = DRM_COLOR_YCBCR_BT601;
 	plane->state->color_range = DRM_COLOR_YCBCR_FULL_RANGE;
 }
@@ -282,13 +286,6 @@ static const char *plane_id_to_name[] = {
 	[OMAP_DSS_VIDEO3] = "vid3",
 };
 
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
@@ -298,27 +295,28 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
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
+	omap_plane->name = plane_id_to_name[idx];
+	omap_plane->overlay = priv->overlays[idx];
+
+	DBG("%s: type=%d", omap_plane->name, type);
+	DBG("	omap_plane->id: %d", omap_plane->id);
+	DBG("	crtc_mask: 0x%04x", possible_crtcs);
+
+	formats = dispc_ovl_get_color_modes(priv->dispc, omap_plane->overlay->overlay_id);
 	for (nformats = 0; formats[nformats]; ++nformats)
 		;
-	omap_plane->id = id;
-	omap_plane->name = plane_id_to_name[id];
 
 	plane = &omap_plane->base;
 
@@ -349,7 +347,7 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 
 error:
 	dev_err(dev->dev, "%s(): could not create plane: %s\n",
-		__func__, plane_id_to_name[id]);
+		__func__, omap_plane->name);
 
 	kfree(omap_plane);
 	return NULL;
-- 
2.25.1

