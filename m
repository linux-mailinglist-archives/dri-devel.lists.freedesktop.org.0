Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21C3DDCB3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675A16E02C;
	Mon,  2 Aug 2021 15:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD74D6E02C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 15:48:38 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y7so22863067eda.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Je1GkPMHTo+2u31ib2roEhUY3F7SuIQc0J7TjsVwWiE=;
 b=JtER75F4sNtYTnisUXWM1Jpt8fpK4oFJWMPbt6n0NdDtc8HJg0oxyl0jacevLFg1ZW
 wjKyGJLcufdeHBmqYBRijdG+Mm/2CIEtlwzYGQmRM7NU9Yko5cgXavaNlnBslZ8VDfsY
 VrsXdrKE2zc6eq0nYLazSmnAnc1aBL4PSaJm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Je1GkPMHTo+2u31ib2roEhUY3F7SuIQc0J7TjsVwWiE=;
 b=mAUSX/FMiMTkcFAj7jpeykxfvC82FA7KlAKPXoqUs3Z4EI8IkFl4IfU7u4H5hSKPeF
 vmfoI3KvyLBSkN3/HRLgY39/piORuETXGYjreMnQR1rR0OV8XMUvObTffL2iH5Eh8v5B
 Zzl0mg51GfLWvzlKIFmzGFjeMXkua6QwBvZALNCeAGQCs4UDKYMQU5Y6nakG1ei9kolE
 gqf6ETWA8pVcQI5l9EsRzgGtC09zX3tKJQaMK0Jon+YoGijWp3/vzNi1F4mRLMxqkWVC
 8yVLmFKC/ZF9dqn/1PM+yLWl4EBQpWDW8K5eMXpLY4jnsyGM2j0aElGK7uOXWFnomhZV
 57nA==
X-Gm-Message-State: AOAM531qdEvoNC7/2pNSmi+HxM7/Z3d+VSPnDRs+3rxbGHG9f1LcJceo
 OxgzYtjFG/uZ0qLKQH/RmFRqbXcn5bcnXA==
X-Google-Smtp-Source: ABdhPJwD+GXYZNG8bHj/JTxK0aWduPIq/XEPD1FJQVGwUm9G3cmAudeX0rz7bTeVxC31HifIm4M3Yw==
X-Received: by 2002:aa7:df09:: with SMTP id c9mr20488180edy.379.1627919317232; 
 Mon, 02 Aug 2021 08:48:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m20sm5064020edv.67.2021.08.02.08.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:48:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 0/9] remove rcu support from i915_address_space
Date: Mon,  2 Aug 2021 17:47:57 +0200
Message-Id: <20210802154806.3710472-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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

Hi all,

Jason wanted to do that as part of the scheduler series, but I object
since rcu is very, very hard to review when adding, and much, much harder
even to review when removing.

This is because simply looking for __rcu pointer annotations and rcu
functions isn't enough, rcu is also relied upon in many datastructures
which have internally and rcu_read_lock protection (or at least the
required amount of barriers), like xarray.

The other problem is that it inherits when chasing pointers, e.g.
i915_gem_engines has an rcu pointer to intel_context, which has a non-rcu
pointer to i915_address_space. But since we could look-up the entire chain
under rcu i.e. engines->context[i]->vm this means more code to audit.

The audit explodes pretty quickly.

Anyway I'm reasonable confident I got them all in the current code, and
slightly less confident that I managed to stitch together the full
history.

References to relevant commits throughout the series.

Cheers, Daniel

Daniel Vetter (9):
  drm/i915: Drop code to handle set-vm races from execbuf
  drm/i915: Rename i915_gem_context_get_vm_rcu to
    i915_gem_context_get_eb_vm
  drm/i915: Use i915_gem_context_get_eb_vm in ctx_getparam
  drm/i915: Add i915_gem_context_is_full_ppgtt
  drm/i915: Use i915_gem_context_get_eb_vm in intel_context_set_gem
  drm/i915: Drop __rcu from gem_context->vm
  drm/i915: use xa_lock/unlock for fpriv->vm_xa lookups
  drm/i915: Stop rcu support for i915_address_space
  drm/i915: Split out intel_context_create_user

 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 82 ++++---------------
 drivers/gpu/drm/i915/gem/i915_gem_context.h   | 13 ++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 12 ++-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  8 +-
 .../drm/i915/gem/selftests/i915_gem_context.c | 32 +++-----
 .../gpu/drm/i915/gem/selftests/mock_context.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.c       | 22 ++++-
 drivers/gpu/drm/i915/gt/intel_context.h       |  2 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  1 -
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  6 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  4 +-
 drivers/gpu/drm/i915/i915_trace.h             |  2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |  4 +-
 18 files changed, 79 insertions(+), 123 deletions(-)

-- 
2.32.0

