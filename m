Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F267CFCA
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EC510E93E;
	Thu, 26 Jan 2023 15:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BB510E2A4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:49 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id s3so2164055edd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P78YOJNtNx1A2lMURy8WdPKbNTrzZSXLQJ7yOcKbEYY=;
 b=wq6GSpyeEMXTOBvJmDHBN5ji4ivXnfV6rihHo/Ne8y99h+jdCSSvCjP2ZeQ/W7x3lY
 UhHxv6S6ZKxZd8ZJ7O2rARZYrbut5lpyifR3+/AE1HH3Nmd7ZV1IfXoFEpNlmBmhaYQa
 pTf/SBVgjDTZ/zkzvheoLUoHrWZuIMQndXePLN6Pbc57n0FDAHR/UMhMkOgAVcxL3Uhp
 CoxBseBttdnGbudshUi7J1tEf2KttUVvNAKKUnHChSzYT0Z/NZJT+mAyMU8P1HicwXFB
 8ae8PVtNdXzrp1l2YwlRJ3NdQyktm5MAkHxP1yIrhWLh8/q1bf6XaXTmgBZCynaFuNME
 D8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P78YOJNtNx1A2lMURy8WdPKbNTrzZSXLQJ7yOcKbEYY=;
 b=P3z7bngRMQ8SqPT57rlIpO4GF8qJ6wjPjqvyfQwfaD13wuFfPxn0YEZcNvcZicmkg6
 dgv84gcwpBdW3SN4+1qc7Ahjc/Emj9lmh2S7RlvT+0pRuyn/7s+elAuI+A9vjhhnMwIX
 9jisqzVpOlRisN8cvbKKYqttDmdxUFFqLELQjsuW87VEVHDydjUsggDf73u6XTac7LU7
 XvX/QUiVjiYHDGJWsf4iKXfHEkohUtFbeAqEZzQNHF6IHz+8egSwqwDjYm9ZMMA8aTCv
 jwCHaNgHUQRnIufe63tnwpvLubsjohz8BpmF5SGMOI/sg91KO03KqoR1iDP30CLgmZ3o
 WcBQ==
X-Gm-Message-State: AFqh2koXbOMuTolThhNFeQqSGlwrfr5njo2SyD/BclPlQr/xwxVSx8cA
 bCnme1D6g4MutFPazA74p9BvcA==
X-Google-Smtp-Source: AMrXdXtxeY99s2JoW44yFytv4ncyFOE4J6oC7Lu7h/IKDvpmk89qOGy0wDEMAYv+E7HHc7+NFrIgDg==
X-Received: by 2002:a05:6402:230c:b0:48d:91a9:2cd0 with SMTP id
 l12-20020a056402230c00b0048d91a92cd0mr32222832eda.29.1674746267542; 
 Thu, 26 Jan 2023 07:17:47 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 09/14] drm/msm/a6xx: Fix some A619 tunables
Date: Thu, 26 Jan 2023 16:16:13 +0100
Message-Id: <20230126151618.225127-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7a480705f407..f34ab3f39f09 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1171,6 +1171,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1188,7 +1190,9 @@ static int hw_init(struct msm_gpu *gpu)
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
2.39.1

