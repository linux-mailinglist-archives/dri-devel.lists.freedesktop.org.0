Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B624272D59C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F064410E2E2;
	Tue, 13 Jun 2023 00:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B0B10E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:12:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f649db9b25so5863159e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615161; x=1689207161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=pFf62CWwClcqQaVr9LB+xrXuhF6kV4sq6TuRFDuS+IJZaP/c0+vdDVpo5JM52UVIo4
 ZKwYqT0er0AJP9BlSWSWQ8k9A34EawQTPl6vQ9ZGXlcs52zOTSp8hNG0WEBKGu8DxG16
 I9z4km0X95BirqzoxPdZ9vu7f1q/fplgvABwazB5CRvJNfK35VODn7jaW0M+xWG7SfNA
 5ZIr+LG/F+0upBGKiq3nhA83Xwo07vxPxRcJR+F7NAzNZlsba8M07iEpWBpmDZrxqcZC
 8vQquSnBFsMie6z2SyVcI3f96RqiLDniSMVkaMjFy5+azHdQaSckQN3rUQam+ofzvtP1
 K4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615161; x=1689207161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
 b=baj8Tbw/bfPGQ0glEb8ySeox1jxHtroJyvxlCO0Sbhua9vSUrSZrZIw7ZB7bYfayMJ
 5DbzWt4GVo8h146CiBGY/Cs21kYmL3L3K2HPp/ZyKKhQaKqgCcwf7BgiEpu601TJG2WD
 e5in6lI2eLq+097ukawQ+HTYaUhAhCzj8r4V1iVX/sAstZWAZWjyTXexDK1HklvurW1B
 +iFrMUAyNkZ2tPFWnFv6+xNcMz5Nxe33ZHwHbu2sdOdUGXcRVwDOzgBO7b7+AufBAnhZ
 qdkKcNC4zoQ/Ojs/7x6rL9LyjYgGJ9MUCbac/asBhRx4APFsUx033KBUZzdkTl2olw1l
 RRAA==
X-Gm-Message-State: AC+VfDyq1LCvmDiiyIL6xcCWMaFPxPLvtXLDmPIl5uZH1wOtmLei6Xli
 Grgq3lo4DM5lH7l1wnQVe97vow==
X-Google-Smtp-Source: ACHHUZ6dtx0WqVfXpDJ8TxQWHbCDzfL6UHOQk2RB1WbnYgip4B4UuYCV0z9B3gBkHhWJHNjQe9u7oQ==
X-Received: by 2002:a19:4f4e:0:b0:4f6:40e1:4a92 with SMTP id
 a14-20020a194f4e000000b004f640e14a92mr5255011lfk.13.1686615161737; 
 Mon, 12 Jun 2023 17:12:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 h10-20020ac2596a000000b004efd3c2b746sm1586027lfp.162.2023.06.12.17.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:12:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 22/22] drm/msm/dpu: drop empty features mask
 INTF_SDM845_MASK
Date: Tue, 13 Jun 2023 03:12:39 +0300
Message-Id: <20230613001239.3426881-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001239.3426881-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>v2-0018*>
 <20230613001239.3426881-1-dmitry.baryshkov@linaro.org>
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

The INTF_SDM845_MASK features mask is zero. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index d78cedd35c01..060e6a49b2f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -246,7 +246,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -256,7 +255,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -266,7 +264,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 21,
@@ -276,7 +273,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_HDMI,
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index de26f469ebb1..54d7475e1591 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -260,7 +260,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -270,7 +269,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -280,7 +278,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -290,7 +287,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a18fc66a412..3efa22429e5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,8 +95,6 @@
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
-#define INTF_SDM845_MASK (0)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_TE) | \
-- 
2.39.2

