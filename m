Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C12A59169
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A2E10E3E6;
	Mon, 10 Mar 2025 10:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="cx/5/rIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15589.qiye.163.com (mail-m15589.qiye.163.com
 [101.71.155.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9410E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:42:14 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id dc18826a;
 Mon, 10 Mar 2025 18:42:10 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 05/13] drm/bridge: analogix_dp: Support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Date: Mon, 10 Mar 2025 18:41:06 +0800
Message-Id: <20250310104114.2608063-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pDH1YeGhpOS0xOSh5MHkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
 NVSktLVUpCWQY+
X-HM-Tid: 0a957fa5db1303a3kunmdc18826a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NzY6IQw4NzJOSSMRMzkSPShL
 UTZPFAlVSlVKTE9KTUtISEhJQk1IVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSEhJNwY+
DKIM-Signature: a=rsa-sha256;
 b=cx/5/rIf8YViD47f5CCZTK5rwAEg9fCuUgxCgxRPiT7Re0DJYrb/E7fOSXVCOlOQDscOtEkimyXIdtNJkLW4XWn5L20Vm/4aJHuVN4nYvlxLZdV8knI+f+NZGIF8DeW3tzt4fiDPpzS2yEeO0Iu4rqu7in+mxVX7uzElLw0WAzQ=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=WiJhY8PG8AgEQhlaFruZbMXxvourhl/iCjB/6RJP8bw=;
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v7:
- Use the forward-declare struct drm_dp_aux instead of including the
  relevant header file.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
 include/drm/bridge/analogix_dp.h                   |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index d5bbc8843a56..dd91760c4b1c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1764,6 +1764,20 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
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
index 6002c5666031..e19b0bbc57d6 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -10,6 +10,7 @@
 #include <drm/drm_crtc.h>
 
 struct analogix_dp_device;
+struct drm_dp_aux;
 
 enum analogix_dp_devtype {
 	EXYNOS_DP,
@@ -48,4 +49,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
 int analogix_dp_start_crc(struct drm_connector *connector);
 int analogix_dp_stop_crc(struct drm_connector *connector);
 
+struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
+struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
+
 #endif /* _ANALOGIX_DP_H_ */
-- 
2.34.1

