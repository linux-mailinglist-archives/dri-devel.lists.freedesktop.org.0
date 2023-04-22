Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A56EB632
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 02:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF3410EF27;
	Sat, 22 Apr 2023 00:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D569910E107
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 00:08:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso2436235e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 17:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682122122; x=1684714122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqzKGmpEa9YgXCrEjhbfAJ1G4yHZKuSvvMJy3I8BheI=;
 b=s+6hGiaMgKYLk9ph9eSgZQWTq6OMcddcVSyuA+c/gEQq87LmruZXK5pm3/bBttbCZl
 trp3AfqiBGWmQfXeXeKR3ZeGSqshlY4rkIDWwTKTtlP+HorqZG8sgGQ/yrRstmMPiobU
 Qm+cFBak9/yr3OoHq7yK8uPISV3y/ZDc5Pi3u1oonDxlH2U+PSMuHSNQ8X6vTNUG5l4q
 TxpR6DZjQAKEHJ3AyeHlSBTbhzXWQb8UmknDAiCRDDsWWXhQ49y9q1wmjnYxD9lmdnrF
 wEicvKcI4YQHkV7gFIETMkpo8VHFHgwceKjLGjNKFtEqbLaO2xuLr1IS7F3YV0eh32bI
 ncmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682122122; x=1684714122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqzKGmpEa9YgXCrEjhbfAJ1G4yHZKuSvvMJy3I8BheI=;
 b=CCQpGvjSyfTJGTCdWxPPxM6anuVndW1m42LsL3UFqRXHSZXmhOJssum3XhBq1TBunH
 Zkhgx9nkAhJe15kEM1Y/hCnGHHB2fEWISF0ikUjpdnoC/mwusIkTFDl7Mt641Gc3Rrbe
 PJmbFJfIIOmfjZQPTMsiMIT+vEQPTjg8wGLXwGh4reDt0dxMDNlXiBzDzKXegfyKznDV
 92ZZrRdRG2T7GJrln+fT2BK45qF5jz6RzKm5YeMkCmTTVcK5vCZ8WeBZ7Hxe27awLSkl
 NhdgFbDJ5gYSs3U5n5fREtptHsz458/Cgc3Ylk0xQRf/sYeA2yNlUxAOFtXWx3fGc1ea
 lgTA==
X-Gm-Message-State: AAQBX9eqkfC+CvxjLbjkBlUfR0bvP9PAu5Q0b+wrNvVjv0OLYFU5IPpA
 DCgAjwDZ0b/yEScFuwGF5+1fvA==
X-Google-Smtp-Source: AKy350ZjCAsrpzZU3zYUlmE1SqN1cKob4T+WiIQaWIvWiXDJPnfzGcZbzFgPZ3xleGNCBVuGQdeUtw==
X-Received: by 2002:a2e:9e15:0:b0:298:ad8e:e65 with SMTP id
 e21-20020a2e9e15000000b00298ad8e0e65mr1095158ljk.21.1682122121930; 
 Fri, 21 Apr 2023 17:08:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a2e9cd8000000b002a8bce7ce0dsm744681ljj.107.2023.04.21.17.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 17:08:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/dpu: access QSEED registers directly
Date: Sat, 22 Apr 2023 03:08:38 +0300
Message-Id: <20230422000839.1921358-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
References: <20230422000839.1921358-1-dmitry.baryshkov@linaro.org>
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

Stop using _sspp_subblk_offset() to get offset of the scaler_blk. Inline
this function and use ctx->cap->sblk->scaler_blk.base directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 27 +++++++--------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index fce135f010d4..22c59f2250be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -149,11 +149,6 @@ static int _sspp_subblk_offset(struct dpu_hw_sspp *ctx,
 	sblk = ctx->cap->sblk;
 
 	switch (s_id) {
-	case DPU_SSPP_SCALER_QSEED2:
-	case DPU_SSPP_SCALER_QSEED3:
-	case DPU_SSPP_SCALER_RGB:
-		*idx = sblk->scaler_blk.base;
-		break;
 	case DPU_SSPP_CSC:
 	case DPU_SSPP_CSC_10BIT:
 		*idx = sblk->csc_blk.base;
@@ -195,22 +190,21 @@ static void dpu_hw_sspp_setup_multirect(struct dpu_sw_pipe *pipe)
 static void _sspp_setup_opmode(struct dpu_hw_sspp *ctx,
 		u32 mask, u8 en)
 {
-	u32 idx;
+	const struct dpu_sspp_sub_blks *sblk = ctx->cap->sblk;
 	u32 opmode;
 
 	if (!test_bit(DPU_SSPP_SCALER_QSEED2, &ctx->cap->features) ||
-		_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED2, &idx) ||
 		!test_bit(DPU_SSPP_CSC, &ctx->cap->features))
 		return;
 
-	opmode = DPU_REG_READ(&ctx->hw, SSPP_VIG_OP_MODE + idx);
+	opmode = DPU_REG_READ(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE);
 
 	if (en)
 		opmode |= mask;
 	else
 		opmode &= ~mask;
 
-	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_OP_MODE + idx, opmode);
+	DPU_REG_WRITE(&ctx->hw, sblk->scaler_blk.base + SSPP_VIG_OP_MODE, opmode);
 }
 
 static void _sspp_setup_csc10_opmode(struct dpu_hw_sspp *ctx,
@@ -416,25 +410,22 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
 		struct dpu_hw_scaler3_cfg *scaler3_cfg,
 		const struct dpu_format *format)
 {
-	u32 idx;
-
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
-		|| !scaler3_cfg)
+	if (!ctx || !scaler3_cfg)
 		return;
 
-	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
+	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg,
+			ctx->cap->sblk->scaler_blk.base,
 			ctx->cap->sblk->scaler_blk.version,
 			format);
 }
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
 {
-	u32 idx;
-
-	if (!ctx || _sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx))
+	if (!ctx)
 		return 0;
 
-	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
+	return dpu_hw_get_scaler3_ver(&ctx->hw,
+				      ctx->cap->sblk->scaler_blk.base);
 }
 
 /*
-- 
2.30.2

