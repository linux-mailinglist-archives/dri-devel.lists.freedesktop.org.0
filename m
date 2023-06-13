Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48872D55D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CC910E2DB;
	Tue, 13 Jun 2023 00:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C1010E2E2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:08 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f62b552751so5837021e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615006; x=1689207006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqJ/EVFZ5KKxz5XV9rfFB9zBx0VgDhxsDFDprGH8B34=;
 b=T313xFDtr9A4w/ZXJ0L7Lef+Gimf4azO1x+1bMZoAbbxijVr3xGTrZOtijMmv47yHc
 1kflMY11mq8hXJb78dWSfKbS9HC6nqSZBnmFgU8ZHjOB2xvfFUWR2txL0BSMgRW+itdf
 H+hJSDVVYqsImJC3uhOnlYBk1HMpgkg0p+HVfRGSGiaBMovuq18mj5cAdibcRVNsHpwa
 anwpP8jAfHLpGIbjlYgMkGLxk6ZBNqJeqkqlbEmevEUJ2M/f8MnzvP/B9dR6vmEQUCIv
 ySdfjM79I/Y1TkMmWyhRI2wDal8YbaXho+EgeIiJi5SQC4sdnSfWaP1idAqi7VaugJjc
 MAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615006; x=1689207006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqJ/EVFZ5KKxz5XV9rfFB9zBx0VgDhxsDFDprGH8B34=;
 b=IgFTZIGfWaOBsKNIrykhwvzYbgbpi6pMxyScomQM8XVh5CJatTqiEqEMxUxXBhKwq7
 0fMra6ZH40RGYB/LK1nHIEZp3A9hSuiBiSrICN0zMLxgNy8uKi4gwDoaNb2QxemRi+t9
 tPWLWZwOxdXNTFLEqz3SVJNbog+CzXdTnB+VrLkthDh0vAfy2LN77CtUBNup8DNDscUK
 4UYhlZ4ugg2I0clh40rMOgqfsXmznInis/EFL0u/uf2rMacAQhh0pX7Qy+8N+D5kzDCc
 O8n7Yizz3hyH5TPHJ0WSRu2klWstf0T3/sZSs+QroVDV/9N41oKaaz6fQFSp0OkAggre
 q6pQ==
X-Gm-Message-State: AC+VfDy/l2TbBMHc55ox9Bm/crfv/UIzAlzMaNKjJG7fsMqqa7P5qmIi
 4ueaqtWxlGuQNww39hlmWvcM6w==
X-Google-Smtp-Source: ACHHUZ5uJt45J8VEfYQKlWC06KABffhsfIFzjN0RoLZKFQwxZlr1aTdAte/qLLH498V2rLrOe6qGPA==
X-Received: by 2002:ac2:5b9c:0:b0:4f6:140e:c9bf with SMTP id
 o28-20020ac25b9c000000b004f6140ec9bfmr4835189lfn.22.1686615006607; 
 Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 01/22] drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done
 interrupts
Date: Tue, 13 Jun 2023 03:09:40 +0300
Message-Id: <20230613001004.3426676-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

During IRQ conversion we have lost the PP_DONE interrupts for sc7280
platform. This was left unnoticed, because this interrupt is only used
for CMD outputs and probably no sc7[12]80 systems use DSI CMD panels.

Fixes: 667e9985ee24 ("drm/msm/dpu: replace IRQ lookup with the data in hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++++--
 .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 16 ++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 0b05da2592c0..67566b07195a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -80,8 +80,12 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
-	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk, -1, -1),
+	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 9c5a3fe9cfde..6ea1cb551348 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,10 +88,18 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 };
 
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
-	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
-	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
+	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+			-1),
+	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+			-1),
+	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+			-1),
+	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
+			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+			-1),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
-- 
2.39.2

