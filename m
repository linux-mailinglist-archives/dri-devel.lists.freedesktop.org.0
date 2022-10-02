Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4C5F219A
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 08:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B8810E1F7;
	Sun,  2 Oct 2022 06:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EB410E0E5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 06:45:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m3so10773604eda.12
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=riE4lHaMXHSULeXJrv4hqGT03pNNa5PlNR8v7ryuD60=;
 b=rsLBLijZiEznSvV9r7o+s1+gbRqyxGcXwwvhnVSRKOyAThP1CQ4D8FRgo4h14v4OuB
 N4/KPuwLrtJJi5use8++OnPnxML8KbamdgvX+5FsTzDlbW51iEHl5Y3aAYzPpvNV595b
 ClEQiXJ0dzWPUKO1e6FchUS4Cn6jE7iHF9xGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=riE4lHaMXHSULeXJrv4hqGT03pNNa5PlNR8v7ryuD60=;
 b=xVKFYFEYEKkd0SXAu1SlrCAaPDjH9Z6t7Z6uriK8oT5oQjGdXXJwVzOydyOJThQ8o9
 kybjHvrn057UiBpzUcurSVz3Ma1P88WxG3CbwWkrMKDlPfQksnV2qiubiCYXBoz+qOEf
 Bg7tClcdwsClC3a9UFqqBC9Mv4Px5wV1lljkhdFMCth55jM7J2ByzYNI/OGIhZFlo4Fh
 PhIop0faPi65M3PnYKqS5e7IO3FxyQb/tB6dNJCV6V7hFfgCfNXtkgX/zrL1cSWm5aO3
 YGCA0VX83JfWTH8OkMWvdrPMvbC+1aF7kwifTH/OCf1K/U70cX1BumWBas/A6Y1zwjhK
 q+Vw==
X-Gm-Message-State: ACrzQf2dMCIoa1qLHX/0B1X1F5+nEtWicQE+TEBfIJJIvHyVOepg3kVF
 Z3vldjYrQ9i4nR2nOPSqaxjmZg==
X-Google-Smtp-Source: AMsMyM5CVyyAdanMhvOm71Pk3KKLbggnhE3t2Sd+hxkylpEi/NEYUXHm12kfOKY78cBjLZ9qp3zzKg==
X-Received: by 2002:a05:6402:448c:b0:457:52eb:b57e with SMTP id
 er12-20020a056402448c00b0045752ebb57emr14243393edb.178.1664693148777; 
 Sat, 01 Oct 2022 23:45:48 -0700 (PDT)
Received: from panicking.. ([109.52.206.103]) by smtp.gmail.com with ESMTPSA id
 26-20020a170906329a00b0077f5e96129fsm3569894ejw.158.2022.10.01.23.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 23:45:48 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 3/4] phy: rockchip: Implement TTY phy mode
Date: Sun,  2 Oct 2022 08:45:39 +0200
Message-Id: <20221002064540.2500257-4-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002064540.2500257-1-michael@amarulasolutions.com>
References: <20221002064540.2500257-1-michael@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rockchip phy can be programmed in 3 modes:
- dsi
- lvds
- ttl

For instance in px30 there are two sets of rgb interface pins m0 and m1.
The logic can go outside from the VOP using m0 set or go outside using
the m1 set and the ttl logic enable. There are combination where a set
of pin can be taken from m1 and m0 where all the two path are enabled.

dsi and ttl enable share one register in their register area. Simple
implementation is overlap the area where we want access the register

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 644cf73cfd53..0af50d2e0402 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -217,6 +217,17 @@ static void phy_update_bits(struct inno_dsidphy *inno,
 	writel(tmp, inno->phy_base + reg);
 }
 
+static void host_update_bits(struct inno_dsidphy *inno,
+			     u32 reg, u32 mask, u32 val)
+{
+	unsigned int tmp, orig;
+
+	orig = readl(inno->host_base + reg);
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+	writel(tmp, inno->host_base + reg);
+}
+
 static int inno_is_valid_phy_mode(struct inno_dsidphy *inno)
 {
 	switch (inno->mode) {
@@ -224,6 +235,10 @@ static int inno_is_valid_phy_mode(struct inno_dsidphy *inno)
 		break;
 	case PHY_MODE_LVDS:
 		break;
+	case PHY_MODE_TTL:
+		if (IS_ERR(inno->host_base))
+			return -EINVAL;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -506,6 +521,32 @@ static void inno_dsidphy_lvds_mode_enable(struct inno_dsidphy *inno)
 			LVDS_DATA_LANE2_EN | LVDS_DATA_LANE3_EN);
 }
 
+static void inno_dsidphy_ttl_mode_enable(struct inno_dsidphy *inno)
+{
+	/* Select TTL mode */
+	phy_update_bits(inno, REGISTER_PART_LVDS, 0x03,
+			MODE_ENABLE_MASK, TTL_MODE_ENABLE);
+	/* Reset digital logic */
+	phy_update_bits(inno, REGISTER_PART_LVDS, 0x00,
+			LVDS_DIGITAL_INTERNAL_RESET_MASK,
+			LVDS_DIGITAL_INTERNAL_RESET_ENABLE);
+	udelay(1);
+	phy_update_bits(inno, REGISTER_PART_LVDS, 0x00,
+			LVDS_DIGITAL_INTERNAL_RESET_MASK,
+			LVDS_DIGITAL_INTERNAL_RESET_DISABLE);
+	/* Enable digital logic */
+	phy_update_bits(inno, REGISTER_PART_LVDS, 0x01,
+			LVDS_DIGITAL_INTERNAL_ENABLE_MASK,
+			LVDS_DIGITAL_INTERNAL_ENABLE);
+	/* Enable analog driver */
+	phy_update_bits(inno, REGISTER_PART_LVDS, 0x0b,
+			LVDS_LANE_EN_MASK, LVDS_CLK_LANE_EN |
+			LVDS_DATA_LANE0_EN | LVDS_DATA_LANE1_EN |
+			LVDS_DATA_LANE2_EN | LVDS_DATA_LANE3_EN);
+	/* Enable for clk lane in TTL mode */
+	host_update_bits(inno, DSI_PHY_RSTZ, PHY_ENABLECLK, PHY_ENABLECLK);
+}
+
 static int inno_dsidphy_power_on(struct phy *phy)
 {
 	struct inno_dsidphy *inno = phy_get_drvdata(phy);
@@ -533,6 +574,9 @@ static int inno_dsidphy_power_on(struct phy *phy)
 	case PHY_MODE_LVDS:
 		inno_dsidphy_lvds_mode_enable(inno);
 		break;
+	case PHY_MODE_TTL:
+		inno_dsidphy_ttl_mode_enable(inno);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -561,6 +605,10 @@ static int inno_dsidphy_power_off(struct phy *phy)
 			LVDS_PLL_POWER_MASK | LVDS_BANDGAP_POWER_MASK,
 			LVDS_PLL_POWER_OFF | LVDS_BANDGAP_POWER_DOWN);
 
+	/* Disable for clk lane in TTL mode */
+	if (!IS_ERR(inno->host_base))
+		host_update_bits(inno, DSI_PHY_RSTZ, PHY_ENABLECLK, 0);
+
 	pm_runtime_put(inno->dev);
 	clk_disable_unprepare(inno->ref_clk);
 	clk_disable_unprepare(inno->pclk_phy);
@@ -576,6 +624,7 @@ static int inno_dsidphy_set_mode(struct phy *phy, enum phy_mode mode,
 	switch (mode) {
 	case PHY_MODE_MIPI_DPHY:
 	case PHY_MODE_LVDS:
+	case PHY_MODE_TTL:
 		inno->mode = mode;
 		break;
 	default:
@@ -630,6 +679,10 @@ static int inno_dsidphy_probe(struct platform_device *pdev)
 	if (IS_ERR(inno->phy_base))
 		return PTR_ERR(inno->phy_base);
 
+	inno->host_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(inno->host_base))
+		dev_warn(dev, "TTL mode is not supported\n");
+
 	inno->ref_clk = devm_clk_get(dev, "ref");
 	if (IS_ERR(inno->ref_clk)) {
 		ret = PTR_ERR(inno->ref_clk);
-- 
2.34.1

