Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F67BAC03
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665DC10E409;
	Thu,  5 Oct 2023 21:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D184A10E4A8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-503397ee920so1827222e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541229; x=1697146029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=wNHAAUiJd/yel9N12KGmUftqttSeG4QK2cw5iJb1yK5bCHv/0K7Eg/H8ArmSj1UQu9
 W41JIGape6ko5S19nJk1Gry1Tf+n1N/eePaKWq+lRC8j+78ong6AEtTqYUinCjk8HrcS
 IPHU8dxHqw3vxJs8E5f/kcWhxirY5slysW9bRk9q2dEUW3PJzQTj+xqfpVHERyQY2Qv4
 f2IQqBN3sd82r8uhZFUL4hRGMHNFS7pTFQIqGKSuBDqynslc6yCrT51FKqCTv+2+JmwE
 ztq844bd+YWVJjL2gBXjgej1qsYOLJdTd+TIdORbalsiWT2W2tq6wSH9hnnywVV0XR3o
 hgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541229; x=1697146029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=Gq5ebp99mdgnPPkhWSw8rNVT/8OiFGNz6OI3wq8HjCHJLHKutNJV+40AWQMmYP7RRl
 WbX9i1T9gx0sUJL5X9G9pAXrn7fw+J29BIhGcq++0E7addgkn+F0FBo0HTKbhwl4jNz2
 Vs6KkJtFbC4o6mMOFuWuELYKgRBajr0J5tPLztDNewZus/LdX5SfORmk4GPubHvE15iY
 yWrWjrmUQfCee6QTXL8j8yfzEYLnZhqvHp4qlPrTBOpCs2dNxaVW3T4nAw0I16yc4mP7
 ymGnneeCPP4drzd8+0gqz1RtGYtPGaavw5k4bNrIfXT73S7Qas17Fmr7IbhTptQo/dsi
 muyw==
X-Gm-Message-State: AOJu0YwSiQ+3cXJr8+IB8lbFUQtvZOmQ7wQSiJuIGZjHq+nLF/GQbMor
 AgbykZzf7sDy6SQrqY5fYFlUwQ==
X-Google-Smtp-Source: AGHT+IHyWaHI/ccMpMsiZJmgLT39m4mhrH8iEHE1/oJOIFRMc9jb/U/tw82wSvsr5Nrd2WpxJ9ZDFQ==
X-Received: by 2002:a19:910d:0:b0:501:ba04:f34b with SMTP id
 t13-20020a19910d000000b00501ba04f34bmr5308420lfd.44.1696541229128; 
 Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Fri,  6 Oct 2023 00:27:00 +0300
Message-Id: <20231005212703.2400237-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
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

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 19ab36ae6765..fc5027b0123a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,49 +252,51 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision, on QSEED3+ platforms this is the value of
  *           scaler_blk.base + QSEED3_HW_VERSION registers.
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

