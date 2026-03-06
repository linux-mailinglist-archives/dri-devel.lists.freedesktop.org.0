Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDdNB1oMq2k/ZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA06225D15
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDB910E3DF;
	Fri,  6 Mar 2026 17:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqiyRb3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A74D10E3D3;
 Fri,  6 Mar 2026 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817492; x=1804353492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sqUrQTSrxSrcXheMOT2WlDFt8XWbDX+41L0L1H01cC8=;
 b=UqiyRb3p1E9167YA+1bc0Fl3PgtDTzh5vinn99oVQbZ641tPgOx6tsgq
 3EssJf2E+9kP57papsJK8aihVLl5y4364gGr1/R6fzQ6Y4vyvtYntRnDw
 xy7L/AxVHI45RbsEgYUfJS8fzw3jIBKFifr7ZoGbFlGHvrGr38zuXVr+a
 C+EI/aizf/WZM8S6oza71zoAGslbbWg4dS95q5E/w9zGzfMY0zk0gvBfj
 yEAYUoAdhuwybm6B4vdVvcnO54uxaa/2ol9b+tx+zlPjShD+6zJeUuQ02
 8dAwTn7LXI8H/MQTedEAOZNN3GijPVmFw9NE9ACew3FdW8yMRF4dfnb2+ w==;
X-CSE-ConnectionGUID: w96YRMufRKaX7i2sNWUM4Q==
X-CSE-MsgGUID: W7ZZO3OfSAK6WJz+et+Wpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530618"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530618"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:18:11 -0800
X-CSE-ConnectionGUID: z7ZbrDrESUaavZ1Q3Ic/Cw==
X-CSE-MsgGUID: /vqcfRUYT5a99XqzerRZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216174923"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:07 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 00/10] drm/i915/color: Enable SDR plane color pipeline
Date: Fri,  6 Mar 2026 22:22:57 +0530
Message-Id: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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
X-Rspamd-Queue-Id: 4DA06225D15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This series adds color pipeline support for SDR planes in i915 and
exposes the functionality to userspace through the DRM colorop
framework.

In contrast to HDR planes, SDR planes have LUTs with smaller sizes
and a fixed function CSC block in contrast to a programmable CTM.

The series first introduces a new DRM colorop type,
DRM_COLOROP_CSC_FF, which represents fixed-function CSC blocks where
userspace selects predefined hardware conversion modes instead of
programming arbitrary matrices.

With that, the SDR plane color pipeline looks like.

[1D LUT] -> [CSC_FF] -> [1D LUT]

The series also fixes an issue in HDR pre-CSC LUT programming where the
loop condition prevented the last entries from being programmed.

Chaitanya Kumar Borah (5):
  drm/colorop: Add DRM_COLOROP_CSC_FF
  drm/i915/color: Add CSC on SDR plane color pipeline
  drm/i915/color: Program fixed-function CSC on SDR planes
  drm/i915/color: Add support for 1D LUT in SDR planes
  drm/i915/color: Add color pipeline support for SDR planes

Pranay Samala (5):
  drm/i915/color: Fix HDR pre-CSC LUT programming loop
  drm/i915/color: Extract HDR pre-CSC LUT programming to helper function
  drm/i915/color: Program Pre-CSC registers for SDR
  drm/i915/color: Extract HDR post-CSC LUT programming to helper
    function
  drm/i915/color: Program Plane Post CSC registers for SDR planes

 drivers/gpu/drm/drm_atomic.c                  |   4 +
 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_colorop.c                 | 105 +++++++
 drivers/gpu/drm/i915/display/intel_color.c    | 288 +++++++++++++-----
 .../drm/i915/display/intel_color_pipeline.c   |  37 ++-
 .../drm/i915/display/intel_display_limits.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_plane.c    |  12 +-
 .../drm/i915/display/skl_universal_plane.c    |  30 ++
 include/drm/drm_colorop.h                     |  72 +++++
 include/uapi/drm/drm_mode.h                   |  13 +
 11 files changed, 475 insertions(+), 93 deletions(-)

-- 
2.25.1

