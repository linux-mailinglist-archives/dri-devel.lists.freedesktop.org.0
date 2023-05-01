Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F06F2BDA
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 03:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECAA10E192;
	Mon,  1 May 2023 01:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D362710E192
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 01:13:00 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4edc7cc6f46so2470806e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 18:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682903579; x=1685495579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cnI6vO61JZwJqdYgPavotTq1kv1IzG9rA8bUFkEpBp4=;
 b=xyPe3Fvv67nuQAtdoIrUuRlhAvNaRHJu2cGjsxqceJPXfQRWpr4euhUtNpUy2Prwj7
 1nkXgqF4R+gBG5W1a5qCeKdksZLhTTx9W8+Vk1kqlpm5klgeCy9RoWH2tKGSSnWxKe/O
 P9QnzArTbTy5PC23k+oma51mXRAYy6oTJ+ppF6kVzTvs9sxpKsAKDJCmOrb8V1OCUDB5
 Yr1D3J6fkNkEHUquiECEyxmdkb3gbenWjX+aP3Nu6UMYa13ndB3rAtQiOq0gGMwugNDt
 zOW5Ws2CW6Q1n9cv3RMgl27f7CyE1jMdXvS97YXb9nGin9VhJNilOHqEVTpOds0/bDlq
 6ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682903579; x=1685495579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cnI6vO61JZwJqdYgPavotTq1kv1IzG9rA8bUFkEpBp4=;
 b=OAsfKt7A9+2VCRmqfBHxEEqhOCa+LRlZZgWTGkfkR/mwBZSqB/+snpblnQPNsyUzxV
 HihhVW/X3zsbgqCvPLWWtf5BaNzT3l+qoOddvzbw8rbZw7EYVTvHzFxxvSQuuwcE0s+n
 PNmNJ3YptltDpDe0YrryJZ4gsKjHIqZdnY+mMIXw78fxIfhVGV+j7sm12wQ75m9ERGNh
 XzXZAUK1ondWBUSTqPujqUFFLVo9qAXjxspT4v6o4Ek1nw+YT6A/9WbRyk0iesUk77C4
 OVR1dBxv3Sd6HSx3l/PYAy0kdQTb5IdVCDA3hvli26tGytVRgR2Ik2GLANYXUXo751Mk
 gDMg==
X-Gm-Message-State: AC+VfDyNDqbsS1MRIjseTTJpPZ7pJW8sRBnI2LUg3GdRAzZd370/uADp
 kTsj51X0Q+7fKCbOIMe7IPftgw==
X-Google-Smtp-Source: ACHHUZ5bfneIWAzj1o7uii0f3owbo2c5wxb+feyxx69/fl3rCaV7BSYwjnlVTIBxeji/IGSbkMc4Yw==
X-Received: by 2002:a19:5501:0:b0:4e9:9e31:5f70 with SMTP id
 n1-20020a195501000000b004e99e315f70mr4268480lfe.56.1682903579030; 
 Sun, 30 Apr 2023 18:12:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 h9-20020a2e9ec9000000b002ab5ad42f3fsm733424ljk.92.2023.04.30.18.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 18:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed
 rate
Date: Mon,  1 May 2023 04:12:57 +0300
Message-Id: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
enabling VCO before the rate has been programmed. This can cause clock
lockups and/or other boot issues. Program the VCO to the minimal PLL
rate if the read rate is 0 Hz.

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 9f488adea7f5..3ce45b023e63 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
 	if (unlikely(pll_14nm->phy->pll_on))
 		return 0;
 
+	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
+		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
+
 	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
 	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
 
-- 
2.39.2

