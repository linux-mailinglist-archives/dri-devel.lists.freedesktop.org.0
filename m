Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5657C9F86F6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48F310E33D;
	Thu, 19 Dec 2024 21:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4OvAPme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE5410E246;
 Thu, 19 Dec 2024 21:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734644055; x=1766180055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZmCY2zntOHf+BEZZU44zHPZZjXnSKmvYw6M5lMznpB8=;
 b=c4OvAPmeC0q7Xu0SJsEWEq8r17Qb/FtxpmRvuYmz03985Q5supSarUiY
 YOZIlnH9x0rihugB+Q/yQx9kGvKC8uPgy6iBnC54sbSHdVUF1ZZvwbNEu
 LYVRF7zcurbKZF/dryE/gT90/1Xjro39MILysPaypQ/UDTLdiU3mA1LR5
 A+OxTXMfiA8KXj/CNozzjatHmY0XQiyYV7FfupwMP01BOXtJgQsz0RN04
 jnoHHqfJ76fCmJRIrobvINmQdP3vaDCawrLzhnXhHLBkAu1fUgpGorkeA
 haZYrKGhpggWhpuvFtQZh7jNUaqtLxfhXaP/xe+oCTuoivnnHBJWaROmu Q==;
X-CSE-ConnectionGUID: 9umWYRUTSfCqzYD1/zGyZQ==
X-CSE-MsgGUID: 8RwgB4pGThesIsghSWp94A==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34900087"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="34900087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:15 -0800
X-CSE-ConnectionGUID: QKLXoDf/TYaICuytSWnF9Q==
X-CSE-MsgGUID: I87HhUK5RGCOcntccKHGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99140675"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 13:34:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH v2 00/16] drm/i915/dp: 128b/132b uncompressed SST
Date: Thu, 19 Dec 2024 23:33:49 +0200
Message-Id: <cover.1734643485.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This is v2 of [1], enabling uncompressed 128b/132b UHBR SST.

The first one was accidentally "RFC v0", and there have been a few
iterations sent to CI trybot since, with various version numbers, so I
expect everyone to get royally confused about the versioning
here. Sorry.

Anyway, unlike with [1], we get a picture on screen with this, so it
must be perfect. Please review. :)


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1734085515.git.jani.nikula@intel.com

Jani Nikula (16):
  drm/mst: remove mgr parameter and debug logging from
    drm_dp_get_vc_payload_bw()
  drm/i915/mst: drop connector parameter from intel_dp_mst_bw_overhead()
  drm/i915/mst: drop connector parameter from intel_dp_mst_compute_m_n()
  drm/i915/mst: change return value of
    mst_stream_find_vcpi_slots_for_bpp()
  drm/i915/mst: remove crtc_state->pbn
  drm/i915/mst: split out a helper for figuring out the TU
  drm/i915/mst: adapt intel_dp_mtp_tu_compute_config() for 128b/132b SST
  drm/i915/ddi: enable 128b/132b TRANS_DDI_FUNC_CTL mode for UHBR SST
  drm/i915/ddi: 128b/132b SST also needs DP_TP_CTL_MODE_MST
  drm/i915/ddi: write payload for 128b/132b SST
  drm/i915/ddi: initialize 128b/132b SST DP2 VFREQ registers
  drm/i915/ddi: enable ACT handling for 128b/132b SST
  drm/i915/ddi: start distinguishing 128b/132b SST and MST at state
    readout
  drm/i915/ddi: handle 128b/132b SST in intel_ddi_read_func_ctl()
  drm/i915/ddi: disable trancoder port select for 128b/132b SST
  drm/i915/dp: compute config for 128b/132b SST w/o DSC

 drivers/gpu/drm/display/drm_dp_mst_topology.c |  10 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  97 +++++++-
 .../drm/i915/display/intel_display_types.h    |   2 -
 drivers/gpu/drm/i915/display/intel_dp.c       |  34 ++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 218 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dp_mst.h   |   7 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   3 +-
 .../gpu/drm/tests/drm_dp_mst_helper_test.c    |   4 +-
 include/drm/display/drm_dp_mst_helper.h       |   3 +-
 9 files changed, 235 insertions(+), 143 deletions(-)

-- 
2.39.5

