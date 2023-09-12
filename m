Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBB79CF3C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF08510E333;
	Tue, 12 Sep 2023 11:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7BD10E333;
 Tue, 12 Sep 2023 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694516816; x=1726052816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bIbLlDrgxNpvGUCjTaKU/P5D0cTKomAXb3VJtL5p9e8=;
 b=JmZD74yeUqi2GMv3R9Kb4t+l4ISirLxiALnVCkAlK6cIJ2DcnksoLSdM
 sv1OHiG4qBdxCGSD0v2qv6uXMlwv++abueaEyuhY1et/l/xwIKoSLr20H
 s//0IBSBOrTFTiTvmq0DGzTaGpOJqMJYXgIaZ2THorSWsSJYBn056XT9n
 NAXNlQOzpyjUNCEVapHxEc4FFRx96U8EPQwnrjSeinUkpmd86SnxQFgXa
 SmC+ev81Yf6trCnw2J+8SupLyTEk2oRsOM6pcIeVfbM/xO4pmw9W+lSp2
 BTdI2+xKN2Lv+4UxFcf4xB2M4BxQDeMF0Q4hmFpghRHI3DV2nvlMg9ynv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="381042219"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381042219"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833871050"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="833871050"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:06:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/19] drm/i915: prepare for xe driver display integration
Date: Tue, 12 Sep 2023 14:06:27 +0300
Message-Id: <cover.1694514689.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The upcoming drm/xe driver [1][2] will reuse the drm/i915 display code,
initially by compiling the relevant compilation units separately as part
of the xe driver. This series prepares for that in i915 side.

The first patch defines I915 during the i915 driver build, to allow
conditional compilation based on the driver the code is being built for.

The rest of the patches add stubs for functions in files that aren't
used in xe. The idea is that this is the least intrusive way of skipping
that code in xe, and is quite similar to the common kconfig stubs.

While this is arguably unused code for the time being, or only used in
an out-of-tree driver yet to be upstreamed, the upstreaming has to start
somewhere.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next
[2] https://patchwork.freedesktop.org/series/112188/

Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jani Nikula (19):
  drm/i915: define I915 during i915 driver build
  drm/i915/display: add I915 conditional build to intel_lvds.h
  drm/i915/display: add I915 conditional build to hsw_ips.h
  drm/i915/display: add I915 conditional build to i9xx_plane.h
  drm/i915/display: add I915 conditional build to intel_lpe_audio.h
  drm/i915/display: add I915 conditional build to intel_pch_refclk.h
  drm/i915/display: add I915 conditional build to intel_pch_display.h
  drm/i915/display: add I915 conditional build to intel_sprite.h
  drm/i915/display: add I915 conditional build to intel_overlay.h
  drm/i915/display: add I915 conditional build to g4x_dp.h
  drm/i915/display: add I915 conditional build to intel_dpio_phy.h
  drm/i915/display: add I915 conditional build to intel_crt.h
  drm/i915/display: add I915 conditional build to vlv_dsi.h
  drm/i915/display: add I915 conditional build to i9xx_wm.h
  drm/i915/display: add I915 conditional build to g4x_hdmi.h
  drm/i915/display: add I915 conditional build to intel_dvo.h
  drm/i915/display: add I915 conditional build to intel_sdvo.h
  drm/i915/display: add I915 conditional build to intel_tv.h
  drm/i915/display: add I915 conditional build to vlv_dsi_pll.h

 drivers/gpu/drm/i915/Makefile                 |  4 +
 drivers/gpu/drm/i915/display/g4x_dp.h         | 26 +++++
 drivers/gpu/drm/i915/display/g4x_hdmi.h       | 12 +++
 drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++
 drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++
 drivers/gpu/drm/i915/display/i9xx_wm.h        | 17 ++++
 drivers/gpu/drm/i915/display/intel_crt.h      | 14 +++
 drivers/gpu/drm/i915/display/intel_dpio_phy.h | 96 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dvo.h      |  6 ++
 .../gpu/drm/i915/display/intel_lpe_audio.h    | 18 ++++
 drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++
 drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++
 .../gpu/drm/i915/display/intel_pch_display.h  | 53 ++++++++++
 .../gpu/drm/i915/display/intel_pch_refclk.h   | 23 +++++
 drivers/gpu/drm/i915/display/intel_sdvo.h     | 13 +++
 drivers/gpu/drm/i915/display/intel_sprite.h   |  8 ++
 drivers/gpu/drm/i915/display/intel_tv.h       |  6 ++
 drivers/gpu/drm/i915/display/vlv_dsi.h        | 13 +++
 drivers/gpu/drm/i915/display/vlv_dsi_pll.h    |  9 ++
 19 files changed, 430 insertions(+)

-- 
2.39.2

