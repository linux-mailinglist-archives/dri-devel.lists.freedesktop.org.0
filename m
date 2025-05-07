Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A29AAEEE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 01:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693910E897;
	Wed,  7 May 2025 23:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PRPQce5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CFF10E2B7;
 Wed,  7 May 2025 23:01:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5fc3f0a5506so649691a12.0; 
 Wed, 07 May 2025 16:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746658882; x=1747263682; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vtr6Z3uXRjrwIOudB2G0wwIqDwu8zbz8ZZjV8N4QrW8=;
 b=PRPQce5rI4/r84iv/kGmtPEzxxANexAcDENf4ZLYZrEeFvzO3rKzWVZyx+2lkF32DU
 CnGEaOtFYoaqnux1bqaq3+UlTx4ptuvKQavc2ZwQnOS2bsT5lBMqjXQocnxfz1RLR72G
 ZRO1DtHND8K6CFaOBhuEU5+Zs2qHEhTLeIML4agmcOShuNoNFvAvKMLDvlfNKcCebCcC
 yXefnAstRDtVhpQ8vXs0qgZlHbiy1Gy3UTQlYM2fZ90I5ECk1a5MZfjWzoEcqxTQ9HY5
 GpmuUFrXdD4MiW5xZnU2ocFIKCsKNEPjbT9AzuxVndRUqGG1A1zTTShlADh+mM7L0ai2
 bfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746658882; x=1747263682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vtr6Z3uXRjrwIOudB2G0wwIqDwu8zbz8ZZjV8N4QrW8=;
 b=RDU5Uy8S8WgMLsx3RLDZYybZ8iVo+Xyxle707Xj1N/PZVoRgdHRw6pAWQYbB6DaVh1
 j5eHFd3p8yRGdJMdB+oZJt7MdYYe2NY5Xo4VyQiuwxW6Reo0jNNmnKKGb6Pt/BEgxg3k
 /FtyiOOC9HGMUAFz7PWzC1Lf0mUslbPd7VGkHKIc0H/6PEbMEXZ/T4y5qyViif+0VUoZ
 Atk5wtr2Qk+J+8B3167EJsJsJicBdLzg4FOpEQhMC23P9N7TeGTdGfCu6ORKObjkcpgu
 bF74vWk8AVKg5qHDfAvP7afF2x0SiqtAovNKsGl5LVzqrZ0aDkDbizhweQ+QN/5k9W47
 51Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUERfuhgoHLuLdgTlW7hOfL3aHa/rHwnY/xpC3TNh0i7LI4GuP6mgC2WB1LVuKesQ+aKzIvBHnL99E=@lists.freedesktop.org,
 AJvYcCWJl62XG1I5lvWfY9Cgiwum8SmWzYGvx6l3Van6YMIPdVt6mtBa4i2HRirK/Z2mSh8pDPb7wT5UO3Od@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzC78/AhU/Ysv+s2jmOvnL57KJdlF91x5qZQToXTAcZDTlYVZo
 db2ct3Elvy3IyjHBcrYlGr+nv1wbBLlXrNezMafYSBUX+9glRls=
X-Gm-Gg: ASbGncvA8X6oVJ46MeF7CRfGKHalnAavjPFrjrRMejrhooRLxuSkYff+H8KftAtx3ce
 jamHmUKBtCbZXsKIWKe19p+RvAWgBXevwWQuYrxLOnyzZsP3+KRfIX8hWx8Yb/XEC+QK+cOhEhd
 3Ve7GtZN6S82jSKJDjwVF4DdpJ3gIDUi906L4Lpk/A98z5YtiG7GRvjY5vlY4KKTh+TkXZeBsnu
 k9pVrMbhj4XOk4+DE6vtCHAlWtYX15nII5OryJZqJq1jo0O7DV5jRHLSkaWXF8/LhYcS1/kcxQ4
 0/bHdQ8fJGNxGzEmOERIUwDbnGc9ei+iiezlIm4PSCtQbw==
X-Google-Smtp-Source: AGHT+IGgOqgiwXozfNdElrzWtq1i+GFP3auhQlx6gHo1wpD8zyMRrdBGxZGV8laM6gYsqYdlG1vMyQ==
X-Received: by 2002:a05:6402:1e8e:b0:5f8:e6de:fd0f with SMTP id
 4fb4d7f45d1cf-5fbe9e49289mr4179538a12.15.1746658881721; 
 Wed, 07 May 2025 16:01:21 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 16:01:21 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 2/4] drm/msm/dp: Account for LTTPRs capabilities
Date: Thu,  8 May 2025 00:59:00 +0200
Message-ID: <20250507230113.14270-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507230113.14270-1-alex.vinarskis@gmail.com>
References: <20250507230113.14270-1-alex.vinarskis@gmail.com>
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

Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Rob Clark <robdclark@gmail.com>
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

