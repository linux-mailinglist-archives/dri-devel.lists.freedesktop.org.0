Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9637BB8D5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35DC10E4F2;
	Fri,  6 Oct 2023 13:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA92210E4F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:14:59 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c3ca6ff5a7so1694221fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696598098; x=1697202898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=w6c3MBf7jJm1QQnPomoDsX3oLX4eL75/TYeZqcpZP64fwdYXbgux+BiKWepvvpXBsu
 MeHOdzWLgYxs/vTVsyttQvC29gfJic2RWOR4tEF7IqmnNDzyeftze6UIvRjWrPHbItY2
 B5gw9MHjr182U4sRoHANM/NZ8XB+TOM7HA7wS9uZtsO+IIqr35HVTg4By60uGihiAg1b
 bQxGrDEFhpfc42sZjuqEmfOZv0ZmIEOF15u72/yc/NMDLTvaPluPzYg76Tcr0jpiL/bL
 a0qDudPhJS262NzuitAUnTJB0p53loq1wQMOpzN02PzKUDvyhS9LkcN4eFW7O6Tj69EK
 dbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696598098; x=1697202898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=rTCZhRsqNlIJgPJk8qy4qGU6JfwyAz5jLbYwRYO1trVaQcVkb6pdgOtQVsJgmA7C6Z
 QPLoemF7x93gbvcLfnR3ZvRW2xT1A9zT/twjql0fypvIU6d3xWz03hex/wAyBrQ+8yt6
 h8rZSkn0BPCGr2v5v0Idf4pYXFXjAS0GIrj1LEseVIsuCLKbiM2/vm635O6zj++XchQG
 6gUmJXgNZ6VuHfWA2zs9TxXUZvizdQSN7IlbMLevsJCrhZEqd89dglUrqPqNmJgiDsw6
 dPN7w4xhFgQiyuYY84HddH6BKS28hczp3a3OR0HDu0+SCz5yhWvDhqGdMSq1ehDpNE2X
 OVsQ==
X-Gm-Message-State: AOJu0YyoZEByUYUMopsmbMyFz6Vfz9BBO8W3fkFWij9FXaLrYnu5aW4G
 rRcQHm1iaA2j7Jf11wdYpYNBVQ==
X-Google-Smtp-Source: AGHT+IEuGpQwunStAna/0FlSh6OhnJihhmODGHxngnzadM5uiN1WYGPNdJl/Uf8diykblnyD56W4qg==
X-Received: by 2002:a05:6512:794:b0:500:7cab:efc3 with SMTP id
 x20-20020a056512079400b005007cabefc3mr5765830lfr.11.1696598097818; 
 Fri, 06 Oct 2023 06:14:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 06:14:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v6 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
Date: Fri,  6 Oct 2023 16:14:47 +0300
Message-Id: <20231006131450.2436688-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
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

