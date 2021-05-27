Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D982D3933F4
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E571D6F471;
	Thu, 27 May 2021 16:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC41E6F461
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:26 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 6so324944pgk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pveZpzFVhe5RqW0kFy8DeYSsSMrCR/Hjz5a6eZIl1yw=;
 b=cxyYFDrIiybyKLNpmkjlLhXa7tLa+Fzd1vUBJztifjs7wc87wcGDqU9rWcksvwXuOl
 X40ZlLwwk+StGOh1RfwO9pTAYcW1R1rkrk/AsxYEtqtpNHWFugwbJ5VMWtb6rIHEpCZQ
 CLw5BN1hVTJJJY81v7j5xvhlbv415d5mJ0/rd0NVw0FC7pL5wMK2TIKGueNBVBlLo1m4
 lfhRDQWB2ilnLj4zLslfgjzM9+m8b2poVRbRMV4JN46Eqw6wsX8hYhQ+zxtu+rrTzEqt
 cEIoMgZyPGAryWNqLyzp8n2OqEbHm8Mi28d1xTFiP5c5jz7Amg3/Tm+0WEc+cTnCg0Nm
 nRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pveZpzFVhe5RqW0kFy8DeYSsSMrCR/Hjz5a6eZIl1yw=;
 b=HJdcs6e4LbGSOWX3YeNPnHgXpyYXyxFTzmFETOekNHpfF/5uPuvJ83lQC21wnPieMu
 /hb0nQgyqIbrvMgXonBUjkGNcAjr6/YCniwazlxwb2ka2Fgbv/ocOhRMMhctxgIw9rkV
 OEwEG4mUWxYeCGnGAFRlyNiyS1LnL8yvRg/MxWk0S2onAXfcBnUxK9lcHkuArsyeJtEE
 pOt+oA6/cXQrul7uQeeT4Yi2YBTQu5VOX5J7TJ96Go27HMf8Tmv71C5SD++s98AcK579
 VwB8WDAvSIO2sv56ZUvwa4zpKtR2UBi46xN4Ed/aP0SJKfJze7oLOD8pEsb8ySpr0Fni
 PdXA==
X-Gm-Message-State: AOAM5301Ssxs9EmD75P1ZriDDQqVKMoVggl1AL+vJy+iWfs6+DKfKYgf
 2rJuG+EwmpuS3hvMQqTsmojgKg==
X-Google-Smtp-Source: ABdhPJz6TyflKiPzY0tGJll+K+NDwN4XCjWyAoTWNxosZLwNVEe4foJvrusduoSpjQnp8vgJv8PQZA==
X-Received: by 2002:a63:4d52:: with SMTP id n18mr4379889pgl.147.1622132846203; 
 Thu, 27 May 2021 09:27:26 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:25 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/29] drm/i915/gem: Return an error ptr from context_lookup
Date: Thu, 27 May 2021 11:26:43 -0500
Message-Id: <20210527162650.1182544-23-jason@jlekstrand.net>
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
index d68c111bc824a..76662175e6980 100644
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
index 7024adcd5cf15..de14b26f3b2d5 100644
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
index fee2342219da1..d7bd732ceacfc 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1868,7 +1868,7 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
 		ctx = NULL;
 	rcu_read_unlock();
 
-	return ctx;
+	return ctx ? ctx : ERR_PTR(-ENOENT);
 }
 
 static inline struct i915_address_space *
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index de8ebc34af0ff..dfc2a5c067c29 100644
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

