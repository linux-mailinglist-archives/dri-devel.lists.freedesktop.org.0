Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A226D115A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A6410F079;
	Thu, 30 Mar 2023 21:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A825010F06E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br6so26347318lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sx0kJTj3o9E5esETPMKD2G8aCz78j9wB+12WboqAR14=;
 b=sfxPf6CjkXIKdelCAvj2i5iBGZSRaOmQ03D/U2jLFCL96AZYQzqGhILJYoLQjI4Kj0
 Dvfo77IOx76Qu1ZXAfR0ZpmMvVhg4lAd6Obe7F7w5t4JSSfE4/AMsf0NK9Rfp1copN9a
 ZGh+cxV9WON0E7QH4Dtp+Vxp4uOWx54VUAabGn7Ii831CPWXiMi3nvnQmorqrzUEEAFl
 LbkUxfp8jGdr9z+7yCC0+qmLQdAPMSn0sHtyFXJZcdRJQT+2LZc484Y6FkwrhJurDAIQ
 5wrVIClmuA+ptCti6iRuvZhsmRXjlc0DGugeHc/BXLpWMijRUqRKRzLFE3zia/h561UC
 8eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sx0kJTj3o9E5esETPMKD2G8aCz78j9wB+12WboqAR14=;
 b=00Vct9vr8URD+tS5/X8K/oA5tGLynhNFj+cXZGLW9DVTXCjCJ8XEcx4tLflvIzi1PB
 VYZZSn+A/rL6lXtxnonknV6HS8AV14gGcCCQB+xAyPgJKJH3Ra9w2KE6Zu5V/AYy7+as
 adB6VH/s74bQy1NVwFxypDLi9+f31a9Mptpnjd6eni7rcSmQarrbm+5L1xqorOxpaol9
 560OBbpZ9A6wwWt0pb7xHnEsv9Wg896+XI+k0y4jMU9iWze3yxtLF2x2l5dNMmrjua07
 zAqogNHOc7s072JiGOI3RwhIQSC5o6gPssU8P9A+G+OSQiw+8ZQ8ELZWH9Bki0BGttR1
 8akA==
X-Gm-Message-State: AAQBX9fGtB1zwHuMdIjtNFbH2s2dS7c/HzSndiUpHuORGrGifWs9sUnX
 KkmlkNKDH3lG32woOzTXrHDWiQ==
X-Google-Smtp-Source: AKy350aR1rd/jolO3Pxn5rzoq0Qcp7j0v9c5/Cgd98cuiyDY9RzCIi//idr0LzwI9e4RbeNwZU5/HQ==
X-Received: by 2002:ac2:518d:0:b0:4a4:68b9:66f3 with SMTP id
 u13-20020ac2518d000000b004a468b966f3mr7006020lfi.62.1680213249250; 
 Thu, 30 Mar 2023 14:54:09 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 19/38] drm/msm/dpu: duplicate sc7180 catalog entries
Date: Fri, 31 Mar 2023 00:53:05 +0300
Message-Id: <20230330215324.1853304-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
index bdf1ec36f39f..10bf737f9a60 100644
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

