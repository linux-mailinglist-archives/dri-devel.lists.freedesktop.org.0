Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9076D789032
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 23:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B210E163;
	Fri, 25 Aug 2023 21:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72510E163
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 21:11:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ff9abf18f9so2089411e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692997881; x=1693602681;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kya4VCOyGVlh2JiHxWE9QAp8dwJuU5ZWnBug4TSNcmc=;
 b=rUshhZIsDiBo7WCfwqNHWQsr1qW1f+nm7pBGYXNACMHqnRCANX6kz9d/0PDcrGwBBh
 HaTa+xgMW0xEMMcNCcly+PlLMX/GUkfDn+dQ4+NIclI765ieTygGxQDoN9vwNeaay8sT
 g8ZC5Dh4C7YHMv8AwjM31Viq4x0dnu2ICZkvvIljkteBcJwlHGdrNW31R7vC9dLVEeW5
 2EMxPASS96KLCda+WjGTkSIxaGR1RjjMG4XpL0g6ZG0qObCKr7vfJRH5ON+zPSOQBNoC
 4vVWcpWflHap26Nw8FIR5FOzfYLHdA7Bru+HpZINh4xTPWKuwadBZPhgJpZtIfz1P4e+
 M2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692997881; x=1693602681;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kya4VCOyGVlh2JiHxWE9QAp8dwJuU5ZWnBug4TSNcmc=;
 b=jYdsVjeY9modx6QqM8MkSxBqaoHDhAN0AMCXwSe7FPVCjg1dOIPOULwY4JnLwy+Xvx
 ttnScMAgVQ/tvu5UVl2XAGkXMCauBOlqTmp/mIWATcHthOF40IeC/Dyxbyjt+RFpHOFk
 OyDDfsJaOD5RmeMdvQFLM5kgD4jdBZpmGp2tp7Es1wdBJLyCVpfv4d1JttdbjkMAfHrI
 TxGoPoAhR2p7zK8n5VPkrZ0hINEcwVJbBfRoxK0AAthTJQYmDtcxxPXOWv29u72773QW
 V5hmWZUHB6BybKnJLM5KPnetVyw5zXJBZejsUXCK94bVR1ZXsU2PO/2dcmo1d4cUeiku
 qKcg==
X-Gm-Message-State: AOJu0YxRCR+DOwZU2IumStiicRyAf5sJr7/bmpgCKT5fBSAxk6ywEfiC
 4qHH16KWb/dfEjhydBM4a6JD5Q==
X-Google-Smtp-Source: AGHT+IFCHIc2JcxoyfDle7JrH6QpkCqTl6D+tQn/CBxZH9wBJ8SwrNvY6pRv0pSZWS3KOnX9Yjq7lg==
X-Received: by 2002:a05:6512:2395:b0:4fb:73ce:8e7d with SMTP id
 c21-20020a056512239500b004fb73ce8e7dmr18072250lfv.15.1692997881664; 
 Fri, 25 Aug 2023 14:11:21 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac25209000000b004fba077e654sm419947lfl.194.2023.08.25.14.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:11:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 25 Aug 2023 23:11:19 +0200
Subject: [PATCH] drm/msm/adreno: Fix SM6375 GPU ID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6375_gpu_id-v1-1-e24f46d7f139@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPYY6WQC/x2NQQqDMBAAvyJ7dsFEo61fKUWSuOqCxJDUIoh/d
 /E4A8OckCkxZeiLExL9OfMWBFRZgF9smAl5FAZd6bp6aYO/LbLHtu7MMMd94BH9pMy7Je1U04F
 0zmZCl2zwi5RhX1eRMdHExzP6fK/rBtiaTD54AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692997880; l=998;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=a6ePufxP5h1WTj5TbQcKiSyADMI68Z8zNnOB43e2WE0=;
 b=dwUoiS3miQJ8RFJu8BQ2LZjqZuPBTyXEv3x93TNYv38hpwzXFKGCWybgzrkRoG11fbheSogbw
 c23YzyPOeqsBUEECLSnh3lRscEBvWd0Yhh9fjcapUO0IcoJNkEaIQuO
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SM6375 comes with a patchlevel=1. Fix the chipid up to reflect that.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 575e7c56219f..f2d9d34ed50f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -331,7 +331,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.machine = "qcom,sm6375",
-		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010901),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {

---
base-commit: 6269320850097903b30be8f07a5c61d9f7592393
change-id: 20230825-topic-6375_gpu_id-cf1596e2b147

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

