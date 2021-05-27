Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51893933F5
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1D6F477;
	Thu, 27 May 2021 16:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070406F464
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:35 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so2700402pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7emU7YPiOIIBjsZBoqO5K5SQSJvYhl57EeV7evCNAk=;
 b=iAfzJIn2daAmhImpfo1zpNtR/SCV/SuuyuLs2TYsFmV8ipHkGPRl5rChGgcLvenp4j
 kgmSrbME0GqYUmnn32Qt8Iolkk6bXh8x0m2aAvyuRX7wPpOBlhCQoJT2Tx7UYH+Or9xy
 Mmr8NcjjxIG4f12VQ0zw8z8f4TtdCikCxqr0MpvVRPFQf4WB9RvHtrdDgIbP7IrOH+Np
 iR9bSWaCAmq3D8kWpXWP/Jrz2xHRDdNYZDaedvLqUcRUQMLl77SGGrHSAVNifnqANBHg
 Fx/zHD7y62H1rFmL7pSRCHxIH51+Axdg+A8IsCzoOEtFO76/G+FNdWtLedwlgD2H0DIj
 jO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7emU7YPiOIIBjsZBoqO5K5SQSJvYhl57EeV7evCNAk=;
 b=Aphk3PE0XMqcNNb1XxTfcFcpck2tJHhPHVcHVMe250VYEnjnY1rd4cnXhIbvK6E3i7
 RY0wRjb6yrHbRPsH+T0kE6zu+rlXycrfaPhIM22Jdp6qKC/E7KKwbLNAF7qHdWLmHFUA
 GSjKD2XKT5WCXsaCQmfjI53qM0ZiKUpr5gOzv/DckZXlr5yZDKZxzNtOrmDOkHAO6rw/
 8ZfVIdRbumORzC3I5KFP2NSrRNi/cQaCObL3WqX8fP0C4wu7INegfwZvHZ8XjX9gzFRq
 z2P2UtidKpdC7ri/EIwBOAhyKzqoMXHWTJbkFyzCCqo+VziPPd8JC97FPP8HQ3MYpk+p
 WnPw==
X-Gm-Message-State: AOAM531IT8UYnvHvruOzV4i0ahmZT37pEn2o0Es076gw04i271Yxjjgj
 QuWNR7ccYvdXVgA3V6SFc2ZE+w==
X-Google-Smtp-Source: ABdhPJwHXEfNBJwvCDtoLH9p1oNiADVhEjL5WeD+JVs2Pzr24m5m+h3+6rvVqOQSyQcfAK6xd57fBQ==
X-Received: by 2002:a17:90a:f98c:: with SMTP id
 cq12mr10298747pjb.235.1622132854561; 
 Thu, 27 May 2021 09:27:34 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:34 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/29] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Thu, 27 May 2021 11:26:49 -0500
Message-Id: <20210527162650.1182544-29-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
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
index aee5642818824..01f7615eb3a8a 100644
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

