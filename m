Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8536EFE3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61016F450;
	Thu, 29 Apr 2021 19:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC466F44F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:03:46 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so408402pjb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I26nFk1GioOxpCA08KAlp5FxV9kKvoKs0psEEqnYpJ4=;
 b=C7LYns9utX2d6gyttXWxB6ZGqS7owrdD90shl+2SLx7iSfQfLyb+a3ZnFG4zycQpeC
 ETBM9PQPAd1M2m6PuhZAHZR053yaYUIl5Bq7fW7EGYUR0voKW03VfcCkwA2YNHFT1EXk
 h1/+vEtY7jVFHyM9Gc/jpT50vL1OXEuBPp+1zjghd2Lz1wuivLpFKVXXYCCO8OSt9kkZ
 0sB1BCu/uJ+i2tm3seK7ZxA8o8yy+2bEAv7lvDP01puXMmjd+lofrU/ulomNolAHbCUW
 zXA1tyKaVl1YqgciUy9D6yjaGmZ/9k2ZRauhTlLuSStwfi7l832l82T73rVIBv2NyDkS
 TR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I26nFk1GioOxpCA08KAlp5FxV9kKvoKs0psEEqnYpJ4=;
 b=NnQKAaTp+n7CKGvFk8s0zy/EiIBPZ7+NSAtJGzuU/PUWex8uE2WEHb+2/Ve/kD7LX9
 pKEp/ixdejcqfU5mjD6mEmSOokVVoShhpEOJhyBJ5lFYnlASTonNuYrO5Iyj7gVo7Ymu
 tjVr+Ukv0oi+lKAZRkE4ekvGrmTSiUxY2qa2yPIy4M6GZU9YFuO6LdC73D3BEwYhoCVx
 6CEsOFvZLFL2rRm+UhhzU2VOA8W4bPIeC7Ef/AFOaKoN7g9vbZvjYQo7MogbNKy+rlpZ
 rS3Q805Fhccz5zn0piNHc8jK4uPspoeZ62d1r/Ohswx6RuVS0MeEpLwSe+Vm1lupodq1
 WC/w==
X-Gm-Message-State: AOAM5304d/01cQGqPNaX5I/zMBXTRXmiznWe++/93Jo6r7kMaWtbKPom
 8/dyg795s+PvKuo+Hzhf5ZT6+kuRanYWsQ==
X-Google-Smtp-Source: ABdhPJyf26q5iyQzjCkBZJk0S1vm4bx19Lc4UNF3HUzbc5p/TkX8PAcdtMHdEOLkSyxGqnlWhxSxtw==
X-Received: by 2002:a17:90a:fa8f:: with SMTP id
 cu15mr1399904pjb.216.1619723025577; 
 Thu, 29 Apr 2021 12:03:45 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:03:44 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/25] drm/i915/gem: ioctl clean-ups (v4)
Date: Thu, 29 Apr 2021 14:03:15 -0500
Message-Id: <20210429190340.1555632-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overview:
---------

This patch series attempts to clean up some of the IOCTL mess we've created
over the last few years.  The most egregious bit being context mutability.
In summary, this series:

 1. Drops two never-used context params: RINGSIZE and NO_ZEROMAP
 2. Drops the entire CONTEXT_CLONE API
 3. Implements SINGLE_TIMELINE with a syncobj instead of actually sharing
    intel_timeline between engines.
 4. Adds a few sanity restrictions to the balancing/bonding API.
 5. Implements a proto-ctx mechanism so that the engine set and VM can only
    be set early on in the lifetime of a context, before anything ever
    executes on it.  This effectively makes the VM and engine set
    immutable.

This series has been tested with IGT as well as the Iris, ANV, and the
Intel media driver doing an 8K decode (this uses bonding/balancing).  I've
also done quite a bit of git archeology to ensure that nothing in here will
break anything that's already shipped at some point in history.  It's
possible I've missed something, but I've dug quite a bit.


Details and motivation:
-----------------------

In very broad strokes, there's an effort going on right now within Intel to
try and clean up and simplify i915 anywhere we can.  We obviously don't
want to break any shipping userspace but, as can be seen by this series,
there's a lot i915 theoretically supports which userspace doesn't actually
need.  Some of this, like the two context params used here, were simply
oversights where we went through the usual API review process and merged
the i915 bits but the userspace bits never landed for some reason.

Not all are so innocent, however.  For instance, there's an entire context
cloning API which allows one to create a context with certain parameters
"cloned" from some other context.  This entire API has never been used by
any userspace except IGT and there were never patches to any other
userspace to use it.  It never should have landed.  Also, when we added
support for setting explicit engine sets and sharing VMs across contexts,
people decided to do so via SET_CONTEXT_PARAM.  While this allowed them to
re-use existing API, it did so at the cost of making those states mutable
which leads to a plethora of potential race conditions.  There were even
IGT tests merged to cover some of theses:

 - gem_vm_create@async-destroy and gem_vm_create@destroy-race which test
   swapping out the VM on a running context.

 - gem_ctx_persistence@replace* which test whether a client can escape a
   non-persistent context by submitting a hanging batch and then swapping
   out the engine set before the hang is detected.

 - api_intel_bb@bb-with-vm which tests the that intel_bb_assign_vm works
   properly.  This API is never used by any other IGT test.

There is also an entire deferred flush and set state framework in
i915_gem_cotnext.c which exists for safely swapping out the VM while there
is work in-flight on a context.

So, clearly people knew that this API was inherently racy and difficult to
implement but they landed it anyway.  Why?  The best explanation I've been
given is because it makes the API more "unified" or "symmetric" for this
stuff to go through SET_CONTEXT_PARAM.  It's not because any userspace
actually wants to be able to swap out the VM or the set of engines on a
running context.  That would be utterly insane.

This patch series cleans up this particular mess by introducing the concept
of a i915_gem_proto_context data structure which contains context creation
information.  When you initially call GEM_CONTEXT_CREATE, a proto-context
in created instead of an actual context.  Then, the first time something is
done on the context besides SET_CONTEXT_PARAM, an actual context is
created.  This allows us to keep the old drivers which use
SET_CONTEXT_PARAM to set up the engine set (see also media) while ensuring
that, once you have an i915_gem_context, the VM and the engine set are
immutable state.

Eventually, there are more clean-ups I'd like to do on top of this which
should make working with contexts inside i915 simpler and safer:

 1. Move the GEM handle -> vma LUT from i915_gem_context into either
    i915_ppgtt or drm_i915_file_private depending on whether or not the
    hardware has a full PPGTT.

 2. Move the delayed context destruction code into intel_context or a
    per-engine wrapper struct rather than i915_gem_context.

 3. Get rid of the separation between context close and context destroy

 4. Get rid of the RCU on i915_gem_context

However, these should probably be done as a separate patch series as this
one is already starting to get longish, especially if you consider the 89
IGT patches that go along with it.

Test-with: 20210423214853.876911-1-jason@jlekstrand.net

Jason Ekstrand (25):
  drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
  drm/i915: Stop storing the ring size in the ring pointer
  drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
  drm/i915/gem: Set the watchdog timeout directly in
    intel_context_set_gem (v2)
  drm/i915/gem: Return void from context_apply_all
  drm/i915: Drop the CONTEXT_CLONE API
  drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
  drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES
  drm/i915/gem: Disallow bonding of virtual engines (v3)
  drm/i915/gem: Remove engine auto-magic with FENCE_SUBMIT
  drm/i915/request: Remove the hook from await_execution
  drm/i915/gem: Disallow creating contexts with too many engines
  drm/i915: Stop manually RCU banging in reset_stats_ioctl (v2)
  drm/i915/gem: Add a separate validate_priority helper
  drm/i915: Add gem/i915_gem_context.h to the docs
  drm/i915/gem: Add an intermediate proto_context struct
  drm/i915/gem: Use the proto-context to handle create parameters
  drm/i915/gem: Return an error ptr from context_lookup
  drm/i915/gt: Drop i915_address_space::file (v2)
  drm/i915/gem: Delay context creation
  drm/i915/gem: Don't allow changing the VM on running contexts
  drm/i915/gem: Don't allow changing the engine set on running contexts
  drm/i915/selftests: Take a VM in kernel_context()
  i915/gem/selftests: Assign the VM at context creation in
    igt_shared_ctx_exec
  drm/i915/gem: Roll all of context creation together

 Documentation/gpu/i915.rst                    |    2 +
 drivers/gpu/drm/i915/Makefile                 |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 2978 +++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |    3 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  192 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   31 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  127 +-
 .../gpu/drm/i915/gem/selftests/mock_context.c |   63 +-
 .../gpu/drm/i915/gem/selftests/mock_context.h |    4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |    3 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |    5 -
 drivers/gpu/drm/i915/gt/intel_context_param.c |   63 -
 drivers/gpu/drm/i915/gt/intel_context_param.h |    6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |    7 -
 .../drm/i915/gt/intel_execlists_submission.c  |  114 -
 .../drm/i915/gt/intel_execlists_submission.h  |    7 -
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   11 -
 drivers/gpu/drm/i915/gt/intel_lrc.c           |    2 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  251 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |    2 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |    7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   30 +-
 drivers/gpu/drm/i915/i915_perf.c              |    4 +-
 drivers/gpu/drm/i915/i915_request.c           |   42 +-
 drivers/gpu/drm/i915/i915_request.h           |    4 +-
 .../drm/i915/selftests/i915_mock_selftests.h  |    1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |    1 -
 include/uapi/drm/i915_drm.h                   |   40 +-
 31 files changed, 1584 insertions(+), 2422 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
