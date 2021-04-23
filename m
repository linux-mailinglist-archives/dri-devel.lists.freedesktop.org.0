Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39D369CB1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025726ECBF;
	Fri, 23 Apr 2021 22:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD356ECB9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:31:54 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id p17so15307plf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13DnoKDWkSobLJzv/ARA477Rvk8C8MR6SkUVUxbVnEM=;
 b=Xm2lbgt2nxHyUVYu6RypjoqBhhQF9AzJuVkZ9r9A/MyWRYCAlXVHSEwlJ3HuvnaH6l
 x85PPmO6EzQ5bV3mH/YMA5oqI42NliS0O1CKubQGMUIK4wT7S4vw9ba5zDwstVlcoNqQ
 wDI95hCNL4ci4kDRd03OpOK/9ivp1Jd520iP6Mm2rZkSCgAKPI+Vki5eZHGg5TDrH2ed
 m7EY1e6E3WQdnkHLu38jyHWjZVZMiy1mnLgneY/38bPTfjRHtDpEaFhfVwfbkUbqf+6X
 t22AscqG8xIi9d3nSOLqOzMHb07x2UG5JpnEkDaf5oMqsKciQUrmeRUCOCo7a/GG8tuG
 9qDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13DnoKDWkSobLJzv/ARA477Rvk8C8MR6SkUVUxbVnEM=;
 b=FPp43E74ysiciVLdU0WOyXpcE9OvewOUAVsvyNdUdnncEMJaZsmrpRmoNIuAWbcfjX
 eooBliDvw/DQnnvi+Svh1qIlSQtvbjKUbuepClqqdzRPEljeTP4g614/xZ0iTPWQlEUf
 ER/iXU3RyVpmUeq+i1GTHiOZnkEIEQa4+opajHRSEZUIhNjFUJfyFzoj8MB2aWQr5sab
 6mLlZXQQR3FjVa/QKytIMOjYl1fpT/vVQtDMLcRSMX4g6j2v3EE9OpRQ3LS+dlu64gxB
 ua2CqYMALeu0P9TYIX+3HkVbMdBUX1a3zgoZFkeGUZumgRlit5BZHL2gyanshlrSPzJz
 NTjA==
X-Gm-Message-State: AOAM532FgsKIcub7BzFO0O+gS/01YkfEEmrm18GcTwoclkKH2S4fwurk
 B8sDKz4E0jSb2lBWF0jiC4sYJA==
X-Google-Smtp-Source: ABdhPJyzr9UOYiWFTLYHSWGBXpEIQ7ieBpZ45k5ALU6sIN82fjJPW4oA8ZC9SIRJQGEJdYtDcr8L4A==
X-Received: by 2002:a17:90b:344f:: with SMTP id
 lj15mr8244205pjb.211.1619217114184; 
 Fri, 23 Apr 2021 15:31:54 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:31:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/21] drm/i915: Stop manually RCU banging in reset_stats_ioctl
Date: Fri, 23 Apr 2021 17:31:21 -0500
Message-Id: <20210423223131.879208-12-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423223131.879208-1-jason@jlekstrand.net>
References: <20210423223131.879208-1-jason@jlekstrand.net>
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As far as I can tell, the only real reason for this is to avoid taking a
reference to the i915_gem_context.  The cost of those two atomics
probably pales in comparison to the cost of the ioctl itself so we're
really not buying ourselves anything here.  We're about to make context
lookup a tiny bit more complicated, so let's get rid of the one hand-
rolled case.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 13 ++++---------
 drivers/gpu/drm/i915/i915_drv.h             |  8 +-------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ecb3bf5369857..941fbf78267b4 100644
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
index 0b44333eb7033..8571c5c1509a7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1840,19 +1840,13 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
