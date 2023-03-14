Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17B6B9989
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAAD10E849;
	Tue, 14 Mar 2023 15:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4796C891E1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:53 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id h3so16423302lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33Uz6ukfxujAHIUon1961ksLYKkDkn39ZsTBVLn6xD4=;
 b=ypMGKG8O4W5Zk1TkHFvu4VHl+Z9ZKLNw0BzVYtj+ROCFFygVof6CiUKfogPdRnrfUN
 k6GH/hpUwYJbI7ijcJvosXOgpCNLSzXQtc+x+S4GPu2tun72DgpmjJarPvfbpiFs65Ur
 LGph5nos4nxt2pSYlWGEgeQK0udu6tUgpdK/jY6X7vY23rkR+UggsGwL/VncPZowXT+H
 ZGqt1Cds1TwVg7uD3dZ+gqgNz6R+jsy6uz+Vjba09IRpODOIGa73EHog+89msWfD1/sP
 F94vDOOOzVlbqMD+YEyLWy+5FVH/MptBPOx8ZGKK58M1Ly/9G7w2CU7sl8bI9PVwvIEf
 BjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33Uz6ukfxujAHIUon1961ksLYKkDkn39ZsTBVLn6xD4=;
 b=iGBOA8tvSufNzmV/Ab5fEwRon02Ts1BnHl4Qrka0ErDJKKWKnq1bG7w5RYn/j6A7Ee
 wUbo2GZGMTh1Gm2RtotP1w2fdtrEIWSw92uzMuVlIAGtz8mU39JNyqtJTpRdEzBhaVRR
 rVC3nxWDK8VKXJh4C2lq9Y4K7psF94FMHLocsZGz+fSUeASyQfPlGG6MsNK/hC27GyQQ
 qOhWScwjDTOXomQCkw+mSL5ghhTNTEF1e/nVqnFqYvcnzNGxRcPay5njBTnc0y7Q92H5
 7adj97hI5I7f7ylwgJ/IyIu0tL9MHvqejRfky9NkdmAKa1qu7kOU3AcOLGWH/I4Lxcp8
 F/Cg==
X-Gm-Message-State: AO0yUKU6pI7sSuPZylNy0yB5NQ0x8WvjJNEibanM3GpYyb9MjcXtvhIS
 5hAqn6dFXkQ1fgJ8dAj6j/IQPg==
X-Google-Smtp-Source: AK7set/CM5wQjLbHzpnit4hIGklA1lsVoLw8qhpQD/iKJGSotby3KVIURZPcIUfHleHywiHXPlQh+A==
X-Received: by 2002:a2e:92cd:0:b0:295:b0a8:951f with SMTP id
 k13-20020a2e92cd000000b00295b0a8951fmr11670584ljh.27.1678808152855; 
 Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 09/32] drm/msm/dpu: pass dpu_format to
 _dpu_hw_sspp_setup_scaler3()
Date: Tue, 14 Mar 2023 18:35:22 +0300
Message-Id: <20230314153545.3442879-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

There is no need to pass full dpu_hw_sspp_cfg instance to
_dpu_hw_sspp_setup_scaler3, pass just struct dpu_format pointer.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 9 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 4 ++--
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index a1492a7e43ce..3030cd3b253a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -419,19 +419,18 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_sspp *ctx,
 }
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *sspp,
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
 
 static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_sspp *ctx)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 5903413256ea..136b8713943f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,13 +317,12 @@ struct dpu_hw_sspp_ops {
 
 	/**
 	 * setup_scaler - setup scaler
-	 * @ctx: Pointer to pipe context
-	 * @pipe_cfg: Pointer to pipe configuration
-	 * @scaler_cfg: Pointer to scaler configuration
+	 * @scaler3_cfg: Pointer to scaler configuration
+	 * @format: pixel format parameters
 	 */
 	void (*setup_scaler)(struct dpu_hw_sspp *ctx,
-		struct dpu_hw_sspp_cfg *pipe_cfg,
-		void *scaler_cfg);
+		struct dpu_hw_scaler3_cfg *scaler3_cfg,
+		const struct dpu_format *format);
 
 	/**
 	 * get_scaler_ver - get scaler h/w version
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6ec39f937042..8c98385303ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -677,8 +677,8 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
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
2.30.2

