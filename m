Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F1BD5B57
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193010E4B3;
	Mon, 13 Oct 2025 18:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cveAs0di";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1A410E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760380053;
 bh=BIcA4osUmV/1VbMUUXeGDi2zOdw1yTeJ2CK9wzGmF+4=;
 h=From:Subject:Date:To:Cc:From;
 b=cveAs0diTCznavmi+DTpudynnyzFIosDn4AGMJvnJPUPqziS0Uy2rgoK1if1yZekL
 34HcPgvmF25JDHLM2rLf8msrZyJ5tH9Hl1k/93AnPEKflr/aIkM+6RVQOfW/mzr+cN
 63OWEQNlInMr0dcpV6yc5/rkMPXrPXSH2Ochb1RZFuVW7uTGqhNdvcuWOsyDZXaXo/
 Lj1y1WotdICF9Qh9vdnfhyjmfP0vYzOGliZUq4+Gp8tUPWnViOOMuqlaxN5hILMfbI
 jyRups+UT8H06V54a+wupmKLxHd7dvHRIhCWzV2bEWETXkySlt1Ugz/vdejz7oTQWl
 BOYyHDU294pkw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CBBC317E124A;
 Mon, 13 Oct 2025 20:27:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/2] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Mon, 13 Oct 2025 21:27:17 +0300
Message-Id: <20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVE7WgC/13MSw7CIBSF4a00dywGMARw5D5MBzxbYi3mYoimY
 e9inTn8T3K+DUrAFAqchw0w1FRSXnvwwwBuNusUSPK9gVMuqOKa4O0klCJ2cnnJSBwz0mojqLQ
 O+umBIabXDl7H3nMqz4zv3a/su/4oTfk/VRmhJHotfdTMKx0vfV+MzWiOLt9hbK19AL42yM2wA
 AAA
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
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

* Renamed DRM_ARGB_<COMP>() to DRM_ARGB64_GET<C>_BPC() while providing
  convenience wrappers to extract all 16 bits of a specific color via
  DRM_ARGB64_GET<C>()
* Replaced drm_argb() function with DRM_ARGB64_PREP_BPC() macro, to
  improve uAPI consistency and readability; additionally fixed a bug in
  case of using bpc < 16: the unused least-significant bits of a given
  component in the output value would contain the unused
  most-significant bits of the following component in the input value,
  instead of being set to 0
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

Initially this has been validated using a modetest wrapper script [2],
which is able to execute several tests - see an example of a generated
report at the end.

In the meantime, the implementation on Weston side has been finalized,
providing support for the BACKGROUND_COLOR CRTC property to the DRM
backend via the merge request [3].  It relies on the already existing
background-color setting in weston.ini:

  [shell]
  background-color=0xAARRGGBB

All tests were performed on the Radxa boards listed below.  Please note
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
 - fix: apply patch [4]

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/drm-vop2-bgcolor-test
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1845
[4] https://lore.kernel.org/all/20250827230943.17829-1-inochiama@gmail.com/

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
	background color (10bpc): r=0x0 g=0x0 b=0x0

---------------------------------------------------------------
 Set/get DRM property
---------------------------------------------------------------
Changing prop value to: 0xffff00000000ffff
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x3ff

---------------------------------------------------------------
 Plane display test 40@83:960x540+480+270
---------------------------------------------------------------

Changing prop value to 0xffffffff00000000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
    Connector: HDMI-A-2
	background color (10bpc): r=0x3ff g=0x0 b=0x0

Changing prop value to 0xffff0000ffff0000
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x3ff b=0x0

Changing prop value to 0xffff00000000ffff
Press ENTER to continue..
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
testing 960x540@XR24 overlay plane 40

Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x3ff

---------------------------------------------------------------
 Restoring state
---------------------------------------------------------------
Changing prop value to: 0xffff000000000000
opened device `RockChip Soc DRM` on driver `rockchip` (version 1.0.0 at 0)
Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
    Connector: HDMI-A-2
	background color (10bpc): r=0x0 g=0x0 b=0x0

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Improved uAPI consistency and readability by introducing
  DRM_ARGB64_PREP*() and DRM_ARGB64_GET*() helper macros
- Updated several code comment sections
- Referenced the counterpart Weston support in the cover letter
- Rebased series onto v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com

---
Cristian Ciocaltea (2):
      drm: Add CRTC background color property
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 +++
 drivers/gpu/drm/drm_blend.c                  | 39 +++++++++++++++++++++++++---
 drivers/gpu/drm/drm_mode_config.c            |  6 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 +++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 +++
 include/drm/drm_blend.h                      |  4 ++-
 include/drm/drm_crtc.h                       | 12 +++++++++
 include/drm/drm_mode_config.h                |  5 ++++
 include/uapi/drm/drm_mode.h                  | 36 +++++++++++++++++++++++++
 10 files changed, 118 insertions(+), 6 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc

