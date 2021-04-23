Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAC369CC1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 00:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC56ECC9;
	Fri, 23 Apr 2021 22:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBF66ECC9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 22:32:08 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2035539pjs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 15:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kn5CsDMNBpi2mH91srGw+Zwyr/xxCRDKXBAWrlIT+Us=;
 b=BzDy6Ra72qeVbMZ09gq68LWV7+Uy/mTXyHGqUAk7GyfKggaOTTvojOTIIwBl4n9YIk
 HaWEJR/s2T75+MbQTovpcB8a6caoYtCqLb7wHt89lGkaMP5gldCQIK45BoBZ/lXk0sjM
 bW5LmcwGzk1tXRpW3KnCR/bBrUpCg3ymOt4445v6pJbzLj1skb2WZ5+Qmjmyh138vc/d
 GSp8Zuxpc3GMzPJgE/Jv9jVhtxlS8YuKdFfQAOSW6qNxy1c3FiWbOsqQjDWoSPy4AYSo
 YbwfYOUir6Lcetk4E5VRWodvd6dBVlwzpNnGVv0v6yVRvCYO9O2HExLW3x02kq2lN1NS
 NovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kn5CsDMNBpi2mH91srGw+Zwyr/xxCRDKXBAWrlIT+Us=;
 b=DkeAv4jufyi1vYMoOyjjCh21hQk23IuDYpb25TOQS7DNZA9qYfxFcwIJOk6pwr9d+K
 uRBc6+fvnfecD6yUhLa6bnckbFrVXpN5ZPiVw/xQ7lZLPK7yqCZ8Z6eVFJiBO7c0+y4q
 zQBNB2tJbWX3BPOKWozYRPYTEUl6KKLyqCii8LmLI9vR9YgmCL4MFZnWo/OcLmmzY4xl
 5lfDS6eeaE+fZJKx6GHUCr6xMK29XxEQ3i+nVrVMhUup7wKwqufOUHqJM4LhvnUfSx/9
 lpt1/ecEG7NEN4eSYR9oGx4O+TBqbeQzFywpUUCvxBTxf7qjseQ/JFGgRa1+DLGds7WO
 PIkA==
X-Gm-Message-State: AOAM530ai06+GV5XikpfsA9Vlmrkdb00cvNx2UyTAns93y2xoq1EdG8Y
 xATxIwtgvExi96d/d/isBSPPu8sgblGeLQ==
X-Google-Smtp-Source: ABdhPJwfPvj3mJPj2e7va2kYOPh3RmjX3omFjuZNHTxxJ3AurcU1UCwyl36Iqm2kTlUl1UdfKZRumA==
X-Received: by 2002:a17:90a:db15:: with SMTP id
 g21mr6656186pjv.113.1619217128091; 
 Fri, 23 Apr 2021 15:32:08 -0700 (PDT)
Received: from omlet.com ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id z12sm5523420pfn.195.2021.04.23.15.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 15:32:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/21] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Fri, 23 Apr 2021 17:31:30 -0500
Message-Id: <20210423223131.879208-21-jason@jlekstrand.net>
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
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 76029d7143f6c..76dd5cfe11b3c 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -813,16 +813,12 @@ static int igt_shared_ctx_exec(void *arg)
 			struct i915_gem_context *ctx;
 			struct intel_context *ce;
 
-			ctx = kernel_context(i915, NULL);
+			ctx = kernel_context(i915, ctx_vm(parent));
 			if (IS_ERR(ctx)) {
 				err = PTR_ERR(ctx);
 				goto out_test;
 			}
 
-			mutex_lock(&ctx->mutex);
-			__assign_ppgtt(ctx, ctx_vm(parent));
-			mutex_unlock(&ctx->mutex);
-
 			ce = i915_gem_context_get_engine(ctx, engine->legacy_idx);
 			GEM_BUG_ON(IS_ERR(ce));
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
