Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E598C768
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154CE10E11C;
	Tue,  1 Oct 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="ENQUaJK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30F10E324
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:14:47 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id D4AA323E0F;
 Tue,  1 Oct 2024 23:05:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziYS9nTLoAaO; Tue,  1 Oct 2024 23:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1727816704; bh=HAwSJAkhQOJK1rk2QRun2YrBl73ivVtFfoE82HPTcIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ENQUaJK20Ycm4+nhz++zB+m2+1CHFuuBkIDhDICX1NUy94GtKJAMd+0zvWZuAxbl8
 IXABzda6AeUl/DY2dKpFg6cZcX0eTvlIBb1nxxVb8WqEgNuuaR7LP+N34f+qm0lLTP
 1s1Z0RKXQ76ZML6yYQaij9O1DI7VKa+0Rr2M8vOVkCY2WYCtyX4H7Og/pw4fk8n8Y4
 1eD/7IHszDsa0UPdeAhL6XYFF7+/csjWn7+s3H22rwJZwa4sghcrpMDusHp5KqNTZB
 qE5/i4Jdx2/Z6/jyRw4g3njsHRYfzQalAr6L9EyK6A85aILjqOEK0TF562gV6VwXQu
 0GBmwbMSjcElw==
From: Yao Zi <ziyao@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>
Subject: [RFC PATCH 1/1] drm/meson: Support drm_panic
Date: Tue,  1 Oct 2024 21:04:04 +0000
Message-ID: <20241001210403.43535-3-ziyao@disroot.org>
In-Reply-To: <20241001210403.43535-2-ziyao@disroot.org>
References: <20241001210403.43535-2-ziyao@disroot.org>
MIME-Version: 1.0
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

This patch implements drm_plane_helper_funcs.get_scanout_buffer for
primary plane, enabling meson-drm to work with drm_panic.

This implementation tries to use current framebuffer as scanout buffer.
In case of AFBC enabled, we disable the decoder path and adjust OSD1
parameters in get_scanout_buffer to make the buffer linear.

Tested on TTY and Wayland session (Sway).

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/gpu/drm/meson/meson_plane.c | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3..b2def784c00d 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -20,6 +20,8 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panic.h>
 
 #include "meson_plane.h"
 #include "meson_registers.h"
@@ -419,10 +421,49 @@ static void meson_plane_atomic_disable(struct drm_plane *plane,
 	priv->viu.osd1_enabled = false;
 }
 
+static int meson_plane_get_scanout_buffer(struct drm_plane *plane,
+					  struct drm_scanout_buffer *sb)
+{
+	struct meson_plane *meson_plane = to_meson_plane(plane);
+	struct meson_drm *priv = meson_plane->priv;
+	struct drm_framebuffer *fb;
+
+	if (!meson_plane->enabled)
+		return -ENODEV;
+
+	if (priv->viu.osd1_afbcd) {
+		if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
+			writel_relaxed(0, priv->io_base +
+					  _REG(VIU_OSD1_BLK1_CFG_W4));
+			writel_relaxed(0, priv->io_base +
+					  _REG(VIU_OSD1_BLK2_CFG_W4));
+			writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
+					    priv->io_base +
+					    _REG(VIU_OSD1_BLK0_CFG_W0));
+			meson_viu_g12a_disable_osd1_afbc(priv);
+		} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+			writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
+					    priv->io_base +
+					    _REG(VIU_OSD1_CTRL_STAT2));
+			meson_viu_gxm_disable_osd1_afbc(priv);
+		}
+	}
+
+	fb = plane->state->fb;
+	sb->format	= fb->format;
+	sb->width	= fb->width;
+	sb->height	= fb->height;
+	sb->pitch[0]	= fb->pitches[0];
+	drm_gem_fb_vmap(fb, sb->map, NULL);
+
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
-	.atomic_check	= meson_plane_atomic_check,
-	.atomic_disable	= meson_plane_atomic_disable,
-	.atomic_update	= meson_plane_atomic_update,
+	.atomic_check		= meson_plane_atomic_check,
+	.atomic_disable		= meson_plane_atomic_disable,
+	.atomic_update		= meson_plane_atomic_update,
+	.get_scanout_buffer	= meson_plane_get_scanout_buffer,
 };
 
 static bool meson_plane_format_mod_supported(struct drm_plane *plane,
-- 
2.46.0

