Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE22369CAD
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDDC6ECBD;
	Fri, 23 Apr 2021 22:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D4A6ECB9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:31:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id n10so14765089plc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XTu+H9zB8MIki5UDa2EWwWTVhsNK8xzF67z3mMD0tQ=;
 b=v5zA9mYzuQrLbD/5SZFh2p567kAnbB5h/gnAWSH/SspXNyUP2I7RgC0m1RtwuuCwOJ
 YcIlcsFKWzt40nVCEbwCM3TOWFWCDvKRULCbIPwrx+gop/w8KlDWmcL4Cm49SAAdzp4z
 xrjylxBMnEyBHAiyf3QhwrNdqupO+ilLw8hTA07syxpbIxvV8fpEKjaYRPOK5aT8vgqk
 bn0rmYJ8wMTS0k4Y1Pb+H2ZdM9YkiBh8tX5aE3E2JsTb4lkWI0oGKV0deGKiHtH0scSD
 0Nixaa+tm6Qtr1rCIg3cptoMJx/QnfbnT5gAzHl3pe9dN+FJXm5i+9dk9q2ETqFATJbX
 6itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XTu+H9zB8MIki5UDa2EWwWTVhsNK8xzF67z3mMD0tQ=;
 b=pgueuLbClsEZGDl+h99tKD6XIDpAfr14q475f8nMBIhNcHJV9V3uw4yiiUYfiZ5AgT
 GLBKflVtDYPGYYyaywezvP/pp0xLk2x5h4sptCgaI+p9fTuj9XMm4tVkkx0PtPORklXb
 LbH5ejf0slNJkGlJeBdf1OhrmQF+x4Yf+0ZnSKIIWeJJBASiDJAZ8K4icV6ih1y+50it
 5yB0rdZS5gtU2MzVwN+qxhF7IKDfRkslrcneTkfUEpvxyGp6UlNYIT/G0B6sFHFXNSEP
 jXMnsVVaVdpLZwThjNDW9fH6KORVyN4uvl+PTpxoJ9rxGfrXDCpR87uZdolvHOB2+5GE
 t2dw==
X-Gm-Message-State: AOAM532ZSX6SHKQ2Q7pxs7ajwSrRyuBeCvq5a5drGfp+f0Cf2h+vmzgl
 wJEFBLypL9a7UkXxV7ALx8O5BQ==
X-Google-Smtp-Source: ABdhPJy9xhyAnqxobTJj6LSbHbriPb6heFeb6aqoWgkgcxJ4ox2xklDhoEKKfUKQnrSmMc97/YToCQ==
X-Received: by 2002:a17:90a:1747:: with SMTP id
 7mr6610522pjm.109.1619217115708; 
 Fri, 23 Apr 2021 15:31:55 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:31:55 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/21] drm/i915/gem: Add a separate validate_priority helper
Date: Fri, 23 Apr 2021 17:31:22 -0500
Message-Id: <20210423223131.879208-13-jason@jlekstrand.net>
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 42 +++++++++++++--------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 941fbf78267b4..e5efd22c89ba2 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
