Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C2E732356
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4110E570;
	Thu, 15 Jun 2023 23:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FED10E576
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:33 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f769c37d26so3435998e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871292; x=1689463292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3aBLLbacTh+Ex0pHk2CQnOlcKWWCMhpUkJM7hf2NJ5E=;
 b=pQO28YupZ9aQNmPH57PCXKbJ7ClPx9R1cSV4mAVW+5eLTWiXUmsNKoirLZy4DR7DgN
 IQRYHL8ZMpnexAqMsly1t4iumFD081Iw6mrv313VThuAodq5nIQ+cr2JszLerO9N5fUf
 XioSLLQc42j1rZd4rz6+U3sudyX9DlwA3KwIvrTCfEfdlLMaJautR4UuunWxnWdQG1R0
 Sdp2z7V9kYwDfXKkUELtOYAu++LQ103aGLurNt+y91vWJd4BhsLMD6lkASUmVXpCQp0x
 Cxe48vDsVBteyrJ2Uz7ns+8sdlnjmPMdX1kT9JA1e3gW5Pkpux+jYkIXo/Wu14aE1bV/
 Dorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871292; x=1689463292;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aBLLbacTh+Ex0pHk2CQnOlcKWWCMhpUkJM7hf2NJ5E=;
 b=agAmyGvgcx9M14op4kueHRMzgw6vq5ajoWcH+4qqPnDj10fTcVcmPMf6T3yKPx3ivl
 CwwEyFHYYI6Xoyz0b27gCPjoKr80rt9768LenxCFRm9kCTAxGegxt9v7ozSpdlgLtvNn
 7Mc5sI4CoDb5O0XSY3BApz/lz+JJSVzuFMXNXpIHFECH+ZwecbfqzQzELm4gMmYNJyEM
 fDB0ZtXafUvki5Qm9wat018Ma5kiU3TjLqTKHgPu2A253dNf+efPESUaPPq+MDsRZ9pY
 8zvrS4wFIPjShx/wkw5NKu21AVtGfARnDNWvJw6DT9lUoTKO1UlZ7pA0qjYSyx3tf/v2
 cbyw==
X-Gm-Message-State: AC+VfDx14nwy/F6yKMSQqsiv3/lUvs8FFRkQAeiccUd9au/UnarlAWP2
 vLY6PKirxDk7YF3hdN92/3BG2w==
X-Google-Smtp-Source: ACHHUZ6uSakf1tY4JEIXkQ0gM3/D3sQL606O7CbVblONG2RLtbxQfY630L3KUjtWs8Od6iZ8M4iS8Q==
X-Received: by 2002:a19:4f56:0:b0:4f7:6a7e:f079 with SMTP id
 a22-20020a194f56000000b004f76a7ef079mr93019lfk.31.1686871292167; 
 Thu, 15 Jun 2023 16:21:32 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:31 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:50 +0200
Subject: [PATCH v9 09/20] drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt
 on hw init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-9-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1283;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mn897aEmmor9k1FnbUx226+ojITBGwyH7cFTcD9yASI=;
 b=gtQN0aOUrpE5N6ygJFNwpAMGUaAS5m1yMnYkP9WZlpYHW2rsdM5BsDSIgdCIKhJ0JgiI3IihR
 ow8xjMnR/wYDUV6MSxRwx9w2Cdu1vFlojj4aomXy5dlDrNtxUka8bXX
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

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0.

This is typically done automatically on successful GX collapse, but in
case that fails, we should take care of it.

Also, add a memory barrier to ensure it's gone through before jumping
to further initialization.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b627be3f6360..7e0d1dfcd993 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1111,8 +1111,12 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 

-- 
2.41.0

