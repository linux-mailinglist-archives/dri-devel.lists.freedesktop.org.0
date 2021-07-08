Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C23C1668
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891C76E907;
	Thu,  8 Jul 2021 15:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC666E900
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:55 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id l26so8306598oic.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOIZ7V91fLIl8fTP/re+L3I3ujQ1EjA9kvT8GvYB6UA=;
 b=OoWoaoHcaEwkTMQb7hHufzmnLVSGpGL+jLHQWJ+9pWdzJa+k9R9yunTNDpJq4SdigR
 iOwz+0K2UTf8MC3C2JNL/HYtsic40XtKwnmeolQDEwgBrr61NUdeAlss+41NN4PA3tbQ
 lJl/Z4dtzwX8N9WEDQctDyuOF4C2eYnJu+nvuS20PBYo/r7bF/q27Ndq72KMyIakn24l
 n2YNdSHlrHWb+trE/4NtvK9Iloc9Yo5RMGxtAMnC7yQWerQ1/WINCORL9RQ8DtBvojeN
 +GZ8nw4FlvnaAV7Mo4lLXPLrrV3TNSPlG3JD65Ur8Nq92Lm6hn1CTR5zGlp0EoplpDaf
 +v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOIZ7V91fLIl8fTP/re+L3I3ujQ1EjA9kvT8GvYB6UA=;
 b=XSmXoRzUaGiqmAsZZMcBB36/REXI3wfXRW1IbJHXfkTTMk5vSlCEUFd89EmtdOr3m6
 bZ7NJ6gvBa/igiVOKs/ffdOPf7KJxZCe/UFOA7rJgboEkTxx78uMqy95K/795H0epuaw
 FZkEVZOwkPlLmfsscFQC1FBeOgihYhwEkUzbHdylfQ2OYNSlbsbb/fjuArIhL7i+JMs0
 s3VB8MWgV8yuA0e6UVEdNoR5Onm+U2RGQCPF2v/QEpzRVJyNfWULFlm3FjIY/ypsSN/O
 crfOkIEy2Q0Zr0jr8lL1g+Lvf76tyE6xZheUOybIW3TaK+5BbGI6zitB8jmNYT6PxEE2
 +fjA==
X-Gm-Message-State: AOAM530QyUBbat7YGP2UKtNvA7Hp7n71xsci37CqjFHhgqHqnFLqZUz1
 P+qPkn0Nu5PvQtgV/L257Ldf6w==
X-Google-Smtp-Source: ABdhPJwSHj5H3ZyeFNxiBt7T2O4YVejum3NLubYEWtfyAPwWC5VOJqBxQwAacLl7bU7UEmHMAdJm5g==
X-Received: by 2002:aca:c041:: with SMTP id q62mr4188414oif.158.1625759334912; 
 Thu, 08 Jul 2021 08:48:54 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/30] drm/i915/gem: Add a separate validate_priority helper
Date: Thu,  8 Jul 2021 10:48:19 -0500
Message-Id: <20210708154835.528166-15-jason@jlekstrand.net>
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

