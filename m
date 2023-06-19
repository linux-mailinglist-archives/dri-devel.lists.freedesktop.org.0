Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E9735F1E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 23:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1306810E168;
	Mon, 19 Jun 2023 21:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED7610E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 21:25:29 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f849605df4so5161745e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687209928; x=1689801928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s4goZSlfthzSL2bPwaaeATgTIB1vK2ib72gp9EanaBU=;
 b=mTThJqUk6vlY+Hr/dlz7fOcaLVWos/q9L2HkDNYSRS/j/glUk/cfPsdH5divpxLKIN
 yEX1FtOhRLBkQQcHqOeNzEYpt6rY1VnKgi8JofdhQsHA+5daarH+u5JMyklCYkJC2FaC
 N96hBZQHL/64IbIvC/1oyGalyZOFlUMwV9PoTotPF39JQApaB3/GAObq6ShDvXUoYVrm
 IhvxSwuaAw6INoM6KH/IjY1/cAjq5b2HKNDzHkGBtu9xwAJNG9k5ycZCRu3nIwuU4/D8
 868kd7yPbLfQkowIZIUHlHSXXQCDgJ4xTI5XckDbARArva16V9BSRu6J6FMUDMreln5U
 524A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687209928; x=1689801928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4goZSlfthzSL2bPwaaeATgTIB1vK2ib72gp9EanaBU=;
 b=hW1cj3QKz0CXnf3ECV/H8S3FlkyCRGuTHNGPETDGlx8jFYE+wwQgIyn6gZjNvrmkbT
 n18cpnxEJeNNrNxg7oNLk671D4Yj/jWiBcHjiZhu7odsqJ5ELN9G1lVSH1+YYkdsiWBo
 MWvarcPWBZkacOAITtlFh0MKVsCziXjhDiE2cGCDVkin6FDI9Yj4wgrIcg6dhgLAaFTH
 j2mcvmiRzlgXZv679hAEhHTlMpr9YKzxwwScfG083QzyuBucIG+7q5+VufsWomx+RRya
 fiBWe50DzxmEubWku3KmzMKkaR2WOWcc0gt6DwHZWTEnPBhf39dvM2/qPKTirMgkli2j
 cGUw==
X-Gm-Message-State: AC+VfDyYwE9onffHY3xl7+PaoVfw3RMTPO7Oienq3t8dfIxcIj9xsWa9
 T7RinGREaNATnSNZp1bqLGtXkg==
X-Google-Smtp-Source: ACHHUZ6Ji/sXpw/fqA7ZzFWOlAj00ctiG7a3XMs/xqefE4FzBU9U36WCiB5fzWjQcdv7HsrpWx63Rw==
X-Received: by 2002:a19:9209:0:b0:4f8:710c:e2c7 with SMTP id
 u9-20020a199209000000b004f8710ce2c7mr2227893lfd.33.1687209927934; 
 Mon, 19 Jun 2023 14:25:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 14:25:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date: Tue, 20 Jun 2023 00:25:08 +0300
Message-Id: <20230619212519.875673-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
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

