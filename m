Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AF8AA4C4D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B080810E793;
	Wed, 30 Apr 2025 13:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UelaZQyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE2710E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so678902f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018100; x=1746622900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LM24bDa7iOIUWC8t6uWvtQysa6eAdU5lGmeO6NndF6E=;
 b=UelaZQyp9rczVntwZRslJGEZXL6K1OImc8TEqx8LhJpqEXlgWTwll6n+CicHUjPK8E
 1BJZTXYZe9ocNAUuWTXHsS3Ga/359DOdNMwM1da1cL2PMHUQYbRfvqSur5E13P5zFL23
 lBYaq/p7Nt+xGDHLAKXHEPYLkeP0+cawxWif+58PmcwDgfbWBTxkTVsuWKa+J2xS2GnL
 QtpOTvexDZr2OkANGR/9eBcOa7tMpeTC4Y3gCFarhPFOCZ8/3gJkQdrK7ustqw7N9Nxh
 kVMpswebAyt3ZeMFL3uqpIoK1Zd0COH7KDBlQ4aRpha6Q7qvtDd234esiqdZ84/1gQHC
 +lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018100; x=1746622900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LM24bDa7iOIUWC8t6uWvtQysa6eAdU5lGmeO6NndF6E=;
 b=TiEe3xrgeQqNQFLyxSVt+BYJxkqKOouP78nnlPGJgzCCGjhSwMluo5Pji/SGy9mQow
 6P/Ib2g4AmoDQriCfv4GV6lE+fq7eZOfw5JeBQsC7qKsCnYfQJwgIzgcRzuYGIGar0GG
 YeZjrIDU1GkHHqu8ZJvi3uir4g3N8mPJlnYYu5pwzjTE5GK2cODz03bG1UdfuXqcFDCl
 Td/dmgLExn+Z78VmgTcVefF08tPD6ktbVdhzwvI1u/tF5g8wx79fm9F70fCsXp/wKUo4
 /nCutDB5aMXvMuNR2Q2BD9zjiFJk9rz91hBgky5qrzUJvfECxOe/4gP/fBd65aFapjB0
 Mk9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPCRvCtcRBxthLUy/jK76u0hMEOOkVh0F/BRHfDJ4DPjhpfvTi/2j2EV1iyEvd1pP175OHiGspqYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy71FCiV/IsHTu95rOqQ6pt8as/RYh6V05dL+euKwCAX8nck5Y1
 e212g/oG3HxYzvQaXFfewGVlTrfeJzon3uZ7gwcA74ZtrNu60mOR4Se4R7iuTKY=
X-Gm-Gg: ASbGnctLJrXBO5R07kv+Z1G/cuk/kb16pbcZ1xRveX3tzIJzFfTVE7hSXCpxIeWCZMX
 z33a9CeRl2cZj7o4XhhpreiWQfI6UDRjEMuWYdHDUDecpamT/tWaNtm95nHTcfZD5mMPunxhs9T
 rdGd/ADr1LVsUKM1ExszTgv/bhZahCAFxjxoLhR0XtL0wiElj/+mC4HqhOUg7mQSCNLEzIHAKDJ
 Z0G9PKuWIJuNiRXCytto1GUlkGCDUEYHvV9Gj1DKZi1FoV7b6W1byZDi9QINvZh1yDM+eMQaBoQ
 7npF636GbtGBxNqnQxs5/V741FvyEkYpxnG5lJzDAZCHNCGXlMEsoRrf+tQ=
X-Google-Smtp-Source: AGHT+IH2rx1fg5ZTesnYB4q5L+He7XJ7RQcIFWsPkQJFXNtvB4sLm4M+PRGEinPbyqmKhH7WkFGF+w==
X-Received: by 2002:a05:6000:1866:b0:3a0:86f3:451f with SMTP id
 ffacd0b85a97d-3a09007e244mr807662f8f.12.1746018099714; 
 Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:45 +0200
Subject: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L86VjcIlUPTyl97TCOA761t4ZCfvvfnN425URVF10Z8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8Eee70M6ToABe2+KYQGOXv5I4i/QOKutTAF
 yXMi2zVij6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfBAAKCRDBN2bmhouD
 18ftD/9GVp0+K2BUhEAuJSjzH08czgrFiefIuIU9QfHPr0uuOIXnmo1kDKgRguApHvgda6Y/TzO
 Jn7PCWEIi85lWH7E9ds8xcPZIPazI7gt/PbL6ABOWGuCIzQT59kVXptV/T3FR9sxEUR1rmk4HUJ
 mSJZySn+JMaNTYdning2aZOzbXWiRyax2lI/JluLLnIJBHjbQ1CNJcMLJPTQp2YCRSL3QRcJVfI
 NdMLtKFQa9WrgiKQPp9hG8Kp77G5l9p+0XqzHIb9GD5W6qqRkIcpcK+en3+7i0aQj+8YS7IBWdV
 gWgnE1QR8aAaYGK/WNwHpoHPxCg919ZFCqnONVefIyZHg8ej/mtPq2MH6XCO9FjY0HWz/QCIRa7
 v1FFgurhyJr8D6GQOJaPV6cntq9mysnZ9Zb8uOhoCL4HHHArsC9bSHM6rsvASQNDlR6CYzcm73P
 PHtm6DNs0Zxlco+ZrjlcaNNkkITKMkrX7FSZvgveNbZbnRopyGJ1bKGyWN3w0SaTkyojaEDGrPN
 PSVhfQxSUQ0KSkBULD5WFoBGqb9aTyQNmrwjhuMpOyh9eKSJTKWoXtW8gPhRLg3XWxytV+uRZRB
 X3JjoRw5w4wJJaNkxFKRfs4zxDGa6ItIhiLG4eN9/93r68mz9gEdktL86sn5U1C2MBoZyvm2W7r
 KveHdE0KJGAkwzA==
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

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
 static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
 {
 	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
 
 	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
-	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	ndelay(250);
 }
 
 static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 {
 	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
+	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
+	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 
-	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
 	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
 	ndelay(250);
 }
@@ -996,7 +998,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
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

