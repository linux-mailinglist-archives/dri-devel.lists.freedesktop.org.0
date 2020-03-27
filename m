Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C21952AC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 09:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583256E9D0;
	Fri, 27 Mar 2020 08:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CE06E9CE;
 Fri, 27 Mar 2020 08:15:58 +0000 (UTC)
IronPort-SDR: tEenwtmOhG/rizkkIhuvU62dPfcze+ueczhXvm8CjZZcA7ejyuk4ikHlklChXbtwZ2jmofgOY5
 IMa4G7J4WbDw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 01:15:58 -0700
IronPort-SDR: PGLOecfkIQwBKkCb7mcjlvKEMQ2+EDNVQAVlfB2U7ZXSbZK1ydSrHqcQfCHPrz1nMGc50yiuZ4
 ybmiFJ07qtGA==
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="251070860"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 01:15:58 -0700
Date: Fri, 27 Mar 2020 01:16:07 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next-fixes
Message-ID: <20200327081607.GA3082710@intel.com>
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

Hi Dave and Daniel,

Here goes drm-intel-next-fixes-2020-03-27:

Fixes for instability on Baytrail and Haswell;
Ice Lake RPS; Sandy Bridge RC6; and few others around
GT hangchec/reset; livelock; and a null dereference.

Thanks,
Rodrigo.

The following changes since commit cb7adfd6ad12a11902ebe374bec7fd4efa2cec1c:

  Merge tag 'mediatek-drm-next-5.7' of https://github.com/ckhu-mediatek/linux.git-tags into drm-next (2020-03-20 13:08:38 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2020-03-27

for you to fetch changes up to 2bdd4c28baff29163808677a70942de2b45f17dc:

  drm/i915/display: Fix mode private_flags comparison at atomic_check (2020-03-26 10:21:30 -0700)

----------------------------------------------------------------
Fixes for instability on Baytrail and Haswell;
Ice Lake RPS; Sandy Bridge RC6; and few others around
GT hangchec/reset; livelock; and a null dereference.

----------------------------------------------------------------
Chris Wilson (8):
      drm/i915/gt: Restrict gen7 w/a batch to Haswell
      drm/i915/gem: Check for a closed context when looking up an engine
      drm/i915: Use explicit flag to mark unreachable intel_context
      drm/i915/gt: Cancel a hung context if already closed
      drm/i915/gt: Treat idling as a RPS downclock event
      drm/i915: Avoid live-lock with i915_vma_parked()
      drm/i915/gt: Select the deepest available parking mode for rc6
      drm/i915/gt: Stage the transfer of the virtual breadcrumb

Uma Shankar (1):
      drm/i915/display: Fix mode private_flags comparison at atomic_check

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Invalidate OA TLB on when closing perf stream

 drivers/gpu/drm/i915/display/intel_display.c    |  4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_context.c     |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.h     |  8 +++++--
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_context.c         |  2 ++
 drivers/gpu/drm/i915/gt/intel_context.h         |  5 +++++
 drivers/gpu/drm/i915/gt/intel_context_types.h   |  9 ++++----
 drivers/gpu/drm/i915/gt/intel_lrc.c             | 20 ++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_rc6.c             | 10 ++++++++-
 drivers/gpu/drm/i915/gt/intel_reset.c           |  5 +++++
 drivers/gpu/drm/i915/gt/intel_ring_submission.c |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c             | 13 +++++++++++
 drivers/gpu/drm/i915/gt/selftest_rc6.c          | 23 ++++++++++++++++----
 drivers/gpu/drm/i915/i915_perf.c                |  8 +++++++
 drivers/gpu/drm/i915/i915_reg.h                 |  2 ++
 drivers/gpu/drm/i915/i915_vma.c                 | 29 ++++++++++++-------------
 16 files changed, 108 insertions(+), 36 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
