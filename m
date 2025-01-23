Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC7A1A177
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 11:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298D010E7B7;
	Thu, 23 Jan 2025 10:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="TP9FV2jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com
 [45.254.49.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94010E7B2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 10:08:14 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 9818ae6e;
 Thu, 23 Jan 2025 18:08:10 +0800 (GMT+08:00)
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
Subject: [PATCH v6 06/14] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Date: Thu, 23 Jan 2025 18:07:39 +0800
Message-Id: <20250123100747.1841357-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123100747.1841357-1-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0tMSFZISB5LTE1OHx5CSBhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9492a2322a03a3kunm9818ae6e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6ORw4LjILHiwYNCkhFD83
 HzgKFD1VSlVKTEhMTUlNQ0JJTk1OVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSU9LNwY+
DKIM-Signature: a=rsa-sha256;
 b=TP9FV2jzbryy9RokZodKx5k2Ku6qO8J5yX2+NKTkG88lApmu/rE7qJ9Vdg+HBEsLuMUK6nopm1LR//OgQocgD+qP9c+4UB9n4PXmt3ecyYtiAfNi2u2e0te8e6JMpumsxDGAjmZSOe0tSrnT8KMm+GsPlt36jIB6MJgRbBY+y+Q=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=5+N4GZtO2B2otW+fzwXUnqqvhQBl3b+snSyfBarKLiY=;
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

Add two new functions: one to find &analogix_dp_device.plat_data via
&drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
serve for the function of getting panel from DP AUX bus, which is why
they are included in a single commit.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
 include/drm/bridge/analogix_dp.h                   |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b05f5b9f5258..8251adfce2f9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1794,6 +1794,20 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
 }
 EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
 
+struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_device *dp = to_dp(aux);
+
+	return dp->plat_data;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
+
+struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
+{
+	return &dp->aux;
+}
+EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
+
 MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
 MODULE_DESCRIPTION("Analogix DP Core Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 6002c5666031..1b119b547988 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -7,6 +7,7 @@
 #ifndef _ANALOGIX_DP_H_
 #define _ANALOGIX_DP_H_
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_crtc.h>
 
 struct analogix_dp_device;
@@ -48,4 +49,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
 
+struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
+struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
+
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1

