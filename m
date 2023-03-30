Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0EB6D09EB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F0710EED6;
	Thu, 30 Mar 2023 15:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01F310EED9;
 Thu, 30 Mar 2023 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190807; x=1711726807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0FhdH0p/HcWeBfk5OJ7HWQw0UUWQdBGYy04tFYP7/6M=;
 b=n89gg+p7ASW5oF+nA56LbsoUEeRJ/hGtSkOEZKYiqDKoLJgsBT4E++L+
 UHg1ZyNyc9p5b/Hyrfts8qX6W/zrsxndtVKRSsEQRcFvgBQblqhH4iwiR
 0lkrNHPnxHTsGnZWc0LhQl0pxp2wnPvN/vy/QxGqUMocRx5aTbOa+aWo5
 HsRUtSogOLxaYuyaTEjE2FOF28wYBHMh89Wn3DeKubwDlet/UyWuwbgeW
 Vqa+d1o1wTIvNEyMPH4fttMGfBxLf9eQonp6bA4DUknvJm55eEbfvw0v8
 oWbbk8NoltNB7Jm32BoheJSx0+iMBldE0eTCCmJfYYwkK0GBnQbwpb5g2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722047"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722047"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774032104"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="774032104"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:39:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/12] drm: reduce
 drm_detect_monitor_audio/drm_detect_hdmi_monitor/edid_blob_ptr usage
Date: Thu, 30 Mar 2023 18:39:37 +0300
Message-Id: <cover.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Karol Herbst <kherbst@redhat.com>, jani.nikula@intel.com,
	nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
	Sandy Huang <hjc@rock-chips.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

THIS IS UNTESTED for anything other than i915.

Use previously parsed EDID where possible for display audio/hdmi
detection. This in turn reduces edid_blob_ptr usage in a number of
places. Further reduce edid_blob_ptr usage, and document that it should
not be used by drivers directly.

BR,
Jani.


Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>


Jani Nikula (12):
  drm/edid: parse display info has_audio similar to is_hdmi
  drm/nouveau: convert to using is_hdmi and has_audio from display info
  drm/radeon: convert to using is_hdmi and has_audio from display info
  drm/radeon: remove radeon_connector_edid() and stop using
    edid_blob_ptr
  drm/amdgpu: remove amdgpu_connector_edid() and stop using
    edid_blob_ptr
  drm/i915/debugfs: stop using edid_blob_ptr
  drm/exynos: fix is_hdmi usage
  drm/i2c/tda998x: convert to using has_audio from display_info
  drm/sti/sti_hdmi: convert to using is_hdmi from display info
  drm/rockchip: cdn-dp: call drm_connector_update_edid_property()
    unconditionally
  drm/rockchip: convert to using has_audio from display_info
  drm/connector: update edid_blob_ptr documentation

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 15 -----------
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.h    |  1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +--
 drivers/gpu/drm/drm_edid.c                    |  6 +++++
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  3 ++-
 drivers/gpu/drm/i2c/tda998x_drv.c             |  2 +-
 .../drm/i915/display/intel_display_debugfs.c  | 10 +++----
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  8 +++---
 drivers/gpu/drm/nouveau/dispnv50/head.c       |  8 +-----
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c    | 10 +++----
 drivers/gpu/drm/radeon/evergreen_hdmi.c       |  5 ++--
 drivers/gpu/drm/radeon/radeon_audio.c         | 11 ++++----
 drivers/gpu/drm/radeon/radeon_connectors.c    | 27 +++++--------------
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
 drivers/gpu/drm/radeon/radeon_mode.h          |  2 --
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  7 +++--
 drivers/gpu/drm/rockchip/inno_hdmi.c          |  3 ++-
 drivers/gpu/drm/sti/sti_hdmi.c                | 11 ++++----
 drivers/gpu/drm/sti/sti_hdmi.h                |  2 --
 include/drm/drm_connector.h                   | 14 +++++++++-
 25 files changed, 73 insertions(+), 96 deletions(-)

-- 
2.39.2

