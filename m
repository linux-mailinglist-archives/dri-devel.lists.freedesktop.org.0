Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00C1828BE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 07:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2536E07B;
	Thu, 12 Mar 2020 06:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E526E071;
 Thu, 12 Mar 2020 06:07:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 23:07:47 -0700
X-IronPort-AV: E=Sophos;i="5.70,543,1574150400"; d="scan'208";a="236709824"
Received: from elsaidmo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.39.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 23:07:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
Subject: [PULL] drm-intel-fixes
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 12 Mar 2020 08:08:03 +0200
Message-ID: <87lfo6ksvw.fsf@intel.com>
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
Cc: , dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Dave & Daniel -

Normally I'd like to be slowing down on the fixes by now, but apart from
the GVT fixes these are all cc: stable GPU fixes. No reason to postpone.

BR,
Jani.


drm-intel-fixes-2020-03-12:
drm/i915 fixes for v5.6-rc6:
- hard lockup fix
- GVT fixes
- 32-bit alignment issue fix
- timeline wait fixes
- cacheline_retire and free

BR,
Jani.

The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-03-12

for you to fetch changes up to 14a0d527a479eb2cb6067f9e5e163e1bf35db2a9:

  drm/i915: Defer semaphore priority bumping to a workqueue (2020-03-11 23:12:39 +0200)

----------------------------------------------------------------
drm/i915 fixes for v5.6-rc6:
- hard lockup fix
- GVT fixes
- 32-bit alignment issue fix
- timeline wait fixes
- cacheline_retire and free

----------------------------------------------------------------
Chris Wilson (5):
      drm/i915: Actually emit the await_start
      drm/i915: Return early for await_start on same timeline
      drm/i915/execlists: Enable timeslice on partial virtual engine dequeue
      drm/i915/gt: Close race between cacheline_retire and free
      drm/i915: Defer semaphore priority bumping to a workqueue

Jani Nikula (1):
      Merge tag 'gvt-fixes-2020-03-10' of https://github.com/intel/gvt-linux into drm-intel-fixes

Matthew Auld (1):
      drm/i915: be more solid in checking the alignment

Tina Zhang (2):
      drm/i915/gvt: Fix emulated vbt size issue
      drm/i915/gvt: Fix dma-buf display blur issue on CFL

Zhenyu Wang (1):
      drm/i915/gvt: Fix unnecessary schedule timer when no vGPU exits

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  3 ++-
 drivers/gpu/drm/i915/gt/intel_lrc.c            | 29 ++++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_timeline.c       |  8 +++++--
 drivers/gpu/drm/i915/gvt/display.c             |  3 ++-
 drivers/gpu/drm/i915/gvt/opregion.c            |  5 ++---
 drivers/gpu/drm/i915/gvt/vgpu.c                | 12 ++++++++---
 drivers/gpu/drm/i915/i915_request.c            | 28 ++++++++++++++++++-------
 drivers/gpu/drm/i915/i915_request.h            |  2 ++
 drivers/gpu/drm/i915/i915_utils.h              |  5 +++++
 9 files changed, 66 insertions(+), 29 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
