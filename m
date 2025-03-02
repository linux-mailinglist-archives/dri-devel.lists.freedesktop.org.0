Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7EA4B0B0
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 09:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E16310E031;
	Sun,  2 Mar 2025 08:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="UmkPCIU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973197.qiye.163.com (mail-m1973197.qiye.163.com
 [220.197.31.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE1F10E031
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 08:31:06 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id ca1e3b0a;
 Sun, 2 Mar 2025 16:31:02 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: dianders@chromium.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org
Cc: dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8] drm/bridge: analogix_dp: Remove the unnecessary calls to
 clk_disable_unprepare() during probing
Date: Sun,  2 Mar 2025 16:30:43 +0800
Message-Id: <20250302083043.3197235-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNKSFYfTUxCGkodHR5KQ0JWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9555faec2603a3kunmca1e3b0a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Fyo*GjIIP0sXFEsQPAMD
 GjwaCR9VSlVKTE9LQktPSU1PSUpJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTEtPNwY+
DKIM-Signature: a=rsa-sha256;
 b=UmkPCIU3194/fdIScDFyGJqmuyaoD1Wy6JprV81qNtT2lopbChW3FNhogW3p0vJNrzW+8Ixe7Qb728+YAJQ2uZkHqxnrdtl7BVAL5xgDyNxGOIGlqYvOqEurRXBD5ZZpkVyI+e1OXBXhx7E9van9kwmWemfzUXUMQjNiKs17ISQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=1tSwbwgHgUYZS7h3tpCBw0paLu32oYZDiVorjRMVmIs=;
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

With the commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
runtime PM"), the PM operations can help enable/disable the clock. The
err_disable_clk label and clk_disable_unprepare() operations are no
longer necessary because the analogix_dp_resume() will not be called
during probing.

Fixes: f37952339cc2 ("drm/bridge: analogix_dp: handle clock via runtime PM")
Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932

Changes in v8:
- Fix the conflict because of commit 43c00fb1a518 ("drm/bridge:
  analogix_dp: Use devm_platform_ioremap_resource()")
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f6e4bdc05ba0..817070613b03 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1605,10 +1605,8 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	}
 
 	dp->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(dp->reg_base)) {
-		ret = PTR_ERR(dp->reg_base);
-		goto err_disable_clk;
-	}
+	if (IS_ERR(dp->reg_base))
+		return ERR_CAST(dp->reg_base);
 
 	dp->force_hpd = of_property_read_bool(dev->of_node, "force-hpd");
 
@@ -1620,8 +1618,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (IS_ERR(dp->hpd_gpiod)) {
 		dev_err(dev, "error getting HDP GPIO: %ld\n",
 			PTR_ERR(dp->hpd_gpiod));
-		ret = PTR_ERR(dp->hpd_gpiod);
-		goto err_disable_clk;
+		return ERR_CAST(dp->hpd_gpiod);
 	}
 
 	if (dp->hpd_gpiod) {
@@ -1641,8 +1638,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 
 	if (dp->irq == -ENXIO) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-		ret = -ENODEV;
-		goto err_disable_clk;
+		return ERR_PTR(-ENODEV);
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
@@ -1651,15 +1647,11 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 					irq_flags, "analogix-dp", dp);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to request irq\n");
-		goto err_disable_clk;
+		return ERR_PTR(ret);
 	}
 	disable_irq(dp->irq);
 
 	return dp;
-
-err_disable_clk:
-	clk_disable_unprepare(dp->clock);
-	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
-- 
2.34.1

