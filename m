Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6567CFC9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233810E937;
	Thu, 26 Jan 2023 15:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62710E294
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:34 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x10so2131096edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBljgGteQAY47rX7zWj3dPQzLacj5RUR5JpIAimyYnM=;
 b=SbrDbQSVGa/pHzpDolRvqqoipOFVH13a6CeMoNa/pHMYxXvbOgOUH4su+pM6Kt+RbP
 Bo5dfMGQKXsKbZvF2sG/tiDu7U40GsMQETx4agRp/7djuufEwlrMvDy8r2e4/S0FUjwa
 hbjLiz3blf6NMyvhWJP0UvBJ+tv3Vq5faJ2XYTa4sTivzh1v2WMrG5MqPPYYnEhHJK5f
 ZwJqmlUBjLqf7NtocSYrfTXayoxb0HedNRM1fr3VjFIQGMRkfqJ4Lo6RDpf89O7Pu8p3
 F73a7ycSleBr15Kv5iGa9kYVyfTESeyqKD7lrpn0F6M87XhlK8v3/W2ISc/SfYBPDolG
 fmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBljgGteQAY47rX7zWj3dPQzLacj5RUR5JpIAimyYnM=;
 b=1mJm+EW3HNXLUN8HRcf27pQ6q0UJpCXhbGe3PVEbz6R603N6+g0hj4CmRj9JrQT6zf
 tR4kYxpeQd60TfTQsIrRjZjw7Dij0huFrVwQ+ufnRjlktCRJV2PEEY5lCHdIzXslI92B
 ZYIg5aK6RedhqEz+qJYgADAeIlI1ZfEpPty59+JAfSJeCmAq5g9x1jjySWEYzDEMqZ7J
 vC5EO+Ov1eomgNssYoiJXVTFr988AgXm4TwKE0rc+diIV4sF6inUUojEr1hMfiQQXXz/
 zfV6lRTEI/ebWrF4twB1SHwQKUIiriJxycT7mmgY12T3iu6Rd2x1rPrCBp7SbvUfuc4/
 W0lw==
X-Gm-Message-State: AFqh2kqciy9sU3za8SN+CGrgx9SozzJvdw9CSUJWiEuB9b1sqlRuX9+Z
 uFrfbnzd0DhEbDNR63pfU0N9Zw==
X-Google-Smtp-Source: AMrXdXublsYoSfnqbgR5kg8baz2VjlQvEHCNy1LPZOA9GvVA5G5tqBrXObNDl315s1WMoBg2tndWzg==
X-Received: by 2002:a05:6402:f20:b0:468:58d4:a0f2 with SMTP id
 i32-20020a0564020f2000b0046858d4a0f2mr45314500eda.23.1674746252805; 
 Thu, 26 Jan 2023 07:17:32 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:32 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
Date: Thu, 26 Jan 2023 16:16:10 +0100
Message-Id: <20230126151618.225127-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we only utilize the OPP table connected to the GPU for
getting (available) frequencies. We do however need to scale the
voltage rail(s) accordingly to ensure that we aren't trying to
run the GPU at 1GHz with a VDD_LOW vote, as that would result in
an otherwise inexplainable hang.

Tell the OPP framework that we want to scale the "core" clock
and swap out the clk_set_rate to a dev_pm_opp_set_rate in
msm_devfreq_target() to enable usage of required-opps and by
extension proper voltage level/corner scaling.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 817599766329..c85ae3845a4e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1047,6 +1047,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	const char *gpu_name;
 	u32 speedbin;
 
+	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
+	devm_pm_opp_set_clkname(dev, "core");
+
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
 	adreno_gpu->gmem = adreno_gpu->info->gmem;
diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index e27dbf12b5e8..ea70c1c32d94 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -48,7 +48,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		gpu->funcs->gpu_set_freq(gpu, opp, df->suspended);
 		mutex_unlock(&df->lock);
 	} else {
-		clk_set_rate(gpu->core_clk, *freq);
+		dev_pm_opp_set_rate(dev, *freq);
 	}
 
 	dev_pm_opp_put(opp);
-- 
2.39.1

