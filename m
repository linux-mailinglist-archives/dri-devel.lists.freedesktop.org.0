Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C876D621E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2059710E69D;
	Tue,  4 Apr 2023 13:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4510E69B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:08 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z42so33729581ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pEmrp5fJSjYas7ZHAUSxzBzhunF/atevLaV+PLA6DY=;
 b=uIX/KodGkKd2KIEzZiuSER0+sn2MRWct5PpnRVMVz2//DfVIveRIqv0p0rdEG4fPLg
 k9pnjfIBSkWby2l7ciX3ufwsJjSdv8Zat5+9DlvzmFM/X2/eWam/BVNn9CORNkaD+wCD
 +hzJLMawPvDaM3oUOs3QAvrvffjNuI8htMWtDeQRqy+c6wGFy2c3vEWFqdwNNStDNn5D
 ULZ2h4mq63k2ZVzFIkFteDbrU6u+UuhjOyWJ2uTI/bks2dFJh3jVOJmQCcrWL5KUui+N
 OjkOKqu44jazK2gDIBgdz5J6tjDomod+7WZHwaoZfJ3alYRQH43V2HY6R0jHUmGFOgmp
 Pbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pEmrp5fJSjYas7ZHAUSxzBzhunF/atevLaV+PLA6DY=;
 b=X098RA09TgzATwLbnm6UduYLlRz6hZCmk5LIQ9xMVH5p0iZaCuNXWpCehQjOzFqKAS
 JGhP2iyKjFil4DLpFDD3Vys1IP5N2c89v/T1SPQKdrSn5IDToafML2vT/zXCiA11y247
 2dR2jToyIRufHq+78u2IV2Kur20/mvbacWIDcpWKdThGtjp90gZOPZodjk3d/D2hnviQ
 HFVhFJINXDnrKkSaryAqfDKm7ECSUz5wjrZecDizGmdzyJUY6AT+f9CVHOcZ+0uo7wXE
 cJYTW36qkV2zfypAaWo/12FqXl6UYbBwJqFUv8mSlMdVWE9c3s/madKyBvRpRLrh2Bgq
 q1KQ==
X-Gm-Message-State: AAQBX9cq+rkHv48FF3q/zD1lui4VvfjtY/IZ1glgMLWitKBeTD7cNida
 eiZcV0q/SaLmR+RNq9uh8FPbjw==
X-Google-Smtp-Source: AKy350Zab7+B/Jx56LSksTzqOKYnihs5dcG4F+HrlL1jvv29Z/80Hc28KLk8Q0BjBT+joC0kRyDI9A==
X-Received: by 2002:a2e:8797:0:b0:2a6:1780:7700 with SMTP id
 n23-20020a2e8797000000b002a617807700mr774133lji.1.1680613748087; 
 Tue, 04 Apr 2023 06:09:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 21/42] drm/msm/dpu: duplicate sc7180 catalog entries
Date: Tue,  4 Apr 2023 16:06:01 +0300
Message-Id: <20230404130622.509628-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index ea34c2c7e25c..0b10e2060591 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -81,6 +81,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -131,8 +136,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.2

