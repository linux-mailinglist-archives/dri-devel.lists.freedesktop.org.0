Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8443045A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 20:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615E96E499;
	Sat, 16 Oct 2021 18:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AA86E492;
 Sat, 16 Oct 2021 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634409758; bh=Y96/8Nke5u5v4emB7cdeFsHUTA4siYUGx7ZcSnrwbJc=;
 h=X-EA-Auth:From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=uMQdpKjXPmL45QfDu3oipBmL3r96h2m9sLYnnz23pJ7RDlaaGtSpkOzHTgZgNzWWh
 5vBpYJ1Eh/9Xo6LBL9x+PARWp+o4g9MSCkc5Z/T6AXBnrRNmvO+KKC/opsD+l+j2rY
 8WnqdpHXXovGxW3BjdCLokoFHocYnxhfH767ElWE=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 16 Oct 2021 20:42:38 +0200 (CEST)
X-EA-Auth: iJ48sRsSV5JqlxVWZLnB2p2jl3UkwY1uKYWmZBLCTlmQ+a1qcMCxa04E29WpMxMyFQYezQWpEpRzbhWGhePR9lhhiqNPwxDI
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
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: [PATCH v2 00/13] replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Sat, 16 Oct 2021 20:42:13 +0200
Message-Id: <20211016184226.3862-1-cssk@net-c.es>
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

Changelog:
v2:
- no helper function
- A separate patch is made for amdgpu
- zte patch is removed because that driver no longer exists

[Why]
Copy&paste from Documentation/gpu/todo.rst 
===
Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
---------------------------------------------------------------

Once EDID is parsed, the monitor HDMI support information is available through
drm_display_info.is_hdmi. Many drivers still call drm_detect_hdmi_monitor() to
retrieve the same information, which is less efficient.

Audit each individual driver calling drm_detect_hdmi_monitor() and switch to
drm_display_info.is_hdmi if applicable.
=====

[How]
I did it in two steps:
- check that drm_display_info has a correct value.
- in that case, replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi

Almost all occurrences of drm_detect_hdmi_monitor() could be changed. Some
small inconsistencies have been solved.

Stats:
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  2 +-
 drivers/gpu/drm/bridge/sii902x.c             |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    |  2 +-
 drivers/gpu/drm/drm_edid.c                   | 11 +++++------
 drivers/gpu/drm/exynos/exynos_hdmi.c         |  6 ++++--
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c      |  3 ++-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c      |  6 ++++--
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c    |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c    |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c      |  4 ++--
 drivers/gpu/drm/nouveau/dispnv50/head.c      |  8 +-------
 drivers/gpu/drm/radeon/atombios_encoders.c   |  6 +++---
 drivers/gpu/drm/radeon/radeon_connectors.c   | 15 +++++++++------
 drivers/gpu/drm/radeon/radeon_display.c      |  2 +-
 drivers/gpu/drm/radeon/radeon_encoders.c     |  4 ++--
 drivers/gpu/drm/rockchip/inno_hdmi.c         |  4 ++--
 drivers/gpu/drm/rockchip/rk3066_hdmi.c       |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c               | 10 ++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 drivers/gpu/drm/tegra/hdmi.c                 |  6 +-----
 drivers/gpu/drm/vc4/vc4_hdmi.c               |  6 +++---
 22 files changed, 55 insertions(+), 55 deletions(-)

Best regards.
Claudio Suarez




