Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A37732361
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD98A10E582;
	Thu, 15 Jun 2023 23:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F4C10E570
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:44 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f6370ddd27so6090e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871303; x=1689463303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FfaunTIpb+/JoaE2P6J1QB9JUjqHG1mwiTPg5NcHdcQ=;
 b=w3Kx1SA00eZlb6JC0PPb54L1DnPi9w4zvnnhpAM4RsVgwcvM+cTuGhIDGFnVNcPFsX
 0bHAGRGFhrYQnk4ONN92/KJKJtCVvQSyj8ZGUxMEpmGO5B20ttqKKESQeRC5tENVpAg1
 Csp8gZ++1lD8BYEEGNCeG4oNZlbWPn07J6k2Wx3HpeTv5ZkkhCLr9KpHSViaVSzzqwbd
 /uNuTTJvzJe+Sb57WYdd0uoGX8v7YwZrqVT+axJquq5knWSPdc4fYA+oSvLhUOM7hQ1F
 g0H7hmx6z0XHYhn2zY0bWEH1CF7uWRUkdoHfDgy4wyBikwGso6CRotxf/9Ywpi9Wdrix
 J51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871303; x=1689463303;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfaunTIpb+/JoaE2P6J1QB9JUjqHG1mwiTPg5NcHdcQ=;
 b=b8DMAvrB7kLxHZ9/9PybCyTfy9Ysmf08mLxbwH0J5+w/N56FYf2J9hW6KqTZW2y1U2
 JZ4q9yYqXSpuV1Z361PyGsapEGMXKGSsbmabxII9BsQQdWmSL9Hw7LiNQK/2nfdQEC51
 NyDsH8zAe6g5C3xovGYkcIi+DO4EuZz7XBB3ESDpo20ARGeE2bFSezkbnwkkogwdpY1G
 ZKxn/j8wF6QEhs5/l+pjQyvwEkxHlHmDvVVXfLZUrKyQpexXypeoR9BFUhYTFU7OIn2Q
 wZCJ6gjH1pXiS1rQ9TxNPBQ8EPAq4p1XdaQNm8ACAUCfEW4Dcbp+8Hp4T0Qw1DPmNAVQ
 pftg==
X-Gm-Message-State: AC+VfDx5a5PJJleAwSBP213CSRldXufY0HkEWYfKYN5tRE80Zy1sc5rn
 1Jf+GrM79p9CeNP5z3LH9Nn+FQ==
X-Google-Smtp-Source: ACHHUZ5jgZXxBLpuIjWhWV9Mgll9v42yr+AaAP/NNiIc6Ku3QmceO4Iy+8LG8uwL5++Sx4bNC+sDvw==
X-Received: by 2002:a19:6d0b:0:b0:4f7:6388:5ec1 with SMTP id
 i11-20020a196d0b000000b004f763885ec1mr66782lfc.58.1686871302845; 
 Thu, 15 Jun 2023 16:21:42 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:57 +0200
Subject: [PATCH v9 16/20] drm/msm/a6xx: Fix some A619 tunables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-16-890d8f470c8b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871277; l=1593;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4Gkjo2VDVoi67z3y3hIRakJY3LPFFJYUf+088rGo/nQ=;
 b=plJVOj6DU3u87R7U6VX8KOxp/8dRK/42FlGKYQ7gNc1INHp6+QX8s1lmrdm+M4+MaPJrbMWvx
 ML+PsOizE9eB34tgy9ZV8Xxcz1cu5Tc/vi4y24gMwVwfEiFZ1VmlY1i
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
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 47aafc9deaf8..97e261d33312 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1306,6 +1306,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1323,7 +1325,9 @@ static int hw_init(struct msm_gpu *gpu)
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
2.41.0

