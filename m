Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A135F3A1C26
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065F96EAAF;
	Wed,  9 Jun 2021 17:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2746EABB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:46 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id c12so19014285pfl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xBg7FwtpuNrM9Qka69WV71CAEgxhgNIxD+5d1vNtwIE=;
 b=chONTgwcyINNkIqyT0gWQjptElKjNDNl1jFAT2khqClci19H9q6JNLn53rd5nskHId
 N6nWnxxxsyu4DS+Fj+b5vr8CuC2CzbpJ8UeJgmJzcoBPY3xNwqDJ6ShYuUbO4A2tL04r
 Obe45wRCMNAdvP9hG4loRF/mHIp90DaYYi/MIYXNBn9ds6Q45xrOG7Tv/y9SNTFGxgkY
 G13KtelDBHMXUIMen9xC82DE42u7OI3Btl3gbeAoVojDinXYgg/ROOtm/grcytuuny2G
 qHlx4IstSd2bgvgv511DUyA8yvo/YezMYUhDA8eFWWrchPtmVZROjLMb6+P7VKu5xPww
 8xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xBg7FwtpuNrM9Qka69WV71CAEgxhgNIxD+5d1vNtwIE=;
 b=ANfbgikaePjG/Y75lr17KVWcUrQ2Mvbmowe7LgpGoXobE6AXLzn15sqkKEcRAMXqAt
 ORhPm9SJk0q28vJvL+pV6y+s6X+67tKti5blyzq6qwVQRPF+kSsV2fKJkWHTyYqLyp2p
 QjNhBAy8qzuKfX+mmOcQ6r5mHsKIkUv0pu+ahgfqhBWP+E+SRpuMk0EAMEGi/jqMVSVO
 DIjBNJsReu9p7xdSqplJg5ePk0OeEDuQwHHaApwlF8V7/ZT8ej8RqOv5XsbNMu4fj7wY
 6DgvFOtUuwOd7LvjwwSAjwfJD0n8dUTx4rZiJDkwkI4C1NrJ1qVuHbBYpHASMd6qMmo8
 hIyA==
X-Gm-Message-State: AOAM53250iNildQnxn6UEYor6EoSFG5lbGAWGaQ1Ykauth0lSlwPn3zx
 8Vv9TvBX6FHWWheUaBLIRfJXHM8FECUOig==
X-Google-Smtp-Source: ABdhPJyDbKuljXhh5guEZqpWQcTuPn6aeIxc5WM2ZeW6IPK4Uit4k4igbO9cYUR00SVL2WjDfG9lTw==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id
 x6-20020a6231060000b029025ccd663be1mr829742pfx.29.1623260685755; 
 Wed, 09 Jun 2021 10:44:45 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/31] drm/i915: Stop manually RCU banging in
 reset_stats_ioctl (v2)
Date: Wed,  9 Jun 2021 12:44:00 -0500
Message-Id: <20210609174418.249585-14-jason@jlekstrand.net>
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
index 0ba8506fb966f..61fe6d18d4068 100644
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
index 38ff2fb897443..fed14ffc52437 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1850,19 +1850,13 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
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

