Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ABD6D3052
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030810E228;
	Sat,  1 Apr 2023 11:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6B10E1E6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:54:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g19so19113441lfr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ctHnqMHZO0pzp/yb6Z2dEorUTEc6FXrEYWhX8iD6OjI=;
 b=aVGHIcDwAhHEbX8rTDGY5Rb7qR+M8HNPK1MH/vfK/lO55HbWywTqJdioncURcXv74e
 uYUfZxuRkvuzEdG+Y8CDvm9LahtJQPUhWh5yf/HJm6EfXfTLdNdesGBE5Or4MSIVY+xE
 orjq0j64cZMqQrb0MWijoKzQ+mVpMQ4EDd1EL0NcOEm6OgjcOsBEuBe5a3+A8XaXz7Zh
 q7V2dWHDmHmbL29R0wg+Ti3q6nM7B4pV6Z5BYUz0MbC+L8Rp79e7uV7bangEAU3uTgVf
 Qhz0JiukPVUgwnO6F2/EQv5JbXJNJh2pcpZyuERJB7pJNJILCGqm5SyDjg6nJ1JQS18d
 2heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ctHnqMHZO0pzp/yb6Z2dEorUTEc6FXrEYWhX8iD6OjI=;
 b=EkSvJPpJCSa9utye7bUHUydouZoRRt7eAtaQrzEmExyRTR9tmrZU0IGDu3ape/3fLS
 BiBQ1Q7APFdp04LM5oMUW5w+7G/Ri8zCzEdsWYJgfCPRIHPeYbAJ9VsDuIb8DoExxWIv
 svBtJsRtAoIyrxNGZ1g8fL8ZrNBASml9dSjPuSEpMlGorQeq/si0fOzv+YaHnYv++U2M
 a7yfRzexDq0gS5cSCzOicFI5nRVBp1s+Q97Q/fLUrzcAtsw9jzWSUcEsSEt2GEpj1f6I
 bBhSgD7fHf4osezVWlLD4ToowwhbFv1FVnMSwD4gmOxIE6kF/TyB01iYfBcOgVTVru1V
 iZXQ==
X-Gm-Message-State: AAQBX9dWcRSb3cgoYsdNO+vuZvs3ALkCr/rcEpMCY73Yu90CV8gQ01Vv
 z4juo84AXgr+Byai0FpSWjCSEA==
X-Google-Smtp-Source: AKy350aIVzUYbMsf+4Ma49meqzWQW8ICcdLO0rTGM74lSEzeeotYTSpy/PnWE+VwXf87vD0pJkvzgA==
X-Received: by 2002:ac2:5972:0:b0:4db:3847:12f0 with SMTP id
 h18-20020ac25972000000b004db384712f0mr9567501lfp.50.1680350091424; 
 Sat, 01 Apr 2023 04:54:51 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:54:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:38 +0200
Subject: [PATCH v6 01/15] drm/msm/adreno: adreno_gpu: Don't set OPP scaling
 clock w/ GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=2082;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uLNnu/k+L1QbWFWkCWE2U/K/JWVJJaw9MSaaSbA5pkE=;
 b=c69tvTZp+eIVVV5kmR4XL9hM2jDTb2CKHbPZwbWjhYEMNXj783BF9pyz0eHWUGzzmv+6khEclsDI
 yYPF1Uk6C03PYld7+6ehn4/5kGtJCEAZhtxsV29rkQPqEQgn8BZv
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently I contributed the switch to OPP API for all Adreno generations.
I did however also skip over the fact that GPUs with a GMU don't specify
a core clock of any kind in the GPU node. While that didn't break
anything, it did introduce unwanted spam in the dmesg:

adreno 5000000.gpu: error -ENOENT: _opp_set_clknames: Couldn't find clock with name: core_clk

Guard the entire logic so that it's not used with GMU-equipped GPUs.

Fixes: 9f251f934012 ("drm/msm/adreno: Use OPP for every GPU generation")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bb38e728864d..6934cee07d42 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1074,18 +1074,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	u32 speedbin;
 	int ret;
 
-	/*
-	 * This can only be done before devm_pm_opp_of_add_table(), or
-	 * dev_pm_opp_set_config() will WARN_ON()
-	 */
-	if (IS_ERR(devm_clk_get(dev, "core"))) {
+	/* Only handle the core clock when GMU is not in use */
+	if (config->rev.core < 6) {
 		/*
-		 * If "core" is absent, go for the legacy clock name.
-		 * If we got this far in probing, it's a given one of them exists.
+		 * This can only be done before devm_pm_opp_of_add_table(), or
+		 * dev_pm_opp_set_config() will WARN_ON()
 		 */
-		devm_pm_opp_set_clkname(dev, "core_clk");
-	} else
-		devm_pm_opp_set_clkname(dev, "core");
+		if (IS_ERR(devm_clk_get(dev, "core"))) {
+			/*
+			 * If "core" is absent, go for the legacy clock name.
+			 * If we got this far in probing, it's a given one of
+			 * them exists.
+			 */
+			devm_pm_opp_set_clkname(dev, "core_clk");
+		} else
+			devm_pm_opp_set_clkname(dev, "core");
+	}
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);

-- 
2.40.0

