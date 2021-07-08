Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7FD3C1686
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB816E92E;
	Thu,  8 Jul 2021 15:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F1D6E91C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:49:13 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 w8-20020a0568304108b02904b3da3d49e5so2258184ott.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vd4HrjqLsgBU80FzHWd/G9MkReVAnbCbdgJ5zbQrXI=;
 b=KHMaVHJFsqlerhxGcEOQ260wBc0HW4iyezQtYPbhXDBpPPKEcoCghLIW3JWlqFKeiv
 6vzGUoX9UClKIrB8V1nInuL+CG+TdjcmNUCAE70ClCgYflm6aWmWqPSyNQEh5IwrKwKT
 f4MQDuqscRi7Xn3/FXRQluDW49h9UPcoyoDj4sseYs6vMU2rJIIdXXwfUXihzx3s/QxG
 B5nbRR+zuiTdD4Gxs9Bbt27MidEctOKtWKUNUe6+JjGD/yJM+G89b0HM6qqTQ4EkzsMV
 Yk0IS19TRKf7SIHArKJXZnXdzmqxTfVRsyEusKiBaTfOagHl22fNlALl3yDZV1bljEWM
 Ygtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vd4HrjqLsgBU80FzHWd/G9MkReVAnbCbdgJ5zbQrXI=;
 b=CWYhPQgMMDn3Ik6vOrlwaARKLrB/171li/pgpiOeDh3b3jgPL5fnCFavP9eg9F+1oX
 R0k64Jw59mTcpTsr9Cw2eVCv5dFMCZffKEkEtc48chLdz8I8emHoajtScmYcGFoiDoLB
 yyi2fLjdtU3jCW2yi/VKocoa7yzvxNcsUTyepJLMVqpSPcbBQUE1Mp/PiFUto/Pst+pH
 opsbrVkx2CcMg4WNk6bQGJOc8EuLD5XK/dgvx0Gut8E8/4C1pNno7B2oM/Gya+fnIgi0
 7nRyfksL4KywWNVxEeaJ0yVXjyQhOf5shCaFVhVgFEMgjcorMSKjXWVHZLM2Zlw+5qH2
 AQLw==
X-Gm-Message-State: AOAM531f5cnkPY3SF8peK/o2B6sMKmExLsf6t16ljt+TvQThH/0jzPYG
 6EZaHBsUCkc0PZymY+dQkxeOPQ==
X-Google-Smtp-Source: ABdhPJy6MvlJ8xnEHPahCSudSnqvhxs9A1wJfg+j/wTJ64Yvtc6FsWA7Og/vE17oHib/mtlW8BSY7w==
X-Received: by 2002:a9d:262:: with SMTP id 89mr11805747otb.31.1625759353060;
 Thu, 08 Jul 2021 08:49:13 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:49:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/30] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Thu,  8 Jul 2021 10:48:33 -0500
Message-Id: <20210708154835.528166-29-jason@jlekstrand.net>
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

We want to delete __assign_ppgtt and, generally, stop setting the VM
after context creation.  This is the one place I could find in the
selftests where we set a VM after the fact.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 3e59746afdc82..8eb5050f8cb3e 100644
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

