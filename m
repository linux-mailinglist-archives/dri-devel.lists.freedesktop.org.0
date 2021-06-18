Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811E3AD48D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728E16EAB1;
	Fri, 18 Jun 2021 21:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497166EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 21:45:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id r9so12214689wrz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 14:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ss+LFnKcGJ5vuvfVFFGPPqAeJlikCEoZrl/m4U6LMRw=;
 b=L0TYh5eNjO3bBlOw+qfm0dAIFyH0pSW2/Y82jXvp+fp0bZIdIiwVH0sjmOtzUJLQP2
 zobnV4rHKddP0MCPZHTfW2Dv1zA7XrVvcj3Rib6xPokdP/KBcXpiRSmGxkh6SFbIh2LS
 2pF4e4Swjzlna/BX/XV8bisbWwSUjFIDzhIQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ss+LFnKcGJ5vuvfVFFGPPqAeJlikCEoZrl/m4U6LMRw=;
 b=JnihiH59Imr4rxJcLRHWAk1Loe8y99zgxaDiyd+vl0i+7ufaIWOJ+05qrVsZUraE6i
 v9Z4Ro/63QGPmu8YqnGGxO3Pr8btKoftfMqWCFxuQq3nmu24OjN/KsQM2gEQbVI60RMa
 0RXF17GPY+qo7hSeUJ8bpklHAmEpNvpHMl6RvcPV3HNRCw+ImvyMdqx5CwrGDksfw95A
 feGf3ielGOeAH7h4/03oV68Vpp/0Xdd7R7/M+XsT2cb3hnh3q57lSfM+ZpFIUmwyW5/Y
 BnWbro1/Oku9w+KNshANgPHm2vxlohIMZ/E/AnTL+khnQ+EH4Wd7pzvw7K28Zzo12kOs
 +iBQ==
X-Gm-Message-State: AOAM530M6HScRmE9LMCbQxvsShBdos7IQDW7v44JrAY1+jja0sIZUHYW
 7njlaDslJgynA5qSBZjkjAQdlg==
X-Google-Smtp-Source: ABdhPJyHNQqJIh/kyvwMAFiH4f8cfBI0Yp6YcdOJaaO10SPVgr3WyRK41gxBwrfIpGuh8LdqIIhrFw==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr14761921wrr.35.1624052708769; 
 Fri, 18 Jun 2021 14:45:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q6sm8311350wma.16.2021.06.18.14.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 14:45:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/i915/eb: Fix pagefault disabling in the first slowpath
Date: Fri, 18 Jun 2021 23:45:03 +0200
Message-Id: <20210618214503.1773805-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In

commit ebc0808fa2da0548a78e715858024cb81cd732bc
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Tue Oct 18 13:02:51 2016 +0100

    drm/i915: Restrict pagefault disabling to just around copy_from_user()

we entirely missed that there's a slow path call to eb_relocate_entry
(or i915_gem_execbuffer_relocate_entry as it was called back then)
which was left fully wrapped by pagefault_disable/enable() calls.
Previously any issues with blocking calls where handled by the
following code:

	/* we can't wait for rendering with pagefaults disabled */
	if (pagefault_disabled() && !object_is_idle(obj))
		return -EFAULT;

Now at this point the prefaulting was still around, which means in
normal applications it was very hard to hit this bug. No idea why the
regressions in igts weren't caught.

Now this all changed big time with 2 patches merged closely together.

First

commit 2889caa9232109afc8881f29a2205abeb5709d0c
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Jun 16 15:05:19 2017 +0100

    drm/i915: Eliminate lots of iterations over the execobjects array

removes the prefaulting from the first relocation path, pushing it into
the first slowpath (of which this patch added a total of 3 escalation
levels). This would have really quickly uncovered the above bug, were
it not for immediate adding a duct-tape on top with

commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Jun 16 15:05:24 2017 +0100

    drm/i915: Async GPU relocation processing

by pushing all all the relocation patching to the gpu if the buffer
was busy, which avoided all the possible blocking calls.

The entire slowpath was then furthermore ditched in

commit 7dc8f1143778a35b190f9413f228b3cf28f67f8d
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Wed Mar 11 16:03:10 2020 +0000

        drm/i915/gem: Drop relocation slowpath

and resurrected in

commit fd1500fcd4420eee06e2c7f3aa6067b78ac05871
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed Aug 19 16:08:43 2020 +0200

        Revert "drm/i915/gem: Drop relocation slowpath".

but this did not further impact what's going on.

Since pagefault_disable/enable is an atomic section, any sleeping in
there is prohibited, and we definitely do that without gpu relocations
since we have to wait for the gpu usage to finish before we can patch
up the relocations.

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
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 6539b82dda54..7ff2fc3c0b2c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2082,9 +2082,7 @@ static noinline int eb_relocate_parse_slow(struct i915_execbuffer *eb,
 
 	list_for_each_entry(ev, &eb->relocs, reloc_link) {
 		if (!have_copy) {
-			pagefault_disable();
 			err = eb_relocate_vma(eb, ev);
-			pagefault_enable();
 			if (err)
 				break;
 		} else {
-- 
2.32.0.rc2

