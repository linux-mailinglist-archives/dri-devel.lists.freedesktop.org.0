Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A1BFF047
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 05:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9ED10E27C;
	Thu, 23 Oct 2025 03:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="F/wzuzel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F3010E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1761190398;
 bh=AFQcoHE/dlPx/r75ImuKZ7C8fGQ0d+TgBuYEF1fP98Q=;
 h=From:To:Subject:Date:Message-Id;
 b=F/wzuzelcJbPSU15UXkn0l1+pN1hwGdKnGyFV7XqmUy2DX+8ayYl1AxxEL650qshv
 Y8WV4OcdNUDk3IZlN9rEl2nFTSOLVe78FBiMZGKultPhXzGgKM3FGHQBh6BwKp44tH
 xx/W/FUxnLEq0L7wcw0ym8V60r40I3athnVC4FFQ=
X-QQ-mid: esmtpsz16t1761190248tddc1db9c
X-QQ-Originating-IP: 79hG5RSiNIqAGUfWumvqMnoN1zJNDnasQCzDIp5dXnM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 23 Oct 2025 11:30:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1756416242830638748
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v7 5/9] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Thu, 23 Oct 2025 11:30:05 +0800
Message-Id: <20251023033009.90-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NPgAY+7cethfznNSp3gZfZkZBt6VLTVZ2FtARFvPaPdHnXNheJjFevRb
 SkcMftGcFm0A6N4vO9LHKW5hMXPV13CHiDS/zgEBo0GOV35MJ7T8oQ7ygU5Ebr4JYpNeQE7
 eMNww6udJMYgtxfqb3bKNoVL7J+pV55sLWZY7O3tK4WnTS9XtRsOoSfa0udoU9k1YISkphY
 degnb11vSNi75Ym5xdOU/6+zAD/bJQ8ZFdPpnCxWRu2T3FBMjKVfpyQq/msKDQP2Bl8eVsY
 +dZF5CGSD8Xq/j0oIAN61p9YraPiam+V42c85TcgKdHSTzhab3GMr/GA3avhZgCpYhV6neW
 bOvFoajzm0IoLoJBUvhsAaxvvltY6/neUxzv9tZusDoqrAWFlsemhK/7/p0a/1qeeugilo/
 HO8LqK4iw3OpxZzGt4ZQZc0mfbHmBJObb8mnjz0uhCrEs6Uxv0Ar8KypYG6dcgLvd7UtyIA
 APnMJa+v3O+woyRQ54mGwTSw9sK32Bt3btaA5xdtuQMQTgi7WjDa3ZabuRMGYaEjBbsurqE
 ri5gmN2WpSMkaPBRWPBE+ytQYvxAXq8itKCyNGDv844qelkR/lCxFsOEY3xQjKZ2JSBRo0b
 I36XTNI/LiKtOANi+8qS5ywRQV9DuskmIkg191OgtKpQfPlQVEDC9uZcaK2WenZ8vLrBfcC
 Fz5cZ4F6I0j6VcpMa2elSqG6jDA2IvaC8cisnv4fZDWAty5v721KuvTKDrpkqsU0t5WfR7u
 iMMTNGF68b2bicLDCyJR/S113exX6Cwm7ppEEWtQuhpKyg3LNWn1yOoq+Pd1ypx2Qe6SH7T
 Q3vLiRv2hxq3zhXfR43Xu5c60xikc5i3w312E74ia+p3ZQEn6uABeQR+i+riMnIq/V2E6X/
 SvS32D3ZESuuptvgSoKEy/ALbK8vERUgQtyHxoEdNIcoTRrwHoAZDMMbssjsCQ3aY6FFWh3
 33fPF6TeNxJmTwa/PKOhtuGhWXaz8vnTIHMFT2ENJAlMcdL3+HOy4hyR6LEEIm+Q9EfMOyc
 v/rtZKYkmSRME5G4XeU2d3Z81Us1BK5WhMurmDNA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
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

(no changes since v7)

Changes in v6:
- Fix depend in Kconfig. 

 drivers/phy/rockchip/Kconfig              |  2 +
 drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
index 1f5b4142cbe4..748a6eb8ad95 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -36,6 +36,7 @@
  * orientation, false is normal orientation.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -56,6 +57,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
 
 struct rockchip_typec_phy {
 	struct device *dev;
+	struct auxiliary_device dp_port_dev;
 	void __iomem *base;
 	struct extcon_dev *extcon;
 	struct typec_mux_dev *mux;
@@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
 	typec_mux_unregister(tcphy->mux);
 }
 
+static void tcphy_dp_port_dev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	of_node_put(adev->dev.of_node);
+}
+
+static void tcphy_dp_port_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
+{
+	struct auxiliary_device *adev = &tcphy->dp_port_dev;
+	int ret;
+
+	adev->name = "dp_port";
+	adev->dev.parent = tcphy->dev;
+	adev->dev.of_node = of_node_get(np);
+	adev->dev.release = tcphy_dp_port_dev_release;
+
+	ret = auxiliary_device_init(adev);
+
+	if (ret) {
+		of_node_put(adev->dev.of_node);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
+
+	ret = drm_aux_bridge_register(&adev->dev);
+
+	return 0;
+}
+
 static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 {
 	struct typec_mux_desc mux_desc = {};
@@ -1312,6 +1360,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
 	if (!of_property_read_bool(np, "mode-switch"))
 		goto put_np;
 
+	ret = tcphy_aux_bridge_register(tcphy, np);
+	if (ret)
+		goto put_np;
+
 	mux_desc.drvdata = tcphy;
 	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
 	mux_desc.set = tcphy_typec_mux_set;
-- 
2.49.0

