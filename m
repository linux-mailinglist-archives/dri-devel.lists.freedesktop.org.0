Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE92730AE5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5DD10E47B;
	Wed, 14 Jun 2023 22:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A56D10E475
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 22:44:08 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f63ab1ac4aso9391580e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686782646; x=1689374646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4TeQ2gX03YG5PIrvF0SIkzbh/hc2Hi8ju+1wWJts90=;
 b=mejd0PgojRgTibQo1NDO1zLnL/YJsWUZ6RDOgpGRjulWpfTej0tGMWIppnOZyCyckj
 6b+b9/fWlJf6CeriG5ixL0Ig1nDxRIPAu4bNZfnanSYC/GWmb4BPXjA6MsnOymj5SreU
 2bsHPKSQc0JVWUnJh34Zw+c5yt4T7HAJgPcTkzJbEzoydR040QEfP8cesF12I58MdPc8
 8nPPL2f0EpRIpIck2Om4QzUV7deYmQY/dCxn2D5Mt9fB6SvKF12JEAJdAyczOjJmCE/A
 G7msGmNwIKE2O3p1NaaJFx2Yte7Cr48HRd6lpjVcrVDS8+XC+8lSMNNx21Vf5au9gBFY
 ZqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686782646; x=1689374646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p4TeQ2gX03YG5PIrvF0SIkzbh/hc2Hi8ju+1wWJts90=;
 b=XiGstCPQ/7Y2ZmQB4cp9/XvQle0fHKkHm+4fWI11ZFiwX0xFv97EuCSDebLejlNbdK
 KJQpzDabRTtWHsSZ4elYjI5jgm8iNk8eOGh02MqnxazyVi/WoooUjE1Xb8o6zMda74QD
 no/DgJDA/+sK+Gll4emT1kQdmsOI+LWGaXPADxfol1ovYz7ViDD3tq7ayGZIiKyLezz4
 dbGprgJKVxv+Wi6g5EZDx2ytqXYj1Fby51aLL3zo2CWyKWRpouTXU0a4WrC8usKEZpfw
 TjaZihft2aV6GxG1weAweP1xjxgt1nmjo2Rlz5DKfS/IAW1UQ0Q87xL0EwiHzvSZbc8k
 NYnw==
X-Gm-Message-State: AC+VfDyYDgcBIDyj07dfzRFqcKKtnE6kuQWGxEVlQ4T34BNsfxMxsMcT
 rX55+V2zH4kIB42QO7qe24rRgA==
X-Google-Smtp-Source: ACHHUZ4pJcmQKm4s+0vsfF9XrGooeI1io0wm57LzsKmlwXycybu69XZDRdyXWGWiYbJ0TTkGHAJU1g==
X-Received: by 2002:a19:5619:0:b0:4f3:8196:80cb with SMTP id
 k25-20020a195619000000b004f3819680cbmr8397374lfb.41.1686782645905; 
 Wed, 14 Jun 2023 15:44:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac24a62000000b004edd2dc9a09sm2295866lfp.258.2023.06.14.15.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 15:44:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/2] drm/msm/dsi: split dsi_ctrl_config() function
Date: Thu, 15 Jun 2023 01:44:02 +0300
Message-Id: <20230614224402.296825-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
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

It makes no sense to pass NULL parameters to dsi_ctrl_config() in the
disable case. Split dsi_ctrl_config() into enable and disable parts and
drop unused params.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index eaee621aa6c8..3f6dfb4f9d5a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -705,7 +705,12 @@ static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
 	}
 }
 
-static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
+static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
+{
+	dsi_write(msm_host, REG_DSI_CTRL, 0);
+}
+
+static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings, struct msm_dsi_phy *phy)
 {
 	u32 flags = msm_host->mode_flags;
@@ -713,11 +718,6 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
 	u32 data = 0, lane_ctrl = 0;
 
-	if (!enable) {
-		dsi_write(msm_host, REG_DSI_CTRL, 0);
-		return;
-	}
-
 	if (flags & MIPI_DSI_MODE_VIDEO) {
 		if (flags & MIPI_DSI_MODE_VIDEO_HSE)
 			data |= DSI_VID_CFG0_PULSE_MODE_HSA_HE;
@@ -802,7 +802,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 	if (!(flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)) {
 		lane_ctrl = dsi_read(msm_host, REG_DSI_LANE_CTRL);
 
-		if (msm_dsi_phy_set_continuous_clock(phy, enable))
+		if (msm_dsi_phy_set_continuous_clock(phy, true))
 			lane_ctrl &= ~DSI_LANE_CTRL_HS_REQ_SEL_PHY;
 
 		dsi_write(msm_host, REG_DSI_LANE_CTRL,
@@ -2358,7 +2358,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 
 	dsi_timing_setup(msm_host, is_bonded_dsi);
 	dsi_sw_reset(msm_host);
-	dsi_ctrl_config(msm_host, true, phy_shared_timings, phy);
+	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
@@ -2390,7 +2390,7 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
-	dsi_ctrl_config(msm_host, false, NULL, NULL);
+	dsi_ctrl_disable(msm_host);
 
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 0);
-- 
2.39.2

