Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B84BB620
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0110E240;
	Fri, 18 Feb 2022 10:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE1810E240;
 Fri, 18 Feb 2022 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178655; x=1676714655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=stdZieqOPeTYM4fZPShDTH9sPVJsu1F9iRmFq4q1S1Y=;
 b=ERItGS3XBf24mNxbdZlRIbJ3IolkUHm7Ct3H7JPXP4hWNgE+zmsEW/mZ
 l0LwUJ2MvSvtyGcjjVU5I4k+eXKoI6ogNu524OgsKxvMyUqEXfaZI5h8G
 bvX01G21pl6z42lyGvFZ7RcikHub69HkjmlnsBipZX34Rew/7T3YHu+d1
 UY5sQFxEWyYnmvCQQr8b6NGFmM5B0ckqBA08vGjb9tMGyY1lYO/HQxHIa
 OSlK12hNM0JgKaNUGlRUdb++YGxUY5YMRcMjOBVcqSHpKs9SxGtK81G7y
 AuYzDR+uFFpw7OcepcPKZMVZN6+V+85Glh4hmN6qII1tYYt3ja+khGnMe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250853355"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="250853355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="682442318"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 18 Feb 2022 02:04:04 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:03 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/22] drm: Review of mode copies
Date: Fri, 18 Feb 2022 12:03:41 +0200
Message-Id: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Chen Feng <puck.chen@hisilicon.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nikola Cornij <nikola.cornij@amd.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I might be taking this a bit too far, but the lack of
consistency in our methods to copy drm_display_mode
structs around is bugging me.

The main worry is the embedded list head, which if
clobbered could lead to list corruption. I'd also
prefer to make sure even the valid list heads don't
propagate between copies since that makes no sense.

While going through some of the code I also spotted
some very weird on stack copies being made for no
reason at all. I elimininated a few of them here,
but there could certainly be more lurking in the
shadows.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Emma Anholt <emma@anholt.net>
Cc: freedreno@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nikola Cornij <nikola.cornij@amd.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>

Ville Syrjälä (22):
  drm: Add drm_mode_init()
  drm/amdgpu: Remove pointless on stack mode copies
  drm/amdgpu: Use drm_mode_init() for on-stack modes
  drm/amdgpu: Use drm_mode_copy()
  drm/radeon: Use drm_mode_copy()
  drm/bridge: Use drm_mode_copy()
  drm/gma500: Use drm_mode_copy()
  drm/hisilicon: Use drm_mode_init() for on-stack modes
  drm/imx: Use drm_mode_duplicate()
  drm/msm: Nuke weird on stack mode copy
  drm/msm: Use drm_mode_init() for on-stack modes
  drm/msm: Use drm_mode_copy()
  drm/mtk: Use drm_mode_init() for on-stack modes
  drm/rockchip: Use drm_mode_copy()
  drm/sti: Use drm_mode_copy()
  drm/tilcdc: Use drm_mode_copy()
  drm/vc4: Use drm_mode_copy()
  drm/i915: Use drm_mode_init() for on-stack modes
  drm/i915: Use drm_mode_copy()
  drm/panel: Use drm_mode_duplicate()
  drm: Use drm_mode_init() for on-stack modes
  drm: Use drm_mode_copy()

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 ++++++++++---------
 drivers/gpu/drm/bridge/nwl-dsi.c              |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
 drivers/gpu/drm/bridge/tc358767.c             |  2 +-
 drivers/gpu/drm/drm_crtc_helper.c             | 12 +++---
 drivers/gpu/drm/drm_edid.c                    |  8 +++-
 drivers/gpu/drm/drm_modes.c                   | 21 +++++++++-
 drivers/gpu/drm/drm_vblank.c                  |  2 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |  8 +---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 20 +++++----
 drivers/gpu/drm/imx/imx-ldb.c                 |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 ++--
 drivers/gpu/drm/msm/dp/dp_display.c           |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c               | 10 ++---
 drivers/gpu/drm/panel/panel-truly-nt35597.c   |  3 +-
 .../gpu/drm/panel/panel-visionox-rm69299.c    |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |  2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  5 +--
 include/drm/drm_modes.h                       |  2 +
 30 files changed, 105 insertions(+), 79 deletions(-)

-- 
2.34.1

