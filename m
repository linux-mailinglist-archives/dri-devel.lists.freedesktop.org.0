Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D511C3901ED
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88946EA21;
	Tue, 25 May 2021 13:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803516E043
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id q3so15879831lfu.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWoFKEoGtTOuTzP0C2jwUTGuOWcUxql2hy1byMH9TIU=;
 b=hfkwFnBMrceotvW547bghRykcjmWgmpbSNKji+seAYyqhsPfjwd1te1nef9J+lxUPR
 pFykXWcZzeLSq4oU4lIbzBj34/wvFpVyG8PWZSk/Om8HBGm8Q5cWCvKElCTKhDUTNamc
 S8HXlkTHphuRjPj1ZQkjgcpqBalZg7WmsOZ1AaRnlwiG/FW/R9NBhHYOupvHS01jcB37
 oUTru/zXUKKzMA9hw6SNiYmydFnfG2CgyPgXW5jp71zTkttfyxZOn9fYMRYD51pScoOE
 3Ldc/MOZ0XYDNehaWwaOUWamDBhlOqZh656kmO9Ncl+J383cJSIWMSCMBz0wBifcvbSY
 XyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWoFKEoGtTOuTzP0C2jwUTGuOWcUxql2hy1byMH9TIU=;
 b=kynWCE7ogrPqAnxM+ei4m8u2Tsx36ycmon+Oh0Lrd9SFZdQj8pfaBSys/Q0Pv2+BSD
 H22H2cugkUkPP1Gq9MNNjO3T+0VXdxyA91e27vtGKUOplEdOfaTH9Nr9HLsVG5ynBYNe
 3Yo5YtcUn3U38I8aFx2aLvwTpHp03PPfXDxjccdQI3qVYyUSVrlRUZBYTrPM8XJvepHq
 NK6PRcGnGKKRgGw2FSjddaSXZN8y2DT2OMRMS5buY4mio0Pk/6ZvWx6u6/qAcmxX+84J
 GsDHDGNoNmFAl/pkkYiUE4BcVZwO/2SrFabCpTXyMMAOazYX7r8WMMTkwhx8xS7p4MNs
 1pCg==
X-Gm-Message-State: AOAM533vpz9xUU1l/nukiTnT+sVvvkjLnvpTyzZ8B9H/QdZXAvoi3FI5
 BHQcvY1OitNLmbev86s0Aa8USQ==
X-Google-Smtp-Source: ABdhPJxfPYb4gHyeda6eVnBIMz7niUxy4fnQGSA/AacFHjB/kgzS3sLbLemgKMqd6V/zeYGixicOQA==
X-Received: by 2002:a05:6512:209:: with SMTP id
 a9mr14628411lfo.219.1621948403005; 
 Tue, 25 May 2021 06:13:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 6/7] drm/msm/mdp5: add perf blocks for holding fudge factors
Date: Tue, 25 May 2021 16:13:15 +0300
Message-Id: <20210525131316.3117809-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
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
Cc: James Willcox <jwillcox@squareup.com>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: James Willcox <jwillcox@squareup.com>

Prior downstream kernels had "fudge factors" in devicetree which would
be applied to things like interconnect bandwidth calculations. Bring
some of those values back here.

Signed-off-by: James Willcox <jwillcox@squareup.com>
[DB: changed _ff to _inefficiency, fixed patch description]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  7 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 94ce62a26daf..9741544ffc35 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -95,6 +95,11 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 125
+	},
 	.max_clk = 200000000,
 };
 
@@ -177,6 +182,11 @@ static const struct mdp5_cfg_hw msm8x74v2_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 125
+	},
 	.max_clk = 320000000,
 };
 
@@ -272,6 +282,11 @@ static const struct mdp5_cfg_hw apq8084_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 320000000,
 };
 
@@ -339,6 +354,11 @@ static const struct mdp5_cfg_hw msm8x16_config = {
 			[1] = INTF_DSI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 320000000,
 };
 
@@ -414,6 +434,11 @@ static const struct mdp5_cfg_hw msm8x36_config = {
 			[2] = INTF_DSI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 366670000,
 };
 
@@ -509,6 +534,11 @@ static const struct mdp5_cfg_hw msm8x94_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 100,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 400000000,
 };
 
@@ -617,6 +647,11 @@ static const struct mdp5_cfg_hw msm8x96_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 412500000,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 1c50d01f15f5..6b03d7899309 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -76,6 +76,12 @@ struct mdp5_intf_block {
 	u32 connect[MDP5_INTF_NUM_MAX]; /* array of enum mdp5_intf_type */
 };
 
+struct mdp5_perf_block {
+	u32 ab_inefficiency;
+	u32 ib_inefficiency;
+	u32 clk_inefficiency;
+};
+
 struct mdp5_cfg_hw {
 	char  *name;
 
@@ -93,6 +99,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
 	struct mdp5_intf_block intf;
+	struct mdp5_perf_block perf;
 
 	uint32_t max_clk;
 };
-- 
2.30.2

