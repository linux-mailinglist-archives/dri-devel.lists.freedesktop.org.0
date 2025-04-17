Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A84A9118C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 04:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144C010EA0D;
	Thu, 17 Apr 2025 02:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I7JPEqWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A4610E163;
 Thu, 17 Apr 2025 02:13:55 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso156736f8f.1; 
 Wed, 16 Apr 2025 19:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744856034; x=1745460834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiKAF8xumpKDG16lLTYF+amuABJyX9EUNgIyTBAAQEY=;
 b=I7JPEqWGudfP9JI4ZNOyebWV6Hy6+T2hm24En9qdEsWpTzzToz7mGk+2lBpjIs3RfW
 wqj4DS86uBpyleQxJATnWB7wgPVqgI+KWzVJOjelMLATwFOiWPsClF0ZknI7SRujA0aA
 8KtlLm6/UTxyLZueEb2zlTCE+TOyz2F3DwK/1d/T2kMH8Jca0/Z5HxTj1n0MzsYXYIlG
 Bv1z7F1v9rcX+3SDniT1MtBxxrJ2pfWr8ppwEhW9eIb9sPIBsg11mX9SXqohw7FG9buT
 uvgBVaQLyg6NFp7OVtFKiDqNCgwz6l2pzGGFL3ooL5suyoJibmRC3wRCvn2yJbHpmRWv
 v2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744856034; x=1745460834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XiKAF8xumpKDG16lLTYF+amuABJyX9EUNgIyTBAAQEY=;
 b=mUzM/F/WvilJWDL3bTa54KvgRby7I7eYZdPU5PqXdooNZUX5d6OkcwzkWzBMJRzYXL
 KxlhXwmXwFNvhVMdHYXU7MqeJxWf2cm5vF8PLpB2PRHmV97O4z2XryQijYMqKVClpo3Q
 vcktortTO87kLKp9bBf6HOFgH3AAp254PL5yELv1Dp1d8K84txLWWw2jc9nElp/t1N5m
 zng/PAhQD179waK3aPvus+UKzNcEL2H4eFDS7J5JJn9LbCw7jQGAj6c72oVD6YKGRWg2
 Xu8jrlWKrXk2g/rt2spAAQJLaLQ1A/OWbyWtIckhMqds0yUVak4IzA9CxSQ8M/MQw04Z
 B7dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeuhwjdw4fKJyizJjVLRwCujdoLNTtI/MOYEAXJcFVRmxIDb1f4DiC/NI3DhVag3g28aqDYkhxvD8=@lists.freedesktop.org,
 AJvYcCXt75vwiptW6nsbukslgd+OugbM3nTcySfr2cS9Ce4JpUU8uLAwJ/nbYKBNfDdsO8IdPlKGxd2xR1HD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnWqLywR4Joq7iehWXrFiNw4krcktzh/P9beEE7YbMRhNPne7n
 r0MICzuWIMrqK/pM+CX2TwN025JPRrVs5WEnlRL9JlrtH3wRniY=
X-Gm-Gg: ASbGncvI+QrKYqwlGDZYF75m3B8fi9RkmcoDWcv3bHGgYWxo13R4lx47wOIHt08nrux
 2hto3hO6gG4RnYFVbqqYlkxZiHItEvClE5tDpwtXNynM7u/Ksv8GpwUt6TjXilz/6pLaqIhXblS
 NDdguIFcXr9736pDn8ooYfD0O49q/VmPYZYb7CehV1LKTET3t5FH60JjCEZQ7zkVCwJ+5z9Ss7v
 WPFSbbunuNK/Gr4SjAnM9qu6tPWEgBHSCKOzVyGWSKkPPn7jYLftPDoIagpKoknuq3lYjbmEFEr
 1U8PI7tpwBDa7oQZnODXvBELQdLhLanFBh+lISfDod7FdQ==
X-Google-Smtp-Source: AGHT+IER0MvpbQy2etmfGig8mHy40gEeXrIqD175eUCLOGtP2Y4C5981p4HcbO03f79MbWw6TR2cRA==
X-Received: by 2002:a5d:5f90:0:b0:397:8f09:5f6 with SMTP id
 ffacd0b85a97d-39ee5bac57emr3587692f8f.47.1744856033728; 
 Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Date: Thu, 17 Apr 2025 04:10:33 +0200
Message-ID: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250417021349.148911-1-alex.vinarskis@gmail.com>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
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
link rate, number of data lines.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
 drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fc07cce68382..5c57c1d7ac60 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -369,13 +369,12 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
 {
-	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
 	int rc;
 
-	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, lttpr_caps))
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->link->lttpr_common_caps))
 		return;
 
-	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->link->lttpr_common_caps));
 	if (rc)
 		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 8db5d5698a97..c47d75cfc720 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -7,6 +7,7 @@
 #define _DP_LINK_H_
 
 #include "dp_aux.h"
+#include <drm/display/drm_dp_helper.h>
 
 #define DS_PORT_STATUS_CHANGED 0x200
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
@@ -60,6 +61,8 @@ struct msm_dp_link_phy_params {
 };
 
 struct msm_dp_link {
+	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	u32 sink_request;
 	u32 test_response;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 92415bf8aa16..4e8ab75c771b 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -47,7 +47,7 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 
 static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 {
-	int rc;
+	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
 	u8 *dpcd, major, minor;
@@ -75,6 +75,16 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
 		link_info->rate = msm_dp_panel->max_dp_link_rate;
 
+	/* Limit data lanes from LTTPR capabilities, if any */
+	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
+	if (max_lttpr_lanes && max_lttpr_lanes < link_info->num_lanes)
+		link_info->num_lanes = max_lttpr_lanes;
+
+	/* Limit link rate from LTTPR capabilities, if any */
+	max_lttpr_rate = drm_dp_lttpr_max_link_rate(panel->link->lttpr_common_caps);
+	if (max_lttpr_rate && max_lttpr_rate < link_info->rate)
+		link_info->rate = max_lttpr_rate;
+
 	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
 	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
 	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
-- 
2.45.2

