Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FE3A1C46
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857966EB43;
	Wed,  9 Jun 2021 17:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE6C6EAE2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:45:12 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso1868412pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vd4HrjqLsgBU80FzHWd/G9MkReVAnbCbdgJ5zbQrXI=;
 b=sAe+Pw+UeEgNESthbAfVRT5geT0el/hjkZw0OvmSNTNJxA6JDICGB532I8FQNtiRg4
 u32j/NNQ0KouOK7Cp5EM/HVtJvdbOpp1UZr2ukQaig/D1yveFjn8X7SAz/bMljSGB3rr
 l6x3Ok40LyGwoOTZ21a1cFdyS05shHWJXnjA+VVbgXVcmjrDuacZZXs/0OmjQ4DYY2sX
 7BC3aQVIaFCF88t0DT07auD4FnEeUpIbOZ5mcKJ4nfo03ZHd88WUjZjmDYW6KWtsyciJ
 nx+6Vc6G4NY75ZRDHvAx985bwcqivfaJ8/hqwIt5hKkOlHr0QJGt6a/o9VLB45kbdxjM
 ODWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vd4HrjqLsgBU80FzHWd/G9MkReVAnbCbdgJ5zbQrXI=;
 b=Jru9ogKd9KDknce2ejcCwjxsTzD/gI8g6LQ6RWWfHjNaLG6G/+HcjbL3/MkgTRpEqR
 rErr8rV2bvd0ZYVn3OjofXpRc26TvGLH+dryBMXT9Imzb7IouJH9qJ8+UTBklVlArYT4
 hx9w7aMA59X5rmoBIBH/WGtZ9kfHLN9P0GHBlooPrIA44f5SAo4X/k+sB1ak63mfD6Ol
 Jb5IIZIcwjl+ObCmMaM4Ghq0VllicXt1I86xRPUQhuUzhTyO1wXPtSQrRqsc+ZrM8tu7
 LC87WlPRpIdMnijaLthkzWcis0uK/0+fyLrGMwPKbhPHaTKjZDOg0ndrCd6ht5NBsH0n
 qBAQ==
X-Gm-Message-State: AOAM532sYus3AZH4oKKnIVucIUQjD2irC+3s6o/puuNWNA1m62cZ/TcZ
 eI+qcl46QQ4o5xwY5SGC/ROHg2zD2LqN6Q==
X-Google-Smtp-Source: ABdhPJzzrl9b/v6RU1BneAI7vjr+rq4+l7OiyvSkfsTju0ifBVmWDpDQjIzUVt90VHtu8l8F1ROH9w==
X-Received: by 2002:a17:903:3053:b029:110:d36:af61 with SMTP id
 u19-20020a1709033053b02901100d36af61mr867275pla.5.1623260710937; 
 Wed, 09 Jun 2021 10:45:10 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:45:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 28/31] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Wed,  9 Jun 2021 12:44:15 -0500
Message-Id: <20210609174418.249585-29-jason@jlekstrand.net>
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

