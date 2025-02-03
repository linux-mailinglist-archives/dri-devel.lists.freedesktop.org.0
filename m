Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7E7A26167
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BFA10E531;
	Mon,  3 Feb 2025 17:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PI1pwIZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2654410E52B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:29:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436246b1f9bso7145035e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738603775; x=1739208575; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
 b=PI1pwIZGQbZEpTU9OOoKY/OpZbmxuhToDxpzs0+GgWDe735u9aSBb5OX+yUK1QlQNj
 iL4Zj/FgXyCsJJD28x1tgn5a/v2PNURT81FIxKlATvE2eKQ6wGoDJEbsGFFwekFWViaA
 B4gpT9+DRd/eXSiGxSKj2cWVUZ21tbRyGoDVTp7dokOdZc/CGUvdy+BNEVg67QSegVoa
 YhuK1sEkb5kD6gj8TDBwKyA6OqjFVS9xGKIkx/6a2l82XGX/fOkO+dGL1SoCb3+5bnTp
 Qryj3wz4UODHV9qaZHXiAT4d1J/0ISuOrysvbw/J6myqPMDlEDGeZ8Bu4iEauGgLfY/s
 Nngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738603775; x=1739208575;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuYKr/hO5ESxnU+rHE9EocNAqOyGfy1DJ7LFqKkR5XM=;
 b=eFdltEGCizWD6PiGzvY5/H57864lCLRIx7WFFoPnfo/4+DdL6+H/LVxf0cERLJ8h+9
 S6GXgOR2PkffYxoQ7m75wey9syKbaHCHh3s2vYwbq/A9Nj7Zbw6EZ1bSVCNasBWqjY5H
 QuGCOaT6BAIj2nOrJD/t5EzcpThGIta+J8OiizTn1+9zxE44aZLyUDEgVW5Q2nQ6p3gO
 REdvTQPHy0ZknLSbeKVOj2MgDfNS8UccDiyJwBJ/LmMjfm4yUsbKmPJhdMsz5P2VKEM5
 5jVJAI2caSB51hImT6gDeFxyKwg9Lmh6PgrX5Rawi8728zCBChWQqr1l4A8fgXCwmnHH
 BwRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj7+XVxh/bEUviZxBzNp3T0vEhF/bd46XPa0w6htZBIceot+y/VRfnKymW5lxK/PFD1DRJ3bxk9Ac=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqMgIP/mqLD4bo/e9CZmozVzGSrjEYcQOaYGy2OVwTrmm67ypm
 SkKbXhJfkoMHzzAnwAKB3TZPIDNMLt4ova42zaU3yvaTmBIG3DkIUcKFG2x9cA4=
X-Gm-Gg: ASbGnctYYGgs2b6d2VPsVCz7rHfbYobXFTz13pQVt1/Yayon0EobNg0QBRt5ncIuRSD
 vAT6Tw2u66ssM3hgHwBV3FvgEGAzaFxYMR0m6pB/6aKJZhJO4O+1Lce8ExMerA+tF0JYZyII7j9
 Lo2Iwyg5r7xOm3V9BMl/INH/+pg2Cfs9dJ98CoQfYShcTGYq13wJIBN8ZU4uBCmSxMf2ChXNJvF
 6Fm6+pdqy4Z1Mx5CQnvCsV6LWI/mj5cjQ9BTJGF/+XG/HO2S94pBcT59qafD81mlU4MOtdh7DBY
 r9l43Ns7sh3Whfg+oFwAAmBWJGxh3QM=
X-Google-Smtp-Source: AGHT+IECb98Xkkqy62+Q7p2Drgjriyq42gI9R4uri6xqRDj25EMSJm+y28xmAHcntMRMQEfZGqJsfA==
X-Received: by 2002:a05:6000:4013:b0:38a:8784:9137 with SMTP id
 ffacd0b85a97d-38da4e637e4mr149177f8f.9.1738603775494; 
 Mon, 03 Feb 2025 09:29:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c122e59sm13528122f8f.55.2025.02.03.09.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:29:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 03 Feb 2025 18:29:18 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
In-Reply-To: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qPayIg/NkA+MgAFyPivDQRmrfYR5ne0X/KrNddzzxvc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnoPz5WQwjRgNnNMv5Hfv7P6hoqwOW1ag0x8hBw
 6PQOZoOJZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6D8+QAKCRDBN2bmhouD
 1wRzD/4jCTIK8MbzpBxNwd/b0SIj8Csp+QLgtshMGR8U7NiBcwPDx3vo/xW8PpGfPxVpfH40Cd+
 WrN1C/pNihHURZRJhoGPIrFRFW6VBFM2znehMUfvdkHGsLVxyT6UUkpsE5RiAVGa2Y9MHSv4osR
 JadWShWRvTiSaEH9S8jqj4ZrnnIKPNpiHYTJgEVomWb0ohaduXyXsXeLa7vnfSQKIpkDHJwKGaD
 l5h64tzDYk7D/8XfNa5k/L1Rkh0Oe9TOt/t/SHkJDWkljek3IqQ4L717HFfZW8jpJWB8UBTcnA+
 KBrP6SGSP0JrM/p5DKyia58IoWMKWN6qnqPsbsJdL7tvdyGOTqrNGBN5uGMpLX9NiO7v2X4vcAe
 jV00rYtsgS91CNe9lYealqyuXgBUezMFW2rXwJRoTHyk622+JfywVaG6BKdgZrCs+w8UnDcgOie
 6d5Sn37sXVt0WbxKuqZqf2Hmqikpi+qRgOZRHqQ9KE7/XEuZ/4F3W6i27J2VX3OsYUFnhbIETcc
 IIy7t5zJimNNF0rDrRerf9cYwk001V6uR3v7+kv4NxXIvJy3ln7a0a46D1vxqUDo44/d+evkfbi
 luJ+QkmH0PojUAmCJMaFtswrsB91IrlyX4aGGiLmCVuvzoZCazYzkUr8ScBiF8Hfg9Q67ZpmBNg
 WzBkgvtEKrudStg==
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

PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
divider clocks from Common Clock Framework:
devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
clocks side is protected with spinlock, however driver's side in
restoring state is not.  Restoring state is called from
msm_dsi_phy_enable(), so there could be a path leading to concurrent and
conflicting updates with clock framework.

Add missing lock usage on the PHY driver side, encapsulated in its own
function so the code will be still readable.

Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
 	ndelay(250);
 }
 
+static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&pll->postdiv_lock, flags);
+	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
+}
+
 static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
 {
 	u32 data;
@@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 	val |= cached->pll_out_div;
 	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 
-	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
-	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
+	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
+				   cached->bit_clk_div | (cached->pix_clk_div << 4));
 
 	val = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
 	val &= ~0x3;

-- 
2.43.0

