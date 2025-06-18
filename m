Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB5ADEF8C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDD310E8A7;
	Wed, 18 Jun 2025 14:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vEASV7RF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744D010E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:44 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ade2db1b78bso128848066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257223; x=1750862023; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
 b=vEASV7RFGFxNLCYdqhOvvGWQbzDKzETTRgvKrVF8rjqcTwJwtIGvfEVm9jZHFbL8dl
 lAhRRJa5znq+dmHANvjrZtjL29GuE5N2FzwsbJ5Zs4gU20nebvFqzOAbWUs46yHUi4u2
 8UYNsQ3zXXKifIpQ40PBSPSpzxiLeiu+Qlg8UJsVitPqTdbifx7Jm436WT9LasOnVSVH
 siPw2x1xjLdBcXtGouuGL6MmulD1t9Fc39vhEPY5SW1q/8TgbyH1KExRD9EyFjPn9600
 LRK0ANkAEiAAJfTxyUKApPGYGZTPTGGwWHFj/zq0JGngE2bkZW8oizlRzPHpZSy6Scpr
 Ps1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257223; x=1750862023;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qlA118QQRrQcU4/5ozkHrMeNhT8icrM9d6BUqE0LJLY=;
 b=BgJHhmFsw/eWdpzz0cOBUpbOm2GwfirOtDubRR6fnFxIdh5W9+0qmr8nmW+/CkVOH1
 Z4R76qkcpG3cN8yZpdeBBNEmlpUDbJHVlolgX58U9YCAHVfduzUpY8SUUPoCScBT3d26
 Xgy4AocDJcWAHocP/scKVTlwhhUCHJ7NbzVGZreQIKM23Jz3pZkgY/uuC5uemaN1Cqea
 j8nWILdJwIVde2ok0P7wAwK1Zct87JnSgQW4UdQyUkc8X5IDsRxUWXSyHjhPiuVwtkmU
 DB9AgEOIMrlG2ql/GDhi2CaetK54hOmGxCZ6NBzSNNldRKHOloNSJ6yAGnK2j+XXLgRy
 r7Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3RcNDYEE5LQDgUNvrqYA+Rl/S+K9GoApGEG6rUcmVj75eQGQc6CO9OiAQOKoPqnx4LIjniZIYU+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/E19MtmaqWFM/+2nZn8HeL0naZ3TdCMXWOToyOOOUNxtGQqIA
 RjUDSbVA5hO4CO0CIgA23n2l3WZrgvxxyAHWCysmkWuh6hPPrvG6F7Lg6XWcHyvVgew=
X-Gm-Gg: ASbGncsUTzu8LZfA3L7TfxvEH28aWZQG97/b0d4//EZzydjLUcQuMy90dyZTVzVVFgS
 1HMmY0pDF4Gafb17tBYy491iEX7oL7smGGsF6JZcQXxDuj7eYa7iutk85dALPloJhUYSPS7zLQS
 HHNoKEwoCLMYA6tJIXH1Vp9yAjlWio6tMWlk9tdv50l0CRpXou+izD7HbnOzYaTR6c+WvM+UnKj
 2Uh2OTeKv74lpXfhmGTMKRpiO0NQhZf9iITS6r5l2AXp1bQ5KgGfIx8w16tDx4fFJiz+xZ+mZuf
 g9NypBLer9DpdgIVaVo8Tq/5jtHKzLvbOTwVLQZapLbCYF+fUVs6+G/qsRNw4GZNz8asxKs8685
 SmLmxHCY=
X-Google-Smtp-Source: AGHT+IEqWhfZvPBu5eHGUGg8Iwx5XpXuwaeur8bLnZ0cMet2VQIyHL3CTFNYuJDKV/kCjrV7fPGopg==
X-Received: by 2002:a17:907:e2dc:b0:ae0:1fdf:ea43 with SMTP id
 a640c23a62f3a-ae01fdfeca3mr99043266b.2.1750257222936; 
 Wed, 18 Jun 2025 07:33:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:42 +0200
Subject: [PATCH v7 13/13] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-13-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4lO0igoNoiH6lYl9w0oC7YRM14FNNM6kLoi
 l6a8zSzTTSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOJQAKCRDBN2bmhouD
 14hcD/4qDWghYkiFT0CiyrIzz3YMUrhIppIA4jAgI4Rtzuks02Liq1Ri1cWOFhXvDzJyLNjK3K1
 3l89O7kPLQ0cn7X02DEWwWra6i2MTHy0qZjt7UCwRkU37jRNomF3xCbx6rkZTgUEXuvu+MumLNi
 32FRBCTSi35Q52GUqnsgfHZxnb8+7jtX04T5/HPOYZXw57GY0xJ31O0Yy/vlv17qkERjh67z5WC
 WXcrk/tV1kDx3tKAgpqNsO6L+MZcQg72bvi3lhBn/1kc15Aha5GjCEKUEVheu83M3wHkqHgoxBK
 LPudwd4yjqTqID0RenCdjBLJC/i52qaYvIVENqtMaby2dsDw2qPScEX0QE2ONetT2lVUIvVH0Zv
 12bKSbtW9Anvug7Va6+/+sI9Spl+rq1EA6ywxwXy7de96e8g8NHD3LkvEEeYKAdrCMJaxYXcddr
 16ClEV2Op04mCLo2WtmgrG045lTq5Tnp3yarphaN98+t1sGae7tkIX7pJxwIWYHjHC6C1KTYC0P
 Iuo6q7j4L1PHKVgUSstV9T3514uzJf37ejRpWcfg0f+c0UFOC9ZrmTDqS4Qaa9YT8GNsulHYcdq
 v7A01L78rBKRTD301acm2fVGyqAPlcSgnQqDsu83BpTKfjhaqybwLy8WZ7JeHmuk2YTKJtiXtln
 8UxcfxWh+DnTRTA==
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

