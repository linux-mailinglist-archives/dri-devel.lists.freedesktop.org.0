Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3DF3FEF56
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E26E58B;
	Thu,  2 Sep 2021 14:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4BE6E581
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 14:21:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1490826wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N4wPVPyBecvwRFld+uitLPXJoYdixYmJlAF+KwwPizE=;
 b=VtMmJOprd6xlORttLLAuvmRZSWS8P9shxNMb0Ot5FiFnJHu9wICE43zfAkPt+7G7uo
 w3jmHJuG719UFu/MkbNk1q59xo5djvkiAT+HCwMnBA1SumGJYPg+RKOr/DCZXAXHIcDu
 Idm50G1EffdfI60trEuPR90udhPnHpmaoOwgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N4wPVPyBecvwRFld+uitLPXJoYdixYmJlAF+KwwPizE=;
 b=E0DH+6ixfE7XjPu0dA1we6Oa6fqgowhH8+0/Tbi434GaQfGrwM3LB+CZmKpnvjySvM
 iFnzs8Mfo+jCZ/ehzZ8pPDXu6gxDdxsPTorZlpLGW72kEJbu+ynG/tyjZTJ48mm1yoO4
 /3jRv5q2u4lyeWPPW1uiWNlhevmJ8ALlVOOZf0HQy6KB2pF5MWhsniPnk82YUabWP4F+
 99fH6ElaNSSB4+F60H1J/B57M0gD5Qp9Wl/Okc/ZUdZ1IJO9LARzVwg3IcsiK8pKAvyC
 aznOe9+LWPwr9eKZ406l2nB7tvveSgVJjUeDazTivGhBkerUucGqkzRqiIB5TrfiJR76
 r36g==
X-Gm-Message-State: AOAM5339CJ0ddCUhNtAIrGse/S4MTunEoF3NxDI+vMT0WRpRb3bYLvnU
 UIfaEcRct+Q23SHlKm9J4rPDvPVzsXDWwg==
X-Google-Smtp-Source: ABdhPJyR2uas7E1wYZEjzZtvTb9nomtvVGP8X4pCYKt4jDR1decniPdT6QD9rXLkDg806Pi5qXWlIQ==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr3400942wmg.108.1630592475044; 
 Thu, 02 Sep 2021 07:21:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l2sm1841811wmi.1.2021.09.02.07.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 07:21:14 -0700 (PDT)
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
Subject: [PATCH 08/11] drm/i915: Use i915_gem_context_get_eb_vm in
 intel_context_set_gem
Date: Thu,  2 Sep 2021 16:20:54 +0200
Message-Id: <20210902142057.929669-8-daniel.vetter@ffwll.ch>
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
2.33.0

