Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339621A01F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 14:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D426EA5F;
	Thu,  9 Jul 2020 12:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDB36EA5F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 12:33:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 17so1631286wmo.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3e+2hfQAEno550QSTUaHwqumwSkwkBzuWx2HdwXt2vk=;
 b=dcBagqjPL5oaA17pl8tDkIKyeu12QXbFJrtQGGLySAvLDY4xiergC2IYR6E1fpmf4p
 1WACZV3CMOEQku9V/ZRJ4sZLASuV3NVXphsb30Q+GUjzDBa8TFvBnMO71pd02lVOROXU
 YPnb5OTAQoA0wAe6EW+/BDiI3Gr7pzCuT6Vuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3e+2hfQAEno550QSTUaHwqumwSkwkBzuWx2HdwXt2vk=;
 b=bTKcXP8g53kzvztLCedSkLtb0H4+1TmPGwL4vsLVoCtgtEym/MNVbjdaa5a24zjUhE
 hIxj+KBhfeopCUrqH05fz5jvcqAZs8jdug5A4Z+oMvJEge9p/sP8jhpGlYwQ/gMFYEdJ
 XO2RKnB/vn1JknRWybZDlgJGNU4FgO157mdQEr+sQuZ3iWeeAAPniR7GOb0FixOErsXn
 G9/7ap1PocwviBxZ8Uj3Scpof0koqrOq93yRBtYi6Fsasi75o2QScVzfuOzpNFj8HPQ2
 Euib1GdKhdBZMDA7DSIyCXqydKNhoWoQ97kRrTDmQnpUySoeWJTV2SqoyozXqJdau/nv
 7s1Q==
X-Gm-Message-State: AOAM533Y00Z8b/kCvUF9+p1wW2y6db5zODHZcV6V3ZD05PeiHzLQlK4P
 mKrBphBrGvyoX8URB3F508xJxW8ZhOw=
X-Google-Smtp-Source: ABdhPJz0m548k8vvU6TSo8mQCX1rasisxK2aa1KJaJsuIt1AObEfDAw51itB4tLFY3QZ8k7xMQcj5w==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr13930700wmi.98.1594298032057; 
 Thu, 09 Jul 2020 05:33:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o205sm4925347wme.24.2020.07.09.05.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 05:33:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Date: Thu,  9 Jul 2020 14:33:39 +0200
Message-Id: <20200709123339.547390-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709123339.547390-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Exactly matches the one in the helpers.

This avoids me having to roll out dma-fence critical section
annotations to this copy.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index f3ce49c5a34c..af55b334be2f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -314,25 +314,6 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	return &virtio_gpu_fb->base;
 }
 
-static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
-{
-	struct drm_device *dev = state->dev;
-
-	drm_atomic_helper_commit_modeset_disables(dev, state);
-	drm_atomic_helper_commit_modeset_enables(dev, state);
-	drm_atomic_helper_commit_planes(dev, state, 0);
-
-	drm_atomic_helper_fake_vblank(state);
-	drm_atomic_helper_commit_hw_done(state);
-
-	drm_atomic_helper_wait_for_vblanks(dev, state);
-	drm_atomic_helper_cleanup_planes(dev, state);
-}
-
-static const struct drm_mode_config_helper_funcs virtio_mode_config_helpers = {
-	.atomic_commit_tail = vgdev_atomic_commit_tail,
-};
-
 static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
 	.fb_create = virtio_gpu_user_framebuffer_create,
 	.atomic_check = drm_atomic_helper_check,
@@ -346,7 +327,6 @@ void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	drm_mode_config_init(vgdev->ddev);
 	vgdev->ddev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 	vgdev->ddev->mode_config.funcs = &virtio_gpu_mode_funcs;
-	vgdev->ddev->mode_config.helper_private = &virtio_mode_config_helpers;
 
 	/* modes will be validated against the framebuffer size */
 	vgdev->ddev->mode_config.min_width = XRES_MIN;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
