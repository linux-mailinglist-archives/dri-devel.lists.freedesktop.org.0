Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A68356FAC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 17:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E0E6E938;
	Wed,  7 Apr 2021 15:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC1C6E935
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 15:02:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a1so21101856ljp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Apr 2021 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
 b=Ocg1faV18l88DL8KA0alLWRQKCM/tzQUBnYYoWU8RI+PN9VrtfC7pacE4SVHA4mBq6
 sEm7bz08SbbaWwYDk7QX6fyi9Fgf6P19U+QmUY7iyuhbAK70/VcHsyFgDfoKY+BibzRp
 +wOtRoE1dC3XMYT7CwZ8sSawJjCXKXwSu9DK8wDEhPDZmhmVXSgcKp6A/ReU01TS80cg
 DEFzM+H12M4BpX91ONGFfYEZjvIkp6/aYpcCiop+wnhqtv1A3FkB1/5DqqnNY5ib5kgk
 Yyfujg8FP4JDTwZXWaoevmdpsB+n/+HDk9Va2wKBqBDZI80VmbracgCzSKz4Y5sl8dqG
 4stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
 b=rWUyP0Gg37Wi0UknhcC0SST/kBMiM8kp2WnjHD9nw1aIOtAgZgE1jxXpOby25jpkSz
 +CZAaIofgU/7TDlPN+hAlFX77V4O8hQlRSXQAKz1QqaJpstBlO1QaF/0CUdRRS1E8qwC
 c17Iu8aYU7LQwiD2s4izd4ewEbTnIhTIiWldJh0K73/CKR41oj5mK44ttkxMfIjihTv1
 SvA7RYKRpdg6Qtrn+521GI1+Mnw776F6pdw+7MJlEpZWanOIFCk+DWdKwgryumg47NLN
 Np0CboVEMccj5NuMrjL2LW1jeMlSuEpoZpuYowpNXBaWCBmyt3OgqfpvYlutGMU5ZQGh
 tG/g==
X-Gm-Message-State: AOAM5333MXtlbhUJHO/+hcRlFSlVPildxqkWE2jOjHJrpy5URAM8vDwa
 Gf+J9BpCogAiUqVcmAqhltkKnw==
X-Google-Smtp-Source: ABdhPJzfIgQ7kamucHqroAR70dbdqx589P79Av8gZAVKXIfhoQ95JRpIx9X7UTISu86/kF4Gy1tbvQ==
X-Received: by 2002:a2e:98c7:: with SMTP id s7mr2506004ljj.276.1617807722066; 
 Wed, 07 Apr 2021 08:02:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 08:02:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/4] drm/msm/dpu: fill missing details in hw catalog for
 sdm845 and sm8[12]50
Date: Wed,  7 Apr 2021 18:01:54 +0300
Message-Id: <20210407150157.801210-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fill clk_inefficiency_factor, bw_inefficiency_factor and
min_prefill_lines in hw catalog data for sdm845 and sm8[12]50.

Efficiency factors are blindly copied from sc7180 data, while
min_prefill_lines is based on downstream display driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..a9f74c1177dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -817,6 +817,8 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
@@ -852,6 +854,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
@@ -869,6 +872,8 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
@@ -877,6 +882,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.min_core_ib = 4800000,
 	.min_llcc_ib = 0,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
@@ -894,6 +900,8 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 /*************************************************************
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
