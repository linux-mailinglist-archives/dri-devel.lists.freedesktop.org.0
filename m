Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5426489601B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 01:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D9F11217B;
	Tue,  2 Apr 2024 23:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="W5jESbtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08286112179
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 23:28:20 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e6c0098328so4974670b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712100500; x=1712705300;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=im2cF2isoyZyc3v7Np00mouEuQJkG31HlR2/Ny5YOGk=;
 b=W5jESbtklzpm51Bs58n5GPjPzIMnUUE+SnXGnHeTtG7mUuCA8I14qLIC8W6/L6/2zH
 hefTHpyoELHIaZHYPTUazPOicILEnmJd/8gW9inclx3Wf2xo7iU9hUF/vWxiHUVd/loG
 CKR2sTjFJ/k+RitN6xxN5wv3zH6l8t3c1bMAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712100500; x=1712705300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=im2cF2isoyZyc3v7Np00mouEuQJkG31HlR2/Ny5YOGk=;
 b=OlQm0+mhgQzLTOVN41395eByAgSXFZlQVVfYG9P1ntaIl6tzD+Mkgbk7/GwzRQNAPj
 N/xz0226G+8dlA2O0wJ2v6WiPWodqcgjMNFumMm0J6EHY48D/9dbzVmAcfPLaPJHUs1S
 64fBCRqqdtcSVcMSESeyaF4W7iWyo4x2yWWJOtBXSNQg9zn8y3X1SDTsv8BAc33jdCkb
 3IErO3/EF9bDz+BMywY6ELNsBKB+q+V5tXsrJvaUnHdMiWPI+NZivDK512zDzdFZ+lx5
 VpCK5oQ186Dg/yYw/oMkl4N9w2RGxDKrhikiSf639UCeNGHGQqLtpJn1DJ3gkHEsBLx3
 bejA==
X-Gm-Message-State: AOJu0YzFvi4N7+xvqmXdejfcn29OeHcVwbWcxgYmqrTZDUiEswtzjFGx
 aC7HsP8uxm8stNlqN5tPtHQBhWpmotcvyzbPILcXhSZ+5lFck6prqq54LCWM0vgE8VhAGfDOG35
 rCeTPuLrtkldQbnRDeoZlFZcVnolm52CBjk35zCzG0h9XqzFDWAfpvmuLVrhsgHAJ3X+2G0TO9X
 7snKK/T8rZn354ee2AmKPXQQFcaSemXUPVUzflnKzgKinjdaDYrQ==
X-Google-Smtp-Source: AGHT+IEMfY8FG+6aAdk4OpOnuAIHgnyCx6Z1nhFubpValirqj3q8AXnsoQe6+wblCgX7Itu+YPVzkw==
X-Received: by 2002:a05:6a00:2e98:b0:6e6:b4f3:19dc with SMTP id
 fd24-20020a056a002e9800b006e6b4f319dcmr17504080pfb.7.1712100499710; 
 Tue, 02 Apr 2024 16:28:19 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 i21-20020aa787d5000000b006eaada3860dsm10385121pfo.200.2024.04.02.16.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 16:28:19 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH 1/5] drm/vmwgfx: Implement virtual kms
Date: Tue,  2 Apr 2024 19:28:09 -0400
Message-Id: <20240402232813.2670131-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402232813.2670131-1-zack.rusin@broadcom.com>
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

By default vmwgfx doesn't support vblanking or crc generation which
makes it impossible to use various IGT tests to validate vmwgfx.
Implement virtual kernel mode setting, which is mainly related to
simulated vblank support.

Code is very similar to amd's vkms and the vkms module itself, except
that it's integrated with vmwgfx three different output technologies -
legacy, screen object and screen targets.

Make IGT's kms_vblank pass on vmwgfx and allows a lot of other IGT
tests to run with vmwgfx.

Support for vkms needs to be manually enabled by adding:
guestinfo.vmwgfx.vkms_enable = "TRUE"
somewhere in the vmx file, otherwise it's off by default.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/Makefile      |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h  |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  |  15 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  39 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  28 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  22 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c | 193 +++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h |  53 ++++++++
 10 files changed, 302 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index e94479d9cd5b..46a4ab688a7f 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -10,6 +10,6 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
 	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
 	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
 	    vmwgfx_devcaps.o ttm_object.o vmwgfx_system_manager.o \
-	    vmwgfx_gem.o
+	    vmwgfx_gem.o vmwgfx_vkms.o
 
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index c7d90f96d16a..e34c48fd25d4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -32,6 +32,7 @@
 #include "vmwgfx_binding.h"
 #include "vmwgfx_devcaps.h"
 #include "vmwgfx_mksstat.h"
+#include "vmwgfx_vkms.h"
 #include "ttm_object.h"
 
 #include <drm/drm_aperture.h>
@@ -910,6 +911,8 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 			     "Please switch to a supported graphics device to avoid problems.");
 	}
 
+	vmw_vkms_init(dev_priv);
+
 	ret = vmw_dma_select_mode(dev_priv);
 	if (unlikely(ret != 0)) {
 		drm_info(&dev_priv->drm,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 01f41fbb9c3b..4f5d7d13c4aa 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -615,6 +615,8 @@ struct vmw_private {
 
 	uint32 *devcaps;
 
+	bool vkms_enabled;
+
 	/*
 	 * mksGuestStat instance-descriptor and pid arrays
 	 */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 09214f9339b2..e763cf0e6cfc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -27,6 +27,7 @@
 #include "vmwgfx_kms.h"
 
 #include "vmwgfx_bo.h"
+#include "vmwgfx_vkms.h"
 #include "vmw_surface_cache.h"
 
 #include <drm/drm_atomic.h>
@@ -37,9 +38,16 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_edid.h>
 
+void vmw_du_init(struct vmw_display_unit *du)
+{
+	hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	du->vkms.timer.function = &vmw_vkms_vblank_simulate;
+}
+
 void vmw_du_cleanup(struct vmw_display_unit *du)
 {
 	struct vmw_private *dev_priv = vmw_priv(du->primary.dev);
+	hrtimer_cancel(&du->vkms.timer);
 	drm_plane_cleanup(&du->primary);
 	if (vmw_cmd_supported(dev_priv))
 		drm_plane_cleanup(&du->cursor.base);
@@ -957,13 +965,6 @@ void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
 {
 }
 
-
-void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
-			      struct drm_atomic_state *state)
-{
-}
-
-
 /**
  * vmw_du_crtc_duplicate_state - duplicate crtc state
  * @crtc: DRM crtc
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 4a2e3cac1c22..9e83a1553286 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -376,6 +376,12 @@ struct vmw_display_unit {
 	bool is_implicit;
 	int set_gui_x;
 	int set_gui_y;
+
+	struct {
+		struct hrtimer timer;
+		ktime_t period_ns;
+		struct drm_pending_vblank_event *event;
+	} vkms;
 };
 
 #define vmw_crtc_to_du(x) \
@@ -387,6 +393,7 @@ struct vmw_display_unit {
 /*
  * Shared display unit functions - vmwgfx_kms.c
  */
+void vmw_du_init(struct vmw_display_unit *du);
 void vmw_du_cleanup(struct vmw_display_unit *du);
 void vmw_du_crtc_save(struct drm_crtc *crtc);
 void vmw_du_crtc_restore(struct drm_crtc *crtc);
@@ -473,8 +480,6 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state);
 void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
 			      struct drm_atomic_state *state);
-void vmw_du_crtc_atomic_flush(struct drm_crtc *crtc,
-			      struct drm_atomic_state *state);
 void vmw_du_crtc_reset(struct drm_crtc *crtc);
 struct drm_crtc_state *vmw_du_crtc_duplicate_state(struct drm_crtc *crtc);
 void vmw_du_crtc_destroy_state(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index c4db4aecca6c..5befc2719a49 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -27,6 +27,7 @@
 
 #include "vmwgfx_bo.h"
 #include "vmwgfx_kms.h"
+#include "vmwgfx_vkms.h"
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -241,33 +242,6 @@ static void vmw_ldu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 }
 
-/**
- * vmw_ldu_crtc_atomic_enable - Noop
- *
- * @crtc: CRTC associated with the new screen
- * @state: Unused
- *
- * This is called after a mode set has been completed.  Here's
- * usually a good place to call vmw_ldu_add_active/vmw_ldu_del_active
- * but since for LDU the display plane is closely tied to the
- * CRTC, it makes more sense to do those at plane update time.
- */
-static void vmw_ldu_crtc_atomic_enable(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
-{
-}
-
-/**
- * vmw_ldu_crtc_atomic_disable - Turns off CRTC
- *
- * @crtc: CRTC to be turned off
- * @state: Unused
- */
-static void vmw_ldu_crtc_atomic_disable(struct drm_crtc *crtc,
-					struct drm_atomic_state *state)
-{
-}
-
 static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 	.gamma_set = vmw_du_crtc_gamma_set,
 	.destroy = vmw_ldu_crtc_destroy,
@@ -276,6 +250,9 @@ static const struct drm_crtc_funcs vmw_legacy_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.enable_vblank          = vmw_vkms_enable_vblank,
+	.disable_vblank         = vmw_vkms_disable_vblank,
+	.get_vblank_timestamp   = vmw_vkms_get_vblank_timestamp,
 };
 
 
@@ -418,9 +395,9 @@ static const struct drm_crtc_helper_funcs vmw_ldu_crtc_helper_funcs = {
 	.mode_set_nofb = vmw_ldu_crtc_mode_set_nofb,
 	.atomic_check = vmw_du_crtc_atomic_check,
 	.atomic_begin = vmw_du_crtc_atomic_begin,
-	.atomic_flush = vmw_du_crtc_atomic_flush,
-	.atomic_enable = vmw_ldu_crtc_atomic_enable,
-	.atomic_disable = vmw_ldu_crtc_atomic_disable,
+	.atomic_flush = vmw_vkms_crtc_atomic_flush,
+	.atomic_enable = vmw_vkms_crtc_atomic_enable,
+	.atomic_disable = vmw_vkms_crtc_atomic_disable,
 };
 
 
@@ -541,6 +518,8 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 			 dev_priv->implicit_placement_property,
 			 1);
 
+	vmw_du_init(&ldu->base);
+
 	return 0;
 
 err_free_unregister:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index c6e646895f9e..df0039a8ef29 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -27,11 +27,13 @@
 
 #include "vmwgfx_bo.h"
 #include "vmwgfx_kms.h"
+#include "vmwgfx_vkms.h"
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_vblank.h>
 
 #define vmw_crtc_to_sou(x) \
 	container_of(x, struct vmw_screen_object_unit, base.crtc)
@@ -267,19 +269,6 @@ static void vmw_sou_crtc_helper_prepare(struct drm_crtc *crtc)
 {
 }
 
-/**
- * vmw_sou_crtc_atomic_enable - Noop
- *
- * @crtc: CRTC associated with the new screen
- * @state: Unused
- *
- * This is called after a mode set has been completed.
- */
-static void vmw_sou_crtc_atomic_enable(struct drm_crtc *crtc,
-				       struct drm_atomic_state *state)
-{
-}
-
 /**
  * vmw_sou_crtc_atomic_disable - Turns off CRTC
  *
@@ -302,6 +291,9 @@ static void vmw_sou_crtc_atomic_disable(struct drm_crtc *crtc,
 	sou = vmw_crtc_to_sou(crtc);
 	dev_priv = vmw_priv(crtc->dev);
 
+	if (dev_priv->vkms_enabled)
+		drm_crtc_vblank_off(crtc);
+
 	if (sou->defined) {
 		ret = vmw_sou_fifo_destroy(dev_priv, sou);
 		if (ret)
@@ -317,6 +309,9 @@ static const struct drm_crtc_funcs vmw_screen_object_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.enable_vblank          = vmw_vkms_enable_vblank,
+	.disable_vblank         = vmw_vkms_disable_vblank,
+	.get_vblank_timestamp   = vmw_vkms_get_vblank_timestamp,
 };
 
 /*
@@ -794,8 +789,8 @@ static const struct drm_crtc_helper_funcs vmw_sou_crtc_helper_funcs = {
 	.mode_set_nofb = vmw_sou_crtc_mode_set_nofb,
 	.atomic_check = vmw_du_crtc_atomic_check,
 	.atomic_begin = vmw_du_crtc_atomic_begin,
-	.atomic_flush = vmw_du_crtc_atomic_flush,
-	.atomic_enable = vmw_sou_crtc_atomic_enable,
+	.atomic_flush = vmw_vkms_crtc_atomic_flush,
+	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_sou_crtc_atomic_disable,
 };
 
@@ -905,6 +900,9 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+
+	vmw_du_init(&sou->base);
+
 	return 0;
 
 err_free_unregister:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 3c8414a13dba..665bde7e0be0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -27,12 +27,14 @@
 
 #include "vmwgfx_bo.h"
 #include "vmwgfx_kms.h"
+#include "vmwgfx_vkms.h"
 #include "vmw_surface_cache.h"
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_vblank.h>
 
 #define vmw_crtc_to_stdu(x) \
 	container_of(x, struct vmw_screen_target_display_unit, base.crtc)
@@ -412,11 +414,6 @@ static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
 {
 }
 
-static void vmw_stdu_crtc_atomic_enable(struct drm_crtc *crtc,
-					struct drm_atomic_state *state)
-{
-}
-
 static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 					 struct drm_atomic_state *state)
 {
@@ -424,7 +421,6 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct vmw_screen_target_display_unit *stdu;
 	int ret;
 
-
 	if (!crtc) {
 		DRM_ERROR("CRTC is NULL\n");
 		return;
@@ -433,6 +429,9 @@ static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 	stdu     = vmw_crtc_to_stdu(crtc);
 	dev_priv = vmw_priv(crtc->dev);
 
+	if (dev_priv->vkms_enabled)
+		drm_crtc_vblank_off(crtc);
+
 	if (stdu->defined) {
 		ret = vmw_stdu_bind_st(dev_priv, stdu, NULL);
 		if (ret)
@@ -770,7 +769,6 @@ int vmw_kms_stdu_surface_dirty(struct vmw_private *dev_priv,
 	return ret;
 }
 
-
 /*
  *  Screen Target CRTC dispatch table
  */
@@ -782,6 +780,9 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_funcs = {
 	.atomic_destroy_state = vmw_du_crtc_destroy_state,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.enable_vblank		= vmw_vkms_enable_vblank,
+	.disable_vblank		= vmw_vkms_disable_vblank,
+	.get_vblank_timestamp	= vmw_vkms_get_vblank_timestamp,
 };
 
 
@@ -1457,8 +1458,8 @@ static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
 	.mode_set_nofb = vmw_stdu_crtc_mode_set_nofb,
 	.atomic_check = vmw_du_crtc_atomic_check,
 	.atomic_begin = vmw_du_crtc_atomic_begin,
-	.atomic_flush = vmw_du_crtc_atomic_flush,
-	.atomic_enable = vmw_stdu_crtc_atomic_enable,
+	.atomic_flush = vmw_vkms_crtc_atomic_flush,
+	.atomic_enable = vmw_vkms_crtc_atomic_enable,
 	.atomic_disable = vmw_stdu_crtc_atomic_disable,
 };
 
@@ -1575,6 +1576,9 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 				   dev->mode_config.suggested_x_property, 0);
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
+
+	vmw_du_init(&stdu->base);
+
 	return 0;
 
 err_free_unregister:
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
new file mode 100644
index 000000000000..ff76bfd70f91
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/**************************************************************************
+ *
+ * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ **************************************************************************/
+
+#include "vmwgfx_vkms.h"
+
+#include "vmwgfx_drv.h"
+#include "vmwgfx_kms.h"
+#include "vmwgfx_vkms.h"
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#define GUESTINFO_VBLANK  "guestinfo.vmwgfx.vkms_enable"
+
+enum hrtimer_restart
+vmw_vkms_vblank_simulate(struct hrtimer *timer)
+{
+	struct vmw_display_unit *du = container_of(timer, struct vmw_display_unit, vkms.timer);
+	struct drm_crtc *crtc = &du->crtc;
+	u64 ret_overrun;
+	bool ret;
+
+	ret_overrun = hrtimer_forward_now(&du->vkms.timer,
+					  du->vkms.period_ns);
+	if (ret_overrun != 1)
+		DRM_WARN("%s: vblank timer overrun\n", __func__);
+
+	ret = drm_crtc_handle_vblank(crtc);
+	/* Don't queue timer again when vblank is disabled. */
+	if (!ret)
+		return HRTIMER_NORESTART;
+
+	return HRTIMER_RESTART;
+}
+
+void
+vmw_vkms_init(struct vmw_private *vmw)
+{
+	char buffer[64];
+	const size_t max_buf_len = sizeof(buffer) - 1;
+	size_t buf_len = max_buf_len;
+	int ret;
+
+	vmw->vkms_enabled = false;
+
+	ret = vmw_host_get_guestinfo(GUESTINFO_VBLANK, buffer, &buf_len);
+	if (ret || buf_len > max_buf_len)
+		return;
+	buffer[buf_len] = '\0';
+
+	ret = kstrtobool(buffer, &vmw->vkms_enabled);
+	if (!ret && vmw->vkms_enabled) {
+		ret = drm_vblank_init(&vmw->drm, VMWGFX_NUM_DISPLAY_UNITS);
+		vmw->vkms_enabled = (ret == 0);
+		drm_info(&vmw->drm, "vkms_enabled = %d\n", vmw->vkms_enabled);
+	}
+}
+
+bool
+vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+			      int *max_error,
+			      ktime_t *vblank_time,
+			      bool in_vblank_irq)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vmw_private *vmw = vmw_priv(dev);
+	unsigned int pipe = crtc->index;
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	if (!vmw->vkms_enabled)
+		return false;
+
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
+	*vblank_time = READ_ONCE(du->vkms.timer.node.expires);
+
+	if (WARN_ON(*vblank_time == vblank->time))
+		return true;
+
+	/*
+	 * To prevent races we roll the hrtimer forward before we do any
+	 * interrupt processing - this is how real hw works (the interrupt is
+	 * only generated after all the vblank registers are updated) and what
+	 * the vblank core expects. Therefore we need to always correct the
+	 * timestampe by one frame.
+	 */
+	*vblank_time -= du->vkms.period_ns;
+
+	return true;
+}
+
+int
+vmw_vkms_enable_vblank(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct vmw_private *vmw = vmw_priv(dev);
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+
+	if (!vmw->vkms_enabled)
+		return -EINVAL;
+
+	drm_calc_timestamping_constants(crtc, &crtc->mode);
+
+	du->vkms.period_ns = ktime_set(0, vblank->framedur_ns);
+	hrtimer_start(&du->vkms.timer, du->vkms.period_ns, HRTIMER_MODE_REL);
+
+	return 0;
+}
+
+void
+vmw_vkms_disable_vblank(struct drm_crtc *crtc)
+{
+	struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (!vmw->vkms_enabled)
+		return;
+
+	hrtimer_try_to_cancel(&du->vkms.timer);
+}
+
+void
+vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
+			   struct drm_atomic_state *state)
+{
+	unsigned long flags;
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (vmw->vkms_enabled && crtc->state->event) {
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+
+		if (drm_crtc_vblank_get(crtc) != 0)
+			drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		else
+			drm_crtc_arm_vblank_event(crtc, crtc->state->event);
+
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+
+		crtc->state->event = NULL;
+	}
+}
+
+void
+vmw_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
+			    struct drm_atomic_state *state)
+{
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (vmw->vkms_enabled)
+		drm_crtc_vblank_on(crtc);
+}
+
+void
+vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
+			     struct drm_atomic_state *state)
+{
+	struct vmw_private *vmw = vmw_priv(crtc->dev);
+
+	if (vmw->vkms_enabled)
+		drm_crtc_vblank_off(crtc);
+}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
new file mode 100644
index 000000000000..0f6d4ab9ebe3
--- /dev/null
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/**************************************************************************
+ *
+ * Copyright (c) 2024 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ **************************************************************************/
+
+#ifndef VMWGFX_VKMS_H_
+#define VMWGFX_VKMS_H_
+
+#include <linux/hrtimer_types.h>
+#include <linux/types.h>
+
+struct vmw_private;
+struct drm_crtc;
+struct drm_atomic_state;
+
+void vmw_vkms_init(struct vmw_private *vmw);
+bool vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
+				   int *max_error,
+				   ktime_t *vblank_time,
+				   bool in_vblank_irq);
+int vmw_vkms_enable_vblank(struct drm_crtc *crtc);
+void vmw_vkms_disable_vblank(struct drm_crtc *crtc);
+void vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state);
+enum hrtimer_restart vmw_vkms_vblank_simulate(struct hrtimer *timer);
+void vmw_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state);
+void vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state);
+
+#endif
-- 
2.40.1

