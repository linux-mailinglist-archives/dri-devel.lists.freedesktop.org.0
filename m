Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B73A1C17
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36436EA93;
	Wed,  9 Jun 2021 17:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1696EA8A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:32 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso1907461pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+hLgeiGvYpyFrjLGrbFT9e+VhCR6ZRDXGOupSKTV44=;
 b=amjbHSsbeANUvL/3K1dxs2SRmTU0/jqX1aE7rUjCsFTCzb8IhoXoPKI7qmsC4vUvhM
 YyH9GEaYHJlEsFiPGxvMt1lKMDt1xMy9OResAisNo1QRD5SznzqtZH1As9yquvo35quc
 YGw6/KjFTlRQcbl7qo/rzv1yyPrgOm4iuRqqOQEZPZmRQfSwx6MT5L9bRtCQBr5+GKrr
 cxhflsX2SGm/0cBnmksDGpZ0bTh5kktdMrd4vHrkgQfC8wo3o8revhgJcTj7Ip1y77/m
 OssaYkBOcet8yYru9bF5fplull1e9zBuxAvV2U62bJ30pXwfbHsfFaThxdjiruumfv6F
 5sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+hLgeiGvYpyFrjLGrbFT9e+VhCR6ZRDXGOupSKTV44=;
 b=TBpNkR0WpIsYkgjKn7LW+TmNngOhE7HZlXbW6MhhRdC7c/09fUmQ6+jP9Hcl9/1txb
 umFRpevHXPQZCK+DPw1j/SjcpM/74X+BE+wgDaY1+eMjpakwGx/7PwFuQunc0uG0VR0j
 rCfFWQYt1HDWyoUYRkopkrvwgrWiqIGjO69fydcMhe+f6JF5yMCFFzzrixFloWthPRan
 9rVJgxhisK90gUManOqXjteG0ra6Ko4QiOCI2lFMuiHChyS7KWeZPedpw5DSvZQgZ7Cp
 /rJuc6wwzQEuO7JHQr3zwSVjG6vuQgg8VBuCMddh25Sarb15WXSR8QGnzH1XLwZxeAJs
 rjzw==
X-Gm-Message-State: AOAM533B4P/5NjOx0DgBEd7L0cnPdY8Z6Q09VZiejKVXDJcY8M9BdDxY
 p4I9nBuQhIdGf9kDiqb3g8VZNKybcosJ6Q==
X-Google-Smtp-Source: ABdhPJzRHJbkf31MUgBFOoeMfiReksDZyvwcoAtc531uf+fkuEHz78+O6x4+4oUlmQn22eg5u8FiwQ==
X-Received: by 2002:a17:90a:24a:: with SMTP id
 t10mr712014pje.178.1623260672178; 
 Wed, 09 Jun 2021 10:44:32 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/31] drm/i915/gem: Return void from context_apply_all
Date: Wed,  9 Jun 2021 12:43:52 -0500
Message-Id: <20210609174418.249585-6-jason@jlekstrand.net>
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

None of the callbacks we use with it return an error code anymore; they
all return 0 unconditionally.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9750a1ac7023e..3503d46c88cbf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -718,32 +718,25 @@ __context_engines_await(const struct i915_gem_context *ctx,
 	return engines;
 }
 
-static int
+static void
 context_apply_all(struct i915_gem_context *ctx,
-		  int (*fn)(struct intel_context *ce, void *data),
+		  void (*fn)(struct intel_context *ce, void *data),
 		  void *data)
 {
 	struct i915_gem_engines_iter it;
 	struct i915_gem_engines *e;
 	struct intel_context *ce;
-	int err = 0;
 
 	e = __context_engines_await(ctx, NULL);
-	for_each_gem_engine(ce, e, it) {
-		err = fn(ce, data);
-		if (err)
-			break;
-	}
+	for_each_gem_engine(ce, e, it)
+		fn(ce, data);
 	i915_sw_fence_complete(&e->fence);
-
-	return err;
 }
 
-static int __apply_ppgtt(struct intel_context *ce, void *vm)
+static void __apply_ppgtt(struct intel_context *ce, void *vm)
 {
 	i915_vm_put(ce->vm);
 	ce->vm = i915_vm_get(vm);
-	return 0;
 }
 
 static struct i915_address_space *
@@ -783,10 +776,9 @@ static void __set_timeline(struct intel_timeline **dst,
 		intel_timeline_put(old);
 }
 
-static int __apply_timeline(struct intel_context *ce, void *timeline)
+static void __apply_timeline(struct intel_context *ce, void *timeline)
 {
 	__set_timeline(&ce->timeline, timeline);
-	return 0;
 }
 
 static void __assign_timeline(struct i915_gem_context *ctx,
@@ -1841,19 +1833,17 @@ set_persistence(struct i915_gem_context *ctx,
 	return __context_set_persistence(ctx, args->value);
 }
 
-static int __apply_priority(struct intel_context *ce, void *arg)
+static void __apply_priority(struct intel_context *ce, void *arg)
 {
 	struct i915_gem_context *ctx = arg;
 
 	if (!intel_engine_has_timeslices(ce->engine))
-		return 0;
+		return;
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
 		intel_context_set_use_semaphores(ce);
 	else
 		intel_context_clear_use_semaphores(ce);
-
-	return 0;
 }
 
 static int set_priority(struct i915_gem_context *ctx,
-- 
2.31.1

