Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D363792CAC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206310E0DE;
	Tue,  5 Sep 2023 17:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EE410E0C2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:57 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so43660771fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935835; x=1694540635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
 b=x4U/IssubygIsJHhYZ19I6qvamdg/LZIA2FCbOtWbsGg30FAxpYAHUPjLD6WMbossf
 U8RfhpF547p0lwQUEL/b+kxStaP5DKOoyLkLt1nL2PR0EmhVlVE0QIzohwb7Xd97Ro2E
 rjYqElTQkIbhZcdLOkx+tV6DkDOh7ire3mYvv1EnQVWoIxbjRi7yjFQqXLdnpmI/gw1k
 ZGtkRxH+VYZ44B2MxhtsYAyb4ENHkIeLAG40WQ9EmEnK/UthqWOOeEPHjslR0FzdzE7q
 jKNmUTwSqCWjehuOfneYInu1KnymRINqaYwL1dezcAct8HunuzJGEjWwzK72bv4U4Z+d
 v8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935835; x=1694540635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
 b=i9zbF5hFiTJjQGwPgSaupvNMrQXcUkS9+sMINN56Dhw0X/l1+XSSqGM/PuadJbOlq0
 5c5JwvpCct6eihbFPjVW58ZaR8+gx4DInbB010Q4d6xl8RW7wxcOe7MdFYXRBbBgT+94
 YSGizmwaN8B0QaahS+2cu44GsMvyTXxXEfJBQzCAmEDk7BKV5bE0T+qdDeVf0ClhvRQe
 IHZN/zOoVcs667yfurvLVmrzF80N6Z6MeFz3aA2cNSLP6fFjHsBEqvIV5aEDcRNkc/vl
 B4ujrnQQlVJFeDLzlWnJG++vj1pDQpmgnqLsxSOA9CxdoIB+J0NfhyqyzsKxtYRcuTEw
 90DA==
X-Gm-Message-State: AOJu0Yy1aWacs3iRew++2ktsTY1CPXq3ZeKu6sC3o/EJ3pXWmo37MPcr
 KpaRXQ6mIzMM7WAoS4JiwxvmsQ==
X-Google-Smtp-Source: AGHT+IElplN6q3KFvRAG7bxs0uJXFAJ4kcpfHHWT1BEJd6LPmr5dcbRCi05pi0ZBBF2M6/jFBzdQyg==
X-Received: by 2002:a2e:9a8f:0:b0:2bc:b54b:c03f with SMTP id
 p15-20020a2e9a8f000000b002bcb54bc03fmr349675lji.5.1693935835498; 
 Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/6] drm/msm/mdss: generate MDSS data for MDP5 platforms
Date: Tue,  5 Sep 2023 20:43:49 +0300
Message-Id: <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
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

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 348c66b14683..fb6ee93b5abc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x100e || /* msm8937 */
+	    hw_rev == 0x1010 || /* msm8953 */
+	    hw_rev == 0x3000 || /* msm8998 */
+	    hw_rev == 0x3002 || /* sdm660 */
+	    hw_rev == 0x3003) { /* sdm630 */
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x3000) /* msm8998 */
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -231,6 +261,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 
-- 
2.39.2

