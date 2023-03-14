Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01B6B992B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C1910E84B;
	Tue, 14 Mar 2023 15:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11410E842
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:55 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y14so16420404ljq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bWjB1jo2oF2xwJJ102jTozy9p5TkFnrvHvYrl8qyrB0=;
 b=U0ylajaB+0wEsxIxOVeE8bp50nV7CxYFnDZwn01TsEpGvlJ41XzLpFge1lExLCKA9M
 dbXm6jRnmJIUBJdfmw5M3RlaseAPDoqOaqEgPaUpipy9RJ/OHPmMMykVp4TRuJTtj2y+
 XoSiXksOSBu0WS26LywUay2yycutMKGIa9/leF/5wCs0gatjRzQXcrWCvzemR8aQZGAy
 1ME3wTX9eyLGePVQjhw0HTSlJmj9LDlRGUgTZRdY0CEVPTAAs3l3q2be0W12kJtJiL1U
 gYqn1DQqY1NKeN8ckLrmIDlQiK2LD3BlINgPocgW6JEVbg8VNMpVgnIMyAHfN1PycoQk
 wqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807734;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWjB1jo2oF2xwJJ102jTozy9p5TkFnrvHvYrl8qyrB0=;
 b=Be3eL1lcMoXkwoKlRZaS2WC6YoRmmds6q6rYmho/hpAj0rAvfExPx17eB+eTkntc+f
 v0G/Qq2lDtozK4i6n9CU1sWcBWlMLJoCxrBda+qhHQpUbK8xX+VZ9A+mmIMXoxmyvndY
 8FGaggZ+d7A8CxWh45YLZQCMMqFmc+E4fgrkG+hTt0J+uzHpCgW1aSTk6JSoV1D/7eUM
 pgNVfx64VUG7oyAOTbesj10pdZxrzYV/51x+8soHZdGFWHH3XGW6FaTegeysSPynBEf/
 IW4I6InZi7Q83upzlx44p0T4TuHmjjjE7wtVa/KtZMmrG+Vrp6K3PmFXdzS+mrP3LyYe
 F17w==
X-Gm-Message-State: AO0yUKUbFxLWOkzJV+EYnMiNvSpIjUdGw8uqDOt5BoCMAnbRkz3A652k
 6KT0rLJ5Zttc028b9erAm7Ymag==
X-Google-Smtp-Source: AK7set+Nng4rruM4NdjkSTdSWZNX7B/VXQi/2NhJ2V+ZnImu5cY1DbFbss0aIC9ZifEGETiVccp5sw==
X-Received: by 2002:a2e:97d1:0:b0:298:9fbf:61dd with SMTP id
 m17-20020a2e97d1000000b002989fbf61ddmr875311ljj.16.1678807734836; 
 Tue, 14 Mar 2023 08:28:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:41 +0100
Subject: [PATCH v4 10/14] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-10-e987eb79d03f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WDcj/M9aJ/8+tdxnVyFZAeDamawmN6hQgw+VzGKE91s=;
 b=T/5InnJU8B58RuzS79qY+AAoksalL8zOQ+JCAG2th1CRtFEh87n1KTepybkSWQo5GP+tt8vPUvkn
 2Rj3TBOJD5wBtfFVeCWxK/FzGecgL0PHuYjTC/Z1POdGewZZIxo7
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 776db13e2a26..f699f326021f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1189,6 +1189,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1206,7 +1208,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.39.2

