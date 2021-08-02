Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E63DDCBC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BFA6E1ED;
	Mon,  2 Aug 2021 15:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DAF6E1A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 15:48:41 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id oz16so31577526ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nl7Irs71vJM1YfQMLmrkQe1rncHUCMW4+W0FSdH/emo=;
 b=bcjMHaD7lBwNjpUJnt6nNj2zB249DzfUhvbz9u+/apMCW+0TOjiaDcR7e6wjJP4blE
 1cDLMlLMtPc53fSQMdvbIDOieZFZsnsjHjReAclPRyRrQP703FzDB2iZjsUsUY7LZTwy
 vV/cL/salYAXVBTUlW5UooVP+72gPE/alWICw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nl7Irs71vJM1YfQMLmrkQe1rncHUCMW4+W0FSdH/emo=;
 b=j7kbVQ3TT7GcNXVhBppNvr4gKD/4OaZUO2u+2SlZO+ZgF/tIvRQJDqLviwKRiSFE+J
 DWyjnDqykLpQTuamjsJM3tqVaeIIZO3+lp37Ab3RxExNESLe2XL/dt6kIycIYcBJYcul
 N/Wmcs1M3utK6dQcBHL0Et3ramTwyzeytkC2S0U67EOuNtaRFeu65z1qbVC98um1Xnnq
 9Nm8+Lc5F1IbA2oArAdu9fv5/TYm4Z/FYdBNxPvGkyBHROYh2iQStPnW8a+Z/YbNSdsi
 uTdkFi7+cIgdyKHkYr5Uaad1Z+QP2VaQbaKenWhH2ti1s7EtaQdNYusmgpIRcPvbjmJd
 twTw==
X-Gm-Message-State: AOAM532plTcwNPUC9XGmaQQsERupfFYbb1HMkzelZK6mXjvtuDnwSYW0
 XjsmM5Z/MzMAmEZX9liso1/a9+TL5fX7fg==
X-Google-Smtp-Source: ABdhPJx/cCVDqBdHmUYokXzmzYUV9HGcgFn2GtG5vbbgLNU2h9oB02+1PKbnd+07YJJ4b/aacFk2Qw==
X-Received: by 2002:a17:906:85c2:: with SMTP id
 i2mr16083602ejy.397.1627919320016; 
 Mon, 02 Aug 2021 08:48:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m20sm5064020edv.67.2021.08.02.08.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:48:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: [PATCH 3/9] drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
Date: Mon,  2 Aug 2021 17:48:00 +0200
Message-Id: <20210802154806.3710472-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802154806.3710472-1-daniel.vetter@ffwll.ch>
References: <20210802154806.3710472-1-daniel.vetter@ffwll.ch>
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

Consolidates the "which is the vm my execbuf runs in" code a bit. We
do some get/put which isn't really required, but all the other users
want the refcounting, and I figured doing a function just for this
getparam to avoid 2 atomis is a bit much.

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
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index cff72679ad7c..6263563e15d6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -2124,6 +2124,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_file_private *file_priv = file->driver_priv;
 	struct drm_i915_gem_context_param *args = data;
 	struct i915_gem_context *ctx;
+	struct i915_address_space *vm;
 	int ret = 0;
 
 	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
@@ -2133,12 +2134,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 	switch (args->param) {
 	case I915_CONTEXT_PARAM_GTT_SIZE:
 		args->size = 0;
-		rcu_read_lock();
-		if (rcu_access_pointer(ctx->vm))
-			args->value = rcu_dereference(ctx->vm)->total;
-		else
-			args->value = to_i915(dev)->ggtt.vm.total;
-		rcu_read_unlock();
+		vm = i915_gem_context_get_eb_vm(ctx);
+		args->value = vm->total;
+		i915_vm_put(vm);
+
 		break;
 
 	case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
-- 
2.32.0

