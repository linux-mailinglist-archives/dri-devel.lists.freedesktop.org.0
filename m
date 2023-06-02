Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771271FBA7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3072E10E634;
	Fri,  2 Jun 2023 08:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id D80E610E628
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 07:46:08 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 13F9B8109;
 Fri,  2 Jun 2023 15:40:49 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:49 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:48 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 5/9] drm/verisilicon: Add mode config funcs
Date: Fri, 2 Jun 2023 15:40:39 +0800
Message-ID: <20230602074043.33872-6-keith.zhao@starfivetech.com>
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

Add mode setting functions for JH7110 SoC.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
---
 drivers/gpu/drm/verisilicon/Makefile |   1 +
 drivers/gpu/drm/verisilicon/vs_drv.c |   3 +
 drivers/gpu/drm/verisilicon/vs_fb.c  | 181 +++++++++++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_fb.h  |  15 +++
 4 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h

diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
index 30360e370e47..38254dc5d98d 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
=20
 vs_drm-objs :=3D vs_drv.o \
+		vs_fb.o \
 		vs_gem.o
=20
 obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/veris=
ilicon/vs_drv.c
index e0a2fc43b55f..d84aacd751bc 100644
--- a/drivers/gpu/drm/verisilicon/vs_drv.c
+++ b/drivers/gpu/drm/verisilicon/vs_drv.c
@@ -30,6 +30,7 @@
 #include <drm/drm_vblank.h>
=20
 #include "vs_drv.h"
+#include "vs_fb.h"
 #include "vs_gem.h"
=20
 #define DRV_NAME	"starfive"
@@ -118,6 +119,8 @@ static int vs_drm_bind(struct device *dev)
 	if (ret)
 		goto err_mode;
=20
+	vs_mode_config_init(drm_dev);
+
 	ret =3D drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
 	if (ret)
 		goto err_bind;
diff --git a/drivers/gpu/drm/verisilicon/vs_fb.c b/drivers/gpu/drm/verisi=
licon/vs_fb.c
new file mode 100644
index 000000000000..3e85f7365084
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_fb.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/version.h>
+
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+
+#include "vs_fb.h"
+#include "vs_gem.h"
+
+#define fourcc_mod_vs_get_type(val) \
+	(((val) & DRM_FORMAT_MOD_VS_TYPE_MASK) >> 54)
+
+static struct drm_framebuffer_funcs vs_fb_funcs =3D {
+	.create_handle	=3D drm_gem_fb_create_handle,
+	.destroy	=3D drm_gem_fb_destroy,
+	.dirty		=3D drm_atomic_helper_dirtyfb,
+};
+
+static struct drm_framebuffer *
+vs_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_=
cmd,
+	    struct vs_gem_object **obj, unsigned int num_planes)
+{
+	struct drm_framebuffer *fb;
+	int ret, i;
+
+	fb =3D kzalloc(sizeof(*fb), GFP_KERNEL);
+	if (!fb)
+		return ERR_PTR(-ENOMEM);
+
+	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
+
+	for (i =3D 0; i < num_planes; i++)
+		fb->obj[i] =3D &obj[i]->base;
+
+	ret =3D drm_framebuffer_init(dev, fb, &vs_fb_funcs);
+	if (ret) {
+		dev_err(dev->dev, "Failed to initialize framebuffer: %d\n",
+			ret);
+		kfree(fb);
+		return ERR_PTR(ret);
+	}
+
+	return fb;
+}
+
+static struct drm_framebuffer *vs_fb_create(struct drm_device *dev,
+					    struct drm_file *file_priv,
+					    const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_framebuffer *fb;
+	const struct drm_format_info *info;
+	struct vs_gem_object *objs[MAX_NUM_PLANES];
+	struct drm_gem_object *obj;
+	unsigned int height, size;
+	unsigned char i, num_planes;
+	int ret =3D 0;
+
+	info =3D drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return ERR_PTR(-EINVAL);
+
+	num_planes =3D info->num_planes;
+	if (num_planes > MAX_NUM_PLANES)
+		return ERR_PTR(-EINVAL);
+
+	for (i =3D 0; i < num_planes; i++) {
+		obj =3D drm_gem_object_lookup(file_priv, mode_cmd->handles[i]);
+		if (!obj) {
+			dev_err(dev->dev, "Failed to lookup GEM object.\n");
+			ret =3D -ENXIO;
+			goto err;
+		}
+
+		height =3D drm_format_info_plane_height(info,
+						      mode_cmd->height, i);
+
+		size =3D height * mode_cmd->pitches[i] + mode_cmd->offsets[i];
+
+		if (obj->size < size) {
+			drm_gem_object_put(obj);
+
+			ret =3D -EINVAL;
+			goto err;
+		}
+
+		objs[i] =3D to_vs_gem_object(obj);
+	}
+
+	fb =3D vs_fb_alloc(dev, mode_cmd, objs, i);
+	if (IS_ERR(fb)) {
+		ret =3D PTR_ERR(fb);
+		goto err;
+	}
+
+	return fb;
+
+err:
+	for (; i > 0; i--)
+		drm_gem_object_put(&objs[i - 1]->base);
+
+	return ERR_PTR(ret);
+}
+
+struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
+					unsigned char plane)
+{
+	if (plane > MAX_NUM_PLANES)
+		return NULL;
+
+	return to_vs_gem_object(fb->obj[plane]);
+}
+
+static const struct drm_format_info vs_formats[] =3D {
+	{.format =3D DRM_FORMAT_NV12, .depth =3D 0, .num_planes =3D 2, .char_pe=
r_block =3D { 20, 40, 0 },
+	 .block_w =3D { 4, 4, 0 }, .block_h =3D { 4, 4, 0 }, .hsub =3D 2, .vsub=
 =3D 2, .is_yuv =3D true},
+	{.format =3D DRM_FORMAT_YUV444, .depth =3D 0, .num_planes =3D 3, .char_=
per_block =3D { 20, 20, 20 },
+	 .block_w =3D { 4, 4, 4 }, .block_h =3D { 4, 4, 4 }, .hsub =3D 1, .vsub=
 =3D 1, .is_yuv =3D true},
+};
+
+static const struct drm_format_info *
+vs_lookup_format_info(const struct drm_format_info formats[],
+		      int num_formats, u32 format)
+{
+	int i;
+
+	for (i =3D 0; i < num_formats; i++) {
+		if (formats[i].format =3D=3D format)
+			return &formats[i];
+	}
+
+	return NULL;
+}
+
+static const struct drm_format_info *
+vs_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+{
+	if (fourcc_mod_vs_get_type(cmd->modifier[0]) =3D=3D
+		DRM_FORMAT_MOD_VS_TYPE_CUSTOM_10BIT)
+		return vs_lookup_format_info(vs_formats, ARRAY_SIZE(vs_formats),
+									 cmd->pixel_format);
+	else
+		return NULL;
+}
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs =3D {
+	.fb_create			 =3D vs_fb_create,
+	.get_format_info	 =3D vs_get_format_info,
+	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
+	.atomic_check		 =3D drm_atomic_helper_check,
+	.atomic_commit		 =3D drm_atomic_helper_commit,
+};
+
+static struct drm_mode_config_helper_funcs vs_mode_config_helpers =3D {
+	.atomic_commit_tail =3D drm_atomic_helper_commit_tail_rpm,
+};
+
+void vs_mode_config_init(struct drm_device *dev)
+{
+	dev->mode_config.fb_modifiers_not_supported =3D false;
+
+	if (dev->mode_config.max_width =3D=3D 0 ||
+	    dev->mode_config.max_height =3D=3D 0) {
+		dev->mode_config.min_width  =3D 0;
+		dev->mode_config.min_height =3D 0;
+		dev->mode_config.max_width  =3D 4096;
+		dev->mode_config.max_height =3D 4096;
+	}
+	dev->mode_config.funcs =3D &vs_mode_config_funcs;
+	dev->mode_config.helper_private =3D &vs_mode_config_helpers;
+}
diff --git a/drivers/gpu/drm/verisilicon/vs_fb.h b/drivers/gpu/drm/verisi=
licon/vs_fb.h
new file mode 100644
index 000000000000..78dda8e42894
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/vs_fb.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 VeriSilicon Holdings Co., Ltd.
+ */
+
+#ifndef __VS_FB_H__
+#define __VS_FB_H__
+
+#define MAX_NUM_PLANES		3 /* colour format plane */
+
+struct vs_gem_object *vs_fb_get_gem_obj(struct drm_framebuffer *fb,
+					unsigned char plane);
+
+void vs_mode_config_init(struct drm_device *dev);
+#endif /* __VS_FB_H__ */
--=20
2.34.1

