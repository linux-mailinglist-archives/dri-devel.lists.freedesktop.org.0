Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C853B0ADD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082716E80B;
	Tue, 22 Jun 2021 16:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88046E7FA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c84so13233686wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=naYXUUBK9vopSkhhs+SbsF73vr2q6Xr/BYlxTkKgAp0=;
 b=iDYuCEvjyN5+Pfuqb1UsGVxfsga4Ic/bTWJ8nWmsQBk5g2S3VYvlZ3dG/lFUvsZbop
 t0Ibzs1N5/7tRD0ECm8MCxfIWvNsGc0PNNqedHX0wsI16ShJ49dxu16wHmHZZ8Bbg1xD
 vLHE8BKlnMjbWbuNOC4UyF7BT2siUXfkKIwYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=naYXUUBK9vopSkhhs+SbsF73vr2q6Xr/BYlxTkKgAp0=;
 b=Xbh3GkwrFnMuitF/ItRA3z5WlH2D430Dv1le/9KkqP3egAz6kuhl11iPfDj5XDjMtY
 KouwehpbNxQE8vZHf9h69TIxnUE/V8TKBwkfS1eO2DlTCFnhKE2lWZT91dljEMs6m5Mn
 JV85I2c/4gxnzKy53bJ1yMjOK0p84bfr+NAHsukxPzTC5G3BHHPEzhGFvpMAxLaLAw5Z
 VEVx9B1I0I2OQPzzRu0zbHr7lkDOXoZ94z4JdBC3ZmDp/MfpDvLUzGHyIgussFcLkL7Y
 P/gyDwj0spSj7gqb1coxxaPgAQe+9RKT7QoYKrvT+2O5nS9W86DswDT884+YGdZ+lY1Q
 G37g==
X-Gm-Message-State: AOAM530eBIvkWhGpqly9S8DZUnuh8/EQljZO1uqqkPWxRhEr/7jTsxYC
 bdz3NlTkyWqD4uVhhPElenN+jFwaQftoCg==
X-Google-Smtp-Source: ABdhPJw0LKWc1TI6pW6BsmNY5c+TyH8/tdOMgNd0GE908rhXRG0DT8WnDBRncDVrGcFh1olBqutBxQ==
X-Received: by 2002:a05:600c:d8:: with SMTP id
 u24mr5847552wmm.94.1624380927672; 
 Tue, 22 Jun 2021 09:55:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/15] drm/armada: Remove prepare/cleanup_fb hooks
Date: Tue, 22 Jun 2021 18:55:05 +0200
Message-Id: <20210622165511.3169559-10-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All they do is refcount the fb, which the atomic helpers already do.

This is was necessary with the legacy helpers and I guess just carry
over in the conversion. drm_plane_state always has a full reference
for its ->fb pointer during its entire lifetime,
see __drm_atomic_helper_plane_destroy_state()

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_overlay.c |  2 --
 drivers/gpu/drm/armada/armada_plane.c   | 29 -------------------------
 drivers/gpu/drm/armada/armada_plane.h   |  2 --
 3 files changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index d3e3e5fdc390..424250535fed 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -247,8 +247,6 @@ static void armada_drm_overlay_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs armada_overlay_plane_helper_funcs = {
-	.prepare_fb	= armada_drm_plane_prepare_fb,
-	.cleanup_fb	= armada_drm_plane_cleanup_fb,
 	.atomic_check	= armada_drm_plane_atomic_check,
 	.atomic_update	= armada_drm_overlay_plane_atomic_update,
 	.atomic_disable	= armada_drm_overlay_plane_atomic_disable,
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 40f5c34fb4d8..1c56a2883b91 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -78,33 +78,6 @@ void armada_drm_plane_calc(struct drm_plane_state *state, u32 addrs[2][3],
 	}
 }
 
-int armada_drm_plane_prepare_fb(struct drm_plane *plane,
-	struct drm_plane_state *state)
-{
-	DRM_DEBUG_KMS("[PLANE:%d:%s] [FB:%d]\n",
-		plane->base.id, plane->name,
-		state->fb ? state->fb->base.id : 0);
-
-	/*
-	 * Take a reference on the new framebuffer - we want to
-	 * hold on to it while the hardware is displaying it.
-	 */
-	if (state->fb)
-		drm_framebuffer_get(state->fb);
-	return 0;
-}
-
-void armada_drm_plane_cleanup_fb(struct drm_plane *plane,
-	struct drm_plane_state *old_state)
-{
-	DRM_DEBUG_KMS("[PLANE:%d:%s] [FB:%d]\n",
-		plane->base.id, plane->name,
-		old_state->fb ? old_state->fb->base.id : 0);
-
-	if (old_state->fb)
-		drm_framebuffer_put(old_state->fb);
-}
-
 int armada_drm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_atomic_state *state)
 {
@@ -282,8 +255,6 @@ static void armada_drm_primary_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs armada_primary_plane_helper_funcs = {
-	.prepare_fb	= armada_drm_plane_prepare_fb,
-	.cleanup_fb	= armada_drm_plane_cleanup_fb,
 	.atomic_check	= armada_drm_plane_atomic_check,
 	.atomic_update	= armada_drm_primary_plane_atomic_update,
 	.atomic_disable	= armada_drm_primary_plane_atomic_disable,
diff --git a/drivers/gpu/drm/armada/armada_plane.h b/drivers/gpu/drm/armada/armada_plane.h
index 51dab8d8da22..368415c609a6 100644
--- a/drivers/gpu/drm/armada/armada_plane.h
+++ b/drivers/gpu/drm/armada/armada_plane.h
@@ -21,8 +21,6 @@ struct armada_plane_state {
 
 void armada_drm_plane_calc(struct drm_plane_state *state, u32 addrs[2][3],
 	u16 pitches[3], bool interlaced);
-int armada_drm_plane_prepare_fb(struct drm_plane *plane,
-	struct drm_plane_state *state);
 void armada_drm_plane_cleanup_fb(struct drm_plane *plane,
 	struct drm_plane_state *old_state);
 int armada_drm_plane_atomic_check(struct drm_plane *plane,
-- 
2.32.0.rc2

