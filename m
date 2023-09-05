Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5B791FE9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 03:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64BD10E168;
	Tue,  5 Sep 2023 01:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8310E159
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 01:25:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-501be2d45e0so204419e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693877131; x=1694481931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
 b=WF8g2nSm+d3oXRhz+75JaEy98jvLFCS2Kd2vwZYDJMKOeBYHgxZOUoYddmKb1syt0c
 uIcQWKKWojQqKLvjUI6GFVfQFAqMuSDO0NfTm6sTdGeoXq+J3T8w2TYNCAxHZvI1lHo2
 01LuBsskEaGzr9RfL5L0nibHYBmVUiNdleUGIKwMMW27thJFYHTxO8/yR0kJ+L8FJtUN
 tnFVOPVvDGdfRbvaKWmKkCwXIWWpucJwZLSIR7Sk15kkshtNVcyE3cT4SDWM9MZMO1Vn
 3Qp3iDwyqUJr9+zss9SWO+Nthi80IUcYAfM3rluhaQPV+dO6p9gyUkjLOl5BDA0pFMui
 Ox4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693877131; x=1694481931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGlYJLkkOgxNz4bfpPlp5tACOS3Ij3+hEy/bbry5T2w=;
 b=YnOWJ2vKA1+A3WjoSGY6+LnGbBOmsDPg86BPcL68UZKG22mB3HOfy1oZGC1sJhCZCg
 ktoBaeIOMSYBieTugmrXOscg5KzIdixfBeTSp93v4cutLzqs7g6m1l62XUkU3IcPHVLY
 z0OSUNV87JIY/8aDYlx3mTTAbka1/EJV+4eF61GWyKLxm157KUxumuSi285q5U126oW9
 uIhINWL54brNHS21qvPdei1LfADqMrpVt9pw4ZaphTqfd8z+oYD6J/sPPWOIdn5x8snP
 MIQ3yTl9hZj5KDtffLsaQOXDbCgzbBwp17gmNV5Sjnpy8zfAs6Z7TEFh+nQokAaeDMwD
 yUdA==
X-Gm-Message-State: AOJu0YxF1PB2+a3P4ekj6qKSru3ovEyakUf0zktqr2FVJrDp4UtQ+vPX
 hrmVT0DZy5uReRyjV2WpL8qjBQ==
X-Google-Smtp-Source: AGHT+IGL7XrtBeVMSH/u25G0DwjYX0kSPFOOiD+xcYJ7PSXAlJXrEyGz446CtJl5o20jIkQw2iJf5w==
X-Received: by 2002:a05:6512:10cd:b0:500:a2d0:51ba with SMTP id
 k13-20020a05651210cd00b00500a2d051bamr10609443lfg.44.1693877131664; 
 Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25599000000b004ff70c76208sm2062369lfg.84.2023.09.04.18.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 18:25:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/8] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Tue,  5 Sep 2023 04:25:23 +0300
Message-Id: <20230905012526.3010798-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
References: <20230905012526.3010798-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7c08bbd2bdc6..63716ff5558f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,48 +252,50 @@ enum {
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
  * @version: qseed block revision
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

