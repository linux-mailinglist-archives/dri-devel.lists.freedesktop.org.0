Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4654F829C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4EA10EAA4;
	Thu,  7 Apr 2022 15:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779BC10EAA4;
 Thu,  7 Apr 2022 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649344600; x=1680880600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+i/7zzqd9Ay0apEMQRx9PMLILj5GG2gzw51R9zgbS7I=;
 b=kPDiyiU1MQetll8IyzI1Iq29m3KGE44q5QtIp1wM+qR/5LxyFbunmPGg
 61/+17XLpDgAF5xY/fXneTueHR+Ic8vTqG5rvSy7NEXH6EQrPMqg9JiHA
 2Avd3bw8eyXEzACy5qTVX+PnsVvHkxhjK2c5bef7H6MyHW9gNxHy6rr9T
 xiEhEdwsOcOrAdNE4D4wjAx2YTZcL/5P09sFE6nMxqQfffHW2RygJjG5o
 fuKAmkctuItekI30zsnun2s4UAMLYOL4kPBLUawQPsXC7DB98/TEy5646
 5lyPqx3PN+eVafQu+S1Rl9FAIka1D1jEiDQhOyOaWjedhBqihQijGtT34 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="324512336"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="324512336"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:16:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="524962793"
Received: from twsparks-mobl1.amr.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.212.41.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:16:38 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Inherit GPU scheduling priority from process nice
Date: Thu,  7 Apr 2022 16:16:26 +0100
Message-Id: <20220407151627.3387655-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Current processing landscape seems to be more and more composed of pipelines
where computations are done on multiple hardware devices. Furthermore some of
the non-CPU devices, like in this case many GPUs supported by the i915 driver,
actually support priority based scheduling which is currently rather
inaccessible to the user (in terms of being able to control it from the
outside).

From these two statements a question arises on how to allow for a simple,
effective and consolidated user experience. In other words why user would not be
able to do something like:

 $ nice ffmmpeg ...transcode my videos...
 $ my-favourite-game

And have the nice hint apply to GPU parts of the transcode pipeline as well?

This would in fact follow the approach taken by kernel's block scheduler where
ionice is by default inherited from process nice.

This series implements the same idea by inheriting context creator and batch
buffer submitted nice value as context nice. To avoid influencing GPU scheduling
aware clients this is done only one for contexts where userspace hasn't
explicitly specified a non-default scheduling priority

The approach is completely compatible with GuC and drm/scheduler since all
support at least low/normal/high priority levels with just the granularity of
available control differing. In other words with GuC scheduling there is no
difference between nice 5 and 10, both would map to low priority, but the
default case of positive or negative nice, versus nice 0, is still correctly
propagated to the firmware scheduler.

With the series applied I simulated the scenario of a background GPU task
running simultaneously with an interactive client, varying the former's nice
value.

Simulating a non-interactive GPU background task was:
  vblank_mode=0 nice -n <N> glxgears -geometry 1600x800

Interactive client was simulated with:
  gem_wsim -w ~/test.wsim -r 300 -v # (This one is self-capped at ~60fps.)

These were the results on DG1, first with execlists (default):

   Background nice  |   Interactive FPS
 -------------------+--------------------
      <not running> |         59
                  0 |         35
                 10 |         42

As we can see running the background load with nice 10 can somewhat help the
performance of the interactive/foreground task. (Although to be noted is that
without the fair scheduler completed there are possible starvation issues
depending on the workload which cannot be fixed by this patch.)

Now results with GuC (although it is not default on DG1):

   Background nice  |   Interactive FPS
 -------------------+--------------------
      <not running> |         58
                  0 |         26
                 10 |         25

Unfortunately GuC is not showing any change (25 vs 26 is rounding/run error).
But reverse mesurement with background client at nice 0 and foreground at nice
-10 does give 40 FPS proving the priority adjustment does work. (Same reverse
test gives 46 FPS with execlists). What is happening with GuC here is something
to be looked at since it seems normal-vs-low GuC priority time slices
differently than normal-vs-high. Normal does not seem to be preferred over low,
in this test at least.

v2:
 * Moved notifier outside task_rq_lock.
 * Some improvements and restructuring on the i915 side of the series.

v3:
 * Dropped task nice notifier - inheriting nice on request submit time is good
   enough.

v4:
 * Realisation came that this can be heavily simplified and only one simple
   patch is enough to achieve the desired behaviour.
 * Fixed the priority adjustment location to actually worked after rebase!
 * Re-done the benchmarking.

Tvrtko Ursulin (1):
  drm/i915: Inherit submitter nice when scheduling requests

 drivers/gpu/drm/i915/i915_request.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.32.0

