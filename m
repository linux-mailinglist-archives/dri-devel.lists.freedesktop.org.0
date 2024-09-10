Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B89730B2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43D010E06F;
	Tue, 10 Sep 2024 10:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDI4goDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D327C10E061;
 Tue, 10 Sep 2024 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962631; x=1757498631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/qKG54t7t+s2WkY01W9CGiSMSBFLZqi4IbC9ArFzHAc=;
 b=gDI4goDmvtWNCJGgCrFpi7c2drxtYo7K+t3SbEJA4vpvtn2x/6v0I9pK
 ZVKJUGkAAI+A4F4XwmGFnBN184wp8bwsmXa1mTI83MHnsFmT2lCoQp25H
 Y1b8qm4TJ931BC+m6sFtsQT810/oTcrTZhZ2gVMxgP4V+0GCnv+yDjEWc
 64VSo36RlFI0zDK2MFeXXPMLwfatAZXxvazc4fVB096BwvTmcfDyn5Gyk
 Ld9GSoxMuKAwesOSaZ0pksWz0Se3uS6oAn8XaMgSnQtPgpV5nMQLpy667
 ypX5rHy9Sgv9X35ZUMMABEJFmhhk6Dkf9pWzwzCAMwXf2tywOmbk53CLx A==;
X-CSE-ConnectionGUID: b8hvN7tsSUKKat9nkzf1bQ==
X-CSE-MsgGUID: wXBTIbIBS1ipfvJVR4A5Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28479056"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="28479056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:03:51 -0700
X-CSE-ConnectionGUID: ZVnd1QTUQCqqBc4Mn1fVeg==
X-CSE-MsgGUID: fLUjIyI1TVWRc2afKdpTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71381983"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:03:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/8] drm: fix and enable warnings on unused static inlines
Date: Tue, 10 Sep 2024 13:03:36 +0300
Message-Id: <cover.1725962479.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow-up to [1].

Annotate unused static inlines with __maybe_unused. In some cases it
might be better to remove them, but it's really up to the maintainers
what to do. Then enable the warning on default across subsystem.

BR,
Jani.

[1] https://lore.kernel.org/r/20240904123819.3784906-1-jani.nikula@intel.com


Jani Nikula (8):
  drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with __maybe_unused
  drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
  drm/kmb: annotate set_test_mode_src_osc_freq_target_{low,hi}_bits()
    with __maybe_unused
  drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request,release}
    with __maybe_unused
  drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused
  drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits() with
    __maybe_unused
  drm/msmi: annotate pll_cmp_to_fdata() with __maybe_unused
  drm: enable warnings on unused static inlines

 drivers/gpu/drm/Makefile                            | 3 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c               | 4 ++--
 drivers/gpu/drm/imagination/pvr_drv.c               | 2 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                       | 4 ++--
 drivers/gpu/drm/meson/meson_dw_hdmi.c               | 8 ++++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c            | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c          | 2 +-
 8 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.39.2

