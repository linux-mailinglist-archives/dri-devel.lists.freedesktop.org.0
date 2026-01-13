Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8574D18271
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 11:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2B10E49D;
	Tue, 13 Jan 2026 10:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSnebKPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C87C10E00D;
 Tue, 13 Jan 2026 10:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768301311; x=1799837311;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QwZVWTH/9HufaZltQ2NdpLlXVtnsbYul0/FazH5ULeQ=;
 b=BSnebKPblRw8cwDY7zh0g39GWA9piXxlUT10SXpA4Wep2IcTjYE1EJfc
 iYFQHt1lK+4oiPKIuKaq9Sq06vSyN5g2VY5OP44gbr59XxpnCWY3lt9+T
 AJxdmxAdJiLMTnVIJ0ufikn/QY3AdPeLnNJx15g1Rm9NgXRWd43Pg+qUF
 5L64ISxA83vp24LiOJX5NaokNWddPn5lcV4AXnlEzRIZZ5taTsL9gzhSL
 Z/pBaEKq/7RHa9FGYfpfiOi++MS0BpnXQAg2UIN/tVNVgLtxNOYANF096
 45iYL85KUEhrT5akCy+1LqRYhz/jGyDtxYe1nQ4COvp/aILQYnsXtIlr3 g==;
X-CSE-ConnectionGUID: m9Hs2wlYSs23cTvPp4k1NA==
X-CSE-MsgGUID: iKTXqp28RMeolUz6a9iicQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="87165154"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="87165154"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 02:48:30 -0800
X-CSE-ConnectionGUID: dI1WF/woQvKWePRN2JMQDQ==
X-CSE-MsgGUID: EA8w1hT2SHmXpl7xMYAeWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="227554573"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 02:48:26 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: [PATCH v3 00/13] drm: Color pipeline teardown and follow-up
 fixes/improvements
Date: Tue, 13 Jan 2026 15:52:50 +0530
Message-Id: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series contains follow-up fixes and improvements for the DRM color
pipeline infrastructure that was introduced in v6.19.[1][2]

The central handling of clean up of colorop from the mode_config list
is missing. While vkms calls drm_colorop_pipeline_destroy() in vkms_destroy(),
amd driver calls it only during failure of the init path and i915/xe driver
does not call it at all. This means amd and intel leaks these objects on
driver removal.

This series adds the teardown of mode_config.colorop_list in drm_mode_config_cleanup().
Since, i915/xe sub-classes the drm_colorop within intel_colorop it was not enough
to just use drm_colorop_pipeline_destroy(). Therefore, this series

- Introduces driver-managed destruction for drm_colorop objects and
  updates core helpers to use driver-provided destroy callbacks.
- Ensures all colorop objects are correctly torn down during
  mode_config cleanup and driver removal.

In addition to that following changes are made in the series
- Fixes enum name lifetime leaks in color pipeline init in i915, amdgpu_dm, and vkms
- Corrects the ordering of the 3D LUT block in the i915 plane color pipeline
- Refactors i915 plane color pipeline initialization to reliably clean
  up partially constructed pipelines on failure.

Thanks for taking a look. Feedback is welcome.

[1] https://lore.kernel.org/dri-devel/cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com/
[2] https://lore.kernel.org/intel-gfx/20251203085211.3663374-1-uma.shankar@intel.com/

v2:
 - Re-arrange patches (Alex)
 - Re-factor code to avoid repitition in pipeline creation (Suraj)

v3:
 - Add documentation only to function definition (Jani)
 - s/nvl/xe3plpd (Suraj)

Chaitanya Kumar Borah (13):
  drm/i915/color: Place 3D LUT after CSC in plane color pipeline
  drm/amd/display: Fix color pipeline enum name leak
  drm/vkms: Fix color pipeline enum name leak
  drm/i915/display: Fix color pipeline enum name leak
  drm/colorop: Add destroy helper for colorop objects
  drm: Allow driver-managed destruction of colorop objects
  drm/amd/display: Hook up colorop destroy helper for plane pipelines
  drm/vkms: Hook up colorop destroy helper for plane pipelines
  drm/i915/display: Hook up intel_colorop_destroy
  drm: Clean up colorop objects during mode_config cleanup
  drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
  drm/colorop: Use destroy callback for color pipeline teardown
  drm/i915/color: Add failure handling in plane color pipeline init

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  31 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
 drivers/gpu/drm/drm_colorop.c                 |  49 +++--
 drivers/gpu/drm/drm_mode_config.c             |   6 +
 .../drm/i915/display/intel_color_pipeline.c   | 179 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_colorop.c  |   6 +
 drivers/gpu/drm/i915/display/intel_colorop.h  |   1 +
 drivers/gpu/drm/vkms/vkms_colorop.c           |  31 +--
 drivers/gpu/drm/vkms/vkms_drv.c               |   1 -
 include/drm/drm_colorop.h                     |  32 +++-
 10 files changed, 259 insertions(+), 90 deletions(-)

-- 
2.25.1

