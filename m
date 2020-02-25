Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6816C2F9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 14:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9286EAC4;
	Tue, 25 Feb 2020 13:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227F36EAC2;
 Tue, 25 Feb 2020 13:57:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 05:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="350152991"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2020 05:57:37 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx][PATCH 00/10] drm/i915: Introduce i915 based
 i915_MISSING_CASE macro and us it in i915
Date: Tue, 25 Feb 2020 19:16:59 +0530
Message-Id: <20200225134709.6153-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Existing MISSING_CASE macro uses WARN call to dump the stack trace.

Now that we have struct drm_device based drm_WARN, introduce struct
drm_i915_private based i915_MISSING_CASE macro which uses drm_WARN so
that device specific information will also get printed in backtrace.

Also, automatically convert the MISSING_CASE with i915 specific
i915_MISSING_CASE  variant using coccinelle semantic patch scripts.

i915_MISSING_CASE macro should be preferred over MISSING_CASE,
wherever possible.

Pankaj Bharadiya (10):
  drm/i915: Add i915 device based MISSING_CASE macro
  drm/i915/display/cdclk: Make MISSING_CASE backtrace i915 specific
  drm/i915/display/ddi: Make MISSING_CASE backtrace i915 specific
  drm/i915/display/display: Make MISSING_CASE backtrace i915 specific
  drm/i915/dp: Make MISSING_CASE backtrace i915 specific
  drm/i915/display/hdmi: Make MISSING_CASE backtrace i915 specific
  drm/i915/display: Make MISSING_CASE backtrace i915 specific
  drm/i915/gem: Make MISSING_CASE backtrace i915 specific
  drm/i915/gt: Make MISSING_CASE backtrace i915 specific
  drm/i915: Make MISSING_CASE backtrace i915 specific

 drivers/gpu/drm/i915/display/icl_dsi.c        |  8 +++--
 drivers/gpu/drm/i915/display/intel_bios.c     |  4 +--
 drivers/gpu/drm/i915/display/intel_bw.c       |  6 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 19 +++++++-----
 .../gpu/drm/i915/display/intel_combo_phy.c    |  6 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c      | 19 ++++++------
 drivers/gpu/drm/i915/display/intel_display.c  | 29 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.c       | 28 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 10 +++----
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 12 ++++----
 drivers/gpu/drm/i915/display/intel_hotplug.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  4 +--
 drivers/gpu/drm/i915/display/intel_tc.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    | 17 +++++++----
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |  6 ++--
 drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
 drivers/gpu/drm/i915/i915_drv.c               |  2 +-
 drivers/gpu/drm/i915/i915_gem_fence_reg.c     |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_utils.h             |  4 +++
 drivers/gpu/drm/i915/intel_device_info.c      | 13 +++++----
 drivers/gpu/drm/i915/intel_pm.c               | 10 +++----
 22 files changed, 113 insertions(+), 95 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
