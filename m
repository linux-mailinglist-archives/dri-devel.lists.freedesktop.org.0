Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D0A23F5C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F02910EAD5;
	Fri, 31 Jan 2025 15:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x5e5L4/h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794B10EAD3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:03:25 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4361f09be37so2921235e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738335804; x=1738940604; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m17uzmB00GT6kEfgwcoMSj/iyd95VX3uS9lZYb28L7c=;
 b=x5e5L4/hNLNdg0QSbaqFrLMjoJ423H3/b0IvN/YUAMYMVXVdXwp7Le7zrcr31qDSJt
 mi6JayT4jNgyBo27cVJG9G+S73a1L1U7eBmigzg0Upml+5lw645OmLjWG6fL8XphbSiZ
 o2Y0JWZNDjI9J8JzoS9cGPczpzbCBwhyhD+DTL1ESUdJp5XGqQRtcPxThlaeK8gqYhsb
 n8nBHi7zpNIkfBXXq1WLpVbrZMH1d+2ZAntHtkXRgPiRLTv+I5+mT5nxgKkBvzcMwEBG
 O+tZFc+1i5Zt7NMVkiDOeASWuQDMrYKv/+i4qmAVyTz7eMfkT82n0xImGUQBGiCDMEeZ
 HqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738335804; x=1738940604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m17uzmB00GT6kEfgwcoMSj/iyd95VX3uS9lZYb28L7c=;
 b=EjXHjXx+6zWMrP50MCNrO/e7H6tyaGxvr/Ad0eTBf1hJITG8vZbCS3kj/SOxtmYGrZ
 rHWXc4eUO8td2Yjy4SzvnjJbH0z6Z12jKS4IeNG+uoC9UUNzq/YXfPqtoU24XsudbGyp
 4J7t+LHzsgKMFJ/BFqudfVv9pMx+tNzuVlZq4AxF3cGzpDGbPbomT3HucmFezrBRfLr4
 a9nn4OHAfblMCIeWNtzava3MoLU3SDhVS237VcQRPxseBLQ37VpDSyzxmCiSunf5tUa4
 dEWRQdiIM+6+q2KSYdybpzM4n7vqnH8P9ppi3bgcQiuhrwMly2s/eTQkV/AXuyrmk4AK
 OuNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhhFZz3AIR5C3Ak9b+bwJ4P+gVfF0pGvBrnDYS6ioxqyxrw1X2tRkwvuKYFDtYTCIIYlkRpDXDF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw8DgGi4XFP+nhxOtrGdKqCXGklNqwevMRUGEXfxkS/YLk3zAe
 SkMziJfEZlNkridOuJI7PRgN5a0znFJTTs5/Qh4TJ5CjMtbT8eXZCo9yOOE1fyI=
X-Gm-Gg: ASbGnctvyC6pyReSU2lJ84xS/YU7GPWMhf1AHjFfP8jH279nNEAKAL7aEjaZQstT9x1
 I2uJXrCGAzH82cpFAloTwiN/cmSzbVGXCEBzFa32xfdCwX5YuO5ovY7h+hBhM1sddlIbcKaOA+b
 k2AUuv8cWbfN8Dhil7bICT/+WWWZKiJVGGeR6ayJPhrwdyBPlQMe7WxGHBXiBhVcdM+k6tOzFS+
 zggdbfwRNaUM3pOMSsm/Bf9sHtF7zfCvidpqfaFgR+KVPOsOeJQSC9X/F5wR1+bx8sSi5uM/ujz
 LYFz5LoF2cW6q9x34Lh1NW5Ae1/m7K0=
X-Google-Smtp-Source: AGHT+IHa61acfT+KyNQENNAEd0Nj8SRxrL3nqrV5AysWz0NDU8+NBDLu7wkd4aqJgwMag9OUt64tTA==
X-Received: by 2002:a05:600c:4455:b0:438:a240:c62 with SMTP id
 5b1f17b1804b1-438dc43c9ffmr39701365e9.8.1738335804305; 
 Fri, 31 Jan 2025 07:03:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 07:03:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 Jan 2025 16:02:52 +0100
Subject: [PATCH 3/3] drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when
 choosing bitclk source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-3-3b99efeb2e8d@linaro.org>
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
In-Reply-To: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1sAXbb7jAADLo71PpFTSGgQtXDD+l/u76NbI+0/GtkM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOY0/nyLoJ3CPnbjVkTxAPwcTEhEifYYAuKXJ
 U1YeJo4wEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmNAAKCRDBN2bmhouD
 16DhEACNy8BVbPJXOrrzsVVDwnau+ETcAxY7IIdQ9JObd8TVWIMy3PeuM3eKAEJCJ37CFfep3nY
 +ebDoCgMut6CmEcOP57zdy+YnCV+Caseuc20ifRjLKQAsta8OJ2iyjTVL3nH6d/ROUGfYaMfOfR
 rfJoce88n0/sCN0G3aeBwvk8kFGdm0zPxIIljWdg7/1lt99vmRDDo9O3XB1aZhrPPelmbEKPXph
 QQsZDu5MYnHYhiZCwpQ4OvAXR5DpVhxhXMjk079rDgFE8FBCjaDeUFOZGgwhlVOHwXoR5CvQBkm
 iHY/1HMqJVhK58xQhgygIQ4SSjGpuU/HKDpdWpy7f6F2FCdEKZk6VGP4NYTWPjkB0v21sHGUw0t
 NEAeQZXh0N49sV2IvJK+hBSJaDecQdFsBcl8T3mEMAJOmv1dcR/fqX/8jEF3cFWZR0UfcLtV4HA
 JtRNxMKk5z9W7uy3ox0nPytAEqWoIPu4PpT4QuF0bi/BhKh5QhKh/w3lfsoz4LXAS5nlet1sd8B
 mbD1GpB3aZxJizYxmAIBXabsVnAaL4mnJ0ZsFM0gdPAcfB7zdWXd9umiaubK4aef6KMvIcnO60O
 CBQd6oPxVjBwecf6pO2TSDYaiM6xUFiP2XjbEOF9af9kHs9mR6rFaAspq/qxYGVUPU7ZfTkqGLo
 O/y6v+ThTBtjsLw==
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

PHY_CMN_CLK_CFG1 register has four fields being used in the driver: DSI
clock divider, source of bitclk and two for enabling the DSI PHY PLL
clocks.

dsi_7nm_set_usecase() sets only the source of bitclk, so should leave
all other bits untouched.  Use newly introduced
dsi_pll_cmn_clk_cfg1_update() to update respective bits without
overwriting the rest.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6c18b9c0e1903bbd0090aceef13ae8c6f2e080ce..8a9ee308ccffc3b9d112a994a064d8be06d9c42e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -615,7 +615,6 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
 static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
-	void __iomem *base = phy->base;
 	u32 data = 0x0;	/* internal PLL */
 
 	DBG("DSI PLL%d", pll_7nm->phy->id);
@@ -634,7 +633,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 	}
 
 	/* set PLL src */
-	writel(data << 2, base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
+	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
 
 	return 0;
 }

-- 
2.43.0

