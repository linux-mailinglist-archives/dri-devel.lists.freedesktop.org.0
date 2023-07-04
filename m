Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B16746748
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 04:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9151010E25D;
	Tue,  4 Jul 2023 02:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A622610E25B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 02:21:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f954d7309fso6341866e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688437298; x=1691029298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
 b=WndeBosu/+j4iRv6gWblAif+qA5oA5faM5RMCyuz3YsRJDw61znpwGtfYAk2sIq9Wf
 Wa+ZezIdvsDvJSeRPRaL9MwJj/xUANQqxINLU6z7xNosOoHp7GV7Tt6ANphTLA4JMK62
 nUBlBEe/WFIcP7HYjpw+dXVtRugDNgjVM3lJ3xunud42m/d8OycRayrxl8Z2jJgzJqct
 MJRnaPXTNAiZNs/YxSn7a82fhtmTp1JonoM0YHyzjfy49RRjCky49FlIYlFT7VmLP2gO
 mkXxvkhgbgkaoTas4SOk/Ts+ek5e4rfG3OpGapa43QaVTub0h+C6XX/jE0myZafNrPWr
 8v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688437298; x=1691029298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
 b=EA51YGnCE6zW2EhxyZQH06ZlMhpi/23Gm2U+d7xaCP80SOev4/Nly8/0nHrf9/eFjC
 Dhm7557UQDZHjhhD/233u1Il22RGwAaXbeCsBaVVXn8m16zitthrCngBvvqey7zzFBh3
 m7+mH3x4pPJa7KvpPjL1L4o3aJzcFdnW3dX7gCetunfdaTxcq6yPx91zt4HL4HLLwGEm
 f/FDD3SlhVh+z5mFhDvOLpp8E0Wm5zU72C7hx4cMPT0NmDgPCWC0I56RoPzUC/gqCwB6
 aSJbYEuyOGmPXbqfmPYxAEJsL9K8DBXy3ORKTSragqiKzsj6EFyr+nKsihFdVtAyO+lV
 kBDQ==
X-Gm-Message-State: AC+VfDwsknU4VWgRwL6CFS5Cuc6TPNFxaTrVqrZVHuQMrSKWFh1hLOXS
 fVvFdUblp87smBQmDT/ydSKcaQ==
X-Google-Smtp-Source: APBJJlFbDoel2givIZ2zNFIQ6UbatiXt1Zfrr2x3cqqr5/7lN9HSxsRl5ibltNV83k+fHJnM+245MA==
X-Received: by 2002:a05:6512:23a0:b0:4fb:95b0:1423 with SMTP id
 c32-20020a05651223a000b004fb95b01423mr6308638lfv.4.1688437297993; 
 Mon, 03 Jul 2023 19:21:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 19:21:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 01/19] drm/msm: enumerate DSI interfaces
Date: Tue,  4 Jul 2023 05:21:18 +0300
Message-Id: <20230704022136.130522-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
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

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

