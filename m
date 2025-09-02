Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA21B3FA4B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D40810E614;
	Tue,  2 Sep 2025 09:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CHRii3RU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B4810E614
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756805286;
 bh=kX99daaTmRjZZgK7NDFvXocEUTsxLb0HWG3/u7rNoOQ=;
 h=From:Subject:Date:To:Cc:From;
 b=CHRii3RUTvt67o2uyq3VloVbOygGmlL+ddS1PuriwQWfeAIyTPZlfq3zweQJ2itTL
 qjNUWhdH3E4FsFVFqfdkCKRr0FfCQmuNe0i6bMBHF1uONrRCMKypfFTMo2LylPtFHp
 1oh4N7dOdmPtEDmL/HzH/z715AxV2/LiETaHAS2UID8E27Blw9ZctXuU/H4EIHLYMv
 KwQlHvNPjA657acqbePIapKEo2OmtDv3tM1RLE5mqo5BeWY+1GQkMHv9tuPTIy4hIi
 fpfb3jye3VcvfHsE+3ot69+5m64gcVv3MESMnVJYeq0zq788GOpmHQLFlbqPfZYsVc
 XN7+VILWcxaOw==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 3225917E0676;
 Tue,  2 Sep 2025 11:28:06 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Tue, 02 Sep 2025 12:27:55 +0300
Message-Id: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJu4tmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNL3aJsY1MLC92k9OT8nPwi3WTDRPMky0RTA/OkZCWgpoKi1LTMCrC
 B0bG1tQBLBZTeYAAAAA==
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
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

Some display controllers can be hardware-configured to present non-black
colors for pixels which are not covered by any plane (or are exposed
through transparent regions of higher planes).

The first patch of the series introduces the BACKGROUND_COLOR DRM
property that can be attached to a CRTC via a dedicated helper function.
A 64-bit ARGB color value format is also defined and can be manipulated
with the help of a few utility macros.

Note this is a reworked version of the patch [1] submitted (many) years
ago by Matt Roper.  The main changes are:

* Dropped drm_arg() in favor of drm_argb64() to get rid of the bpc
  parameter and the related shifting for more flexibility in operation,
  e.g. when user-space cannot make use of the helper and/or when it
  doesn't now the actual precision supported by the HW.  This also
  simplifies the property verification/validation testing (see below).
  It works by extracting the specified number of least-significant bits
  from each color component.
* Renamed DRM_ARGB_*() to DRM_ARGB64_*_LSB() while providing convenience
  wrappers to extract all 16 bits of a specific color via DRM_ARGB64_*()
* Replaced GENMASK_ULL(63, 0) with U64_MAX when calling
  drm_property_create_range() to create the BACKGROUND_COLOR property
* Moved crtc_state->bgcolor initialization from
  __drm_atomic_helper_crtc_reset() to
  __drm_atomic_helper_crtc_state_reset()
* Replaced '*bgcolor*' occurrences to '*background_color*' for
  consistency with the actual property name in both storage field and
  helper functions names

The second patch adds background color support to the VOP2 display
controller used in the RK3568, RK3576, and RK3588 Rockchip SoC families.

For the moment this has been validated using a modetest wrapper script
[2], which is able to execute several tests - see an example of a
generated report at the end.  Proper support in Weston is currently in
development, and I will provide a reference once it becomes available.

The tests were performed on the Radxa boards listed below.  Please note
that as of next-20250901, there are a few known regressions; for each
case, I mentioned the actual problem and its related fix/workaround
accordingly:

* ROCK 3A (RK3568)
 - issue: broken networking
 - fix: revert commit da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make
   the clk_phy could be used for external phy")

* ROCK 4D (RK3576)
 - issue: random freezes right after booting
 - fix: add regulator_ignore_unused to kernel cmdline

* ROCK 5B (RK3588)
 - issue: broken networking
 - fix: apply patch [3]

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/drm-vop2-bgcolor-test
[3] https://lore.kernel.org/all/20250827230943.17829-1-inochiama@gmail.com/

Validation report on ROCK 5B
============================

$ tools/testing/rk-bgcol-test.sh

---------------------------------------------------------------
 Available Rockchip display connectors
---------------------------------------------------------------
id	type	status	crtc_id	plane_id
85	11	2	0	34
88	11	1	83	40

Selected connector: id=88 crtc=83 plane=40

---------------------------------------------------------------
 Check initial state
---------------------------------------------------------------
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=0

---------------------------------------------------------------
 Set/get DRM property
---------------------------------------------------------------
Changing prop value to: 0xffff00000000ffff
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=ffff

---------------------------------------------------------------
 Plane display test 40@83:960x540+480+270
---------------------------------------------------------------

Changing prop value to 0xffffffff00000000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
    Connector: HDMI-A-2
	background color (10bpc): r=ffff g=0 b=0

Changing prop value to 0xffff0000ffff0000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=ffff b=0

Changing prop value to 0xffff00000000ffff
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=ffff

---------------------------------------------------------------
 Restoring state
---------------------------------------------------------------
Changing prop value to: 0xffff000000000000
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0 g=0 b=0

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      drm: Add CRTC background color property
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 +++
 drivers/gpu/drm/drm_blend.c                  | 37 +++++++++++++++++++++++++---
 drivers/gpu/drm/drm_mode_config.c            |  6 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
 include/drm/drm_blend.h                      |  4 ++-
 include/drm/drm_crtc.h                       | 12 +++++++++
 include/drm/drm_mode_config.h                |  5 ++++
 include/uapi/drm/drm_mode.h                  | 30 ++++++++++++++++++++++
 10 files changed, 110 insertions(+), 6 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc

