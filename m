Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7533C164B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F7C6E8CB;
	Thu,  8 Jul 2021 15:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53B46E8CB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:38 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 l17-20020a9d6a910000b029048a51f0bc3cso6250341otq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jzX+RB1AK+aygzL7WNQUE1ei/Ta1JhK8/OtdEESflc=;
 b=Zm6hWRdYPAvuSqWbFe5WiNbCuZda8s7yJS2lf6kC8L57cjzCsb61F3Gf1s7yB7DSXs
 KXjVc92aTtfsGvGI5xNOFDDFlOUy7D/rTVYkNOW6RFm9w+1d8ahqx3/OgoLlCst4hv+q
 UQpGGXX1KgxXd/2zlUA2FNKARYvelaeh8DYkC+4Y9bMoEEuBYDbFNTlx87jnkijHHPuC
 /ASLdt5XUnbPVfKpUKQzzPIZhcEKnZOSZfQey+mBqdtL+j98YDMuLbx5OoeCI6YAPSCh
 36s7+r5OqxMGTszginmhAKS7ZaDYupPOtHiH9VEkw5ItJdZiq+T9wEbQ8Rb/absg3eUc
 n7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7jzX+RB1AK+aygzL7WNQUE1ei/Ta1JhK8/OtdEESflc=;
 b=HvHxV4b5mpFkYKi68enw1eXU/OCgch5/+qVgM9KdCFgD82zEAJGwfvFlaUfDP0yqVO
 VMgYcJAn7gsQeEj9Zdl8kBoM3/fsgymdEHelK5oUxo8oe6QQiKQda0dC2vIBlOu978Up
 yqzKXiXgfay77+96q0n1Y2sWCUfxXzIiLIXwFB4haZ138Tmk1hGzYJVDPY0MDYWZdMov
 vSd7vRNAWinCe+LmSRHSp12Sgpi1MZ8ppcNhEN7zoKNO+RLYQxFMEvq2Gxgv1szwiXqJ
 nDwFvxZ1+UxihbJgSFFOuO7BlMWxTWjqbKBgMQUzzFLXqI70JW7Jd8yCscVgz/rJt5WV
 E4IQ==
X-Gm-Message-State: AOAM5300LsxUIyraXevqx4pj9aXbmgkVTKZe3/U7rZEp9tSlXS+C2HY+
 KuKE2LjUaeHTFI6dvqQhUTokdA==
X-Google-Smtp-Source: ABdhPJzsP4EYdW0uL23OnerHD07y9AafqbhovirTnPbElpaw5DnQTd6w1A1rTGr8gFnNqFB5cXMdZw==
X-Received: by 2002:a9d:7f0d:: with SMTP id j13mr993147otq.322.1625759317783; 
 Thu, 08 Jul 2021 08:48:37 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/30] drm/i915/gem: ioctl clean-ups (v9)
Date: Thu,  8 Jul 2021 10:48:05 -0500
Message-Id: <20210708154835.528166-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
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

Test-with: 20210707210215.351483-1-jason@jlekstrand.net

Jason Ekstrand (30):
  drm/i915: Drop I915_CONTEXT_PARAM_RINGSIZE
  drm/i915: Stop storing the ring size in the ring pointer (v3)
  drm/i915: Drop I915_CONTEXT_PARAM_NO_ZEROMAP
  drm/i915/gem: Set the watchdog timeout directly in
    intel_context_set_gem (v2)
  drm/i915/gem: Return void from context_apply_all
  drm/i915: Drop the CONTEXT_CLONE API (v2)
  drm/i915: Implement SINGLE_TIMELINE with a syncobj (v4)
  drm/i915: Drop getparam support for I915_CONTEXT_PARAM_ENGINES
  drm/i915/gem: Disallow bonding of virtual engines (v3)
  drm/i915/gem: Remove engine auto-magic with FENCE_SUBMIT (v2)
  drm/i915/request: Remove the hook from await_execution
  drm/i915/gem: Disallow creating contexts with too many engines
  drm/i915: Stop manually RCU banging in reset_stats_ioctl (v2)
  drm/i915/gem: Add a separate validate_priority helper
  drm/i915: Add gem/i915_gem_context.h to the docs
  drm/i915/gem: Add an intermediate proto_context struct (v5)
  drm/i915/gem: Rework error handling in default_engines
  drm/i915/gem: Optionally set SSEU in intel_context_set_gem
  drm/i915: Add an i915_gem_vm_lookup helper
  drm/i915/gem: Make an alignment check more sensible
  drm/i915/gem: Use the proto-context to handle create parameters (v5)
  drm/i915/gem: Return an error ptr from context_lookup
  drm/i915/gt: Drop i915_address_space::file (v2)
  drm/i915/gem: Delay context creation (v3)
  drm/i915/gem: Don't allow changing the VM on running contexts (v4)
  drm/i915/gem: Don't allow changing the engine set on running contexts
    (v3)
  drm/i915/selftests: Take a VM in kernel_context()
  i915/gem/selftests: Assign the VM at context creation in
    igt_shared_ctx_exec
  drm/i915/gem: Roll all of context creation together
  drm/i915: Finalize contexts in GEM_CONTEXT_CREATE on version 13+

 Documentation/gpu/i915.rst                    |    2 +
 drivers/gpu/drm/i915/Makefile                 |    1 -
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 2926 ++++++++---------
 drivers/gpu/drm/i915/gem/i915_gem_context.h   |    3 +
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  196 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   31 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |  127 +-
 .../gpu/drm/i915/gem/selftests/mock_context.c |   67 +-
 .../gpu/drm/i915/gem/selftests/mock_context.h |    4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |    3 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |    5 -
 drivers/gpu/drm/i915/gt/intel_context_param.c |   63 -
 drivers/gpu/drm/i915/gt/intel_context_param.h |    6 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |    1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |    3 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |    7 -
 .../drm/i915/gt/intel_execlists_submission.c  |  114 -
 .../drm/i915/gt/intel_execlists_submission.h  |    8 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   11 -
 drivers/gpu/drm/i915/gt/intel_lrc.c           |    2 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c       |    3 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  251 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |    2 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |    2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |    2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |    7 +-
 drivers/gpu/drm/i915/i915_drv.h               |   82 +-
 drivers/gpu/drm/i915/i915_perf.c              |    4 +-
 drivers/gpu/drm/i915/i915_request.c           |   42 +-
 drivers/gpu/drm/i915/i915_request.h           |    4 +-
 .../drm/i915/selftests/i915_mock_selftests.h  |    1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |    1 -
 include/uapi/drm/i915_drm.h                   |   40 +-
 33 files changed, 1681 insertions(+), 2340 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/gt/intel_context_param.c

-- 
2.31.1

