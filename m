Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C473157B300
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE58610E5B2;
	Wed, 20 Jul 2022 08:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240D110EB25
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:31:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69FF3371AD;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658305864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXtHfhi876XpPklefUjk2RhTUkMvIcpik6pzbKyQabg=;
 b=Bx3sqDEVA0K4rnJpUkdd6gL1bXPzvKQilBExMPZ9+gxPWd7dkmUhBrfTsTSwfAZgXKFxWz
 a5N8WDs4nxG0O9+mRDrgFvqpAo2fLpfA/7CqxRyol1qftQn0UuDLJy3ndk+IEK37WaPZW6
 XAbLy12hHzTNdK3TYjF6fjgiNrq1o3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658305864;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXtHfhi876XpPklefUjk2RhTUkMvIcpik6pzbKyQabg=;
 b=fN0a5Zc+kaKqHVxmRYs0kVr7qs5A8oKuqL/9olms2ERV70KTVR52mXhfd2zU4Bat7j6HlD
 9XHXPnPBwXQUQnCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3212D13ABB;
 Wed, 20 Jul 2022 08:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CLFAC0i912IddAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 08:31:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, airlied@redhat.com, zackr@vmware.com,
 linux@armlinux.org.uk, stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH 2/7] drm/atomic-helper: Move DRM_PLANE_HELPER_NO_SCALING to
 atomic helpers
Date: Wed, 20 Jul 2022 10:30:53 +0200
Message-Id: <20220720083058.15371-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720083058.15371-1-tzimmermann@suse.de>
References: <20220720083058.15371-1-tzimmermann@suse.de>
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
Cc: linux-graphics-maintainer@vmware.com,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro DRM_PLANE_HELPER_NO_SCALING is only useful with the interfaces
in drm_atomic_helper.h, but defined in drm_plane_helper.h. So half of
DRM includes the latter header file for using this macro. Move the macro
and remove the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c                   | 1 -
 drivers/gpu/drm/ast/ast_mode.c                     | 1 -
 drivers/gpu/drm/drm_simple_kms_helper.c            | 1 -
 drivers/gpu/drm/i915/display/i9xx_plane.c          | 1 -
 drivers/gpu/drm/i915/display/intel_cursor.c        | 1 -
 drivers/gpu/drm/i915/display/intel_sprite.c        | 1 -
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 -
 drivers/gpu/drm/imx/ipuv3-plane.c                  | 1 -
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          | 1 -
 drivers/gpu/drm/kmb/kmb_plane.c                    | 1 -
 drivers/gpu/drm/logicvc/logicvc_layer.c            | 1 -
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           | 1 -
 drivers/gpu/drm/meson/meson_plane.c                | 1 -
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  | 1 -
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  | 1 -
 drivers/gpu/drm/nouveau/dispnv50/base507c.c        | 1 -
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c        | 1 -
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        | 1 -
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c            | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        | 1 -
 drivers/gpu/drm/sprd/sprd_dpu.c                    | 1 -
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             | 1 -
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             | 1 -
 drivers/gpu/drm/tests/drm_plane_helper_test.c      | 1 -
 drivers/gpu/drm/virtio/virtgpu_plane.c             | 1 -
 drivers/gpu/drm/vkms/vkms_plane.c                  | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 1 -
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 | 1 -
 include/drm/drm_atomic_helper.h                    | 9 +++++++++
 include/drm/drm_plane_helper.h                     | 9 ---------
 31 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index afc9cd856501..3313d75a8860 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -23,7 +23,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_of.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 214b10178454..7fd2e20f743d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -42,7 +42,6 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 36633590ebf3..64800f158e69 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -12,7 +12,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index 592e5adfed8b..6d22e6edef2a 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -7,7 +7,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "intel_atomic.h"
 #include "intel_atomic_plane.h"
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index c2797ad2d313..e49927965a6b 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -8,7 +8,6 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_fourcc.h>
 
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 2713faad0625..a10c29226289 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -39,7 +39,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_rect.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c11e15a93164..87c202ec7d1e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -7,7 +7,6 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "i915_drv.h"
 #include "intel_atomic_plane.h"
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index ea5f594955df..26a0e2e2a366 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -14,7 +14,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_plane_helper.h>
 
 #include <video/imx-ipu-v3.h>
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 4de729bbf152..be699cc993d5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -41,7 +41,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 89d055a089a6..563b04ca80ee 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -14,7 +14,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_plane_helper.h>
 
 #include "kmb_drv.h"
 #include "kmb_plane.h"
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 441e3cfce4cf..adeea9fd11d5 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -14,7 +14,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
 #include "logicvc_crtc.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 5c0d9ce69931..414269b0f8bc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -11,7 +11,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "mtk_drm_crtc.h"
 #include "mtk_drm_ddp_comp.h"
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b9ac932af8d0..973ea08ad1a7 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -20,7 +20,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "meson_plane.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1bec1279c8b5..6b52280e3702 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -23,7 +23,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "lcdif_drv.h"
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index e38ce5737a5f..1279b4e1697d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -26,7 +26,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "mxsfb_drv.h"
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 788db043a342..65cefaaf88f6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -30,7 +30,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "nouveau_bo.h"
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 00e19fd959ea..24f7b1963a2a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -29,7 +29,6 @@
 #include <nvhw/class/cl507a.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 
 bool
 curs507a_space(struct nv50_wndw *wndw)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index afd6c7271de1..41ac9c67667c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -24,7 +24,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include <nvif/cl507e.h>
 #include <nvif/event.h>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 183d2c0e65b6..b8e4c44c0854 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -23,7 +23,6 @@
 #include "atom.h"
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <nouveau_bo.h>
 
 #include <nvif/clc37e.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index e98b76db703a..473f634da964 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -16,7 +16,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "rcar_du_drv.h"
 #include "rcar_du_group.h"
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index ad3958b6f8bf..efc783c8f653 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -27,7 +27,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 3664089b6983..03e760260d9c 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -23,7 +23,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "sprd_drm.h"
 #include "sprd_dpu.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 36da962de394..da1d4ec2e22b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -18,7 +18,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_mixer.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1fee6499bdd3..4bd295c2d340 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -11,7 +11,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_csc.h"
diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
index e298766cd41f..ec1654cdfc42 100644
--- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
@@ -9,7 +9,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_modes.h>
 
 static void set_src(struct drm_plane_state *plane_state,
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6d3cc9e238a4..58f4a52d039e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -26,7 +26,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d8eb674b49a6..22238db6f8a5 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -7,7 +7,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_plane_helper.h>
 
 #include "vkms_drv.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index c720a277489b..a19580109f33 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -29,7 +29,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index cc32aa89cf8f..d3bdecabf4e5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -20,7 +20,6 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 2a0b17842402..ab778aad7359 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -34,6 +34,15 @@
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_util.h>
 
+/*
+ * Drivers that don't allow primary plane scaling may pass this macro in place
+ * of the min/max scale parameters of the plane-state checker function.
+ *
+ * Due to src being in 16.16 fixed point and dest being in integer pixels,
+ * 1<<16 represents no scaling.
+ */
+#define DRM_PLANE_HELPER_NO_SCALING (1<<16)
+
 struct drm_atomic_state;
 struct drm_private_obj;
 struct drm_private_state;
diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
index 331ebd60b3a3..ff85ef41cb33 100644
--- a/include/drm/drm_plane_helper.h
+++ b/include/drm/drm_plane_helper.h
@@ -29,15 +29,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_modeset_helper.h>
 
-/*
- * Drivers that don't allow primary plane scaling may pass this macro in place
- * of the min/max scale parameters of the update checker function.
- *
- * Due to src being in 16.16 fixed point and dest being in integer pixels,
- * 1<<16 represents no scaling.
- */
-#define DRM_PLANE_HELPER_NO_SCALING (1<<16)
-
 void drm_primary_helper_destroy(struct drm_plane *plane);
 extern const struct drm_plane_funcs drm_primary_helper_funcs;
 
-- 
2.36.1

