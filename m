Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDA3933DF
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999956F45E;
	Thu, 27 May 2021 16:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58226F449
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:08 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id p39so969494pfw.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyP1owwRF3BjuE5EqLIJztkbKir3ysHS+oxbwFsHWUs=;
 b=DsT0XqO1+sWqSLUazm6a+TgVVtPA9IX/+p3jwt3da403fyYW6MPOxcDAqVDZpvyyMq
 xF3PL7KqgC4lzXMLgzr5lYX5EWUaFnTJJ8D9ckcUAKR7p9Gn4uzwO7+bl0A2tVfO5mZq
 kEQ6ZfbPeswe+28aNvYcufd/Ni1SxhQSnYtDEc1G95H6wzIpMD2+aW1xyEv45mb+a4IS
 PGBQ9n21zDtkWU5rZYmom9xoz9g4z0UOMZSLUQDSUax559hI3r2joGwleAj6rG25mPcG
 STORDDpPmlsWGaYT43VurUpmVvPf/SmAEjt/TKk4kl36bbmtoyxJygYTdCurn4w1gWKw
 3XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AyP1owwRF3BjuE5EqLIJztkbKir3ysHS+oxbwFsHWUs=;
 b=AY4KinQxHHSjrBkH8bY7JzDm03AoGkF648kUTRkqquiIlvAd/6vpotGnducxkKzTMr
 viV/2WQA6G60aORIFgM1xSyR0qm5sA+Qf3E3V0XAWf7/OwDA3QZT1NCZhay7G7zbnvdE
 nx6YN1ekxGBTyRUdXCbzfph5wUt4vUDjdoTpIhjLVUw1gCC8jVBJweIM/lys2SY+UXha
 s3x566DGbZvaK80B4yXcems1Ief7TEMakN8a2bpw55OsrGNkup9k4M6x0rDg+aO9aq3f
 djIeBxdc+ce2rdXnqiSebYlphdpSoCIiT4BO9XZumOByEo4PhmSEs+t2IzGuwp/w+qjL
 O+2Q==
X-Gm-Message-State: AOAM530AhOh3KdcA4qHT/JU7zW9vTYBfIzGvFCeu0upJAxjGEz2romMx
 1hxV2HUdLA50szoJzlNeQ509fw==
X-Google-Smtp-Source: ABdhPJzZCY8LfSqWSJ+AF6ra1EQ1lX53rn9k+uElnmQFGCoiNdT4brrS+b9WU3kZ4NfeFDIXGwXoxg==
X-Received: by 2002:a63:5052:: with SMTP id q18mr4366339pgl.349.1622132827237; 
 Thu, 27 May 2021 09:27:07 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:06 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/29] drm/i915: Drop getparam support for
 I915_CONTEXT_PARAM_ENGINES
Date: Thu, 27 May 2021 11:26:29 -0500
Message-Id: <20210527162650.1182544-9-jason@jlekstrand.net>
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
index aa792c9517e16..fed3538de9241 100644
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

