Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58023A4AD1C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 18:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C4410E09C;
	Sat,  1 Mar 2025 17:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="0fBkTHGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF81310E1D5
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=khpROQz+QoHslWzkgE9bCS7jGbs+TMKrHMOcimF7a4I=; b=0fBkTHGP4ldi2nAVA5K4i25Xtb
 YZRlvA0+aq8oHnqqyaVNwNweokElJnVn1SG7vorhi89gKFsUmamxLngSd/2On6B/AGMX1ey0zpWdk
 +lw+LtXd7yEaHE47Pv4h7JvwX3dLw9WHayFqWATSuGcp6FYn7kOEF8PAeRpkuTdB3AkKfGJSwFtge
 0Ayf1wnHf4p8rjIHq2qkjnzk+c8vWNA2EhZ1zG/GyZs/IL2IBF9E2xzlhFdtpd0VaYaU3ufXroD37
 iW6pS+bT5TkovpbD/Wu9IeAHBOw+BVs+CzS+hxzxZpcYlq1fiy4NsUVRocyBYuMzpKeWt17S9uTZ/
 Nvf91OKw==;
Received: from i53875b47.versanet.de ([83.135.91.71]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1toQkn-0001Tm-OM; Sat, 01 Mar 2025 18:35:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, quentin.schulz@cherry.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/2] drm/rockchip: lvds: move pclk preparation in with
 clk_get
Date: Sat,  1 Mar 2025 18:35:46 +0100
Message-ID: <20250301173547.710245-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250301173547.710245-1-heiko@sntech.de>
References: <20250301173547.710245-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The LVDS block needs a separate pclk only on some socs, so currently
requests and prepares it in the soc-specific probe function, but common
code is required to unprepare it in the error path or on driver remove.

While this works because clk_unprepare just does nothing if clk is NULL,
this mismatch of who is responsible still is not very nice.
The clock-framework already has a helper for clk-get-and-prepare even
with devres support in devm_clk_get_prepared().

This will get and prepare the clock and also unprepare it on driver
removal, saving the driver from having to handle it "manually".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 385cf6881504..ecfae8d5da89 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -448,15 +448,13 @@ struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
 static int rk3288_lvds_probe(struct platform_device *pdev,
 			     struct rockchip_lvds *lvds)
 {
-	int ret;
-
 	lvds->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lvds->regs))
 		return PTR_ERR(lvds->regs);
 
-	lvds->pclk = devm_clk_get(lvds->dev, "pclk_lvds");
+	lvds->pclk = devm_clk_get_prepared(lvds->dev, "pclk_lvds");
 	if (IS_ERR(lvds->pclk)) {
-		DRM_DEV_ERROR(lvds->dev, "could not get pclk_lvds\n");
+		DRM_DEV_ERROR(lvds->dev, "could not get or prepare pclk_lvds\n");
 		return PTR_ERR(lvds->pclk);
 	}
 
@@ -480,12 +478,6 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 		}
 	}
 
-	ret = clk_prepare(lvds->pclk);
-	if (ret < 0) {
-		DRM_DEV_ERROR(lvds->dev, "failed to prepare pclk_lvds\n");
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -728,20 +720,15 @@ static int rockchip_lvds_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, lvds);
 
 	ret = component_add(&pdev->dev, &rockchip_lvds_component_ops);
-	if (ret < 0) {
+	if (ret < 0)
 		DRM_DEV_ERROR(dev, "failed to add component\n");
-		clk_unprepare(lvds->pclk);
-	}
 
 	return ret;
 }
 
 static void rockchip_lvds_remove(struct platform_device *pdev)
 {
-	struct rockchip_lvds *lvds = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &rockchip_lvds_component_ops);
-	clk_unprepare(lvds->pclk);
 }
 
 struct platform_driver rockchip_lvds_driver = {
-- 
2.47.2

