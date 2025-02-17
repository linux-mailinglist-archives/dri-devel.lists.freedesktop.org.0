Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7358AA38256
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEC610E440;
	Mon, 17 Feb 2025 11:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H4iYflsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBFF10E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:53:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4394a2af558so5553555e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793210; x=1740398010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VXADKpBGHnogkbd8cS/4TYoAV8pATRtlq3ir5WyAbIs=;
 b=H4iYflsJyB8K7SIuF9htWT4Hq1cycvBRvXOaL9UItS3cpe63vO43p+iX8nPhGAhz4v
 HbtXlHJusrSo3+ImDYAcLMvU8tNp3FUp2eU7i/UgnGgDdZC6rDQPkMvr/sx5s+9zJGfF
 Hj4ozLEqoFs6aZcphGZDsXoMzYysnN3wa8pejvJGnXTLEeKYLQ8qXZoXcNlZw0JLxcDp
 mCffX+IMB5xtPcNDm6wCNgXbUer8heF5Vt9+gUcncnMI2TpAZLUPzA6mTGt8dTRmDFeR
 n8jDLV3MQCeZs8cus6Z4el4/mv9A3CGCZzcdzaSHxTw81b0CpZxQZi39STG6sN3WPbov
 nb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793210; x=1740398010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXADKpBGHnogkbd8cS/4TYoAV8pATRtlq3ir5WyAbIs=;
 b=V8FbZulKE70UgFDTtLfi27KGaSWJp2KdGNePwgd9uZJAEi6WR+HE5W7HbUK2IoxtEI
 rGB21+8krDf1/dNnOjsYhvlWAHJ2cXSYL0Ixfhb09oyUYECBRUzETUaGw60hCeRzEYVK
 Co8Edm0tX9IXoPlonRHAxoLJN31GO0fTwPbAjQiZ10ZG6kl3WvOtiEI1Y+TVIHmQg6Kt
 wlRLScoITMRMIlBLHmrnF/zLrj8MBOUmoyPUIOWHM3z+amWqRQgl3oaR/hqfRQEK/djM
 OSKW5c2d53oP2rCANwPjjTx0V7locF+XR5DEvMdX4RTyUgi7HFm7kyu5uNKw+a/3J+Rc
 eisw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqSGLWFrLXW2O5q03h3JSUIlYnQf8MGBisOzeeiCg5WduD591uo8+4azfSwNefCkrKA55aw12BiMw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO/LwTx5kEirrDW7TvlahUmP5+MDAU/x5aMnH9ZMn42hTtyo/9
 CIXzcjhj6PkGiUah8Eh0dKTAfjPJDEdqNpuBalfcVLCynFmPERS7smw/pzjA7mM=
X-Gm-Gg: ASbGncvNMqe0MVoUzwhIRZz6dsLjBijfb2UAuOMNmZ2ulx2KdO9dlg4IUfY7vmlVv+D
 R2lMpMJ6RAFGWOsKksC+ulTlTsUXwQvzRgTYBd20/ugVT9DGt+cdbTm42nutC8NYRiOp5CeIhCv
 fXuPhsUECVcOhlLZHLruzEsj+EYqAhodVMC1Bbb0DitNj3/S976p0yUgqZfgBJ9L/idXQNbo6vC
 CXFbZlhBFmcYWxsylzqN0RlLK1SiS7a/i+3LW5U1Py0xqD3gGQ9sT/bhWlC7Hn1FjwPjt0wZwY6
 vHTZMAb36cAnXs0C9IkJxbzUxQwY9GU=
X-Google-Smtp-Source: AGHT+IGvMjD7p9GjhrUpvftXXHMvF0vbK7oOwRaetxWgr7yi3kaGjbJ1/6/7j1IQvEsbRwaSlUn3zQ==
X-Received: by 2002:a05:600c:4fc6:b0:439:60ef:ce81 with SMTP id
 5b1f17b1804b1-4396e766556mr33000415e9.3.1739793210354; 
 Mon, 17 Feb 2025 03:53:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:53:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 17 Feb 2025 12:53:17 +0100
Subject: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
In-Reply-To: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3974;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4yRGnHcWDQONSQquawDOtYjp+676tk0lAQdyTV3hXMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMwK7IZW73ULwxxqUXagpmKeHSvU+x5QzO/z
 k2gd9eaWp6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjMAAKCRDBN2bmhouD
 1zCvD/9NDmBcpr4KfuIFGlG3APDEV8rTX5KEwtZ4EYWYh6xlWPARnoeam+n4Q+ZrBgqUqO32nAv
 YkSpnGU2fbzqbNZJ7LDaKe6ZuQ17q8emN9411nKX3L4zyF+3cOi+1ZVGTYA+COfzdrPFnlVYAn7
 Pgg/ojtRQNfxWlLGLD4Q+vB3/OXXMqnslW6ksFANsHYqhihKqwXvX6aus+XZtzbAtP2yGaIVY5Z
 SmzpTu2TvHD1aN17XWdf0nAN3bLpz3uAp3ySxd089adIHfMt5kMXyTSyHMg5svC2jLLD9pvhdPS
 AbK542sQ/XHukkiPeuwOwOLuFTdJjvPBJRjUgjcaPuo/DXUm7rzrD56Qgb/6TyZJFUSO/8gk9sd
 fudKxUkZNb9vsvnxFhFK6uYo8+jku3UJZlKEhVAf1bf7lEaxRizDOvEGq5vwyaP/SwCB+xe0+xA
 hnsoakNgkoEeOeW8QRvC7i2yVAxOzthurIfAfFOIuQhhSBOO85Uymw0nopl4rr14lRXsh6kx60G
 aaopaqdf4c1VRmTF9frM1ysffPNOudb87GsY5KvuUaEED76YlLt4aDdoFSO3lRtR6G0oRpSlW1g
 HBlsmRPu9mFabyUmcrriZ0GctEd8LnCiqzc1n7cwDKfXDPA4riuzoAMw/PdNt/g8U2MiM5drN0G
 MmJAfqK5jQnm+IQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
avoid hard-coding bit masks and shifts and make the code a bit more
readable.  While touching the lines in dsi_7nm_pll_save_state()
resulting cached->pix_clk_div assignment would be too big, so just
combine pix_clk_div and bit_clk_div into one cached state to make
everything simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Add mising bitfield.h include
2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)

Changes in v3:
1. Use FIELD_GET
2. Keep separate bit_clk_div and pix_clk_div
3. Rebase (some things moved to previous patches)

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 798168180c1ab6c96ec2384f854302720cb27932..cf63b4c5c3c0c39f0031dbe948b1694765f01af8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2018, The Linux Foundation
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
@@ -572,11 +573,11 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
 	cached->pll_out_div &= 0x3;
 
 	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
-	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
-	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
+	cached->bit_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK, cmn_clk_cfg0);
+	cached->pix_clk_div = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK, cmn_clk_cfg0);
 
 	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-	cached->pll_mux = cmn_clk_cfg1 & 0x3;
+	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
 
 	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
 	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
@@ -598,7 +599,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0(cached->bit_clk_div) |
 				   DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4(cached->pix_clk_div));
-	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
+				    cached->pll_mux);
 
 	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
 			pll_7nm->vco_current_rate,
@@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		u32 data;
 
 		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
-		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
+		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 
 		phy_pll_out_dsi_parent = pll_post_out_div;
 	} else {
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index 35f7f40e405b7dd9687725eae754522a7136725e..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -17,6 +17,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="CLK_EN" pos="5" type="boolean"/>
 		<bitfield name="CLK_EN_SEL" pos="4" type="boolean"/>
 		<bitfield name="BITCLK_SEL" low="2" high="3" type="uint"/>
+		<bitfield name="DSICLK_SEL" low="0" high="1" type="uint"/>
 	</reg32>
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>

-- 
2.43.0

