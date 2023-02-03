Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47868A1C7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367210E86F;
	Fri,  3 Feb 2023 18:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0707F10E863
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id f7so6021416edw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlR+eOSoWrZbPzQLFXZK6QMt3B71FpHmCxYn4EdQXS8=;
 b=cbFqv/ofqrTP4ElsUY689tkmNuW9DuUNx3uCq2lJlQo+KarZ+HvLYs78dI0TpgztX1
 3DxoT9jgbrnlXeLnM78rlJD8eTsiyc7FYFEo1Z6mtR2X0eAv0JBp1P3NMFUmw2hD/GrH
 Hq1l5fWkDI04fRc5FubPY+f2/8RFL56BbNEoJrfoD/pDwb0WcsLGc+3ejpjPee39fBP/
 8j/LV6a8eG3wED6CUndlf8WDe4KNXPHnDxSh7WNPPb0fbQVbtYZ+j1V/9Uzlf2V1hELR
 2nOH6N+kgcgwot/3epOJa0mWmRf6688nN386TqF6qykusyXnvxcjMahFLmELFep7/gmQ
 qMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JlR+eOSoWrZbPzQLFXZK6QMt3B71FpHmCxYn4EdQXS8=;
 b=pk9gNv2vfL7snFICKzyPhaJ0qB8CZWysJh76qrW1Fp+bBq6VBcrDr2uOOJiuoIGqfo
 czCoceoAX91IHbWuVsF4mh4sH1BghtDu/hd6Cp5XFS1uKjW7CRlOFR6lQofUrfD/5eiK
 IrvpktOtRQGYLMT8aygIgAUE7cz5JhP6Axu3KXyOpTc8ynV1jRVtLqLgDdLOyWX2mgEo
 c75VeBXLeuVgxxs0dPkkXmmpSjIIZ/O6h3QIAKzUCQjlivk6dK0fqdNw+QbRMxYMr/HN
 XcMT4mWrYSZCdEW69a7V4VYSbNJ26nIB/oHPGXnM/VEBHvSIr3BfqYMf2XdMia4R8xYT
 69AA==
X-Gm-Message-State: AO0yUKWuTROd+rGuwnauxgPi5kkq0ZytN8biyhNQJD3bTxQ79KR5R6rP
 hAkr/enb2SpuX4AqpVz2NTipww==
X-Google-Smtp-Source: AK7set/QsiRKfkwukqo65FNm6qwmNvt4O4Sc/rQ6piqKyci6VKkOngJs5A2ndQezhKLAsFL0de5QPw==
X-Received: by 2002:a50:ec94:0:b0:45a:7d2:9b35 with SMTP id
 e20-20020a50ec94000000b0045a07d29b35mr10513045edr.0.1675448507599; 
 Fri, 03 Feb 2023 10:21:47 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 11/27] drm/msm/dpu: move stride programming to
 dpu_hw_sspp_setup_sourceaddress
Date: Fri,  3 Feb 2023 20:21:16 +0200
Message-Id: <20230203182132.1307834-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 57 +++++++++++----------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 4c05f4b5e050..fbfb39a7a229 100644
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
2.39.1

