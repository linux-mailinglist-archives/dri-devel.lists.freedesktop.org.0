Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26C68ACA9F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 12:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB94112982;
	Mon, 22 Apr 2024 10:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C073112988
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 10:30:48 +0000 (UTC)
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4VNM392w5Nz4wxSW
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 12:30:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
 by michel.telenet-ops.be with bizsmtp
 id EAWj2C00B0SSLxL06AWjTr; Mon, 22 Apr 2024 12:30:45 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqw1-001cvn-4S;
 Mon, 22 Apr 2024 12:30:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1ryqwd-005i3S-3e;
 Mon, 22 Apr 2024 12:30:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/11] drm: Restore helper usability
Date: Mon, 22 Apr 2024 12:30:28 +0200
Message-Id: <cover.1713780345.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

	Hi all,

As discussed on IRC with Maxime and Arnd, this series reverts the
conversion of select to depends for various DRM helpers in series
"[PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
depends on"[1], and various fixes for it.  This conversion introduced a
big usability issue when configuring a kernel and enabling DRM drivers
that use DRM helper code: as drivers now depend on helpers, the user
needs to know which helpers to enable, before the driver he is
interested even becomes visible.  The user should not need to know that,
and drivers should select the helpers they need.

Hence revert back to what we had before, where drivers selected the
helpers (and any of their dependencies, if they can be met) they need.
In general, when a symbol selects another symbol, it should just make
sure the dependencies of the target symbol are met, which may mean
adding dependencies to the source symbol.

Thanks for applying!

[1] https://lore.kernel.org/r/20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org/

Geert Uytterhoeven (11):
  Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies, part 2"
  Revert "drm/display: Select DRM_KMS_HELPER for DP helpers"
  Revert "drm/bridge: dw-hdmi: Make DRM_DW_HDMI selectable"
  Revert "drm: fix DRM_DISPLAY_DP_HELPER dependencies"
  Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"
  Revert "drm: Switch DRM_DISPLAY_HDCP_HELPER to depends on"
  Revert "drm: Switch DRM_DISPLAY_DP_HELPER to depends on"
  Revert "drm: Switch DRM_DISPLAY_DP_AUX_BUS to depends on"
  Revert "drm: Switch DRM_DISPLAY_HELPER to depends on"
  Revert "drm: Make drivers depends on DRM_DW_HDMI"
  Revert "drm/display: Make all helpers visible and switch to depends
    on"

 drivers/gpu/drm/Kconfig                 |  8 +++----
 drivers/gpu/drm/amd/amdgpu/Kconfig      | 12 ++++------
 drivers/gpu/drm/bridge/Kconfig          | 28 +++++++++++-----------
 drivers/gpu/drm/bridge/analogix/Kconfig | 18 +++++++-------
 drivers/gpu/drm/bridge/cadence/Kconfig  |  8 +++----
 drivers/gpu/drm/bridge/imx/Kconfig      |  4 ++--
 drivers/gpu/drm/bridge/synopsys/Kconfig |  6 ++---
 drivers/gpu/drm/display/Kconfig         | 32 ++++++++++---------------
 drivers/gpu/drm/exynos/Kconfig          |  4 ++--
 drivers/gpu/drm/i915/Kconfig            |  8 +++----
 drivers/gpu/drm/imx/ipuv3/Kconfig       |  5 ++--
 drivers/gpu/drm/ingenic/Kconfig         |  2 +-
 drivers/gpu/drm/mediatek/Kconfig        |  6 ++---
 drivers/gpu/drm/meson/Kconfig           |  2 +-
 drivers/gpu/drm/msm/Kconfig             |  8 +++----
 drivers/gpu/drm/nouveau/Kconfig         | 10 ++++----
 drivers/gpu/drm/panel/Kconfig           | 32 ++++++++++++-------------
 drivers/gpu/drm/radeon/Kconfig          |  8 +++----
 drivers/gpu/drm/renesas/rcar-du/Kconfig |  2 +-
 drivers/gpu/drm/rockchip/Kconfig        | 10 ++++----
 drivers/gpu/drm/sun4i/Kconfig           |  2 +-
 drivers/gpu/drm/tegra/Kconfig           |  8 +++----
 drivers/gpu/drm/vc4/Kconfig             | 10 ++++----
 drivers/gpu/drm/xe/Kconfig              | 13 ++++------
 drivers/gpu/drm/xlnx/Kconfig            |  8 +++----
 25 files changed, 116 insertions(+), 138 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
