Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B590279ABA5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 23:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3110E363;
	Mon, 11 Sep 2023 21:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33F110E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 21:45:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50098cc8967so7929916e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694468728; x=1695073528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20jjjrUd+N4gzk4ksBEuuWe9UZd9AtwfGIVr9t4iq9Y=;
 b=FWf+VujyURsF3xhCAcpTIyHldU8MK4Tdg5lcgr5px9Z8y6kyBrlfxuD/r/Ia6rKMXc
 ELdg60dJFgJxtFETirblazVmak3cl2RZocVvqOkDRFPjyd+rrPvAqrD7b5raPQ4pw9Vp
 G8ki+oyM90SIXOPWfvYgboiMNWItZ1O/WGvhXtB6/UPazWJaR1oc7mwBaZbLEbpWWZhl
 54ErWHewYgfr3l7ofBNPfkKXovqj5C3y/I1cthtRB7PKh2FJ4u5hRrN+YH0cWyuAEw0z
 brFkIyFJTj3sh5s8CCTV+N3t1vGOPniMbqKxVP+Wg4V2a40dV5+AhAwH9JkQ1nX3WDhi
 I7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694468728; x=1695073528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20jjjrUd+N4gzk4ksBEuuWe9UZd9AtwfGIVr9t4iq9Y=;
 b=L4p4eazNs1brQaii/+dGxHvkq2p8Pcacv3LCW1pzYHMAZ19VhyC5hxXeLznN8D3gvE
 hchXERNVXc2sY1yWJK4mTYnqmDzb3wiFW+xPdh/n93ZdMjY+/D5cya1l4kxD64h0bMlb
 C4l3NFcHleKfDMvSwC9amBIJb4nLFYZwA9g7SmzYSxQGiWeGNNkVBWpHgtszyePRJGuU
 8VHKZ/bh8BZeL6spUnsne4l6o6PAPnGdWuO1OHI3fZivqapQddjyG96WtXqxbzeFQm40
 ghj3205a+ErfUevbmTu3adKbAZ8cr+XmA/v/hwbNNbTztzC7gfPnnJGGjooo2HTBFiR9
 Zxew==
X-Gm-Message-State: AOJu0YyljqH1Hwk727PCy9PXGXU8RfTJgZ7Rp9bmV9ar8G1hEhpaut9y
 C9oiXtxKkXRWV5RSq69oMfGbnQ==
X-Google-Smtp-Source: AGHT+IG3KSVpIhA3IPSJgajfgTp9wy5RAuXsZWVwqay7IgqWH7mGAYBH+oCOwkDCRo3IC1TZyblxhQ==
X-Received: by 2002:a05:6512:39cd:b0:502:9bb6:3abf with SMTP id
 k13-20020a05651239cd00b005029bb63abfmr10465463lfu.60.1694468728212; 
 Mon, 11 Sep 2023 14:45:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 14:45:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 7/9] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Tue, 12 Sep 2023 00:45:19 +0300
Message-Id: <20230911214521.787453-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
References: <20230911214521.787453-1-dmitry.baryshkov@linaro.org>
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

