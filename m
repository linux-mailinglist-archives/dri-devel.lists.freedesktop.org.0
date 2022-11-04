Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6686B6196ED
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F360F10E75E;
	Fri,  4 Nov 2022 13:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BEC10E758
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:37 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id s24so6220569ljs.11
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=mexuyZaPbFBmNt59b8SQeKFWTow2tLhGA3zvXYpvIdFYqy6t7LAOTZBcDIhLv1Zzjk
 2paqotL5BZUL/bs39pcjkBbFgltoHpfig5rhi9SsuPc8KRSPPTNBGu44CpeaOoS84iGr
 hVOmyiI6L8bmMkCcvjEMALPbikYSSENUQrpoTcFefJMyqr7BBHrSbbsAIi1nNO85h8rO
 vr3pxgs4PaTdRSCBDglO3qlUDlC87ayYEXo54UhfouYI/fuSI5PmMiDb81M/VJMHfRed
 B9gvkMW4NDx8cFclVlwoZVglh0P1CcAogocB9537wW5VgFd98cQvRt1RhwZblgfyhgMk
 GRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=rFe/PQbaCe3qzrk3u1GVQzjtD+vju9gmUaz9JF7zGfSyDctcfoBCA6XF7RO6bycOKs
 5cX0bzOW5sbt5Ei/JD3nWPEMnn27kTISejG8WuGXfa8Wz3s0jH30rTxzrbgcEqM/9KY6
 vnZoPq5j2Yg3UvE5hiQWkAAA8eHIUpeJY32mjJhxflwKwGI5iJW3U2oA1PvKsB0F0zii
 USUtyOgGhcdFN4vroN+x+Qvf9enCFqEZfoXIKX5awkfkFms2j3DQxob2rUk0NIvIMgC3
 Hyv7YsVECpXqseXGc+eI8LR5SuWKIV9QEGouhSr8mUnoWyYk1XDzQCQwo1SI+AYCSDto
 eSug==
X-Gm-Message-State: ACrzQf1GvFz80ghsk0eH5vJsKezmjshwqVKEAEHaLapD/TVm+AvnIy6R
 rWAsArwk0HATuz7d0VBkrz4vgw==
X-Google-Smtp-Source: AMsMyM5ylwYxkE1TNWolGu+SI9wuT53gGEYitbyTRUL0gy0Uq5fT84X8WU4Jieq69fj7/yK3c9+gjQ==
X-Received: by 2002:a2e:8811:0:b0:26d:fd3f:c5c3 with SMTP id
 x17-20020a2e8811000000b0026dfd3fc5c3mr1990867ljh.494.1667567016917; 
 Fri, 04 Nov 2022 06:03:36 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 8/8] drm/msm: mdss: add support for SM8450
Date: Fri,  4 Nov 2022 16:03:24 +0300
Message-Id: <20221104130324.1024242-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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

