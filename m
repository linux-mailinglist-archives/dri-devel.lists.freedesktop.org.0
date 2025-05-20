Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82169ABD668
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9835210E493;
	Tue, 20 May 2025 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AUjkvzBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257610E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 11:13:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ad54ce36360so23704066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747739614; x=1748344414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
 b=AUjkvzBqLsqllY7+md8ew8k9sCPoHSxVIXF6LEazrdaD6h0JQKEoHY4nbQFO3rRzES
 oY7jpEeabjkW+8Y1nYN091T3FcmjtrwzWqZaPa5aWR3r57NiW3t7Kt37OVg+QKKy43RT
 GRbbGCV5yn9X8jjFCMWTCwJN3Si0/mwKijpUEsQzFw/Jj4WEVJZJuDSIhYA4q9u4VwA2
 r9tHsmjif0KIqG8FXCJHCEaVapWq1rSS3uQ50k1shvhoDUQaGvxdcq7VGXntkYpUQbP6
 YOR0zqTVOrnz7qvKDpy0fz6n1D4JxsXCnE096MVqJjrkiTjrBXPp/J6vOL78j0IGRr+/
 sqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747739614; x=1748344414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRlboOLx+lZB7I+Un/8mETz9yhVxKhkELAyD1TFnFzc=;
 b=jFiiMGtSieKjnToA5JtOYSys43vdikF6Xpr6qu8CcGAUwcGCMU2+AP9ynRN3jinyAO
 NZWKWiVs22fAm5M5fdsrQwkyaBfQejR5IskX5lELq+5tNzzcEDVyHIJLh8rmNb9bN/Ff
 i/rObN/DHX0LDcsyk95xRMIUlELQL5wIxWuWd4tc+HdOXadsWUg2mcgZf/MA8mUE4t3q
 uLU549xU63zr/UopezGWNypCFDxUrA1ZIX+c52jHk4hPRiawvbf3AtLgZZbswWQXSgZZ
 cu77qCqxIAIs0wU35yD0K9J9Rncwt7EeWfeinrjEwsmd1iSX5VYRT+ZcWTwap/BGYNwP
 UYmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3ZJIL3FvL9wqjFMsbOYRIo9QlBBWMMuuRha25YS5BZhKxtp3mgZXehZ6Mh0JSSgfceti7FkNYvmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq4UGhdil+BKVqHZwFYd4v+WcntBtRiOJCT8J4KpwSolkviU9C
 T+eMcwOrf0R1fjkqM215oKnkL5HSYlBvzg/sE4sibAdHTFnTQlfyBA8gHqQb2E+knHg=
X-Gm-Gg: ASbGnct6jMpeYz/HZu7vDVZQi8eO+4+2zq0vCCWj2KFbcD0SFpifBvkk1EYYjTwN1oe
 5aJmKmKGpF3m8NNocp9azFfsuu48ly/vFiBijjRE4MNJkVjzbB9ldc/BtlVJ+wZyBc2US1gXSfC
 LH12F1H80qeIPT3hEGbv19Ktqhs5f30NwXY91PZndEnYFDwXYiaRlnvBalBxONroB77W8eo/y7t
 7znI0SvgP/Niy/FlRAF0Ltfs4ulDAkC++god5tIHEDo9cgrRlUN7pFnxZapV2BxPMiLjYWuc/1a
 HbD0tdzJ1d14pfJchwy3XAE/Ua9AIKpS7xB8QduZVOFqnAc0zBLJDwqZYj/h3A==
X-Google-Smtp-Source: AGHT+IFFcBDcparokAPL5zf+2MVmyXm6MMa40X1yEJQwnjwLJ2/1hy2g6L0BYpZ3G9y+lJt2xMiYYg==
X-Received: by 2002:a17:907:2ce7:b0:ad5:28f5:fe2b with SMTP id
 a640c23a62f3a-ad52d4ce281mr470163266b.8.1747739614072; 
 Tue, 20 May 2025 04:13:34 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06dcafsm729676766b.54.2025.05.20.04.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:13:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Date: Tue, 20 May 2025 13:13:26 +0200
Message-ID: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=exVZFWCvYTW3X5Aq8gygTLrHXFVVVXwyjtGZsGCFRu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLGPVUPKROx0QJfCbeV9e4WfBu8DXgXuh8g72/
 jKif7Qo68CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCxj1QAKCRDBN2bmhouD
 10/kD/9jtNDXdVvPG/epppsydCeNKKYkfy5GiosLMLkTw2AlTI+faS7MwaR/KH12qRYSn9JpZ3S
 vhFnGpBmA0ZAKfCYKRFc6pCmbdvAVp4oc9I3PQSbUrgUJDMbVclf9wZu8QC7QdrYJaJjhhI6Fyy
 95I96JTEEIlHZ++cJCGIm3N3rCw45GJaUlaIIIvfV7mzU0906I2WR+vJPpJ/5V9LhufwDtdMAJG
 rZdiO976aT+nt5kaN5gkaux274MOL9WVK2wNfHpVd3BmoE9f7ktSQgcuX1dzcDcNu0bMLvcDuki
 DjS4XAwZcVRH86XSeoLxEKwySguj5fZeSvMtlk9ZqfPXWzgr/Q4RTRlwI5/q9pPL/bNK2b8Glp+
 O22ndNnkmA6wfpyCKxkliWxS+RBI8RBF8M1Wtu0Qu+BP6P2+GhVKsODGFPFPTX7+PXFi25vvxWU
 lnFxnZ4D1+5E/1UPmEiZcx001aLXa6e48MwkWCVGB8C9yuHEONKd19pyRv4ytTqnpS1RPe4awgR
 9+k5aNcBvgDyc8rnjaXWfUV3sqVIeM7NYHOt1q+03j4FNY0f9yjoGVnDWk4IymXQAtTcXVEsoff
 W3QVUZk9QlqM05zZyWOlsR2Sgt8cf36zRZpq4Hz8s9/IMk5x+QjW7dk8KVB5igadGjjLJXRQPZS
 2T9qrqXbYy3b7SA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Driver unconditionally saves current state on first init in
dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
divider registers.  The state is then restored during probe/enable via
msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
dsi_10nm_pll_restore_state().

Restoring calls dsi_pll_10nm_vco_set_rate() with
pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
VCO and messes with clock hierarchy, by setting frequency to 0 to clock
tree.  This makes anyway little sense - VCO rate was not saved, so
should not be restored.

If PLL was not configured configure it to minimum rate to avoid glitches
and configuring entire in clock hierarchy to 0 Hz.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index 9812b4d69197..af2e30f3f842 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -704,6 +704,13 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy *phy)
 	/* TODO: Remove this when we have proper display handover support */
 	msm_dsi_phy_pll_save_state(phy);
 
+	/*
+	 * Store also proper vco_current_rate, because its value will be used in
+	 * dsi_10nm_pll_restore_state().
+	 */
+	if (!dsi_pll_10nm_vco_recalc_rate(&pll_10nm->clk_hw, VCO_REF_CLK_RATE))
+		pll_10nm->vco_current_rate = pll_10nm->phy->cfg->min_pll_rate;
+
 	return 0;
 }
 
-- 
2.45.2

