Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C903933DA
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC696F462;
	Thu, 27 May 2021 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1F36F44E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d78so964049pfd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TK4FihYD/bFaks2c0ZkDPRqLyQ9AlVBUtOrrLt1XV8=;
 b=LllSI5nKzVlUbfPC740JIV5Pf9J7HeB9zDEIlnkH0tu3mbfK0H8WhK4XEv8QGlLsYj
 KS6IhX/MoCHs29MN4fSFE96ZM0hHV+ddrspzZcMxQy/XlHMdXVFr6TWtfgF/E+mHqzR+
 M9/oTbKHIqXq9r/m8guov8+KMylrRrzP7qLYRQ3+PMPKg8z/M7zmY6kZizWOVSt2hakO
 BdgAwvpwwqFkuqxB2CRI2USuLFgDftiFW06zLyQ3wNe0OZEzDlinGWT1bI7Ujt1jC8YH
 9qXDha7DG7CM/Dfp1Mp81uo5WXzc8bqGf/KXUiLFMpiewxRLUWst9nbYX0vFQggTBzSR
 prKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TK4FihYD/bFaks2c0ZkDPRqLyQ9AlVBUtOrrLt1XV8=;
 b=hTStz4uioE74AV3Qhm+yKl+KS7LqNZF8M/lUSjwDVglJNTzeMWuYs0L4I6u9Qk+CzN
 6z823KeAzerCzGxr0t53USkRbI0faGYlHkJ2f8xC9q81HzpfN6/elqJcwb9eWtqga0VK
 kImr1tfBrf3+erf4MsvoaX2W/JAFs6hfTZEFbGOBKwIFglqWQPOsEqHpLXr9HtRtKGvG
 N/oFLbrh0jhWvSOVboWcS7dqOzPrEgH9327dnYiXAoo5MlLre+q9A6d1f8kz71nBD54u
 nGGi4KBHkS2sK/qj+8vu3wHOEPp77rWCQrNj5HysjC0dPkx/9E4hu0vxhuXOxIcOj7pj
 y/fw==
X-Gm-Message-State: AOAM5319IU4CgtuuhPMooPH67pM43JIBcoDzk7CZ87LXC0iP80HjWNPj
 3puvNxH8T8HHG9MS2MnMsbiABg==
X-Google-Smtp-Source: ABdhPJwCOoyBMMLcHxk2bSCYUwj57VOEpTXu9r/t9NEcEKIuzQDHtP23fgG7MjeyQAV9c/nQGtpWjA==
X-Received: by 2002:a63:fa03:: with SMTP id y3mr4398200pgh.389.1622132835655; 
 Thu, 27 May 2021 09:27:15 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:15 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/29] drm/i915/gem: Add a separate validate_priority helper
Date: Thu, 27 May 2021 11:26:35 -0500
Message-Id: <20210527162650.1182544-15-jason@jlekstrand.net>
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

With the proto-context stuff added later in this series, we end up
having to duplicate set_priority.  This lets us avoid duplicating the
validation logic.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 42 +++++++++++++--------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 910d31cb043e9..fc471243aa769 100644
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

