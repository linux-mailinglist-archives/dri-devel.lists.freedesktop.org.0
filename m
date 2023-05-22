Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1870B291
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 02:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2562D10E232;
	Mon, 22 May 2023 00:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8973510E21F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 00:42:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af2c35fb85so21452721fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 17:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716150; x=1687308150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
 b=SuQPA0Jaa3BwdVOg3HARRiUy269QcbA6O7yq6Pc0rm3/YOLDCLkMxueXRD00Jbjob1
 fghM/DjmCQn+fhr83Br5lDLC8hfESrPOwEhM0OwnbtUV76zrdeDonIchGu/nYaODK8Ng
 3ffelWHUZs1sjmFgSqAIfHIuJEG2Px+Reg9cnY8sGM0f3BJq0WW1C/7Rd/LgN2sKEh2T
 NlP92sC66+ekM2xMLW5feeU7ziqmgtipfeX6yLa94bbCjNWUK/uTcV7QV9LWY73Lrk76
 t2F8iVzo8xlvmx7NIWSpBhLmAC9fwhRUYtNpYlIOfxE8y+yRWNgrr3JRcnosbDKKsPr7
 QOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716150; x=1687308150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
 b=LqXJ4tUhtRsIdbGiAl2yRTczIjSh6rwarUpJzpRwTe8RsfqMrkfudTNLwdnRXV5vfb
 UKRJJfvLh9Y0PsLvzYeaLxCsictt/Z46kb9p2AfFXZop3eFfXZ4jVC2W1GPx49k5hYoy
 89tyteYTQxkkRuqZkk1ZKV+kqk4uEcoScert5OIXAnSWlcPDORyRd00hfwJooxy1cfjv
 JB3uP3rD+RFGPrPBtKNKaKnLltxBhsOHfcH/Koi+QDgCTmqNgf+/HhLSO4IZPgOQiy1e
 wSoHa3oVP2nQT4loR61ao0KY9uUU4Jfx7fukywTvX+klpdopTd2eKQtRrOXiFFJUIS7D
 fgRQ==
X-Gm-Message-State: AC+VfDyasRC81A802S4p+OODj0t5JKxiSnbozkv21Pjn2iFcM+M7x+Uh
 5New8aeNfRbwkVs0WnX6+Qtntw==
X-Google-Smtp-Source: ACHHUZ4ggFhhA2hNrKjtxpGMbVrJXZV1LH3tuH4c5IaHWg2GABMg6MdloukTTdkTvAEqvYCsNDdAtA==
X-Received: by 2002:a2e:81ce:0:b0:2a8:b7e9:82ee with SMTP id
 s14-20020a2e81ce000000b002a8b7e982eemr3385826ljg.1.1684716149896; 
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/6] drm/msm/dpu: inline __intr_offset
Date: Mon, 22 May 2023 03:42:23 +0300
Message-Id: <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..0776b0f6df4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(const struct dpu_mdss_cfg *m,
-		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
-{
-	hw->blk_addr = addr + m->mdp[0].base;
-}
-
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
@@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	__intr_offset(m, addr, &intr->hw);
+	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
 
-- 
2.39.2

