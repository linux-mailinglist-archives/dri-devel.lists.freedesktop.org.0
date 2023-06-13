Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB6072D56E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 02:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7A310E2EF;
	Tue, 13 Jun 2023 00:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8A10E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:10:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso5999670e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686615009; x=1689207009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMZvwl44ms7Xwpm8GNdjd1hqyKGN/MTr2D0GCfzVRGs=;
 b=Be2wPWCeK3qDjIUttzQTXauZvz62GcAITjhMitxj7LDFNiU2TvRxeWXp5Me6TKDx3U
 QBsCYyUvTh3bL5A2fjlGWrB6YBa13Vr9SEnHdTAUnTqBWQHFbqkhDGFQ8abRbuvkX9K4
 qQLD5Ua2gvuWWOp9ayGQ2pqqUGz+cYSISOOuYrrnC2ia5SwrjLiFd4ElVztLr6294oag
 I5FjeW1jGoFSiej984yaXGoRQ0uiCSvlKb5JGqzKfvzJ9Y7IM1psKfphgr070vE2pd8Y
 LOrafVp1FKWvgb/urAjeDVCK88PmPZNbjN6cS1bot1o1DEEh9AOwpv/ygFjiuQPt+uhT
 5aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686615009; x=1689207009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMZvwl44ms7Xwpm8GNdjd1hqyKGN/MTr2D0GCfzVRGs=;
 b=BnTP3m3oeuFXGPQmzzEnfgJYRkPt90mNGfYbveF86c5qKQdNIOJpWLiGieiq/xk6n9
 ayTq7j+vgjh/OOAz3Dj/VVrYQcIEXgKPUTTiL9ivYH+Tp2LP1MV1UX41o1Ukd0fu2IRF
 l0hjtOa0jmwx7MqePWGDkR++YlnkIIeZBFtURlj2/TAxBqfNqlma4nnSHlEKIYIYHKVW
 G+JXJSPQdjwbrDq/gs72bOHrVUdSzRRkfltkac/Du1MV2YJ32C3dj3F162MsEuFQdQ3f
 sXusCYIv8bw9qzAGN1O6ALJ3fKBhlx3PgXpx8mP9xVZ8F/VFI2tZ5y+qlKFb5NP3mf9X
 4npg==
X-Gm-Message-State: AC+VfDy+KkEHzQwLhwDLJ7Rapo/zFijqySob9UL6XLb1PFBuEdoLFEiA
 QsXlrKXWP2Hch1vAHtXnNtPxbQ==
X-Google-Smtp-Source: ACHHUZ6HfcI417Ibo1OlTj65/ufgRzmJVnxaHP4arCDkxcaC+3wx7HrcTfjzOReqWHfhFCOwoymlkg==
X-Received: by 2002:a05:6512:521:b0:4f4:d41b:f421 with SMTP id
 o1-20020a056512052100b004f4d41bf421mr5681292lfc.33.1686615008917; 
 Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Date: Tue, 13 Jun 2023 03:09:42 +0300
Message-Id: <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
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

sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index ba9de008519b..031fc8dae3c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -66,7 +66,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 };
 
 static const struct dpu_intf_cfg sm6115_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 92ac348eea6b..f2808098af39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -63,7 +63,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 };
 
 static const struct dpu_intf_cfg qcm2290_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index d7aae45e3e66..241fa6746674 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 };
 
 static const struct dpu_intf_cfg sm6375_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x00000, 0x280, INTF_NONE, 0, 0, 0, 0, 0),
 	INTF_BLK_DSI_TE("intf_1", INTF_1, 0x6a800, 0x2c0, INTF_DSI, 0, 24, INTF_SC7180_MASK,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-- 
2.39.2

