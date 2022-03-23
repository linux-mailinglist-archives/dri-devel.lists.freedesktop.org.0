Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65A4E506C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CD810E672;
	Wed, 23 Mar 2022 10:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFDF10E66F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:35:49 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id e16so1904875lfc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wg0hbuJGQD0rW3NS2J2abaYUfMQnRdpnEfedmX8RdXU=;
 b=MoXuN5KqDw2MBB2esSDEpcQZ/aWWk8oFPIZqsgvIgzgSvwMJNwEHAROZ8g303f5tP+
 2uOGceormc3MEOxctAk/4ZKTdoO+UU8hMjnSYIPUflQJRXaoVfuWXLJydI/pBz+GJgg9
 ddKnvS5OpQh4fQqv6XBK55U5OKYwpFKBB95ox5tH7DsmhI9g1unvo4Gz378tE9CGhOrd
 XDNUrsEABz0RiLUq1zguhHD+4ghc/zoQFNkZ9UXlOPUBKEZOJoIwd/MN9dzUHMaikEui
 eNT3pC9Kh0/ec0m8j0GHZQi0ocAMOFGqxlZ+72hYbmQdZaxO66Jnayh7jIHS+7yRNFZB
 QK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wg0hbuJGQD0rW3NS2J2abaYUfMQnRdpnEfedmX8RdXU=;
 b=UG++gNfH7cfhS3/6FrCwBctJrKiFdvNxlf0XddCQkKp+9AK8ktPdlfKgyFY/3PGByZ
 HkHSDJnMZCjILgtE0A7pNG/WtiBjwJr3OCq5pJEi7emV481T6IAVkZ9lYgHyYYs7l5QL
 5FEJYU+vitgmktfnkWz0XDcpU+TFCI6MG0eu8ZcfZX1txoqZmDH3srNykaxtEGWqMTSe
 OYIoxsVBs3lOdEvWCLeuP+aj+d7c+3M/ZVs8fv33u0Q6O2C/TunZhYAdTXFkRYZu8p/Z
 b98Q8L+CgwhXowRrc2tkiJY5X0Cnzl+8COMKlWUnspiPCLZLbuNTY3ziQwi+wY+KAOFp
 Zz9g==
X-Gm-Message-State: AOAM533TmiTx7eG8SY4eBpjinyBrM4lmzmLfSTTuTd4XP99ptqhFhpp5
 DJwZJ5yxgHgKXhlQ7v68OiHbBQ==
X-Google-Smtp-Source: ABdhPJwSy5Gk8AWGzOVM+6hvqHCJZND7WPlt/9wTn9ALavqDdyQ31p2opp8eeUNskWFhM5R579ieFQ==
X-Received: by 2002:a19:761a:0:b0:44a:49e1:c4d6 with SMTP id
 c26-20020a19761a000000b0044a49e1c4d6mr2744542lff.71.1648031747963; 
 Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
Date: Wed, 23 Mar 2022 13:35:44 +0300
Message-Id: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
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

