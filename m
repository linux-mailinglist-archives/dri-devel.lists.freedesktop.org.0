Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E696B9925
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518D710E842;
	Tue, 14 Mar 2023 15:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EFF10E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:49 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id f16so16402150ljq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=159lZK1VC8AnArbTbfywvfz47MuAlqr+e0q9A9rUbAY=;
 b=ybkS1ks85NwBg0oo4KVc4YOEPbJDHyxaTPYyY5Ix/0wWYBycqMFQxYFzrOVQ6wjypO
 fQmQycMbmWZvRFv7EduPzK10eesNeyMeiZJvpoHNqbbImGbWHlCu0F/fNvwSaVttOIlN
 JSbW0fOGV5ZttCFGvf6VYxPo8gUKcGGVxpMglgQDoUl30mV6R4KoNhgzpaQ2j9Glukbz
 RMENp5oNU5cfRTprvVqD6orxx+uicybh/W3zYauQtLBj6JZRMKQ45UVZCOvhq+SHvDd6
 lJWX0KvsUlPjFe6eyjd21Ka+W3Hcqs8eiTJMKR6z32H0p0/HpJqW2tyDrqH1IaokaCXz
 +56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=159lZK1VC8AnArbTbfywvfz47MuAlqr+e0q9A9rUbAY=;
 b=sKMi+6KZu8zdqA8bhZE4Q+CH3vVAV/52XABqMK6CyTSv9hKWccmNCusA5NjQmxOcvx
 qdO5Y7Q6uus+JFX9NAscmVQDMQ8rAoVAv/TCwkf9xlhs+FHoSLvdTwGIrCApy/pXIryB
 qgYSs6tMpVo4yEhRfAqkEsNwQmP3GO3u0HoGxDy/UNN3kQgA8TXLQbKYQ7x3pL5traXR
 jUS0RmcwYcCvUkDUttfBtTtfSrPJ6v7VAfwnGlxcVS5IJJBkSe16dR1EoMOWcSPA+UQe
 NLySV21CA34x0CkVeDHblho6lFgzmPzy0KYtfBxT5qi8zwBwkLlALOE0hsUbD42PKHWl
 Vqzg==
X-Gm-Message-State: AO0yUKVY1nTd8jaipWU6ptvbxsHwQFbPDj+uJKV9JhzMiv8lUPC5xqxW
 N3pudz+ndt+ZQeH99hVP/OaU+Q==
X-Google-Smtp-Source: AK7set95lDIxfeW2sbimzmWl+O6poG1xg+59izmaVd4VGvYk/eNDDUxvFvJ4rN1VRn8SyfcPqBex6Q==
X-Received: by 2002:a05:651c:1059:b0:295:b96e:ca99 with SMTP id
 x25-20020a05651c105900b00295b96eca99mr14017598ljm.50.1678807728292; 
 Tue, 14 Mar 2023 08:28:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:37 +0100
Subject: [PATCH v4 06/14] drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt
 on hw init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-6-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1251;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SQf5xqv6dgkFv8lqaRaSsqR3oatLGI4JEKv+JlvqW4k=;
 b=j0wqavMQyp9JVzEUb+dyZ3aehx3l+F1HEWpU/j8PV1u7+qyWbwNnPl8Ix1vohsIlZY8QP7XOf0G8
 gFxAnV4NCSDkUzx+xsz2mPlEqsuMhpdcxfpQLRfk7YgDSyVTBnNy
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
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a90847a3379a..70e9bd21ba3b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1015,8 +1015,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
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
2.39.2

