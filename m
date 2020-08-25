Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3ED2528D6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D016EA47;
	Wed, 26 Aug 2020 08:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964FE6E9CB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 21:57:43 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id k18so178363qtm.10
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWRVhAyQrMMbNCybKNpaTOkjxzgRbbU/WkM3Dt9pX54=;
 b=fcTL7q1gFc3oZ0ZWW6ITOvGLzyP26ghrzc9ma1/q3Derm5NBJOZwguT0X4p6uheACV
 uVVIQzNvB8KGcKFTpJo5tKZxLc9thz96kuXIo29pjk1ZNZkKNl8b8OfOHJLtaPiNbaUY
 7CwCpaIoA0O0CwL1VzmdXnKZkYd4ZWLbRYzhHWtimbk6krXb9E7L67tPAZJ6qtyR+9S+
 BfQFfmygj1UK6xTAM9En3S4vNuGyIq4S4Fcj1wFuh9bg7Vdv0yV7SVLXjWyeB4IjLzJ3
 8mOwUBdLrzcuoMvfNvOV9W3M1KnLAw7XMREVAjiwctxj0JRLrt4P42VToIqM9nSEUquW
 Pvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWRVhAyQrMMbNCybKNpaTOkjxzgRbbU/WkM3Dt9pX54=;
 b=ccsdyppLg8lYeovsv2GfvcBA8MryZHhFlU+C9WApi4hotnMGMwCN84Kb3LFP3UnuoI
 1dVIB66lpEXxLY1s6s7Z3Qla3JZw4s5s+Md+kGWW/Ctcgb+F0wFsZvqIC4faBBxrmCu2
 luteZd7/kDSS/4RGExICa2snG37g+DDBWZMkm78qE2DotwcMnzBNJafKyE2MltZqS1ke
 gNBBe/NZA2K8EHcAMX1lPpT6pi4X9wX87X/M6UZJOow97o8Wnj2Fnpu/YXw+bIwLeeWR
 +aoUqjE43EK2ug3jWHIS+bMex3Pox7QzYWiH4KdBOX3C7tQojiVo0zEyf2BUhJtR55YW
 TSQg==
X-Gm-Message-State: AOAM533DIfD2mPTciIlF0M28c7gNe6loaUv4dU08OMiqcrI2L4/RjulS
 t5uMHeLmkiiM2TGceYc/Dr6W51QgHyCCcg==
X-Google-Smtp-Source: ABdhPJwkJ91ZZA7Cq3/WkBuZ3vsYC6CZvy1AW1h0c+XAfq+Qj5c/LtYCXS036Taqiw9hcTxMPh+/Ew==
X-Received: by 2002:aed:3824:: with SMTP id j33mr3131055qte.374.1598392662216; 
 Tue, 25 Aug 2020 14:57:42 -0700 (PDT)
Received: from localhost.localdomain ([189.7.69.189])
 by smtp.gmail.com with ESMTPSA id w28sm128308qkw.87.2020.08.25.14.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:57:41 -0700 (PDT)
From: Diego Viola <diego.viola@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: fix unblank
Date: Tue, 25 Aug 2020 18:56:46 -0300
Message-Id: <20200825215646.66853-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200818072511.6745-1-kraxel@redhat.com>
References: <20200818072511.6745-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: 1882851@bugs.launchpad.net, Diego Viola <diego.viola@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gerd Hoffmann <kraxel@redhat.com>

When going through a disable/enable cycle without changing the
framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
skip set_scanout if framebuffer didn't change") causes the screen stay
blank.  Add a bool to force an update to fix that.

v2: use drm_atomic_crtc_needs_modeset() (Daniel).

Cc: 1882851@bugs.launchpad.net
Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't change")
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Jiri Slaby <jirislaby@kernel.org>
Tested-by: Diego Viola <diego.viola@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  1 +
 drivers/gpu/drm/virtio/virtgpu_plane.c   |  4 +++-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index af55b334be2f..35b5c80f5d85 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -123,6 +123,17 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
 static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 					 struct drm_crtc_state *old_state)
 {
+	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
+
+	/*
+	 * virtio-gpu can't do modeset and plane update operations
+	 * independant from each other.  So the actual modeset happens
+	 * in the plane update callback, and here we just check
+	 * whenever we must force the modeset.
+	 */
+	if (drm_atomic_crtc_needs_modeset(crtc->state)) {
+		output->needs_modeset = true;
+	}
 }
 
 static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9ff9f4ac0522..4ab1b0ba2925 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -138,6 +138,7 @@ struct virtio_gpu_output {
 	int cur_x;
 	int cur_y;
 	bool enabled;
+	bool needs_modeset;
 };
 #define drm_crtc_to_virtio_gpu_output(x) \
 	container_of(x, struct virtio_gpu_output, crtc)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 52d24179bcec..65757409d9ed 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -163,7 +163,9 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	    plane->state->src_w != old_state->src_w ||
 	    plane->state->src_h != old_state->src_h ||
 	    plane->state->src_x != old_state->src_x ||
-	    plane->state->src_y != old_state->src_y) {
+	    plane->state->src_y != old_state->src_y ||
+	    output->needs_modeset) {
+		output->needs_modeset = false;
 		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
 			  bo->hw_res_handle,
 			  plane->state->crtc_w, plane->state->crtc_h,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
