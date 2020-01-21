Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BA144D31
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4D86F3D8;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EECD6EBF7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:51:28 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id kx11so1034679pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TfCET6yw7BRqQtlGRnPR0mP3r7eFwZC/4vvqnLD6U20=;
 b=T22CncfNbwn+e+dngR5oMp26Ut+TK3vPxNMrMuv2kb2c5XlgKSSCLKpj5Y0yeQ0b9c
 NRBjxn4S0ZYQxXFevipekG1d3JViH+XXfXYCuwsfHT0A20yvGH7tdTrp7SI5a+p0fwVf
 FoPpjEeOgX9kQ/2MCzOGh3ZC4g4yBXN8SB0acdPG4Si+YN6vil2f5FZ/yUtZT0GjHSYj
 DmOUho9fKI3QltslY8udhqOMz/XGZ2GBLaH4N5SnHVWC40ZWpG7rUmNJ7yM+UAl6UXrp
 5qCtY6JU9DCPQ9VqGZ8yUWplvWVK/dh8MP/zwpVgNSwPCVxPYgI+zf5qP5r5gZkI8zIE
 WFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TfCET6yw7BRqQtlGRnPR0mP3r7eFwZC/4vvqnLD6U20=;
 b=NRdxrFRbAwkCFktG9z+lWYFDi3nr0LzrOxBR4JymPz29l2Vbk9LzFrA/WTu6Ge0Rcv
 lnJ0LnyND5RRaO6u+Slu/9BBaLzT6x3/c8vrta4+KU+ls5SM+N53W3keN6O6KSZeOysp
 aJXZQChSl38qRpOrN6+Sm3MSF7BHfqaR+iXflyObGQc1QMcF2tSep90k+dKxjHoyu7Fj
 eUnLt9epqUdVviakX5EjJPjnkU97YostZ+n2UQ5y7sJTkKZ2ow2oStUat+sRAUH3nTQq
 mNBD62uOvX9Ah2aaiYXtU+0nnwG9pIDTbmGsEILm8OovMyxbAEM++QbNSNjHwCWKOE7h
 XBow==
X-Gm-Message-State: APjAAAVyGAc5KqyeqvcWvZrh67Kp6q465oZKSUYqXmbtomFfdwzUf6tc
 fTy1fXXaNwTlVw7hz7/8F+c=
X-Google-Smtp-Source: APXvYqyQ6F1gtPS9iifsXG0/7gT/He+4V8gdBjg++HsYyjXCwqVxKC7u+s1vLRdNDT30wptRTdEI2A==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
 v10mr4249002plo.90.1579596687476; 
 Tue, 21 Jan 2020 00:51:27 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 80sm42820957pfw.123.2020.01.21.00.51.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jan 2020 00:51:27 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v2 2/6] drm/sprd: add Unisoc's drm kms master
Date: Tue, 21 Jan 2020 16:50:58 +0800
Message-Id: <1579596662-15466-3-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
References: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:09 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

Adds drm support for the Unisoc's display subsystem.

This is drm device and gem driver. This driver provides support for the
Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/Kconfig           |   2 +
 drivers/gpu/drm/Makefile          |   1 +
 drivers/gpu/drm/sprd/Kconfig      |  14 ++
 drivers/gpu/drm/sprd/Makefile     |   9 +
 drivers/gpu/drm/sprd/sprd_crtc.c  | 212 ++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_crtc.h  |  98 ++++++++++
 drivers/gpu/drm/sprd/sprd_drm.c   | 305 +++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_drm.h   |  16 ++
 drivers/gpu/drm/sprd/sprd_plane.c | 393 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/sprd/sprd_plane.h |  36 ++++
 10 files changed, 1086 insertions(+)
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index bfdadc3..cead12c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -387,6 +387,8 @@ source "drivers/gpu/drm/aspeed/Kconfig"
 
 source "drivers/gpu/drm/mcde/Kconfig"
 
+source "drivers/gpu/drm/sprd/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 9f1c7c4..85ca211 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -122,3 +122,4 @@ obj-$(CONFIG_DRM_LIMA)  += lima/
 obj-$(CONFIG_DRM_PANFROST) += panfrost/
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
 obj-$(CONFIG_DRM_MCDE) += mcde/
+obj-$(CONFIG_DRM_SPRD) += sprd/
diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
new file mode 100644
index 0000000..79f286b
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -0,0 +1,14 @@
+config DRM_SPRD
+	tristate "DRM Support for Unisoc SoCs Platform"
+	depends on ARCH_SPRD
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_MIPI_DSI
+	select DRM_PANEL
+	select VIDEOMODE_HELPERS
+	select BACKLIGHT_CLASS_DEVICE
+	help
+	  Choose this option if you have a Unisoc chipsets.
+	  If M is selected the module will be called sprd-drm.
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makefile
new file mode 100644
index 0000000..8a21c23
--- /dev/null
+++ b/drivers/gpu/drm/sprd/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ccflags-y += -Iinclude/drm
+
+subdir-ccflags-y += -I$(src)
+
+obj-y := sprd_drm.o \
+	sprd_crtc.o \
+	sprd_plane.o
\ No newline at end of file
diff --git a/drivers/gpu/drm/sprd/sprd_crtc.c b/drivers/gpu/drm/sprd/sprd_crtc.c
new file mode 100644
index 0000000..4a35281
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_crtc.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/dma-buf.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "sprd_drm.h"
+#include "sprd_crtc.h"
+
+static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->mode_set_nofb)
+		return sprd_crtc->ops->mode_set_nofb(sprd_crtc);
+}
+
+static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc,
+	const struct drm_display_mode *mode)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->mode_valid)
+		return sprd_crtc->ops->mode_valid(sprd_crtc, mode);
+
+	return MODE_OK;
+}
+
+static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_crtc_state *state)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (!state->enable)
+		return 0;
+
+	if (sprd_crtc->ops->atomic_check)
+		return sprd_crtc->ops->atomic_check(sprd_crtc, state);
+
+	return 0;
+}
+
+static void sprd_crtc_atomic_begin(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_crtc_state)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->atomic_begin)
+		sprd_crtc->ops->atomic_begin(sprd_crtc);
+}
+
+static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
+					  struct drm_crtc_state *old_state)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->atomic_enable)
+		sprd_crtc->ops->atomic_enable(sprd_crtc);
+
+	drm_crtc_vblank_on(crtc);
+}
+
+static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
+					   struct drm_crtc_state *old_state)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	drm_crtc_vblank_off(crtc);
+
+	if (sprd_crtc->ops->atomic_disable)
+		sprd_crtc->ops->atomic_disable(sprd_crtc);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+
+		crtc->state->event = NULL;
+	}
+}
+
+static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_crtc_state)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->atomic_flush)
+		sprd_crtc->ops->atomic_flush(sprd_crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs = {
+	.mode_set_nofb	= sprd_crtc_mode_set_nofb,
+	.mode_valid	= sprd_crtc_mode_valid,
+	.atomic_check	= sprd_crtc_atomic_check,
+	.atomic_begin	= sprd_crtc_atomic_begin,
+	.atomic_enable	= sprd_crtc_atomic_enable,
+	.atomic_disable	= sprd_crtc_atomic_disable,
+	.atomic_flush	= sprd_crtc_atomic_flush,
+};
+
+static void sprd_crtc_cleanup(struct drm_crtc *crtc)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	drm_crtc_cleanup(crtc);
+	kfree(sprd_crtc);
+}
+
+static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->enable_vblank)
+		return sprd_crtc->ops->enable_vblank(sprd_crtc);
+
+	return 0;
+}
+
+static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct sprd_crtc *sprd_crtc = to_sprd_crtc(crtc);
+
+	if (sprd_crtc->ops->disable_vblank)
+		sprd_crtc->ops->disable_vblank(sprd_crtc);
+}
+
+static const struct drm_crtc_funcs sprd_crtc_funcs = {
+	.destroy	= sprd_crtc_cleanup,
+	.set_config	= drm_atomic_helper_set_config,
+	.page_flip	= drm_atomic_helper_page_flip,
+	.reset		= drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank	= sprd_crtc_enable_vblank,
+	.disable_vblank	= sprd_crtc_disable_vblank,
+};
+
+struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
+					struct drm_plane *plane,
+					enum sprd_crtc_output_type type,
+					const struct sprd_crtc_ops *ops,
+					void *dpu)
+{
+	struct sprd_crtc *sprd_crtc;
+	int ret;
+
+	sprd_crtc = kzalloc(sizeof(*sprd_crtc), GFP_KERNEL);
+	if (!sprd_crtc)
+		return ERR_PTR(-ENOMEM);
+
+	sprd_crtc->type = type;
+	sprd_crtc->ops = ops;
+	sprd_crtc->dpu = dpu;
+
+	ret = drm_crtc_init_with_planes(drm, &sprd_crtc->base, plane, NULL,
+					&sprd_crtc_funcs, NULL);
+	if (ret < 0) {
+		DRM_ERROR("failed to init crtc.\n");
+		goto err_crtc;
+	}
+
+	drm_mode_crtc_set_gamma_size(&sprd_crtc->base, 256);
+
+	drm_crtc_helper_add(&sprd_crtc->base, &sprd_crtc_helper_funcs);
+
+	return sprd_crtc;
+
+err_crtc:
+	plane->funcs->destroy(plane);
+	kfree(sprd_crtc);
+	return ERR_PTR(ret);
+}
+
+struct sprd_crtc *sprd_crtc_get_by_type(struct drm_device *drm,
+				       enum sprd_crtc_output_type out_type)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, drm)
+		if (to_sprd_crtc(crtc)->type == out_type)
+			return to_sprd_crtc(crtc);
+
+	return ERR_PTR(-EPERM);
+}
+
+int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
+		enum sprd_crtc_output_type out_type)
+{
+	struct sprd_crtc *crtc = sprd_crtc_get_by_type(encoder->dev,
+						out_type);
+
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
+
+	encoder->possible_crtcs = drm_crtc_mask(&crtc->base);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/sprd/sprd_crtc.h b/drivers/gpu/drm/sprd/sprd_crtc.h
new file mode 100644
index 0000000..9dbb2eb
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_crtc.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef __SPRD_CRTC_H__
+#define __SPRD_CRTC_H__
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_print.h>
+
+#define to_sprd_crtc(x)			container_of(x, struct sprd_crtc, base)
+
+enum sprd_crtc_output_type {
+	SPRD_DISPLAY_TYPE_NONE,
+	/* RGB or CPU Interface */
+	SPRD_DISPLAY_TYPE_LCD,
+	/* DisplayPort Interface */
+	SPRD_DISPLAY_TYPE_DP,
+	/* HDMI Interface */
+	SPRD_DISPLAY_TYPE_HDMI,
+};
+
+struct dpu_capability {
+	u32 max_layers;
+	const u32 *fmts_ptr;
+	u32 fmts_cnt;
+};
+
+struct sprd_dpu_layer {
+	u8 index;
+	u8 planes;
+	u32 addr[4];
+	u32 pitch[4];
+	s16 src_x;
+	s16 src_y;
+	s16 src_w;
+	s16 src_h;
+	s16 dst_x;
+	s16 dst_y;
+	u16 dst_w;
+	u16 dst_h;
+	u32 format;
+	u32 alpha;
+	u32 blending;
+	u32 rotation;
+	u32 xfbc;
+	u32 height;
+	u32 header_size_r;
+	u32 header_size_y;
+	u32 header_size_uv;
+	u32 y2r_coef;
+	u8 pallete_en;
+	u32 pallete_color;
+};
+
+struct sprd_crtc {
+	struct drm_crtc base;
+	enum sprd_crtc_output_type type;
+	const struct sprd_crtc_ops *ops;
+	struct sprd_dpu_layer *layers;
+	u8 pending_planes;
+	void *dpu;
+};
+
+struct sprd_crtc_ops {
+	void (*atomic_enable)(struct sprd_crtc *crtc);
+	void (*atomic_disable)(struct sprd_crtc *crtc);
+	int (*enable_vblank)(struct sprd_crtc *crtc);
+	void (*disable_vblank)(struct sprd_crtc *crtc);
+	enum drm_mode_status (*mode_valid)(struct sprd_crtc *crtc,
+		const struct drm_display_mode *mode);
+	void (*mode_set_nofb)(struct sprd_crtc *crtc);
+	int (*atomic_check)(struct sprd_crtc *crtc,
+			    struct drm_crtc_state *state);
+	void (*atomic_begin)(struct sprd_crtc *crtc);
+	void (*atomic_flush)(struct sprd_crtc *crtc);
+
+	int (*prepare_fb)(struct sprd_crtc *crtc,
+			  struct drm_plane_state *new_state);
+	void (*cleanup_fb)(struct sprd_crtc *crtc,
+			   struct drm_plane_state *old_state);
+	void (*atomic_update)(struct sprd_crtc *crtc,
+			     struct drm_plane *plane);
+};
+
+struct sprd_crtc *sprd_crtc_init(struct drm_device *drm,
+					struct drm_plane *plane,
+					enum sprd_crtc_output_type type,
+					const struct sprd_crtc_ops *ops,
+					void *dpu);
+int sprd_drm_set_possible_crtcs(struct drm_encoder *encoder,
+		enum sprd_crtc_output_type out_type);
+
+#endif
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
new file mode 100644
index 0000000..d63b7e3
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/component.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "sprd_drm.h"
+
+#define DRIVER_NAME	"sprd"
+#define DRIVER_DESC	"Spreadtrum SoCs' DRM Driver"
+#define DRIVER_DATE	"20191101"
+#define DRIVER_MAJOR	1
+#define DRIVER_MINOR	0
+
+static const struct drm_mode_config_helper_funcs sprd_drm_mode_config_helper = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+static const struct drm_mode_config_funcs sprd_drm_mode_config_funcs = {
+	.fb_create = drm_gem_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static void sprd_drm_mode_config_init(struct drm_device *drm)
+{
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 8192;
+	drm->mode_config.max_height = 8192;
+	drm->mode_config.allow_fb_modifiers = true;
+
+	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
+	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
+}
+
+static const struct file_operations sprd_drm_fops = {
+	.owner		= THIS_MODULE,
+	.open		= drm_open,
+	.release	= drm_release,
+	.unlocked_ioctl	= drm_ioctl,
+	.compat_ioctl	= drm_compat_ioctl,
+	.poll		= drm_poll,
+	.read		= drm_read,
+	.llseek		= no_llseek,
+	.mmap		= drm_gem_cma_mmap,
+};
+
+static struct drm_driver sprd_drm_drv = {
+	.driver_features	= DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			= &sprd_drm_fops,
+	.gem_vm_ops		= &drm_gem_cma_vm_ops,
+	.gem_free_object_unlocked	= drm_gem_cma_free_object,
+	.dumb_create		= drm_gem_cma_dumb_create,
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
+	.gem_prime_import	= drm_gem_prime_import,
+	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+
+	.name			= DRIVER_NAME,
+	.desc			= DRIVER_DESC,
+	.date			= DRIVER_DATE,
+	.major			= DRIVER_MAJOR,
+	.minor			= DRIVER_MINOR,
+};
+
+static int sprd_drm_bind(struct device *dev)
+{
+	struct drm_device *drm;
+	struct sprd_drm *sprd;
+	int err;
+
+	drm = drm_dev_alloc(&sprd_drm_drv, dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	dev_set_drvdata(dev, drm);
+
+	sprd = devm_kzalloc(drm->dev, sizeof(*sprd), GFP_KERNEL);
+	if (!sprd) {
+		err = -ENOMEM;
+		goto err_free_drm;
+	}
+	drm->dev_private = sprd;
+
+	sprd_drm_mode_config_init(drm);
+
+	/* bind and init sub drivers */
+	err = component_bind_all(drm->dev, drm);
+	if (err) {
+		DRM_ERROR("failed to bind all component.\n");
+		goto err_dc_cleanup;
+	}
+
+	/* vblank init */
+	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (err) {
+		DRM_ERROR("failed to initialize vblank.\n");
+		goto err_unbind_all;
+	}
+	/* with irq_enabled = true, we can use the vblank feature. */
+	drm->irq_enabled = true;
+
+	/* reset all the states of crtc/plane/encoder/connector */
+	drm_mode_config_reset(drm);
+
+	/* init kms poll for handling hpd */
+	drm_kms_helper_poll_init(drm);
+
+	err = drm_dev_register(drm, 0);
+	if (err < 0)
+		goto err_kms_helper_poll_fini;
+
+	return 0;
+
+err_kms_helper_poll_fini:
+	drm_kms_helper_poll_fini(drm);
+err_unbind_all:
+	component_unbind_all(drm->dev, drm);
+err_dc_cleanup:
+	drm_mode_config_cleanup(drm);
+err_free_drm:
+	drm_dev_put(drm);
+	return err;
+}
+
+static void sprd_drm_unbind(struct device *dev)
+{
+	drm_put_dev(dev_get_drvdata(dev));
+}
+
+static const struct component_master_ops drm_component_ops = {
+	.bind = sprd_drm_bind,
+	.unbind = sprd_drm_unbind,
+};
+
+static int compare_of(struct device *dev, void *data)
+{
+	struct device_node *np = data;
+
+	DRM_DEBUG("compare %s\n", np->full_name);
+
+	return dev->of_node == np;
+}
+
+static int sprd_drm_component_probe(struct device *dev,
+			   const struct component_master_ops *m_ops)
+{
+	struct device_node *ep, *port, *remote;
+	struct component_match *match = NULL;
+	int i;
+
+	if (!dev->of_node)
+		return -EINVAL;
+
+	/*
+	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
+	 * called from encoder's .bind callbacks works as expected
+	 */
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		component_match_add(dev, &match, compare_of, port->parent);
+		of_node_put(port);
+	}
+
+	if (i == 0) {
+		dev_err(dev, "missing 'ports' property\n");
+		return -ENODEV;
+	}
+
+	if (!match) {
+		dev_err(dev, "no available port\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * For bound crtcs, bind the encoders attached to their remote endpoint
+	 */
+	for (i = 0; ; i++) {
+		port = of_parse_phandle(dev->of_node, "ports", i);
+		if (!port)
+			break;
+
+		if (!of_device_is_available(port->parent)) {
+			of_node_put(port);
+			continue;
+		}
+
+		for_each_child_of_node(port, ep) {
+			remote = of_graph_get_remote_port_parent(ep);
+			if (!remote || !of_device_is_available(remote)) {
+				of_node_put(remote);
+				continue;
+			} else if (!of_device_is_available(remote->parent)) {
+				dev_warn(dev, "parent device of %s is not available\n",
+					 remote->full_name);
+				of_node_put(remote);
+				continue;
+			}
+
+			component_match_add(dev, &match, compare_of, remote);
+			of_node_put(remote);
+		}
+		of_node_put(port);
+	}
+
+	return component_master_add_with_match(dev, m_ops, match);
+}
+
+static int sprd_drm_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret) {
+		DRM_ERROR("dma_set_mask_and_coherent failed (%d)\n", ret);
+		return ret;
+	}
+
+	return sprd_drm_component_probe(&pdev->dev, &drm_component_ops);
+}
+
+static int sprd_drm_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &drm_component_ops);
+	return 0;
+}
+
+static void sprd_drm_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (!drm) {
+		DRM_WARN("drm device is not available, no shutdown\n");
+		return;
+	}
+
+	drm_atomic_helper_shutdown(drm);
+}
+
+static const struct of_device_id drm_match_table[] = {
+	{ .compatible = "sprd,display-subsystem", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, drm_match_table);
+
+static struct platform_driver sprd_drm_driver = {
+	.probe = sprd_drm_probe,
+	.remove = sprd_drm_remove,
+	.shutdown = sprd_drm_shutdown,
+	.driver = {
+		.name = "sprd-drm-drv",
+		.of_match_table = drm_match_table,
+	},
+};
+
+static struct platform_driver *sprd_drm_drivers[]  = {
+	&sprd_drm_driver,
+};
+
+static int __init sprd_drm_init(void)
+{
+	int ret;
+
+	ret = platform_register_drivers(sprd_drm_drivers,
+					ARRAY_SIZE(sprd_drm_drivers));
+	return ret;
+}
+
+static void __exit sprd_drm_exit(void)
+{
+	platform_unregister_drivers(sprd_drm_drivers,
+				    ARRAY_SIZE(sprd_drm_drivers));
+}
+
+module_init(sprd_drm_init);
+module_exit(sprd_drm_exit);
+
+MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
+MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
+MODULE_DESCRIPTION("Unisoc DRM KMS Master Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sprd_drm.h
new file mode 100644
index 0000000..137cb27
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_drm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef _SPRD_DRM_H_
+#define _SPRD_DRM_H_
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_print.h>
+
+struct sprd_drm {
+	struct drm_device *drm;
+};
+
+#endif /* _SPRD_DRM_H_ */
diff --git a/drivers/gpu/drm/sprd/sprd_plane.c b/drivers/gpu/drm/sprd/sprd_plane.c
new file mode 100644
index 0000000..15ebb97
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_plane.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#include <linux/dma-buf.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "sprd_crtc.h"
+#include "sprd_drm.h"
+#include "sprd_plane.h"
+
+static int sprd_plane_prepare_fb(struct drm_plane *plane,
+				struct drm_plane_state *new_state)
+{
+	struct drm_plane_state *curr_state = plane->state;
+	struct sprd_crtc *crtc = to_sprd_crtc(new_state->crtc);
+
+	if ((curr_state->fb == new_state->fb) || !new_state->fb)
+		return 0;
+
+	if (crtc->ops->prepare_fb)
+		crtc->ops->prepare_fb(crtc, new_state);
+
+	return 0;
+}
+
+static void sprd_plane_cleanup_fb(struct drm_plane *plane,
+				struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *curr_state = plane->state;
+	struct sprd_crtc *crtc = to_sprd_crtc(old_state->crtc);
+
+	if ((curr_state->fb == old_state->fb) || !old_state->fb)
+		return;
+
+	if (crtc->ops->cleanup_fb)
+		crtc->ops->cleanup_fb(crtc, old_state);
+}
+
+static void sprd_plane_atomic_update(struct drm_plane *plane,
+				    struct drm_plane_state *old_state)
+{
+	struct drm_plane_state *state = plane->state;
+	struct drm_framebuffer *fb = plane->state->fb;
+	struct drm_gem_cma_object *cma_obj;
+	struct sprd_crtc *crtc = to_sprd_crtc(plane->state->crtc);
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_plane_state *s = to_sprd_plane_state(state);
+	struct sprd_dpu_layer *layer = &crtc->layers[p->index];
+	int i;
+
+	if (plane->state->crtc->state->active_changed) {
+		DRM_DEBUG("resume or suspend, no need to update plane\n");
+		return;
+	}
+
+	if (s->pallete_en) {
+		layer->index = p->index;
+		layer->dst_x = state->crtc_x;
+		layer->dst_y = state->crtc_y;
+		layer->dst_w = state->crtc_w;
+		layer->dst_h = state->crtc_h;
+		layer->alpha = state->alpha;
+		layer->blending = state->pixel_blend_mode;
+		layer->pallete_en = s->pallete_en;
+		layer->pallete_color = s->pallete_color;
+		crtc->pending_planes++;
+		DRM_DEBUG("%s() pallete_color = %u, index = %u\n",
+			__func__, layer->pallete_color, layer->index);
+		return;
+	}
+
+	layer->index = p->index;
+	layer->src_x = state->src_x >> 16;
+	layer->src_y = state->src_y >> 16;
+	layer->src_w = state->src_w >> 16;
+	layer->src_h = state->src_h >> 16;
+	layer->dst_x = state->crtc_x;
+	layer->dst_y = state->crtc_y;
+	layer->dst_w = state->crtc_w;
+	layer->dst_h = state->crtc_h;
+	layer->rotation = state->rotation;
+	layer->blending = state->pixel_blend_mode;
+	layer->rotation = state->rotation;
+	layer->planes = fb->format->num_planes;
+	layer->format = fb->format->format;
+	layer->xfbc = fb->modifier;
+	layer->header_size_r = s->fbc_hsize_r;
+	layer->header_size_y = s->fbc_hsize_y;
+	layer->header_size_uv = s->fbc_hsize_uv;
+	layer->y2r_coef = s->y2r_coef;
+	layer->pallete_en = s->pallete_en;
+	layer->pallete_color = s->pallete_color;
+
+	DRM_DEBUG("%s() alpha = %u, blending = %u, rotation = %u, y2r_coef = %u\n",
+		  __func__, layer->alpha, layer->blending, layer->rotation, s->y2r_coef);
+
+	DRM_DEBUG("%s() xfbc = %u, hsize_r = %u, hsize_y = %u, hsize_uv = %u\n",
+		  __func__, layer->xfbc, layer->header_size_r,
+		  layer->header_size_y, layer->header_size_uv);
+
+	for (i = 0; i < layer->planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		layer->addr[i] = cma_obj->paddr + fb->offsets[i];
+		layer->pitch[i] = fb->pitches[i];
+	}
+
+	crtc->pending_planes++;
+}
+
+static int sprd_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state)
+{
+	DRM_DEBUG("%s()\n", __func__);
+
+	return 0;
+}
+
+static void sprd_plane_atomic_disable(struct drm_plane *plane,
+				     struct drm_plane_state *old_state)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+
+	/*
+	 * NOTE:
+	 * The dpu->core->flip() will disable all the planes each time.
+	 * So there is no need to impliment the atomic_disable() function.
+	 * But this function can not be removed, because it will change
+	 * to call atomic_update() callback instead. Which will cause
+	 * kernel panic in sprd_plane_atomic_update().
+	 *
+	 * We do nothing here but just print a debug log.
+	 */
+	DRM_DEBUG("%s() layer_id = %u\n", __func__, p->index);
+}
+
+static const struct drm_plane_helper_funcs sprd_plane_helper_funcs = {
+	.prepare_fb = sprd_plane_prepare_fb,
+	.cleanup_fb = sprd_plane_cleanup_fb,
+	.atomic_check = sprd_plane_atomic_check,
+	.atomic_update = sprd_plane_atomic_update,
+	.atomic_disable = sprd_plane_atomic_disable,
+};
+
+static void sprd_plane_reset(struct drm_plane *plane)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_plane_state *s;
+
+	DRM_INFO("%s()\n", __func__);
+
+	if (plane->state) {
+		__drm_atomic_helper_plane_destroy_state(plane->state);
+
+		s = to_sprd_plane_state(plane->state);
+		memset(s, 0, sizeof(*s));
+	} else {
+		s = kzalloc(sizeof(*s), GFP_KERNEL);
+		if (!s)
+			return;
+		plane->state = &s->state;
+	}
+
+	s->state.plane = plane;
+	s->state.zpos = p->index;
+	s->state.alpha = 255;
+	s->state.pixel_blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+}
+
+static struct drm_plane_state *
+sprd_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct sprd_plane_state *s;
+	struct sprd_plane_state *old_state = to_sprd_plane_state(plane->state);
+
+	DRM_DEBUG("%s()\n", __func__);
+
+	s = kzalloc(sizeof(*s), GFP_KERNEL);
+	if (!s)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &s->state);
+
+	WARN_ON(s->state.plane != plane);
+
+	s->fbc_hsize_r = old_state->fbc_hsize_r;
+	s->fbc_hsize_y = old_state->fbc_hsize_y;
+	s->fbc_hsize_uv = old_state->fbc_hsize_uv;
+	s->y2r_coef = old_state->y2r_coef;
+	s->pallete_en = old_state->pallete_en;
+	s->pallete_color = old_state->pallete_color;
+
+	return &s->state;
+}
+
+static void sprd_plane_atomic_destroy_state(struct drm_plane *plane,
+					    struct drm_plane_state *state)
+{
+	DRM_DEBUG("%s()\n", __func__);
+
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_sprd_plane_state(state));
+}
+
+static int sprd_plane_atomic_set_property(struct drm_plane *plane,
+					  struct drm_plane_state *state,
+					  struct drm_property *property,
+					  u64 val)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+	struct sprd_plane_state *s = to_sprd_plane_state(state);
+
+	DRM_DEBUG("%s() name = %s, val = %llu\n",
+		  __func__, property->name, val);
+
+	if (property == p->fbc_hsize_r_property)
+		s->fbc_hsize_r = val;
+	else if (property == p->fbc_hsize_y_property)
+		s->fbc_hsize_y = val;
+	else if (property == p->fbc_hsize_uv_property)
+		s->fbc_hsize_uv = val;
+	else if (property == p->y2r_coef_property)
+		s->y2r_coef = val;
+	else if (property == p->pallete_en_property)
+		s->pallete_en = val;
+	else if (property == p->pallete_color_property)
+		s->pallete_color = val;
+	else {
+		DRM_ERROR("property %s is invalid\n", property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sprd_plane_atomic_get_property(struct drm_plane *plane,
+					  const struct drm_plane_state *state,
+					  struct drm_property *property,
+					  u64 *val)
+{
+	struct sprd_plane *p = to_sprd_plane(plane);
+	const struct sprd_plane_state *s = to_sprd_plane_state(state);
+
+	DRM_DEBUG("%s() name = %s\n", __func__, property->name);
+
+	if (property == p->fbc_hsize_r_property)
+		*val = s->fbc_hsize_r;
+	else if (property == p->fbc_hsize_y_property)
+		*val = s->fbc_hsize_y;
+	else if (property == p->fbc_hsize_uv_property)
+		*val = s->fbc_hsize_uv;
+	else if (property == p->y2r_coef_property)
+		*val = s->y2r_coef;
+	else if (property == p->pallete_en_property)
+		*val = s->pallete_en;
+	else if (property == p->pallete_color_property)
+		*val = s->pallete_color;
+	else {
+		DRM_ERROR("property %s is invalid\n", property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct drm_plane_funcs sprd_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane	= drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = sprd_plane_reset,
+	.atomic_duplicate_state = sprd_plane_atomic_duplicate_state,
+	.atomic_destroy_state = sprd_plane_atomic_destroy_state,
+	.atomic_set_property = sprd_plane_atomic_set_property,
+	.atomic_get_property = sprd_plane_atomic_get_property,
+};
+
+static int sprd_plane_create_properties(struct sprd_plane *p, int index)
+{
+	struct drm_property *prop;
+	unsigned int supported_modes = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+				       BIT(DRM_MODE_BLEND_PREMULTI) |
+				       BIT(DRM_MODE_BLEND_COVERAGE);
+
+	/* create rotation property */
+	drm_plane_create_rotation_property(&p->plane,
+					   DRM_MODE_ROTATE_0,
+					   DRM_MODE_ROTATE_MASK |
+					   DRM_MODE_REFLECT_MASK);
+
+	/* create alpha property */
+	drm_plane_create_alpha_property(&p->plane);
+
+	/* create blend mode property */
+	drm_plane_create_blend_mode_property(&p->plane, supported_modes);
+
+	/* create zpos property */
+	drm_plane_create_zpos_immutable_property(&p->plane, index);
+
+	/* create fbc header size property */
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"FBC header size RGB", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->fbc_hsize_r_property = prop;
+
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"FBC header size Y", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->fbc_hsize_y_property = prop;
+
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"FBC header size UV", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->fbc_hsize_uv_property = prop;
+
+	/* create y2r coef property */
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"YUV2RGB coef", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->y2r_coef_property = prop;
+
+	/* create pallete enable property */
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"pallete enable", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->pallete_en_property = prop;
+
+	/* create pallete color property */
+	prop = drm_property_create_range(p->plane.dev, 0,
+			"pallete color", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+	drm_object_attach_property(&p->plane.base, prop, 0);
+	p->pallete_color_property = prop;
+
+	return 0;
+}
+
+struct drm_plane *sprd_plane_init(struct drm_device *drm,
+					struct dpu_capability *cap,
+					enum drm_plane_type type)
+{
+	struct drm_plane *primary = NULL;
+	struct sprd_plane *p = NULL;
+	int err, i;
+
+	for (i = 0; i < cap->max_layers; i++) {
+
+		p = devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return ERR_PTR(-ENOMEM);
+
+		err = drm_universal_plane_init(drm, &p->plane,
+					       1 << drm->mode_config.num_crtc,
+					       &sprd_plane_funcs, cap->fmts_ptr,
+					       cap->fmts_cnt, NULL,
+					       type, NULL);
+		if (err) {
+			DRM_ERROR("fail to init primary plane\n");
+			return ERR_PTR(err);
+		}
+
+		drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs);
+
+		sprd_plane_create_properties(p, i);
+
+		p->index = i;
+		if (i == 0)
+			primary = &p->plane;
+	}
+
+	if (p)
+		DRM_INFO("dpu plane init ok\n");
+
+	return primary;
+}
diff --git a/drivers/gpu/drm/sprd/sprd_plane.h b/drivers/gpu/drm/sprd/sprd_plane.h
new file mode 100644
index 0000000..f63776a8
--- /dev/null
+++ b/drivers/gpu/drm/sprd/sprd_plane.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Unisoc Inc.
+ */
+
+#ifndef __SPRD_PLANE_H__
+#define __SPRD_PLANE_H__
+
+#define to_sprd_plane(x)		container_of(x, struct sprd_plane, plane)
+#define to_sprd_plane_state(x)	container_of(x, struct sprd_plane_state, state)
+
+struct sprd_plane_state {
+	struct drm_plane_state state;
+	u32 fbc_hsize_r;
+	u32 fbc_hsize_y;
+	u32 fbc_hsize_uv;
+	u32 y2r_coef;
+	u32 pallete_en;
+	u32 pallete_color;
+};
+
+struct sprd_plane {
+	struct drm_plane plane;
+	struct drm_property *fbc_hsize_r_property;
+	struct drm_property *fbc_hsize_y_property;
+	struct drm_property *fbc_hsize_uv_property;
+	struct drm_property *y2r_coef_property;
+	struct drm_property *pallete_en_property;
+	struct drm_property *pallete_color_property;
+	u32 index;
+};
+
+struct drm_plane *sprd_plane_init(struct drm_device *dev,
+					struct dpu_capability *cap,
+					enum drm_plane_type type);
+#endif
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
