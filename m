Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FEE42F089
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACECB6ED64;
	Fri, 15 Oct 2021 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D376ECFE;
 Fri, 15 Oct 2021 12:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634297849; bh=xi9ic6rNqNfCIC+YJGI2Qm9dmzmQTWcVKBbK7NFXYTk=;
 h=X-EA-Auth:From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=OmJv4PLckPjknJhn0d4syEDqIRksrDZ/mWSxGN5cEWGIQdy/ieVxmM6l7ju27JiYp
 0xMWKv8ifisKXgIknFw6vWmfV4B0udu15xnn60hwr4XtWY4aWdMyOzIaPlpa00GLSx
 rn1bdevk+AZmxmoKp3R47M/isNzRWt3JveBcrLF8=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 13:37:28 +0200 (CEST)
X-EA-Auth: 08sQSZ7/eUlrG/v1waT2s0v4RKFNiGr8japsCPLL1asNAYrDQHDNT4gppui4+kCQ9szInBhEU478UxEKqmZHFa/iYlv5DVF8
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 00/15] replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Fri, 15 Oct 2021 13:36:58 +0200
Message-Id: <20211015113713.630119-1-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
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

Copy&paste from the TODO document Documentation/gpu/todo.rst 

===
Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
---------------------------------------------------------------

Once EDID is parsed, the monitor HDMI support information is available through
drm_display_info.is_hdmi. Many drivers still call drm_detect_hdmi_monitor() to
retrieve the same information, which is less efficient.

Audit each individual driver calling drm_detect_hdmi_monitor() and switch to
drm_display_info.is_hdmi if applicable.
=====

I did it in two steps:
- check that drm_display_info has a correct value.
- in that case, replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi

Almost all occurrences of drm_detect_hdmi_monitor() could be changed. Some
small inconsistencies have been solved.

Stats:
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c            | 23 ++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.h            |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c               |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c              |  4 ++--
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c            |  6 +++---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         |  3 +--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++++++++---------------------------
 drivers/gpu/drm/amd/display/dc/core/dc.c                  |  2 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h               |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c              |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                 |  2 +-
 drivers/gpu/drm/drm_edid.c                                |  2 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c                      |  6 ++++--
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c                   |  3 ++-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c                   |  6 ++++--
 drivers/gpu/drm/i915/display/intel_connector.c            |  5 +++++
 drivers/gpu/drm/i915/display/intel_connector.h            |  1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c                 |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c                 |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c                 |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   |  4 ++--
 drivers/gpu/drm/nouveau/dispnv50/head.c                   |  8 +-------
 drivers/gpu/drm/nouveau/nouveau_connector.c               |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h               |  6 ++++++
 drivers/gpu/drm/radeon/atombios_encoders.c                |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c                | 20 ++++++++++++++------
 drivers/gpu/drm/radeon/radeon_display.c                   |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c                  |  4 ++--
 drivers/gpu/drm/radeon/radeon_mode.h                      |  1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c                      |  4 ++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                    |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                            | 10 ++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c                    |  4 ++--
 drivers/gpu/drm/tegra/hdmi.c                              |  6 +-----
 drivers/gpu/drm/vc4/vc4_hdmi.c                            |  6 +++---
 drivers/gpu/drm/zte/zx_hdmi.c                             |  4 ++--
 37 files changed, 112 insertions(+), 96 deletions(-)

Best regards.
Claudio Suarez




