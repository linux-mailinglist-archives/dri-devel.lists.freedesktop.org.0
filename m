Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23EC66217F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B84D10E39A;
	Mon,  9 Jan 2023 09:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1943410E392
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:26:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bn26so7513565wrb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=WCSTQ9fE7LeKldP5+7GocbbKTVHoX/d8InfYfMZRlbNol+MYwWcaNiBXl7GbiuWwhR
 bzVndpVTf3vfMDa/M6/bkeZZLfBe2xzuShKVFxgcyeSty4aaKRsgw5oGBKLZMabeD3nh
 IPT72zACPbO46ASTp4zicPPmdiDx3bMs341v9C/S2XjufaOs8VGF47L6qEi0b3KqaHeE
 hsGWCZaDK8JtLW1/XLTC5JfPFlfjA3d+9MI3sQOGMAO6HXi6YKlRvcZGLUkbd9kRk4vl
 No7fFvcO7s+J+h74KM1a17bxGK8BiD5nOCiGhvPPZi0GmeGrf0+kFN2nSC0HHU6aXl04
 sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=kbbjvO3vh8pxMJLY7QN5FINF6t+mvszhkQG7CwPqrnOF8N/LD2tses+l4LIcnbHuxZ
 Om0wPw4/pCvYWnH7RYDG3vZTR9kTK/CL3XxHDxypgh/wmtTo+x1D3f90PagRG1+LMe+G
 05vP0ItTZi22fLjDfKaVSUxZZnDIHRAfFu7N1qS+nXbBS+/gk07p9ruvBVnzxg8GYG9z
 2JDUyccYpJz0qNRPi0wis2StTTIoChOlpQZBAO/gZDba4+uchNF4JsU3Ek2jQY9mgpdA
 64GV+kdhfANBEhQbmMuMJtmLcqKN6YDKDQjsZp/UYRxWKD5Adxe2jsNs0dOhQEjbj1Vo
 pXzQ==
X-Gm-Message-State: AFqh2krwv6lWohctjVW12e4WgfBb6ssenOZZOc9IF/l+EPv/usuv/JGf
 q+72N3L0t+K2wcYcZZGE1P1nVQ==
X-Google-Smtp-Source: AMrXdXu4ne+cM168gcr5bsxq+9YaFJqprFI6YALoEk7kMsZ6KWiYfgjoLAmIbIm8Z4otE/XGn09ObA==
X-Received: by 2002:adf:e8ca:0:b0:2ba:bd95:e3b1 with SMTP id
 k10-20020adfe8ca000000b002babd95e3b1mr9260409wrn.29.1673256405383; 
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm15195758wmc.2.2023.01.09.01.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 10:26:37 +0100
Subject: [PATCH v2 5/7] drm/msm: mdss: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v2-5-87f1c16d7635@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f9ef5085041d..02646e4bb4cd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -297,6 +297,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -532,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
