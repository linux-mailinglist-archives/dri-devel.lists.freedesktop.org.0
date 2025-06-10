Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1BAD3A6C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24A110E58A;
	Tue, 10 Jun 2025 14:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fdr2Ew08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316F010E591
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:47 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a4ebbfb18fso482504f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564406; x=1750169206; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
 b=fdr2Ew08QYsp1TdN6WjiFcyNqmd5lA18d/18BUhOUTtD6P0FkPu9GatSOp/Mx9XR9M
 bRtWRQDsx5YF8utAqBduYcDogZBV3UZAY+W69QSgbyD4oR742EWJ5PIf+/FYluy0LsFi
 5GtOBMRjkbjAkAJjtqXO5ndPf6Px3CfjMkDkJx8MvvUJ98eNhQ4JhQM4nV3xV+ChCfTd
 qjqjyAMH5zUKn6wkb7OTlXVEsoRmwcQkEBWQG1RrxXcckhxwp2SrCfXJrApd1d9/XknJ
 KClihp5atUM3C8xEYTr04KXPLx4HHmE2y3GXyWpaYcEMQ3ZWlYafWSwjU+KCVxBJAPIA
 inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564406; x=1750169206;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
 b=SGTrwjimIBi0xp7Mhoxu3KAbAIv6vrgxBse8tYkE06a4+Le41UqelXksapeXDox5iN
 dAIi6j+6N2PEh7UvCdFzly29wXJwUN/Q6NsjC/VEjBoYF+bZho75XYRJ1w/I8gVcQBd9
 YEze3632zFvtP7srxT3JveWED3ezWBcjFyLxCgRxCqcpxAg25GeUKKquVa0AswGycMLA
 YxFyGjMdG97kepLOPeR2LiNWolHtPqBOji2WoBfX9JE6QN03T47wWm2Ld3dNNy8/KemJ
 k5UUQ2a8WoRtigW2eaSpehSWHpCy8L67nGD9xX8TDyHd8xgD5OFLQVyuxNfUJrE9ghDL
 g27w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXODMt/KGeM9b0GUVm0CKNkK5qZC/MMRyb/NfPLqvIdEwxfSGZylOEaO2oQOS4FYgSaPXNAU99HrrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyglX2Ct2B3RVdF6IdjK0TZRCfEl9TVgpu4mjrNCLEVmOufqcm
 utMjPVPPKBoPY4VQqfVs1S7QsvYJjhugImk21tyv3FctJgu47LyRQLcd8oSbMeJ4mCU=
X-Gm-Gg: ASbGncsJRXXcaa0DKBt9bhFRbFMB83C8AOQFeBJo90bYBjv2gg9jI04/iT85sYobDJI
 m0VQr+621CjGUHiwlLV/4/bHYVmLdYgNuBUi5GWTIWHjuqHHN62PDwOg3KUzURBlARmaaaL96Mx
 e8CnRplyRdi4yO8BuzSKTg0FHy98y4QQxGDaT0iYEawdHPBtrF+6bbU10WmmJNvu2GP1hwG2uMY
 uT7oVMvC+Wx9sj2OQ2VqnDyESVhC0NUMLED6Chhqsmx8If1ghxrJIq3Spghj/vEtiKUsN+GjVCw
 bYYR6fZC5vp01pEP8ZKm7PdLNM5NlWFwsITvlZGMYWkMdByW6Gjx0vUEqOpakvjeLHgXMyIi221
 jgAS3QA==
X-Google-Smtp-Source: AGHT+IGZufr1wfq+dLRw6f57n5SqOmq2e/nG1YhjXmidlB/YolNYy0WUiexT/5w6foFwU+TjOpZmVg==
X-Received: by 2002:a05:6000:4025:b0:3a4:eed9:755b with SMTP id
 ffacd0b85a97d-3a53315704amr4817877f8f.4.1749564405478; 
 Tue, 10 Jun 2025 07:06:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:55 +0200
Subject: [PATCH v6 17/17] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-17-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nJt4ADbxIA14pqN4XsVTOJSsLTO3c7LveRnmHeFCRAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvOS1VuxS+qjJR9cY8w+d68w2FoCLMiuaNbl
 Acm4SL6luOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7zgAKCRDBN2bmhouD
 12VFD/9b4y4SPbBdpJWKma1Ib+xxUjq/d53O3/XX7Zg9z9Q9ZASk2PUqdH4+xyEVg2VvgoI/+kQ
 OGsv/K6u2k0Gs3Ds+3wY3cLt4H9UMtg1w7YXwmrAHQ1OPcV26IVI4ElYdQ4ndTE+L/orPArl6tf
 u9KG9SYyFymRkL56lkp5xCcEAyXW8UMqukmErlYoQmYZTuB0d1iEr9flR3cEajYx7Lq44vHlpy8
 NdRNpMp9Woo6YbVM1/6nUybbGg9+xJHj397RbhyiSBHQwEHEr0Z0MNZisHK1keT0y5vSFRq6G4W
 Qv95WQYzV9GPA6SDPI3ZejcDEEeNiKfD1uCsJ8NghZX1Yg0L4BBkps0pCH/sNMLawYL1c6ocfMN
 xSMsySC3UtQCNUVrjtWaFTJ9ITDsO9QjLtW5dS13faVv0FpLmNAj8jlRkTRaWGhCNNGAXywVMnc
 thjOIpRnaZ9u04+LP+XQoDDtyo1AN8gJC8uDDuGGTbgmSJBDQKkOmQiik2n8esKuLUv4zPQmbRp
 o4mCDNGOOjR7QPO1ZDv6QEzPvOLSJrH9IMnsnypxcwuPk1sLp7iAqvNHehlW/y19sAeHyCGpJGA
 ULlLUL2LR/tOc3jUBQ84mxTYbBWJA8YqYoZO0juqHwhLzpDORNrz99V4RHwSrDkVE91vQ3hj5Ej
 uifo1hwE+1rhi+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 709979fcfab6062c0f316f7655823e888638bfea..422da5ebf802676afbfc5f242a5a84e6d488dda1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -732,6 +753,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -767,6 +799,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.45.2

