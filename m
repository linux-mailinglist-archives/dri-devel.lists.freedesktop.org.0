Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AF944117
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 04:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47C10E2F1;
	Thu,  1 Aug 2024 02:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Pua+Ax2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FB210E2F1
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 02:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722479182;
 bh=4+/1vCHzYGuuIZrE8fcrAyUNAlf8hKtpZPh/Qde0tTI=;
 h=From:Subject:Date:To:Cc:From;
 b=Pua+Ax2DxVqTVrir7AFQYxwvtLC8My94SMow8knXwnfFxN0cygVduwKyrekvkPWoZ
 di31QmR2Ef9jp5eaPydXrgzrCund1HDEDqeZw90LXVRr7eBwEFFBdNSNhXwv07+W6+
 cunck5o8KX3zQsYxKrEk+QRBDtf5ZUCo5ck1j2a9SNfBFKu6kBOyfpVlQp1c5tCRin
 2P+aXfvSbCLVstE10YuwcjpmEAqqTtfdKCjBItf2zzdijPCqpSKHQZwXBB5XAGwj1p
 T/vPLkYxs9maNXgAcy65s8/BBukhKy3Vwgvm0GAzcaM9SV8pdlnd9wYAdA6fnHqjjE
 GeMbBw+8w39MQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1ACF237812FA;
 Thu,  1 Aug 2024 02:26:22 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/3] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
Date: Thu, 01 Aug 2024 05:25:51 +0300
Message-Id: <20240801-b4-rk3588-bridge-upstream-v2-0-9fa657a4e15b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/yqmYC/42NTQ6CMBCFr0Jm7Zh2yl9ceQ/Doi2tNAIlUyQaw
 t2tnsDl917e93ZIjoNLcCl2YLeFFOKcgU4F2EHPd4ehzwwkqBS1kGhK5Ieq2hYNhz73zyWt7PS
 EmhqjvZem9RbyfmHnw+vnvnWZh5DWyO/f1Sa/6T/WTaJAX5NQTaVIkbnaOI7aRNZnGyfojuP4A
 OcpqAnGAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>, 
 Algea Cao <algea.cao@rock-chips.com>
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
2.1 Quad-Pixel (QP) TX controller [4], which is a new IP block, quite
different from those used in the previous generations of Rockchip SoCs.

This is the last component that needs to be supported in order to enable
the HDMI output functionality on the RK3588 based SBCs, such as the
RADXA Rock 5B. The other components are the Video Output Processor
(VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for which basic
support has been already made available via [1] and [2], respectively.

Please note this is a reworked version of the original series, which
relied on a commonized dw-hdmi approach.  Since the general consensus
was to handle it as an entirely new IP, I dropped all patches related to
the old dw-hdmi and Rockchip glue code - a few of them might still make
sense as general improvements and will be submitted separately.

Additionally, as suggested by Neil, I've sent the reworked bridge driver
as a separate patchset [4], hence this series handles now just the new
Rockchip QP platform driver.

It's worth mentioning the HDMI output support is currently limited to
RGB output up to 4K@60Hz, without audio, CEC or any of the HDMI 2.1
specific features.  Moreover, the VOP2 driver is not able to properly
handle all display modes supported by the connected screens, e.g. it
doesn't cope with non-integer refresh rates.

A possible workaround consists of enabling the display controller to
make use of the clock provided by the HDMI PHY PLL. This is still work
in progress and will be submitted later, as well as the required DTS
updates.

To facilitate testing and experimentation, all HDMI output related
patches, including those part of this series, as well as the bridge
driver, are available at [3].

So far I could only verify this on the RADXA Rock 5B board.

Thanks,
Cristian

[1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
[2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
[3]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-v6.11-rc1
[4]: https://lore.kernel.org/lkml/20240801-dw-hdmi-qp-tx-v1-0-148f542de5fd@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
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
      dt-bindings: display: rockchip: Add schema for RK3588 HDMI TX Controller
      drm/rockchip: Explicitly include bits header
      drm/rockchip: Add basic RK3588 HDMI output support

 .../display/rockchip/rockchip,dw-hdmi-qp.yaml      | 188 +++++++++
 drivers/gpu/drm/rockchip/Kconfig                   |   8 +
 drivers/gpu/drm/rockchip/Makefile                  |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     | 430 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   4 +-
 6 files changed, 632 insertions(+), 1 deletion(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc

