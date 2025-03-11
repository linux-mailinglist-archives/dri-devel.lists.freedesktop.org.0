Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F5A5D33A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 00:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0439B10E6A4;
	Tue, 11 Mar 2025 23:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fZqix6Pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC5F10E6A4;
 Tue, 11 Mar 2025 23:41:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso1888442f8f.1; 
 Tue, 11 Mar 2025 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741736476; x=1742341276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4l/oaCQRVDlXaGgtOTR3rjmRlzQQJyPgMUHku9RrsM=;
 b=fZqix6Pw8/UMUFwzV0C26TQhMwLYU4G//rMZQ7A8vZO3+fbtNqxQBL5J3061WwT+AQ
 iG0iXESBlF2DgRq7L69/Akkk+rXCBzgsnvSXQFRQbGAPJZO0x3Z1LAxRdJvWK+UNfxMv
 cnQC734YPb8KomGpQum5sQY9f2U9A9G/XEiN/l99mXZQds2sJiffbGkEizyWVKyd5f2G
 LrI8JPtGb+EjNIxSkRbQLl6jLPsGtr9mfXksmdjUWcBXCBzPphxKTyydCGuwbWuwWgi5
 TfOdvizge636AI6h4Z+6eXycM8B7Rdp3WAk5A3VawxKkaZT1Sep5EWKoi8KzL19uGwEX
 2jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741736476; x=1742341276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4l/oaCQRVDlXaGgtOTR3rjmRlzQQJyPgMUHku9RrsM=;
 b=K4ep5uYfF4HwyYQ39hdWPIYL66B/CQB5762QcM0OUXCLTBFscc+mJzPyOdMm/r/t72
 s5kI0G/fg19ySbyTAKz3ZlGbmMpmABQXM1wxdzm1EWmTUyVLw2CCUpo01kpEahabSzS5
 iIT19jNLB3AEuuewFuQbWu9/7Wld81GAG/WATceJf0g663itKLpJ4jqtewyiPIv6V/qe
 AMmP5FLzeqBoIQRjJbN1kQvF86EK7j+1RaK4VNWSixPwx2O6o3u6Z2SxG6MdyEni9Bss
 V8oDSLCNR9BH0Isb2pjSbSmauy8vpOApAUhvTDuHQymYVeHzfXoE28dxkbD6uJXURmUi
 qhUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU45gpfRg3PI9Zi3sPmWbFW29lwlJJD4Ax1egMnjLb/znNDNYetsLm6KOTrdntYOa7qsgYOC5Jgqw6B@lists.freedesktop.org,
 AJvYcCWjAWZNOCJN53noe1gmMPrHp7wSpnIiwXeYXt137irwIhX+yH3s9ZbzWcguF/lzqDKeOzKVtCHFeP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1nUA8EPmrHZdn3UhCDDne+vCk/NNF06u3aeMtHq7Y3J2qzxvh
 ajY+KB/EKOXivaVx/tOoW3BhlNOgsOgbAG4351nHN5UwXB4OMNw=
X-Gm-Gg: ASbGnctxwUf+961OtHLdCGW1bOT1B2IzqcJnERZUOwoe2jbbIbtfwHTD2/NR+v/cJMn
 nCvYJeUyUpIklxtYXQw6SCpM1Gw7Agz/+rG1y1qGcpb+eeqSnJVxwv7gDlv8Wb1FPCyCiM2CqH5
 vhki6/+Hsm228d4u+59eOYHq8ul0VKgizQbbsH3ZjVE4RDjIt7+kVQFkZni8e5Z8PfO+SgMjYaA
 a6u+IcTqKLIZsEMD0Izny4q0TTRAZZWDc3uUqW2m+VvvPA4+gBNMzGut1RyirKTR+icUhcA/eeg
 6gdoNUpavm4N2yJeR/KcSzUZJnuV1zLYDB1IXx6pikJYSuqMTqsz1+24zvRB5NZ47YK5bp7q9F/
 2KfriPg==
X-Google-Smtp-Source: AGHT+IHB9g+En0CWc1s3jiznwqoGbtpaeJW2BYwZ/bRVnWuTmdukJCDX5lWiuhj/D6s9X3feftILPQ==
X-Received: by 2002:adf:b197:0:b0:394:570b:aab6 with SMTP id
 ffacd0b85a97d-394570bac03mr217849f8f.37.1741736475279; 
 Tue, 11 Mar 2025 16:41:15 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a72ea88sm3988345e9.7.2025.03.11.16.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 16:41:15 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 1/2] drm/msm/dp: Fix support of LTTPR handling
Date: Wed, 12 Mar 2025 00:38:03 +0100
Message-ID: <20250311234109.136510-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311234109.136510-1-alex.vinarskis@gmail.com>
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take into account LTTPR capabilities when selecting maximum allowed
link rate, number of data lines. Initialize LTTPR before
msm_dp_panel_read_sink_caps, as
a) Link params computation need to take into account LTTPR's caps
b) It appears DPTX shall (re)read DPRX caps after LTTPR detection

Return lttpr_count to prepare for per-segment link training.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 30 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 3 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..d0c2dc7e6648 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,6 +108,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,17 +369,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
-static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
-	int rc;
+	int rc, lttpr_count;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
-		return;
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->lttpr_common_caps))
+		return 0;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
-	if (rc)
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+		return 0;
+	}
+
+	return lttpr_count;
 }
 
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
@@ -385,12 +391,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
 		goto end;
 
-	msm_dp_display_lttpr_init(dp);
+	msm_dp_display_lttpr_init(dp, dpcd);
+
+	rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
+	if (rc)
+		goto end;
 
 	msm_dp_link_process_request(dp->link);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 92415bf8aa16..f41b4cf7002e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -45,9 +45,12 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 	}
 }
 
-static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
+static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel,
+				  const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE])
 {
 	int rc;
+	int max_sink_lanes, max_source_lanes, max_lttpr_lanes;
+	int max_sink_rate, max_source_rate, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
 	u8 *dpcd, major, minor;
@@ -64,16 +67,24 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
-	link_info->rate = drm_dp_max_link_rate(dpcd);
-	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
+	max_source_lanes = msm_dp_panel->max_dp_lanes;
+	max_source_rate = msm_dp_panel->max_dp_link_rate;
 
-	/* Limit data lanes from data-lanes of endpoint property of dtsi */
-	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
-		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
+	max_sink_lanes = drm_dp_max_lane_count(dpcd);
+	max_sink_rate = drm_dp_max_link_rate(dpcd);
+
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(lttpr_common_caps);
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(lttpr_common_caps);
 
+	if (max_lttpr_lanes)
+		max_sink_lanes = min(max_sink_lanes, max_lttpr_lanes);
+	if (max_lttpr_rate)
+		max_sink_rate = min(max_sink_rate, max_lttpr_rate);
+
+	/* Limit data lanes from data-lanes of endpoint property of dtsi */
+	link_info->num_lanes = min(max_sink_lanes, max_source_lanes);
 	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
-		link_info->rate = msm_dp_panel->max_dp_link_rate;
+	link_info->rate = min(max_sink_rate, max_source_rate);
 
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
@@ -109,6 +120,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 }
 
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+	const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
 	struct drm_connector *connector)
 {
 	int rc, bw_code;
@@ -125,7 +137,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
 		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
 
-	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
+	rc = msm_dp_panel_read_dpcd(msm_dp_panel, lttpr_common_caps);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4906f4f09f24..d89e17a9add5 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -7,6 +7,7 @@
 #define _DP_PANEL_H_
 
 #include <drm/msm_drm.h>
+#include <drm/display/drm_dp_helper.h>
 
 #include "dp_aux.h"
 #include "dp_link.h"
@@ -49,6 +50,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+		const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-- 
2.45.2

