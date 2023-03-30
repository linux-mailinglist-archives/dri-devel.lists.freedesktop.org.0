Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B16D12FF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832C10F0A1;
	Thu, 30 Mar 2023 23:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192CE10E00E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:25 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id t14so21304519ljd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Nm/XTs8kUm7gm8q4P4cfKXmAlTclT7Zyu7DRpRk628Y=;
 b=BYtErKq2dxteRSgjjQL+mwZRyd9zpYOFbIkDF581CEse36BLDXFkH8njSk4IQuXWEl
 FiAzc9MEUl7bvHvZmnaEDyrZt1JDqnU3EMaeFm8qUnduETAyJbIAcixqy3df5pbsxgQu
 nslyToLngtR6nQnONdAPedi5+UWJgRNM7cRhMqFPZIqeeu5zMGa9KeH8aaLCBAqp6O7Q
 fczu6rgdZwaZ91EQFPyjbIV+OS8lQFWbR6Pm4qVJ/thRNQY1KqRzfkcPNzzsBK//aL7h
 oLNiyjA5grF+jUbmJmx2EgrWrIWs/uEfhy++vHFw8j1ZVaTbjJZPT2C7zVXHyf3BNoYB
 D6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nm/XTs8kUm7gm8q4P4cfKXmAlTclT7Zyu7DRpRk628Y=;
 b=ChsDHCvr0UQvn76ICj96HSdkfAeA+iFo5TznOvlzvRgNux0iqzMNs2aSVwnirTzSC4
 QdT9mBbYJzkDXc+nk5qO7hzS6D4XMf2vBVrNQGRQdZ09g3QxsVUlZIqXGjwsEEdUxKdE
 cOK0pZuTqN9jJ6Qc739s10Lrnb9UL3A5fSwdo04zwioRp0QADw/CNHpHXVbBHHnBK1DJ
 KulSVwrq17I8NGAJvxvguy5bR4qz2XXJmfpturgTTWVbMH+5DSffVK3Gp9uyQkD8pIVi
 zVFtwEfhrTzaxrSiEVZ3TRR/99KtKM5ywA8QE/YOIl8DBTzyBW7KeZIPBfJl3LKdpKqm
 XJFA==
X-Gm-Message-State: AAQBX9eCIKtfhr4MIMPSvHkM7sSEs7W5dM2Rj/qEChDIQp2gO7on4lfx
 YCuUXByuC+i7uIkfCBPccDQtbQ==
X-Google-Smtp-Source: AKy350ZLBWU7rjccfv3QlowitPG5Y1L7h3hSSdHiDykxNVTkNatVJLjZltMvqKbD2UA3ZgEb3/MOgQ==
X-Received: by 2002:a2e:240b:0:b0:293:2c65:20c8 with SMTP id
 k11-20020a2e240b000000b002932c6520c8mr6554156ljk.1.1680218723191; 
 Thu, 30 Mar 2023 16:25:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:15 +0200
Subject: [PATCH v5 01/15] drm/msm/adreno: adreno_gpu: Don't set OPP scaling
 clock w/ GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-1-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=2082;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=J+NC5YC/ebMbVp5SWCJ3W7rySZtZPgfNfKIxNjYvw8s=;
 b=nnT3Xo8An9NkjO3ejLZCh5888RRNMto9J5UyzdIwiIHICQUr3SIDVK8O3ukDZ7+cZtZU4IrWrsF0
 73sPX4KQBNED78yvgQLw9aOdxIvKNTl7MlvKQnrTqJz3HCX/fQBO
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
index d12f2f314022..84f25122afba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1021,18 +1021,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
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

