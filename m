Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22077507C9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5336D10E516;
	Wed, 12 Jul 2023 12:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B6710E50B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:53 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso106605781fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163911; x=1691755911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNZFmX7gcXRBmp8B+5W4dnLTGHdcrGFIl5CEA8Bzego=;
 b=iCePqPPCMPLuUzlqxQ+lKSUAeSsYTM+SCHjJeNcu6bNOZ37iYIKoaNjUexmxSz3zOe
 SIZdRD9oOcrRDVmdXmdMw1imzGon/cy7x/Ty72lH6+MLI+QdEaqkWixbEgCsb05bIsRZ
 P7avd/cUPPxsQyBpKwcAwczf4guqnjmsXIwmoo/Vq2AK1Wx7SEKRCDSaZRW5pcLv+4ey
 QwqfFaBJUtZuqqWR1CdifoSMrojRyotiabzTGYKY38Nghe54+cWqzmCxYpEtZ0ay3ucx
 Trnmbtl/9+N8fyihdmn/L5aTvW/Wmq7/x8Xmt40ZfKqIvxavFlmzM6cKOPK4qrMUwsSo
 LlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163911; x=1691755911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNZFmX7gcXRBmp8B+5W4dnLTGHdcrGFIl5CEA8Bzego=;
 b=Kgm14RLrIJgfZ1RNDr43PrZqGU7ZgKySmZngr8ruq289aXxrPYTIJQnpiIGlaHSUDh
 pDBOOW+NDW74m+Si/hm8YcfQVpT2q4jsNYSH2K6R0r3706xpf8LOzwM4a4TUOn/8Jn6H
 AGXETIVfcKirDWUJ/T8Up8nxy8GdqjDN8cWzo1LL275/sMN1guL32HYzh6WZK7I1Dfk9
 7oaB5OAsIoGoO5BU2FBEtvOSQMy0lIOhHSNL2hduw9BvjQE7AR/046O+s0bTHAOrtwDq
 sjDzeCxX26qvkc3RxXvS9aSHI3EWi7qE2GaOpwnNctJevfsPwAlS2GtOLEreAnXjWbx1
 K68Q==
X-Gm-Message-State: ABy/qLYsP4tJ6phUBI+s/wGX26ODhxFTd5fkLRH4sAIRFtF7lW9g4+Po
 /sBhGetyXMNMVnOgaV5e7s7wiQ==
X-Google-Smtp-Source: APBJJlGTHLWHCt+uPNQGZcuNVTTt5bfMQ8LwlI5HzJnPrZf5Ef2Zp3hT55dvGsAQA6XF/k5rA9i6VQ==
X-Received: by 2002:a2e:91d7:0:b0:2b6:e0b8:946e with SMTP id
 u23-20020a2e91d7000000b002b6e0b8946emr16285134ljg.51.1689163911242; 
 Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 6/8] drm/msm/mdss: populate missing data
Date: Wed, 12 Jul 2023 15:11:43 +0300
Message-Id: <20230712121145.1994830-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index eed96976e260..b7765e63d549 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -252,6 +252,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -491,10 +495,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -547,6 +563,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -571,8 +588,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.40.1

