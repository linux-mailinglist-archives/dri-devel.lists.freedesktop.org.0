Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C312627F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 13:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1A26EB63;
	Thu, 19 Dec 2019 12:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C346EB62;
 Thu, 19 Dec 2019 12:46:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 04:46:41 -0800
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; d="scan'208";a="210450887"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.11.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 04:46:38 -0800
Date: Thu, 19 Dec 2019 14:46:35 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20191219124635.GA16068@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

Another -rc, another CI fire due to regressions elsewhere.

Our CI needed the following patches to get machines boot with -rc2:

	Revert "devtmpfs: use do_mount() instead of ksys_mount()"
	(commit 5e787dbf659fe77d56215be74044f85e01b3920f)

	Revert "initrd: use do_mount() instead of ksys_mount()"
	(commit d4440aac83d12f87df9bcc51e992b9c28c7f4fa5)

	Revert "init: use do_mount() instead of ksys_mount()"
	(commit cccaa5e33525fc07f4a2ce0518e50b9ddf435e47)

I have queued CI_DIF_433 with this PR contents + reverts to get any
CI results:

https://intel-gfx-ci.01.org/tree/drm-intel-fixes/CI_DIF_433/git-log.txt

Nothing appears in the UI for the failed-to-boot runs, so don't be
confused. CI_DIF_433 is equal to this PR + 3 reverts needed to mitigate
the -rc2 regressions.

Due to the CI fires, it may take a while to get the full results. Due to
my holidays, I'll defer to Chris to let you know if the results are good
or not. There have been some GEM bugs tackled in drm-tip, so have to make
sure they are under control.

Now on to the actual content of the PR:

Removal of a unused and harmful display W/A for Tigerlake, corrections
to powerwells of EHL compared to ICL, and MMIO offset fix for DSB. There
is a fix for uninitialized ops in dma_fence tracing and then fixes
for CI corner cases from CI.

Also includes GVT fixes: "fix for vGPU display dmabuf, one guest reset
warning and one locking issue."

Jani/Rodrigo promised to handle -fixes for next two weeks if there is
something urgent appearing.

Happy Holidays!

Regards, Joonas

***

drm-intel-fixes-2019-12-19:

- Fix to drop an unused and harmful display W/A
- Fix to define EHL power wells independent of ICL
- Fix for priority inversion on bonded requests
- Fix in mmio offset calculation of DSB instance
- Fix memory leak from get_task_pid when banning clients
- Fixes to avoid dereference of uninitialized ops in dma_fence tracing
  and keep reference to execbuf object until submitted.

- Includes gvt-fixes-2019-12-18

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2019-12-19

for you to fetch changes up to 78d75f5739c457ff37cfe5adab1c01bc1f3375e2:

  Merge tag 'gvt-fixes-2019-12-18' of https://github.com/intel/gvt-linux into drm-intel-fixes (2019-12-18 11:01:41 +0200)

----------------------------------------------------------------
- Fix to drop an unused and harmful display W/A
- Fix to define EHL power wells independent of ICL
- Fix for priority inversion on bonded requests
- Fix in mmio offset calculation of DSB instance
- Fix memory leak from get_task_pid when banning clients
- Fixes to avoid dereference of uninitialized ops in dma_fence tracing
  and keep reference to execbuf object until submitted.

- Includes gvt-fixes-2019-12-18

----------------------------------------------------------------
Animesh Manna (1):
      drm/i915/dsb: Fix in mmio offset calculation of DSB instance

Chris Wilson (3):
      drm/i915: Copy across scheduler behaviour flags across submit fences
      drm/i915: Set fence_work.ops before dma_fence_init
      drm/i915/gem: Keep request alive while attaching fences

Gao Fred (1):
      drm/i915/gvt: Fix guest boot warning

Joonas Lahtinen (1):
      Merge tag 'gvt-fixes-2019-12-18' of https://github.com/intel/gvt-linux into drm-intel-fixes

Matt Roper (2):
      drm/i915/ehl: Define EHL powerwells independently of ICL
      drm/i915/tgl: Drop Wa#1178

Tina Zhang (1):
      drm/i915/gvt: Pin vgpu dma address before using

Tvrtko Ursulin (1):
      drm/i915: Fix pid leak with banned clients

Vandita Kulkarni (1):
      drm/i915: Fix WARN_ON condition for cursor plane ddb allocation

Zhenyu Wang (2):
      drm/i915/gvt: use vgpu lock for active state setting
      drm/i915/gvt: set guest display buffer as readonly

 drivers/gpu/drm/i915/display/intel_display_power.c | 153 ++++++++++++++++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   2 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                  |  64 ++++++++-
 drivers/gpu/drm/i915/gvt/handlers.c                |  16 +++
 drivers/gpu/drm/i915/gvt/hypercall.h               |   2 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  23 ++++
 drivers/gpu/drm/i915/gvt/mpt.h                     |  15 ++
 drivers/gpu/drm/i915/gvt/vgpu.c                    |   4 +-
 drivers/gpu/drm/i915/i915_reg.h                    |   6 +-
 drivers/gpu/drm/i915/i915_request.c                | 114 +++++++++++----
 drivers/gpu/drm/i915/i915_scheduler.c              |   1 -
 drivers/gpu/drm/i915/i915_sw_fence_work.c          |   3 +-
 drivers/gpu/drm/i915/intel_pm.c                    |   4 +-
 14 files changed, 365 insertions(+), 45 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
