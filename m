Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDFB3C164D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCA76E8E3;
	Thu,  8 Jul 2021 15:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18986E8E3
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:39 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 w8-20020a0568304108b02904b3da3d49e5so2256170ott.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vFkKIfTzrT+qTkAItimJAJYSXsVbBQ11ib+/lb9hh64=;
 b=QSSUDwDNiEK6ZBL5yLo1hNNv2ENnScNllsIF0xWCxmloGYiXrZ1IAdsVLsSsNhdHix
 X5SfMw/SAzayCkg51MvY7Qq4RNvGdvWZSt64qKdPdYmoG/MLPEtK7miyVHn/1VN4sxZL
 uIqU4uLVqaiEKW3ZggLP0TVkP1r+WrJvK/OfTOBDHc3nGnmIPJ0kch4/k0T13wpX1teM
 gV+7L5XfaSvE6WJzfQtt+gD9pPKv5s4v2KgmLuVv+xnC2IE04lavWE3C9K6Xpj0u6hDD
 WPlhJoKrQ4YIwILpkvz+Z/joDv/ODVXAotcoEY6zjJ13Qw/3wmLQQG8oWuD1oonN9qa7
 gVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vFkKIfTzrT+qTkAItimJAJYSXsVbBQ11ib+/lb9hh64=;
 b=WTCAWnDTQHXH+ENuM3IQM6B/ESr+6mDFXblSRwveOHOI9Drg1nebIUzWrEtD8WwS7M
 jIpdiO6rOBW0eZHVNP0wU/HDD0nOogvv80lXSLZPsx2IchINhD9LwlkTiBthbkECb7qA
 wStSUgd7hnS2Z+BDrgzUaOECJ4in/qiZJGHFLP+eVCaJ3XoW5CupGNT5NU/QXwmfijKE
 bWl6KNHvLw5MSZ/iIOpwe/FILu1j+IdIkNUd0IlGypPO5V8dPloqivMXQELbdRk4qLy1
 vvePhx8A/KTArV6z+pdY8tmepYtKviAg9zRigMvt34ZxryVIR6vJ3VPWetTrXDRkrnez
 cNww==
X-Gm-Message-State: AOAM532HxRJZ8tUnDDzcWDIES6IWBONBoXllovN6RkSYVpud6YyU+1yR
 JGmjm7su3Wsh7uZLwL0nwg6Jo0BH8wuBPA==
X-Google-Smtp-Source: ABdhPJxgPdPZ8bK91P0vddgKSEvxWm9b0YDfqf1u1Ij/fxMnIBI3tuJVDd3m4TpH5YObG5Slv1COqw==
X-Received: by 2002:a05:6830:1f55:: with SMTP id
 u21mr24123978oth.4.1625759319069; 
 Thu, 08 Jul 2021 08:48:39 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:38 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/30] drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
Date: Thu,  8 Jul 2021 10:48:06 -0500
Message-Id: <20210708154835.528166-2-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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
index 01f28ad5ea578..10b3bb6207bab 100644
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
index 2f70c48567c06..f229c0abcbb54 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1722,24 +1722,8 @@ struct drm_i915_gem_context_param {
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

