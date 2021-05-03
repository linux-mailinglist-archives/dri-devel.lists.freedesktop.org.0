Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87293718AC
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB306E8E8;
	Mon,  3 May 2021 15:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49D66E8F4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:17 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id t4so2278594plc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsllfSQGOYUIVLhl3Co0QJ3iUTIL9mD5TCD1jQqxlak=;
 b=TI4SKKXpotNRyp5HMBe7j9G8rKE0U+1J1X8N6CUtQXFNBXEaPjrPi6ld7WxC5HZbzK
 VvPaRsXLlQ9FJ/qlXgZ/FIXRzucyXI4yoJVfgkwaubXyWQfQx7aNi8Da7rYk4ySwlkIF
 /oRYl0e7NhzUa4aaasAnQN/cFrkalZejGFOoeH7SFZjCN85EBhEQGoo3GCrctNxdTjI6
 29GO7qsDjzJH7DpvE4sZvYUZOL6B1fRIM3eC4LzERyTTsCqd/IctMmwWYNBiWtnwk61Y
 fvYm0NiwZnstbI+F6Z4zSdrxMFuoxLjeK3L/1cSRD8exR5/Cm9oOy1U3AIskNtpMP+u9
 IKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsllfSQGOYUIVLhl3Co0QJ3iUTIL9mD5TCD1jQqxlak=;
 b=HFpp0ASeXr0Zf7nw/Z/V3uCDDKbpS662qFJpTbLd+QMfm7PpjqzcPgtU02t8TwJDGx
 GzahpK4SffA9pNhYWwxed3XA3Pe4en32rgdQDZmIzHZxpE/UJIdYbXIVFhxdiWl3NmIh
 owlnUAnWi5280bYjS1MT8zuwqDCksXvAPnTztwLyh6AE1JouCBUQNMnLcPm0hhmFJcMm
 h76eF0Iw4HxCNg4itoofYFtYZqXMp7iFWPsLFZRTr3c7iFX/uDtnjM2zXaHMrsCAP3hX
 XOYgOz3QwP8ya/oOzyX3kbkII0+a/Lq8jJuEQqyIf4zA/eoGlCpaxdXVr+fk/qvK0mvw
 TK5A==
X-Gm-Message-State: AOAM530fAbqrGv6n/2UUChddqlweIbizktebHBYO3bED4MPR+PE6beLc
 x5ZPHNwnIk+RKnkfAcCgH9qpJg==
X-Google-Smtp-Source: ABdhPJwdujVadQWeYf+4f1AOGcoPLCqkbkpmgKX948mlWxnOMj2tq8yWEphQufRJxtflidJWgKNACw==
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id
 p14-20020a170903248eb02900ecb3997d75mr20953026plw.35.1620057497413; 
 Mon, 03 May 2021 08:58:17 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/27] drm/i915: Stop manually RCU banging in
 reset_stats_ioctl (v2)
Date: Mon,  3 May 2021 10:57:34 -0500
Message-Id: <20210503155748.1961781-14-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
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
index 8e254d83d65f2..c073d5939482b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2091,16 +2091,13 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
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
@@ -2117,10 +2114,8 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
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
