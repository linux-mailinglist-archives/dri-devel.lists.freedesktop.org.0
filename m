Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02948017F6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D513F10E9A4;
	Fri,  1 Dec 2023 23:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B98210E9A4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:40 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bce40bc4aso3303422e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474158; x=1702078958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXbAhojeI+fUtg6mFyEjoNq+jzX0r4+D5xAOsA5mePQ=;
 b=V1NtkZe9SNQ/JWmhtLypKWDz9wLLY2C8/fIAXa7ykEN+HW4QGhBgWDDoUrbx7kP/Vz
 xIrlDxd/wFreaIcpoAKF9bODFEXKmZhwKKZFDCjgJw0r8CpQ2+KICgonBf/Zwu1jwPqF
 tqYfSnltkYW+X819fXlbYCPVC7No6pzpTBdBDfvVHd0TnMeiuI1fh1gYT0ostWnOfgfZ
 zQ6GySminZp5SfFhkAw3qU8LtH7ZpjHs7YDvIpOTocuB7qt8TCmAfr9gJvGPOBz8Jx4a
 C2PA/J+wLlo1oE8nRYh/dSnkDH+Gx7g5TqB9n3BDlLaRJaJeIhkunD3ZRWXVUmcqfABA
 e9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474158; x=1702078958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXbAhojeI+fUtg6mFyEjoNq+jzX0r4+D5xAOsA5mePQ=;
 b=q0U1vmUoOWO5sEbgCDBAuSIvXo1uDbHWWnArmyf5lYJmSxJKsrpTbxOLQgmpiwNacU
 K177+qtOP+xbNTIubigmZ6Zc/2lF1df9uHvIDPWvLGuX+I3zNVtBHeshwgj6ag738vXK
 Ig/GZl8cQLjhN6IJvhbOqzT0fkc7vqId/0LLe/rh4vlclAcqJC+J/SF/979gf/6jvwFf
 pPAG+WKQDkez5iKFl+/71qv0/v05bYESk5Y1Om4+52LMkV4HUURPzCnLGJUas+nNTC3Q
 jxU1mVwwaH0TegWNJGDP2SrwOt6a3CMC5jJ8q52m3GKiG5MLBC3c8A7cpsL/VD5fi+UF
 bVDw==
X-Gm-Message-State: AOJu0Yx2Xn7kub1NZzgDn1yNa0aXAnjoBv3EqVwbtZIApUwTc9ZWUmFj
 cfNGBfj44+IBmxGDq9Gm66KADg==
X-Google-Smtp-Source: AGHT+IEM4QUwYaz9ylBqvUWKUAHYhq19opcbnJtGN+DEamVYLow8uKxZUhwBrDQdCe6+DXHUIiRZyw==
X-Received: by 2002:a05:6512:21a5:b0:50b:d764:8038 with SMTP id
 c5-20020a05651221a500b0050bd7648038mr995703lft.107.1701474158346; 
 Fri, 01 Dec 2023 15:42:38 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 03/10] drm/msm/dpu: Drop unused qseed_type from catalog
 dpu_caps
Date: Sat,  2 Dec 2023 01:40:27 +0200
Message-ID: <20231201234234.2065610-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
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

From: Marijn Suijten <marijn.suijten@somainline.org>

The SSPP scaler subblk is responsible for reporting its version (via the
.id field, feature bits on the parent SSPP block, and since recently
also from reading a register to supersede a read-but-unset version field
in the catalog), leaving this global qseed_type field logically unused.
Remove this dead code to lighten the catalog and bringup-overhead.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 15 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index aa1867943c9f..4dcc9f804ac1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 38ac0c1a134b..03159d359500 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index c022e57864a4..4184c18d81f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index efee84c8dba6..bd91dcc791d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 94278a3e3483..885a2bec8258 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c0d88ddccb28..c9d1f1292b3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 57ce14c18def..320b8f23364f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 62db84bd15f2..6c6bc754aeb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -11,7 +11,6 @@
 static const struct dpu_caps sm6350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 5a3aad364c78..77703f663e25 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -11,7 +11,6 @@
 static const struct dpu_caps sm6375_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 1709ba57f384..4ca1aaae2fb4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 15942fa5a8e0..42bb47181ba1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2400,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 1ccd1edd693c..6da122df0b88 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 85edbb737807..70599bc56e58 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 69b80af6566a..2b5b342ea0b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -10,7 +10,6 @@
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
-	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.has_src_split = true,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 62445075306a..1bf2d2d64f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -342,7 +342,6 @@ struct dpu_rotation_cfg {
  * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
- * @qseed_type         qseed2 or qseed3 support.
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
@@ -355,7 +354,6 @@ struct dpu_rotation_cfg {
 struct dpu_caps {
 	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
-	u32 qseed_type;
 	bool has_src_split;
 	bool has_dim_layer;
 	bool has_idle_pc;
-- 
2.42.0

