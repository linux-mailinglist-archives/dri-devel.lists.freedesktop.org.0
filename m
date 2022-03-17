Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5399F4DC298
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B2D10E14F;
	Thu, 17 Mar 2022 09:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8F410E139
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:26:04 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id u3so6490349ljd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVhGvksIhnE9me1q2RmcHPplKCC8h5cJVQKLhapcTXQ=;
 b=f0c3uneMOBmnbQ/HrsogpU25HlmmOPQCOIN0oLisgr6qo56Tyxc38W5rArktsiLXei
 CT3qgXtfnkVKwZYAYRRu90gmymK5sJ3TXmUFhI7TmBQ6+/lrGipMySdLLSAT6xigjeG+
 rQpYswcMwK0hLWRwqyD9+5nP2bZdMy+C8Apt9qpaLmI6J+LexJ8fZvxDVXUS1MRZHxee
 tymXvWHy+fdAV9ai7FxuXmCDstJ4WHuRRpnlq0ZoBN5ghCrx2rhwQW32T6CLqQxVfPaG
 3trx/irQRIRV7DuwvPw0Mg7eYdTnEO83iBO7IpCz0jPRX7cgIE5VvAgE77J2Uvdfy7uI
 9+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVhGvksIhnE9me1q2RmcHPplKCC8h5cJVQKLhapcTXQ=;
 b=n1bowzc2JoJmhcvbioq5KCUV4jUM2TnTcYE+c/pZHjiCsWeVd/MEuZqkjw/nQp+FhW
 ObkYAM/93b4RbIanDA21jQDr66A91SzNt0RJ4jIql5MSsJzNAIle0lkCaqdsY4jQg994
 dL+1nqVP9yuY6bk3V6pRKHqLkh+a3xztuUtHoS6GMA+Qk/iPKl6Dgw1sZhMFN++XpFHR
 lU5toyWWGFTRcDz/wIj4DvaA97fdSpFSHpueaie6knyJKkLK/TB0g6KVSUm66lfUxoju
 jrAwYBsux9wBKaZAZtNcRI6MBFfTJJ1holEnHACTcy7o7iaqkt3LnUdveeW8/VjzQkrq
 sqKQ==
X-Gm-Message-State: AOAM5316AcrqAEspufs2ET6UKEntbIcHaFNaVL/YdUVH5cmxneI4b5gR
 fVNrO5iUnV4d/cLy3mHZSkz/XurY79k=
X-Google-Smtp-Source: ABdhPJxoKsLbOtA2oWa/wKBnYoXYLNJDL0t+Whu6VSVcC95oZDv3aKy0HOPN5jDD1eCoI22FaW3/ng==
X-Received: by 2002:a2e:4b1a:0:b0:248:484:b45c with SMTP id
 y26-20020a2e4b1a000000b002480484b45cmr2276205lja.419.1647509161077; 
 Thu, 17 Mar 2022 02:26:01 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm391050ljg.77.2022.03.17.02.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:25:59 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/gma500: Move gma_intel_crtc_funcs into gma_display.c
Date: Thu, 17 Mar 2022 10:25:53 +0100
Message-Id: <20220317092555.17882-2-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All functions live in gma_display.c already so move the vtable. Also
shorten the name to gma_crtc_funcs.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_device.c        |  2 +-
 drivers/gpu/drm/gma500/gma_display.c       | 12 ++++++++++++
 drivers/gpu/drm/gma500/gma_display.h       | 10 ++--------
 drivers/gpu/drm/gma500/oaktrail_device.c   |  2 +-
 drivers/gpu/drm/gma500/psb_device.c        |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h           |  2 --
 drivers/gpu/drm/gma500/psb_intel_display.c | 12 ------------
 7 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index d7c6cca23e94..887c157d75f4 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -603,7 +603,7 @@ const struct psb_ops cdv_chip_ops = {
 	.errata = cdv_errata,
 
 	.crtc_helper = &cdv_intel_helper_funcs,
-	.crtc_funcs = &gma_intel_crtc_funcs,
+	.crtc_funcs = &gma_crtc_funcs,
 	.clock_funcs = &cdv_clock_funcs,
 
 	.output_init = cdv_output_init,
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index dd801404cf99..931ffb192fc4 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -565,6 +565,18 @@ int gma_crtc_set_config(struct drm_mode_set *set,
 	return ret;
 }
 
+const struct drm_crtc_funcs gma_crtc_funcs = {
+	.cursor_set = gma_crtc_cursor_set,
+	.cursor_move = gma_crtc_cursor_move,
+	.gamma_set = gma_crtc_gamma_set,
+	.set_config = gma_crtc_set_config,
+	.destroy = gma_crtc_destroy,
+	.page_flip = gma_crtc_page_flip,
+	.enable_vblank = psb_enable_vblank,
+	.disable_vblank = psb_disable_vblank,
+	.get_vblank_counter = psb_get_vblank_counter,
+};
+
 /*
  * Save HW states of given crtc
  */
diff --git a/drivers/gpu/drm/gma500/gma_display.h b/drivers/gpu/drm/gma500/gma_display.h
index 7bd6c1ee8b21..113cf048105e 100644
--- a/drivers/gpu/drm/gma500/gma_display.h
+++ b/drivers/gpu/drm/gma500/gma_display.h
@@ -58,15 +58,7 @@ extern bool gma_pipe_has_type(struct drm_crtc *crtc, int type);
 extern void gma_wait_for_vblank(struct drm_device *dev);
 extern int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 			     struct drm_framebuffer *old_fb);
-extern int gma_crtc_cursor_set(struct drm_crtc *crtc,
-			       struct drm_file *file_priv,
-			       uint32_t handle,
-			       uint32_t width, uint32_t height);
-extern int gma_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
 extern void gma_crtc_load_lut(struct drm_crtc *crtc);
-extern int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green,
-			      u16 *blue, u32 size,
-			      struct drm_modeset_acquire_ctx *ctx);
 extern void gma_crtc_dpms(struct drm_crtc *crtc, int mode);
 extern void gma_crtc_prepare(struct drm_crtc *crtc);
 extern void gma_crtc_commit(struct drm_crtc *crtc);
@@ -83,6 +75,8 @@ extern int gma_crtc_set_config(struct drm_mode_set *set,
 extern void gma_crtc_save(struct drm_crtc *crtc);
 extern void gma_crtc_restore(struct drm_crtc *crtc);
 
+extern const struct drm_crtc_funcs gma_crtc_funcs;
+
 extern void gma_encoder_prepare(struct drm_encoder *encoder);
 extern void gma_encoder_commit(struct drm_encoder *encoder);
 extern void gma_encoder_destroy(struct drm_encoder *encoder);
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 5c75eae630b5..40f1bc736125 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -545,7 +545,7 @@ const struct psb_ops oaktrail_chip_ops = {
 	.chip_setup = oaktrail_chip_setup,
 	.chip_teardown = oaktrail_teardown,
 	.crtc_helper = &oaktrail_helper_funcs,
-	.crtc_funcs = &gma_intel_crtc_funcs,
+	.crtc_funcs = &gma_crtc_funcs,
 
 	.output_init = oaktrail_output_init,
 
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 3030f18ba022..e93e4191c0ca 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -329,7 +329,7 @@ const struct psb_ops psb_chip_ops = {
 	.chip_teardown = psb_chip_teardown,
 
 	.crtc_helper = &psb_intel_helper_funcs,
-	.crtc_funcs = &gma_intel_crtc_funcs,
+	.crtc_funcs = &gma_crtc_funcs,
 	.clock_funcs = &psb_clock_funcs,
 
 	.output_init = psb_output_init,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 66f61909a8c8..88f44dbbc4eb 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -13,7 +13,6 @@
 
 #include <drm/drm_device.h>
 
-#include "gma_display.h"
 #include "gtt.h"
 #include "intel_bios.h"
 #include "mmu.h"
@@ -647,7 +646,6 @@ extern void oaktrail_lvds_init(struct drm_device *dev,
 
 /* psb_intel_display.c */
 extern const struct drm_crtc_helper_funcs psb_intel_helper_funcs;
-extern const struct drm_crtc_funcs gma_intel_crtc_funcs;
 
 /* psb_intel_lvds.c */
 extern const struct drm_connector_helper_funcs
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index d5f95212934e..6df62fe7c1e0 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -427,18 +427,6 @@ const struct drm_crtc_helper_funcs psb_intel_helper_funcs = {
 	.disable = gma_crtc_disable,
 };
 
-const struct drm_crtc_funcs gma_intel_crtc_funcs = {
-	.cursor_set = gma_crtc_cursor_set,
-	.cursor_move = gma_crtc_cursor_move,
-	.gamma_set = gma_crtc_gamma_set,
-	.set_config = gma_crtc_set_config,
-	.destroy = gma_crtc_destroy,
-	.page_flip = gma_crtc_page_flip,
-	.enable_vblank = psb_enable_vblank,
-	.disable_vblank = psb_disable_vblank,
-	.get_vblank_counter = psb_get_vblank_counter,
-};
-
 const struct gma_clock_funcs psb_clock_funcs = {
 	.clock = psb_intel_clock,
 	.limit = psb_intel_limit,
-- 
2.35.1

