Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13236774C21
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895D810E3F1;
	Tue,  8 Aug 2023 21:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4212410E213
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:03:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9cf2b1309so3266001fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528580; x=1692133380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vyXbhGhn18q2epfu4SWH/aQDrzkgDXaFIhnNbGtGC7U=;
 b=VujgEBjwyScdy4krYp0PsisUqplwWaZEowKlMh+MXClybDubRW1i0x4zIXf+cBxDC8
 DwOo9NWhfAObZdHzDVck9UugL8XOeJkkWzMGhGpk0cQTs605Ww9IhwQjL/xtDd6dxa5k
 y8BfiC2JqDSi1HnrcRRVR9XjKIpUTJb4/wl6ONuWTKDqfAA3WNVRt+iFBLtTJf992jk+
 XTOxtJvZuyVsTc4/8IvcLtOTdiq54fgYZaK2QCLbMZskAoE5V4vY3Tr+hC1g8DjEkuIX
 0M5cQ/tXZgQYD7nC39CcNZN+Mw6Cx90Njg43yHRNmV1918sPXf3M80BbtYb0PNSprQww
 DoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528580; x=1692133380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyXbhGhn18q2epfu4SWH/aQDrzkgDXaFIhnNbGtGC7U=;
 b=elZ8p2pT853oY6SS1PhYWcwxf+N6chy+vOSxSuycGrHb4Q7za9Q26gX+agiQH8hOB5
 p0chxZJ/qnVzqT5btxNzUhR7QCXm7+WE0eGvHUQ99wEvJDav9IDbXcItZxs0T3oyKHcr
 GeyvOrdArEwNNzZ98r9M06+2wWSHW8KIRJuZ6sZjqXdU+53M47v6tXd8q7Kz+ryPfgsA
 ZpRPWe3lAmYjwxifjwnXWnMItJFun0k7fIjcPApVWCDwsX/W8kB3a+s0cwrQCyHx6HGD
 Qj1wxRRVCrcgkYHEzjrf1n8kJqzgdhftO3NjvMhbfHrZNnWmL/DwIt0nOEOC++jhK824
 ONnw==
X-Gm-Message-State: AOJu0YzuLNV0cNn2fBK1ojU6IRZseKJgmVCIxV4wiA3FSGaeAnpEiPPY
 N5HpnCi+5dhkUpm+5JaPV443Fw==
X-Google-Smtp-Source: AGHT+IHoV1oF15QkBUldmZLMCtLPoUuJyJYtuXzGep5+KTw10AGDZo6lCAtzJhHf8ovdFAPWY8uLkQ==
X-Received: by 2002:a2e:b547:0:b0:2b9:d965:fbf2 with SMTP id
 a7-20020a2eb547000000b002b9d965fbf2mr3284565ljn.22.1691528580533; 
 Tue, 08 Aug 2023 14:03:00 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:03:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:45 +0200
Subject: [PATCH v2 07/14] drm/msm/a6xx: Bail out early if setting GPU OOB fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-7-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1076;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eKaMrn2nEo1t9dG12+njAKjMPE3YGEK2vLhd6tZW2mA=;
 b=oYA7dxokB+2a54oH9Jf1VwY7xcZib3TY3MJ+n+qR5kxnmlSD/8n7GK/svGTU/OhFgcpD4UtZI
 we5G825DbTbCz3tmp2CUl7JV8Ercmly2mfEsQvY2f/8YthWHWlFypQk
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

If the GMU can't guarantee the required resources are up, trying to
bring up the GPU is a lost cause. Return early if setting GPU OOB
fails.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6dd6d72bcd86..d4e85e24002f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1201,7 +1201,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Make sure the GMU keeps the GPU on while we set it up */
-		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		if (ret)
+			return ret;
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */

-- 
2.41.0

