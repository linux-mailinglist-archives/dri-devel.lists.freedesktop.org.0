Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0307C4EEF30
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4431610E39D;
	Fri,  1 Apr 2022 14:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A41B10E1E8;
 Fri,  1 Apr 2022 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648822933; x=1680358933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7XGHf2RsegPuaQHVkEHmEZ6Xh7DMLgaDbOTpBtLwjJw=;
 b=AMtc7vHqK3FBB5tnTdIqGIcXANJbpjkKP4dbn0oXPbWvUjoiJvfC7KqJ
 Na/8amEZ6iMqsyqjbfqkMGBUMG7Jsc+iDgj8N+mpT0EzsiRFcE9p9poMI
 8Hf661dQaizr0tXUbtQZ/JBySvSI2CPEBh24yCc3aV/ooJB/FZQ714DIT
 HqsJBW3Nb24vo0Zx6vLanySYZS+QVKjAmFXpIxwRuvmDXJCDPMhjk/07S
 XWGMu0BkgwlxHBtrlV8LT4+u+Gua3pEsnkfFusS2YrKX6m5xzngUDxPe2
 8OP2j5+XrjHNafykegSRO1iEJgo8bDE8ybUD2bascWMKZrIxr0G1cQGjn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="240085431"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240085431"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="655753434"
Received: from ewanhaye-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.217.32])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 07:22:11 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [CI 0/8] Per client GPU utilisation
Date: Fri,  1 Apr 2022 15:21:57 +0100
Message-Id: <20220401142205.3123159-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Test-with: 20220401141155.3122817-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (8):
  drm/i915: Explicitly track DRM clients
  drm/i915: Make GEM contexts track DRM clients
  drm/i915: Track runtime spent in closed and unreachable GEM contexts
  drm/i915: Track all user contexts per client
  drm/i915: Track context current active time
  drm: Document fdinfo format specification
  drm/i915: Count engine instances per uabi class
  drm/i915: Expose client engine utilisation via fdinfo

 Documentation/gpu/drm-usage-stats.rst         | 112 +++++++++++++
 Documentation/gpu/i915.rst                    |  28 ++++
 Documentation/gpu/index.rst                   |   1 +
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  43 ++++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   6 +
 drivers/gpu/drm/i915/gt/intel_context.c       |  27 ++-
 drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
 drivers/gpu/drm/i915/gt/intel_context_types.h |  24 ++-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  11 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  23 ++-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +--
 drivers/gpu/drm/i915/gt/intel_lrc.h           |  27 ++-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
 drivers/gpu/drm/i915/i915_driver.c            |   9 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 154 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  68 ++++++++
 drivers/gpu/drm/i915/i915_drv.h               |   4 +
 drivers/gpu/drm/i915/i915_file_private.h      |   3 +
 drivers/gpu/drm/i915/i915_gem.c               |  21 ++-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
 drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
 23 files changed, 569 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/gpu/drm-usage-stats.rst
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
 create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h

-- 
2.32.0

