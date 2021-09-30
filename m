Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854541DFE4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252D76EC2C;
	Thu, 30 Sep 2021 17:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E2C89AB6;
 Thu, 30 Sep 2021 17:17:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247788928"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="247788928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="520489378"
Received: from dboland-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.223.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:17 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: [RFC 0/6] CPU + GPU synchronised priority scheduling
Date: Thu, 30 Sep 2021 18:15:46 +0100
Message-Id: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This is a somewhat early sketch of one of my ideas intended for early feedback
from the core scheduler experts. First and last two patches in the series are
the most interesting ones for people outside of i915. (Note I did not copy
everyone on all patches but just the cover letter for context and the rest
should be available from the mailing list.)

General idea is that current processing landscape seems to be more and more
composed of pipelines where computations are done on multiple hardware devices.
Furthermore some of the non-CPU devices, like in this case many GPUs supported
by the i915 driver, actually support priority based scheduling which is
currently rather inaccesible to the user (in terms of being able to control it
from the outside).

From these two statements a question arises on how to allow for a simple,
effective and consolidated user experience. In other words why user would not be
able to do something like:

 $ nice ffmmpeg ...transcode my videos...
 $ my-favourite-game

And have the nice hint apply to GPU parts of the transcode pipeline as well?

Another reason why I started thinking about this is that I noticed Chrome
browser for instance uses nice to de-prioritise background tabs. So again,
having that decision propagate to the GPU rendering pipeline sounds like a big
plus to the overall user experience.

This RFC implements this idea with the hairy part being the notifier chain I
added to enable dynamic adjustments. It is a global notifier which raises a few
questions so I am very curious what experts will think here. Please see the
opens in the first patch for more on this. And also the last two patches are the
ones which implement a hash table in i915 so it can associate the notifier call-
back with the correct GPU rendering contexts.

On a more positive note the thing seems to even work as is. For instance I
roughly simulated the above scenario by running a GPU hog at three nice levels
and a GfxBench TRex in parallel (as a game proxy). This is what I got:

   GPU hog nice	|   TRex fps
  ------------------------------
        0	|	34.8
       10	|	38.0
      -10	|	30.8

So it is visible the feature can improve the user experience. Question is just
if people are happy with this method of implementing it.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>

Tvrtko Ursulin (6):
  sched: Add nice value change notifier
  drm/i915: Explicitly track DRM clients
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track all user contexts per client
  drm/i915: Keep track of registered clients indexed by task struct
  drm/i915: Connect task and GPU scheduling priorities

 drivers/gpu/drm/i915/Makefile                 |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  20 +++
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +-
 drivers/gpu/drm/i915/i915_drm_client.c        | 129 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  71 ++++++++++
 drivers/gpu/drm/i915/i915_drv.c               |   6 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
 drivers/gpu/drm/i915/i915_request.c           |   2 +-
 drivers/gpu/drm/i915/i915_request.h           |   5 +
 drivers/gpu/drm/i915/i915_scheduler.c         |   3 +-
 drivers/gpu/drm/i915/i915_scheduler.h         |  14 ++
 drivers/gpu/drm/i915/i915_scheduler_types.h   |   8 ++
 include/linux/sched.h                         |   5 +
 kernel/sched/core.c                           |  37 ++++-
 16 files changed, 330 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.30.2

