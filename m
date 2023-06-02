Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433BB71FBA1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001D910E0B5;
	Fri,  2 Jun 2023 08:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id A173610E628
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 07:46:05 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7D9A48116;
 Fri,  2 Jun 2023 15:40:49 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:49 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:48 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
Date: Fri, 2 Jun 2023 15:40:40 +0800
Message-ID: <20230602074043.33872-7-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602074043.33872-1-keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Jun 2023 08:14:07 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add crtc driver which implements crtc related operation functions.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile  |   1 +
 drivers/gpu/drm/verisilicon/vs_crtc.c | 388 ++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h |  74 +++++
 drivers/gpu/drm/verisilicon/vs_type.h |  72 +++++
 4 files changed, 535 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
index 38254dc5d98d..bae5fbab9bbb 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 vs_drm-objs :=3D vs_drv.o \
+		vs_crtc.o \
 		vs_fb.o \
 		vs_gem.o
=20
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.c b/drivers/gpu/drm/veri=
silicon/vs_crtc.c
new file mode 100644
index 000000000000..a9e742d7bd1a
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/media-bus-format.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/vs_drm.h>
+
+#include "vs_crtc.h"
+
+void vs_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+
+	drm_crtc_cleanup(crtc);
+	kfree(vs_crtc);
+}
+
+static void vs_crtc_reset(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *state;
+
+	if (crtc->state) {
+		__drm_atomic_helper_crtc_destroy_state(crtc->state);
+
+		state =3D to_vs_crtc_state(crtc->state);
+		kfree(state);
+		crtc->state =3D NULL;
+	}
+
+	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+
+	state->sync_mode =3D VS_SINGLE_DC;
+	state->output_fmt =3D MEDIA_BUS_FMT_RBG888_1X24;
+	state->encoder_type =3D DRM_MODE_ENCODER_NONE;
+}
+
+static struct drm_crtc_state *
+vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *ori_state;
+	struct vs_crtc_state *state;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	ori_state =3D to_vs_crtc_state(crtc->state);
+	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+
+	state->sync_mode =3D ori_state->sync_mode;
+	state->output_fmt =3D ori_state->output_fmt;
+	state->encoder_type =3D ori_state->encoder_type;
+	state->bg_color =3D ori_state->bg_color;
+	state->bpp =3D ori_state->bpp;
+	state->sync_enable =3D ori_state->sync_enable;
+	state->dither_enable =3D ori_state->dither_enable;
+	state->underflow =3D ori_state->underflow;
+
+	return &state->base;
+}
+
+static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					 struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_vs_crtc_state(state));
+}
+
+static int vs_crtc_atomic_set_property(struct drm_crtc *crtc,
+				       struct drm_crtc_state *state,
+				       struct drm_property *property,
+				       uint64_t val)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(state);
+
+	if (property =3D=3D vs_crtc->sync_mode)
+		vs_crtc_state->sync_mode =3D val;
+	else if (property =3D=3D vs_crtc->mmu_prefetch)
+		vs_crtc_state->mmu_prefetch =3D val;
+	else if (property =3D=3D vs_crtc->bg_color)
+		vs_crtc_state->bg_color =3D val;
+	else if (property =3D=3D vs_crtc->panel_sync)
+		vs_crtc_state->sync_enable =3D val;
+	else if (property =3D=3D vs_crtc->dither)
+		vs_crtc_state->dither_enable =3D val;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int vs_crtc_atomic_get_property(struct drm_crtc *crtc,
+				       const struct drm_crtc_state *state,
+				       struct drm_property *property,
+				       uint64_t *val)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+	const struct vs_crtc_state *vs_crtc_state =3D
+		container_of(state, const struct vs_crtc_state, base);
+
+	if (property =3D=3D vs_crtc->sync_mode)
+		*val =3D vs_crtc_state->sync_mode;
+	else if (property =3D=3D vs_crtc->mmu_prefetch)
+		*val =3D vs_crtc_state->mmu_prefetch;
+	else if (property =3D=3D vs_crtc->bg_color)
+		*val =3D vs_crtc_state->bg_color;
+	else if (property =3D=3D vs_crtc->panel_sync)
+		*val =3D vs_crtc_state->sync_enable;
+	else if (property =3D=3D vs_crtc->dither)
+		*val =3D vs_crtc_state->dither_enable;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int vs_crtc_late_register(struct drm_crtc *crtc)
+{
+	return 0;
+}
+
+static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+
+	vs_crtc->funcs->enable_vblank(vs_crtc->dev, true);
+
+	return 0;
+}
+
+static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+
+	vs_crtc->funcs->enable_vblank(vs_crtc->dev, false);
+}
+
+static const struct drm_crtc_funcs vs_crtc_funcs =3D {
+	.set_config		=3D drm_atomic_helper_set_config,
+	.destroy		=3D vs_crtc_destroy,
+	.page_flip		=3D drm_atomic_helper_page_flip,
+	.reset			=3D vs_crtc_reset,
+	.atomic_duplicate_state =3D vs_crtc_atomic_duplicate_state,
+	.atomic_destroy_state	=3D vs_crtc_atomic_destroy_state,
+	.atomic_set_property	=3D vs_crtc_atomic_set_property,
+	.atomic_get_property	=3D vs_crtc_atomic_get_property,
+	.late_register		=3D vs_crtc_late_register,
+	.enable_vblank		=3D vs_crtc_enable_vblank,
+	.disable_vblank		=3D vs_crtc_disable_vblank,
+};
+
+static u8 cal_pixel_bits(u32 bus_format)
+{
+	u8 bpp;
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		bpp =3D 16;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		bpp =3D 18;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		bpp =3D 20;
+		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		bpp =3D 24;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		bpp =3D 30;
+		break;
+	default:
+		bpp =3D 24;
+		break;
+	}
+
+	return bpp;
+}
+
+static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+
+	return vs_crtc->funcs->mode_fixup(vs_crtc->dev, mode, adjusted_mode);
+}
+
+static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc->state);
+
+	vs_crtc_state->bpp =3D cal_pixel_bits(vs_crtc_state->output_fmt);
+
+	vs_crtc->funcs->enable(vs_crtc->dev, crtc);
+	drm_crtc_vblank_on(crtc);
+}
+
+static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+
+	drm_crtc_vblank_off(crtc);
+
+	vs_crtc->funcs->disable(vs_crtc->dev, crtc);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+
+		crtc->state->event =3D NULL;
+	}
+}
+
+static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te,
+									  crtc);
+
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+	struct device *dev =3D vs_crtc->dev;
+	struct drm_property_blob *blob =3D crtc->state->gamma_lut;
+	struct drm_color_lut *lut;
+
+	if (crtc_state->color_mgmt_changed) {
+		if (blob && blob->length) {
+			lut =3D blob->data;
+			vs_crtc->funcs->set_gamma(dev, crtc, lut,
+						  blob->length / sizeof(*lut));
+			vs_crtc->funcs->enable_gamma(dev, crtc, true);
+		} else {
+			vs_crtc->funcs->enable_gamma(dev, crtc, false);
+		}
+	}
+}
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct vs_crtc *vs_crtc =3D to_vs_crtc(crtc);
+	struct drm_pending_vblank_event *event =3D crtc->state->event;
+
+	vs_crtc->funcs->commit(vs_crtc->dev);
+
+	if (event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_arm_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+		crtc->state->event =3D NULL;
+	}
+}
+
+static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs =3D {
+	.mode_fixup =3D vs_crtc_mode_fixup,
+	.atomic_enable	=3D vs_crtc_atomic_enable,
+	.atomic_disable =3D vs_crtc_atomic_disable,
+	.atomic_begin	=3D vs_crtc_atomic_begin,
+	.atomic_flush	=3D vs_crtc_atomic_flush,
+};
+
+static const struct drm_prop_enum_list vs_sync_mode_enum_list[] =3D {
+	{ VS_SINGLE_DC,			"single dc mode" },
+	{ VS_MULTI_DC_PRIMARY,		"primary dc for multi dc mode" },
+	{ VS_MULTI_DC_SECONDARY,	"secondary dc for multi dc mode" },
+};
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       struct vs_dc_info *info)
+{
+	struct vs_crtc *crtc;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	crtc =3D kzalloc(sizeof(*crtc), GFP_KERNEL);
+	if (!crtc)
+		return NULL;
+
+	ret =3D drm_crtc_init_with_planes(drm_dev, &crtc->base,
+					NULL, NULL, &vs_crtc_funcs,
+					info->name ? info->name : NULL);
+	if (ret)
+		goto err_free_crtc;
+
+	drm_crtc_helper_add(&crtc->base, &vs_crtc_helper_funcs);
+
+	/* Set up the crtc properties */
+	if (info->pipe_sync) {
+		crtc->sync_mode =3D drm_property_create_enum(drm_dev, 0,
+							   "SYNC_MODE",
+							    vs_sync_mode_enum_list,
+							    ARRAY_SIZE(vs_sync_mode_enum_list));
+
+		if (!crtc->sync_mode)
+			goto err_cleanup_crts;
+
+		drm_object_attach_property(&crtc->base.base,
+					   crtc->sync_mode,
+					   VS_SINGLE_DC);
+	}
+
+	if (info->gamma_size) {
+		ret =3D drm_mode_crtc_set_gamma_size(&crtc->base,
+						   info->gamma_size);
+		if (ret)
+			goto err_cleanup_crts;
+
+		drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
+					   info->gamma_size);
+	}
+
+	if (info->background) {
+		crtc->bg_color =3D drm_property_create_range(drm_dev, 0,
+							   "BG_COLOR", 0, 0xffffffff);
+
+		if (!crtc->bg_color)
+			goto err_cleanup_crts;
+
+		drm_object_attach_property(&crtc->base.base, crtc->bg_color, 0);
+	}
+
+	if (info->panel_sync) {
+		crtc->panel_sync =3D drm_property_create_bool(drm_dev, 0, "SYNC_ENABLE=
D");
+
+		if (!crtc->panel_sync)
+			goto err_cleanup_crts;
+
+		drm_object_attach_property(&crtc->base.base, crtc->panel_sync, 0);
+	}
+
+	crtc->dither =3D drm_property_create_bool(drm_dev, 0, "DITHER_ENABLED")=
;
+	if (!crtc->dither)
+		goto err_cleanup_crts;
+
+	drm_object_attach_property(&crtc->base.base, crtc->dither, 0);
+
+	crtc->max_bpc =3D info->max_bpc;
+	crtc->color_formats =3D info->color_formats;
+	return crtc;
+
+err_cleanup_crts:
+	drm_crtc_cleanup(&crtc->base);
+
+err_free_crtc:
+	kfree(crtc);
+	return NULL;
+}
+
+void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow)
+{
+	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc->state);
+
+	drm_crtc_handle_vblank(crtc);
+
+	vs_crtc_state->underflow =3D underflow;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_crtc.h b/drivers/gpu/drm/veri=
silicon/vs_crtc.h
new file mode 100644
index 000000000000..33b3b14249ce
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_crtc.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_CRTC_H__
+#define __VS_CRTC_H__
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "vs_type.h"
+
+struct vs_crtc_funcs {
+	void (*enable)(struct device *dev, struct drm_crtc *crtc);
+	void (*disable)(struct device *dev, struct drm_crtc *crtc);
+	bool (*mode_fixup)(struct device *dev,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+	void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
+			  struct drm_color_lut *lut, unsigned int size);
+	void (*enable_gamma)(struct device *dev, struct drm_crtc *crtc,
+			     bool enable);
+	void (*enable_vblank)(struct device *dev, bool enable);
+	void (*commit)(struct device *dev);
+};
+
+struct vs_crtc_state {
+	struct drm_crtc_state base;
+
+	u32 sync_mode;
+	u32 output_fmt;
+	u32 bg_color;
+	u8 encoder_type;
+	u8 mmu_prefetch;
+	u8 bpp;
+	bool sync_enable;
+	bool dither_enable;
+	bool underflow;
+};
+
+struct vs_crtc {
+	struct drm_crtc base;
+	struct device *dev;
+	struct drm_pending_vblank_event *event;
+	unsigned int max_bpc;
+	unsigned int color_formats; /* supported color format */
+
+	struct drm_property *sync_mode;
+	struct drm_property *mmu_prefetch;
+	struct drm_property *bg_color;
+	struct drm_property *panel_sync;
+	struct drm_property *dither;
+
+	const struct vs_crtc_funcs *funcs;
+};
+
+void vs_crtc_destroy(struct drm_crtc *crtc);
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       struct vs_dc_info *info);
+void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow);
+
+static inline struct vs_crtc *to_vs_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct vs_crtc, base);
+}
+
+static inline struct vs_crtc_state *
+to_vs_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct vs_crtc_state, base);
+}
+#endif /* __VS_CRTC_H__ */
diff --git a/drivers/gpu/drm/verisilicon/vs_type.h b/drivers/gpu/drm/veri=
silicon/vs_type.h
new file mode 100644
index 000000000000..6f8db65a703d
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_type.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_TYPE_H__
+#define __VS_TYPE_H__
+
+#include <linux/version.h>
+
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+
+struct vs_plane_info {
+	const char *name;
+	u8 id;
+	enum drm_plane_type type;
+	unsigned int num_formats;
+	const u32 *formats;
+	u8 num_modifiers;
+	const u64 *modifiers;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	unsigned int rotation;
+	unsigned int blend_mode;
+	unsigned int color_encoding;
+
+	/* 0 means no de-gamma LUT */
+	unsigned int degamma_size;
+
+	int min_scale; /* 16.16 fixed point */
+	int max_scale; /* 16.16 fixed point */
+
+	/* default zorder value,
+	 * and 255 means unsupported zorder capability
+	 */
+	u8	 zpos;
+
+	bool watermark;
+	bool color_mgmt;
+	bool roi;
+};
+
+struct vs_dc_info {
+	const char *name;
+
+	u8 panel_num;
+
+	/* planes */
+	u8 plane_num;
+	const struct vs_plane_info *planes;
+
+	u8 layer_num;
+	unsigned int max_bpc;
+	unsigned int color_formats;
+
+	/* 0 means no gamma LUT */
+	u16 gamma_size;
+	u8 gamma_bits;
+
+	u16 pitch_alignment;
+
+	bool pipe_sync;
+	bool mmu_prefetch;
+	bool background;
+	bool panel_sync;
+	bool cap_dec;
+};
+
+#endif /* __VS_TYPE_H__ */
--=20
2.34.1

