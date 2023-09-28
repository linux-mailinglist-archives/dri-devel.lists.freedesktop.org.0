Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EA47B1B3A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 13:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE1510E0E3;
	Thu, 28 Sep 2023 11:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626FF10E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-504b84d59cbso2489548e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900940; x=1696505740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
 b=MR3t/ruiqtmEwlF8bTYRoW9h523uXi5BfddOdOoTzi+iHClMh/Vs/SU8IUTB+wqev4
 J3zzLrzXHItJlZUeBqbhnRfUJFm6O9VOyRsIt5cgqPyTU7euIngJ8vqYzpZeU1SUlN9h
 oF2qPSS3cGmwrW6qThrmPN5juZpRdcnI3XVpSEaqPKG1bgq61Z1MPaJJKMCgFczYi6Q5
 QJuY5BGyUCS6uDiHQXB1VUxXox/cx1brldC4NdeBLajT1+0OqALzWfLW8yI8cNyVCQkK
 ZseDsNmTFl8XXn1EuuLktP2HxzHW6XmzUZxR5ZVZakFTO51zOtgg/Fzmq0UsrN0BnMvy
 Ck0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900940; x=1696505740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
 b=mImKk/7+PdrKt0aV8zwz+3BXQr6mu9lyjGm+RGsvekhEQzknyEHzQ1fzfrwrDt9lle
 Xnp1lotYUYMZN6bEMcTapjGmO/nWzjSp2bMZx1HwYxYrOBasYa9aEUskMhLs3549/C8X
 WG+CRVAXqh7+l6YINkpSL66hbFDQrBxG3mfB60jI9cKz244PMTlTPObqIzvrvsTlh6G7
 Gw68TLZx46pT6doC8426hQsO3xrDpkXnnn2LUtKzIO0LGK5aHOonrUtuxnxaoSp8XvE+
 w7IOioqf5Lzd08LxPExLbs5YmmngQ/2LMrg3Xt1MFbaLwgbHwLZY+dtQkrB5cHSvoni9
 S1XQ==
X-Gm-Message-State: AOJu0YyDyzSF8Xy4eeNSuqYXHLLJv4wzttUuO7VhBMrdqg7ZHtThALbv
 peLt9EaH6mjclc/czdyzkJWCLg==
X-Google-Smtp-Source: AGHT+IGBdkcRrvknuZD4d194L2ZCqUJBec7xmOjhz7SNrqyOHnIwOet6vWxOy+DCm82lEiZ0jer+KA==
X-Received: by 2002:a05:6512:617:b0:503:19d9:4b6f with SMTP id
 b23-20020a056512061700b0050319d94b6fmr859945lfe.0.1695900940716; 
 Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/6] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date: Thu, 28 Sep 2023 14:35:34 +0300
Message-Id: <20230928113535.1217613-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
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

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ec8608e22b24..1a921e9107b1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -66,14 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -227,14 +219,15 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -286,8 +279,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.39.2

