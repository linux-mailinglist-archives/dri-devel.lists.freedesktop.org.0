Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA0A3C187F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245C76E978;
	Thu,  8 Jul 2021 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3C26E959
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so7353346wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebIVcjLJn4N3cEp+a/U762UEiwT+qt4xG10RVlPtYgw=;
 b=V18SbWHRGAR0zaN1sDQqgrRvQVKR2QugENmQ3+2W+3uswRppw/EuQ/2IMbfimsozFR
 qRr0kr/33FiO5ZZCnsVyM28Fc0fnEnyI125flwX1bgz8M5NVfIn7wyS7Baia0fcub66Z
 96r1V8+iqi13G3SKIhi7it5D628LnBTeUOsVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebIVcjLJn4N3cEp+a/U762UEiwT+qt4xG10RVlPtYgw=;
 b=BaOV/cDplcxoH4yvgx6hrLKhuRD+1FNGG1BTN0hwe5KuRBrYh870uNuU5LlHxSTqGS
 +GyoOM6B9rcAnrc9ONJIw9wilfd3Tl0JmMprmpP/Gg0aYfZuflmcnslUjzjJLSFBQ8nE
 2wMfMGB+/MCURmk/07bl7HmeGMi1aSaG2VR3ahqyDzpSDzvscQpoJ8bhX8tJXAtSD1/c
 rjAVfMhUccsfSE5k7F+gN8WtbMgI7KpsjPdAxniioWMEcvmKx10xY97INNXS7683qw+X
 25pkXUd9kfCLdT61SEWktU/VTIWS7jN3Kj4yCDBr2UeipFyEv9BZVQKF8nlKbJWj0kON
 2U+A==
X-Gm-Message-State: AOAM530gNm+vZkSPmATVooOuRHMc7nxSEkNKnqKK4VhkJfQYRrYbVs+4
 rysOWSw76QX2WgLvOU+Ds6Zz1Xhlk553dQ==
X-Google-Smtp-Source: ABdhPJyXMCVFCRWFtTsFH7OGVjH31NfKozJkh19X67sH8spSB4P11xfISDzhzh0HFdxxQrmKkRgDMA==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr6524321wmj.99.1625765906233; 
 Thu, 08 Jul 2021 10:38:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:25 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 18/20] drm/i915: delete exclude argument from
 i915_sw_fence_await_reservation
Date: Thu,  8 Jul 2021 19:37:52 +0200
Message-Id: <20210708173754.3877540-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c   | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c    | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c           | 6 +-----
 drivers/gpu/drm/i915/i915_sw_fence.h           | 1 -
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 98e0f4ed7e4a..678c7839034e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11119,7 +11119,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		 */
 		if (intel_crtc_needs_modeset(crtc_state)) {
 			ret = i915_sw_fence_await_reservation(&state->commit_ready,
-							      old_obj->base.resv, NULL,
+							      old_obj->base.resv,
 							      false, 0,
 							      GFP_KERNEL);
 			if (ret < 0)
@@ -11153,7 +11153,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
-						      obj->base.resv, NULL,
+						      obj->base.resv,
 						      false,
 						      i915_fence_timeout(dev_priv),
 						      GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index daf9284ef1f5..93439d2c7a58 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -106,7 +106,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 		clflush = clflush_work_create(obj);
 	if (clflush) {
 		i915_sw_fence_await_reservation(&clflush->base.chain,
-						obj->base.resv, NULL, true,
+						obj->base.resv, true,
 						i915_fence_timeout(to_i915(obj->base.dev)),
 						I915_FENCE_GFP);
 		dma_resv_add_excl_fence(obj->base.resv, &clflush->base.dma);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 68ce366f46cf..47e07179347a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2095,7 +2095,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 
 	/* Wait for all writes (and relocs) into the batch to complete */
 	err = i915_sw_fence_await_reservation(&pw->base.chain,
-					      pw->batch->resv, NULL, false,
+					      pw->batch->resv, false,
 					      0, I915_FENCE_GFP);
 	if (err < 0)
 		goto err_commit;
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

