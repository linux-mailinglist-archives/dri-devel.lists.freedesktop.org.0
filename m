Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B1706E95
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94D510E1C9;
	Wed, 17 May 2023 16:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB4C10E45A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:50:23 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac80ed7f26so10591121fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342221; x=1686934221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jKJzh3VBdMQOrvlfJ6ldWhmoYbX6WSR7/WgTonW/aWQ=;
 b=YmiF+k1DCo7sJT82Nk4sHD2XysqRnE+/gQkavGhTVbv/wfUHjEY8DCZp2ALGlIVFxK
 vFJI4qnhA+rQycQEkYdzapsq5QVvy9SXn5xlTDOoXdH3J1z58P59pbM7e5MxV4tA0hp3
 rbiaEhfSmmAB1rsLKvlYg6c7wOpxONwYICuOrUPT+3L/+in9V33CHGd/qHhzTf6wO3yG
 +Jvh6u1Zv7vUkNa2k4FikK39n3WwVam404AZmfXKxvskCzetQqAQjfBdSlJA3260QPCp
 37em6Erd7VhUrUSU/c10E737Ddrm8tAWCQ8bpq2ENKPG9oV1u1LR+ePlOFOzGeCaiwlF
 ZPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342221; x=1686934221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jKJzh3VBdMQOrvlfJ6ldWhmoYbX6WSR7/WgTonW/aWQ=;
 b=QyZiaysCbcjE68QuT15eOjcn30jk3xjTZq8h1lLmom3T/5HmZBRGeh8TdsOZJ0/A78
 FxBAE4rUtfsLZH/AQikfHGRZqqKJzm8XAQmzZKE3IrsLbvDbbWsE6zSAxN+9mx3JjzNE
 TQRIwyLgsq1oXkkuRnkqlsGals9QHdBw3QdUWJp9qaPMp4EEBq5krHQZMK3Rp/vpCTQE
 yZmgHpN1+xaOINLXMUbujbFFosKzPURRdPSoqyKlbMgWTOd2SITOLFR7KSGj2ugYLGia
 FkkT+PI6cQl8O4Fj31TtjvsOAo8Vu03TnJUMw+IBPYleR441OAn8QGKdHkMeVEc8g09x
 iiBw==
X-Gm-Message-State: AC+VfDwcYGqXrtHGSim4TMnYp0SZneG9OSzjHWVo7Rk6mf4a3oDUy+N4
 JKD3virDTbwAvat8rdNhvFJmoQ==
X-Google-Smtp-Source: ACHHUZ4scB0qXASKtXLDjxdCzSc8nOLwoqbw3Tshdmgqbc6XZcRpopUJoPcc0s3OQF9oqf10FQSm+g==
X-Received: by 2002:a2e:9d03:0:b0:2a7:a616:c39 with SMTP id
 t3-20020a2e9d03000000b002a7a6160c39mr9789440lji.48.1684342221526; 
 Wed, 17 May 2023 09:50:21 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a2e9cc6000000b002af0e9abaf6sm159224ljj.131.2023.05.17.09.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:50:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 May 2023 18:50:12 +0200
Subject: [PATCH 5/6] drm/msm/a6xx: Use GMU_ALWAYS_ON_COUNTER for
 GMU-equipped GPUs in timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v1-5-7a964f2e99c2@linaro.org>
References: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684342212; l=1052;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yXq/EvspiDM4WLys1dNWbAg7dVVScVQhvkOnD1ANMBI=;
 b=r6jwsVtQ4nvBF0AJY4c2o98RWESzy2qTp1iwGXmihRYAaw/Lb3C3Gds/eT2qIOq5DsqpEtp6u
 156ORD/lpIhDMiWaQkypMLl/VUZdMdWCtf9EjO5p0/D/H2C4QjxlzCj
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the always-on counter provided by the GMU to skip having to
keep the GPU online.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8707e8b6ac7e..d2a999b90589 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1664,12 +1664,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
-	/* Force the GPU power on so we can read this register */
-	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
-
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
-
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
+	*value = gmu_read64(&a6xx_gpu->gmu,
+			    REG_A6XX_GMU_ALWAYS_ON_COUNTER_L,
+			    REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
 
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 

-- 
2.40.1

