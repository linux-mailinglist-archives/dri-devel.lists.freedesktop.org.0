Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0B972D581
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A94610E2F7;
	Tue, 13 Jun 2023 00:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4BD10E2F1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f658a17aa4so5034550e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615017; x=1689207017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=kL2zLIKc3K1RIhbcSBHGhQAZSxclG4Fzx8D+fnY2NCfT1Zmb0ak6YsafowDmc3bOCZ
 T7tB+c/xZigGfHYWhBJz/J0WkUPwbBTcDFMfyuzk928lwz6bh2YiMAwfqSl3Zye18+BS
 lDm8ZI7Q9G+d2HyRHOgFCCrd7MBefdW37PIuoe+3TrMB+ThK7ZOBUPrJbkW79+3EJNf2
 dZdwasg4ljziQ/pHbWy7rdeqZqx3DR04ZQfEnyAFMEus+N+q5YLLyn1pPldf7NL7NzXH
 0zh2W2OZnMHTtPOGTuIytCaIsJlhiN0GnZv3KFC4CFWGr1mCKDburgZ02hPs8XiweqJv
 t/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615017; x=1689207017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=DYjks+j2X+sZpLHmeV1k45aWCRKKt6J05Y8hAJOOl4liWvXEE+AlAhrXX8Frc7CTMC
 tLTCPFiWPI0C9eoeRlG/FykByVeOnkcrN2zMfK+QOdKddSRT/iAVlnXY84RA/syqZ+EN
 +MKcTR+Z0e3gsR5MA7pky67EOGhqLpKJ0+TlOqEv+YgAmjo5aDU8NmBlhGl38xvtRNli
 pPrZyTKC2L8EnU4S186BO3hHvSomNy9La4Tam87NJgU8tip0R2L442Uy77QiNwMME9Ca
 AZfdRNUQbPRaYqJRK1LEA8cuk3vHmCLr/3g1wuEioceE8bqy7375eaFEAU4GL9wLMCPG
 5kMw==
X-Gm-Message-State: AC+VfDwJVopvtKumcZiBTdzb4s7z6UkM88O/y9QmKEqPdHcldxr7m9Gk
 wDCPynu6W7BFwit+Kt6QJOV8GQ==
X-Google-Smtp-Source: ACHHUZ4ymOIFZTCpo2UGGUHH/1lDi05HFldscAeD80cSZ6T1hiNar3lfd5/hDhCbJ9pqU+esdJAHdA==
X-Received: by 2002:a05:6512:340f:b0:4ef:f583:ee16 with SMTP id
 i15-20020a056512340f00b004eff583ee16mr5913368lfr.57.1686615017615; 
 Mon, 12 Jun 2023 17:10:17 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 11/22] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date: Tue, 13 Jun 2023 03:09:50 +0300
Message-Id: <20230613001004.3426676-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

