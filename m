Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34270696B9C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1021010E93C;
	Tue, 14 Feb 2023 17:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC5C10E93C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id fj20so18516322edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCCbSlMjNx5L3JbI+yxmCqJTM703drqGHbbH/KoYNcE=;
 b=UB/rfIQ8kQgMmMUAWxOZPzuSgFHFDqpMLIMDpHWl7HIegwaxvdZaqGa30kHwfTbeQp
 7ZsMd8W+dKrdk+I9p10m1aTphQTC3KM2K7Qavphr4HBOUAusWmL4W3h+HluIsFtPNWeZ
 Ul6OWFxJxszjGTuWkyjNFyUMuWvFvt8BZx1e8WneRxUXp8XzxW8ynqh7fkiM0H8EulSZ
 dPS0fxPF4towZpOtmdyNIUFwirKsNqNkiiaJSwj4Gi9BCCPoOnAv14K04jpy3jGav+pK
 jwbn6j/p095LA+2apeELdP6lbcXngMgtm0gNyHDEILSEQxHBNegYylL2cwYbB6bCSpVl
 rLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aCCbSlMjNx5L3JbI+yxmCqJTM703drqGHbbH/KoYNcE=;
 b=6o16bnSPM/ePn1EBBU5qVOrS5P790bRwX2/6OlPxR523j/mLNsesqYQknN9eng+zhi
 Q/lmbH9Jz8Mj1w9Hyuad4WkUHZV5RPSBNrSJbmpO9n9cXpGv00+OeSBe/In+Q5B0Wvxx
 km441dpigTFfl1h2m+UM7+YSNQ0kIHK3Z0N7Op9309eKLqmOh0gK533h4GjJPHf9Ud0M
 UHRvTZN/1eytJOmXiOEXOjXt90qII2gv5uqezDkRAQhwVhPcvsZH5GWE4N4J2YGUdNaN
 +bJWvMCknQUegyc9gOv2ZPLAvNQQhaQwCJ2zYQspTxeHkSM+GfN7HAuHvXnCg6P9GYTf
 fi+g==
X-Gm-Message-State: AO0yUKWpxiuwo5TkqvoeibOx2YmInyhot4VMA7sNOlr4JBN0evMuD3NR
 34q7tJqrXGKLs4+a9yOIioTb8Q==
X-Google-Smtp-Source: AK7set8Qu1sZENJSKRws0s9U+f/9W6outwfMSSC/5d4Kj6gfPjPKyISNG9v6fJ8GsR8Y4KxoC+/koQ==
X-Received: by 2002:a50:d5de:0:b0:4aa:aaf6:e6be with SMTP id
 g30-20020a50d5de000000b004aaaaf6e6bemr3648055edj.7.1676395931356; 
 Tue, 14 Feb 2023 09:32:11 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:10 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 06/14] drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
Date: Tue, 14 Feb 2023 18:31:37 +0100
Message-Id: <20230214173145.2482651-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ce6b76c45b6f..15e405e4f977 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1047,6 +1047,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	const char *gpu_name;
 	u32 speedbin;
 
+	/* This can only be done here, or devm_pm_opp_set_supported_hw will WARN_ON() */
+	if (!IS_ERR(devm_clk_get(dev, "core")))
+		devm_pm_opp_set_clkname(dev, "core");
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

