Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E76A97DF
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D270A10E5D9;
	Fri,  3 Mar 2023 12:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB32810E5E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i28so3541649lfv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yE54hJ+/zsvYC9omTgOIlbE6Y7+e3/amY9hYQUn7qAQ=;
 b=VnFg1JeulCysIFhpMZlxOnavmHt/O9+y3Rty3mefWDwVD8Ijx7bP+UFWikdBJAPgSf
 qOce8xLhufbqx5SJy4sCMglhhdrP3P4BkKgTrFT703YDD1EEYb7yenvtQEawRVS+a3sr
 eEezNzvdEjxEk5Qb1GnMLaxa7xMSz1XsfTBqeSTAbvgzAj0Wm6o4re52MREWrz5/gwDt
 3N4z4zJA2FBfQC4mrmVp9vD+RHWklL0+GBzD9a9AhQleSaLx5lHN05UHVixIaNMFz5up
 AFnCYSxhUDoVRVqFAxQcNHhLqeVTq5B640TMyA9xt3fnbEfk0MJpFu+ewR9ryVJsgYvC
 7sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yE54hJ+/zsvYC9omTgOIlbE6Y7+e3/amY9hYQUn7qAQ=;
 b=PY293RxFc4yy7ppgp2g7eo1zKY+CwGU9RQS7tbqUFOByC9e2bVWwb7+ll5r5//jF+j
 sce82S+DA8tft5tTapkRjm08iIqqnp6IzpbU/cKmQwpQA/Rd4O5FP/IrbfDAqeo5/hRp
 /Pc94iDcOoSzO5Hf701FTKMqe4sCFs/7z8LHC17tb2imnv1sq1ayAByfJj+nooX+bCOG
 qbwyKdJSU1HnnO12XgwYz/PFTpcTivYEfO/OPMEuwq7FODWs+uLULklfpYXrb2nj5noU
 Gkn7w4pR/HL67B5nxyROQn8IAlGNFxv6h2kE3jE+20H9TjDq0rPRpcBFgB+KrAZ94b8M
 sE4w==
X-Gm-Message-State: AO0yUKUnwizi6L0qDniXmcJhHf6fOH5L6+7qADXf3UQbSSUczUqoWQQ5
 V5oOpY3R/DN/2Kom8aXZERoU8Q==
X-Google-Smtp-Source: AK7set8tychujIZf7ZQb07zUf1xMuD5B0sF8B20ifxpswBx4ZkegVxNkCfOt1BoZrAzRLFDKofXFFg==
X-Received: by 2002:ac2:52bb:0:b0:4d8:5de4:e3b4 with SMTP id
 r27-20020ac252bb000000b004d85de4e3b4mr513617lfm.1.1677848253392; 
 Fri, 03 Mar 2023 04:57:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 11/30] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Date: Fri,  3 Mar 2023 14:57:06 +0200
Message-Id: <20230303125725.3695011-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Move stride programming to dpu_hw_sspp_setup_sourceaddress(), so that
dpu_hw_sspp_setup_rects() programs only source and destination
rectangles.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 0a43c5682b2b..ab95f2817378 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -451,7 +451,7 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
 	struct dpu_hw_blk_reg_map *c;
-	u32 src_size, src_xy, dst_size, dst_xy, ystride0, ystride1;
+	u32 src_size, src_xy, dst_size, dst_xy;
 	u32 src_size_off, src_xy_off, out_size_off, out_xy_off;
 	u32 idx;
 
@@ -482,44 +482,18 @@ static void dpu_hw_sspp_setup_rects(struct dpu_sw_pipe *pipe,
 	dst_size = (drm_rect_height(&cfg->dst_rect) << 16) |
 		drm_rect_width(&cfg->dst_rect);
 
-	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
-		ystride0 = (cfg->layout.plane_pitch[0]) |
-			(cfg->layout.plane_pitch[1] << 16);
-		ystride1 = (cfg->layout.plane_pitch[2]) |
-			(cfg->layout.plane_pitch[3] << 16);
-	} else {
-		ystride0 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE0 + idx);
-		ystride1 = DPU_REG_READ(c, SSPP_SRC_YSTRIDE1 + idx);
-
-		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
-			ystride0 = (ystride0 & 0xFFFF0000) |
-				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
-			ystride1 = (ystride1 & 0xFFFF0000)|
-				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
-		} else {
-			ystride0 = (ystride0 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[0] << 16) &
-				 0xFFFF0000);
-			ystride1 = (ystride1 & 0x0000FFFF) |
-				((cfg->layout.plane_pitch[2] << 16) &
-				 0xFFFF0000);
-		}
-	}
-
 	/* rectangle register programming */
 	DPU_REG_WRITE(c, src_size_off + idx, src_size);
 	DPU_REG_WRITE(c, src_xy_off + idx, src_xy);
 	DPU_REG_WRITE(c, out_size_off + idx, dst_size);
 	DPU_REG_WRITE(c, out_xy_off + idx, dst_xy);
-
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE0 + idx, ystride0);
-	DPU_REG_WRITE(c, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		struct dpu_hw_sspp_cfg *cfg)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	u32 ystride0, ystride1;
 	int i;
 	u32 idx;
 
@@ -541,6 +515,33 @@ static void dpu_hw_sspp_setup_sourceaddress(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC3_ADDR + idx,
 				cfg->layout.plane_addr[2]);
 	}
+
+	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO) {
+		ystride0 = (cfg->layout.plane_pitch[0]) |
+			(cfg->layout.plane_pitch[1] << 16);
+		ystride1 = (cfg->layout.plane_pitch[2]) |
+			(cfg->layout.plane_pitch[3] << 16);
+	} else {
+		ystride0 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx);
+		ystride1 = DPU_REG_READ(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx);
+
+		if (pipe->multirect_index == DPU_SSPP_RECT_0) {
+			ystride0 = (ystride0 & 0xFFFF0000) |
+				(cfg->layout.plane_pitch[0] & 0x0000FFFF);
+			ystride1 = (ystride1 & 0xFFFF0000)|
+				(cfg->layout.plane_pitch[2] & 0x0000FFFF);
+		} else {
+			ystride0 = (ystride0 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[0] << 16) &
+				 0xFFFF0000);
+			ystride1 = (ystride1 & 0x0000FFFF) |
+				((cfg->layout.plane_pitch[2] << 16) &
+				 0xFFFF0000);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE0 + idx, ystride0);
+	DPU_REG_WRITE(&ctx->hw, SSPP_SRC_YSTRIDE1 + idx, ystride1);
 }
 
 static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
-- 
2.39.2

