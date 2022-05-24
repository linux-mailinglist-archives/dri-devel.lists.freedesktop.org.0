Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6453201F
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 03:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98C010E9A2;
	Tue, 24 May 2022 01:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487E10E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 01:05:52 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4FAEC84250;
 Tue, 24 May 2022 03:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653354350;
 bh=rF8cbpsxe0vH+jIy3j4Pfs7wTMhy2Evmo0QxORT6rBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mMZM+H3bzL2ZVBtCUpUlGZLVU9gVKhDwxDe/+sQxwlPbtjzFQVJm0kE55SbJ/pqD0
 3iexxSd7xYuebSVT9mQ+KcnoSvohsw5lpuq6JZPdF2y6ObJhTKa7y2wAQjWH8+ZjGV
 r35k/ErdYdNgBzH7JoynK+ur1shU+F+I5aujVP65P21nA1HqbwvNC2d9ZwsMvQL8Lb
 3Tat6z5MzXbB3GDd8asu4DiX18P1Uqr17gidnJWOKSGP7bVx7aW4uS/PeZqakMuJ68
 kHE+KaQlRb5WSU+VNO+4QzBG12TWP/oLW3tKP9Jp+WP0niooWNwqdEjHglurvJeRwm
 cQnfqRVaIAHxQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/11] drm/msm: Convert to drm_of_get_data_lanes_count
Date: Tue, 24 May 2022 03:05:21 +0200
Message-Id: <20220524010522.528569-10-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524010522.528569-1-marex@denx.de>
References: <20220524010522.528569-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Maxime Ripard <maxime@cerno.tech>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert driver to use this new helper to standardize
OF "data-lanes" parsing.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
---
V2: - Use drm/msm prefix
    - Rename drm_of_get_data_lanes{,_ep} to drm_of_get_data_lanes_count{,_ep}
    - Add RB from Andrzej and Dmitry
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 8f9fed9fdafc4..346556c5706d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -102,11 +102,9 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 static int dp_parser_misc(struct dp_parser *parser)
 {
 	struct device_node *of_node = parser->pdev->dev.of_node;
-	int len = 0;
-	const char *data_lane_property = "data-lanes";
+	int len;
 
-	len = of_property_count_elems_of_size(of_node,
-			 data_lane_property, sizeof(u32));
+	len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
 	if (len < 0) {
 		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
 				data_lane_property, DP_MAX_NUM_DP_LANES);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a95d5df52653c..90f9d3daa9a6d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1779,11 +1779,10 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 		return 0;
 	}
 
-	num_lanes = len / sizeof(u32);
-
-	if (num_lanes < 1 || num_lanes > 4) {
+	num_lanes = drm_of_get_data_lanes_count(ep, 1, 4);
+	if (num_lanes < 0) {
 		DRM_DEV_ERROR(dev, "bad number of data lanes\n");
-		return -EINVAL;
+		return num_lanes;
 	}
 
 	msm_host->num_data_lanes = num_lanes;
-- 
2.35.1

