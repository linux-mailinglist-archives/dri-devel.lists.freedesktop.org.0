Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457567B0B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FED10E0DF;
	Wed, 25 Jan 2023 11:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A267010E0DF;
 Wed, 25 Jan 2023 11:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674645058; x=1706181058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nd0ZaxEOhDkEvvRh+mTKRFkuNPXu6+rkTGUx8lQ5oYA=;
 b=jCLj9CBLXAHHi7ai4BwiyNwlDInD4lDBpT+Yyqfk5GxkD3Wl5XurROLR
 Aj00Lbpz25L5SxLfmTGBW97flXuF4cy7hutOJmMleaE9Xsf2Wweu/ySyf
 GAqh3SKypmUjaoPWu58MD9puud0IP1qt/f7dO147RIB5XpzgLK+wOIx16
 ybSXgey1xMd4Vj/RD6tLQH7rQ5DLuqdn9wouEyk8CnCOiIVV1XCncxhP5
 JLOqtxsoVkTfM6+eQzhfEMK1dZviuNCdnqIsQgBkxuAOpY48TMYDWuuYs
 WWXStLTAeVtIEFVXRoG3p2nZSKMmqQ1zuOXAgdOp43Z2uGbLaKodw0H1b A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="324229249"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="324229249"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:10:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="907843153"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="907843153"
Received: from ericnguy-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 03:10:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI v8 0/4] drm/i915: switch to drm_edid and enable HF-EEODB support
Date: Wed, 25 Jan 2023 13:10:48 +0200
Message-Id: <cover.1674643465.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here are the drm/i915 patches from [1], re-submitted to CI now that the
drm/edid dependencies from that series have been merged to
drm-misc-next, merged to drm-next, and backmerged to drm-misc-next.

Fingers crossed. This has been a long journey.


[1] https://patchwork.freedesktop.org/series/112392/

Jani Nikula (4):
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/i915/opregion: convert intel_opregion_get_edid() to struct
    drm_edid
  drm/i915/panel: move panel fixed EDID to struct intel_panel

 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_bios.c     | 23 ++---
 drivers/gpu/drm/i915/display/intel_bios.h     |  4 +-
 .../gpu/drm/i915/display/intel_connector.c    |  5 +-
 .../drm/i915/display/intel_display_types.h    |  8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 91 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dvo.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 +++---
 drivers/gpu/drm/i915/display/intel_lvds.c     | 51 +++++++----
 drivers/gpu/drm/i915/display/intel_opregion.c | 29 +++---
 drivers/gpu/drm/i915/display/intel_opregion.h |  4 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 10 +-
 drivers/gpu/drm/i915/display/intel_panel.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
 15 files changed, 144 insertions(+), 121 deletions(-)

-- 
2.34.1

