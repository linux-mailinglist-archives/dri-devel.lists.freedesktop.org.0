Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0B3A1C10
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE386EA71;
	Wed,  9 Jun 2021 17:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3556EA89
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:29 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id l1so20158201pgm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9ZR+MX1nSEbH+h520X8i8csRvOWfsynSr6KKpouy5Y=;
 b=XLBMA/tMAY6CnwrlTknk6NxP7S24pxV24DMPO62tcsRBKjBbNEkD+n/0WLIAQyJqyp
 onYSBJL3rYa6U6zc9iXudgzLiKdhgfErHkqln1ofJctxiPM2YMoDlNuUUYHBYp2vhme3
 r21bqDpfp6efkNIql90xIPRlXEc8WxpdahVQJ2K0LJZDnqMymP5wrdzzArs+r1pL192r
 NlTG4EXfVLq4OAmkzZaD6nKFQSG7VCTJbx79BFY5gFqIU3XfwObsP+ato5Ph805gx4zt
 3t9gWNaR92HqOoE+VeRatLz9Dq1SnIcZjQwXtTA7dEtU0k2zHm3iCWBPEV58i7L08PiB
 knag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9ZR+MX1nSEbH+h520X8i8csRvOWfsynSr6KKpouy5Y=;
 b=B/uCEI+ccZDHZkZRydXVvvts6wJi43SwpdQdnzr1+DP/rb7tlAdyZBoGLWiD0zVf3f
 L6S+FTzLcYT+QMVxLBl7ni6QAh7pgszUBaSYQW8ydMHWE8ciKb/5u3gM6RHKCkniN2p7
 3efcYZ/7O2ysM8x5vtVCtOS4OE9OOg5ssNmpHHDwn7QN29sZoQ4uF6UmWIwR6ttL0BvN
 68NVVydKeS4CXjLkjU3AMhWFAdUq3h8EC6lFWIKEklufpi1+cvqFRqB5XSS82qJLt3AE
 VIZvPcim7YFt/Cs4eGnT7xBj/ZOz2Tc3wPOTRpPlmhaQcdwDmKyyOnfmIgyMB/72rsU/
 k8MA==
X-Gm-Message-State: AOAM530MqW3lphwF33x7mjOOElWpqUNJhf9Gja8b+EmcYXtUuenW76jn
 i1XyAPjDU7aa4iHCO/fVf5T+3fOOBjW6Yw==
X-Google-Smtp-Source: ABdhPJzgvI2rHxg22mpisEoC/z7Z03GE9JiApcI1DwsQKA8BQs2FnrSM/hXDiU12XclJW65KW3D1nA==
X-Received: by 2002:a63:d908:: with SMTP id r8mr821921pgg.414.1623260668875;
 Wed, 09 Jun 2021 10:44:28 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:28 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/31] drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
Date: Wed,  9 Jun 2021 12:43:50 -0500
Message-Id: <20210609174418.249585-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The idea behind this param is to support OpenCL drivers with relocations
because OpenCL reserves 0x0 for NULL and, if we placed memory there, it
would confuse CL kernels.  It was originally sent out as part of a patch
series including libdrm [1] and Beignet [2] support.  However, the
libdrm and Beignet patches never landed in their respective upstream
projects so this API has never been used.  It's never been used in Mesa
or any other driver, either.

Dropping this API allows us to delete a small bit of code.

[1]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067030.html
[2]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067031.html

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c      | 16 ++--------------
 .../gpu/drm/i915/gem/i915_gem_context_types.h    |  1 -
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c   |  8 --------
 include/uapi/drm/i915_drm.h                      |  4 ++++
 4 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index a4faf06022d5a..5fc0eb4beeeae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1920,15 +1920,6 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 	int ret = 0;
 
 	switch (args->param) {
-	case I915_CONTEXT_PARAM_NO_ZEROMAP:
-		if (args->size)
-			ret = -EINVAL;
-		else if (args->value)
-			set_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
-		else
-			clear_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
-		break;
-
 	case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
 		if (args->size)
 			ret = -EINVAL;
@@ -1978,6 +1969,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
 		ret = set_persistence(ctx, args);
 		break;
 
+	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_RINGSIZE:
 	default:
@@ -2358,11 +2350,6 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	switch (args->param) {
-	case I915_CONTEXT_PARAM_NO_ZEROMAP:
-		args->size = 0;
-		args->value = test_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
-		break;
-
 	case I915_CONTEXT_PARAM_GTT_SIZE:
 		args->size = 0;
 		rcu_read_lock();
@@ -2410,6 +2397,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		args->value = i915_gem_context_is_persistent(ctx);
 		break;
 
+	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
 	case I915_CONTEXT_PARAM_RINGSIZE:
 	default:
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 340473aa70de0..5ae71ec936f7c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -129,7 +129,6 @@ struct i915_gem_context {
 	 * @user_flags: small set of booleans controlled by the user
 	 */
 	unsigned long user_flags;
-#define UCONTEXT_NO_ZEROMAP		0
 #define UCONTEXT_NO_ERROR_CAPTURE	1
 #define UCONTEXT_BANNABLE		2
 #define UCONTEXT_RECOVERABLE		3
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index a8abc9af5ff47..19a453bb170a1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -290,7 +290,6 @@ struct i915_execbuffer {
 	struct intel_context *reloc_context;
 
 	u64 invalid_flags; /** Set of execobj.flags that are invalid */
-	u32 context_flags; /** Set of execobj.flags to insert from the ctx */
 
 	u64 batch_len; /** Length of batch within object */
 	u32 batch_start_offset; /** Location within object of batch */
@@ -541,9 +540,6 @@ eb_validate_vma(struct i915_execbuffer *eb,
 			entry->flags |= EXEC_OBJECT_NEEDS_GTT | __EXEC_OBJECT_NEEDS_MAP;
 	}
 
-	if (!(entry->flags & EXEC_OBJECT_PINNED))
-		entry->flags |= eb->context_flags;
-
 	return 0;
 }
 
@@ -750,10 +746,6 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	if (rcu_access_pointer(ctx->vm))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
 
-	eb->context_flags = 0;
-	if (test_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags))
-		eb->context_flags |= __EXEC_OBJECT_NEEDS_BIAS;
-
 	return 0;
 }
 
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index ad8f1a0f587f6..e527f5f7e0dea 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -1639,6 +1639,10 @@ struct drm_i915_gem_context_param {
 	__u32 size;
 	__u64 param;
 #define I915_CONTEXT_PARAM_BAN_PERIOD	0x1
+/* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
+ * someone somewhere has attempted to use it, never re-use this context
+ * param number.
+ */
 #define I915_CONTEXT_PARAM_NO_ZEROMAP	0x2
 #define I915_CONTEXT_PARAM_GTT_SIZE	0x3
 #define I915_CONTEXT_PARAM_NO_ERROR_CAPTURE	0x4
-- 
2.31.1

