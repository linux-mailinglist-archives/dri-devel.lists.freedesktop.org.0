Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57C673E78
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04E710E9A0;
	Thu, 19 Jan 2023 16:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2255810E99E;
 Thu, 19 Jan 2023 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145166; x=1705681166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+SixiSrJOtjQT1NY7mbSropzachrisO3nBb/MPGtpU=;
 b=jnppDTUla5o314Vj8tWhrZDSqT8aHu5u9TO5iaNH2s3plBdEJlc93l7t
 XCk9Vx2+1uqwaHUCvWIIJHSKfu84rJo+uGxMGSifGCQHN3FI+Hppa2uxx
 GAcvMx/jVa652wcrNRS78QsKU37Fw42KSMns9dz+L8IsvX+0yrK6Nyk1D
 hGKSZGWG56SHaCfBAtFE2SXfzJD41hniDIVGE5Bg9ooeEhney3ANlPscw
 ZWTzvP//b3SZXutp2D8qhwHr4KtzyKGawUnbdLU8Z2qiHbCDss/6dGZJb
 /xRngomFa+LnfgmPCF6bHucAR87LCaU23tE6QRB7+nQ3HhKWfsjU5sfOE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325372789"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="325372789"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660256675"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="660256675"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/8] drm/edid: info & modes parsing and drm_edid refactors
Date: Thu, 19 Jan 2023 18:18:53 +0200
Message-Id: <cover.1674144945.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A bunch of patches merged, thanks to Ville's review, here's another spin
to get CI on the updated patch 1. The rest remain unchanged.

Jani Nikula (8):
  drm/edid: split HDMI VSDB info and mode parsing
  drm/edid: refactor _drm_edid_connector_update() and rename
  drm/edid: add separate drm_edid_connector_add_modes()
  drm/edid: remove redundant _drm_connector_update_edid_property()
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/i915/opregion: convert intel_opregion_get_edid() to struct
    drm_edid
  drm/i915/panel: move panel fixed EDID to struct intel_panel

 drivers/gpu/drm/drm_edid.c                    | 93 +++++++++++--------
 drivers/gpu/drm/drm_probe_helper.c            |  4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_bios.c     | 23 ++---
 drivers/gpu/drm/i915/display/intel_bios.h     |  4 +-
 .../gpu/drm/i915/display/intel_connector.c    |  5 +-
 .../drm/i915/display/intel_display_types.h    |  8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 91 +++++++++---------
 drivers/gpu/drm/i915/display/intel_dvo.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 +++---
 drivers/gpu/drm/i915/display/intel_lvds.c     | 51 ++++++----
 drivers/gpu/drm/i915/display/intel_opregion.c | 29 +++---
 drivers/gpu/drm/i915/display/intel_opregion.h |  4 +-
 drivers/gpu/drm/i915/display/intel_panel.c    | 10 +-
 drivers/gpu/drm/i915/display/intel_panel.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
 include/drm/drm_edid.h                        |  2 +
 18 files changed, 201 insertions(+), 163 deletions(-)

-- 
2.34.1

