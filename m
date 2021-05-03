Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C163718C9
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B17A6E902;
	Mon,  3 May 2021 15:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0810B6E914
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:39 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id v13so3055695ple.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dj8ATrkLDKFJ5d9l+0wwim1gFsFJ9J3GyHYy87xeWak=;
 b=F8TwtdGS6T61N65u4INUx7+XSTns761E7Hse3cjQO2cag0g+cxzieZVy3VTlvT5948
 GU9tIftvMLwujgJ1PtJQ46dfujcQQP2ty1LYsU+HxPQi1XfTusVJwtZl/T/68rztS5CJ
 sCKshP6QmkQpLXo2Rr8aTKce1tqqsYbKWN5k4tD/jJwl5DB6KFqz9+NgS3Sq4rjmiCvz
 ZO9eEh16LvhSwRtsvYjAko3IsQt7F4rsyd413aXmmXFmesOXspWH69gemnYLez5aNRtL
 80xhzBWoVndtTUpjLQOFZgSF9orNS35RFQNvZIbeVd9kRCB+pRtWQWfv1JNBSvX2bH1G
 lSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dj8ATrkLDKFJ5d9l+0wwim1gFsFJ9J3GyHYy87xeWak=;
 b=iQ9AEwUaOg7uKSpCCZcgfI6sHp3K3xFg3tvNuN6viL851XXioOxTYjwpY3mP0ExuK9
 IkQCjX8gEmTPzcrWDntqXXWJN5U3TPisWyE9skpNDb5nAO22poBMKL4mTmF/k9rPMQHB
 pSSMft1B9SIISJayNq3Rr3QM3gkRl3GN42hZBp6WM8qgJSwwkkUsqlhPOmlkBajS70N2
 1wiNrB2lGPM+sIvWTjovDEbCq9/eAZopmB5O4ZhUGqPHR1itn0k75WjV2OXoEurNxPP3
 423228+uyODhJFtbxJDuhnooHDdfIs2g5cZfFz4xzRJNZqYawInPdPW5JN9nspAls+j1
 N2qg==
X-Gm-Message-State: AOAM5323HW+YsOIqhdHqcHdBk5c5t2Jo494CdyYbzoamOyigjMX5vd2a
 c9SoLuI2QfG99MGS80I+jkkEWfyXusBOnw==
X-Google-Smtp-Source: ABdhPJxSTk1yBUn/GhdZP+ibV1+JvUsTOSIIKW92Y60CSDiheiM4wUmKF6tDz5o24nvR59t/JszUTA==
X-Received: by 2002:a17:902:e353:b029:ed:866b:7624 with SMTP id
 p19-20020a170902e353b02900ed866b7624mr21581594plc.25.1620057518457; 
 Mon, 03 May 2021 08:58:38 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 26/27] i915/gem/selftests: Assign the VM at context creation
 in igt_shared_ctx_exec
Date: Mon,  3 May 2021 10:57:47 -0500
Message-Id: <20210503155748.1961781-27-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
