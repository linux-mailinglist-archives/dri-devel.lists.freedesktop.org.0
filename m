Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D27219DC
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F8110E178;
	Sun,  4 Jun 2023 20:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22D910E0FD
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f62722d661so555331e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910943; x=1688502943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ngdskt7sc5i/f/N0G4HMk1MJYYzAgPMfb7pEaA4uo2I=;
 b=ueiIUWIVSdYwgbyvq+J1hFfpTiuJZQ2RuHphgIIjNmOVwebZKja7J7Bz4SWTeQ4MPG
 mAh2LsssXCEbZYchFpan3ogZyxUYUEa8xjmiO8LGLIAkDulDUYoitNU8PHclNxzyPzct
 +oF74ijmg/nU4txdLUEUfpS3BLujiQBxo+Cbx4kRqgv06WglHkVnYB9d4cTvbdaWcfQG
 XZKpjslpEMHpdJ7bJeYrrfHgpBIpi804iP5+J4IGeoR8FnRx2G0Z/l8M6A3o4NnPu6lg
 S7Yg+Wf/qaSTMrbjuKqVGiw25eUKio/1z/FT9HbdSdZ3bIr93XXmWWzkenfmRsi0hDOD
 yJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910943; x=1688502943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ngdskt7sc5i/f/N0G4HMk1MJYYzAgPMfb7pEaA4uo2I=;
 b=LJ9Z7MT0+c6VAC8jfc/3NOxAtIu6Bp1VQiXm93jTFAHUx+tJh1y2mqKh8jyJogxKAC
 Z4ofPifSIrRv+Ek6LA6aBvDaC0F62Wf/7XdYHwAQ35LA/AWCWkH3sSaJ4w8W0VQrGnrd
 MukUVCOuOrp+kDZzG/EnDHbFwgvhidIRueBXr+lIIC504u5MfFmAH9mybEZpJ4zoB0RQ
 cZ9XFNVmFh+r3gRvvoeFlzWAWk1Bp3aNvThlBuZbNWKsaFJ8wZ6Gnn4hDWdZbsb0cWJF
 tNsFTMRQy1r6X5bKlOUgx/NK4gBvR78q/wjCV7tqciEu3NgRzvrd1J5tVUMy7vrIgGEj
 SdKA==
X-Gm-Message-State: AC+VfDwM6E8DOtMtyIXZOlFqyV5BiJ2kG69M1s7qNUCMhZSzM/L3h3/s
 D+ZPtWoXOr4zA8uxnbZydKo0vEu8fm50PF4+tvg=
X-Google-Smtp-Source: ACHHUZ5agcicHZNWHA4kPqgb4UqCW9vkzU3zZXgpeGhoqE2h3yiL5FvJVmDb3HNpakw5h85OHsN66g==
X-Received: by 2002:ac2:514d:0:b0:4f1:496a:de8e with SMTP id
 q13-20020ac2514d000000b004f1496ade8emr4386886lfd.27.1685910943418; 
 Sun, 04 Jun 2023 13:35:43 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 09/22] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date: Sun,  4 Jun 2023 23:35:19 +0300
Message-Id: <20230604203532.1094249-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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
index 91844eb65b6c..8d8a38e10052 100644
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
index a2dbf61bac2d..7db137e1f782 100644
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

