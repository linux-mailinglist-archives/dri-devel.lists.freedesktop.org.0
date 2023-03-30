Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DD6D1304
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19710F0AD;
	Thu, 30 Mar 2023 23:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7C410F0A8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:30 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q16so26642192lfe.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218729;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YtGg6mbEC7K9haoa+JJffahHI7dimi0Is2Gw5+yUY9M=;
 b=T0bq9ULX4cHf48ItQHwTeI+aSBRn3rUsrOI2ofEBEIRZ78a4JgVPoXEnVuFd3GHH2/
 PuIP8sixgKOzzkDaxOyX/RfHTgqlofR2ng3ZwTfMWlG5HOqdpYDNi/lUI4m3Xopie1sk
 d5Lpp0HAo5ufHN9Pt7duBlQCmkq/rM92pFKt0hSYGykEK+gBV5HqcLB3rtPCirEoRIe1
 GC0l4sITg8Nhxya2Z5pNAVmld30r1TTz/d3cNA/EZ1U1KueUW/tbn/xVoJ9OKLt3svEm
 7xZ5Erqk3psHaakLewHfo6+4mmd+G1MWVrKQNwfUU9YCrXO1XqHfWdiF8+c/ATd7hJCq
 Jb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218729;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YtGg6mbEC7K9haoa+JJffahHI7dimi0Is2Gw5+yUY9M=;
 b=nnQQXEWsM6pRF8w+s9Z7TJIvxzlVaxNX+Bew2UD5faj2MblQ+Izi1CYndRVSpu3Y/P
 4I3W1KB3LbOIybI7CqEE+mF6X7hCUPWt7VfX/wNPJ7kd8AEqyyta4NvUSXpgODzIO6pq
 D0CFeCzhchWm/vSebXCIaWwkJ6DbnnLaHxCSN51RhkRsac1g1gCHHMYpk0UOHfgYJqIH
 xLoZGJq+q8tOJbg6JLtA8iCiFeOSenCyoRRpAzcd+ZWqc0O7i7wTPHo08qEN2CkIvtMW
 62UDnymVzpE93tsowVf87K2mvfP3/aTOr3uFilirMSNaoYYsf+Hx5PTLc5QpQPCW86m3
 NSUA==
X-Gm-Message-State: AAQBX9f2FBIy8h2SvhynWzM655yFsUdTzXcOBollmt4wXLmgdOHstVzy
 6T5R4mmUuLJZMJug8Q+Tcm/I3g==
X-Google-Smtp-Source: AKy350ZWvgedj6zqeMG91tTvE9vR7DemajFCKX/9e5d4xqK1Gm5POYO7lt5bDOEeaf0cQNVSfzeXxg==
X-Received: by 2002:a19:ad48:0:b0:4ea:ea00:5d45 with SMTP id
 s8-20020a19ad48000000b004eaea005d45mr6962305lfd.44.1680218729104; 
 Thu, 30 Mar 2023 16:25:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:19 +0200
Subject: [PATCH v5 05/15] drm/msm/a6xx: Extend and explain UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-5-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=3025;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uv5LOb4J9bj2PZpW4eq/OCSd4qgrzTJM/32g49JBad4=;
 b=k+wdgfZ7L2fmksgwtFWf0rcEWhRPOLbt9F0VrO0ToSfjnB1TGbLowHuyK5xhWbnpcM6I8OZUuFMu
 +rhfg3O+C/FTMXC/04le0zy6dx/VQiHGgLThti3QKLqXBB5A5V4C
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

Rename lower_bit to hbb_lo and explain what it signifies.
Add explanations (wherever possible to other tunables).

Port setting min_access_length, ubwc_mode and hbb_hi from downstream.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 39 +++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f2dbd5d13f7d..ae0a90b2834f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,10 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
-	u32 amsbc = 0;
+	/* Unknown, introduced with A650 family, related to UBWC mode/ver 4 */
 	u32 rgb565_predicator = 0;
+	/* Unknown, introduced with A650 family */
 	u32 uavflagprd_inv = 0;
+	/* Whether the minimum access length is 64 bits */
+	u32 min_acc_len = 0;
+	/* Entirely magic, per-GPU-gen value */
+	u32 ubwc_mode = 0;
+	/*
+	 * The Highest Bank Bit value represents the bit of the highest DDR bank.
+	 * We then subtract 13 from it (13 is the minimum value allowed by hw) and
+	 * write the lowest two bits of the remaining value as hbb_lo and the
+	 * one above it as hbb_hi to the hardware. This should ideally use DRAM
+	 * type detection.
+	 */
+	u32 hbb_hi = 0;
+	u32 hbb_lo = 2;
+	/* Unknown, introduced with A640/680 */
+	u32 amsbc = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
@@ -800,25 +815,31 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
-		lower_bit = 3;
+		hbb_lo = 3;
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
+		hbb_lo = 1;
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
-		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
+		  rgb565_predicator << 11 | hbb_hi << 10 | amsbc << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
+		  min_acc_len << 3 | hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  hbb_lo << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | hbb_lo << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)

-- 
2.40.0

