Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A848701A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE5510EDC8;
	Fri,  7 Jan 2022 02:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B31310EDD4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:43 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h2so10227346lfv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cavINj3cofdeKu4U7XMW4TvkQD30lvi7kbRjPCa2LIY=;
 b=rqmMHxTRkxBezlU0DpApXj6CmPCvVe6iSMS3gnQffk6cfkuXdhKWWyryRJg2dfyX5r
 L5qFK9EFsyUKEc4omyAf3RBXFQDmW9ZBRA2KDgVLkliganJiFDzqbBgM7V2s5FAhjvH8
 82rZ5C+ZwWCS7+S3mXCsIXsmvjaFPZJnddI2ITMdIhpsI5zaBgNsY65gTd8DwBs4RjSz
 21hQ3z4Ikd5kv/4QQVE/75cF+VjmHxyyh2QAQJYgJeaprpD9CFJqvgMQA/b8F76pZPTt
 MP48hANI89zeJIu3u+77eWR/l+NDl0yQclhyZvbw4Uoo7LbHwWWOgntM5LrL52zVZFpD
 Fl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cavINj3cofdeKu4U7XMW4TvkQD30lvi7kbRjPCa2LIY=;
 b=KnTgqZkXx+u1R9yiC7VEIQyxygoSfOPROv2elYrszmcLNFCPzzuPLShLVhG2OpyW04
 A9cPvHw4+zw4tKFijeoe3v7vTcNtVMTRKxdiH9CLmi9HqDhHLR5yAWPNORWS3HUOCT91
 ERpGXDKr06asa+iJWAfxIAKRi+TDDJL4a4sW7q6PM96q6GL+0fZzVJQLqhRIzqesheBV
 XzLvnCtySl6CG4iMGFIAweGmpB3TBYwQvCngmGNipqJwzvksTH+9+eNkx/hlvrvcTx7O
 wszCd0Hx2KJFoGxjfGX77wD5mZAea6PMMWqA0haiuRFZsh6dahTdYwOQcOSpXjL3AnGA
 g5Gg==
X-Gm-Message-State: AOAM530M2UumH5871zqv+5R0gFZ6Ogch911e7hv2PD9VpmZM6fFwFJb4
 OCM6uqYV0jbchM2WpU8kf/LQwA==
X-Google-Smtp-Source: ABdhPJzrdA/wggs3ngCjXFAtkKp0DyG0Sq0NZxWjQKwdK/7ikm1DhWRSKvTXFkqcoczymqKfvGE1DA==
X-Received: by 2002:a05:6512:11c9:: with SMTP id
 h9mr39598037lfr.33.1641520901690; 
 Thu, 06 Jan 2022 18:01:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 7/7] drm/msm/dp: stop carying about the connector type
Date: Fri,  7 Jan 2022 05:01:32 +0300
Message-Id: <20220107020132.587811-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
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

After changing dp_parser code to always check for the next bridge, it
does not check connector type anymore. Remove connector type from the
dp_paser_parse() arguments list and from the struct msm_dp_desc fields
list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++-----
 drivers/gpu/drm/msm/dp/dp_parser.c  | 2 +-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 720e80ea99cb..0a71a17975b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -129,7 +129,6 @@ struct dp_display_private {
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
-	unsigned int connector_type;
 };
 
 struct msm_dp_config {
@@ -139,15 +138,15 @@ struct msm_dp_config {
 
 static const struct msm_dp_config sc7180_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000 },
 	},
 	.num_descs = 1,
 };
 
 static const struct msm_dp_config sc7280_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000 },
+		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000 },
 	},
 	.num_descs = 2,
 };
@@ -249,7 +248,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
+	rc = dp->parser->parse(dp->parser);
 	if (rc) {
 		DRM_ERROR("device tree parsing failed\n");
 		goto end;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 5de21f3d0812..044ab0b63b14 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -278,7 +278,7 @@ static int dp_parser_find_next_bridge(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_parse(struct dp_parser *parser, int connector_type)
+static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 4cec851e38d9..1f036dd3e224 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -125,7 +125,7 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	struct drm_bridge *next_bridge;
 
-	int (*parse)(struct dp_parser *parser, int connector_type);
+	int (*parse)(struct dp_parser *parser);
 };
 
 /**
-- 
2.34.1

