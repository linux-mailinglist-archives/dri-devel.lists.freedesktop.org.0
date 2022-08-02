Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B955874A5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 02:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715F810E2A3;
	Tue,  2 Aug 2022 00:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A729B10E336
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 00:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659398654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptkcvOjmMlKZ5YEdNEgcEAb79T7LLbJD6CViXt9Cghk=;
 b=WwwBpvdMzFPTQ2ZXcI3Xwa+SKVRon28R4UuiEjkxF9JD2h3A2gPA4wDjNCVmkp7uX5pcFx
 iP5se6tkfzEqFszdbKDPPFayrRCEqkrMa4xO/4oErY1z2AwGgoLg0sffejwXByvIT5XCcM
 cAmdBgfodxj4PdjZQfdpIcbgbHljw+4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-NKWN99J9OSuFPz2ezYyPBw-1; Mon, 01 Aug 2022 20:04:13 -0400
X-MC-Unique: NKWN99J9OSuFPz2ezYyPBw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso3524308ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 17:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ptkcvOjmMlKZ5YEdNEgcEAb79T7LLbJD6CViXt9Cghk=;
 b=Ul3HP59AFe1k2cs0dK6COZCNJ1Xu+I1gxLiqemtCTI98jZ7gXkFSfVtUoOP9Q7dfok
 +HqeoyZOXZtn1h7bmCptRuRUgnSt8M5nWAF1Bmclm3CN5nQjLmHHMhRSJN1qdBpci6u7
 CEhSZBz3wlIREb77+P1KN42Gw178kkFZw5KDXVQwV5AgGCSMk7BbwschR7o268Km9DaQ
 A4ZVSQ05RAl+ppsqPzEmc+TFKDjVwLFSfNF591gQ0Z5qiGGQmUspPABOlPibquKW41mQ
 gY9yjyJIlmQIr6cIHQpEbG9/bqTirucT9TMNeQhGhVh97+6EWebbCey4WGqxka9O2NIM
 LvUg==
X-Gm-Message-State: AJIora/qoo6+DXtAcZL3BV+mdCJeNXG6tWfFHZJYYHDyvLl1gG4ei6dL
 6AUkZMsX2fR4NdeoQffRXK+B8pR4FxnQNUpPyXpFqu0SxGZPShh7sZHar/1v4LYw11pHTndiqAC
 t76qL4m72n2/sikRkhHn4f8OoKqxI
X-Received: by 2002:a17:907:2808:b0:72b:57c2:5e1e with SMTP id
 eb8-20020a170907280800b0072b57c25e1emr14002623ejc.577.1659398652187; 
 Mon, 01 Aug 2022 17:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1un3FNpFPIPULSji27VST6h4U4Sq56PhjNrqDqR1dujheeDOKwf7vNmSinXhcSb+DQHFeMC/Q==
X-Received: by 2002:a17:907:2808:b0:72b:57c2:5e1e with SMTP id
 eb8-20020a170907280800b0072b57c25e1emr14002616ejc.577.1659398652018; 
 Mon, 01 Aug 2022 17:04:12 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056402036400b0043cbdb16fbbsm7461686edw.24.2022.08.01.17.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 17:04:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de, mripard@kernel.org, sam@ravnborg.org
Subject: [PATCH drm-misc-next v7 1/5] drm/fb: remove unused includes of
 drm_fb_cma_helper.h
Date: Tue,  2 Aug 2022 02:04:01 +0200
Message-Id: <20220802000405.949236-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220802000405.949236-1-dakr@redhat.com>
References: <20220802000405.949236-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quite a lot of drivers include the drm_fb_cma_helper.h header file
without actually making use of it's provided API, hence remove those
includes.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c                 | 1 -
 drivers/gpu/drm/arm/malidp_drv.c                | 1 -
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         | 1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c       | 1 -
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 1 -
 drivers/gpu/drm/imx/imx-drm-core.c              | 1 -
 drivers/gpu/drm/imx/ipuv3-crtc.c                | 1 -
 drivers/gpu/drm/logicvc/logicvc_mode.c          | 1 -
 drivers/gpu/drm/pl111/pl111_drv.c               | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c          | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c           | 1 -
 drivers/gpu/drm/shmobile/shmob_drm_kms.c        | 1 -
 drivers/gpu/drm/solomon/ssd130x.c               | 1 -
 drivers/gpu/drm/sti/sti_drv.c                   | 1 -
 drivers/gpu/drm/sti/sti_plane.c                 | 1 -
 drivers/gpu/drm/stm/drv.c                       | 1 -
 drivers/gpu/drm/sun4i/sun4i_drv.c               | 1 -
 drivers/gpu/drm/sun4i/sun8i_mixer.c             | 1 -
 drivers/gpu/drm/tidss/tidss_crtc.c              | 1 -
 drivers/gpu/drm/tidss/tidss_kms.c               | 1 -
 drivers/gpu/drm/tidss/tidss_plane.c             | 1 -
 drivers/gpu/drm/tve200/tve200_drv.c             | 1 -
 drivers/gpu/drm/v3d/v3d_drv.c                   | 1 -
 drivers/gpu/drm/vc4/vc4_drv.c                   | 1 -
 26 files changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 350ca4e4eaa6..b32168e3f9ae 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -26,7 +26,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index d5aef21426cf..fa6c1a4254dc 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -19,7 +19,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 7780b72de9e8..54aa8af45829 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -16,7 +16,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 7a503bf08d0f..4baa4977e473 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -20,7 +20,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_modeset_helper.h>
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
index d763f53f480c..5b47000738e4 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
@@ -6,7 +6,6 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 2af51df6dca7..e8b0fe970969 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -19,7 +19,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 50fd7aac5198..e43345bd1346 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -16,7 +16,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index f7863d6dea80..d9f832f952c2 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -18,7 +18,6 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
index 11940704f644..c59da7039dc1 100644
--- a/drivers/gpu/drm/logicvc/logicvc_mode.c
+++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
@@ -10,7 +10,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 19a4324bd356..5b5f3573b619 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -48,7 +48,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 169ca0c8912f..ed887ebd2f6b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -17,7 +17,6 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 70d85610d720..110ec9538b44 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -20,7 +20,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 761451ee5263..7fed5b0c65ce 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -11,7 +11,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index 68d21be784aa..edb003537530 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -9,7 +9,6 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 77f80b0d3a5e..973ae2dfb2f8 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -21,7 +21,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index d858209cf8de..c0fbdb8cf6eb 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -14,7 +14,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index c74b524663ab..0a55180be22b 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -9,7 +9,6 @@
 #include <linux/types.h>
 
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index c63945dc2260..bb269dad30f9 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -18,7 +18,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6eb1aabdb161..382074ef1394 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -17,7 +17,6 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4e9bd9cb6b36..b3d1c0940406 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -16,7 +16,6 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index ad4ce9d06622..92d2c25bb0ff 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -8,7 +8,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 666e527a0acf..b61db8f279e9 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -10,7 +10,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 68a85a94ffcb..42d50ec5526d 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -11,7 +11,6 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 6d9d2921abf4..86ebfe626cd0 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -39,7 +39,6 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8c7f910daa28..e8c975b81585 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -22,7 +22,6 @@
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_managed.h>
 #include <uapi/drm/v3d_drm.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 89975bdd607e..d33baf2667dd 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -33,7 +33,6 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_vblank.h>
 
-- 
2.37.1

