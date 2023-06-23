Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB773B946
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 15:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8AE210E639;
	Fri, 23 Jun 2023 13:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A00F10E636
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:53 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b46cfde592so11747681fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
 b=q+ZyBpmyhuyc25nWzqH1Dk5rVnnWe0eQx/nyNbjEOc/S+dfy5vaYogknY2DlyilbJb
 u5ipwptC2Dg9+BuU50sXgvpBLcJh+aFLwpq0pymj5ZxcRSATFrDUfKXWjiPblzescA4Z
 7z7r+z3vmIwuAHI0OCEgxxALIJAWCzkMSYoYi3vv4Q/NywTzVrHG77QiquwNXV4NAaqS
 3nldkwkp5SVipij8ulOVBjbNMT1DBznIa76PHBfJ0WZ1FSDe9qX6dNldcz1AaZ1szKYf
 +5f9iJHOSCsfu2QzC0K8GgRRBJDJXfSlTjHlmOFI2fqkWj6vL4UHhitknZ2xWN4CjzYL
 qhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
 b=lLhmy55K9mQXdWv6csK+HyR2FOF585b+XR3K4IJ6r12UYWV7Gri5ZJ5hqBOb3bnHco
 iVahw9c/1KN7ojaM0sd1OAhKmkAlLmjxXnRfdYAvh57MgsnOvM8wnDKcUOb2rhaZw3p0
 WygW3xUETA+nDSl+jUxPskGRpYg9stfoHHq8PXnyApQjG3uv0xO8uukUed/aEULTm9IA
 Q9jodSKWZFmhA12yB5hECXZXeoAuELRnvTPpBZ0lhgT4NkNyF36A2tv9iLnRtcU9Z/6c
 gnyVQmdgruCRyZaPSOKK1e7bqT4FESF+j5Aw1Vc9FPj4KOI2pwM/kvZ//1yH2kBoMmB3
 M/aw==
X-Gm-Message-State: AC+VfDx07SGDjsEbQWF3cUp8BkTvHfS5nQS3goPWdrIDrk7qklcJZxan
 PDWKfKS5/tFHHHkqq/qVn5B5kw==
X-Google-Smtp-Source: ACHHUZ58IYWu7lfIl+m1ZAVDlZZMIh+cPGMjvUYIBqVFBhg0bbrQg5EqvV0R5VePLacmsorTaVXWgQ==
X-Received: by 2002:a2e:3005:0:b0:2b4:79c3:ce03 with SMTP id
 w5-20020a2e3005000000b002b479c3ce03mr10022984ljw.53.1687528731599; 
 Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 6/7] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Fri, 23 Jun 2023 16:58:43 +0300
Message-Id: <20230623135844.1113908-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8dae416d2dc6..7cb9ef940225 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -271,46 +271,43 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

