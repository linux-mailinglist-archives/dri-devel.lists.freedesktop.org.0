Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEEC3A1C44
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600F06EB3E;
	Wed,  9 Jun 2021 17:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90CF6EAD7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:45:01 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id k15so18979134pfp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFfLZHsHxAONBrQmaDYWtQz+eURjIXl9kn+dXwL/ujs=;
 b=LyaQ+BTyLRo0otq1qTwon/XIjXczcjY8O/6u+wMNcnVXAMIkYLXWGL7eXM7SW9GRX0
 eEjapfsELFK9vUlveI8gdS49+8JCfRbn2nXKm3RYKK2Eud2ew+pEwnA6d33Y/3fTj+9D
 AQQ9U8gJmeXDlV3Yo77UH1dPrqrhxR0iz4Vik1uT9t0iSLwZiPkL6LWGTHdxaDfRioXN
 ewwwAoStGewwTkux8Q4ojmXezaogChIdxVzkZZikwiZp61pYNBIjzxLcCqiYJfiJzXZw
 64vBIiGAyRvXTUVjQ4VPE1iCDu3juPkASPn/j8FnkXZsbgMndEFMj+kpbkgr52XerpIC
 3UsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFfLZHsHxAONBrQmaDYWtQz+eURjIXl9kn+dXwL/ujs=;
 b=oPly4S2vkBJTjduAVptUdbjjpPaykEKywe4K+bElZllo5WsDRaSdw9jXtQTv6aHSO8
 SMrzz90JhxjScinLDnyr9ejpCk7S9SzeKIZU4h8X3o3qEyiXylArjYWykacHkF3+GhC3
 dROi4i0qHLscVK2a9Z/XLmBUcVWzW7FunECwXV/KMnpHwO1/0bIU0Ch4a1IJxjdm6bVG
 Kysvk7/hw2qF9oG2omw1di5ZJ67tmkq4B3ZfdB15iSNeiUbrBGfIThOZNgNlaxk0xBk4
 3CSpqiw5PvsECXzDo0M8l8bPr6uyL/DQDw3//gcjkzvcXvrQnT6HFGI+3bb5/mU/3j1z
 jSdA==
X-Gm-Message-State: AOAM531ZMzjOUfCCltfP6tFChAxCo2oFvsBWukDmIUGxZnKk6AJ4qcFo
 j09JW7518QxKkjsLwEDg6oLY+geFzjh78g==
X-Google-Smtp-Source: ABdhPJy3A/CDFbDPuquAqfcj+VH2wKjrt9lIsFwrbrc8V6bkLrgjEpJiEApigrLHa0WMSvAOJtowRA==
X-Received: by 2002:a63:ce4f:: with SMTP id r15mr782043pgi.387.1623260700828; 
 Wed, 09 Jun 2021 10:45:00 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:45:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 22/31] drm/i915/gem: Return an error ptr from context_lookup
Date: Wed,  9 Jun 2021 12:44:09 -0500
Message-Id: <20210609174418.249585-23-jason@jlekstrand.net>
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

We're about to start doing lazy context creation which means contexts
get created in i915_gem_context_lookup and we may start having more
errors than -ENOENT.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c    | 12 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  4 ++--
 drivers/gpu/drm/i915/i915_drv.h                |  2 +-
 drivers/gpu/drm/i915/i915_perf.c               |  4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 4972b8c91d942..7045e3afa7113 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2636,8 +2636,8 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	int ret = 0;
 
 	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
-	if (!ctx)
-		return -ENOENT;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	switch (args->param) {
 	case I915_CONTEXT_PARAM_GTT_SIZE:
@@ -2705,8 +2705,8 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
 	int ret;
 
 	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
-	if (!ctx)
-		return -ENOENT;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ret = ctx_setparam(file_priv, ctx, args);
 
@@ -2725,8 +2725,8 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	ctx = i915_gem_context_lookup(file->driver_priv, args->ctx_id);
-	if (!ctx)
-		return -ENOENT;
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	/*
 	 * We opt for unserialised reads here. This may result in tearing
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 720487ad6a5a4..4b4d3de61a157 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -739,8 +739,8 @@ static int eb_select_context(struct i915_execbuffer *eb)
 	struct i915_gem_context *ctx;
 
 	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->rsvd1);
-	if (unlikely(!ctx))
-		return -ENOENT;
+	if (unlikely(IS_ERR(ctx)))
+		return PTR_ERR(ctx);
 
 	eb->gem_context = ctx;
 	if (rcu_access_pointer(ctx->vm))
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index b191946229746..6aa91b795784c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1861,7 +1861,7 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 		ctx = NULL;
 	rcu_read_unlock();
 
-	return ctx;
+	return ctx ? ctx : ERR_PTR(-ENOENT);
 }
 
 static inline struct i915_address_space *
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index 9f94914958c39..b4ec114a4698b 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -3414,10 +3414,10 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
 		struct drm_i915_file_private *file_priv = file->driver_priv;
 
 		specific_ctx = i915_gem_context_lookup(file_priv, ctx_handle);
-		if (!specific_ctx) {
+		if (IS_ERR(specific_ctx)) {
 			DRM_DEBUG("Failed to look up context with ID %u for opening perf stream\n",
 				  ctx_handle);
-			ret = -ENOENT;
+			ret = PTR_ERR(specific_ctx);
 			goto err;
 		}
 	}
-- 
2.31.1

