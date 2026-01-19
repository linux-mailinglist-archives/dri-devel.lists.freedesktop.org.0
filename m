Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6282D3A001
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 08:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421DD10E37A;
	Mon, 19 Jan 2026 07:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="bfN2J6yB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-usa2.onexmail.com (smtp-usa2.onexmail.com [35.173.142.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94A10E37A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1768808088;
 bh=mTE8GiUrUtEaTT4O+e4/NPc8OEJgo20N+GCnBt48BNo=;
 h=From:To:Subject:Date:Message-Id;
 b=bfN2J6yBrrphZkGptKNsZ0VvQPPcFIGqIKqRP7oEwAriohd6G7XD5EU5foFKbU7wR
 dp+vASB7a3NJr/R1VrR93FPdGjpiDMRpLcWIV1afNQbK3uppJ2ushWr+yYIbyjTVPK
 Twbar8sJZ+TIsqAR33DhAo3ur06ug/y99tO9E1vs=
X-QQ-mid: esmtpsz17t1768807909t6177b3cf
X-QQ-Originating-IP: 7rQc2nr+44BlSU0iP8JPeW5epauJLxNX/QDEkb7wpC8=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 Jan 2026 15:31:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12188449118939079178
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
Subject: [PATCH v14 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Mon, 19 Jan 2026 15:30:56 +0800
Message-Id: <20260119073100.143-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: May6qHXULkdV1W252vOqkdqIRemmnsYAa5QaW+knOi1PRDG62ByGVi/j
 VRBMEifLoZjM0Bcfu8t2FuTemV1A08djtnLDopToBLnAihlJC/8FVJeM0bwT2d1GV3vk5tL
 KHRN1uuG62IIffTHHaeFITqnuUnX9l58cdPr96a5rN8qYHl1U7fPaL/uLNEU2k2t2pYrAQ6
 lmPYckGk2B8tFAwB+lF5eyyJL4raNQkgxzaLLacCaSoZmnBJNh2YYpQdGeFVw0c+CHeVAqW
 yK3ASEMREeULRLS8WLYZjzaRZTYp5vzuOVpj9vmJwaG4UpLGO26VB8EcixLlHaPZihNYzqi
 E7DdWhTITZqxApsS7iHzJI4URt1zIB5iPIEA1k9LvMzn9BFl2PriqzJwkWV4p0zDhVBcIL3
 gQwtrJ3wQVzNPhZOiKeBu8nXzyVQy3cuwagvE8kvT2Q2VWTN2tlofo4GoL6J4wH1zJ1mJj1
 9VdAzZWUAyGk2ac1oa6rcpaFqUHob12dI004H/v1gYZIcw334FfP9nocQuR4MkHj3aQ2uf6
 /eVGYcTliPlSmKDOvnpWxLj4hNvfnp5rjqlBQI8MsCJ8YLxDuQI3gBgDwDeOtQkTudphpB1
 DBdhl7SDU+4w/Fg+zMuM5daqUtPCxgRWrq6rnEFoM/TDU+z6/swlKyncyN7CQE++wuRgP6j
 4o9aZx7ienhJfOnsV0ySobomFQ1Wg4x2QxUnN0gUgxOM/RndJHSyPTrKQryuGTK59P3X6Fk
 YgNPxf3rbD7EOBuBYOyES9ZVtefZv80LVXIy3AxKh1+NiohHMNnAUkXWEWJR71e5H5ZBdv+
 gLf3e7pSRGz3O/iCrbEc7WWhIiKj3GyTyw38Jcaj+F8SnDB5ETAfOPlWLMOyEX2CQFer9wV
 TqPwDKwenf8lOPP/hmda+IYh4Q0xvHSco0O45vLbEq4RLe8FmSY4PCxziWK3Qi1dpYWO76G
 nTFvf3/xBZk/zmFfEUQLFFG5Ck03NKoLGJ/eRx+iFTfC2J7Nnv36qInP331d84wHq0a2VLe
 TwgO74C5TNbKnX2Q418n0Y5LT9PLI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
---

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

