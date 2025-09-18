Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DF0B84D1E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E014410E8A8;
	Thu, 18 Sep 2025 13:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BLq86PkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CE810E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 13:29:49 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-32ee4163564so759315a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758202189; x=1758806989; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nuRBfqh8CopNeGj4s9JcPIl8SA4pKW/98Tru8VZbruE=;
 b=BLq86PkEoIj4lNwekhYCXlSldWmqONRuo9IG6RV1ezjb7FprODfR/1dcttNTBr2Uj5
 4eZKR2OMINcuGqd0pWdEfu31/UNeoStPUG96Z/woZOijSG/HmKKCIQ7Vb29j3eWCjZfn
 s9pw4j4Y83oRg1EQ8NAa6oTMtcBH5qJoPeuGe5wM2uKcjZfrwYTNRXGG5//aITcwePZL
 Px7kqa2YP0pBgfO+QZBVU2VG2tCe6hXkhZfJcEfQmO7YlnbeMliqyjjmS/IGMfKB34HS
 EVsuK2z9hK+huXt9oUyB6RZI2BrIuDEc7MpmKblMWNoSH1uA+u6YMKEQ3rBDdwP8dF+7
 rmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758202189; x=1758806989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuRBfqh8CopNeGj4s9JcPIl8SA4pKW/98Tru8VZbruE=;
 b=Z5m7R8BilKgAX9qYSYZ9rbffKGcxkiq2RXM+JXz1gz8nmAs9XlfZ+KMlBCALbfgkaO
 ilMwxQjxBlYpPe0iIuH+8ZLDW5T4MNesszLvm3LX3nDWDwmUgewU/ADMcPnGfFmGY3Ls
 +lUCIzFR1TIIB0+6JsiZY4EywObky61l3HSlMqxuFCqQsuISccA5LwwBX1U2A4rdr3RK
 zr9bPedyY6tFGTITD4gsCZTGz3GpsBSPNaG9NdzrJjFPXDXOg40EXxYoQO22vi1TE/xz
 i+2bAo9COMPiurljz0gr98Nr68cDLJvlJRkYfs3YzrotcjV5tUknGVYa8M6Mqvixp5J5
 K2Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIy1es7iZvPQPNX6agyjSjiumsoff5uDj1csc/SustoIYVx1LsI8Nvuu2PMgMue7yRiOtajTOYKhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7UiEU713LXtOpQ/gl8+ORyNsf5zeMVs1ZJwMpH9Zo9T9nIdSq
 mJTRuFhnta7jCCsvk0pdsmIiASvklbdw3GYhECh8eD48aA8gKPfzRdnDxXYULRTFqLE=
X-Gm-Gg: ASbGncsIWAo/T+h/WO/HOK/E/SQtWFTIxJI9tBDBDSa8CDQd50Ksksjyozb6CR0E1B+
 ujm62PrCnH2/GJ4vwNR3DMSZ0Zg1VDZqpUaz6CQGit8fXQcBR22Azi2Y/Hsa803zLUAeE9uoyUo
 0s0kvZzocGlCN9PDBoLHJZl8e5OHrR9xehrOaA9WaRiPl/LJajRDZS7Da8+WdF3/Y369Qc1HOWE
 Y0ZdLmmiU7f7xXnGCzT20FDB61LkCYdkSOLrGABhC35JLMyQucIogCsEktpI0d3w1L/UT1djxOi
 DyGq+OzUovvMheajy4JU4khndgj2iJp8rmEmfLlGXBTKYBnvOI81G+gP83Kq08M280mRm7EVOjH
 PYwNnJ7De3M9ue3AOIYFBMNlHlioCULV0snJFOlwIgRdb+w==
X-Google-Smtp-Source: AGHT+IHFJ1UXuMDIcizq+VwgouZRP1MpzHNb3lgea1Tc65YVimECTE5UfJoCwJJFEWAwPnexmrET2A==
X-Received: by 2002:a17:90b:4c4c:b0:32e:3e2c:8ad8 with SMTP id
 98e67ed59e1d1-32ee3f73a0amr7783868a91.20.1758202188968; 
 Thu, 18 Sep 2025 06:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:29:48 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:58 +0800
Subject: [PATCH v16 06/10] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-6-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=PRJ+au3DI7HiuWEGK005K0r17ABM8j6SQDUJwlnMCMI=;
 b=LCib+BVV8wTLxZd2X7O64JU7UwWu9AMDspmPEKtl2onfR7RP0tAEONojfQ5IvOsin/POXyC4Y
 Ua4gKxQopuLDEQAr5K4RUIKczTuh4iGAR4E1AoEZREolcmSf0bb7Cd9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1318f9e63ef1e7bab078ae17e39d9ed19c04f465..55b83ba6102d38a9ec97bc4d12ad31810e4b261a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2389,7 +2390,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

