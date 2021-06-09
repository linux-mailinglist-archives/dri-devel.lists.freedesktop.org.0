Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF643A1F08
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE466EB60;
	Wed,  9 Jun 2021 21:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A96EB5A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 21:30:06 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id y11so12670913pgp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1g+3MSiw30ZUG53SUR1grNvQmYDXcp5mEMux+W2ItNw=;
 b=vXCl+inyLEoIZNXOX1L9adRQZG+kNIbgvotkaGq9RGmigo5n7saL4IVd9ZOxN89hYH
 TBOGbYjj+I5eq9jdvSxzZ9cwRjO8vhv5Wwy3VfKp8OHK3Gd98eFKbKn3Dtm51h3QVdAq
 mtMlZVlm2vAdXRu7VQrKU+3e+iTq20aQhmy03hJxbJB+jsFgbym/ntGHmMDWZVGkNST/
 ykj0g8MzL9efrGa+7KzP5gcZcWwUrMPwx63EhOBx4/3cH0vpw2a0F/1A2+Li1O8mGEjH
 QTXGgweeEOOQTvMkqdWUhjiEzt4iPva7LKghMCjFcB+J+dFvbizQSphC2hSljbQ/A8Br
 gdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1g+3MSiw30ZUG53SUR1grNvQmYDXcp5mEMux+W2ItNw=;
 b=TiTFKkIos98wCSs1iwJfQgn6dqJ01yvmZFoImIU1AewHyLymZUr2Kz4aoRX4ijM6Jq
 agYtwfpSsNDXXAjZfFYjJwIjyQKhJIPpZNRj6Ifws2iO4LM/2Y9rNr/ITosjMfSzbCAD
 Y3Jw4GNkEioIjGsN1P00SG6EenzSdnUwQeVSu0FOEpJkn6wMVvc/PqF2Y9y4GJV7AJWk
 /Re1/a+uOxYzdVG1n9eZkxTtrdg1JPgS1o4lq2nGFq4sw0IPsUTocZctEEBEMmG6kvwc
 seRYvpd4eM7MMEmm7CVneBm+G3GHMtYBZioBC9Ks6uBugmdOBFGYjghgI64oRyZz4VvW
 oawA==
X-Gm-Message-State: AOAM533/KTOAAnkuj0rWy9jTL6NRblx/arMGLX7Dy8BSSEIifSEtFJq0
 STJqadZg/tr2OIEorqMAuctqk2rWapj0Tw==
X-Google-Smtp-Source: ABdhPJyps0ZwxR2Raylp8ysOBVlLh4mI6IW82Q3LeixwleDYNNBLXjc30BQrEBjRRr78uyRQavcMrg==
X-Received: by 2002:a05:6a00:2353:b029:2f2:987a:5da2 with SMTP id
 j19-20020a056a002353b02902f2987a5da2mr1742587pfj.58.1623274205229; 
 Wed, 09 Jun 2021 14:30:05 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id u14sm519133pjx.14.2021.06.09.14.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:30:04 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/5] dma-fence,
 i915: Stop allowing SLAB_TYPESAFE_BY_RCU for dma_fence
Date: Wed,  9 Jun 2021 16:29:54 -0500
Message-Id: <20210609212959.471209-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ever since 0eafec6d3244 ("drm/i915: Enable lockless lookup of request
tracking via RCU"), the i915 driver has used SLAB_TYPESAFE_BY_RCU (it
was called SLAB_DESTROY_BY_RCU at the time) in order to allow RCU on
i915_request.  As nifty as SLAB_TYPESAFE_BY_RCU may be, it comes with
some serious disclaimers.  In particular, objects can get recycled while
RCU readers are still in-flight.  This can be ok if everyone who touches
these objects knows about the disclaimers and is careful.  However,
because we've chosen to use SLAB_TYPESAFE_BY_RCU for i915_request and
because i915_request contains a dma_fence, we've leaked
SLAB_TYPESAFE_BY_RCU and its whole pile of disclaimers to every driver
in the kernel which may consume a dma_fence.

We've tried to keep it somewhat contained by doing most of the hard work
to prevent access of recycled objects via dma_fence_get_rcu_safe().
However, a quick grep of kernel sources says that, of the 30 instances
of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
It's likely there bear traps in DRM and related subsystems just waiting
for someone to accidentally step in them.

This patch series stops us using SLAB_TYPESAFE_BY_RCU for i915_request
and, instead, does an RCU-safe slab free via rcu_call().  This should
let us keep most of the perf benefits of slab allocation while avoiding
the bear traps inherent in SLAB_TYPESAFE_BY_RCU.  It then removes support
for SLAB_TYPESAFE_BY_RCU from dma_fence entirely.

Note: The last patch is labled DONOTMERGE.  This was at Daniel Vetter's
request as we may want to let this bake for a couple releases before we
rip out dma_fence_get_rcu_safe entirely.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Jason Ekstrand (5):
  drm/i915: Move intel_engine_free_request_pool to i915_request.c
  drm/i915: Use a simpler scheme for caching i915_request
  drm/i915: Stop using SLAB_TYPESAFE_BY_RCU for i915_request
  dma-buf: Stop using SLAB_TYPESAFE_BY_RCU in selftests
  DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe

 drivers/dma-buf/dma-fence-chain.c         |   8 +-
 drivers/dma-buf/dma-resv.c                |   4 +-
 drivers/dma-buf/st-dma-fence-chain.c      |  24 +---
 drivers/dma-buf/st-dma-fence.c            |  27 +---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |   8 --
 drivers/gpu/drm/i915/i915_active.h        |   4 +-
 drivers/gpu/drm/i915/i915_request.c       | 147 ++++++++++++----------
 drivers/gpu/drm/i915/i915_request.h       |   2 -
 drivers/gpu/drm/i915/i915_vma.c           |   4 +-
 include/drm/drm_syncobj.h                 |   4 +-
 include/linux/dma-fence.h                 |  50 --------
 include/linux/dma-resv.h                  |   4 +-
 13 files changed, 110 insertions(+), 180 deletions(-)

-- 
2.31.1

