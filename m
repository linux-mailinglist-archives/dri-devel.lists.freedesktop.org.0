Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90DD3EBD5A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074526E8DB;
	Fri, 13 Aug 2021 20:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDD6E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:44 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id by4so17265146edb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E4CcYYJFCPlQ7uaOsIHMZUXG6jOh7KMRwfyaNLCKewo=;
 b=KSVcy351WkbH4KSoR+kx97Hv93UyyB33KdJsYqT5R0mnPZj0cufQC2NYHla2WJ3kgW
 J/Y7rYKQ4/A1Dc3KAZ+6srUp+PxQqy5Si+sKw3idMnb3wM44jjIzj9Wwb+YWM/66O41X
 1A1Pe0x8rjyQfqubTQdRwQKz4MSR8gnnInwwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E4CcYYJFCPlQ7uaOsIHMZUXG6jOh7KMRwfyaNLCKewo=;
 b=berR9WGAI+1djwLNhggtymkjOMK8z0M3c0J+0TzxEnykCYUyguHfEj0BZVhwlen9YH
 GhgztXleVod1oSvSTQmoFjch8CHq0dSferZpAwY8/i5yufeIWPUcots/kWt3X1qDtPMO
 SFvmNomP3L49cYUNSlpLTqSuBX+yzPD9UDyQtH+N/MwzKFPUKpdcW9q3kN4SGzGUnhGf
 tFtdCz/2iZIhFotdm/YxT/tNiYQB17Vraj3b1Mg5eNHaRkLmCXfT1gzPa10Qkid0GhCr
 Y5t0otZeZVV49ehWiQWMxyN3OX5zg3UB7/R/Z8zZxMtL5dCS0aKuEBIaTg8PIHXbWb+d
 VQJA==
X-Gm-Message-State: AOAM531Vb/TY4ybcSr4KSK98vMajg9LmftvMPQO5FIvq0c09+Z2QkWdl
 7Ca3/HOoS3qZ7IE2mkMnwzstHLVVEwD3NQ==
X-Google-Smtp-Source: ABdhPJwv6e1Ladicbp3JPnE7fcY1Ss+1ji1QWn3zjDb/eK/fPBO5K62W1UZauqnLW3z5LWbOnPHKUg==
X-Received: by 2002:a50:fd87:: with SMTP id o7mr5409566edt.289.1628886642886; 
 Fri, 13 Aug 2021 13:30:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 03/11] drm/i915: Keep gem ctx->vm alive until the final put
Date: Fri, 13 Aug 2021 22:30:25 +0200
Message-Id: <20210813203033.3179400-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
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

The comment added in

    commit b81dde719439c8f09bb61e742ed95bfc4b33946b
    Author: Chris Wilson <chris@chris-wilson.co.uk>
    Date:   Tue May 21 22:11:29 2019 +0100

        drm/i915: Allow userspace to clone contexts on creation

and moved in

    commit 27dbae8f36c1c25008b7885fc07c57054b7dfba3
    Author: Chris Wilson <chris@chris-wilson.co.uk>
    Date:   Wed Nov 6 09:13:12 2019 +0000

        drm/i915/gem: Safely acquire the ctx->vm when copying

suggested that i915_address_space were at least intended to be managed
through SLAB_TYPESAFE_BY_RCU:

                * This ppgtt may have be reallocated between
                * the read and the kref, and reassigned to a third
                * context. In order to avoid inadvertent sharing
                * of this ppgtt with that third context (and not
                * src), we have to confirm that we have the same
                * ppgtt after passing through the strong memory
                * barrier implied by a successful
                * kref_get_unless_zero().

But extensive git history search has not brough any such reuse to
light.

What has come to light though is that ever since

commit 2850748ef8763ab46958e43a4d1c445f29eeb37d
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Oct 4 14:39:58 2019 +0100

    drm/i915: Pull i915_vma_pin under the vm->mutex

(yes this commit is earlier) the final i915_vma_put call has been
moved from i915_gem_context_free (now called _release) to
context_close, which means it's not actually safe anymore to access
the ctx->vm pointer without lock helds, because it might disappear at
any moment. Note that superficially things all still work, because the
i915_address_space is RCU protected since

    commit b32fa811156328aea5a3c2ff05cc096490382456
    Author: Chris Wilson <chris@chris-wilson.co.uk>
    Date:   Thu Jun 20 19:37:05 2019 +0100

        drm/i915/gtt: Defer address space cleanup to an RCU worker

except the very clever macro above (which is designed to protected
against object reuse due to SLAB_TYPESAFE_BY_RCU or similar tricks)
results in an endless loop if the refcount of the ctx->vm ever
permanently drops to 0. Which it totally now can.

Fix that by moving the final i915_vm_put to where it should be.

Note that i915_gem_context is rcu protected, but _only_ the final
kfree. This means anyone who chases a pointer to a gem ctx solely
under the protection can pretty only call kref_get_unless_zero(). This
seems to be pretty much the case, aside from a bunch of cases that
consult the scheduling information without any further protection.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Fixes: 2850748ef876 ("drm/i915: Pull i915_vma_pin under the vm->mutex")
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5a053cf14948..12e2de1db1a2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -990,6 +990,7 @@ static void i915_gem_context_release_work(struct work_struct *work)
 {
 	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
 						    release_work);
+	struct i915_address_space *vm;
 
 	trace_i915_context_free(ctx);
 	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
@@ -997,6 +998,10 @@ static void i915_gem_context_release_work(struct work_struct *work)
 	if (ctx->syncobj)
 		drm_syncobj_put(ctx->syncobj);
 
+	vm = i915_gem_context_vm(ctx);
+	if (vm)
+		i915_vm_put(vm);
+
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
@@ -1220,8 +1225,15 @@ static void context_close(struct i915_gem_context *ctx)
 	set_closed_name(ctx);
 
 	vm = i915_gem_context_vm(ctx);
-	if (vm)
+	if (vm) {
+		/* i915_vm_close drops the final reference, which is a bit too
+		 * early and could result in surprises with concurrent
+		 * operations racing with thist ctx close. Keep a full reference
+		 * until the end.
+		 */
+		i915_vm_get(vm);
 		i915_vm_close(vm);
+	}
 
 	ctx->file_priv = ERR_PTR(-EBADF);
 
-- 
2.32.0

