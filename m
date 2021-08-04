Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE33E031E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8496EAA1;
	Wed,  4 Aug 2021 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113C36EA97
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:25:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so2464982wrv.11
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EtY8w55rWgTu3+ITCZzz1nxFZlO+pftQJE9iliktvAg=;
 b=d8vUN/8pZRVv8SbT7sgJbK5qxRoN12czO9wH36e75DcSWVv7IrZ7G8ylwkYsfGxJLQ
 io/UZ++RFaJ9ueyTJeNlUekZGvdQDIWhX1h2yKjfnVy6R8CpVdvKaJI5WAtPNXrTGfDw
 nEDESU55k3oqlaIgaBaduRl0ctvkAGrWjFW1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtY8w55rWgTu3+ITCZzz1nxFZlO+pftQJE9iliktvAg=;
 b=lOadJZ5qrcBux/7JnSWTsBoZjqynrVfzn1kXkjf0MouiwzZsCPaz9s0rx2tGYo6mwL
 w/n0VSQrYtopC/I2zSDpGWhjHn4wF1FOy+29oxCGMzRHycTMxEqNrHpoQixpN2+7VMLi
 2/8teFBJPRj1pthEJzO1Dadpfx16Ogl5IrtNRyNgWtGWar3Sl1ro/q0OKz8NPZGylnUb
 SOWCJK4J5gy0tbRoKo2Ci3tptiEw9v7TndVDLZnbzYRTk11/z8Dy7K8+1rzXfjrlsBA4
 jnGiEoa5XlTSwwEV8riXLhAGDurgbRKM03uKaw/kOawZMh4Iz45s+RDw6lMNYFK40RLm
 2Apw==
X-Gm-Message-State: AOAM53115nd07RHUGClPyCClPkOuBlOc/RTuBYSeOVpHXXQFMQkWpMSH
 CgccKHqz7NbimW+O8iNM24dmJQ==
X-Google-Smtp-Source: ABdhPJytin563AK6Gb31xkZL9ReFdi5tcsTBW5TziTgHgXVNoKdJPXJocZmcwIwmuRRTdjnJNBGz6A==
X-Received: by 2002:a5d:53ca:: with SMTP id a10mr28983449wrw.197.1628087135627; 
 Wed, 04 Aug 2021 07:25:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm3222682wrn.9.2021.08.04.07.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:25:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
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
Subject: [PATCH v2 5/9] drm/i915: Use i915_gem_context_get_eb_vm in
 intel_context_set_gem
Date: Wed,  4 Aug 2021 16:25:18 +0200
Message-Id: <20210804142522.4113021-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804142522.4113021-1-daniel.vetter@ffwll.ch>
References: <20210804142522.4113021-1-daniel.vetter@ffwll.ch>
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

Since

commit ccbc1b97948ab671335e950271e39766729736c3
Author: Jason Ekstrand <jason@jlekstrand.net>
Date:   Thu Jul 8 10:48:30 2021 -0500

    drm/i915/gem: Don't allow changing the VM on running contexts (v4)

the gem_ctx->vm can't change anymore. Plus we always set the
intel_context->vm, so might as well use the helper we have for that.

This makes it very clear that we always overwrite intel_context->vm
for userspace contexts, since the default is gt->vm, which is
explicitly reserved for kernel context use. It would be good to split
things up a bit further and avoid any possibility for an accident
where we run kernel stuff in userspace vm or the other way round.

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
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index a80b06c98dba..fd24a1236682 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -784,16 +784,8 @@ static int intel_context_set_gem(struct intel_context *ce,
 
 	ce->ring_size = SZ_16K;
 
-	if (rcu_access_pointer(ctx->vm)) {
-		struct i915_address_space *vm;
-
-		rcu_read_lock();
-		vm = context_get_vm_rcu(ctx); /* hmm */
-		rcu_read_unlock();
-
-		i915_vm_put(ce->vm);
-		ce->vm = vm;
-	}
+	i915_vm_put(ce->vm);
+	ce->vm = i915_gem_context_get_eb_vm(ctx);
 
 	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
 	    intel_engine_has_timeslices(ce->engine) &&
-- 
2.32.0

