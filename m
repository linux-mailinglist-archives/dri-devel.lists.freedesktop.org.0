Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCAD3E1336
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E756E9CB;
	Thu,  5 Aug 2021 10:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7196E9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id oz16so8803392ejc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+pI6TZ1QPIOcJk1A0uCls7paFmxbfvE8s42Z5oTP6c=;
 b=buVC1ZMLqRyWVky8o7HIz7vGpXOltwuayhLC3vto8KkyE4tqittp2q3gqbCa6N3x06
 +atwEgdKi/eWssc0BoLXOziqG94FtrlLzaebD34VsTULRWAJ26UXoVTMRRyoI86nbtyd
 CNaV15GLitG9Qda1oo+F7/nggan+55i6hN+HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+pI6TZ1QPIOcJk1A0uCls7paFmxbfvE8s42Z5oTP6c=;
 b=TX+LS1Btxtiu1qQKTZ6BVuFzPQRobHpArikGcGsZ6+UUXgm72bvV/m3EXvPHEkMRM+
 KNwWDDVTR9De7HsDT5beAVPg4WyxY/TNnitNI4wyC2roC/xqc68MEvWjvunzlf6GcVFt
 8vloyx0IkpGEFbtpFa/t6l4EhCRzfG0j0prT9m98Zw6hHNlG9pf5IUh9rvg0mKWD0IE4
 8ZsBT2YJNfDFal3quOuFGRZZeA7p/vD6lUdbIkRq9jtNZlx6J2WGXX2sibvb4A0YldCO
 BssI+RR7zuCCrLQpqMHZymVvO1SBqrNJISGpYMdKrV65w52xnpv9LpHu/KOcl2iSELL3
 X1Zg==
X-Gm-Message-State: AOAM531oQQZaDZwlf5FVJbzlHqBaChOraspI23S9on015+ng3Kbk8nyj
 pKHya+Rk7AaVKJaUxQlhMY2snlCe7qQQDA==
X-Google-Smtp-Source: ABdhPJwBHLiu28XadZXXEwQL9tMBxyen0VW1ZEE8g+dqVKsfXuLFyD7/6U97YRQVkFEObbVPG2lHFg==
X-Received: by 2002:a17:906:5911:: with SMTP id
 h17mr4268457ejq.440.1628160447325; 
 Thu, 05 Aug 2021 03:47:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:26 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH v5 18/20] drm/i915: delete exclude argument from
 i915_sw_fence_await_reservation
Date: Thu,  5 Aug 2021 12:47:03 +0200
Message-Id: <20210805104705.862416-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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

No longer used, the last user disappeared with

commit d07f0e59b2c762584478920cd2d11fba2980a94a
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Oct 28 13:58:44 2016 +0100

    drm/i915: Move GEM activity tracking into a common struct reservation_object

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c  | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c         | 6 +-----
 drivers/gpu/drm/i915/i915_sw_fence.h         | 1 -
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 86b86deca701..0ec736026132 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11248,7 +11248,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		 */
 		if (intel_crtc_needs_modeset(crtc_state)) {
 			ret = i915_sw_fence_await_reservation(&state->commit_ready,
-							      old_obj->base.resv, NULL,
+							      old_obj->base.resv,
 							      false, 0,
 							      GFP_KERNEL);
 			if (ret < 0)
@@ -11282,7 +11282,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
-						      obj->base.resv, NULL,
+						      obj->base.resv,
 						      false,
 						      i915_fence_timeout(dev_priv),
 						      GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index f0435c6feb68..fde88fa90780 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -104,7 +104,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 		clflush = clflush_work_create(obj);
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
-						obj->base.resv, NULL, true,
+						obj->base.resv, true,
 						i915_fence_timeout(to_i915(obj->base.dev)),
 						I915_FENCE_GFP);
 		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..91711a46b1c7 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -567,7 +567,6 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    struct dma_resv *resv,
-				    const struct dma_fence_ops *exclude,
 				    bool write,
 				    unsigned long timeout,
 				    gfp_t gfp)
@@ -587,9 +586,6 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 			return ret;
 
 		for (i = 0; i < count; i++) {
-			if (shared[i]->ops == exclude)
-				continue;
-
 			pending = i915_sw_fence_await_dma_fence(fence,
 								shared[i],
 								timeout,
@@ -609,7 +605,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 		excl = dma_resv_get_excl_unlocked(resv);
 	}
 
-	if (ret >= 0 && excl && excl->ops != exclude) {
+	if (ret >= 0 && excl) {
 		pending = i915_sw_fence_await_dma_fence(fence,
 							excl,
 							timeout,
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
index 30a863353ee6..6572f01668e4 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
@@ -86,7 +86,6 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 
 int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    struct dma_resv *resv,
-				    const struct dma_fence_ops *exclude,
 				    bool write,
 				    unsigned long timeout,
 				    gfp_t gfp);
-- 
2.32.0

