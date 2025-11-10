Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB493C4547A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 08:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DC10E31A;
	Mon, 10 Nov 2025 07:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Lokkuw3y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3269.qiye.163.com (mail-m3269.qiye.163.com
 [220.197.32.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A349010E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 07:58:45 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2903d7367;
 Mon, 10 Nov 2025 15:58:41 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1] drm/rockchip: analogix_dp: Use dev_err_probe() instead of
 DRM_DEV_ERROR() during probing
Date: Mon, 10 Nov 2025 15:58:17 +0800
Message-Id: <20251110075817.1159857-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a6cc63ab203a3kunm8d5d83d11091403
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkkZSVYfQ0xDQh0ZSB8ZGh5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Lokkuw3yyN+NLB/K0CY5sAgotoS17XdzjMh0apqMeFsC0A/x7oRiYIywvudPBCawqyiKJrIZr2++pegwKJdImi/A9g6/3d/P4FAXyUwVNEkfK0xNognTWpS5pG5GREbmQvJ4WBLPNnWvNB2DgJCjhcbirpW2ne8axrlZ2BayWL4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=cBL7Pcb/kOyjsK6nTlHrlSIR86VZRY5J3XGsowllQ1M=;
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

The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
can be better. The other reason is that dev_err_probe() help avoid
unexpected repeated err logs during defered probing.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

As Heiko suggested[0], the other similar codes in
rockchip_dp_of_probe() should be modified to dev_err_probe().

[0] https://lore.kernel.org/all/8513b4b6-0b59-4b42-864b-0fe0423cd7fd@rock-chips.com/
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 937f83cf42fc..94da0f745525 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -330,32 +330,29 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 	struct device_node *np = dev->of_node;
 
 	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
-	if (IS_ERR(dp->grf)) {
-		DRM_DEV_ERROR(dev, "failed to get rockchip,grf property\n");
-		return PTR_ERR(dp->grf);
-	}
+	if (IS_ERR(dp->grf))
+		return dev_err_probe(dev, PTR_ERR(dp->grf),
+				     "failed to get rockchip,grf property\n");
 
 	dp->grfclk = devm_clk_get_optional(dev, "grf");
 	if (IS_ERR(dp->grfclk))
-		return dev_err_probe(dev, PTR_ERR(dp->grfclk), "failed to get grf clock\n");
+		return dev_err_probe(dev, PTR_ERR(dp->grfclk),
+				     "failed to get grf clock\n");
 
 	dp->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(dp->pclk)) {
-		DRM_DEV_ERROR(dev, "failed to get pclk property\n");
-		return PTR_ERR(dp->pclk);
-	}
+	if (IS_ERR(dp->pclk))
+		return dev_err_probe(dev, PTR_ERR(dp->pclk),
+				     "failed to get pclk property\n");
 
 	dp->rst = devm_reset_control_get(dev, "dp");
-	if (IS_ERR(dp->rst)) {
-		DRM_DEV_ERROR(dev, "failed to get dp reset control\n");
-		return PTR_ERR(dp->rst);
-	}
+	if (IS_ERR(dp->rst))
+		return dev_err_probe(dev, PTR_ERR(dp->rst),
+				     "failed to get dp reset control\n");
 
 	dp->apbrst = devm_reset_control_get_optional(dev, "apb");
-	if (IS_ERR(dp->apbrst)) {
-		DRM_DEV_ERROR(dev, "failed to get apb reset control\n");
-		return PTR_ERR(dp->apbrst);
-	}
+	if (IS_ERR(dp->apbrst))
+		return dev_err_probe(dev, PTR_ERR(dp->apbrst),
+				     "failed to get apb reset control\n");
 
 	return 0;
 }
-- 
2.34.1

