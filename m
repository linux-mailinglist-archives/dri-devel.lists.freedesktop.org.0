Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2567CFBE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985F10E152;
	Thu, 26 Jan 2023 15:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F6D10E152
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:14 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v13so2120801eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODCdBm2MRM5VGEq8wpIxye80do+61BsOwLKgEyBl3SY=;
 b=Msa6rCuC0/uqUY98FgVwURGTYuC2GY+Ziyx93cCeZ5K1U978icJ83ZvL1G2LCIBGA1
 XADyd3DyV3njhJWo8+zmDlGcBUA1NtRcrfJY1MlWSY7LDWwB5rpFyr6inILT8WN5R3PQ
 ZJ2xfrdKCSnIP67ZMtki3DNN2PgD5cHnhCRmCWrJVjDdfo4zJnWAcd9q5D6NVy8c63Es
 znDzv4mCuEoZ5KXCXd3uFvYZMo8H3xjsk2dhyO7DoL/dpehYVwSPoalisMF+kLbS7gp3
 E98DhXRcxf/UmeUqhpY0qrLSDNR5prsd2IhMCUGLrvs5miPqOV3+ozY7Dft1nafbTKnf
 Coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODCdBm2MRM5VGEq8wpIxye80do+61BsOwLKgEyBl3SY=;
 b=gx/acMk9YOKVUMsGXvKedPnIjWkhuP1I9/o1tBJZN17AjJodpYShHu+grT6ErRDujO
 sjpqXGjp6Mzc0f7hfV1BqAVs9Yi8fttfbrCP8gs8UWK5X5DwJqhkKNWL0yzeH0Mxby6g
 MpmdMqSnOfc5gNpPCQwJHlcPxP1YBs5TIfSfoPV8QvqZcOP4izboHnJgVPBOJFsf4kds
 W0G5UVgOPBcs28x8sOvUilkagvrGY+Xt1FiUs00PQKO9d3jOdi2E7O7hFWHysxsvIfgl
 MwNVA4PaaU7T3Nizg39LKlQyKfIIDkp2XHmk1dFL56l3wCyXhxZ64NCRtnK8Nk00N3Yg
 kZQg==
X-Gm-Message-State: AFqh2krg/tDP8s33tRmATwFgHuAESYsWRponrqoAM02ztx/mOH6ORDgZ
 RInOolH/IkvjZy7zllsmjRlodA==
X-Google-Smtp-Source: AMrXdXuij9twa0iCryjfas3UJNxswtjzaWIPaNynCJ5Q3hfCZii6JCG70yWLfTMvubYyOKAxn1p6Ng==
X-Received: by 2002:a05:6402:3986:b0:49d:5c6:3e5f with SMTP id
 fk6-20020a056402398600b0049d05c63e5fmr45048263edb.41.1674746233259; 
 Thu, 26 Jan 2023 07:17:13 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 02/14] drm/msm/a6xx: Extend UBWC config
Date: Thu, 26 Jan 2023 16:16:06 +0100
Message-Id: <20230126151618.225127-3-konrad.dybcio@linaro.org>
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

Port setting min_access_length, ubwc_mode and upper_bit from downstream.
Values were validated using downstream device trees for SM8[123]50 and
left default (as per downstream) elsewhere.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5f5d0bb3fdc..ad5d791b804c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,17 +786,22 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
+	u32 lower_bit = 1;
+	u32 upper_bit = 0;
 	u32 amsbc = 0;
 	u32 rgb565_predicator = 0;
 	u32 uavflagprd_inv = 0;
+	u32 min_acc_len = 0;
+	u32 ubwc_mode = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640_family(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu)) {
 		amsbc = 1;
+		lower_bit = 2;
+	}
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
@@ -807,18 +812,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
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
+		  rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
-- 
2.39.1

