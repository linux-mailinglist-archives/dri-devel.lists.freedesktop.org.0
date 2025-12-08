Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D50CABC12
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 02:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FF710E384;
	Mon,  8 Dec 2025 01:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="aOnXCzfR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5602E10E37E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 01:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1765158942;
 bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
 h=From:To:Subject:Date:Message-Id;
 b=aOnXCzfRsXlYhtnp6U104QaN/b2xX2MzkKPz8FhYJshobpO7ivOmcHWGYTQM3QUKk
 q2aI2CLX9EewZUOKuVb0yog6Nx/Agw+KPq7FShnLqqFkdNDi7L/VbWJae1NAjO/PN0
 c2t6FgTMkjP/kjN2t+4KC8gFIse6cjaJMPNd0KFk=
X-QQ-mid: esmtpsz19t1765158940t25fd4027
X-QQ-Originating-IP: Z7MP6ExgaN3mQHGany79bTHA+lgk9L8tcXkCb4brfTU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 08 Dec 2025 09:55:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3174573280846271733
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
Subject: [PATCH v13 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Date: Mon,  8 Dec 2025 09:54:56 +0800
Message-Id: <20251208015500.94-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMRvUBB6DcheO/LpO7EQVq5SsVkr4F1orMDlMYb906p2Mki75FYkPqsK
 AFK+h3wejzEuVLlsBuQCvP3Q2zMC38KZstl7xtbbWr2SQTWo7UXrGQCxEhT9VIFZoH49PHo
 Ptb24jPrWn7AuCKItRhQ4lpdAZd5g5qIbppYPUfjuxfG6GIhtXquQfGUfJgUc4qX05BTpFB
 bKlYqzUqPqA7FFAUvJFl02SpXucEs+eogbkpYirTuwBb73zxMURAVmpDnrh5tFXnUMd1dI2
 RxeSoSutPp7BXjbSoN/KYQZ5ZkNeBLAzkl/MSpAmJYK0Z5q64qWe8f8b41IwkMdvXJwMZa+
 Pfh8YOKRrxq49l38pcxs+IQrOiqIfYIi36hrdpmkNXwEwlhxGHxmtpx+FmoRClqKCOBnT7v
 Ac6ZEE+iqGYxCnWsAILoWbmOuqBBqTiCm0H7oU3L7liflrhL+lUTelfnuXnoqE81lKZv3OF
 79XBw1RHDrFhByQKT9zgbPJ1GUZJR+tiMc/P6J+ahBUBzNNRH473CilWQF257zuquVnLVmr
 AWrvyBtHLHOdEpQhc0HmxzUlbjxlQjZ1qcfScugUpDqx2V8ysyfai10EzCEZdLu89LpP33S
 djwYxoKDZVWUaZ6Buy0aqsWwwuO5jCredqPrqO28/lJXPkzSlu+ylcAxINdzTz6YSFmBou9
 Q16MafJ4FPl0pFymTJvclq5/G6HJYQHpkrnmKnaFVfvs+A69sYNOpcAMEoLyFeYjCZ17G5z
 c0rXGHIY6BtDZn+eiPbAqJTpYDOGOSMdpW0vVK7kgGpu9NkyWDsP1Z3oxfsIgA7YMmhEUgj
 E6SLbZ+i68uCmCXo1v3ztSyKS9QnMZEqE1NFxyRsVZ33+ds8ao26zfUccXF7fv3BeigjX8Z
 LsolIdCoFkZNYxvsO0pt2vRCS9P7nvaNVqrs9OTXB0dBdtIuIrHKnpVBmpSa/qje43FBOm0
 /MosKPjkpK71azgd06YXTv9bUPtwovswmt/7XiyL3ULbzNU3YIipzUg8hnSlL86Y1K3FA2V
 x9XXHRn3mNn682hVhPalDR28xX/Mc=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

