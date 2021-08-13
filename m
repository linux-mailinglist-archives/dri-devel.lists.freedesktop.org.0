Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34C3EBD56
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565D6E8D6;
	Fri, 13 Aug 2021 20:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D5B6E8D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:30:43 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b7so17200526edu.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tzQoJk2Vxo3bdO8JMvHymsLoOVGe9IUEBg7fmejmSM=;
 b=E4xfGf+kkRkDDhWKr20asokxo+TwFXhbpjwT92tHle5Tav8BBh3RJNFRc/sGl5/Qz1
 +8RQ0o3IC6fJ6lci+4vo8GDKXnOfgTeG+c1B080igyQ6pnAFt4sG+9DdHhWpOMQqeLE1
 rb2uCbzSfeWKXjPllWJrNvrIax2vmeit/He9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tzQoJk2Vxo3bdO8JMvHymsLoOVGe9IUEBg7fmejmSM=;
 b=niWtyu0Ox+Qa9H4SCLgMeNvtNAlTEVkHLChTKP8XrULQB/VHXgNkL6+Ed24jvyMldl
 dhwdCcls6V49+qWPKU9vsiS4akXJ+8qFGLGkExt70BOxjYZ3uivn/Qjc0TKJP+tn4/8W
 ODSxTTjT5q6T4FAhNxAg+dJ+fPeaE2mLtIAke/6j0Qg7HLB3YvfRWzAWW2k0Len4GKZW
 tRUToJloPDZNy5c9lkQrk8KJMi0RmM8dOOEFiZdOjEamWuT8StDo55qX3IqaLifjYc21
 RPSXtupmsE573rQHPgaXBFrqcDxqNx9qLPm2z/EW8FzoDHRGgdhOpDLazISJA76TCNiD
 nh3g==
X-Gm-Message-State: AOAM532UXX+GObzBXEp4HYrVy1BR87jKBkRFKliUNdYQYwXSzaNMGRQL
 5EuDk+lXrYztKRcHgDxuNhqp8Y+ZTw++wQ==
X-Google-Smtp-Source: ABdhPJyHwb0nDIsdVRzzydLDO7+timEIsg3kAQVTYQkX0GjtKt0x6Q556BGtINF0J0mPtEmhAqGTDQ==
X-Received: by 2002:a05:6402:445:: with SMTP id
 p5mr5385530edw.208.1628886642004; 
 Fri, 13 Aug 2021 13:30:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm1347027edv.51.2021.08.13.13.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:30:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH 02/11] drm/i915: Release ctx->syncobj on final put,
 not on ctx close
Date: Fri, 13 Aug 2021 22:30:24 +0200
Message-Id: <20210813203033.3179400-2-daniel.vetter@ffwll.ch>
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

gem context refcounting is another exercise in least locking design it
seems, where most things get destroyed upon context closure (which can
race with anything really). Only the actual memory allocation and the
locks survive while holding a reference.

This tripped up Jason when reimplementing the single timeline feature
in

commit 00dae4d3d35d4f526929633b76e00b0ab4d3970d
Author: Jason Ekstrand <jason@jlekstrand.net>
Date:   Thu Jul 8 10:48:12 2021 -0500

    drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)

We could fix the bug by holding ctx->mutex in execbuf and clear the
pointer (again while holding the mutex) context_close, but it's
cleaner to just make the context object actually invariant over its
_entire_ lifetime. This way any other ioctl that's potentially racing,
but holding a full reference, can still rely on ctx->syncobj being
an immutable pointer. Which without this change, is not the case.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Fixes: 00dae4d3d35d ("drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)")
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
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 051bc357ff65..5a053cf14948 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -994,6 +994,9 @@ static void i915_gem_context_release_work(struct work_struct *work)
 	trace_i915_context_free(ctx);
 	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
 
+	if (ctx->syncobj)
+		drm_syncobj_put(ctx->syncobj);
+
 	mutex_destroy(&ctx->engines_mutex);
 	mutex_destroy(&ctx->lut_mutex);
 
@@ -1220,9 +1223,6 @@ static void context_close(struct i915_gem_context *ctx)
 	if (vm)
 		i915_vm_close(vm);
 
-	if (ctx->syncobj)
-		drm_syncobj_put(ctx->syncobj);
-
 	ctx->file_priv = ERR_PTR(-EBADF);
 
 	/*
-- 
2.32.0

