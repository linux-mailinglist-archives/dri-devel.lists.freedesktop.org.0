Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21B1C45B9
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 20:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D657895C4;
	Mon,  4 May 2020 18:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266EE899A3;
 Mon,  4 May 2020 18:24:00 +0000 (UTC)
IronPort-SDR: gEKLVTL6MAl5hdocMPLAioxD98LZmYmt7h1H/wi+Y2bsOeY39InxC5RSBhAhpOL4F69DkmBIEk
 zHRi0AmiViKQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:23:59 -0700
IronPort-SDR: cpKsJNB4m4QCRrLo5gVLWA1vvYZLIz5Mv3LhFGImu3IFrzcCk6OhtGN3EhwdW1QGjNtZxe99yw
 syyd6fkctjIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,352,1583222400"; d="scan'208";a="369172008"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 04 May 2020 11:23:57 -0700
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] Prefer drm_WARN* over WARN*
Date: Mon,  4 May 2020 23:45:51 +0530
Message-Id: <20200504181600.18503-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Now we have struct drm_device specific drm_WARN* macros which include
device information in the backtrace, so we know what device the
warnings originate from.

This series converts WARN* with drm_WARN* where struct drm_device
pointer can be extracted.

This series is the continuation of:
https://patchwork.freedesktop.org/series/72035/

changes since v1:
- Addressed Jani's review comments
- Rebase patches on latest tip.

Pankaj Bharadiya (9):
  drm/i915/display/display_power: Prefer drm_WARN_ON over WARN_ON
  drm/i915/display/dp: Prefer drm_WARN* over WARN*
  drm/i915/display/sdvo: Prefer drm_WARN* over WARN*
  drm/i915/display/tc: Prefer drm_WARN_ON over WARN_ON
  drm/i915/gem: Prefer drm_WARN* over WARN*
  drm/i915/i915_drv: Prefer drm_WARN_ON over WARN_ON
  drm/i915/pmu: Prefer drm_WARN_ON over WARN_ON
  drm/i915/pm: Prefer drm_WARN_ON over WARN_ON
  drm/i915/runtime_pm: Prefer drm_WARN* over WARN*

 .../drm/i915/display/intel_display_power.c    | 35 +++++++----
 drivers/gpu/drm/i915/display/intel_dp.c       | 24 ++++---
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 21 ++++---
 drivers/gpu/drm/i915/display/intel_tc.c       | 14 +++--
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  3 +-
 drivers/gpu/drm/i915/i915_pmu.c               | 12 +++-
 drivers/gpu/drm/i915/intel_pm.c               | 63 +++++++++++--------
 drivers/gpu/drm/i915/intel_runtime_pm.c       | 39 ++++++++----
 11 files changed, 143 insertions(+), 75 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
