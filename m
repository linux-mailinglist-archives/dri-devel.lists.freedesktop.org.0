Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374245A972F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA7810E6F3;
	Thu,  1 Sep 2022 12:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5578E10E6F2;
 Thu,  1 Sep 2022 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036453; x=1693572453;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWGME9fEdG3M8HkVb+YATaForw5QOx/3sgZwk3gITYM=;
 b=oIdVX0buVrVLcIQLGd4rGBEeePi06vtqdKK7E2GuMTg6/rZy9i13UxQO
 jauGumPD8/0ZFg7xIr6Rwvw4OZCJZxzqH/j+ojtLoFDpgToxfQSEVaI9H
 n+zNE8Nyid6wdTUMtBpreddafZF7qRSMwo5tNdoJIpZWbBiF/1CK9ILyB
 vSLyY0aC/hBpMnNS1xfL4Hbh+Mbqh4pero3UYpsUGTBrj1VUamdRmb1ha
 73cpslT+flTojCSSNZlBDpd2YO9RstmKyj5upDg5w19vrWkBanHWe85u8
 d26GVO42LhSbLhSpG8E1w5hbnjiadjOBDza8oxvu/KHM9OkJG7iiCG+L9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282682897"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="282682897"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="642318075"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm: convert to using is_hdmi and has_audio from display
 info
Date: Thu,  1 Sep 2022 15:47:02 +0300
Message-Id: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, amd-gfx@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Alex Deucher <alexander.deucher@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Alain Volmat <alain.volmat@foss.st.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The low-hanging fruit of the drm todo item "Replace
drm_detect_hdmi_monitor() with drm_display_info.is_hdmi", with has_audio
changes on top.

I'm afraid not all of these have been even build tested, let alone
actually tested.


BR,
Jani.


Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> 
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org

Jani Nikula (9):
  drm/edid: parse display info has_audio similar to is_hdmi
  drm/nouveau: convert to using is_hdmi and has_audio from display info
  drm/radeon: convert to using is_hdmi and has_audio from display info
  drm/tegra: convert to using is_hdmi from display info
  drm/exynos: convert to using is_hdmi from display info
  drm/i2c/tda998x: convert to using has_audio from display_info
  drm/sti/sti_hdmi: convert to using is_hdmi from display info
  drm/rockchip: cdn-dp: call drm_connector_update_edid_property()
    unconditionally
  drm/rockchip: convert to using has_audio from display_info

 drivers/gpu/drm/drm_edid.c                  |  6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c        |  5 +++--
 drivers/gpu/drm/i2c/tda998x_drv.c           |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/head.c     |  8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c |  2 +-
 drivers/gpu/drm/radeon/atombios_encoders.c  | 10 +++++-----
 drivers/gpu/drm/radeon/evergreen_hdmi.c     |  5 ++---
 drivers/gpu/drm/radeon/radeon_audio.c       |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c  | 12 ++++++------
 drivers/gpu/drm/radeon/radeon_display.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c    |  4 ++--
 drivers/gpu/drm/rockchip/cdn-dp-core.c      |  7 +++----
 drivers/gpu/drm/rockchip/inno_hdmi.c        |  3 ++-
 drivers/gpu/drm/sti/sti_hdmi.c              | 11 ++++++-----
 drivers/gpu/drm/sti/sti_hdmi.h              |  2 --
 drivers/gpu/drm/tegra/hdmi.c                |  9 +--------
 include/drm/drm_connector.h                 |  8 ++++++++
 18 files changed, 55 insertions(+), 55 deletions(-)

-- 
2.34.1

