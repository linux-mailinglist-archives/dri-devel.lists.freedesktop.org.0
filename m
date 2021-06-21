Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 163423AE3D3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16F889D53;
	Mon, 21 Jun 2021 07:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5051589A76
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:44:41 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id t32so1510738pfg.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kp4AGh2kKmsSWYmHVjs494LK45DlXKcAocDyL4oF9o=;
 b=t7H9EO/rhhehaIZ+S4+FcthGEECr2W4A5C9YIY7CfvBxymc9FYnQAp6nS3KgVttAjv
 i/JEPwUYqFmfef8F2tl+kQrQpCjdkhE5c/RQ4kBHysVfKUpt6zfV8HKpv2JPKSNVWcGO
 sXXK7Nte5fkYk3Lw226Xbikxr36/tmY4nNJXiWMXZedYcWb86xWBQB1NIfCIg1XWu0PF
 GoWWEAo3enXZpd+WiDBFvhTjMZyjNw5WJznN1ffnGcJ5VcGxnb26YLBDJoGxb1ESLE7c
 Vxke5oZlji9a2QdpOi8ojgKjj6dBrW2QITPHf/MUF/+mUrQMthkxLctetdDVqtXqU3u7
 y3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kp4AGh2kKmsSWYmHVjs494LK45DlXKcAocDyL4oF9o=;
 b=YfrzaJtt6EXJ8JAj/NmkHKnPAa/jHRQKqyMb3/dA3nWPdfFoX7wj/NxgVg9/9EqBiE
 0fwecbH2gPUW/PlftSq/J/KSidLcbMyTCqs+m0Fjoh0OxCh/y3xRD60ht9zavriLzkCz
 R64/3D1be8nNC52SN44IeoSzUDbC+3HPomy/nvsmDWxERWpj4CjHFzdFCUmly33k5GA/
 ytBqAd+88b7BDT+q5b+aAQ2PKEUw8YcO9XY0gGl0nMqchDrui5pKvzrt8zrPEQAYHcbQ
 ErstcL3+O7AbEZMS0Z2dZjaX508DbgCnHKrQCTjaDEuBhiA16J0QZ8+a6vz2lMdy0b9A
 mTGQ==
X-Gm-Message-State: AOAM531fWrM2FZ1du8W5FNQRemWVdRyp5Pbk+4BtBWNvwYgXJApfN3Qm
 2AtHO8a+/+uodhkumCTFiCeH9A==
X-Google-Smtp-Source: ABdhPJzfTfhPvIKoajStiP0Jk+NXTDQCz98FZ0nt8J6eE0AwQxi33kjaJJHtM3Mdsh7r9oo3EjEw9Q==
X-Received: by 2002:a63:1a0e:: with SMTP id a14mr22213012pga.294.1624257880728; 
 Sun, 20 Jun 2021 23:44:40 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
 by smtp.gmail.com with ESMTPSA id
 o34sm12744450pgm.6.2021.06.20.23.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:44:40 -0700 (PDT)
From: Tomohito Esaki <etom@igel.co.jp>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATH 2/4] rcar-du: Add support virtual DRM device
Date: Mon, 21 Jun 2021 15:44:01 +0900
Message-Id: <20210621064403.26663-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Jun 2021 07:07:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to use vDRM, it is necessary that the vDRM device is registered
to du decice in the device tree.
The "vdrms" key is added in du node and the vDRM device node is specified.
For example:
----------
& du {
    ...
    vdrms = <&vdrm0>;
};
----------

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/Kconfig        |   4 +
 drivers/gpu/drm/rcar-du/Makefile       |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  42 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  13 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  13 ++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c | 191 +++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h |  67 +++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |  22 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |   1 +
 10 files changed, 357 insertions(+)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..6747f69c8593 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -50,3 +50,7 @@ config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
 	depends on DRM_RCAR_DU
+
+config DRM_RCAR_DU_VDRM
+	tristate "Virtual DRM for R-Car DU"
+	depends on DRM_RCAR_DU && DRM_VDRM
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 4d1187ccc3e5..b589b974a9f3 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -14,6 +14,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 					   rcar_du_of_lvds_r8a7796.dtb.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_DU_VDRM)	+= rcar_du_vdrm.o
 
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..7d48db24090b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -32,6 +32,11 @@
 #include "rcar_du_vsp.h"
 #include "rcar_lvds.h"
 
+#include "rcar_du_vdrm.h"
+#ifdef CONFIG_DRM_RCAR_DU_VDRM
+#include "../vdrm/vdrm_api.h"
+#endif
+
 static u32 rcar_du_crtc_read(struct rcar_du_crtc *rcrtc, u32 reg)
 {
 	struct rcar_du_device *rcdu = rcrtc->dev;
@@ -1293,5 +1298,42 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 	rcar_du_crtc_crc_init(rcrtc);
 
+	INIT_LIST_HEAD(&rcrtc->vdrm_displays);
+	ret = rcar_du_vdrm_crtc_init(rcrtc, swindex);
+	if (ret < 0) {
+		dev_err(rcdu->dev,
+			"failed to initialize crtc %u for vDRM\n", swindex);
+		return ret;
+	}
+
+	return 0;
+}
+
+int rcar_du_crtc_add_vdrm_display(struct rcar_du_crtc *rcrtc,
+				  struct vdrm_display *vdisplay)
+{
+	struct rcar_du_vdrm_display *disp;
+
+	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
+	if (!disp)
+		return -ENOMEM;
+
+	disp->display = vdisplay;
+	INIT_LIST_HEAD(&disp->head);
+	list_add_tail(&disp->head, &rcrtc->vdrm_displays);
+
 	return 0;
 }
+
+void rcar_du_crtc_remove_vdrm_displays(struct rcar_du_crtc *rcrtc)
+{
+	struct rcar_du_vdrm_display *disp, *tmp;
+
+	if (!rcrtc->dev)
+		return;
+
+	list_for_each_entry_safe(disp, tmp, &rcrtc->vdrm_displays, head) {
+		list_del(&disp->head);
+		kfree(disp);
+	}
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 5f2940c42225..1f749f0061e5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -21,6 +21,12 @@
 
 struct rcar_du_group;
 struct rcar_du_vsp;
+struct vdrm_display;
+
+struct rcar_du_vdrm_display {
+	struct vdrm_display *display;
+	struct list_head head;
+};
 
 /**
  * struct rcar_du_crtc - the CRTC, representing a DU superposition processor
@@ -43,6 +49,7 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @vdrm_displays: display list for virtual DRM
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -73,6 +80,8 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+
+	struct list_head vdrm_displays;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
@@ -111,4 +120,8 @@ void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
+int rcar_du_crtc_add_vdrm_display(struct rcar_du_crtc *rcrtc,
+				  struct vdrm_display *vdisplay);
+void rcar_du_crtc_remove_vdrm_displays(struct rcar_du_crtc *rcrtc);
+
 #endif /* __RCAR_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index bfbff90588cb..42f0f5e0144f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -29,6 +29,7 @@
 #include "rcar_du_kms.h"
 #include "rcar_du_of.h"
 #include "rcar_du_regs.h"
+#include "rcar_du_vdrm.h"
 
 /* -----------------------------------------------------------------------------
  * Device Information
@@ -552,6 +553,8 @@ static int rcar_du_remove(struct platform_device *pdev)
 	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
 	struct drm_device *ddev = &rcdu->ddev;
 
+	rcar_du_vdrms_fini(rcdu);
+
 	drm_dev_unregister(ddev);
 
 	drm_kms_helper_poll_fini(ddev);
@@ -584,6 +587,11 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (IS_ERR(rcdu->mmio))
 		return PTR_ERR(rcdu->mmio);
 
+	/* Initialize the vDRM device */
+	ret = rcar_du_vdrms_init(rcdu);
+	if (ret < 0)
+		return ret;
+
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
@@ -607,6 +615,11 @@ static int rcar_du_probe(struct platform_device *pdev)
 
 	drm_fbdev_generic_setup(&rcdu->ddev, 32);
 
+	/* Register the vDRM device */
+	ret = rcar_du_vdrms_register(rcdu);
+	if (ret)
+		DRM_WARN("Setup virtual device failed.\n");
+
 	return 0;
 
 error:
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 02ca2d0e1b55..327f3a250cbe 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -97,6 +97,9 @@ struct rcar_du_device {
 	unsigned int dpad0_source;
 	unsigned int dpad1_source;
 	unsigned int vspd1_sink;
+
+	struct vdrm_device **vdrms;
+	int num_vdrms;
 };
 
 static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vdrm.c b/drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
new file mode 100644
index 000000000000..1f09ead92418
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rcar_du_vdrm.c -- R-Car Display Unit Virtual DRMs
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ */
+
+#include <linux/of_device.h>
+
+#include <drm/drm_print.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <media/vsp1.h>
+
+#include "rcar_du_vdrm.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_crtc.h"
+#include "rcar_du_vsp.h"
+
+static int rcar_du_vdrm_dumb_create(struct drm_file *file,
+				    struct drm_device *dev,
+				    struct drm_mode_create_dumb *args)
+{
+	/*
+	 * TODO:
+	 *   This is Warkarround.
+	 *   In the future, this function will be removed.
+	 *   The vdrm will be modified to directly call the dumb_create
+	 *   callback of the du driver.
+	 */
+	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	unsigned int align;
+
+	/*
+	 * The R8A7779 DU requires a 16 pixels pitch alignment as documented.
+	 */
+	align = 16 * args->bpp / 8;
+
+	args->pitch = roundup(min_pitch, align);
+
+	return drm_gem_cma_dumb_create_internal(file, dev, args);
+}
+
+static void rcar_du_vdrm_crtc_flush(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rcar_du_vsp_atomic_flush(rcrtc);
+}
+
+static struct vdrm_funcs vdrm_funcs = {
+	.dumb_create = rcar_du_vdrm_dumb_create,
+	.crtc_flush = rcar_du_vdrm_crtc_flush,
+};
+
+void rcar_du_vdrm_crtc_complete(struct rcar_du_crtc *crtc, unsigned int status)
+{
+	struct rcar_du_vdrm_display *disp;
+
+	list_for_each_entry(disp, &crtc->vdrm_displays, head) {
+		vdrm_drv_handle_vblank(disp->display);
+		if (status & VSP1_DU_STATUS_COMPLETE)
+			vdrm_drv_finish_page_flip(disp->display);
+	}
+}
+
+int rcar_du_vdrm_count(struct rcar_du_device *rcdu)
+{
+	const struct device_node *np = rcdu->dev->of_node;
+	int num;
+
+	num = of_property_count_u32_elems(np, "vdrms");
+	if (num < 0)
+		return 0;
+
+	return num;
+}
+
+int rcar_du_vdrms_init(struct rcar_du_device *rcdu)
+{
+	struct vdrm_device *vdrm;
+	int num_vdrms;
+	int i, ret;
+
+	num_vdrms = rcar_du_vdrm_count(rcdu);
+	if (num_vdrms == 0)
+		return 0;
+
+	rcdu->vdrms = kcalloc(num_vdrms, sizeof(vdrm), GFP_KERNEL);
+	if (!rcdu->vdrms)
+		return -1;
+
+	DRM_INFO("VDRM: num vdrm = %d\n", num_vdrms);
+
+	for (i = 0; i < num_vdrms; i++) {
+		struct of_phandle_args args;
+		const struct device_node *np = rcdu->dev->of_node;
+
+		ret = of_parse_phandle_with_fixed_args(np, "vdrms", 0, i,
+						       &args);
+		if (ret < 0) {
+			DRM_WARN("VDRM: failed get vdrm%d.\n", i);
+			goto err;
+		}
+
+		vdrm = vdrm_drv_init(&rcdu->ddev, args.np, 0, NULL,
+				     &vdrm_funcs);
+		of_node_put(args.np);
+		if (IS_ERR(vdrm)) {
+			ret = PTR_ERR(vdrm);
+			goto err;
+		}
+
+		rcdu->vdrms[i] = vdrm;
+		rcdu->num_vdrms++;
+	}
+
+	return 0;
+
+err:
+	rcar_du_vdrms_fini(rcdu);
+	rcdu->num_vdrms = 0;
+	return ret;
+}
+
+int rcar_du_vdrm_plane_init(struct vdrm_device *vdrm,
+			    struct rcar_du_vsp_plane *plane,
+			    const struct drm_plane_funcs *funcs,
+			    const struct drm_plane_helper_funcs *helper_funcs,
+			    const u32 *formats, unsigned int num_formats,
+			    int max_zpos)
+{
+	return vdrm_drv_plane_init(vdrm, &plane->plane, funcs,
+				   helper_funcs, formats, num_formats,
+				   max_zpos);
+}
+
+int rcar_du_vdrm_crtc_init(struct rcar_du_crtc *crtc, int index)
+{
+	struct rcar_du_device *rcdu;
+	int i;
+
+	rcdu = crtc->dev;
+	for (i = 0; i < rcdu->num_vdrms; i++) {
+		struct vdrm_display *vdisplay;
+		int plane_index = crtc->vsp->num_planes + i;
+		struct drm_plane *plane =
+			&crtc->vsp->planes[plane_index].plane;
+
+		vdisplay = vdrm_drv_display_init(rcdu->vdrms[i], &crtc->crtc,
+						 plane);
+		if (IS_ERR(vdisplay))
+			return PTR_ERR(vdisplay);
+
+		rcar_du_crtc_add_vdrm_display(crtc, vdisplay);
+	}
+
+	return 0;
+}
+
+int rcar_du_vdrms_register(struct rcar_du_device *rcdu)
+{
+	int i, ret;
+
+	for (i = 0; i < rcdu->num_vdrms; i++) {
+		ret = vdrm_drv_register(rcdu->vdrms[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+void rcar_du_vdrms_fini(struct rcar_du_device *rcdu)
+{
+	int i;
+
+	for (i = 0; i < rcdu->num_vdrms; i++) {
+		if (rcdu->vdrms[i])
+			vdrm_drv_fini(rcdu->vdrms[i]);
+	}
+
+	for (i = 0; i < RCAR_DU_MAX_CRTCS; i++)
+		rcar_du_crtc_remove_vdrm_displays(&rcdu->crtcs[i]);
+
+	kfree(rcdu->vdrms);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vdrm.h b/drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
new file mode 100644
index 000000000000..b12706ceee54
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * rcar_du_vdrm.h -- R-Car Display Unit Virtual DRMs
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation
+ */
+
+#ifndef __RCAR_DU_VDRM_H__
+#define __RCAR_DU_VDRM_H__
+
+#include <drm/drm_atomic.h>
+
+#include "rcar_du_drv.h"
+#include "../vdrm/vdrm_api.h"
+
+#ifdef CONFIG_DRM_RCAR_DU_VDRM
+
+void rcar_du_vdrm_crtc_complete(struct rcar_du_crtc *crtc, unsigned int status);
+void rcar_du_vdrm_vblank_event(struct rcar_du_crtc *crtc);
+int rcar_du_vdrm_count(struct rcar_du_device *rcdu);
+int rcar_du_vdrms_init(struct rcar_du_device *rcdu);
+int rcar_du_vdrm_plane_init(struct vdrm_device *vdrm,
+			    struct rcar_du_vsp_plane *plane,
+			    const struct drm_plane_funcs *funcs,
+			    const struct drm_plane_helper_funcs *helper_funcs,
+			    const u32 *formats, unsigned int num_formats,
+			    int max_zpos);
+int rcar_du_vdrm_crtc_init(struct rcar_du_crtc *crtc, int index);
+int rcar_du_vdrms_register(struct rcar_du_device *rcdu);
+void rcar_du_vdrms_fini(struct rcar_du_device *rcdu);
+
+#else
+
+static inline void
+rcar_du_vdrm_crtc_complete(struct rcar_du_crtc *crtc, unsigned int status) { }
+static inline void rcar_du_vdrm_vblank_event(struct rcar_du_crtc *crtc) { }
+static inline int rcar_du_vdrm_count(struct rcar_du_device *rcdu)
+{
+	return 0;
+}
+static inline int rcar_du_vdrms_init(struct rcar_du_device *rcdu)
+{
+	return 0;
+}
+static inline int
+rcar_du_vdrm_plane_init(struct vdrm_device *vdrm,
+			struct rcar_du_vsp_plane *plane,
+			const struct drm_plane_funcs *funcs,
+			const struct drm_plane_helper_funcs *helper_funcs,
+			const u32 *formats, unsigned int num_formats,
+			int max_zpos)
+{
+	return 0;
+}
+static inline int rcar_du_vdrm_crtc_init(struct rcar_du_crtc *crtc, int index)
+{
+	return 0;
+}
+static inline int rcar_du_vdrms_register(struct rcar_du_device *rcdu)
+{
+	return 0;
+}
+static inline void rcar_du_vdrms_fini(struct rcar_du_device *rcdu) { }
+
+#endif
+
+#endif /* __RCAR_DU_VDRM_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 23e41c83c875..7666441f0005 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -31,6 +31,7 @@
 #include "rcar_du_kms.h"
 #include "rcar_du_vsp.h"
 #include "rcar_du_writeback.h"
+#include "rcar_du_vdrm.h"
 
 static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
 {
@@ -45,6 +46,8 @@ static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
 		rcar_du_writeback_complete(crtc);
 
 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
+
+	rcar_du_vdrm_crtc_complete(crtc, status);
 }
 
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
@@ -373,6 +376,8 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	unsigned int num_planes;
 	unsigned int i;
 	int ret;
+	int num_vdrms;
+	int vdrm_index = 0;
 
 	/* Find the VSP device and initialize it. */
 	pdev = of_find_device_by_node(np);
@@ -395,6 +400,8 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	  */
 	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
 
+	num_vdrms = rcar_du_vdrm_count(rcdu);
+
 	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
 	if (!vsp->planes)
 		return -ENOMEM;
@@ -408,6 +415,21 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		plane->vsp = vsp;
 		plane->index = i;
 
+		if (i >= num_planes - num_vdrms) {
+			ret = rcar_du_vdrm_plane_init(rcdu->vdrms[vdrm_index],
+						plane,
+						&rcar_du_vsp_plane_funcs,
+						&rcar_du_vsp_plane_helper_funcs,
+						rcar_du_vsp_formats,
+						ARRAY_SIZE(rcar_du_vsp_formats),
+						num_planes - 1);
+			if (ret < 0)
+				return ret;
+
+			vdrm_index++;
+			continue;
+		}
+
 		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
 					       crtcs, &rcar_du_vsp_plane_funcs,
 					       rcar_du_vsp_formats,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 9b4724159378..0209def9fa6f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -16,6 +16,7 @@ struct drm_framebuffer;
 struct rcar_du_format_info;
 struct rcar_du_vsp;
 struct sg_table;
+struct vdrm_display;
 
 struct rcar_du_vsp_plane {
 	struct drm_plane plane;
-- 
2.25.1

