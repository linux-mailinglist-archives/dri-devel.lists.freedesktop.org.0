Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB3C49830F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EB610EA97;
	Mon, 24 Jan 2022 15:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9310E820;
 Mon, 24 Jan 2022 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036867; x=1674572867;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w8i0kNLZ+J/FaTCaK6bIp4mS/4ohpsR4Ayo95FIHlT4=;
 b=K4dOWtsbzWkpoRnRlaViG6JA1KFmBEBjMAXB+31eN0E23q+c9yHGPWu1
 q44od7iksuoICCLUyHc91/n+si0IOoGVRwCVwokD95fGjxMfSDRfZsWX1
 t44Cdeag+A4XQMl6kdUAA9VmclVHC/6wXj9uj2kAeYMdFOxIPUbyfkrf5
 AlW6EZlEh5eP3/YFRT48u6428SPaelCQ4lix5Fiytn6OuLo0phcwO6XFj
 QJ7ePQZMLu/+LEiSIqj+4hdioUjnHzzfg11IccLX3PmH+3rHxsXU9oC+9
 3CVDGUwGg6B9iJdzgeJp1eMWfqoxd8H+Lo8lC0rIWY1FLjHbOUFy2Eydx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282837"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="246282837"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532104890"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] Fix up request cancel
Date: Mon, 24 Jan 2022 07:01:53 -0800
Message-Id: <20220124150157.15758-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix request cancellation + add request cancel low level trace point.

v2:
  - Update cancel reset selftest preemption timeout value to zero
  - Fix bug in execlists cancel code

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (4):
  drm/i915: Add request cancel low level trace point
  drm/i915/guc: Cancel requests immediately
  drm/i915/execlists: Fix execlists request cancellation corner case
  drm/i915/selftests: Set preemption timeout to zero in cancel reset
    test

 drivers/gpu/drm/i915/gt/intel_context.h       |  1 +
 drivers/gpu/drm/i915/gt/intel_context_types.h |  5 ++
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 23 ++++++++--
 .../gpu/drm/i915/gt/intel_engine_heartbeat.h  |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  | 18 +++++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 46 +++++++++++--------
 drivers/gpu/drm/i915/i915_request.h           |  6 +++
 drivers/gpu/drm/i915/i915_trace.h             | 10 ++++
 drivers/gpu/drm/i915/selftests/i915_request.c |  7 +--
 9 files changed, 84 insertions(+), 33 deletions(-)

-- 
2.34.1

