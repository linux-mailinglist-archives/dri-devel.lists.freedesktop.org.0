Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C567C6226
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6D10E2EB;
	Thu, 12 Oct 2023 01:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B3710E2EB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:20:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5041d6d8b10so620560e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697073614; x=1697678414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z0QpM7iUu/pH8/30Lj+P5P2kendMvJf7ma+nZODDuwY=;
 b=ak0S6yRciUmmYjpNqbIw4uu8yQgbcGiwKujPy56606f69k3uPJoAmIgT4MVZSOX8wN
 qKK+9Rgo7+f/APeopvKAWUGSTPIEUMAtBVnN6Uwum8mwlaWzhC6MAdMeWKzjHmBJxPnX
 7ywPY/Lew6K9RpJLhohQZoFyVhyG2Z9UtnnOU2V5uJKXb3E2BJchACtu7IadfiU68P22
 EFD82WqQrT0IvdHciHlgwChf1KmXNDP+UGPaLd212Fc/jrZ2cjsD8Kaqz7NPY7SRiAER
 nCJjcyGqdiwQcT1ju2hQHMIZAgQLHa8PsLnim9BmJuzyyzSO3bkvEXh2VxgCy+qxCM07
 hunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697073614; x=1697678414;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z0QpM7iUu/pH8/30Lj+P5P2kendMvJf7ma+nZODDuwY=;
 b=ctua+08Lm6H+1T8LBkli5NeKt6X4SnWB3XPM2lHtkC+SAFQ6EJhvb/UBXthDhrXgdu
 jDfZAJu8rLfXj5StqCwjGm5CSCVyJUIJv9aRHLqjb7kEacOauhgvlYGA3udQpT6+8iwU
 4Vupz+RgGcv01W5Wjg5DD1t75Uxyw429sLuJzoEUR/VdDhH4k2UhaQgbG6O9mNfDMmEa
 T6g9v1QqA/gX0eFZZbSAcPlxfcCme6F4SxybLysG1ABiRaeG8SGno8k9dsPIu1JanHH8
 6LUPJAYFx0IXgZscC2A6SkzVnVKnwHIBimzKlD7UDPNZ4neJXTOez8CozSntSJGhIpnM
 lA3A==
X-Gm-Message-State: AOJu0YzuswB8ePZYw4z9p08dJclcrcT5ze5Sq/pUO1hT5UoFxQb/OCXf
 3Sl8x9LR8ZabwM/4blsPYlx/Tw==
X-Google-Smtp-Source: AGHT+IH8qnQEiUNTgWFQZB4vHjuJ93fMWk4a1pMikLcYkzsMQSZa8cpLIN5nllg75n69SRdjQB5nbA==
X-Received: by 2002:a05:6512:3118:b0:500:a0a3:80ff with SMTP id
 n24-20020a056512311800b00500a0a380ffmr17005309lfb.58.1697073614266; 
 Wed, 11 Oct 2023 18:20:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y21-20020ac255b5000000b005056c997ed6sm2518994lfg.163.2023.10.11.18.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 18:20:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH] drm/msm/a7xx: actually use a7xx state registers
Date: Thu, 12 Oct 2023 04:20:13 +0300
Message-Id: <20231012012013.449918-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make a6xx_get_registers() use a7xx registers instead of a6xx ones if the
detected Adreno is from the A7xx family.

Fixes: e997ae5f45ca ("drm/msm/a6xx: Mostly implement A7xx gpu_state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 10 ++++------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 18be2d3bde09..91a564a24dbe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -882,12 +882,13 @@ static void a6xx_snapshot_gmu_hfi_history(struct msm_gpu *gpu,
 	}
 }
 
+#define A6XX_REGLIST_SIZE        1
 #define A6XX_GBIF_REGLIST_SIZE   1
 static void a6xx_get_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
 		struct a6xx_crashdumper *dumper)
 {
-	int i, count = ARRAY_SIZE(a6xx_ahb_reglist) +
+	int i, count = A6XX_REGLIST_SIZE +
 		ARRAY_SIZE(a6xx_reglist) +
 		ARRAY_SIZE(a6xx_hlsq_reglist) + A6XX_GBIF_REGLIST_SIZE;
 	int index = 0;
@@ -901,12 +902,20 @@ static void a6xx_get_registers(struct msm_gpu *gpu,
 
 	a6xx_state->nr_registers = count;
 
-	for (i = 0; i < ARRAY_SIZE(a6xx_ahb_reglist); i++)
+	if (adreno_is_a7xx(adreno_gpu))
 		a6xx_get_ahb_gpu_registers(gpu,
-			a6xx_state, &a6xx_ahb_reglist[i],
+			a6xx_state, &a7xx_ahb_reglist,
+			&a6xx_state->registers[index++]);
+	else
+		a6xx_get_ahb_gpu_registers(gpu,
+			a6xx_state, &a6xx_ahb_reglist,
 			&a6xx_state->registers[index++]);
 
-	if (a6xx_has_gbif(adreno_gpu))
+	if (adreno_is_a7xx(adreno_gpu))
+		a6xx_get_ahb_gpu_registers(gpu,
+				a6xx_state, &a7xx_gbif_reglist,
+				&a6xx_state->registers[index++]);
+	else if (a6xx_has_gbif(adreno_gpu))
 		a6xx_get_ahb_gpu_registers(gpu,
 				a6xx_state, &a6xx_gbif_reglist,
 				&a6xx_state->registers[index++]);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 8d7e6f26480a..9560fc1b858a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -328,9 +328,8 @@ static const u32 a6xx_gbif_registers[] = {
 	0x3C00, 0X3C0B, 0X3C40, 0X3C47, 0X3CC0, 0X3CD1, 0xE3A, 0xE3A,
 };
 
-static const struct a6xx_registers a6xx_ahb_reglist[] = {
-	REGS(a6xx_ahb_registers, 0, 0),
-};
+static const struct a6xx_registers a6xx_ahb_reglist =
+	REGS(a6xx_ahb_registers, 0, 0);
 
 static const struct a6xx_registers a6xx_vbif_reglist =
 			REGS(a6xx_vbif_registers, 0, 0);
@@ -353,9 +352,8 @@ static const u32 a7xx_gbif_registers[] = {
 	0x3cc0, 0x3cd1,
 };
 
-static const struct a6xx_registers a7xx_ahb_reglist[] = {
-	REGS(a7xx_ahb_registers, 0, 0),
-};
+static const struct a6xx_registers a7xx_ahb_reglist=
+	REGS(a7xx_ahb_registers, 0, 0);
 
 static const struct a6xx_registers a7xx_gbif_reglist =
 	REGS(a7xx_gbif_registers, 0, 0);
-- 
2.39.2

