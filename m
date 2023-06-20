Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76472736A87
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 13:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE2F10E2C0;
	Tue, 20 Jun 2023 11:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4F810E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f866a3d8e4so4017771e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259444; x=1689851444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
 b=nj1bLjFxDQ8N1dngAIoD5fFA5vBatazLEV7Rkl0NVSdLk7EjRHn3nPn4q7ZzwtgXn7
 tefqdg+t7D7rjBfnifRhTu8ym5omzboW5s1nHWfyceXGDZtFvr2pZWVSPoK/TJDe96Ah
 SnBI6tzr6oJJ6aWQKzesHnLdvvBQNsvxBLHq6tDJsFVz+zNjLIC5L34SX7pT3/ziD6M0
 LF6bvc2/iH9ZAGbbrlcvrR2X+t38B5zSLvcldDfW2HMyAv4oXs7EAIa/242H6P5RI45X
 fTRACPTRJ06NnffMOsUA//H9n/kwB1d8MbVfiP0Yw5D7M44x14/5EWok0qua/xoSP02a
 IsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259444; x=1689851444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXvgXObuLUXgh3jnIU3RKwPMBc4ZARc1+vOEfqXJtnQ=;
 b=W3xWiwRQx7pyezS3hltZcWgv6eKzqnZaFXINI7Gr2PhjYjoTjYiuCBjJq966LdW6pw
 OgJPBgPqACYnVd2hVqoTPBfZYIlmZl+T9c3Zwa3S/d3wLHCeDzN2NW2zsn1asMYmB71P
 Gl3zNCpQ+t/dbIUoF0wdWScDjzTi1+Lb7xfO2qfh4mzskdiuK6fh6HP76kDEIKWzZJe8
 h0ZQwujErZ+fGXacR84h5YMmXhwRTYnkhF9f0X4atsbtKnNltZLOoNybNVQDIQI+EnF+
 fhWMA7YBI6MtOQtRaQoaPicVaqM8+Jb9Cg/9atpyPcKb3g6OptaDSV5FjiAd5b1y0TOy
 fRlw==
X-Gm-Message-State: AC+VfDzZx/cfYEsvEjeUmdV7ijCXFv+kypKs2r28DvtKjMyqxOXqesKn
 6BlATO2V5biUSOuCf54dUnUiBw==
X-Google-Smtp-Source: ACHHUZ6o3H7FAjbFA36EUJYGnILaT5rNS6XDXr+aoTe+0XtS9Br+u9XgsLwORLTiCrZ54S13+jDAtw==
X-Received: by 2002:a19:e346:0:b0:4f8:3b17:e0c7 with SMTP id
 c6-20020a19e346000000b004f83b17e0c7mr6453920lfk.7.1687259444302; 
 Tue, 20 Jun 2023 04:10:44 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:38 +0200
Subject: [PATCH v4 3/6] drm/msm/a6xx: Skip empty protection ranges entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-3-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1073;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=p7u0J4uljF3tZrz5h1ZuKJqCS/MqBnjZGFZOc1JmV0E=;
 b=aa/j+YpmthCxcgLQSQsqmjhv6KqCYw+HpswdGPxAmK2MGKVBAQcwQbn13IonEP6CnlhShwK15
 MsAo00yuU40DIum5DT5f74Z+YZ1dhhJaV2mUJOkFqvPWhqBVEVF+Grs
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some specific SKUs leave certain protection range registers empty.
Allow for that behavior.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cd0c9bccdc19..488c69cf08d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -935,8 +935,11 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 		  A6XX_CP_PROTECT_CNTL_ACCESS_FAULT_ON_VIOL_EN |
 		  A6XX_CP_PROTECT_CNTL_LAST_SPAN_INF_RANGE);
 
-	for (i = 0; i < count - 1; i++)
-		gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	for (i = 0; i < count - 1; i++) {
+		/* Intentionally skip writing to some registers */
+		if (regs[i])
+			gpu_write(gpu, REG_A6XX_CP_PROTECT(i), regs[i]);
+	}
 	/* last CP_PROTECT to have "infinite" length on the last entry */
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(count_max - 1), regs[i]);
 }

-- 
2.41.0

