Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E5C4AF84C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03AB10E50D;
	Wed,  9 Feb 2022 17:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C7010E435
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i17so5511797lfg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dEJPfPx0nYAq+fkrBMQ8Y9lHlDnWeG3gMpqCP1BAOBY=;
 b=SuLKaj6Bw1efVxvbR7EBnT6VDupFpsmXnt7irI0/AFj7KorqK4P+qXyaQf/R9hPJ6s
 uIm926kW60swva4kr9H3klMQpEbyWmzlssWyfATZYe92L93YDYcm2fOvallJL5CqV3XB
 W1nkhTaIBnaw/JRhHAMG+ByZy/JvaQd9PC7EraBr3LcDD3I+HfbSpGOicsvh86k85YNd
 wRY/ksW+GH7kqzqhZ1yShE64FzDpyM5oTk/PNgXLzwbkxS4WG6+g1y0phEoQkbtOXYvp
 CtDwzQVCCT638tZJbWLSeXg5bcKmWGZLAhmGlo++6UjFuXgv6sN8fNkH/zq9c3aPlqTf
 HExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dEJPfPx0nYAq+fkrBMQ8Y9lHlDnWeG3gMpqCP1BAOBY=;
 b=TRM9vOarjC7yK5chgGSED3IzPVWWoPpGnnsLnB3SAmtmqgAV84nlFomi0OoW6+Nc9K
 1ovXjVYgn4979IzJdtLi6RQC8lOFlTy1duyWAaowGvArVPPROqwQwIOoZTxlT6bRwdCt
 wghwBQ80XF6dJpdjud5LNvSddbWEQX8Ua6JCWA5q03Qt3WDDDnrg301Bt5ctPuRZk1sb
 D3lg4QmYBCqD/6ePb7iIMklLMObuFwT36jWZWQgz9jtSESkkjwCIMT6JAf8ZYdO7yRsR
 FCO6QoJeAaSDCt+fWtx6BveKubhCRmP8ticSZU4s+ayciDrP4Mxt2XbLPprYTsj1kCNq
 TGSg==
X-Gm-Message-State: AOAM533wYPt529j3yljEMUyyNFdnxKdUKpGQadcbvlkl7Y+jlg6ehloj
 HDlqZBq2O7aY2/o7mnWEPaeuDg==
X-Google-Smtp-Source: ABdhPJzklp3OMmnXSVsNAdGMPJUqnRf1QM921ImCr8NYuUOHdUKPC2BBlYKLgcuLIcLvFpWMPyssiQ==
X-Received: by 2002:a05:6512:3d8a:: with SMTP id
 k10mr2246953lfv.141.1644427534236; 
 Wed, 09 Feb 2022 09:25:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 13/25] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Date: Wed,  9 Feb 2022 20:25:08 +0300
Message-Id: <20220209172520.3719906-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to pass full dpu_hw_pipe_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d8120168f974..7194c14f87bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -415,19 +415,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *sspp,
-		void *scaler_cfg)
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format)
 {
 	u32 idx;
-	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
 
-	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
+	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx)
 		|| !scaler3_cfg)
 		return;
 
 	dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
 			ctx->cap->sblk->scaler_blk.version,
-			sspp->layout.format);
+			format);
 }
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 74171fb4e585..eee8501ea80d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -334,13 +334,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
 	 * @scaler_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
-		struct dpu_hw_pipe_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3ce7dcc285e2..e9421fa2fb2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,8 +646,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 	if (pipe_hw->ops.setup_scaler &&
 			pipe->multirect_index != DPU_SSPP_RECT_1)
 		pipe_hw->ops.setup_scaler(pipe_hw,
-				pipe_cfg,
-				&scaler3_cfg);
+				&scaler3_cfg,
+				fmt);
 }
 
 /**
-- 
2.34.1

