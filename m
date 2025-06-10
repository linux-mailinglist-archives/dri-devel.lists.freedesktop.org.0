Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1EAD3A50
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4731510E580;
	Tue, 10 Jun 2025 14:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cEqpKrse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9A210E585
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:26 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4e575db1aso720773f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564385; x=1750169185; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rpOiO+FEaa+w4A+7D6YhlJmVtA2pagPAEL+dLTD4VlY=;
 b=cEqpKrseG+QV1sMhmhcVtnQXMU2nsYn8RLUOPdDOUOFLASSOPkAKVcVjB0lP59tAiP
 QXcTkIxmj7zgsb22mCAbC6WpH8zm5DTZA9cUFw+7qXVBJttzcdn4DX2wkdMkpTOIv6iL
 tS7Gdvn45m5065FU5yI10bbsDFrnYFhy4whTjZ5+i1Iaay11aRhDjMxM5I/jf++LmYCa
 ynllrLXJBzRbXXfqrn1ArY7j+W5s6cdIzeHdTjEFuvGIKcqimzc2MQPP9pnUlAUnaF7N
 XmhfID8zMnzHvmbVWGdcMUFuzSKZviCe3GdPloULSgosX4L/AzOeulNnZn89sf+vivR+
 fPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564385; x=1750169185;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rpOiO+FEaa+w4A+7D6YhlJmVtA2pagPAEL+dLTD4VlY=;
 b=Y28RkMjpD09oht0D5kBaMXybKY/fDeTo3qSUyqWaYHw9oGHE0tkf98db9Dn6iK3OoG
 mBfcQYIRhRFN1DuPXsUl0FFobqqf9EY1Cm9ZQUodBImrafoGFbma8K/GqaVoweRIh2Iy
 /PEQcShVY7CFbalLFjMEW7x2i85svlugSvOt7OhoimiZTYWTRiJBM9Q5IT11yJxtrOLL
 4Ed82k+fprfm5gs2PHoC6QI1PzbVi8p3UW+xQhhP3ike90/Onb0bkU+wWi+XQlSWgGu0
 uloFHUUSk0qRH4J1mT7e7ZL0XwlEm0Y4jCZYUqRqp6BFYNxfJcD8xgm3JY2M1OH61UKf
 c86Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLhAp5g7M5tnHwMO4TzUJYpgVObCQsvomuA/Q6/F1gpApqxCeFp8Ay6RppnEfUiBZJENWvx3hMkYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycmLSdi6jb7eiynZUqK6u3qflqsIeQAfG59NBprV44t6O5Edke
 AJyUQqciPXzg4q1X5IrEG6pRq+SV9r2tjYH9BX6W9c7lBv4N5HoZ3ur0F/l46JR/rH4=
X-Gm-Gg: ASbGnctDzg24yB460Gr8mrgquylAyszopLqGMu4+uHVN11tDytFuRVA417Y4c4CCxSu
 N1lePZpUQYtPDAHOhIHY+kAdoqJlyqdIxzezaMER3Jbmima/gwq1IslihzXcSh/Q8dCkTQJPoLP
 03ZN3W+28L2xeEX7zvsiYlTc65lTLkwX2g65ALxTbd5CBPvQOZc036zrrDK+tLaVEcSXWb2mcD9
 5TD+oLP+yp6qg/Pmi3WpL8nT3PBDfwujoFMnM5Uln4j8dlWMg8wHBYMaKr+SD8s0bv70ryL35hk
 BQ2klSQTsLrH2n3rWjynCNmVWMZAQ2+rwiVf30xtBe6LTjh0N1iy4r465srsW5wYzLVnZyIxSdi
 1DFCu3Q==
X-Google-Smtp-Source: AGHT+IFMhckmXcGnjChqtVdaAAq6SLAgWxkzv2bzSAaK4VvB5QeKCr7BJgtMZofJPhIMMyh+0XvSKg==
X-Received: by 2002:a05:6000:18ab:b0:3a5:324a:89b5 with SMTP id
 ffacd0b85a97d-3a53316bea1mr4327656f8f.8.1749564384148; 
 Tue, 10 Jun 2025 07:06:24 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:45 +0200
Subject: [PATCH v6 07/17] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-7-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3534;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RNboVNFWutHKxxSCJ7Ad+xBqpxMQb2M+r4Es9Fz+OXY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvFX0W+WTwJ4w1LSGespVXTP1AzgrXMWkFy8
 TE7C6mdXrKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xQAKCRDBN2bmhouD
 17NnD/4mMwgXpWRaFzN80tziJN1bGIPXDrhr0vKKLTqKnew/1/UgO2cwOucF397xWD9s37gwisF
 xlibcQo3MGfJXYyZDuLn5/TXMiPelmJuGAZgP8VI6Yu77rAkURXwjixbNTCvC6A5DXGgsbRs6/l
 Juhn+UPvEDD0yc5VgrMjeQNHED1NPV1Z86yU0gB+P7jxLygbrhWO2apN2/r+ohNrz1p2Mo8YvD2
 Q6oT6mkARDuT5hAwp8cT5NVODU17FcLU/rdU1Si5KqN4T5xRYHXypoaCft/SYy3IaLI3QsuM3Eo
 0OC6/GVtEoTJhVjmSFlQMuQ7j2+MeR1zXOUnG2cyV2viAK1HtRj2jKhakvpxxTyCSDUfmx9GUpo
 oOqHseSgzZJrWwdH4igX6ttQZ/JUX9yD02MMV9noYd20mGPUxoH8+9sWeaGsx8bSzbtJ+88ZQ4X
 tKng722zYkuG6sZPw8gGjFQsl4DXG1YBovz3UNK5ZUS+6YrVdDZQrq9AOawb+bVsH499RAq3pbA
 zBv1vnYAjJzHUOLEFeIiC0xDZeHTXrfx33F4vL7naLp8yx6s6t+lJg6mpNQC5/howyMAeF/aBkP
 QBQJfHfNfBEL6eWtMNRhGXSS/OceJx9A575nEBEGq2zjxcLPKowStveSoCBjnFZBgjw2hLYhCLK
 LnKLQ+LNpwXLafg==
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

Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
masks and shifts and make the code a bit more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v6:
1. Add new line between declarations and actual code (Dmitry)

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 16 +++++++++++-----
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index f0ff6c9fbc2e6d28c96c08114c0f417708d70b10..4df865dfe6fe111297f0d08199c515d3b5e5a0b6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -361,18 +361,23 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data;
 
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
-	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	u32 data;
+
+	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
@@ -996,7 +1001,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	}
 
 	/* de-assert digital and pll power down */
-	data = BIT(6) | BIT(5);
+	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
+	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
 	/* Assert PLL core reset */
diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
@@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x00018" name="GLBL_CTRL"/>
 	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
 	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
-	<reg32 offset="0x00024" name="CTRL_0"/>
+	<reg32 offset="0x00024" name="CTRL_0">
+		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
+		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
+		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
+		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
+		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
+		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
+		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
+		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x00028" name="CTRL_1"/>
 	<reg32 offset="0x0002c" name="CTRL_2"/>
 	<reg32 offset="0x00030" name="CTRL_3"/>

-- 
2.45.2

