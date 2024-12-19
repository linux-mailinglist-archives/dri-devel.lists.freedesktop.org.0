Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8E9F76B5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 09:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A21C10ECC0;
	Thu, 19 Dec 2024 08:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Dto21Bsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com
 [220.197.32.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C86D10ECBD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:06:41 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 633dd674;
 Thu, 19 Dec 2024 16:06:37 +0800 (GMT+08:00)
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
Subject: [PATCH v3 09/15] drm/bridge: analogix_dp: Add support to get panel
 from the DP AUX bus
Date: Thu, 19 Dec 2024 16:05:58 +0800
Message-Id: <20241219080604.1423600-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219080604.1423600-1-damon.ding@rock-chips.com>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk8ZGFZNSUpDTR0eTB1JS0lWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93ddf454c003a3kunm633dd674
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6CSo5CTISCBUMTDkeDDoz
 TTUKFB5VSlVKTEhPTkJOTkJCSklKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0pINwY+
DKIM-Signature: a=rsa-sha256;
 b=Dto21BscgW0101JfwaimT5Svfhl2CPBIYvaS6Fky4ktCusr5eblGNzB/q0xXOuzouQdDnqOYyFNK7F55dxp9SOOD9gsnLh/O+NAHxkGCN3rrzWlVUxg7WrrvrRGZHh4zAy57FQCJR6Byv4ixaVHYNcc1cnI/wElgXIuIOcyTFNA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=ls2SQ381Ul5xwwUhCAde3y5OqsDlvqQOV6lShYVjzW0=;
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

If the panel can not be found in the beginning of rockchip_dp_probe()
using the platform bus, we can still try to find it in analogix_dp_bind()
through the DP AUX bus after the &analogix_dp_device.aux has been
initialized.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9429c50cc1bc..eae02819e3bb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -19,12 +19,14 @@
 #include <linux/platform_device.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1733,6 +1735,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_disable_pm_runtime;
 	}
 
+	if (!dp->plat_data->panel) {
+		/*
+		 * If the edp-panel module has not yet been initialized, the
+		 * devm_of_dp_aux_populate_bus() function will return 0 and
+		 * the done_probing() callback will not be called either.
+		 * Consequently, the panel will never be found.
+		 *
+		 * This is the reason why we do not use the done_probing()
+		 * callback and do not check the reture value here.
+		 */
+		devm_of_dp_aux_populate_bus(&dp->aux, NULL);
+		ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0,
+						  &dp->plat_data->panel, NULL);
+		if (ret)
+			goto err_unregister_aux;
+	}
+
 	ret = analogix_dp_create_bridge(drm_dev, dp);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
-- 
2.34.1

