Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CC3C1669
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BD56E909;
	Thu,  8 Jul 2021 15:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8056E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:49 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id j65so2160687oih.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dczuWBcu8GQi5n1SjUOULDfc1KecOud9gwXQi7cWpdA=;
 b=0gn7N5OUY/xyLHLETqqWrWA16Ot9YJOe2Dt36g33E7Evw/nvwRrGciK8n2lrMeuCMf
 bJ9jvHjHjiZ0DtjExF8j+Nn1yL+1XBHepY8tJLoE2VXTMUnZyN5dGieqsGIGfXxS8S2p
 ZzuC73LWDA/68fXV6zzP9JXlp+Lw+u+fXCxj+zvrx4UBfBQXRFYc3ELOrGfwMQV92go9
 nOMU2/6qHiM4vmFbjgb+FZ1WPuYKpMjYOYMxW68GMzIZMor3rVvCgGFrybuw3GgAW94l
 2sPPQtnPOG2nMLKnW3xjl4LTM+mnrpUzHK7rBnnU4929uWd4VhSF3bEpj/wmuV69cn4u
 vLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dczuWBcu8GQi5n1SjUOULDfc1KecOud9gwXQi7cWpdA=;
 b=ielGBIBvUcS+vRfqY7PqyWfzhVKXwmPlbuU56zCRL2MM8j3YF4kjkYbfGF+Kzfykx1
 lv+oqXUdGDeEwYzmr6eESaYcc6h3KD+gVWyHTDc6f6AGM4J7CWwB7K1NeY9PzPqcy0Z6
 JRLjMzkqsE5olp5iOPyqcaAR/lPNCo2D0nZBsaYeL8QognhmcVHmY9Z1q3RvNhZQpEgg
 sflf2frQGUk7hKaC0wTSLDF4g7HM/5VSmYX0h5WopqrW+Johnp1y9DcsnPEJEF0SRIHT
 0AB3QHVUitxiD04mzBz6SiuO9Ct9JMpCiDRS/40iZ7WW3HoeX0CamPGRWMB0i5x6tsCx
 BjdA==
X-Gm-Message-State: AOAM533Z0cjfcS9DGD90KoyRQ5tZ5e7KCQjmskKndZA+1L4g20pFhpzE
 GJAbuVZOldXl8GwAqw35b5WtVg==
X-Google-Smtp-Source: ABdhPJxWNBNKH7yAyDqjBKcZGm+s6K15JdZJU85IrljAZOzLu4UWn8Qp8Dnx58dU1z7j9p1efRE46g==
X-Received: by 2002:aca:210f:: with SMTP id 15mr3916270oiz.85.1625759328768;
 Thu, 08 Jul 2021 08:48:48 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:47 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/30] drm/i915: Drop getparam support for
 I915_CONTEXT_PARAM_ENGINES
Date: Thu,  8 Jul 2021 10:48:13 -0500
Message-Id: <20210708154835.528166-9-jason@jlekstrand.net>
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

This has never been used by any userspace except IGT and provides no
real functionality beyond parroting back parameters userspace passed in
as part of context creation or via setparam.  If the context is in
legacy mode (where you use I915_EXEC_RENDER and friends), it returns
success with zero data so it's not useful for discovering what engines
are in the context.  It's also not a replacement for the recently
removed I915_CONTEXT_CLONE_ENGINES because it doesn't return any of the
balancing or bonding information.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 77 +--------------------
 1 file changed, 1 insertion(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 249bd36f14019..e36e3b1ae14e4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1724,78 +1724,6 @@ set_engines(struct i915_gem_context *ctx,
 	return 0;
 }
 
-static int
-get_engines(struct i915_gem_context *ctx,
-	    struct drm_i915_gem_context_param *args)
-{
-	struct i915_context_param_engines __user *user;
-	struct i915_gem_engines *e;
-	size_t n, count, size;
-	bool user_engines;
-	int err = 0;
-
-	e = __context_engines_await(ctx, &user_engines);
-	if (!e)
-		return -ENOENT;
-
-	if (!user_engines) {
-		i915_sw_fence_complete(&e->fence);
-		args->size = 0;
-		return 0;
-	}
-
-	count = e->num_engines;
-
-	/* Be paranoid in case we have an impedance mismatch */
-	if (!check_struct_size(user, engines, count, &size)) {
-		err = -EINVAL;
-		goto err_free;
-	}
-	if (overflows_type(size, args->size)) {
-		err = -EINVAL;
-		goto err_free;
-	}
-
-	if (!args->size) {
-		args->size = size;
-		goto err_free;
-	}
-
-	if (args->size < size) {
-		err = -EINVAL;
-		goto err_free;
-	}
-
-	user = u64_to_user_ptr(args->value);
-	if (put_user(0, &user->extensions)) {
-		err = -EFAULT;
-		goto err_free;
-	}
-
-	for (n = 0; n < count; n++) {
-		struct i915_engine_class_instance ci = {
-			.engine_class = I915_ENGINE_CLASS_INVALID,
-			.engine_instance = I915_ENGINE_CLASS_INVALID_NONE,
-		};
-
-		if (e->engines[n]) {
-			ci.engine_class = e->engines[n]->engine->uabi_class;
-			ci.engine_instance = e->engines[n]->engine->uabi_instance;
-		}
-
-		if (copy_to_user(&user->engines[n], &ci, sizeof(ci))) {
-			err = -EFAULT;
-			goto err_free;
-		}
-	}
-
-	args->size = size;
-
-err_free:
-	i915_sw_fence_complete(&e->fence);
-	return err;
-}
-
 static int
 set_persistence(struct i915_gem_context *ctx,
 		const struct drm_i915_gem_context_param *args)
@@ -2126,10 +2054,6 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 		ret = get_ppgtt(file_priv, ctx, args);
 		break;
 
-	case I915_CONTEXT_PARAM_ENGINES:
-		ret = get_engines(ctx, args);
-		break;
-
 	case I915_CONTEXT_PARAM_PERSISTENCE:
 		args->size = 0;
 		args->value = i915_gem_context_is_persistent(ctx);
@@ -2137,6 +2061,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
 
 	case I915_CONTEXT_PARAM_NO_ZEROMAP:
 	case I915_CONTEXT_PARAM_BAN_PERIOD:
+	case I915_CONTEXT_PARAM_ENGINES:
 	case I915_CONTEXT_PARAM_RINGSIZE:
 	default:
 		ret = -EINVAL;
-- 
2.31.1

