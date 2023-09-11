Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8E479AB9E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 23:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7585810E1F2;
	Mon, 11 Sep 2023 21:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083CE10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 21:45:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5007abb15e9so8403898e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694468724; x=1695073524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fhx/zEsdyoBM9jBiOhMicCjevdxtXNPN6wAs5fBT/70=;
 b=vhis1udm1S1JFdB1RtZwh1VCswqPDNT8dEVpKDmIFWbmmC6Q4AWiWqe1POuRaY41Ju
 fgy4vNOnjED6+szjzrXa1GEHpUm8DftiZvglK6OWK+JAaQrQpv3DujUDqnmzzqxEnJJm
 KZvV3SDbDt6sONr46Xrs6Zhk4A/lmw8LxGIcu53gZtWPHqkSegE4tSbGptXmmo9UH8oI
 99+2Mu5QsonV9MGBiaNpjTnyo6muRjyaMaF9SsdshLo90yQ11RMScsUab/Xm/wEfDynj
 +GE0kYkL/FbKMbB+Oubl7sd2xiD1yZUZkirr+U7kkUEGa2C4YPqkojuRH3RrNuW0abXx
 u08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694468724; x=1695073524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhx/zEsdyoBM9jBiOhMicCjevdxtXNPN6wAs5fBT/70=;
 b=LvYDhlhIvvlEFJJuQu56bzUgRRYWrU+v6RwdKa1B5qPXuAMtwckE+xb16X/+GxscDw
 WOQRjxvd7WqtWPiIEajOCn7g2vSWObJDLIEqFUnL4AM2iSZ3kRFiAwJG2tD+AlghMvoC
 xg3I/+uWNssn8CtHvhwdMzGFtf+Wn+2aoCv8CWWxMxpTIJhVqplq/nmEg0cB0Ooh/dhZ
 kQonh/pX3jFdlRDXKWn5ATqx/BoUhkEfi+iIMSagk1XoprUJB2QS4HBVm7KR7opULjYQ
 Gc9jFEbgx8Jg/rtu1OX8ykQ7QDGMRfFQbIDLnBtne/q40xqWJpBBA3ZxILw4SJEUfbpP
 Oxgg==
X-Gm-Message-State: AOJu0YyjvMDxQyimrBI0zLgC2dvF7CytRTXpNQZgYb2MlKEVxbCtesjA
 ZdMgiu3gNRww9sR1ebwNkzsVvQ==
X-Google-Smtp-Source: AGHT+IGIhUPB5OLjdKYahENRlC7pH9VEBVQ9UQZTyZxPlCtlhkHYMOrX4vaP4+H5cQBOeskJNqMCag==
X-Received: by 2002:a19:e057:0:b0:4f8:6d53:a68f with SMTP id
 g23-20020a19e057000000b004f86d53a68fmr7705579lfj.64.1694468724137; 
 Mon, 11 Sep 2023 14:45:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a0565120b8500b004ff9bfda9d6sm1168804lfv.212.2023.09.11.14.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 14:45:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 2/9] drm/msm/dpu: Drop unused get_scaler_ver callback from
 SSPP
Date: Tue, 12 Sep 2023 00:45:14 +0300
Message-Id: <20230911214521.787453-3-dmitry.baryshkov@linaro.org>
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

From: Marijn Suijten <marijn.suijten@somainline.org>

This pointer callback is never used and should be removed.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[DB: dropped the helpers completely, which are unused now]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 13 +------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  3 ---
 4 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..7e9c87088e17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -394,15 +394,6 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 			format);
 }
 
-static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
-{
-	if (!ctx)
-		return 0;
-
-	return dpu_hw_get_scaler3_ver(&ctx->hw,
-				      ctx->cap->sblk->scaler_blk.base);
-}
-
 /*
  * dpu_hw_sspp_setup_rects()
  */
@@ -605,10 +596,8 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_SCALER_QSEED3, &features) ||
 			test_bit(DPU_SSPP_SCALER_QSEED3LITE, &features) ||
-			test_bit(DPU_SSPP_SCALER_QSEED4, &features)) {
+			test_bit(DPU_SSPP_SCALER_QSEED4, &features))
 		c->ops.setup_scaler = _dpu_hw_sspp_setup_scaler3;
-		c->ops.get_scaler_ver = _dpu_hw_sspp_get_scaler3_ver;
-	}
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..ca02f86c94ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -288,12 +288,6 @@ struct dpu_hw_sspp_ops {
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format);
 
-	/**
-	 * get_scaler_ver - get scaler h/w version
-	 * @ctx: Pointer to pipe context
-	 */
-	u32 (*get_scaler_ver)(struct dpu_hw_sspp *ctx);
-
 	/**
 	 * setup_cdp - setup client driven prefetch
 	 * @pipe: Pointer to software pipe context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 9d2273fd2fed..af4fb54f3c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -381,12 +381,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	DPU_REG_WRITE(c, QSEED3_OP_MODE + scaler_offset, op_mode);
 }
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-			u32 scaler_offset)
-{
-	return DPU_REG_READ(c, QSEED3_HW_VERSION + scaler_offset);
-}
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 1f6079f47071..689d06c7d740 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -340,9 +340,6 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 		u32 scaler_offset, u32 scaler_version,
 		const struct dpu_format *format);
 
-u32 dpu_hw_get_scaler3_ver(struct dpu_hw_blk_reg_map *c,
-		u32 scaler_offset);
-
 void dpu_hw_csc_setup(struct dpu_hw_blk_reg_map  *c,
 		u32 csc_reg_off,
 		const struct dpu_csc_cfg *data, bool csc10);
-- 
2.39.2

