Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87579891EB
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 00:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566F310E26F;
	Sat, 28 Sep 2024 22:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GMuJZiYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E064810E249
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 22:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727563045;
 bh=YFA7+X5Us21+0eHKxfY/TIJcacjOdOm4GiRiiJcOWn8=;
 h=From:Subject:Date:To:Cc:From;
 b=GMuJZiYKRVrZ4/37ClX+ImfSVMFde/btQ7TnkwdygUHLfFOz1Kn49zmI9Utrwz0aa
 cLECno8dsUvJzOz4i0zmtZzH9GSOB3e7UNKzKlgDzwTavhm6yZkwzufzFI3fMjQZdf
 6FnXb6vDmy1rBhXikuXVEydFUW1i0+DKSubX8OXbwYAJvUqS2WWtUZuA/XZRvB5YxD
 6SQJy64Ip0C2F+oo+7CgBHxamFQ729lu24lfxtSbx61DScTFWBjvMG8v1McQJtiZpi
 ehsySxBS+YbXKNxRuNTW7OgVWsqndNi7+A3oNU6i7Zs3KYndEndKiPTW2pV7Bfszz4
 x7VIRZQaZpPEA==
Received: from localhost (100.121.120.78.rev.sfr.net [78.120.121.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D4E217E0E2D;
 Sun, 29 Sep 2024 00:37:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v8 0/3] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
Date: Sun, 29 Sep 2024 01:36:46 +0300
Message-Id: <20240929-b4-rk3588-bridge-upstream-v8-0-83538c2cc325@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP6E+GYC/43QzWrDMAwH8FcpPs/DkvyVnfYeowfbsVeztilOF
 zpK3n1OLw0jmB3/EvoJ6c7GWHIc2dvuzkqc8piHcw32ZcfCwZ0/I899zQwFSqEFcC95+SJlLfc
 l97X/fRmvJboTd2i8Swm8TYHV+UuJKd8e9se+5kMer0P5eayaYKn+R52AC540CjKKkNC/h+F4d
 H4o7jUMJ7bIEz4129awal1yWhknI6hNjdaaaWlUNS167Z0XfTBhS5MrDbqWJhdNggkG6y9lt6W
 plUbNS9VyqRLkY4gCSG9p+ql1Qrc0XTVHgDZ5EBQ3/2ZWGsiWZqqGHkhaIANIf7V5nn8Bzl1U/
 5oCAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>, 
 Algea Cao <algea.cao@rock-chips.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
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

The Rockchip RK3588 SoC family integrates the Synopsys DesignWare HDMI
2.1 Quad-Pixel (QP) TX controller, which is a new IP block, quite
different from those used in the previous generations of Rockchip SoCs.

The controller supports the following features, among others:

* Fixed Rate Link (FRL)
* Display Stream Compression (DSC)
* 4K@120Hz and 8K@60Hz video modes
* Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
* Fast Vactive (FVA)
* SCDC I2C DDC access
* Multi-stream audio
* Enhanced Audio Return Channel (EARC)

This is the last component that needs to be supported in order to enable
the HDMI output functionality on the RK3588 based SBCs, such as the
RADXA Rock 5B.  The other components are the Video Output Processor
(VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for which basic
support has been already made available via [1] and [2], respectively.

Please note this is a reworked version of the original series, which
relied on a commonized dw-hdmi approach.  Since the general consensus
was to handle it as an entirely new IP, I dropped all patches related to
the old dw-hdmi and Rockchip glue code - a few of them might still make
sense as general improvements and will be submitted separately.

It's worth mentioning the HDMI output support is currently limited to
RGB output up to 4K@60Hz, without audio, CEC or any of the HDMI 2.1
specific features.  Moreover, the VOP2 driver is not able to properly
handle all display modes supported by the connected screens, e.g. it
doesn't cope with non-integer refresh rates.

A possible workaround consists of enabling the display controller to
make use of the clock provided by the HDMI PHY PLL.  This is still work
in progress and will be submitted later, as well as the required DTS
updates.

To facilitate testing and experimentation, all HDMI output related
patches, including those part of this series, are available at [3].

So far I could only verify this on the RADXA Rock 5B board.

Thanks,
Cristian

[1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
[2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
[3]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-next-20240913
[4]: https://lore.kernel.org/lkml/20240801-dw-hdmi-qp-tx-v1-0-148f542de5fd@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v8:
- Added R-b tag from Maxime on the HDMI controller library patch
- Dropped dw_hdmi_qp_rockchip_encoder_mode_set() from the platform
  driver according to Maxime's review, the ref_clk rate adjustment is
  already handled in dw_hdmi_qp_rockchip_encoder_enable()
- Link to v7: https://lore.kernel.org/r/20240914-b4-rk3588-bridge-upstream-v7-0-2b1348137123@collabora.com

Changes in v7:
- Added R-b from Krzysztof on DT binding patch (also dropped the
  superfluous minItems property from resets)
- Fixed a sparse warning reported by kernel test robot when returning
  the error pointer from devm_platform_ioremap_resource() (made use of
  ERR_CAST() helper)
- Simplified locking in dw_hdmi_qp_i2c_xfer() via guard() (Markus)
- Dropped high TMDS clock ratio and scrambling support for now (will be
  submitted separately when ready)
- Introduced dw_hdmi_qp_bridge_mode_valid() function to filter out
  unsupported mode clocks
- Dropped the superfluous 'display' parameter of ->init() in struct
  dw_hdmi_qp_phy_ops
- Improved error handling in dw_hdmi_qp_bridge_atomic_enable()
- Handled dw_hdmi_qp_i2c_adapter() errors as fatal for bridge setup
- Rebased series onto next-20240913
- Updated ROCKCHIP_DW_HDMI_QP kconfig to select the recently introduced
  DRM_BRIDGE_CONNECTOR dependency (Heiko)
- Link to v6: https://lore.kernel.org/r/20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com

Changes in v6:
- Improved scrambling setup by using a delayed work queue in conjunction
  with the bridge ->detect() callback to support use cases like modetest
  where ->atomic_enable() is not called on reconnection (Maxime)
- Explicitly include workqueue.h in platform driver
- Dropped the common binding patch after merging its content into RK
  specific one; also moved the clocks & irq setup from the bridge
  library to the platform driver
- Got rid of the phy-names property and fixed indentation in the binding
  example (Krzysztof)
- Link to v5: https://lore.kernel.org/r/20240831-b4-rk3588-bridge-upstream-v5-0-9503bece0136@collabora.com

Changes in v5:
- Renamed Rockchip binding file to match the SoC compatible (Conor)
- Made all clocks mandatory (Conor)
- Renamed rockchip,vo1-grf property to rockchip,vo-grf as future SoCs
  (e.g. RK3576) may refer to it as vo0 instead of vo1
- Reworked the setup of high TMDS clock ratio and scrambling
  * Dropped curr_conn & pix_clock from struct dw_hdmi_qp
  * Also removed exported function dw_hdmi_qp_set_high_tmds_clock_ratio()
  * A few additional (mostly cosmetic) changes
- Link to v4: https://lore.kernel.org/r/20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com

Changes in v4:
- Added Tested-by tag from Heiko
- Updated "[PATCH v3 3/5] dt-bindings: display: rockchip: Add schema for
  RK3588 HDMI TX Controller" according to Rob's review
  * Referenced full path for synopsys,dw-hdmi-qp.yaml
  * Moved ports to common schema and updated descriptions
  * Renamed rockchip,vo1_grf to rockchip,vo1-grf and updated "[PATCH v3
    5/5] drm/rockchip: Add basic RK3588 HDMI output support" accordingly
- Dropped "[PATCH v3 4/5] drm/rockchip: Explicitly include bits header"
  already applied by Heiko
- Link to v3: https://lore.kernel.org/r/20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com

Changes in v3:
- Reintegrated bridge patchset [4] to allow automated testing and
  simplify reviewing (Krzysztof); the after-split changes were:
  * Made use of the new bridge HDMI helpers indicated by Dmitry
  * Dropped connector creation to ensure driver does only support
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  * Updated I2C segment handling to properly handle connected DVI
    displays (reported and fixed by Heiko)
- Updated schema for DW HDMI QP TX IP providing some hardware details
- Updated patch for DW HDMI QP TX Controller module referring to a
  support library instead of a platform driver (Krzysztof)
- Drop empty dw_hdmi_qp_unbind() export from the library and related
  usage from RK platform driver
- Drop Fixes tag from "drm/rockchip: Explicitly include bits header"
  patch (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20240801-b4-rk3588-bridge-upstream-v2-0-9fa657a4e15b@collabora.com

Changes in v2:
- Reworked the glue code for RK3588 into a new Rockchip platform driver
- Moved bridge driver patches to a separate series [4]
- Dropped all the patches touching to the old dw-hdmi and RK platform
  drivers
- Added connector creation to ensure the HDMI QP bridge driver does only
  support DRM_BRIDGE_ATTACH_NO_CONNECTOR
- Link to v1: https://lore.kernel.org/r/20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com

---
Cristian Ciocaltea (3):
      drm/bridge: synopsys: Add DW HDMI QP TX Controller support library
      dt-bindings: display: rockchip: Add schema for RK3588 HDMI TX Controller
      drm/rockchip: Add basic RK3588 HDMI output support

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml       | 188 +++++
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   8 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 645 ++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 834 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig                   |   9 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 425 +++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 include/drm/bridge/dw_hdmi_qp.h                    |  32 +
 11 files changed, 2147 insertions(+)
---
base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc

