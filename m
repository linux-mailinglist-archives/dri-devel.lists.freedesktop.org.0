Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE672636BF9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 22:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2668210E623;
	Wed, 23 Nov 2022 21:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F1B10E62A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 21:04:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b3so29935074lfv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
 b=hOR9T2WBUBzeoJhxrzfXIAfWT/wWhnip7qpYY6KkgDy9e5kXVpfLk5u0s7OJOGJFQw
 4H5Zlgc+S/7HWQXfqd28doH6Ln40unyRjyak5xH6gdhnzXcedv9HuC9/M8zdd4iAm/so
 vWSNfSP+s7iOOyztcJDLFUkJaoDCDixLLf0yhA1W5oL1Cf2OYfbQcgdceZLr4RKgJ2yI
 Z80qRBVB9hWzVrQgQYyyinlAqWE7bQJR0wH4mOPSw2xJVvz/pIybaMCO+1rTj2u0zri/
 vo6AJFCbyZIgkQv6SAGcA5W1AjIin2DkZZbqBnEWyHt9Vdok0gE91M7vDZY1vu+CRKGi
 mqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
 b=gYjOIMoByZkKOdGMXiSd3ZoMCre64Dp3lLJU1Cd0DeoKAS6+AphL77z553VY7vWMTY
 8LbQese1AIlk4Yoy/QOAoJfdlWnbxWJWwaOwhI6JdFtLIZaO/dUWLFeG+uoY/Ghq6hh3
 7jJwRWKhdDJOjDb0uVztXFZuZjCTLyAW09sbisn2UgDlsDf5GwADGv2Fm+zv1JQCVPUo
 8S8LXj+4/vcLneOI7vwFbMS+vNXbPWsE2ZEBhjYS5ikw5KASRgj7GM5BMrEyPN9xCS0z
 fzC3wWZfX8tUc+3wB65d0EX3XIzyA+fJr4d/mDDdvQHgaFMbv6FF/3Y9DXK3QaoWGABv
 NXJg==
X-Gm-Message-State: ANoB5pmGWgPgkvV3Sb/zUhbzdeZXFqbRsrSt32p9Vqeup4PXZBdEX+9O
 83oDix19ALGf7KjEjTdg7hqJiQ==
X-Google-Smtp-Source: AA0mqf7K9huOyhYq/RY7ogvrk54iEVQ7THwYon0Ka4gxzk3/alQSkTDqB9xJcJrFTNaeDNcC4eRvoA==
X-Received: by 2002:a05:6512:786:b0:4a2:44c7:ee58 with SMTP id
 x6-20020a056512078600b004a244c7ee58mr9718519lfr.127.1669237452870; 
 Wed, 23 Nov 2022 13:04:12 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 13:04:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 10/10] drm/msm: mdss add support for SM8450
Date: Wed, 23 Nov 2022 23:04:03 +0200
Message-Id: <20221123210403.3593366-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

