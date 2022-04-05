Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FA4F39B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 16:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC6310E732;
	Tue,  5 Apr 2022 14:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3938710E120;
 Tue,  5 Apr 2022 14:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649170456; x=1680706456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kd3nlWmkEqpB3azCjuvEFm6r1dY1JSqtgZJmi1ohBjs=;
 b=mcZYPI6hnbmzNnnO3OiR7RTvsyvdNgNwEqQBRR5yDnBCwTyheS0vi9a5
 XQT7zMxPOmOSGPs4HEl6Kv6boRTXEjrskcTmsblVHUNzRJP5N9pBFJ8Fs
 wzXNJlEcNDBmLi6d78YFZhbDfSurJ8pHEuZvhDMhAK2UTUcJubUvaspJH
 NmngtKy7l1RHwGBx/GMueK+P4iEAh0CM22F7DaUnMpTnVPAA/aDKNk+td
 N4UvX1A3eMXcfCQVLN2xdHn9wtYziL0NWNy0BrES0y64+7hRq6WhRcLwO
 PklVz7Hub60AncxSyaQnOxw8RvUsDfBYcPwePAF8Tkq3wYO1ReeeLzVbX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="241353392"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="241353392"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="608470331"
Received: from pmulcahy-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.235.32])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:54:14 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] Inherit GPU scheduling priority from process nice
Date: Tue,  5 Apr 2022 15:53:42 +0100
Message-Id: <20220405145345.3284084-1-tvrtko.ursulin@linux.intel.com>
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

With the series applied I simulated the scenario of a background GPU task
running simultaneously with an interactive client, varying the hog's nice value.
These were the results:

   GPU hog (nice) |   TRex fps    |   perf drop
   ---------------+---------------+------------
       no hog     |     48.9      |    - n/a -
          0       |     42.7      |     -13%
         10       |     47.9      |      -2%
        -10       |     29.0      |     -41%

As can be seen running the background GPU task re-niced can restore the
performance of the foreground task to almost the level when it is running alone
on the machine.

The approach is completely compatible with GuC and drm/scheduler since all
support at least low/normal/high priority levels with just the granularity of
available control differing. In other words with GuC scheduling there is no
difference between nice 5 and 10, both would map to low priority, but the
default case of positive or negative nice, versus nice 0, is still correctly
propagated to the firmware scheduler.

v2:
 * Moved notifier outside task_rq_lock.
 * Some improvements and restructuring on the i915 side of the series.

v3:
 * Dropped task nice notifier - inheriting nice on request submit time is good
   enough.

Tvrtko Ursulin (3):
  drm/i915: Make some recently added vfuncs use full scheduling
    attribute
  drm/i915: Inherit process nice for context scheduling priority
  drm/i915: Inherit submitter nice when scheduling requests

 drivers/gpu/drm/i915/gem/i915_gem_context.c      |  6 +++++-
 .../gpu/drm/i915/gt/intel_execlists_submission.c |  6 ++++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    |  3 ++-
 drivers/gpu/drm/i915/i915_request.c              |  7 +++++--
 drivers/gpu/drm/i915/i915_request.h              |  5 +++++
 drivers/gpu/drm/i915/i915_scheduler.c            | 16 ++++++++++------
 drivers/gpu/drm/i915/i915_scheduler.h            | 14 ++++++++++++++
 drivers/gpu/drm/i915/i915_scheduler_types.h      | 12 ++++++++++--
 8 files changed, 55 insertions(+), 14 deletions(-)

-- 
2.32.0

