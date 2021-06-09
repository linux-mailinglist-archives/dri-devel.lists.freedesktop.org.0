Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9783A1C29
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14FC6EABB;
	Wed,  9 Jun 2021 17:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040E6EA95
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:48 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id g4so1860862pjk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOIZ7V91fLIl8fTP/re+L3I3ujQ1EjA9kvT8GvYB6UA=;
 b=LSbWp9iSqsMqf1Xy5Pt5nIHopAGs9rby5zCMWNz8TjoWLc7iE9YjnQivpBqJIXk3g2
 IktnTHBqt7hFRSGPj5MzoqDHDYGvwuJSfBgieYbqlbFSWwo5/zkuFnL3u0T7vB8q/1qY
 PC8SeRZ+URgdw5O/edLx1Jb6Zqc+aSY5qFrFSfe7rUmVxcXxMF4BiPOEWk074zAmazry
 HzzmigSr6dy1FujvDPNqqiqvqZrD75wdyEvfqY5THGF4O6LyTq6xacSHlWNciD9FOMkp
 rdAnppgOdvAT3yxAwz/LRea99VMW4iHI8llVWgohrsKZjqdei2oKyWdTPXxcUw8mLp+5
 MTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOIZ7V91fLIl8fTP/re+L3I3ujQ1EjA9kvT8GvYB6UA=;
 b=T8q6yLAr6SdSbHO7YMwp2ihIVrzL5LCyJqkwEWeCW0hgXr18hpgkyxP5cp2t/gMK3k
 hClWz0tLTrSU2lmc1MZoG+fiFbju5Z9pv4Ti8o6yo2RIZbsrXyqiujRi5iOD1nobVjgD
 Y+ljWHXFrFm7Qst2RbeVWzIcZytLQerYjoSsMI1Rvz+WqHYCrnEyaKaVIhSk7w7+lxf2
 4JX8KmdeLvC6quDdQvhKgBi16jw6n5rgtTgXckjPOC8vjb83SP7E1yNDSgq0AOPpx5tp
 78mWp+0W7rivoEa+2yHSf5OSikggOlFRxBNU1KjSRSkpBWFn6OrgaWmltpSmB/uXuLWL
 4dAA==
X-Gm-Message-State: AOAM530DGyIKMjhm2szDE52NOJvVax56YBVbvtxYfXm5spxgeCd3dV27
 dSEJKejcUBXm548APEvcPQiLo1DNCko2Mw==
X-Google-Smtp-Source: ABdhPJyycwiJt8lWUqRW4Q+WojrihpEALSuQGNEBx8OiJMp35nsnU5tHmpbt4tufThF0wGWSF+dUYg==
X-Received: by 2002:a17:90a:bb97:: with SMTP id
 v23mr694152pjr.148.1623260687453; 
 Wed, 09 Jun 2021 10:44:47 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/31] drm/i915/gem: Add a separate validate_priority helper
Date: Wed,  9 Jun 2021 12:44:01 -0500
Message-Id: <20210609174418.249585-15-jason@jlekstrand.net>
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

With the proto-context stuff added later in this series, we end up
having to duplicate set_priority.  This lets us avoid duplicating the
validation logic.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 42 +++++++++++++--------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 61fe6d18d4068..f9a6eac78c0ae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -169,6 +169,28 @@ lookup_user_engine(struct i915_gem_context *ctx,
 	return i915_gem_context_get_engine(ctx, idx);
 }
 
+static int validate_priority(struct drm_i915_private *i915,
+			     const struct drm_i915_gem_context_param *args)
+{
+	s64 priority = args->value;
+
+	if (args->size)
+		return -EINVAL;
+
+	if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PRIORITY))
+		return -ENODEV;
+
+	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
+	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
+		return -EINVAL;
+
+	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
+	    !capable(CAP_SYS_NICE))
+		return -EPERM;
+
+	return 0;
+}
+
 static struct i915_address_space *
 context_get_vm_rcu(struct i915_gem_context *ctx)
 {
@@ -1744,23 +1766,13 @@ static void __apply_priority(struct intel_context *ce, void *arg)
 static int set_priority(struct i915_gem_context *ctx,
 			const struct drm_i915_gem_context_param *args)
 {
-	s64 priority = args->value;
-
-	if (args->size)
-		return -EINVAL;
-
-	if (!(ctx->i915->caps.scheduler & I915_SCHEDULER_CAP_PRIORITY))
-		return -ENODEV;
-
-	if (priority > I915_CONTEXT_MAX_USER_PRIORITY ||
-	    priority < I915_CONTEXT_MIN_USER_PRIORITY)
-		return -EINVAL;
+	int err;
 
-	if (priority > I915_CONTEXT_DEFAULT_PRIORITY &&
-	    !capable(CAP_SYS_NICE))
-		return -EPERM;
+	err = validate_priority(ctx->i915, args);
+	if (err)
+		return err;
 
-	ctx->sched.priority = priority;
+	ctx->sched.priority = args->value;
 	context_apply_all(ctx, __apply_priority, ctx);
 
 	return 0;
-- 
2.31.1

