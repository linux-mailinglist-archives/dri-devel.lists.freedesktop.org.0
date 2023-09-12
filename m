Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31079CD16
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 12:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E1C10E3DD;
	Tue, 12 Sep 2023 10:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6310E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 10:05:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9aa0495f9cfso780457666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694513106; x=1695117906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=bTl/3dyCpHEl98aCN3I3TH9y3fWUEQQH4fb7oNFElvSavcBPuvqa/BB9OXLt0OnVFq
 i6Vs4jnCGtdfBCKqzK487PsW+J3NSp9p95g/MeF5XkkNvIeD4pBPCcupFmlflH3R8Oau
 iEYZOFsS/Db7Z0GTYdFZWGIRnjYkqvPCg+C+Xo3yn9RULUmJk2MqvbpDYH0OWbREnbnX
 QwiTKLDXsrZyGvq6EhCftPfVLwaXFMZ3E4z8HS3nmt71ZXrJJgy+xdp4YSFdDmFJ5r0U
 Mpe2aAT7mUuiKuIFSTDqLJ10BcqF0wag08FVO7jlovWgyoNQquiXmK6gzqznuN7mlVzE
 u/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694513106; x=1695117906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
 b=aISFSoG9NCT5OPsqZuVhi1Tg89ddAj0DjbEz88++wHWS9nlVDYFNDLqMx7rOfkzY/T
 XnQrGDU0xmE53Jtq97y+jRIHyCWHWYmJlNFY4JBFF4n/h+JIGdS0JVOYVzaWmFKf1PUC
 7S6asylFv5M2Du9JVtleLPqAnjIQihHhercOrb7oO1c6DqI2HiWVqCpjr/0Rry6/FGdO
 4WJ40uxlEdHjaFqOplWC36cz18TOceMzlbF4+M0J6g6/rSO9rD+iPqziuxeWHoVntH7d
 vfATvo1wucSsgnXdIw/2L9QJ6I8/pn3RVI+inm7bqvG+ugTAAiFOjIA9R16bQSfsn16a
 36KQ==
X-Gm-Message-State: AOJu0YzZ94tYWFMgn9SC5pMwxdChwz2PeBaa+/v2NK9MJaC82+Jw+SLL
 YRVtYx9bYXLMz6rJpOH9Q9ZWoA==
X-Google-Smtp-Source: AGHT+IHkfJuO6isT9rl4lZ0FctzAxFjvF1AMWHxfRJgf36Cn1Rv+YzPFam2bRtfeAbVUShYgfbc88A==
X-Received: by 2002:a17:906:519b:b0:9a5:9305:83fb with SMTP id
 y27-20020a170906519b00b009a5930583fbmr3059758ejk.34.1694513106013; 
 Tue, 12 Sep 2023 03:05:06 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a170906060300b0099ce188be7fsm6592053ejb.3.2023.09.12.03.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 03:05:05 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 12 Sep 2023 12:04:52 +0200
Subject: [PATCH v4 10/10] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v4-10-8b3e402795c1@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694513085; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=S69YtysEIHJMxY5KNnuCyMTYR/1rqHR9OdffW35mR5k=;
 b=iz2SkMr9ivtUPof6eNrA8ldOUANAA2M2VE6AlIFMAwGynQBl14qCQbnTlojPGPQaoB+iWzvS7
 RFzrmVkMeH9DZRIMeKqHdJ2eGx1kdg/fDffXssujc8ZmhMA+cj6YNkM
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2313620084b6..11cb410e0ac7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.42.0

