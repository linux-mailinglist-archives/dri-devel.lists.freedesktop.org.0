Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7928017FD
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294210E9A9;
	Fri,  1 Dec 2023 23:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3BE89861
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:42:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bc053a9a7so3974723e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701474162; x=1702078962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
 b=oAEl0L1NFf/dhbMCilRQA0bqgDYRU2+xqRc0Rv91VJQAcnFArE7w8dHbwhFKmal7lM
 UIqIDiRAH3qrXsHr2V7QZvKqU4WVQL+cVC+DY5moD3p81SmsmV+GW0G6jtZnCMiAi/sN
 LF6by2go5VXtj8MbnHk4SpFUMv78EO2RAV7pRYZKohUeIqFVEc1YY6Puy/qFLJRPt8Al
 89fUEUVLQa8CVpEFE8cFBqx/6UDqggbLiZMNYp8oKZ/p+Z/O3GBPffLWKl7lDYUgsSWF
 AXeYAoMmVam+VWAyPy6+u/+haEI2st7LOFheTnjfjjr7H+M8U3BaTQs/i1MeFnTaR2j3
 lk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701474162; x=1702078962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okC+c6WIs6pU2KoWIiH8mBiVykqcI/UkEjsDZ2vTjXs=;
 b=ByKz8h2+waIWpIyMV79CWRKU0SeF8DHwjcNm0nOtQRZf620cEmkdvSPVQ2yP0VnF/4
 YZqMIRui66mo3aOylc7U0Kj/ZKVi2L4Qy1+76i4WLm/w7CN3A3BPkqWFQzCRvIV6xwFp
 LZi4I8qnG8dz6eBFHjWReYbWcC1yJP0ubKXsoMwQoP8eiAoxZ3Ig2aktgBaC+m/j9VDv
 sJznuD77VgfypOFPpKjd1aC1ZPXfBl7nqkQybOI+jNP3Zkqln1jF7iBqXI1dEbs53z0w
 WVl9OjpV9BS/80vNy353/h6nSp7s1EUtRrCKkr6E2522pmUuPkGm0ml34Me2Dfozq0ez
 Ghcw==
X-Gm-Message-State: AOJu0Yx6MjF1fnVfYEvP5dQTjh0ZzDKcCANUXBplZWHixEVqENUN5O67
 9PkXHYUaN9cNpEAkryjt3ntenA==
X-Google-Smtp-Source: AGHT+IFVxIG599B/qmVK8nvPueo1AL+dGV1zyGuHDAAkXVB6v+C59YW3slMPcO1HEuPyeEum3M3jDQ==
X-Received: by 2002:ac2:58e6:0:b0:50b:c88a:bca with SMTP id
 v6-20020ac258e6000000b0050bc88a0bcamr690043lfo.64.1701474162472; 
 Fri, 01 Dec 2023 15:42:42 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 m14-20020a056512358e00b0050803043fc6sm554248lfr.265.2023.12.01.15.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:42:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v7 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Sat,  2 Dec 2023 01:40:31 +0200
Message-ID: <20231201234234.2065610-8-dmitry.baryshkov@linaro.org>
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

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2a9b2cf2c05..f9586ddbafda 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -248,49 +248,51 @@ enum {
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
2.42.0

