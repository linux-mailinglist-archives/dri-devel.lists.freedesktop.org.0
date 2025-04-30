Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A9AA4C4F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA11210E798;
	Wed, 30 Apr 2025 13:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KjC4vgBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873D410E793
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so5073415e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018105; x=1746622905; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EdNjqQg5i6xRoghCD29CUs9wcbOvm1YBLCx0SR2ko8s=;
 b=KjC4vgBgLYHiCTl/3sqztHcV6DZSVLbN+D3y86k0sa58s6Bz7mo3XgSwRXIYNBJZ10
 04R+kYizgbyPZG0JRdpEimQa0EkdpqVb1dvF0n//pKDIPWnHE3CoW5oQ8hHSoFdZNqxV
 vqTFaIKJZHVYpu/ZoVyGGhhpq112bhnaNJ3lL8cXQVO0BsaHU1QHjk1BXVx9Cr8QfCXd
 dCuwa+Y6YkYfNhHIOAoLZQNFMcjHkeTxvmO3VnGvJdWyzdsM2BJOHQ1V0RsZKV4NgY22
 MQ1lfUlsJrcUPXzwS5OHbxHVeDbQTM459F6ig8vT4q/vON8LoRgYBdAawL2PLvvZxOBc
 i0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018105; x=1746622905;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdNjqQg5i6xRoghCD29CUs9wcbOvm1YBLCx0SR2ko8s=;
 b=PjWnOQr2cT39wXYWNiJv80u0fXUllB1vBCpXHMbjL4HzqneYz2FPznzEjjBVBn6T5v
 L7+CYuyluGsGoatg7O519b842rEw/yhRNAxqoF9GDSiVy6BFIH44V7kvAC/PazNgc7lc
 pUhHoQv5eiVa4AwhKRYYUeI9QHpQSHUgsV1jPV4EB4rJVilSvy+HgtwFjZV2caBp1UFY
 BUpS0EYJaf+BqtEc+Nc5DH/VLPr7AUFixH4wDmDXPjxSCJ7Fykm2jTtiDwbLe960BkUy
 N2ljZlwKlu7j9Wsbt1aArB1LXzNRVm9BwWVUe+wMtmKlaVsIIkEMfQBxnCJbVCXP3Zt7
 EnVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqhkeMEoYsKjhs+Ryx8/zqTLzlCo9UK0xBzojcii/WgHIyitM5JpBMQxlL/pLKXcl/Cr5burG6ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPZJpGP2khhRkk3NcX5tFGoUS1htlUwHUqXDhra5BdjDTlB3GI
 LyNBOaZMe67plszp4RdASbNmEXiFdMjPT4XDzjrewr7jCPHvF8zpPUOFfIAvxuM=
X-Gm-Gg: ASbGncsuivl/6x26AESLAXbEG+JKBWtwUDvV4tvBY4Ti9+4Fg9Elmuh4zumo2/hrM22
 4LCVVSktwWrtnF4wQ5VSSAVqlhKjcaJFB1UvzoE88sL85NPdmlpg0LXV4vdEPxXeOkvWbU9sye4
 divGBu8Tp4csi9Em79JaMzeQ47nZyvvBpZurDGLd5f34UO/ehMEqOwG7JXKv7e5wSKb2dXj19YY
 tKl62n8WgEHfq4LW/Ged67mPekbC3sNxv8SVu2/LK+t8u46DSq4jZGO8IMt7B4A+Kn7d46bhgjV
 iwJz+TSpIIL5nw/kQps96uek3hSGlNFx0sOWM3hQZ2e1OuRCjs1zHK8Kp2s=
X-Google-Smtp-Source: AGHT+IFrgdHw2G3ThHyw+zHpXfvGXZSVC/daQYwimx+KIaJ5PX0CRIcRbcsF0f+UXF7qbDVKSETp6w==
X-Received: by 2002:a5d:59ab:0:b0:3a0:7119:cefa with SMTP id
 ffacd0b85a97d-3a0900a0a99mr662375f8f.16.1746018105000; 
 Wed, 30 Apr 2025 06:01:45 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:47 +0200
Subject: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2t6QPsi0pxY1a6kZTxQbsSl3TxAqc6gHCst2b5GPcUM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8G8vQCDrXJtkTKD7N3kyzVYBmY67yyMFfaf
 aomgEcsva+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfBgAKCRDBN2bmhouD
 13RED/4mdfPv2SuXIDBaNuedJNSsqS/1UuGMwIrCsnYQ/1jUdUQfMROL4GffLt+8vVaY35TCfRf
 vWzTZYLEwqMkhhHwQgEReQBEv0Kn7DYDuE4fUKQyJOvY8gs6KGxKTr1HiPB+/tbQ6ls8DV77SJu
 SHPJnvWGtzeSDZHy3drB3svbbHDuKwLKPFH+wZDTfl44exVfkmoZbtF4WpYQev7N0n+qwgI2YLP
 dUhLmUZqZkHY5PmXGugWB/nxO7/sslXPwshiCyXWjyFxS9zFAGrtr6COdiWPMdAAxfbWJOJBweY
 LHGFL+vs7c2wbPxhWg1x1XHkH0vN/CuiW1Wo19uqIfVpqb/5YoEfidHwxjrxW8xXH5gwJkRUvoe
 Z/O4UOeoPXgOpAvkUM8zb/pkZ1m20jzkRED6TiVSUuae+6HEmX8RJSSh1C+bSjg6S9hJhJy+zBO
 FZ4a5foLdspvU/a0YCFZlQnuZgMIu3s0gGr1YnF0WPmoGUIaUcpZYQuT7Wf6qvyKnAC0efgDuSz
 XSDeTtenZXl9LbDByZ2pjaogA8hnD76jBYZ4CKI+NsRALH6EFxbM4gNZrjTvBuqz8nkVx0zT0l9
 P6veu9eY3cvN2UbUMdqIc2tEK75+7imNDnUO4gHOrYTjyWLUG77IrP15wNJvCC4c3ov+ufjhmWC
 D3J0hKzXFW4K0ZQ==
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v5:
1. New patch
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 1a0f5c0509e6dcb04018c3e93aa704c7221a4869..9c7df9e00e027e8a8b1daad7c11dcfeeea52ca9d 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -861,6 +861,12 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
 
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

