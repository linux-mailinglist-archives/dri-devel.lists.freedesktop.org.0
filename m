Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3A3EBD60
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067486E8E3;
	Fri, 13 Aug 2021 20:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1486E8D2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id q3so13039639edt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxcJ4iRx+uQorCD2l2uBaNCpQD/P7b5uicGWO5Pfa74=;
 b=lRFg3+GvEv6bN88cEUEBbHcyq0YDboHjSpDhOyVKpqnbmeObHPjQKE5/yqnMV9l6+r
 xpyDKmvms9nTKQqfQzY306OVCQRLnxlix7Z1PTaepm97LoMKkzfmLy+D1IbiNPVnGJ9G
 A+B0ig+Z7LSYM1CxiKQWXdBoyERdMvEqgD6rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxcJ4iRx+uQorCD2l2uBaNCpQD/P7b5uicGWO5Pfa74=;
 b=PadiBzSfOKVTB3Io8Bxnhubi0CGB5JcozkVKXVIK94BgRvBMNjYte1zCaPRRYMZ3iU
 kj0SWUPVACVJ96/3fApB15CFWnnIVM9zBLP6ySeziE6VL15Bf73C7E+YhpmkVdYZCFnX
 gxKIIU+VqOwo1+RW8DxIUpoN6YH3FOJh3jAkY9xrD8SAbSiCcvvyww5L0jcfSt32gc4m
 y1PLE7CmEdsrNQEUrfWzpm498kvtltzHHslNox5jBF+r7KeSlyAJCQPis7I+g/5OIndL
 acRS0apjIZ6AuWtXDBl1HJ8ncruoKpyMC+zFrsfV9K+47ky7X5C5qkaSnP+M/a7yUvc3
 PqJg==
X-Gm-Message-State: AOAM531EJchHljRdUgtAkpFMYVGRDAiQXK6o8CLKfZMgAM95ekrfaUMS
 5iJJDEPf8MgD2KI/y/+1pC2FYEkydhWhog==
X-Google-Smtp-Source: ABdhPJyGciGGw9et/LDhD0OVFvzQ2GCo+zuRJu+zvH+g8ZPAj5GXTzZIVlBvo6IBy27R+VVe9xj0ng==
X-Received: by 2002:aa7:c952:: with SMTP id h18mr5450162edt.18.1628886647213; 
 Fri, 13 Aug 2021 13:30:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:46 -0700 (PDT)
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
Subject: [PATCH 08/11] drm/i915: Use i915_gem_context_get_eb_vm in
 intel_context_set_gem
Date: Fri, 13 Aug 2021 22:30:30 +0200
Message-Id: <20210813203033.3179400-8-daniel.vetter@ffwll.ch>
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
index 1eec85944c1f..18e23d9220ae 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -791,16 +791,8 @@ static int intel_context_set_gem(struct intel_context *ce,
 
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

