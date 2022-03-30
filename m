Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3224ECFA7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FF310EB32;
	Wed, 30 Mar 2022 22:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643E510E25F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 22:30:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s13so12578598ljd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEoGB+086W5qFtT7rpPO+CifXhForrv5VQW9zjQHAzY=;
 b=r2czRJ6lFFJB2jjTDUGrBJXjNs1cv56H9XE9cc4UJIUZlHKG/hoteI8hC3i8boYzIt
 mhWssaWHa+RuXkz/LPEbMMDULib4GbH7j4QAqCxwzDHoXc6LoIKsHg/Y0zaXenoZyjtI
 /5SB6F3FA5uhgKHEFnvzngC4voA0Hvj8MXGPdePwRvHxFlqDnTq38Q2Ctbcugva5m/HW
 hYH51ShKItJ4xae1iN/HQxCo6tUMQGc6tTvtkVa26ZSktZjtX06xxmdIwBnIMykvuD8y
 QlsBYXlwchcarb77C90cuT4Ca/RsmN8ab7Uflp6SoVN5brhnirQ1GmAog3WzvqWes3zm
 Kz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEoGB+086W5qFtT7rpPO+CifXhForrv5VQW9zjQHAzY=;
 b=1736Nglk828m+fVE5UC0Fv3/yJynCkTiAP5wYgK7RboE8TX1eWXdF6gQHWWlmFvGCL
 ycSDCzhsOUDYCNqAir+2ACIAG++UToIFoVL3I3tWiOtJ4Ubsu7V4VT68BJutPQ5ZwC/V
 Gh1nUJNkmFhMwt4BsAp49mRNnTDA9ooHBRS4EFO3uBp71lx6azILMtFS9xmAX+M3CHHd
 SGhj5NA4xK+YlPIf7CRAaDcGqkCK4DxCX5oWP+xxan1mSFKZYojO8xfAOhRsvc9nNY9m
 Tpq3KZHAC57X14U0cflYvmIyJyMZhDNH5o8sO3ufkv7HoZJJL2ac6xiqUEXFWVpiei9i
 JWnQ==
X-Gm-Message-State: AOAM532tCpkANXH7odFP5AEPmV+cLadLuWn+ry1zWFFnr6po07OuQeXm
 pOWVaKron8uD48OomOrJEDa5Qg==
X-Google-Smtp-Source: ABdhPJxJ1FjV8WRE578fZwzltmDLODh7k28/q+RvdGrwZ6exKjgFg/B+RWR6Vl2ucR/KSHRs+GKI6Q==
X-Received: by 2002:a05:651c:150a:b0:249:a0b1:2e15 with SMTP id
 e10-20020a05651c150a00b00249a0b12e15mr8469748ljf.182.1648679410591; 
 Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH v2 1/4] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
Date: Thu, 31 Mar 2022 01:30:05 +0300
Message-Id: <20220330223008.649274-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
the dp_mode argument. Drop it completely.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..3dd790083cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
 	ret = dp_panel_get_modes(dp_display->panel,
-		dp->connector, dp_mode);
+		dp->connector);
 	if (dp_mode->drm_mode.clock)
 		dp->max_pclk_khz = dp_mode->drm_mode.clock;
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f1418722c549..8d7662028f30 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
 }
 
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-	struct drm_connector *connector, struct dp_display_mode *mode)
+	struct drm_connector *connector)
 {
 	if (!dp_panel) {
 		DRM_ERROR("invalid input\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5bb4b8b..9fa6e524832c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-		struct drm_connector *connector, struct dp_display_mode *mode);
+		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
 
-- 
2.35.1

