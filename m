Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5583A1C0F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BEE6EA85;
	Wed,  9 Jun 2021 17:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEBF6EA17
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:26 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id 11so12943096plk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YY2xfj/muBCPnRrbUysqp81YKOJx+xN58hZknSXzX+A=;
 b=I2df9jo5dbUSWUa8Di1qAPlJ+GBpWAAqjnTQSw1eWMBgVUSPdtLvZ1TG+iZcOWYTnX
 FGGom3WJKvaxzbPjd8EJaqOTZfSXFBoPe1aQ3NKGMGAMDheWArj+rHhzLB3HQJmeTLgh
 quWRcABik0VGeBI9vBHPPGFmk3OckaiOdZgE3Mz8I69qlOHbfmMoZpQsQoawqd1jzBQ3
 30bTVfRaTYLNpRi3oAkjM2+HvequJvSvw458UN5e8M7ZjzZEYFS4n2jVjeJBcI59S6hQ
 TgVCyqBgAykXFQpmNrBjdsmCuaigIuKqhOHdfqOVBzDa16u6WzoZzrLoHnGrIS1uZGfZ
 ZFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YY2xfj/muBCPnRrbUysqp81YKOJx+xN58hZknSXzX+A=;
 b=Nl0D19YVb1TAOrSXWSzgkrgsA2HYuYIg7SogiRImjbzY/YqTKdRcx6xNIt4eJiSV0i
 fTI9pUb4NWxR66ZhNwmRG837CS3oIACZskkcTPTFllU8EXfat18wUuwa87Lc1xcVeA9T
 TE8OXtaiDPn02I+j80ZdBLqffFC2nRYJJNnATtoy+6E+gP9AR/Djtq0UPaFxlzJFtx3B
 F0cIBWY6WHPF0/NTw1RegkaFtk/wDvUua0AGSe4K0hcx+jN99cvOnpL7z2F1P1AccE5F
 wEjcheltWKirpMNyrsrsUjToZ+APHrSrXIHMT8bIgzelNZAcMUC+c5k9bux+X/lYSfvQ
 pepw==
X-Gm-Message-State: AOAM533H5dfieQ1Yt4tqyD1WpxU5fswbTc1UtECIrZs963ZkiRhZTf2P
 LOg29PF8IQtPj7+FpXyDYBk2tHrIgf9P7A==
X-Google-Smtp-Source: ABdhPJz86SyA0B6XciefWZQpAvuDtpou4KBvdoY6zgN8S4+FDudoHp7eaEVtTBBmrH4uzeBEsvwe0g==
X-Received: by 2002:a17:90a:2a08:: with SMTP id
 i8mr2908137pjd.122.1623260665557; 
 Wed, 09 Jun 2021 10:44:25 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/31] drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
Date: Wed,  9 Jun 2021 12:43:48 -0500
Message-Id: <20210609174418.249585-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 88be76cdafc7 ("drm/i915: Allow userspace to specify
ringsize on construction").  This API was originally added for OpenCL
but the compute-runtime PR has sat open for a year without action so we
can still pull it out if we want.  I argue we should drop it for three
reasons:

 1. If the compute-runtime PR has sat open for a year, this clearly
    isn't that important.

 2. It's a very leaky API.  Ring size is an implementation detail of the
    current execlist scheduler and really only makes sense there.  It
    can't apply to the older ring-buffer scheduler on pre-execlist
    hardware because that's shared across all contexts and it won't
    apply to the GuC scheduler that's in the pipeline.

 3. Having userspace set a ring size in bytes is a bad solution to the
    problem of having too small a ring.  There is no way that userspace
    has the information to know how to properly set the ring size so
    it's just going to detect the feature and always set it to the
    maximum of 512K.  This is what the compute-runtime PR does.  The
    scheduler in i915, on the other hand, does have the information to
    make an informed choice.  It could detect if the ring size is a
    problem and grow it itself.  Or, if that's too hard, we could just
    increase the default size from 16K to 32K or even 64K instead of
    relying on userspace to do it.

Let's drop this API for now and, if someone decides they really care
about solving this problem, they can do it properly.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/Makefile                 |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 85 +------------------
 drivers/gpu/drm/i915/gt/intel_context_param.c | 63 --------------
 drivers/gpu/drm/i915/gt/intel_context_param.h |  3 -
 include/uapi/drm/i915_drm.h                   | 20 +----
 5 files changed, 4 insertions(+), 168 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4f22cac1c49be..0a3e8c85da9f2 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -89,7 +89,6 @@ gt-y += \
 	gt/gen8_ppgtt.o \
 	gt/intel_breadcrumbs.o \
 	gt/intel_context.o \
-	gt/intel_context_param.o \
 	gt/intel_context_sseu.o \
 	gt/intel_engine_cs.o \
 	gt/intel_engine_heartbeat.o \
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7720b8c22c816..ddc3cc3f8f092 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1334,63 +1334,6 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
 	return err;
 }
 
-static int __apply_ringsize(struct intel_context *ce, void *sz)
-{
-	return intel_context_set_ring_size(ce, (unsigned long)sz);
-}
-
-static int set_ringsize(struct i915_gem_context *ctx,
-			struct drm_i915_gem_context_param *args)
-{
-	if (!HAS_LOGICAL_RING_CONTEXTS(ctx->i915))
-		return -ENODEV;
-
-	if (args->size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(args->value, I915_GTT_PAGE_SIZE))
-		return -EINVAL;
-
-	if (args->value < I915_GTT_PAGE_SIZE)
-		return -EINVAL;
-
-	if (args->value > 128 * I915_GTT_PAGE_SIZE)
-		return -EINVAL;
-
-	return context_apply_all(ctx,
-				 __apply_ringsize,
-				 __intel_context_ring_size(args->value));
-}
-
-static int __get_ringsize(struct intel_context *ce, void *arg)
-{
-	long sz;
-
-	sz = intel_context_get_ring_size(ce);
-	GEM_BUG_ON(sz > INT_MAX);
-
-	return sz; /* stop on first engine */
-}
-
-static int get_ringsize(struct i915_gem_context *ctx,
-			struct drm_i915_gem_context_param *args)
-{
-	int sz;
-
-	if (!HAS_LOGICAL_RING_CONTEXTS(ctx->i915))
-		return -ENODEV;
-
-	if (args->size)
-		return -EINVAL;
-
-	sz = context_apply_all(ctx, __get_ringsize, NULL);
-	if (sz < 0)
-		return sz;
-
-	args->value = sz;
-	return 0;
-}
-
 int
 i915_gem_user_to_context_sseu(struct intel_gt *gt,
 			      const struct drm_i915_gem_context_param_sseu *user,
@@ -2036,11 +1979,8 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 		ret = set_persistence(ctx, args);
 		break;
 
-	case I915_CONTEXT_PARAM_RINGSIZE:
-		ret = set_ringsize(ctx, args);
-		break;
-
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
+	case I915_CONTEXT_PARAM_RINGSIZE:
 	default:
 		ret = -EINVAL;
 		break;
@@ -2068,18 +2008,6 @@ static int create_setparam(struct i915_user_extension __user *ext, void *data)
 	return ctx_setparam(arg->fpriv, arg->ctx, &local.param);
 }
 
-static int copy_ring_size(struct intel_context *dst,
-			  struct intel_context *src)
-{
-	long sz;
-
-	sz = intel_context_get_ring_size(src);
-	if (sz < 0)
-		return sz;
-
-	return intel_context_set_ring_size(dst, sz);
-}
-
 static int clone_engines(struct i915_gem_context *dst,
 			 struct i915_gem_context *src)
 {
@@ -2124,12 +2052,6 @@ static int clone_engines(struct i915_gem_context *dst,
 		}
 
 		intel_context_set_gem(clone->engines[n], dst);
-
-		/* Copy across the preferred ringsize */
-		if (copy_ring_size(clone->engines[n], e->engines[n])) {
-			__free_engines(clone, n + 1);
-			goto err_unlock;
-		}
 	}
 	clone->num_engines = n;
 	i915_sw_fence_complete(&e->fence);
@@ -2489,11 +2411,8 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		args->value = i915_gem_context_is_persistent(ctx);
 		break;
 
-	case I915_CONTEXT_PARAM_RINGSIZE:
-		ret = get_ringsize(ctx, args);
-		break;
-
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
+	case I915_CONTEXT_PARAM_RINGSIZE:
 	default:
 		ret = -EINVAL;
 		break;
diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.c b/drivers/gpu/drm/i915/gt/intel_context_param.c
deleted file mode 100644
index 65dcd090245d6..0000000000000
--- a/drivers/gpu/drm/i915/gt/intel_context_param.c
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#include "i915_active.h"
-#include "intel_context.h"
-#include "intel_context_param.h"
-#include "intel_ring.h"
-
-int intel_context_set_ring_size(struct intel_context *ce, long sz)
-{
-	int err;
-
-	if (intel_context_lock_pinned(ce))
-		return -EINTR;
-
-	err = i915_active_wait(&ce->active);
-	if (err < 0)
-		goto unlock;
-
-	if (intel_context_is_pinned(ce)) {
-		err = -EBUSY; /* In active use, come back later! */
-		goto unlock;
-	}
-
-	if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
-		struct intel_ring *ring;
-
-		/* Replace the existing ringbuffer */
-		ring = intel_engine_create_ring(ce->engine, sz);
-		if (IS_ERR(ring)) {
-			err = PTR_ERR(ring);
-			goto unlock;
-		}
-
-		intel_ring_put(ce->ring);
-		ce->ring = ring;
-
-		/* Context image will be updated on next pin */
-	} else {
-		ce->ring = __intel_context_ring_size(sz);
-	}
-
-unlock:
-	intel_context_unlock_pinned(ce);
-	return err;
-}
-
-long intel_context_get_ring_size(struct intel_context *ce)
-{
-	long sz = (unsigned long)READ_ONCE(ce->ring);
-
-	if (test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
-		if (intel_context_lock_pinned(ce))
-			return -EINTR;
-
-		sz = ce->ring->size;
-		intel_context_unlock_pinned(ce);
-	}
-
-	return sz;
-}
diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
index 3ecacc675f414..dffedd983693d 100644
--- a/drivers/gpu/drm/i915/gt/intel_context_param.h
+++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
@@ -10,9 +10,6 @@
 
 #include "intel_context.h"
 
-int intel_context_set_ring_size(struct intel_context *ce, long sz);
-long intel_context_get_ring_size(struct intel_context *ce);
-
 static inline int
 intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
 {
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index c2c7759b7d2ee..ad8f1a0f587f6 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1723,24 +1723,8 @@ struct drm_i915_gem_context_param {
  */
 #define I915_CONTEXT_PARAM_PERSISTENCE	0xb
 
-/*
- * I915_CONTEXT_PARAM_RINGSIZE:
- *
- * Sets the size of the CS ringbuffer to use for logical ring contexts. This
- * applies a limit of how many batches can be queued to HW before the caller
- * is blocked due to lack of space for more commands.
- *
- * Only reliably possible to be set prior to first use, i.e. during
- * construction. At any later point, the current execution must be flushed as
- * the ring can only be changed while the context is idle. Note, the ringsize
- * can be specified as a constructor property, see
- * I915_CONTEXT_CREATE_EXT_SETPARAM, but can also be set later if required.
- *
- * Only applies to the current set of engine and lost when those engines
- * are replaced by a new mapping (see I915_CONTEXT_PARAM_ENGINES).
- *
- * Must be between 4 - 512 KiB, in intervals of page size [4 KiB].
- * Default is 16 KiB.
+/* This API has been removed.  On the off chance someone somewhere has
+ * attempted to use it, never re-use this context param number.
  */
 #define I915_CONTEXT_PARAM_RINGSIZE	0xc
 /* Must be kept compact -- no holes and well documented */
-- 
2.31.1

