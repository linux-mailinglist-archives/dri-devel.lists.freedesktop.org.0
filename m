Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3187EB26338
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A98D10E865;
	Thu, 14 Aug 2025 10:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="A8PJRmiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155105.qiye.163.com (mail-m155105.qiye.163.com
 [101.71.155.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C5F10E865
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:48:25 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1f63a9a3e;
 Thu, 14 Aug 2025 18:48:21 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 11/13] drm/bridge: analogix_dp: Remove panel disabling and
 enabling in analogix_dp_set_bridge()
Date: Thu, 14 Aug 2025 18:47:51 +0800
Message-Id: <20250814104753.195255-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814104753.195255-1-damon.ding@rock-chips.com>
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98a831ee1603a3kunm254826283f231c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhJTFZNGkkeTE4aQk5NHkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=A8PJRmizdGZSNeaM+eeA/IVHBRk6YpZ9DGXrJXfPDL8/2fKJxC+68H7df/id++2R/FI3d3RuPsd7UKlF3+dhNhEdK5scLUhltjMgXVnMHSuG492Ul+Cp5CwRIGFTB1PnbAvASh+kzGdMtA04pgQp3EYLXHUTPN+0eLCbvybKe2o=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Huwtfl/4DY7+Ye0RBesZOhBs/hvliM0EJhdOv++XHys=;
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

The &drm_panel_funcs.enable() and &drm_panel_funcs.disable() mainly
help turn on/off the backlight to make the image visible, and the
backlight operations are even needless if drm_panel_of_backlight() or
drm_panel_dp_aux_backlight() is applied, in which case the enabling
and disabling process just add necessary delays.

Therefore, it should make sense to remove panel disabling and move
panel enabling after analogix_dp_set_bridge() finished.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 3e76a7b7d227..3c518106b896 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -840,9 +840,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 {
 	int ret;
 
-	/* Keep the panel disabled while we configure video */
-	drm_panel_disable(dp->plat_data->panel);
-
 	ret = analogix_dp_train_link(dp);
 	if (ret) {
 		dev_err(dp->dev, "unable to do link train, ret=%d\n", ret);
@@ -862,9 +859,6 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	/* Safe to enable the panel now */
-	drm_panel_enable(dp->plat_data->panel);
-
 	/* Check whether panel supports fast training */
 	ret = analogix_dp_fast_link_train_detection(dp);
 	if (ret)
@@ -1242,6 +1236,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
 		if (analogix_dp_set_bridge(dp) == 0) {
 			dp->dpms_mode = DRM_MODE_DPMS_ON;
+			drm_panel_enable(dp->plat_data->panel);
 			return;
 		}
 		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
-- 
2.34.1

