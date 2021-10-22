Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A88437017
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 04:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1936E527;
	Fri, 22 Oct 2021 02:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC036E527;
 Fri, 22 Oct 2021 02:40:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252707255"
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="252707255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,171,1631602800"; d="scan'208";a="527768604"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 19:40:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Subject: [PATCH 0/2] Delay disabling scheduling on a context
Date: Thu, 21 Oct 2021 19:35:36 -0700
Message-Id: <20211022023538.20908-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add delay before disabling scheduling on a context. 2nd patch should
explain it quite well. 

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  drm/i915/selftests: Use correct selfest calls for live tests
  drm/i915/guc: Add delay to disable scheduling after pin count goes to
    zero

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   2 +-
 .../i915/gem/selftests/i915_gem_coherency.c   |   2 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   2 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   2 +-
 .../drm/i915/gem/selftests/i915_gem_object.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |   9 ++
 drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  10 ++
 .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |  28 ++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 127 ++++++++++++++----
 drivers/gpu/drm/i915/i915_selftest.h          |   2 +
 drivers/gpu/drm/i915/i915_trace.h             |  10 ++
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_perf.c    |   2 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |   2 +-
 drivers/gpu/drm/i915/selftests/i915_vma.c     |   2 +-
 16 files changed, 178 insertions(+), 33 deletions(-)

-- 
2.32.0

