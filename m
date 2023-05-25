Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C757106F3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B4310E82D;
	Thu, 25 May 2023 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FF810E7EA;
 Thu, 25 May 2023 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002323; x=1716538323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mBFsnyKTYjKNRfO0X+iHfyEbJwbBiwfJcq+c0JPjNwU=;
 b=VsF5+g6zCRBIcnmzoOpiEEaO/Oc6zWTFL9jLwAH7MzVPFBB6DETRfYM1
 ttOs+dKooxImedAALsRps5MgHEu1DYPsPgVIc11TbAHRalHEYBEPUlcP4
 TrwcIeUmCwxwrm6de3Md/uNu/zPuLjCzB+mzyQM8434VCjnuyV+38cSlu
 O9RssfNuEDaIo6xmMTIAuYRf9OieRBAtlpz6c0fYD2N7yoRi21CbiXXhg
 SwGntRoaBpPhLOEzSaqLkWBTDUDJ/oLbhkO5KwcAWiOHQx6Qvmq/qAgOt
 GWSfH6EEkyNNqV4uM1RjiSxU/0GO3Ip6rSfIY6Fw69/QdXn7a8egUibdL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288482"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288482"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655122942"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655122942"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:42 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] Expose RPS thresholds in sysfs
Date: Thu, 25 May 2023 09:11:28 +0100
Message-Id: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

From patch 4:

    User feedback indicates significant performance gains are possible in
    specific games with non default RPS up/down thresholds.

    Expose these tunables via sysfs which will allow users to achieve best
    performance when running games and best power efficiency elsewhere.

    Note this patch supports non GuC based platforms only.

    References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389

Issue 8389 suggests 10-15% performance gains are possible with tweaked
thresholds.

One question is are we able to find a "one size fits all" values.

However regardless of that, given we already expose frequency controls in sysfs
with the same reasoning of allowing system owners explicit control if so wanted,
I think exposing the thresholds can be equally justified.

v2:
 * Hopefully fixed the debug build issue.
 * Re-program the hw registers on change too!

v3:
 * Added a patch which captures the thresholds in error state, to account for
   any potential instability which may be caused by moving away from defaults.
 * Fixed one checkpatch warning.

Test-with: 20230523105139.626772-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (5):
  drm/i915: Move setting of rps thresholds to init
  drm/i915: Record default rps threshold values
  drm/i915: Add helpers for managing rps thresholds
  drm/i915: Expose RPS thresholds in sysfs
  drm/i915: Include RPS threshold in error state

 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 108 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |   3 +
 drivers/gpu/drm/i915/gt/intel_rps.c         |  83 +++++++++++++--
 drivers/gpu/drm/i915/gt/intel_rps.h         |   4 +
 drivers/gpu/drm/i915/i915_gpu_error.c       |   5 +
 drivers/gpu/drm/i915/i915_gpu_error.h       |   5 +
 6 files changed, 197 insertions(+), 11 deletions(-)

-- 
2.39.2

