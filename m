Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943AB933710
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 08:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E517D10E94D;
	Wed, 17 Jul 2024 06:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="qikMfKZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1726910E951
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 06:29:36 +0000 (UTC)
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721197774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XcMogaAUaZ3MeH9Rz27kLYrZiPWISfiW31C8HrmU3oc=;
 b=qikMfKZqXWx8jVfMM0XqFrblNKG6yB0RbQORKkwSHifzQBHyLNdKNN/ysn41q9OYaCNFfx
 DlDMCcM097yOduIVvMqMe8PSinsYCdC8UDsxXXhk+t/UYDKz1r6SW+Xv38ooC0y6nGDx9R
 eLWX/Tg/lFE5rkmZVwqffK2PM32RSCSygFFy1X0F5vx5C6cmEegd77rWHXw5T46PPqoQ7x
 mGgztZcM/p10Xhv5dBX45N2DCjqqklwdGWE39NgYIXkKARS/G5jTXOB6SUunPY7q2lnmtx
 fhvjIRNMk6YdbpKDtJ8wH0vJH2iAYphRXLpxY4d1TFcBCZ2NCA07hIfTeYJqEw==
To: linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Subject: [PATCH] drm/rockchip: dsi: Reset ISP1 DPHY before powering it on
Date: Wed, 17 Jul 2024 08:29:14 +0200
Message-Id: <6e0ce232acfe952970e9b37402fe08a3678aa43a.1721196758.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

From: Ondrej Jirman <megi@xff.cz>

After a suspend and resume cycle, ISP1 stops receiving data, as observed
on the Pine64 PinePhone Pro, which is based on the Rockchip RK3399 SoC.
Re-initializing DPHY during the PHY power-on, if the SoC variant supports
initialization, fixes this issue.

[ dsimic: Added more details to the commit summary and description ]

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4cc8ed8f4fbd..9ad48c6dfac3 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1240,6 +1240,14 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
 		goto err_phy_cfg_clk;
 	}
 
+	if (dsi->cdata->dphy_rx_init) {
+		ret = dsi->cdata->dphy_rx_init(phy);
+		if (ret < 0) {
+			DRM_DEV_ERROR(dsi->dev, "hardware-specific phy init failed: %d\n", ret);
+			goto err_pwr_on;
+		}
+	}
+
 	/* do soc-variant specific init */
 	if (dsi->cdata->dphy_rx_power_on) {
 		ret = dsi->cdata->dphy_rx_power_on(phy);
