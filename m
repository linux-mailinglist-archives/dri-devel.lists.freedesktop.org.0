Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPgxBV13gGmo8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8205CA810
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F87010E3E7;
	Mon,  2 Feb 2026 10:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4SGH7W7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0796610E3E3;
 Mon,  2 Feb 2026 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770026840; x=1801562840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4HSREWSRSvWejvmPq4Zlvq2u0ICsOGcN52hYCOuVMf4=;
 b=l4SGH7W7X+A0Ket2gVW+4DQUr+S+InZu65E0WOkT5LqAkBOr4SsMEaEt
 flHGwn1htrnfPD2Wer1kYcnR9bQN1H23BIiulcHhpKG3pBVPHf9Ahjhx2
 UpVsF+X1nhfEpsv4LYPCYgkudTbWbOaLEoi+GW/deNrNL7BUd5NOCkf1i
 3atXUK1u8nFzWgjtIykZAHnznL53dtVJiMgVCO17PV2GBsPA420sPqXT3
 YD+HyvXJB0TKpWDAKtIcZ+BRk6HznT3maVecWKgz2k8WU+cn4e94bV7nc
 7cCJLCrOuPi1JmkgWU4DJBrunAiOlCXymnphvo+Thwvnrx+s7OGBn+7Uf w==;
X-CSE-ConnectionGUID: /BJjZQ+ZT8mkQVY57UPl0w==
X-CSE-MsgGUID: n/lojYl5QHeyfEl5QpfbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71163332"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71163332"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:07:19 -0800
X-CSE-ConnectionGUID: H5xv2sNlSZau5W1EC2zH9g==
X-CSE-MsgGUID: I+Yy25z8R9K6LRuHQiR4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208984811"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2026 02:07:15 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com,
 maarten.lankhorst@intel.com, chaitanya.kumar.borah@intel.com
Subject: [RESEND 0/9] drm: Color pipeline teardown and follow-up
 fixes/improvements
Date: Mon,  2 Feb 2026 15:11:53 +0530
Message-Id: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B8205CA810
X-Rspamd-Action: no action

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

resend:
 - for merge (remaining patches)

Chaitanya Kumar Borah (9):
  drm/colorop: Add destroy helper for colorop objects
  drm: Allow driver-managed destruction of colorop objects
  drm/amd/display: Hook up colorop destroy helper for plane pipelines
  drm/vkms: Hook up colorop destroy helper for plane pipelines
  drm/i915/display: Hook up intel_colorop_destroy
  drm: Clean up colorop objects during mode_config cleanup
  drm/vkms: Remove drm_colorop_pipeline_destroy() from vkms_destroy()
  drm/colorop: Use destroy callback for color pipeline teardown
  drm/i915/color: Add failure handling in plane color pipeline init

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  27 ++-
 drivers/gpu/drm/drm_colorop.c                 |  49 +++--
 drivers/gpu/drm/drm_mode_config.c             |   6 +
 .../drm/i915/display/intel_color_pipeline.c   | 171 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_colorop.c  |   6 +
 drivers/gpu/drm/i915/display/intel_colorop.h  |   1 +
 drivers/gpu/drm/vkms/vkms_colorop.c           |  16 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   1 -
 include/drm/drm_colorop.h                     |  32 +++-
 9 files changed, 231 insertions(+), 78 deletions(-)

-- 
2.25.1

