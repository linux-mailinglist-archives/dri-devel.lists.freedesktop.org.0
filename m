Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA33C64A9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C2C89E57;
	Mon, 12 Jul 2021 20:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9489E35
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d12so26633825wre.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYZ3zn3qRqcX4QX0xa+aX3+b2aV1OAC4nuxuJao/TIs=;
 b=iLdhvncvMehG3CMbVMdt9M3L7qP6RiSP4tr1fgRJGs/58RZsgrNOm9THAZ/YpKY/kj
 xk2m8kgsgiVtZ9uxL+1MD14yEGQ7Kt1hzEGyymb9Kyi8SZOnehXzQmfeCHGd8erh3UN4
 wtTzkSvMaCID4rpz9Hno/2UC+sbpGTDdXwzoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYZ3zn3qRqcX4QX0xa+aX3+b2aV1OAC4nuxuJao/TIs=;
 b=RUfCnB7xShwEQFl1jLEXHlTMIGHA2ZhV4ZMfH11A4JzcbkpN9WCgcM1TEREnyA6UX+
 c8yFWvin6y+dAYosH9mb7fT1Ejll8tVDPdrgZuzqpiKJnJ4eXq7XVVD4TOTSz8Q8y5qH
 WOYaeLomg7FjMRt5slIA84jmCxNCKaeImePruSUrw6bEcux38xZr0bk3iqHXIEFp4mRk
 WVumXUjRIMJ3a/ThyCfUq4eIqlHKFfcHadw72uq0oDrjCSYgsvGNpwjdtth/XKnV8T7E
 DlNY2OmfFS4W18I2lJS5pM/GpezhNKhbcxRRmeBJP3EQc1aV073lJcVPn0W6aW1NvsK6
 JZkg==
X-Gm-Message-State: AOAM5315WTahgKXczEn/e/qs9sfOog14c95JTqqT6z8s/xPaKqH/B8jE
 /QDXY/dNXe8URjAF8Bi0thg5+WuQpRfsDA==
X-Google-Smtp-Source: ABdhPJzmH/nTLmGb+ExV6HNR5uEPv5w6fQPO5qJChCG21HGJV0po3gL5/j1Ld/+eWPDtVP49XyJB5Q==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr820566wri.199.1626120133456; 
 Mon, 12 Jul 2021 13:02:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:02:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 16/18] drm/i915: delete exclude argument from
 i915_sw_fence_await_reservation
Date: Mon, 12 Jul 2021 19:53:50 +0200
Message-Id: <20210712175352.802687-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
index b95c8927d465..b4a77eba8631 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2087,7 +2087,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
 
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

