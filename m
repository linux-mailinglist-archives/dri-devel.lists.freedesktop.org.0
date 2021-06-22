Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6A3B0AE1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8846E81F;
	Tue, 22 Jun 2021 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223B86E80B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y7so24383264wrh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bjs6oeW10B8/q3VjlvRz2emu1GApOGAaaMFI0+Deg98=;
 b=ieH46vwh89tnJ+i9Ew1lN0V98W4qyZuNumrwD9w5G2xxb+42J3eRV2mNkDzYQOqpLt
 0p2NKRqf6vx3pXviOmaPoZCree01md8E6rWMm2TIOKcx611Ngcz+/3Qx7Dj2i36zZXkw
 Dl5Ahy3zYTw8hXaxDlqCuQtp7T6ynpvApzkp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bjs6oeW10B8/q3VjlvRz2emu1GApOGAaaMFI0+Deg98=;
 b=uH6//LHmLt5S0I/22N2+Y0Wow84UB0Q7RC/ipQzY0zG7DpVMeWXrPr5PVOytKB9ie8
 hKHNt7FX9+OF1Wwm6DCRYQU/PuBga/+jZlbeybJEOXAw/Ot4FOYDd6q7DpF8ZnDi47P+
 2GUwRfKIx4oEjyMAaqUumvJVjg3BTjDccP/ZbV5hHCc51matYnKqFTcYaraJf368859c
 6Njgxt9yhMEhO2mWLmNcR8AXn0Amg8lwNpYvk3RH2XyLMRs+Sngb1yFkXFlGdtD/1VFQ
 Cn44jssDHiuCUGy5uzu7yHIdJql0/DunAG/xTA1BRZozDy14u/Jou4MRsTSw/jtAfcv2
 zqhw==
X-Gm-Message-State: AOAM5315YoXiF20Fk3UFtEn5laTZntkjOb+YNezXdoWQabVA6DPWI4IN
 +/nlTaN86xNVsQEKer0/qrB7lS9cJXqgnA==
X-Google-Smtp-Source: ABdhPJyZ18t4vhGnbxHq1zKwfH8pWUCTyqvgQo0B6NLGyC1KLMEhIjKRstRh8t4WHM8TNWPS6eaPtA==
X-Received: by 2002:a5d:4b0a:: with SMTP id v10mr6025820wrq.328.1624380928671; 
 Tue, 22 Jun 2021 09:55:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/15] drm/vram-helpers: Create DRM_GEM_VRAM_PLANE_HELPER_FUNCS
Date: Tue, 22 Jun 2021 18:55:06 +0200
Message-Id: <20210622165511.3169559-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tian Tao <tiantao6@hisilicon.com>, Hans de Goede <hdegoede@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like we have for the shadow helpers too, and roll it out to drivers.

Acked-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/ast/ast_mode.c                 |  3 +--
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c |  3 +--
 drivers/gpu/drm/vboxvideo/vbox_mode.c          |  3 +--
 include/drm/drm_gem_vram_helper.h              | 12 ++++++++++++
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e5996ae03c49..f5d58c3088fe 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -612,8 +612,7 @@ ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
-	.prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
+	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
 	.atomic_check = ast_primary_plane_helper_atomic_check,
 	.atomic_update = ast_primary_plane_helper_atomic_update,
 	.atomic_disable = ast_primary_plane_helper_atomic_disable,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 29b8332b2bca..ccf80e369b4b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -158,8 +158,7 @@ static const struct drm_plane_funcs hibmc_plane_funcs = {
 };
 
 static const struct drm_plane_helper_funcs hibmc_plane_helper_funcs = {
-	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
+	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
 	.atomic_check = hibmc_plane_atomic_check,
 	.atomic_update = hibmc_plane_atomic_update,
 };
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 964381d55fc1..972c83b720aa 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -488,8 +488,7 @@ static const struct drm_plane_helper_funcs vbox_primary_helper_funcs = {
 	.atomic_check = vbox_primary_atomic_check,
 	.atomic_update = vbox_primary_atomic_update,
 	.atomic_disable = vbox_primary_atomic_disable,
-	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
-	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
+	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
 };
 
 static const struct drm_plane_funcs vbox_primary_plane_funcs = {
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 27ed7e9243b9..f48d181c824b 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -124,6 +124,18 @@ void
 drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 				     struct drm_plane_state *old_state);
 
+/**
+ * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
+ *	Initializes struct drm_plane_helper_funcs for VRAM handling
+ *
+ * Drivers may use GEM BOs as VRAM helpers for the framebuffer memory. This
+ * macro initializes struct drm_plane_helper_funcs to use the respective helper
+ * functions.
+ */
+#define DRM_GEM_VRAM_PLANE_HELPER_FUNCS \
+	.prepare_fb = drm_gem_vram_plane_helper_prepare_fb, \
+	.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb
+
 /*
  * Helpers for struct drm_simple_display_pipe_funcs
  */
-- 
2.32.0.rc2

