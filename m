Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5B3FEF55
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3CF6E581;
	Thu,  2 Sep 2021 14:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC96E56D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m9so3238574wrb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fIGiLnBwxKa9nrx1HaxLhnLItCgYwwPlTiECGK9vWxg=;
 b=X5oF64RCKueGI9UdGxnIbuQkOMZftPWvw02LFhvad+ytpqit9AZ1MkQ6jGx5YU7/oa
 OBDCphRyXI9OzOK6IpWIEIJT2a2xBnitNuoXgXn87ghm5NiY/HH+Ho7nrB0d0h2apKHt
 X/OzO3LrdcAvYx7DzH9gNiQdmWGy9LgPVtscg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fIGiLnBwxKa9nrx1HaxLhnLItCgYwwPlTiECGK9vWxg=;
 b=c3Bzq8cbZqaNcYejThhVy1v0vz4ilAT7Y9LCkh2SpUtm82WpckUiZK1V7NW7AWrTbV
 e8vyRbM2RyIxnas6LadRH+OuFeXQcoSj1Vqupo/rgQhsN7x6ZYQNB9655qKBUvl5rrAw
 sHs0b/EfZ143PV80zfd4NZmbdAJ3AeueqbZKfSAwHvuhTkMS2Hn8Fso3LCDGEmolSFax
 Ijx6F38Slw44Q/oDlituWqNSiR5SqBlGR0z8QR9d7CLRLXTx3LEspb7AahRs44t/4E2U
 acYTyA7wpkDQsI+VxzkovZXtbXRLZKUNHcPNEW5YhSWI7j30ThJpJoALCd3EORThAJv3
 Ed/w==
X-Gm-Message-State: AOAM533jMXdHt8CU5FDF4GYoX7t8CLVv5/dym9SgoFYktIP58v6QWxEl
 JqhclQwWqT+I59aAjxmM367VaNPlr73xOg==
X-Google-Smtp-Source: ABdhPJwhrc/tLt3KeCHdnMu1uVio68l88lrfW/t4yxwdUX3U64K5WtTam8MWSbUx22Rss09Mwi4cIA==
X-Received: by 2002:adf:f645:: with SMTP id x5mr4131074wrp.353.1630592474173; 
 Thu, 02 Sep 2021 07:21:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 07/11] drm/i915: Add i915_gem_context_is_full_ppgtt
Date: Thu,  2 Sep 2021 16:20:53 +0200
Message-Id: <20210902142057.929669-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

And use it anywhere we have open-coded checks for ctx->vm that really
only check for full ppgtt.

Plus for paranoia add a GEM_BUG_ON that checks it's really only set
when we have full ppgtt, just in case. gem_context->vm is different
since it's NULL in ggtt mode, unlike intel_context->vm or gt->vm,
which is always set.

v2: 0day found a testcase that I missed.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c           | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h           | 7 +++++++
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c        | 2 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +++---
 4 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7a566fb7cca4..1eec85944c1f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1566,7 +1566,7 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
 	int err;
 	u32 id;
 
-	if (!rcu_access_pointer(ctx->vm))
+	if (!i915_gem_context_is_full_ppgtt(ctx))
 		return -ENODEV;
 
 	rcu_read_lock();
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
index da6e8b506d96..37536a260e6e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
@@ -154,6 +154,13 @@ i915_gem_context_vm(struct i915_gem_context *ctx)
 	return rcu_dereference_protected(ctx->vm, lockdep_is_held(&ctx->mutex));
 }
 
+static inline bool i915_gem_context_is_full_ppgtt(struct i915_gem_context *ctx)
+{
+	GEM_BUG_ON(!!rcu_access_pointer(ctx->vm) != HAS_FULL_PPGTT(ctx->i915));
+
+	return !!rcu_access_pointer(ctx->vm);
+}
+
 static inline struct i915_address_space *
 i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
 {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 905b1cbd22d5..40f08948f0b2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -749,7 +749,7 @@ static int eb_select_context(struct i915_execbuffer *eb)
 		return PTR_ERR(ctx);
 
 	eb->gem_context = ctx;
-	if (rcu_access_pointer(ctx->vm))
+	if (i915_gem_context_is_full_ppgtt(ctx))
 		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index fc7fb33a3a52..947154e445a7 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -704,7 +704,7 @@ static int igt_ctx_exec(void *arg)
 				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
 				       ndwords, dw, max_dwords(obj),
 				       engine->name,
-				       yesno(!!rcu_access_pointer(ctx->vm)),
+				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
 				       err);
 				intel_context_put(ce);
 				kernel_context_close(ctx);
@@ -838,7 +838,7 @@ static int igt_shared_ctx_exec(void *arg)
 				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
 				       ndwords, dw, max_dwords(obj),
 				       engine->name,
-				       yesno(!!rcu_access_pointer(ctx->vm)),
+				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
 				       err);
 				intel_context_put(ce);
 				kernel_context_close(ctx);
@@ -1417,7 +1417,7 @@ static int igt_ctx_readonly(void *arg)
 				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
 				       ndwords, dw, max_dwords(obj),
 				       ce->engine->name,
-				       yesno(!!ctx_vm(ctx)),
+				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
 				       err);
 				i915_gem_context_unlock_engines(ctx);
 				goto out_file;
-- 
2.33.0

