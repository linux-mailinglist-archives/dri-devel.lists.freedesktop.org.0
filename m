Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B956A1F92
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A49410E132;
	Fri, 24 Feb 2023 16:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF87510E132;
 Fri, 24 Feb 2023 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677255991; x=1708791991;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=xE62hZCuuriQEbQ2FFx4gL0VaTOn7ilKQuUhaqb1uOM=;
 b=bRXpkdUklCZG6Crc9EuMkbEcEzGzeDRkNtHPYMnnCsFlM605t9ebRCCU
 IGM96cq8io+c1xr/xYNHKWROyatoZQJ9U3pLwp8jycQhruBnjMXQrZ2VI
 gqjDVpv36U4uOUaBnWrd8nDXflYREVZVP0vZJMJPTJ/4F8HV+8cT2Cr0L
 ieufJpAi430y9NiBXS5hRc8sBECVhAaN9CDEXRBFBUC2qP4TLJb065ffa
 taoQOXem80oZfg/rSqbFDY21XC5qM+AS+chISa/RDezqJ/C0ZZsyUjzyE
 W1tD5Lu2jAaWPeZfC3D6UztlzuVxFscjyAx5hyAzI73+fyR3cGGC+Ec3Y w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317273324"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="317273324"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:26:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705321695"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="705321695"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:26:12 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 0/3] drm/i915: track gt->wakerefs
Date: Fri, 24 Feb 2023 17:25:40 +0100
Message-Id: <20230224-track_gt-v1-0-0222096fcdc6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATl+GMC/x2NUQqAIBAFrxL7nVAWFF0lIlbddAks1oggunvW5
 /BmeDckEqYEQ3GD0MmJt5ihLguwAaMnxS4z6Eo3ldatOgTtOvtD1aZx2BuH1nWQdYOJlBGMNnyB
 0DL/Lsm37pn5+o/G6XleeKs/TXgAAAA=
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset extracts i915 rpm wakeref tracking to separate files (patch 1)
and then uses it to track GT wakerefs (patch 2).
Next step is to use external library lib/ref_track, but this requires some
adjustements to the library and will be performed in separate patchset.
The patches are taken from internal branch.

To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

---
Andrzej Hajda (1):
      drm/i915: Correct type of wakeref variable

Chris Wilson (2):
      drm/i915: Separate wakeref tracking
      drm/i915: Track leaked gt->wakerefs

 drivers/gpu/drm/i915/Kconfig.debug                 |  24 ++
 drivers/gpu/drm/i915/Makefile                      |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |   7 +-
 .../drm/i915/gem/selftests/i915_gem_coherency.c    |  10 +-
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c |  14 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c        |  13 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h  |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |   2 +
 .../gpu/drm/i915/gt/intel_execlists_submission.c   |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  10 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |  38 +++-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c      |   4 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c       |  20 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c           |   5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c           |  10 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c             |  17 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c            |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c  |  11 +-
 drivers/gpu/drm/i915/i915_pmu.c                    |  16 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            | 244 +++------------------
 drivers/gpu/drm/i915/intel_runtime_pm.h            |  10 +-
 drivers/gpu/drm/i915/intel_wakeref.c               |   4 +
 drivers/gpu/drm/i915/intel_wakeref.h               |  48 +++-
 drivers/gpu/drm/i915/intel_wakeref_tracker.c       | 234 ++++++++++++++++++++
 drivers/gpu/drm/i915/intel_wakeref_tracker.h       |  76 +++++++
 26 files changed, 536 insertions(+), 299 deletions(-)
---
base-commit: 1ddc2effff762c6a109af52f3c39534c7115aebe
change-id: 20230224-track_gt-1b3da8bdacd7

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>
