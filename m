Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF6BA6F4D
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 12:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B010E04F;
	Sun, 28 Sep 2025 10:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="CFQEKBdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15567.qiye.163.com (mail-m15567.qiye.163.com
 [101.71.155.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53110E04F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 10:38:07 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2456910da;
 Sun, 28 Sep 2025 18:38:03 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3] drm/rockchip: analogix_dp: Apply devm_clk_get_optional()
 for &rockchip_dp_device.grfclk
Date: Sun, 28 Sep 2025 18:37:34 +0800
Message-Id: <20250928103734.4007257-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a998fe6ad8303a3kunm5a055eb71de05e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxMGlZPQxodTk4dQkJKShpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=CFQEKBdLzj3RmovydjJ/6w0J+Z+ocOD7NCH8UCPOUnv9joMoyk3Hp31PZpKDFASAdryKQpPfo22/0OLo8xKgWTdFvb6BSK4uvk7rCil7kPubAqF6r/HV/LaZ1SZvZbsaZWPWfEHUcXLYs9WozLnsbAmpMFRDfa/nBcp2LaJry8g=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=OajlQ+6PdIYG+fmsAAOl6Cm5I8NVlpLVeebHG26Kl94=;
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

The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
while RK3288 and RK3588 do not).

It can make the code more concise to use devm_clk_get_optional()
instead of devm_clk_get() with extra checks.

In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

------

Changes in v2:
- Replace DRM_DEV_ERROR() with dev_err_probe().

Changes in v3:
- Update Reviewed-by tag.
- Fix the spelling error 'consice' to 'concise'.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index d30f0983a53a..937f83cf42fc 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -335,15 +335,9 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return PTR_ERR(dp->grf);
 	}
 
-	dp->grfclk = devm_clk_get(dev, "grf");
-	if (PTR_ERR(dp->grfclk) == -ENOENT) {
-		dp->grfclk = NULL;
-	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (IS_ERR(dp->grfclk)) {
-		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
-		return PTR_ERR(dp->grfclk);
-	}
+	dp->grfclk = devm_clk_get_optional(dev, "grf");
+	if (IS_ERR(dp->grfclk))
+		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf clock\n");
 
 	dp->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dp->pclk)) {
-- 
2.34.1

