Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D6467A8D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463AB6EDE2;
	Fri,  3 Dec 2021 15:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734D96EDE2;
 Fri,  3 Dec 2021 15:49:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="261004615"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="261004615"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 07:49:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="501232296"
Received: from barrettd-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 07:49:57 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] Per client GPU stats
Date: Fri,  3 Dec 2021 15:49:40 +0000
Message-Id: <20211203154947.3953995-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Same old work but now rebased and series ending with some DRM docs proposing
the common specification which should enable nice common userspace tools to be
written.

For the moment I only have intel_gpu_top converted to use this and that seems to
work okay.

v2:
 * Added prototype of possible amdgpu changes and spec updates to align with the
   common spec.

v3:
 * Documented that 'drm-driver' tag shall correspond with
   struct drm_driver.name.

v4:
 * Dropped amdgpu conversion from the series for now until AMD folks can find
   some time to finish that patch.

Tvrtko Ursulin (7):
  drm/i915: Explicitly track DRM clients
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track runtime spent in closed and unreachable GEM contexts
  drm/i915: Track all user contexts per client
  drm/i915: Track context current active time
  drm: Document fdinfo format specification
  drm/i915: Expose client engine utilisation via fdinfo

 Documentation/gpu/drm-usage-stats.rst         | 103 +++++++++++++
 Documentation/gpu/i915.rst                    |  27 ++++
 Documentation/gpu/index.rst                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  42 ++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
 drivers/gpu/drm/i915/gt/intel_context.c       |  27 +++-
 drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
 .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 ++--
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 +++
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
 drivers/gpu/drm/i915/i915_driver.c            |   9 ++
 drivers/gpu/drm/i915/i915_drm_client.c        | 143 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  66 ++++++++
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
 21 files changed, 535 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.32.0

