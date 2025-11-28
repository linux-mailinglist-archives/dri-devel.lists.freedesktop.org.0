Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61FC908FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 03:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6505C10E89A;
	Fri, 28 Nov 2025 02:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="he0btbYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC1D10E883
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 02:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1764295490;
 bh=BnSe20UyFWhCBwFpCZUGVdKqrQwY3y7cLZdXieRNPhI=;
 h=From:To:Subject:Date:Message-Id;
 b=he0btbYJitsPmxGhlbpYVp/Rbdu29Pv6rlM8G2ZhdqR42hS1AchtQCMNsrW+XA9Lw
 Zx/a3x76WZ7Ct8grIWDIp4rVHGi6flLcvoa/pnt1NjUsCrHtMRw0G6wgqOElu3Ptf+
 WTIvQC86FU21Keo/dUgS5Zj5Y/Jyzw/jsVu6A1jM=
X-QQ-mid: esmtpsz21t1764295487t4741a73c
X-QQ-Originating-IP: fhy5DRa5i3V80+bUs3WYZGySAtuFFVaE7fm+ADYYEpQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 28 Nov 2025 10:04:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8450163399619758520
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
Subject: [PATCH v11 07/11] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
Date: Fri, 28 Nov 2025 10:04:01 +0800
Message-Id: <20251128020405.90-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128020405.90-1-kernel@airkyi.com>
References: <20251128020405.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MSDmV4hBxmsCMpUywsvd98VfPSec1iASn+xsqpwWeVzVRlDQqvM6YbZR
 6i1MLsDeOWe1q3MviBD3fhfckxY+kYZEeypbWFuWQ/e0ihTfeul+sacO89I/GR6DKb0m9NF
 f3uwmbFuE+v/6Gup4pATYBXVEUFgDT0iRbuE7T2eCyskb93XgOqfuOWqYNOCnBYi0oD+Y4u
 loL4jxwTfiXlKIW6tLSIEZoNBmWYvN/KyjdHd0mqoMrf1SQKVLRtSONCNddZQSGQd+DAGnU
 90yAUaVSM/2aTH21tkjhEiSd3Nbp25gELFPlln2oeB/2QL0uL5kpeZyH6r0J6lh1kDiaDQ4
 aILdaZiHUvc1WLdSFJqcYTnsooB/uLcXiab/2lhd36QPfYfeZh3Kiutnm+m+XCc2zJTXSRq
 gaDXj49Akl5qJXknD7DR8EoMcGOXsxFQiK8SjUaaCPoVF9AaV1X1B/SVj7rFtjCx7O1F9mB
 ZR/aXQwZPjq615z/Hs39XBNpeTp+Nlj8EIABVevW80CYubYiRiB6saHaLc+m6ErAu7+82kc
 viUUAwQhUwtCSldc1xJeIXl7fM6K93ebw1D64QbPvuDUZwX6XXMLwu/5W5JLahyeRYVZBlY
 qT+x0U1bLKK4flDf/zOWC7yszL7DcAz4bs6PWzVFJyE6k7NFREV9mfGG/4USG1zrGTRgai4
 Q0xzTgBUFcsTUCwiEy3l7ZEXkVu6RbNcaKCpzw8BhRHZlpqQ0mwg00HZryHWl9iMGalusBu
 BBmcf49e6V4AFQ5Is51GoZFHxD+MTkhpv8PSaqAAFc3gaegRtwPXCSz7kosqirWyGhSrbh6
 vDlf2fwVgYiabdEAaUM4zXaqpbvzGJEoLkY0jnw+wsO+y2vkyAVRRMEtCwsydtX6EwZ7s96
 MDrqn0h+Gx967RM/Qe8bnnSB/wO9/Qh8y0Ixs1yVX2aeZPeDSDv2XBQm4FNDzZ+PV53RKiP
 NZj+tFOuE0VEO5EIr8NEERurlA0cGjPS9at9IYSp+BbGn25Ki8wjMdNG7V8fPqP/nuNORFp
 KLAH6h9ThcmFzBbDo1IEVA/Nk03Ix4mBota3RXUA==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

