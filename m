Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7692B5A2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A1E10E4F0;
	Tue,  9 Jul 2024 10:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CO1vAu4i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B110E4F0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:45:37 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so533808266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720521936; x=1721126736; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gToTLptM86w4DbSg4pVJQrRVwG35LsSkyYQCCt7KVjw=;
 b=CO1vAu4iuDBFT8IWf/Hg1iYCxKaNZ/CQJq8BPuBimAkXCNsxSm0JH2XztHAsthjgOS
 osgRUo6dObAKPC62hIKgtq5okOGdLP1YiDklPFMsIIqPkK0H/H+K70hk8LAVaPdqHDGI
 Xe+QDXDtDOyxb83YMi6dpv6xYBbov2xRVnDDo0OU//NiADcKjROZZ1CUc0Cgl8Aan5Jb
 ypju1Mixk8GvX8GnSwuyiy/Z7hNri7UmBpmtNy2iuYLbFx5NoD6n1rTUwv6cSpvvyVQz
 vpOGekl68lRsxgkAb+tfxDosd9uuYR5QOlYWqEF4585F5ThJ5Nl9HR5fTE3zuNHsI6Ef
 7Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720521936; x=1721126736;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gToTLptM86w4DbSg4pVJQrRVwG35LsSkyYQCCt7KVjw=;
 b=pehNtuIfnBRpzmQ/+4lcNMiM7vTte9V4eYGuhyIA4Y16QHu3oCrL0RAVjfYm8U+Gil
 N3HS3fN74D9EncuayXQ+5Iqb1t2baeirS3KbBAWa5ft6l1yvlBzbszk1o7WtJiN73nqo
 jNjYjkpkoKiZUcqoIbzotHjLGzTFN2AZAQ+KCatYxBbQRmGS3l3hEqlk3b0G2vKwo337
 ScgbiINTlmZ/ksKgVTJL+UNpwmzRBTX3rSha44S1LabYpAhL6cG168TOCGZk9xIY6vXS
 AKDhvIbQP2pnerE0uoG1vE+AdQBb9OaIhjUENT2s9M1tQOs/SGeacMI2cY8aen0+cp1l
 phog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ/snNlB6jVp+fbh2GscSRjw0XNxZrFkMIwVBiuVSYbyfr1uOagkr/uLWV+3Y26IiU5D2MUdhuRq+f9YIMvyMvkUaWFH6nHQpQKkFVnkA7
X-Gm-Message-State: AOJu0Yxuh0rMqgTb0uRiLO1BGsgaDRxaVpswMCxzsz98RebJlvVyCn6x
 lu1pjX69fmInsw+MslpgmraAc3N89dgSDQIkY9d+vfx1WzXXdkpA6c1Ss5RWCSo=
X-Google-Smtp-Source: AGHT+IFW3cXCBLhl8y6tH7WGUVEU2s6NXfrAid4cgw+rlJCWH5RBeVmuYYGgJqUJYlZ0TQecK8lYqw==
X-Received: by 2002:a17:906:81d2:b0:a77:b052:877e with SMTP id
 a640c23a62f3a-a780b6b3605mr146799266b.19.1720521935892; 
 Tue, 09 Jul 2024 03:45:35 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff038sm66295466b.115.2024.07.09.03.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 03:45:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 09 Jul 2024 12:45:30 +0200
Subject: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for SM8550 / A740
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-smem_speedbin-v5-2-e2146be0c96f@linaro.org>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
In-Reply-To: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720521930; l=1480;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qLAOTrSFtuBecm3+EwggXg43xqGrGY4RLrmT8vpNaLU=;
 b=felzT5CFkBH3CSD4+amuMEw8IiUfz80JoigCu+pRFOy5BlFTjJygWaDDjwtuKGHNKBhm30wZg
 NBUe1/jVPMZBLTAjuLJBMe6dl3+f4IGUf2f654Aut78+wx/zTfxZ3ug
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add speebin data for A740, as found on SM8550 and derivative SoCs.

For non-development SoCs it seems that "everything except FC_AC, FC_AF
should be speedbin 1", but what the values are for said "everything" are
not known, so that's an exercise left to the user..

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..e3322f6aec13 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -11,6 +11,9 @@
 #include "a6xx.xml.h"
 #include "a6xx_gmu.xml.h"
 
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+
 static const struct adreno_reglist a612_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
 	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
@@ -1209,6 +1212,11 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+			/* Other feature codes (on prod SoCs) should match to speedbin 1 */
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,

-- 
2.45.2

