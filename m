Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6283933C2
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384B6F440;
	Thu, 27 May 2021 16:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8316F43E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id s4so205473plg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDMhkOEhR69rFkKqEjxm+uXyTsOYbw5gWe71Q+ugbFs=;
 b=QtylRmiFARzPHYGLsbuhvJxF+7WubCKPaWFW4CyjleoWDvemk48kvMSc717zNs4Vo4
 JzBq5MJX5xbR5D48gnZa5dsw9vk9LA74bvUCRGEDrCOWe6PeKSDJaAE9dzCL2iijSo2U
 TrtzKkIp3JdQ9ZmSbE5Yf8WY9QnpWgktz6XqQLrXYRCzTK52lildl48pPtXo1JVLchNJ
 VnLLC1cWvYYqa+LmPQbDv5u7Kr++io9h2UkLmXJuN162vjLm6NrNq0Mu6BGLfLgUykbN
 TDijcDuLOJq2OB/Kn+ZTcnZLajIPg1FELvmwLqiMLI7jVfS/VCvTIEMfZ4Fqlmv8QRrp
 1kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDMhkOEhR69rFkKqEjxm+uXyTsOYbw5gWe71Q+ugbFs=;
 b=eWhxIOXm6PwV+W08PM+5OBVDoyyKiCu14vQzhWo3Q2qxA2CY4AvktfbwdftNBZsgBH
 1n/xyLxsz5vOa4b+I01DNis/KdWLx32J2mwGXxLhWQrI0cu9FQqEYwxU8p86rc26phUG
 HNuedBhBSZ2WWS9LztzM5HryAwrgzfj9jZzhJxUJ1RhzYSaUvwkh72W+BO0IzvHRVIK6
 ClNKl8SvogZOiTPfKsUkOaTA61CJnzYan5N6CpZ4Wc8IYMZpsbt8yr3JEClFbU1qKCfB
 3VsTc7499YNZKA7MEs959Gq4ygmVNv4zze8qFhx1lHyajyMppMtT3phzDXuH5PeLNq6a
 sVyQ==
X-Gm-Message-State: AOAM533IqK0X0H4Ln1IMQXeq9uSyO8y+i/rnaKKD0ZG70TInQyXQEPwN
 mnJZ2ZqpUMBbHNYjplbBqPBieQ==
X-Google-Smtp-Source: ABdhPJzZcm+Sqxk0k8LlUbl4TvlVdUxNpstzQSzQqnDoG7/iwk2NTGCS/qCvteqbuktU+3hd6TalWA==
X-Received: by 2002:a17:90a:aa96:: with SMTP id
 l22mr10167363pjq.173.1622132822889; 
 Thu, 27 May 2021 09:27:02 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/29] drm/i915/gem: Return void from context_apply_all
Date: Thu, 27 May 2021 11:26:26 -0500
Message-Id: <20210527162650.1182544-6-jason@jlekstrand.net>
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

None of the callbacks we use with it return an error code anymore; they
all return 0 unconditionally.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 9a8a96e4346e4..6f1e5c2c5b113 100644
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

