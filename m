Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57239BCA8C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559AA10E55A;
	Tue,  5 Nov 2024 10:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrBs95mu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC45710E557;
 Tue,  5 Nov 2024 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730802949; x=1762338949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feOlI3spYtpssIYRMz5t6piS9n8+L39qQB+GET38Yk0=;
 b=XrBs95muBUH4rn17AtGyjD0Of+/+A4o2pWvFlOfvuqq3vv0vkAFF9sPU
 ba0NIztGEsSaUTaUF1oXcDCwxbCHfVFVBDoff/VuU+jheWVwQjn7UiBic
 m8PLPtiNShGT3r6dtWizDXx6VeCefrHdKkrOVS/wI50IMpy2ZiFTF70Jz
 8K4F5weB6dO0dRC4rMkPUcVVr7ZKwsRwp3WBkJohhOAIZ56cAX9JnOTag
 fv0fRwe1F6vl2DvtpRZQMKynVywRd3eo7gmRSmJvaNym7MLXTE33DHmZU
 75E73biJ5tUM42I0khmyy+AkNltlB9NXaQK22Ue6tg9J9DclKLXj8wBYI A==;
X-CSE-ConnectionGUID: LPYuPp/MSbOMGQ0kANOI7g==
X-CSE-MsgGUID: 9QC6VUABRv+PLJO6oYBD7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34230825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34230825"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 02:35:49 -0800
X-CSE-ConnectionGUID: B0B9Lt3iRGav5Wko3SXmkQ==
X-CSE-MsgGUID: 2D4iEqOIRWGvyCdeCgmt8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83485531"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 02:35:47 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 0/4] Expose modifiers/formats supported by async flips
Date: Tue,  5 Nov 2024 15:56:04 +0530
Message-Id: <20241105102608.3912133-1-arun.r.murthy@intel.com>
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

All of the formats/modifiers supported by the plane during synchronous
flips are nor supported by asynchronous flips. The formats/modifiers
exposed to user by IN_FORMATS exposes all formats/modifiers supported by
plane and this list varies for async flips. If the async flip supported
formats/modifiers are exposed to the user, user based on this list can
take decision to proceed or not and avoid flip failures during async
flips.
Discussion around this can be located @
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
Userspace implementation for IN_FORMARTS_ASYNC under review @
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4063

Arun R Murthy (4):
  drm/plane: Add new plane property IN_FORMATS_ASYNC
  drm/i915/fb: Add async field to the modifiers description
  drm/i915/display: Add async_flip flag in get_modifiers
  drm/i915/display: Add async supported formats/modifiers

 drivers/gpu/drm/drm_mode_config.c             |  7 ++
 drivers/gpu/drm/drm_plane.c                   | 73 +++++++++++++++++++
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_fb.c       | 53 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_fb.h       |  4 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +-
 .../drm/i915/display/skl_universal_plane.c    | 25 ++++++-
 include/drm/drm_mode_config.h                 |  6 ++
 include/drm/drm_plane.h                       | 10 +++
 10 files changed, 172 insertions(+), 12 deletions(-)

-- 
2.25.1

