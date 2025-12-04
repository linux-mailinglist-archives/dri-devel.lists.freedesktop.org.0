Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49855CA28AD
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECC710E85F;
	Thu,  4 Dec 2025 06:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="aLAivRja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9310E85C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764830060;
 bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
 h=From:To:Subject:Date:Message-Id;
 b=aLAivRjaXG2cIfi7s0YPK/8h/D6XUu92x2hHaBN6ZSIbDNMLBOAqJ5Bi2Q+2drYXG
 BsdI9kGOw4wKXnyMZkyiBAsG6Z3Jrp30P0TWdKLCxcQssm/qSDuD3hlonC+/Du1Q7e
 lGp5LpUkab6UNR4AsbOL+O9UjpvKAxA/ZtTbo4/M=
X-QQ-mid: esmtpsz21t1764829909tf9c29147
X-QQ-Originating-IP: ri8pxnHeVrvX5Aweq2BV2L+rsyB/OuhYBi1DnKi64pY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 04 Dec 2025 14:31:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15495658624198146204
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v11 07/11] phy: rockchip: phy-rockchip-typec: Add DRM
 AUX bridge
Date: Thu,  4 Dec 2025 14:31:05 +0800
Message-Id: <20251204063109.104-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251204063109.104-1-kernel@airkyi.com>
References: <20251204063109.104-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OAowhIcaKHQtTjxaSSAYgZdAC1boftfVXm93QMGK7yPrnWW/Ef/QqCJR
 Jzvrdbpu1A+XR2GaWyk8g/sqmdK1Yij/p6tn++8WGzpF/5v5I7Jt+O0KcBFVmAfp2zL/gzN
 /wXNR4906VNgkVLdViRG2OaU11nyWrIO8BnvMYa0TiY8OvddhC2rcBtREbTqrCQCZ21tZbO
 LXEAxOSEeWoTgBTHKB75fQYgHwNIWae+Z+PySpll/cJteRqAvlgUxm8a9tzL+ZquyNtRIEW
 oaRdmvRgygGrdiZS51d5tDs7eHRSWJvHgVdjWGdhcPRNZ+JKnVBctzqN8eDvjAwR7j2zGcS
 9+QIGnKamJWdr65N6mC0gQlqp8m92922JutDBGQaOlTeYU8W6H+EobUuUuX44Btj7uVvdcs
 FA3JoqRV9cz787jPw2NtQblv8yIidNYdDKBn1xbeLW/1rg9alqIXC+TrC0ythqSwY2MvKyW
 MpK9oV/WDqjJN6y8G6LixbtpI4aSmqK+O4UCae1naPPgbPPKpTKUGPIl1Jsxu3K5NFw2/r3
 4RLD9Oa+JSWcYAp7sYdbACRrh2jnEr54XCO4SNSDaagt5T5JrNDtu93NsoGL9p2hhSR1VBu
 wZHPf77SkqsSJ7ew6lvvzogoxfYd1xCjBARvDbjlOFfNKEyq5Yz7t4iXFTtM2plkuvKgPp2
 Pdm4MU3Y4RJejvDfuX60zVyRbPV/eU998QjBoANGgZcdV4HW87PV60dA8BnuNhabXoCDFU7
 /kPP8wZ1hHywL6R6JHzg1xy/EHWZOG+ekNOaYUdUUEYC1idK0kq92ZAp/pn51dIyIWZL2t+
 QEzJlZF8bLDfTmi47isct4nswqCikNuq5DrfLYK6Y7yAPEfDLee+nshAkgWtzcOSpvzSRzo
 s9Icfej98cn9IZMItAmspdm26gDOH06vrEjS8ej8K+ORXPZi9/bM00XrARp4OddxAZOpAv+
 K0djMhLcj6x2BR3xRCzLdppUHUKbSeooFYnmaHW1N/URiBw6uTnM+AJdieOUcYcPphPeAL7
 El2X7uBX19ZbSDDCx1ba6W0+o4/n8=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---

(no changes since v11)

Changes in v10:
- Use drm_aux_bridge_register_from_node() instead.

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig.

 drivers/phy/rockchip/Kconfig              | 2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index db4adc7c53da..bcb5476222fc 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
 	depends on TYPEC || TYPEC=n
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 1f5b4142cbe4..e31b778c3537 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -56,6 +56,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1312,6 +1313,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = drm_aux_bridge_register_from_node(tcphy->dev, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.51.1

