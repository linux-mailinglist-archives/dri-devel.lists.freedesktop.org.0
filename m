Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980306F2AC7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5AF10E0A9;
	Sun, 30 Apr 2023 20:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63C10E0A9
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4edb26f762dso2307788e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888233; x=1685480233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMoajvygLpHN0tJCNypWoRhLDvyZjkn9k0Ux5UMBZj0=;
 b=nWldz1WKP5mFdBSBHfAEK085rVYocoobKjLZX4YQn1lsQ2cVYwlVPi3OKO5c9ALrSn
 EJ0nEgmZxKfsgPC6mg+801ga7hVtsy2bAAS4ITAoiGs1srM4zZKuCtV/CN4q23zQuAyL
 p7x84jGpcs+HEa19QOTm4TKdrpw7DOwgGRT0sI4/Hj3WDwxCzdstS68n+GjLfFTdDe0b
 +sCbAD4wu5PdRgNmQeiS86XwAv1VTX/RJW+625Tb13/WaoGiZXHPIDKW0rLoRGi3MJx2
 kEd8tEGi2Uf6d6TPceIJ4GZgG5XIIpcpq/tmk/05V1hNl1OlmPwPsQyfOan/KH5G0xPU
 n7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888233; x=1685480233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RMoajvygLpHN0tJCNypWoRhLDvyZjkn9k0Ux5UMBZj0=;
 b=M4ljh1LQKsUtcR5zr+4LH6yN9R7wq/yEKxp6yq1qoLYw3yMaEL41klzRx0Ea/MH2+C
 mVh96kwc3KhdkKzWPPbintXI20TAcYJYP4mFPzmdS9GFLkaO8gyyjn6OQLN464OvH+xJ
 kZJvTFrD+Ah3QrY1ZOT2SH0iBplIbPx9JXiff0xkYC/hTAESU/gweaM+pnDMjWYMFc3k
 lak/uooLfnrIl7AfSHMil/25P/dHRsATDCP0AVyHoZQ0mkgzCqXawrEg3rNBMAVvAUOQ
 waKq9V2UyPyxsMkuL+hpsGNUSmZFpOvwke3Ep7DXn4ll90AN8huVpFWup5fpRHbegMeo
 eWrA==
X-Gm-Message-State: AC+VfDxOx9ONIo6VbioKW6MLZbg9n/h3inMMTOoz7qwzMlyQmuSx4YAj
 PjGUWlK4RYHzIpMaIw9bXe9p6g==
X-Google-Smtp-Source: ACHHUZ5K3Ytg3QVRPnUnd31crBnmsRBI7qqbKV2zFwbBkzVp1eqvWcBAzLzZgc6iaS4hhfVt+wpr/Q==
X-Received: by 2002:a05:6512:401:b0:4ec:85f6:5bf8 with SMTP id
 u1-20020a056512040100b004ec85f65bf8mr3647367lfk.8.1682888232695; 
 Sun, 30 Apr 2023 13:57:12 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/9] drm/msm/dpu: fix SSPP register definitions
Date: Sun, 30 Apr 2023 23:57:02 +0300
Message-Id: <20230430205710.3188230-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

Reorder SSPP register definitions to sort them in the ascending order.
Move register bitfields after the register definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 66 +++++++++++----------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6b68ec5c7a5a..1bf717290dab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -26,45 +26,18 @@
 #define SSPP_SRC_FORMAT                    0x30
 #define SSPP_SRC_UNPACK_PATTERN            0x34
 #define SSPP_SRC_OP_MODE                   0x38
-
-/* SSPP_MULTIRECT*/
-#define SSPP_SRC_SIZE_REC1                 0x16C
-#define SSPP_SRC_XY_REC1                   0x168
-#define SSPP_OUT_SIZE_REC1                 0x160
-#define SSPP_OUT_XY_REC1                   0x164
-#define SSPP_SRC_FORMAT_REC1               0x174
-#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
-#define SSPP_SRC_OP_MODE_REC1              0x17C
-#define SSPP_MULTIRECT_OPMODE              0x170
-#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
-#define SSPP_EXCL_REC_SIZE_REC1            0x184
-#define SSPP_EXCL_REC_XY_REC1              0x188
-
-#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
-#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
-#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
-#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
-#define MDSS_MDP_OP_IGC_EN                 BIT(16)
-#define MDSS_MDP_OP_FLIP_UD                BIT(14)
-#define MDSS_MDP_OP_FLIP_LR                BIT(13)
-#define MDSS_MDP_OP_BWC_EN                 BIT(0)
-#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
-#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
-#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
-#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
-
 #define SSPP_SRC_CONSTANT_COLOR            0x3c
 #define SSPP_EXCL_REC_CTL                  0x40
 #define SSPP_UBWC_STATIC_CTRL              0x44
-#define SSPP_FETCH_CONFIG                  0x048
+#define SSPP_FETCH_CONFIG                  0x48
 #define SSPP_DANGER_LUT                    0x60
 #define SSPP_SAFE_LUT                      0x64
 #define SSPP_CREQ_LUT                      0x68
 #define SSPP_QOS_CTRL                      0x6C
-#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SRC_ADDR_SW_STATUS            0x70
 #define SSPP_CREQ_LUT_0                    0x74
 #define SSPP_CREQ_LUT_1                    0x78
+#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SW_PIX_EXT_C0_LR              0x100
 #define SSPP_SW_PIX_EXT_C0_TB              0x104
 #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
@@ -81,11 +54,33 @@
 #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
 #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
 #define SSPP_TRAFFIC_SHAPER_REC1           0x158
+#define SSPP_OUT_SIZE_REC1                 0x160
+#define SSPP_OUT_XY_REC1                   0x164
+#define SSPP_SRC_XY_REC1                   0x168
+#define SSPP_SRC_SIZE_REC1                 0x16C
+#define SSPP_MULTIRECT_OPMODE              0x170
+#define SSPP_SRC_FORMAT_REC1               0x174
+#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
+#define SSPP_SRC_OP_MODE_REC1              0x17C
+#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
+#define SSPP_EXCL_REC_SIZE_REC1            0x184
+#define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
-#define SSPP_VIG_OP_MODE                   0x0
-#define SSPP_VIG_CSC_10_OP_MODE            0x0
-#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
+/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
+#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
+#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
+#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
+#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
+#define MDSS_MDP_OP_IGC_EN                 BIT(16)
+#define MDSS_MDP_OP_FLIP_UD                BIT(14)
+#define MDSS_MDP_OP_FLIP_LR                BIT(13)
+#define MDSS_MDP_OP_BWC_EN                 BIT(0)
+#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
+#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
+#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
+#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
 
 /* SSPP_QOS_CTRL */
 #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
@@ -96,6 +91,7 @@
 #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
 
 /* DPU_SSPP_SCALER_QSEED2 */
+#define SSPP_VIG_OP_MODE                   0x0
 #define SCALE_CONFIG                       0x04
 #define COMP0_3_PHASE_STEP_X               0x10
 #define COMP0_3_PHASE_STEP_Y               0x14
@@ -107,6 +103,12 @@
 #define COMP1_2_INIT_PHASE_Y               0x2C
 #define VIG_0_QSEED2_SHARP                 0x30
 
+/* DPU_SSPP_CSC_10BIT space */
+#define SSPP_VIG_CSC_10_OP_MODE            0x0
+
+/* SSPP_TRAFFIC_SHAPER and _REC1 */
+#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
 /*
  * Definitions for ViG op modes
  */
-- 
2.39.2

