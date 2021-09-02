Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B83FEF50
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA426E575;
	Thu,  2 Sep 2021 14:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC236E56D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id m2so1426078wmm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oRVf9sbWz+z/GcsknHSTFYjsqPuEDYgjvOz54sSSPjg=;
 b=JwD5QvsT8ZjD3I6QXYH2bB9jVdSgPdiDXtezHCI74BIfVKSFiZYFbDV5MzC6cVcEcL
 kZCsrccx8dKAx9vwVpM5zGNMDMri86vUToJ9KCZRfyJszTjYFLVA6i1woZ0vnL6EeUbf
 hxc60KRFvzd4V5wB9KJda/bajbw+qQOgn7+vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oRVf9sbWz+z/GcsknHSTFYjsqPuEDYgjvOz54sSSPjg=;
 b=hKtlJ0QzSjKleBegbgsSKWHnC7cUY0bniwDALvLe264JOQbPJGP237iLmMXiRmpNnq
 Z/b+NGAi/Sisp39wEEMaA0mF9Nnp00ewkIeqcqxTxxEZfuHn1WsuAsEM0fZrW7D8m9fK
 Sxc15sriW80325k0miYyLZRLPLQtiNhZw5Gi+pWvsmLpwFFp7IO/97FpTRCeom3YG3mh
 /A3q5NtOpuIA+b7HrPzYVBQ+yw8Epd/bqfRW4ZqMdOhXxxoV9HTdd6nPdnkIc70DF1wd
 v0SclVvjxHNKaD1sAnHsV3a8jvgo/tx73T1TCNHqikqBVbZDfRqQ7G0uSQ3CAx1THz0w
 oG/g==
X-Gm-Message-State: AOAM532n8VUchLWBdXu11pXacjzADTVLVfcL4jEypRfPp7JMpdFsAfyC
 bzmxAmhtnvUsLanfEi3XIB8f5+HmnhXeEg==
X-Google-Smtp-Source: ABdhPJxL0hZrc6Rly1WFLMVZBfxn3WkJWmR+yGRlhJMIuIyJRX+wOXB4BaYLkNyB+U0BHroOitECMw==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr3444010wmp.164.1630592470077; 
 Thu, 02 Sep 2021 07:21:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 03/11] drm/i915: Keep gem ctx->vm alive until the final put
Date: Thu,  2 Sep 2021 16:20:49 +0200
Message-Id: <20210902142057.929669-3-daniel.vetter@ffwll.ch>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
2.33.0

