Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0E36F016
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BF26F487;
	Thu, 29 Apr 2021 19:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21136F482
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:04:25 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q10so47812157pgj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dj8ATrkLDKFJ5d9l+0wwim1gFsFJ9J3GyHYy87xeWak=;
 b=InZ5PBUK+0bPGTtuZFAKPQBT5Yl7QPBje6/SxegcTzdlYCLuEBBLBLYCsnl3sNQpDc
 2/sNVxaZ+nBsgl0NxlWyfkGjY+6+VwChbQvSoUAHf/gO6UxX+aFcCYpTrJHVS6hlcocy
 k/G/QvBgLTpXbI/L0ZmASSbAbmHYS0CVpWXf1W+uWKNKC97Tzv5b9JCQiHovlLB88VCp
 RLY2Sg6gPQrHX6DC8qcziAW9ewWyBAfkmn+fBjwCSDKE/xcUaL8USGoSOh7ab2v/V2tb
 O48V1UglfAKXo2EQNVR/DBkFVlsIBT1kgDTFfjBqs7Ct0z/gsMrDqu519v+++oNsnzDQ
 ZncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dj8ATrkLDKFJ5d9l+0wwim1gFsFJ9J3GyHYy87xeWak=;
 b=EvkbPbeECYwoub6Enn12cEpEbdbWXRYNtPisIJysIQjQ3lx6Z0MYFA74ql2V9RzexH
 9VIK/ENZ4JVA8CHhXFXaoau1wQvBvQCiQoWDjfLUGheafnfhDqcMgHQPgJ+nbg7PPbGi
 OyLo5dtIurOgzNkK8EjVPF3OJhVaOqxe1ptBfwELy+1iWJavdYREchRyvCLjHoEkBtXK
 u4LJOqSRVnqnLPUN32q2fd+4ZdLwjnbKGOhJrbAIJCgXSXx5W/xw8u+ljQHCvjYgkzO1
 cIzYIYG6HXM2TPrLtYzvg33GYNQmoZh5TcU33SM3hs2YBYqMl7jfXzeyCIOzII4VlSQ2
 OVaw==
X-Gm-Message-State: AOAM531fo45cnAjqoVaI9/CY2EsXtjCLGIftPLNDqeMT+8h3Bwhu1e0C
 5mL9cH5nst+ufhkgETyc9K2XRQ==
X-Google-Smtp-Source: ABdhPJz5Lz7SwhnIv/QSEGYmWbVdzQu0s4rCFVyfhHlGPAKhgP52hT0hMGKfaoA85J3dFQHy9y58kQ==
X-Received: by 2002:a63:ef4e:: with SMTP id c14mr1167455pgk.166.1619723065481; 
 Thu, 29 Apr 2021 12:04:25 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:04:24 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 24/25] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Thu, 29 Apr 2021 14:03:39 -0500
Message-Id: <20210429190340.1555632-25-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to delete __assign_ppgtt and, generally, stop setting the VM
after context creation.  This is the one place I could find in the
selftests where we set a VM after the fact.

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
