Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFFAB097B
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 07:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4E10E224;
	Fri,  9 May 2025 05:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hO4j4uWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21110E1B6;
 Fri,  9 May 2025 05:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746767922; x=1778303922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hVGH4H93Fm6zzuVz7HC0Y6/LKbY6TuJNbjhJrNnl6CY=;
 b=hO4j4uWdrvKjAYnfulEUIGWZsCh9K+Xq05tICXhm7LSpLW7fz393prLk
 GjpYc3DriJExlzek/HF2phLO6fu4w8rlWcUDBYyQZQehE7I9Se1pxyCg/
 GTzESRhXAFCkrPYYSF5GNw/hzoPtfXZh8n+tistLLXS6mX/L7+6sBVfsm
 tHRaMh3oqLWjhVV148/mXHc8HLdA/x2VRfuBblLgVjmW6xtCanw7icrLc
 YBUOpNcrgRiiZFzOPldQ5qgXNE8cxLQ+gNLp9WjH/s3uP/r87WZqPWXK6
 3wA9Hpt7Unzt/rR0NGV0CRGf8BqzXMVVXNJxdCLd8SIqmNCzBwcgv/usd A==;
X-CSE-ConnectionGUID: HJSjpJ3DTy6bOpoxS8FxTQ==
X-CSE-MsgGUID: BJdEmoOxTquS5xvCLPpgRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48287086"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="48287086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:18:41 -0700
X-CSE-ConnectionGUID: z5j2J5hSTwG+ryS2jn2ahA==
X-CSE-MsgGUID: goUJKbM8QNmM007wacCovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="141414800"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 22:18:39 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 00/13] Modify drm helpers to use luminance
Date: Fri,  9 May 2025 10:48:03 +0530
Message-Id: <20250509051816.1244486-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series modifies drm dp edp helpers so that drivers can now use them
to manipulate brightness using luminance value via the
PANEL_TARGET_LUMINANCE_VALUE register. This feature was
introduced frin eDP 1.5.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (13):
  drm/dp: Introduce new member in drm_backlight_info
  drm/dp: Add argument in drm_edp_backlight_init
  drm/dp: Add argument for luminance range info in
    drm_edp_backlight_init
  drm/dp: Move from u16 to u32 for max in drm_edp_backlight_info
  drm/dp: Change current_level argument type to u32
  drm/dp: Modify drm_edp_probe_state
  drm/dp: Change argument type for drm_edp_backlight_set_level
  drm/dp: Modify drm_edp_backlight_set_level
  drm/dp: Change argument type of drm_edp_backlight_enable
  drm/dp: Enable backlight control using luminance
  drm/i915/backlight: Use drm helper to initialize edp backlight
  drm/i915/backlight: Use drm helper to set edp backlight
  drm/i915/backlight: Use drm_edp_backlight_enable

 drivers/gpu/drm/display/drm_dp_helper.c       |  88 ++++++++---
 .../drm/i915/display/intel_dp_aux_backlight.c | 143 ++++++------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   9 +-
 include/drm/display/drm_dp_helper.h           |  10 +-
 5 files changed, 126 insertions(+), 126 deletions(-)

-- 
2.34.1

