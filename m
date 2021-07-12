Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3C53C5BAC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 14:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55D89AC2;
	Mon, 12 Jul 2021 12:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B7889AC2;
 Mon, 12 Jul 2021 12:17:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="209943832"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="209943832"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; d="scan'208";a="648236587"
Received: from aaroncar-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.240.41])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 05:17:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] Per client engine busyness
Date: Mon, 12 Jul 2021 13:17:11 +0100
Message-Id: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Tvrtko Ursulin (8):
  drm/i915: Explicitly track DRM clients
  drm/i915: Update client name on context create
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track runtime spent in closed and unreachable GEM contexts
  drm/i915: Track all user contexts per client
  drm/i915: Track context current active time
  drm/i915: Expose client engine utilisation via fdinfo
  drm: Document fdinfo format specification

 Documentation/gpu/drm-usage-stats.rst         |  99 +++++++
 Documentation/gpu/i915.rst                    |  27 ++
 Documentation/gpu/index.rst                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  55 +++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
 drivers/gpu/drm/i915/i915_drm_client.c        | 243 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        | 107 ++++++++
 drivers/gpu/drm/i915/i915_drv.c               |   9 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +--
 drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
 21 files changed, 696 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.30.2

