Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184F65D02A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E748110E52F;
	Wed,  4 Jan 2023 10:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EA310E52F;
 Wed,  4 Jan 2023 10:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826746; x=1704362746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xWwVZfw08R8K/Rh6s4MkXwZQigXtGR2d8/p23NYPJTA=;
 b=XjTfAJAUc7WxLyKBlMrTyCRfwMFiVFnAxCicEAugQoJ3x3ZIGYbI4HlJ
 1uFTSUeqyy5dt2h6/dgSHDEp8UGUkBFGMUDzfpnc6e4crN053uj90HP7S
 7WZOBiXEiUDbD3tYiQ09MsoDosI8lDstydlAu1ung2RvwcyA3MwRux6LD
 Sv4lxvYEYFLCRbZ5/FoDbCE+a3NOJUaGh+GwpPXl34KUtJ8EOqqd2kkOZ
 QesfPpof2tEta7m08bUr/oaG2JpzJTuHdo3QfC4G/ZhNTVhIvyT7aKTAq
 FfBc4Fp4Cx2NL377VR+B8nBehvM6WpLG1bRg4cwg5YoP7uGzWnm1uNyv0 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333671"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333671"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983876961"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983876961"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 00/22] drm/edid: info & modes parsing and drm_edid refactors
Date: Wed,  4 Jan 2023 12:05:15 +0200
Message-Id: <cover.1672826282.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another step deeper into the EDID rabbit hole.

v7 of [1], with a bunch of stuff added regarding display info and modes
parsing. Primarily separating them to two distinct steps. To do that
cleanly, we need a bunch of refactors. This should clean up any
inconsistent states with add modes modifying the display info. And
generally make the code neater.

There are also a couple of bug fixes first.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/112014/


Jani Nikula (22):
  drm/edid: fix AVI infoframe aspect ratio handling
  drm/edid: fix parsing of 3D modes from HDMI VSDB
  drm/edid: parse VICs from CTA VDB early
  drm/edid: Use the pre-parsed VICs
  drm/edid: use VIC in AVI infoframe if sink lists it in CTA VDB
  drm/edid: rename struct drm_display_info *display to *info
  drm/edid: refactor CTA Y420CMDB parsing
  drm/edid: split CTA Y420VDB info and mode parsing
  drm/edid: fix and clarify HDMI VSDB audio latency parsing
  drm/edid: add helper for HDMI VSDB audio latency field length
  drm/edid: split HDMI VSDB info and mode parsing
  drm/edid: store quirks in display info
  drm/edid: stop passing quirks around
  drm/edid: merge ELD handling to update_display_info()
  drm/edid: move EDID BPC quirk application to update_display_info()
  drm/edid: refactor _drm_edid_connector_update() and rename
  drm/edid: add separate drm_edid_connector_add_modes()
  drm/edid: remove redundant _drm_connector_update_edid_property()
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/i915/opregion: convert intel_opregion_get_edid() to struct
    drm_edid
  drm/i915/panel: move panel fixed EDID to struct intel_panel

 drivers/gpu/drm/drm_connector.c               |   1 +
 drivers/gpu/drm/drm_edid.c                    | 554 ++++++++++--------
 drivers/gpu/drm/drm_probe_helper.c            |   4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  23 +-
 drivers/gpu/drm/i915/display/intel_bios.h     |   4 +-
 .../gpu/drm/i915/display/intel_connector.c    |   5 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  91 +--
 drivers/gpu/drm/i915/display/intel_dvo.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  28 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  51 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |  29 +-
 drivers/gpu/drm/i915/display/intel_opregion.h |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  10 +-
 drivers/gpu/drm/i915/display/intel_panel.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 include/drm/drm_connector.h                   |  18 +-
 include/drm/drm_edid.h                        |   2 +
 20 files changed, 488 insertions(+), 356 deletions(-)

-- 
2.34.1

