Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A260A5AF80
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 00:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1F810E4E8;
	Mon, 10 Mar 2025 23:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kdbI6YcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6957710E2C1;
 Mon, 10 Mar 2025 21:11:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso29157385e9.0; 
 Mon, 10 Mar 2025 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741641066; x=1742245866; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3TzgCw575Otf9KfkSYbKwBAqhN/d/WSTjuKQ5VGt1/4=;
 b=kdbI6YcOW44RCapvql2muYcTgT8ctQsMWFQaH3O3bA5x/9nAEcg7GXWq2LGCCTTG8d
 XhoRJL2liPHod2uMXfnJazR70lxAikR8OGUQwVqacyzIbYUwkWHvhWbL5tVHw0sExKEH
 jWNNQcemxQiTkmHcKELF/6yXIhdESUVkVyWaFszDPX/XJ9ZyvnUvmkKiZdFR404i9BsG
 d3k4iPfBQ/SO76HRrsuqxj43nndDMHIwn27xP43m+tipcnH5RSTif3fm9Hi8FnSkDHJt
 31Z2xp3QbYT113ldlg1c7jMIm/5lbxqPsjlON9MvfA3snAM8t3iy8ILaeqErrg8MaL5I
 RHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741641066; x=1742245866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3TzgCw575Otf9KfkSYbKwBAqhN/d/WSTjuKQ5VGt1/4=;
 b=U1OSdhBzyvwXo1zpbYGbX0AMibmqX1tVQa3TEHoP5l+RzKSBwjb7kA1X5yiscZsumf
 x8Hm2920LV/GWzxkHoHGdZFMp2MT3j+jTo53V43vS8uTX2fwqxpAI9SJ4r8Ea3N67ftd
 X5yx4Y1T31hHNMMBEiUew2GDh0JYeB5Fl1o9SMO57qYhNztVaM0XL5yMD+Kz3ofCbJWG
 BVzW0cGGwkIKGoN3daMpbVYwZQ8XxqouwnXxesSkF4kBb3zHuM6/B10pLHcC3qgs4sIo
 gjfubmVV8e8TUXSMJ6pFHGutid/fJmGpMDGi8k5f2GptQGlBeoMdiLsQAvyuNp3WNfEs
 87kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2bwLQbrPARcjOUB7sZmdpdU2zRo2wa30/FyoALUgPjD4vODbk1V9Jt1nGFDg2scxijP5xDi2tqIRJ@lists.freedesktop.org,
 AJvYcCWnncAOnDpjzm3DhP1E0TVUx7oHg6mqtPFvsbPaWsG9L0TFTJ+lyUVZ0PY2Ywo8ohGwGL9bVG5QWsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzENye5keEeKjM3wNdblEXFu9ZV+Cerqfb7XClrua5jMALaqwjH
 gyCV1bhWpsgdMHGrwo5RinZQhsIJiY+Sja7ZoU8F9qwJ9uG2FQw=
X-Gm-Gg: ASbGnctsWDu1T5RTmP3T0bb/FEysHGvclhbs0Us13uTfBMzYOsU1pqZqbH2ufZidJDX
 MNO4hySAMaUkp7akMoX66rMD3FImF4uoKeylsO235/QKuGpZ7H+HMtq17r7aWKUiCwPJ9bm8jUm
 3gpUNGQ4j87QMxAG+gUGXZ93OmgGxKEPXuunBMKu+nqZ6eFkyFGUDsVXkU9X9vjxsx6pJWnP3gM
 Y3jcjgrrM9WSTn0prGPQRKuox3aL4NPrLRw5JfdudDEs72VDUJyT+xZ4Haj5B9REs03EndYUg7M
 bJnUvIUdxrRBAo+6SW4Q1ZB8zDBLJNYg0VolQxCCA9mVz4CBHurCsWyobAZ6EbmTWRiHEpXtzOR
 nEu6nog==
X-Google-Smtp-Source: AGHT+IFTUrPFzesY7S5XLhKv9h7x11RZW7LkIYqDI5b4pXvS38g73Wbp1S0P/EBF7w0Cm27fXcUEAA==
X-Received: by 2002:a05:600c:511b:b0:43c:f61e:6ea8 with SMTP id
 5b1f17b1804b1-43cf61e702fmr53627805e9.2.1741641065289; 
 Mon, 10 Mar 2025 14:11:05 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cf595a771sm54980415e9.36.2025.03.10.14.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 14:11:05 -0700 (PDT)
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
Subject: [PATCH v1 1/2] drm/msm/dp: Fix support of LTTPR handling
Date: Mon, 10 Mar 2025 22:05:51 +0100
Message-ID: <20250310211039.29843-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310211039.29843-1-alex.vinarskis@gmail.com>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Mar 2025 23:50:52 +0000
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
---
 drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 30 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
 3 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bbc47d86ae9e..2edbc6adfde5 100644
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
-		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
+	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
+	if (rc) {
+		DRM_ERROR("fialed to set LTTPRs transparency mode, rc=%d\n", rc);
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

