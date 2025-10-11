Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22181BCEEF8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9756A10E2C5;
	Sat, 11 Oct 2025 03:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="ZXOUrBAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16510E2C5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153578;
 bh=wwgcFk1rqH+p7dv0YhigDs5nbBu8CmNY3pNEURrA3U4=;
 h=From:To:Subject:Date:Message-Id;
 b=ZXOUrBAYeKL/wI3nrvhpOyFIcldRUbURuP9ta0rgrrLYSK9yVysB7ojFABsOWahE+
 3x7DF2Ex8jR/ZsxyyV31hxdB6Nt79KJemdwbfgr2mHtQcN/05Gp21HA07g5HOOQp/f
 ghaiJUvHlgGkLGfR27kBwB3Y9z3PFSdUkr+tbxB8=
X-QQ-mid: zesmtpgz4t1760153576t79eb2061
X-QQ-Originating-IP: MsjTdjXOtbpLDUqFopOqkAaQaYefGgccpSyNy4463zQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:32:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12447018638261968175
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/8] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Sat, 11 Oct 2025 11:32:29 +0800
Message-Id: <20251011033233.97-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Ns2J6Ww7lX5lBkVzXyAUDOjmQd++5KHqGyHJtAM6GTNig5/qVW61Dc15
 JrQXbAk7/qGVjEW3aLhmuIerMVKvwTh1luCnsLDdgVj/PoXrxotCOj7hVxaL6eenUAnSzfd
 PgCJvsf1MWtUNHkIATdJOL+Atx3lV8FQLajiqKJzBcffunr3IRrt3udFtf0fBbc9HyL8Nhk
 UwrbJohstqOkupTW6JSen2fXIQ4/9f66E2ebjlfjJxYX8V/YyDI/s0Ik3SzM0AL1ifFPpa6
 RLH5K3JsX704OePWdH+eDYRsuJjFFxPIpR3i6FPODdz3tsBYZXX6/wbtJ0aiytX83u04LwL
 J5q01dNfzQF5aZ+RjAUfrypRVZzcTsKLGmR/m/YSVA5dQX/Cr2hq5UHG/+SSHOq3/tObZYz
 3mIkVEVgu8RK2a60FlrdkKWCsFmx4WNnxHzIOyLRK6w+3iBMyj2yi3ptCSc4IeKk8ByH/XK
 Ji5FShNS3W/P7H6bUtUq8DHclXSlcWooW9laLivb8EOzKCsMz4u7cDp5FigfPvMsHqItXl0
 unhra5+nY3LVoZOba/xGT35oSHlTsgut+xGtVf9loMt+dBwrv6Gk2r2V2uYqvtxbM7Y6xJT
 /XqGvcI3RDf837C9WN8j1h6W+TeyeGuKrz+E79cwRrRRp/x+7xsz66lm8GU3EZJZvbK/ygc
 vU0EuOwSNFBOylcq9DcvbQ6Y7DFvtC1Vp0SCC8CbnUfiErpzXeQGsfG5nW12aaejqLgsoaM
 TMHR9hSxcB+JnBNgjGiWxGEOvrVzgvuqlwpJG8goyeV1Mj2liXIG7VLi9jmzO9B7l2cmthj
 yv4c9Y06nFdtoX8ZDKf1CFbtK6B2fGmT5aJEEUH3dOzM1PkC+WR+7VkS3yrlPUMhUyncyjy
 eSpqc4L36yumW5zr+6dJ0OlrTUHJpdJjvv5R0WoXIKtRrw0i0L9S/tnpel9OQXFqn0nqxqk
 rcwdt+C/PvPB/u5J1RE+YgdjotOOlF8aW3zmatgb1q0CmXNTNRKw+VW+7U16sVojvWeP5k/
 92IDPXxqFWIRcUmPUNlfIX59R3rP4=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
 drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index 4a1dfa8d65c7..8003a41de5c6 100644
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
@@ -1296,6 +1299,51 @@ static void tcphy_typec_mux_unregister(void *data)
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
@@ -1309,6 +1357,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
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

