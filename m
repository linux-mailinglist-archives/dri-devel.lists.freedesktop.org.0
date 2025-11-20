Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F41C71D1B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 03:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94A310E6CF;
	Thu, 20 Nov 2025 02:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="m+EW7rZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6916610E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1763605464;
 bh=/IF23AwLHF2BuDE85+w1cIAuWmxkHGHVECAwuwTVkE4=;
 h=From:To:Subject:Date:Message-Id;
 b=m+EW7rZS0meZUh1l/4OaxB0X7J2kexbNKVVKKR9xo+Qk37E/9HumGpRj2ksn5/WdK
 2ERefjydTAGI9KOi7RIGq4YVi0mJCXMyC0tidFBwzxGuYpixPSo93NMyHqUD3XrdCG
 UHRTGQ8Fhbwt9NN+NAFfRBt6DWtNG0OKQoqj1NXA=
X-QQ-mid: zesmtpsz5t1763605462t762960bb
X-QQ-Originating-IP: hdCmop6+IrM/3+WRb+UwDEmL6vY6WlZjSA0i5Kppr3M=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 20 Nov 2025 10:24:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6704151892834101465
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
Subject: [PATCH v10 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Date: Thu, 20 Nov 2025 10:23:39 +0800
Message-Id: <20251120022343.250-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NnBlO8MsmACrRff/5IWYDaIcxcnVMxjOCV27F72fIB1I2//FSXCEI79E
 xC3AQWrlcBPZUNJQ+BftWlTVQ1yKQZLmWN6VfsFOLRiYa7p0KP3YR66CPHJ1MuuFwpOUyXv
 qoFsd8YJwTRfMNj0D+znyfru211gS/kgHdTH9RXfZuvYDhtG4/delIUR2TPeVrASMuinIlq
 OVbiKYQ/C4ZenNoMboE8MPrwMFy4PYlIpNVto33ei9P2A10FockUDY0j5MziN3KSIc3DEiI
 qbZBV6MUEWwK+FLBUQ1B7msXMvMBkGZHe5dRP1/fVXYLlXv0LClee5vPb+rM2QbPUxKu/6f
 iY76TVOBbWvd5P1+iL/M8B5l1Vl4AO68tRsRICUAwHBrMhdlqYpDo3dZ5IDoUTsE8K2g6F/
 jUYxp1Gakqh6/3dMCTcjw9j5MsH0ListnCd6B+Fi2s0Hck947HfbHMQ/9d07bFFM/qN7i1W
 khOa2lLA5+gxwtZ+VLTER17txQfJ45WsOC3AaZ+PmsPdpeBmykGBAiudmHaW/6p2SwFTwev
 5SafBNHFnLPm26IJ35r24Q1L2gdZKkCPemThhNqbBlY5FjIROONw6sxkHmP8Rl7sgQwOxg1
 C2W48ge2nhxji6EzkXfSQbWUZxA7O80odbL/LHcJd1U3pAqE6b502XmhAU9LxSeDN+oY/LH
 NO/M5nFzb0D2WBH6ToZqu5csFHG9Al0sBgkj6rmGhqCNtMHzMuCVh3Ye++ursEg8yiAUlEw
 XVnNwu88EUYHKfmlEuBZFutGJyUR/BR/2hCHyL5Hhcd04P0sN0ne92eIeoc/DWwabjQ2B8b
 wkOZqXx0ThLHuXBCS4ETIwlDDzIfSmttJ4cMMULXFYA/dYO54Qna20YHV8O6TJY62a0q1yt
 gCBz2Tav4sBnKErMvh1C8GMOdMsVHLhPlm7oUXmMCRUtQj9rkD7K3R2qbUp5M1r4ByS7hlJ
 7qc1D4Q+x+cfpjsUUzaIDKh/l9BmSCc9yiq5bSgwURszjrKbLdiMtE5GNpaCJ2BEkIDIaUw
 YnDWZpKkRoPJahJzcz/amNTkYrss0kek3L80Llj26rdo7v5VWH
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
---

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

