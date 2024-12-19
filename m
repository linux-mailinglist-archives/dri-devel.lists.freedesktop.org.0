Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8BB9F76BB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 09:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FC210ECC6;
	Thu, 19 Dec 2024 08:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ksEiO8Bt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com
 [101.71.155.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADD110ECBF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:06:39 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 633dd662;
 Thu, 19 Dec 2024 16:06:35 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 08/15] drm/rockchip: analogix_dp: Add support to get panel
 from the DP AUX bus
Date: Thu, 19 Dec 2024 16:05:57 +0800
Message-Id: <20241219080604.1423600-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219080604.1423600-1-damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5KHVZDTk0dTx0YS09NT09WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93ddf44db903a3kunm633dd662
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngw6Tww5PTIQFBUvTD9JDDdP
 AwEwCgxVSlVKTEhPTkJOTkJMSENMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQktJNwY+
DKIM-Signature: a=rsa-sha256;
 b=ksEiO8Bt2qlwc+zz0EMIiHFIC2oTlD6NzrTgpa9TRsx2YJxwROd76sMmx7L4t1iKCLFQR8hbO0Hm0lsCiwJAYvbABPy+Lv47lUJWQaZz3z+QMQTilbB6EmRq/85T31qH/e03FK4J2Wnz4t3LFPH4rumNoz34+EN5p3ELs8Tepr0=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=WkISH5ds2k+lYCOjJ9cf6bOYdtfmQgu7bQ7OmEgofvU=;
 h=date:mime-version:subject:message-id:from;
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

The rockchip_dp_of_panel_on_aux_bus() helps to check whether the DT
configurations related to the DP AUX bus are correct or not.

If failed to get the panel from the platform bus, it is good to try
the DP AUX bus. Then, the probing process will continue until it enters
the analogix_dp_bind(), where devm_of_dp_aux_populate_bus() is called
after &analogix_dp_device.aux has been initialized.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 +++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index ba5263f85ee2..60c902abf40b 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -317,6 +317,24 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
 	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
 };
 
+static bool rockchip_dp_of_panel_on_aux_bus(const struct device_node *np)
+{
+	struct device_node *bus_node, *panel_node;
+
+	bus_node = of_get_child_by_name(np, "aux-bus");
+	if (!bus_node)
+		return false;
+
+	panel_node = of_get_child_by_name(bus_node, "panel");
+	of_node_put(bus_node);
+	if (!panel_node)
+		return false;
+
+	of_node_put(panel_node);
+
+	return true;
+}
+
 static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 {
 	struct device *dev = dp->dev;
@@ -435,8 +453,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		if (!rockchip_dp_of_panel_on_aux_bus(dev->of_node))
+			return ret;
+	}
 
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
-- 
2.34.1

