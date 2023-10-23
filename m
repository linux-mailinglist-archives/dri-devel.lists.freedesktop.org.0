Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACF7D394F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50F210E1E2;
	Mon, 23 Oct 2023 14:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F8710E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:29:40 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c523ac38fbso49223641fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698071379; x=1698676179; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
 b=IxmWmB5ca50rUvQvdgQ1PD7658U5lFscnNjfgRv5LKlGJHB9u2SYH/WQzVYSS7dUBr
 h1/ccD5xx+tDLu1y2Euz9Ruf+bRNlXW49EcvP4rOwjDMY+UWH/BFNY2PmPWnTjfHfese
 2Drz5jJkPqPj4p2jJsI+R833Pj6P3z8CJdOMo/qRlcv0u1JU2NH/CiLM3u5TeVlRF8Jp
 EYeAH30nUqaOhzlwVmdPdcJr2G4tSyYrNpCTC8nsxanxbPdpdQFiquqSfR7C4k6WV2Em
 WG5zGqEp68oELiDyGVNA/e9o3liVxMpd46auIGYvoKXFxi4jqMUUb4jXQI7YZse26MC7
 HENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698071379; x=1698676179;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
 b=m9qkAdkRHhhciBYlXsh4AqZIYh0P11gdhIbv3l27e2SzBrsd6RYkuVf+mzHC1vhXV8
 uMNH6W4p3GJR2Lio6P/MkIeNqxmM2MqHeBrl8fFpdYbnP8zABMlSH7m8SivKtPsQngEY
 6fMm31FVRhqGcHKYKg2PaNqm1RLypacIJi7fr4kpSEZ9Q4o4t2m/aE4o6GmlJp+QD0Cq
 E6g0GRGcQupjAS9qkK2qkk31ZFgfOCuzH//DDdFfyDmma3lFRbxejltMdM6ght6CHtvg
 tlwSUuUwRx0y6nqWsiDFv1IV3D7ufABozbBfg0tpj0E5yh0Ym8brQ3EDMp40js8yfbMx
 varQ==
X-Gm-Message-State: AOJu0Ywk2xBVYy3yiJ74gRrc7hroNT3wzUzLiUz5rLmT5C6Qz8SfMMqd
 ZpAZXrlJNezUHipAkLaAgPo6nA==
X-Google-Smtp-Source: AGHT+IH5WFoFfyNzJgl4CLmejLA/ZgHuJygZLcv0FelZqLu9BJ1k+mLHsMaN3Mm0ni7tH5Yu0rnSiQ==
X-Received: by 2002:a2e:a7c7:0:b0:2c1:5645:a2c0 with SMTP id
 x7-20020a2ea7c7000000b002c15645a2c0mr5768343ljp.35.1698071378607; 
 Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177080.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.80])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e8e6d000000b002c4faf47378sm1616655ljk.28.2023.10.23.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 23 Oct 2023 16:29:31 +0200
Subject: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new GPUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEqDNmUC/x2NywrCQAxFf6VkbaAdB0F/RUSSaWoDJVMyvqD03
 w0u7uJcOJwNmrhKg0u3gctbm1YLGA4dlJnsIahjMKQ+HYcYPuuqBWl0sXr/kBvmRP2ZOfN0yhA
 eUxNkJytzmPZaljhXl0m//9D1tu8/hqsr1XgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698071376; l=1189;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CI9uW4HFCd+sT4l3B8ani/4HRFmQfbbgjJhTrM3t/ig=;
 b=SCcIvz1UzYt8XexR/pBOz+V+i46dV2cDA1630eMo2ve5CMi9C6GzQ58HdfRNOoV17ffhl+axh
 GqYKdlDyyY/DwK9zWKbyUnlzLfk2p9kjX0+mVT5IVcj8WRb7GEdWRi7
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

New GPUs still use the lower 2 bytes of the chip id (in whatever form
it comes) to signify silicon revision. Drop the warning that makes it
sound as if that was unintended.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 80b3f6312116..9a1ec42155fd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -203,11 +203,6 @@ struct adreno_platform_config {
 
 static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
 {
-	/* It is probably ok to assume legacy "adreno_rev" format
-	 * for all a6xx devices, but probably best to limit this
-	 * to older things.
-	 */
-	WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
 	return gpu->chip_id & 0xff;
 }
 

---
base-commit: e8361b005d7c92997d12f2b85a9e4a525738bd9d
change-id: 20231023-topic-adreno_warn-42a09bb4bf64

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

