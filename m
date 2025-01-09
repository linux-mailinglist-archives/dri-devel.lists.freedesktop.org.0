Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A75CA06C11
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 04:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483210ECC5;
	Thu,  9 Jan 2025 03:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="dp1AxSiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127223.xmail.ntesmail.com
 (mail-m127223.xmail.ntesmail.com [115.236.127.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6305C10ECC4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 03:28:22 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 82c01a81;
 Thu, 9 Jan 2025 11:28:18 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 11/20] drm/bridge: analogix_dp: Add support to get panel
 from the DP AUX bus
Date: Thu,  9 Jan 2025 11:27:16 +0800
Message-Id: <20250109032725.1102465-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhNHlZITUxISRlITUpJH0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491b127903a3kunm82c01a81
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mj46PTo5PzIVIRRILEoOQypN
 Ei4KCitVSlVKTEhNSEJISEtLSU5KVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITExONwY+
DKIM-Signature: a=rsa-sha256;
 b=dp1AxSiUUL4UTk2GkXst7cOnju629zizuJEMU3Evq3vAjsZWQYtl5tvPp27uz2nBx3PzspXS2U+W41LMub6ykDz1n2n16doKbzwPKMhGuoVG5q+YnJu/Wlocie0x+K7/J23JPFmQ2SQn1TaeOH02LS8MXdutNlk2/Wpf8hjSM90=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Uf4UFxDsT5vSfWEZ+9rK9nvtFoknlN7ayfJQpa/hLWQ=;
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

The main modification is moving the DP AUX initialization from function
analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
eDP panel during probing, it is also needed to advance PM operaions to
ensure that eDP controller and phy are prepared for AUX transmission.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Use done_probing() to call drm_of_find_panel_or_bridge() and
  component_add() when getting panel from the DP AUX bus

Changes in v5:
- Advance PM operations to make eDP AUX work well
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 62 ++++++++++---------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 8251adfce2f9..78e78fb474d3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1548,6 +1548,18 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 	return ret;
 }
 
+static void analogix_dp_runtime_disable(void *data)
+{
+	struct analogix_dp_device *dp = (struct analogix_dp_device *)data;
+
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_dont_use_autosuspend(dp->dev);
+		pm_runtime_disable(dp->dev);
+	} else {
+		analogix_dp_suspend(dp);
+	}
+}
+
 struct analogix_dp_device *
 analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 {
@@ -1658,8 +1670,29 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	}
 	disable_irq(dp->irq);
 
+	dp->aux.name = "DP-AUX";
+	dp->aux.transfer = analogix_dpaux_transfer;
+	dp->aux.dev = dp->dev;
+	drm_dp_aux_init(&dp->aux);
+
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_use_autosuspend(dp->dev);
+		pm_runtime_set_autosuspend_delay(dp->dev, 100);
+		pm_runtime_enable(dp->dev);
+	} else {
+		ret = analogix_dp_resume(dp);
+		if (ret)
+			goto err_disable_clk;
+	}
+
+	ret = devm_add_action_or_reset(dev, analogix_dp_runtime_disable, dp);
+	if (ret)
+		goto err_disable_pm_runtime;
+
 	return dp;
 
+err_disable_pm_runtime:
+	analogix_dp_runtime_disable((void *)dp);
 err_disable_clk:
 	clk_disable_unprepare(dp->clock);
 	return ERR_PTR(ret);
@@ -1708,25 +1741,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	dp->drm_dev = drm_dev;
 	dp->encoder = dp->plat_data->encoder;
 
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_use_autosuspend(dp->dev);
-		pm_runtime_set_autosuspend_delay(dp->dev, 100);
-		pm_runtime_enable(dp->dev);
-	} else {
-		ret = analogix_dp_resume(dp);
-		if (ret)
-			return ret;
-	}
-
-	dp->aux.name = "DP-AUX";
-	dp->aux.transfer = analogix_dpaux_transfer;
-	dp->aux.dev = dp->dev;
 	dp->aux.drm_dev = drm_dev;
 
 	ret = drm_dp_aux_register(&dp->aux);
 	if (ret) {
 		DRM_ERROR("failed to register AUX (%d)\n", ret);
-		goto err_disable_pm_runtime;
+		return ret;
 	}
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
@@ -1739,13 +1759,6 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 
 err_unregister_aux:
 	drm_dp_aux_unregister(&dp->aux);
-err_disable_pm_runtime:
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_dont_use_autosuspend(dp->dev);
-		pm_runtime_disable(dp->dev);
-	} else {
-		analogix_dp_suspend(dp);
-	}
 
 	return ret;
 }
@@ -1762,13 +1775,6 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	}
 
 	drm_dp_aux_unregister(&dp->aux);
-
-	if (IS_ENABLED(CONFIG_PM)) {
-		pm_runtime_dont_use_autosuspend(dp->dev);
-		pm_runtime_disable(dp->dev);
-	} else {
-		analogix_dp_suspend(dp);
-	}
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
-- 
2.34.1

