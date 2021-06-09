Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1E3A0B75
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE626ECC0;
	Wed,  9 Jun 2021 04:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044316ECB7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:41 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id g4so648072pjk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=LWLx5p6JF/p4rNvszWkrqxwmgR2JVANQ+wTkXYxU13bzomn0b3qgTP2iranm0QYa1l
 vgLQEEZ7AUQ5gMXXwh1QCYtqdfCr/719tX3VzFXmtEftKYFkveDgOim1BCQuvA38LuKh
 ao6fq3iOUfeqhb+2i3oqBGu1iCgtCmeDL1wpOe3dRHNeUr0D9C2j9Ym5VAc0/T/zT/+0
 uR09rFKqVkZLTNqpD7LoW1SInDlVjcDTZV6mUuMxrJxp//p2wGjyFoQYwzg2zTifkTgw
 Xu+fV0KAipkoaMBVpDiXR3Fv5Ob93ixfmYdxjVjZPq152XU6ilC7KSut4+JNOh2/AjT+
 0JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=AuiTnt1tLVUyH4bD68qF7w8p23dwvC1oEbNb+oj68BPbB7eZoIfAqwn7RzQQ3+kbKN
 8BqPbTweAZ/y6Zh1nFzQueZOWyUIle8GYqei085DXVTxEUb8i+vfZGzCqTfCLf5snmDx
 iY+CItcrA0hJjd+en9UPfCHjsR+xMn2GVMZ7SHBgHANx7OP+Jy053l+RaUiZHpDkBftL
 qEyQk6T40cqzs3BXxDZqGldHYMugXzWs5O+ZS2Qglj4o+nuqSswIVQxjpg3XtQ7ErHJu
 z0OWzGmCI7UgTZNl3EYS09oef6Abv1FBhNwP0vFDDepWmjEqp//hdt0gHkgfye/A5bMQ
 xMCQ==
X-Gm-Message-State: AOAM530Ys4o+uTGlPYUSsSDfIarApGbnzbAOccltaynWLkQZoCMhA0bE
 /HqgY93lWMqnT76MtPBaVSM1oevsOMdhGA==
X-Google-Smtp-Source: ABdhPJzd8IH5cOGba0SX5eAsNk29mZlcgz4tLh+O6PSGEmXPiUJhwfomC1IriBGPFE8PZMzjEpYx/A==
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr3563291pll.21.1623213400390; 
 Tue, 08 Jun 2021 21:36:40 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/31] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Tue,  8 Jun 2021 23:35:54 -0500
Message-Id: <20210609043613.102962-13-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
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

There's no sense in allowing userspace to create more engines than it
can possibly access via execbuf.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5eca91ded3423..0ba8506fb966f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1639,11 +1639,11 @@ set_engines(struct i915_gem_context *ctx,
 		return -EINVAL;
 	}
 
-	/*
-	 * Note that I915_EXEC_RING_MASK limits execbuf to only using the
-	 * first 64 engines defined here.
-	 */
 	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
+	/* RING_MASK has no shift so we can use it directly here */
+	if (num_engines > I915_EXEC_RING_MASK + 1)
+		return -EINVAL;
+
 	set.engines = alloc_engines(num_engines);
 	if (!set.engines)
 		return -ENOMEM;
-- 
2.31.1

