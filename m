Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0B38C2C3
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A75D6F5F3;
	Fri, 21 May 2021 09:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E81C6F5F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:13 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a1c79120000b0290181c444b2d0so166113wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tjLxHP9MRkvoQ1DS1KFKpemlH7rDi6kA4aqwWK4QoRM=;
 b=DlyIQrqFPqMf2bhLp8SFYBuIB8wo8en9IhviksjOCcNo2qhucRevKI+YrpetCIrdFS
 SWxaC+rxQfdxs9NHAnCBSly80bDD/8NKqnhVkeAn2N4xCZ/DRuZiYqyvzBO1GyH1mjpd
 sZPDOTAdEzHwfObiBIr0f7iyduNm0mN6FdMB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjLxHP9MRkvoQ1DS1KFKpemlH7rDi6kA4aqwWK4QoRM=;
 b=afI5eC8+Bqb3fBNYtG3ZrzjT7/KKuy48B8M3lygzBv7sBMSeeGwBa1tmdybJVjWZGS
 hd4/MMQ2ZM3MtYRPL34ovnqkd4A1NHA0OzHw8lpramEaelPNqPIrRxR4P5xbrITbxWTk
 +CJg3e5zc4QhYDPNH/SY+OIOQf4eu3tmFls8nCr8xl6jZ9duxc3UM4YzgMWLEAF7ZA7w
 LtC2P+sXmODm91gx2BNlNn2HQLIpYIklNb93DxnOVNwAvPkXLznWhWpPehl+Yy7ZfJDX
 4+4iLvelkc0TnZO7KcF2BkCzgBLwQQ8qbCHmwJJZyMMkKblLq06Tw1SIeliX1zaN6POm
 nF/w==
X-Gm-Message-State: AOAM5306xoR/RUToKIBXP/IT9cvp7xvL0UPsLLrXDcZrSBVWIqn3/JjX
 okEndUOeU8gHg7IVLImmvjBn5s0COEZkvA==
X-Google-Smtp-Source: ABdhPJyyVD/5cCB6pXlCMZq+DsMv0QZoHc8PXZc/ynxOQKw4d/sMHW9S1XroDojy3NR1n4b1PGjlTg==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr8258417wmh.185.1621588212304; 
 Fri, 21 May 2021 02:10:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:11 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/11] drm/vram-helpers: Create DRM_GEM_VRAM_PLANE_HELPER_FUNCS
Date: Fri, 21 May 2021 11:09:56 +0200
Message-Id: <20210521090959.1663703-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like we have for the shadow helpers too, and roll it out to drivers.

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
index 36d9575aa27b..20557d2c2fae 100644
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
2.31.0

