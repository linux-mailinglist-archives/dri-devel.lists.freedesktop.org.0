Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88A3C1665
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4B6E900;
	Thu,  8 Jul 2021 15:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9234F6E8FE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:54 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b2so8301770oiy.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/SlZXLav3hqcYqv/ySEG20d32p+2hDGPheY2ExjlNf4=;
 b=1pAcsLkhXRXhScwDD0nenjQhho5AmeC+MBowvX1gPCkcNLVqqz03vpK4tSCXro8/35
 +KOXh3JgyyA5fKAXm+VaXWMukRDKs+xr3bqglw5Mju9JGI3q9eO9nNUIudIdKt5VrtgO
 CeerkUlmSToDTyz2AI0xCsI50VoT4mAKPvgbkndCBvTQ8pKlJu18oZ6LdoXQa7f56SYO
 vMPggD1Hs/nbXdCMkD9y2/jQ0iZKWRCMQObOrh4Q1WOwnKo3dcCJBcTMQVNir/0RqmWJ
 j4XmqcjzLwjEejTescZ+uZ5n33CTXGq/F8Y1dgfwrcIbaFo2hBD7pQzFnROuGILe5DX3
 lCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SlZXLav3hqcYqv/ySEG20d32p+2hDGPheY2ExjlNf4=;
 b=L91+nAu3ia+gyn710lLCoKykUZPr5K84Zl4jAfaN5C6r+GnnTqvvX5buMYCRNyswsA
 VQH6b/Ut5GU4UvwULAr/T+s5xTx2TduLxAe1eWzUcPKokMk52Apdv4iu56KE8XKp5bL/
 E8M9zSf5cxvtqGbYsuBHb0tvvmCSecyiliMnQd+03Ti4nV9ds0C+D9qdz5ZcWfmzk7MV
 KNEppR0+Ry34g9vo1tkidAYdv3iR/D6SK7B7yiqdVW6EO7+4V9Z6lVHEXVNzTIotAfKh
 92d06pDPNDOxXwe721kFsA/fEqDH8ih5u6UsMPavENBFjRkz1sO96wLRf9wg+LpBz5Ye
 UV1Q==
X-Gm-Message-State: AOAM530rfQ6/FfaJuSDfP99vX0dl7Np6YlaOZ5j4F5BxMz4MNe3rHGYO
 pq/rigTRPvAKI6pMdjzm1qm7gA==
X-Google-Smtp-Source: ABdhPJzyQmfME56tdtQ36NWGhHqCDBB1Hnl68Ylh8OxZFkq2DlH4bwyDJZt+G3mgbdWhbKShpWIzeA==
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr3942542oiv.112.1625759333808; 
 Thu, 08 Jul 2021 08:48:53 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/30] drm/i915: Stop manually RCU banging in
 reset_stats_ioctl (v2)
Date: Thu,  8 Jul 2021 10:48:18 -0500
Message-Id: <20210708154835.528166-14-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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
index 6dff4ca012419..ae45ea7b26997 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1853,19 +1853,13 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
 
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

