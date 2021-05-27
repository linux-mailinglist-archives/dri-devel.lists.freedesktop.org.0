Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE723933D3
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D186F452;
	Thu, 27 May 2021 16:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795CF6F44F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso772383pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXXZSOVAXoArgl6T1nQauVAu5cjGHtdbhlLvXep877s=;
 b=oivzI9EmMb/hA1UqJXEaYBIrp0n1FFB82L3FgEqRveN6ad4nARl5gOW5z+cjAMFnVs
 lnGa2ZwkyLZorhpRGw4e3W0dmJaNkutHzcZVblLB5DWxSecvnHrovDXhAt2IafZ4y9iC
 Vfsg3LyuOLsw5C9xfIWiL/Oe5EZAW1cH8Kw+WsZuUWTrMwSBA7LrUceoTjWV7ZjTCWvN
 bh7q2Bi6UuWUTdP3s3eeBwmD+5qNdmDT5X5XVw0duYlWZkdE4vK/Fce79MlkjupsQZBX
 ngErf8mfYvgk+w7boh18nIlXdQ9UL33fJimWid3T3LbYjVotQ56U0MFGQHx2JzuDj6/z
 ioTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nXXZSOVAXoArgl6T1nQauVAu5cjGHtdbhlLvXep877s=;
 b=dJ5ibbFQgOuuTCR9lUIDP+atUnx2mImY40ai3ibtrjJeI5BRNkYBKtO9ICGwMofVBY
 pTzDSBEKcfM3mIdpxLOFAk3VooJyVs75pc6HrQQ5HQ6ONaKavqlVMoGJNUGg8mQ5Tx94
 nZgnkEfasYVxV3vJWC8+rxtn0n0DoA//nnp7Iquo0XUFwCiN97nZIUxAAKiv7nPDym2S
 x18ggHsQ1LkXSI7V7d8rTlZPM2oUopf0JlaNlqtMK7h1bvkmhGCM/m2Nttnq9mPjEylj
 8+lA5xOLYOd/C7EdcPx3TwLsQXYNoO8wP69dU8dUp5f7sNGGVKEqvtO0EZPPfBMl4zlI
 bGoA==
X-Gm-Message-State: AOAM531UZv3iiT+BtdbMcCRYdlT2eemyBxbv8LVoCq9I8iaYl+xy5Rei
 Nwst/7mB+zrI3m9GJb9lfTrUAw==
X-Google-Smtp-Source: ABdhPJyotrqvjM4D3hGiSjuiY+YgW7QvgICzu083MEshtquIo9QG3kOLV/Roo87DEqlggOHUqLDS+w==
X-Received: by 2002:a17:90a:3ec3:: with SMTP id
 k61mr10328774pjc.48.1622132834045; 
 Thu, 27 May 2021 09:27:14 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/29] drm/i915: Stop manually RCU banging in
 reset_stats_ioctl (v2)
Date: Thu, 27 May 2021 11:26:34 -0500
Message-Id: <20210527162650.1182544-14-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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

As far as I can tell, the only real reason for this is to avoid taking a
reference to the i915_gem_context.  The cost of those two atomics
probably pales in comparison to the cost of the ioctl itself so we're
really not buying ourselves anything here.  We're about to make context
lookup a tiny bit more complicated, so let's get rid of the one hand-
rolled case.

Some usermode drivers such as our Vulkan driver call GET_RESET_STATS on
every execbuf so the perf here could theoretically be an issue.  If this
ever does become a performance issue for any such userspace drivers,
they can use set CONTEXT_PARAM_RECOVERABLE to false and look for -EIO
coming from execbuf to check for hangs instead.

v2 (Daniel Vetter):
 - Add a comment in the commit message about recoverable contexts

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++---------
 drivers/gpu/drm/i915/i915_drv.h             |  8 +-------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 2b9207b557cc9..910d31cb043e9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2090,16 +2090,13 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_reset_stats *args = data;
 	struct i915_gem_context *ctx;
-	int ret;
 
 	if (args->flags || args->pad)
 		return -EINVAL;
 
-	ret = -ENOENT;
-	rcu_read_lock();
-	ctx = __i915_gem_context_lookup_rcu(file->driver_priv, args->ctx_id);
+	ctx = i915_gem_context_lookup(file->driver_priv, args->ctx_id);
 	if (!ctx)
-		goto out;
+		return -ENOENT;
 
 	/*
 	 * We opt for unserialised reads here. This may result in tearing
@@ -2116,10 +2113,8 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
 	args->batch_active = atomic_read(&ctx->guilty_count);
 	args->batch_pending = atomic_read(&ctx->active_count);
 
-	ret = 0;
-out:
-	rcu_read_unlock();
-	return ret;
+	i915_gem_context_put(ctx);
+	return 0;
 }
 
 /* GEM context-engines iterator: for_each_gem_engine() */
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 39b5e019c1a5b..48316d273af66 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1857,19 +1857,13 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
 struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags);
 
-static inline struct i915_gem_context *
-__i915_gem_context_lookup_rcu(struct drm_i915_file_private *file_priv, u32 id)
-{
-	return xa_load(&file_priv->context_xa, id);
-}
-
 static inline struct i915_gem_context *
 i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 {
 	struct i915_gem_context *ctx;
 
 	rcu_read_lock();
-	ctx = __i915_gem_context_lookup_rcu(file_priv, id);
+	ctx = xa_load(&file_priv->context_xa, id);
 	if (ctx && !kref_get_unless_zero(&ctx->ref))
 		ctx = NULL;
 	rcu_read_unlock();
-- 
2.31.1

