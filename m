Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9505636EFFD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E266F46F;
	Thu, 29 Apr 2021 19:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828BE6F46A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:04:09 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id md17so7727059pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rxa+dxuuKkWcn1ApSBM6WPTFN6yU9A6RHDJyeGGj8Pc=;
 b=i9IHjaayGO9zY6h9oU8mJm1Ua3iWKv6k6pBV6PnflyosmdONviQYkyYRPe7UGJZJX5
 f5Xp2ee9OptqrEKNAz3vYVNTUqPiXqVGhcS9R/KivnytN/qMSHqFyBU+WLuVxARzkV7H
 hZCD4OGBYz55WTS3hAbb0k9y81CZbD5S5ludehR41vbmZdkt1M4X6ceYgm+pcMwr7pEg
 ZRUqZy1xvRmFI8bQ+mp1Ku3EETKYtJaitG6YAYl47OH/2aP6P+kxJwJmSKU3nQWtMqtg
 opWPGvkQa0A5oBp/NlGRE2dI6X1GBsY28+H8o/dz9qOM8mIDKb3cMAqi7l3vgJOCDir6
 bzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rxa+dxuuKkWcn1ApSBM6WPTFN6yU9A6RHDJyeGGj8Pc=;
 b=MYC2Zopuf252SGXQAO/dTPR/H3SmMM2FLIJjYfsSNNuAWZWUyvEO1oIpN/MGBBtLOH
 xuvfo1QiUbIjtEJXQBp/E2hhJ+vzZK/N6yl4gP3s07/lXr3GW1R9HlSswkpMhC1kWI0y
 gUtKkFocz9MxtVE1tTbi0VMpWWuRTDcDO04lHJ0mK/ZP2D6FPNr5a39seO7inRwOJaPO
 SU4nYFKnXiglDcdJurG85FMUa3jw6lgmlCe5rzWwO/RkbwAeselpa6C3kUi0w2bG0UO9
 4lsMQ9N5xkJpIVhMTt+8Caj6MW6GCjfCRcHrUQVtc9g7GUfOvFp/IAuEnkz6IaC5P2Ff
 2I/A==
X-Gm-Message-State: AOAM532TmDcKjUwy8/unOxUgC36wkkPMhEkFVt+OBnYRbNx/TfMPuSq0
 GiSz7VcxFYeih26IyzQ9bssEiA==
X-Google-Smtp-Source: ABdhPJwPHDmutPwi+CXaK+myIg4lNL2d3yvcSpbjw25bML8/jFC0cvsKhSZ9N0Y8Ov/q2yNjHKQruw==
X-Received: by 2002:a17:903:3106:b029:e9:15e8:250e with SMTP id
 w6-20020a1709033106b02900e915e8250emr1097401plc.33.1619723049007; 
 Thu, 29 Apr 2021 12:04:09 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:04:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 14/25] drm/i915/gem: Add a separate validate_priority helper
Date: Thu, 29 Apr 2021 14:03:29 -0500
Message-Id: <20210429190340.1555632-15-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429190340.1555632-1-jason@jlekstrand.net>
References: <20210429190340.1555632-1-jason@jlekstrand.net>
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

With the proto-context stuff added later in this series, we end up
having to duplicate set_priority.  This lets us avoid duplicating the
validation logic.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 42 +++++++++++++--------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c073d5939482b..4835991898ac9 100644
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
@@ -1745,23 +1767,13 @@ static void __apply_priority(struct intel_context *ce, void *arg)
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
