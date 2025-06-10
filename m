Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1AAD3A58
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C529C10E583;
	Tue, 10 Jun 2025 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H0fKDGjQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F210E582
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a4ee391e6fso560645f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564389; x=1750169189; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nqJFAhZImmJLT6F/iwuPqcVqD25Q3l0Dm4UgxTgH1KM=;
 b=H0fKDGjQaNiwo1CPhjhyLncaGOW3Whh4PDvjsSU5FQpm0K1K7H89qfzXdYufg7Bfsp
 oaZCjMsMtN3fRBNFHLkGJac5DQuUF61otBpeEPoGdGSwBT3EmKC3HzeoPsn4GN6OsNbm
 gAzJmT7R1cTu1zXt5Qk+V2OyjdAfo/z+j2SgjjqG50xj+Qtws0D54Lz1sg/Xak1lRuea
 83+qE2UKt0+rsJ/agR9SpCepih6nvtSdYFp4xncwocnbwlcuuhDAreGmcpdJTOh7iVpf
 KLU1BvmMImQE9ByyxCIKIdxaywSWdYaEtj6QSCqu54286YEB1Zmxjom4zPI7jzXbGWtW
 bzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564389; x=1750169189;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nqJFAhZImmJLT6F/iwuPqcVqD25Q3l0Dm4UgxTgH1KM=;
 b=MqZloas3jkWIDktGdi5xNEsqip6lyMX1Cm/nRrtSOFStYS2erWWX5k/UWtZBMSi4rb
 clRyvBcmrsJKPy/bU9Ctv9pdymE+7vyEAzgYYCQ0TLMSVhuVe+eOqmUT7MjYeYh0yxUR
 3QpFLwjSsy9imfgut/VkqYIquVcnWh+sH8w87aM8KnTnBiG03M7vTF/U4erikk4+292M
 9Xy0WIqQmtNmGl/pLnUG/Bwd6SIjvwzKMyylV6DlI+W4lZExVuFc940lHbnLo3EnwHjW
 3Hce1qmLmdB5fAunDXl+NJDwKNZwwxg8L37G5gNLNUG3fN7RmvqAqYAIsqGW6tj0BzrC
 9w0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXjpSFWcEG2r+N9bJ0DLIFCHDSOyumpRwXaJXHFsyk2i6s6mg7noBiz8yxrjthwHbe2vKCYxCKYIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxao3MfyIX3B45VgeHAlNTKpcGEKO4cYa4Z2tC2Gfwp07Sq5LIK
 mxkCtTbQqStlULWAL6CScauDs12gvu6hHTcKqMBwslmJ4KANHssy/IaIl3oIQMN1rIw=
X-Gm-Gg: ASbGncvGltmop/2QM+uqIm4zOLDKmesKUr9iD+fSwJwu6jE6RhqQpfi/drCbDfivUv8
 hNouebDrOeT8dbPTv+hOdyQxPjoGll0sCelxfDmF9D0Dj7ocTG9i1meKMbD8erwy/M1ey41STj9
 bMO04fwdCl/wkKXuOaONyH7XFERCNi/Oau0ALoqk+62lKrQRJ8BloR9yiULzzfWjEuMCphtfEOK
 5pSlxKaaZQxpFCB+H8Y7hEl3B634OnBQRONXv1BbhxlXm5zcvtlHMR3mhBm4Fmf+wsL0ELpSFeO
 Xyrm1ZDhlsKmJ/pylYuolxiBnqOMFopgzkstbpjyDXS3j+CbG/DELSnny2smtTvXVRbiD3k8dkD
 b36Ij1w==
X-Google-Smtp-Source: AGHT+IEEJ6z8QUKh5XvglJLU8dvLQFphknatasXcUl6yo3VjJtNGAm6I6i0raNXrO7ZgnDH935MaDw==
X-Received: by 2002:a05:6000:1a8a:b0:3a5:28f9:7175 with SMTP id
 ffacd0b85a97d-3a533191acfmr4616866f8f.9.1749564388440; 
 Tue, 10 Jun 2025 07:06:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:47 +0200
Subject: [PATCH v6 09/17] drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-9-ee633e3ddbff@linaro.org>
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
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r3bCNGwO02nDr7rPnLE+84z6dEiHu1cfrjHc5wvaEJQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvGQ72RTtMUU5JnIlCVSvh5DzJZTSCqtoC5f
 BLQ4MyBpFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7xgAKCRDBN2bmhouD
 1zxeEACV+ExG0wpSXh33T1H+6hfRwdZoJkMXq+pm3YaQ+LGLPYYRWRou/s/wAzV1Ggs39lpaqNM
 g3w0Wd/jyxS4Qqtf+ARoEO0NQPFXxXIkGyzlo1KZumESOxLJs479OAWcCPHQ2v0INNhusUyjabc
 tqD0WbEgdnUN7lRLhkfWzAJfH5J55eK2Vs4wZyrueipTtV0JUPIpyBfWNiNaNhUphYeARojUXbs
 75WxP2LwNe4I2/sipeFsBQ6xwd/Hdh1elSXhm5ieoHR0TeyfiYBfnE3LGm2xVyQVm6RpQTj0pik
 hdUKhb4D9e2WM7Y8s04KrtxaxsZk9+Po/K9UceFvpayNfVgZx24wSteHLP2lRGBrh/PQsS5vSth
 PVf4AmohlAJId1pDS2D8KILoF3H8zflnIttuPpXhgD8N5nFMi0gDh53QOXLGBS9GMXPwPvDBpxr
 lLiKK1f17/f8mJjgzIPz6nw6iZCrgFzmr6pdkSNtbvr30xMg0Ah770CXWzl8XMmiKDKxeEISXzF
 S818rKPfELfaJBSanJlOWXPzbPQ3IggHyOEr6dTAPXB86D+7C+LpQBDVH8Q7jxEplJgj0vPsCPL
 kVZTdwGGMJUx+LlhM6/yR8LO/rgULXFTspW6wtwnK/t+jAew9e/FPIvZuPoNbIfvJ3vYUTRCe5y
 ABTKmPoZbjI5mAQ==
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

Driver unconditionally saves current state on first init in
dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_7nm_pll_restore_state().

Restoring calls dsi_pll_7nm_vco_set_rate() with
pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 22f80e99a7a7514085ef80ced1cf78876bcc6ba3..c8b4a84b38340e0f907e0123299b493768454160 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -862,6 +862,12 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_7nm_pll_restore_state().
+	 */
+	if (!dsi_pll_7nm_vco_recalc_rate(&pll_7nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_7nm->vco_current_rate = pll_7nm->phy->cfg->min_pll_rate;
 
 	return 0;
 }

-- 
2.45.2

