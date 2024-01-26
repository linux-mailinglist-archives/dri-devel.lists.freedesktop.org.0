Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0983E175
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA96510FD62;
	Fri, 26 Jan 2024 18:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB510FD4E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:37 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2cf3ea86423so7568671fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293595; x=1706898395; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UxGc0QEVEAiuhcb+m6WRpEuH/wAutaZBlt2LY4FoYiU=;
 b=E+gDTT60HaYNqPQbItlTywXpXxkDpXuE/i+NSAtiLXHXXgV24ymAEkOH+oEdOPo/ey
 Q8/kpVmyVrhmgg3SiukPi5aVBNOVDttRwc3/bzeZNiuzMpNK7HSJK6yqRtfEwm+7wMgL
 25OhGD0FNCzO/P3NKmQu3pJIhKXwF1KAhuU4kYXYfYnR6btxPp1hA9bWFgAG8rU18GMj
 B3NVmSFde6r2GKp93IIvv8ifPd5oaRfe5XBIUjlm0dwDt7whBA6OFrvMZCDKwM4u62MR
 eNgS6k2MVk8F85CUDOzieOw7RBPSaIogIBmxLOJ20uXJ3UX5E8sVNO/xEUli8VRq6f3P
 KzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293595; x=1706898395;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UxGc0QEVEAiuhcb+m6WRpEuH/wAutaZBlt2LY4FoYiU=;
 b=I5nU2C6CfVD65QENuD3FtimbRpvD3oBrmY2071Meg2sDLQLnDsGUiLofKHhKFeQxx2
 hftTKGdlUeG+Sax7uWlBHpKAQFImWb0/RyJstlnvFiC3cUDImKCt7hJU4k4/VHiGZgVl
 AxrnkBBxk4AB2AlLWJhc9JHZJefSQKTirZdanPDslkNfdUJq9P9JoI+Wmfr7SYjlnOTp
 /ZFW+FIJgwcfqDCD6HqcSOa/4NILigg2xx0yDKQuxFBsG41Ui8sRLyZ13SqvZ8w0xW5t
 Zv4v64MQZaIO8p/t2cJK56sAkiGO3oV6pIKbiZfWmjoHXVKQlKlMqKjGWWvCzCqWI3bt
 mWDw==
X-Gm-Message-State: AOJu0YwaaVAqbOn5dI7tGnJICT6FsZyDoWA5l4x2ILjPfms3IPKlCy3I
 nKIet22YBkd6HW6Ux3zgTEHBh3yB4rfLixj8Vauvg/urQarAvvsdQKp4gdoF0cw=
X-Google-Smtp-Source: AGHT+IFgo15F6h5uixsWvyp4Zc1cUf2mgWm4uKlHaGtbaU2zokxMBO0Er+q909UTkk2SB4gislNDqA==
X-Received: by 2002:a05:651c:b8c:b0:2cf:425b:59ee with SMTP id
 bg12-20020a05651c0b8c00b002cf425b59eemr138292ljb.24.1706293595612; 
 Fri, 26 Jan 2024 10:26:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:32 +0200
Subject: [PATCH RESEND v3 13/15] drm/msm/dp: move link property handling to
 dp_panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-13-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7400;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0NAS4mEEbdPscE96IS/ZQUPtnwStNLMs/YpeYKfO3to=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lRP1QCt9GBigGfqxw/tYUlRxPfAkf+5rY1Y
 mHcknjGLUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UQAKCRCLPIo+Aiko
 1VXSCACHgM26HuEVnbtE/81sb1mkQTTBMB8cmmM00c1h/1OjnKTVHlWdwK8hblazQYW2tjYHPL3
 IWYLzqSzYvJRJvnwIZ6kY3S7J5MFJ4ha1FjV08+OMYfAhpvTSQ8bCgmDjWuIofuXDPbHAx0g+04
 ToD5tI8JodrV40sKld2gwTBdry1FLrW0XgiL1PNAoD0TucOVCR46cOA88mmE47jf1QX3K72ZHGE
 v93+RGIyUavp9E+m8eImRayOIX+XHZ3wVXt7ECvw5Dyg+fv0YJtDI7yDMNA6MJOA8XYD44Ubnxg
 mygoFNYByHyg8S5v4kmQXYiGiNEjJXSaRRhjQAEYZ603b7jg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of passing link properties through the separate struct, parse
them directly in the dp_panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 -----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 66 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 54 ------------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  4 ---
 5 files changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5ad96989c5f2..f19cb8c7e8cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -356,12 +356,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	int rc = 0;
 	struct edid *edid;
 
-	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
-	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
-
-	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
-		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
-
 	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
 	if (rc)
 		goto end;
@@ -381,8 +375,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
-	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
-
 	/*
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 102f3507d824..70759dd1bfd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -28,7 +28,6 @@ struct msm_dp {
 
 	bool wide_bus_en;
 
-	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 	bool psr_supported;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 127f6af995cd..8242541a81b9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -7,8 +7,12 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#define DP_MAX_NUM_DP_LANES	4
+#define DP_LINK_RATE_HBR2	540000 /* kbytes */
+
 struct dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -138,6 +142,9 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
+	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
+		dp_panel->max_dp_lanes, dp_panel->max_dp_link_rate);
+
 	rc = dp_panel_read_dpcd(dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
@@ -386,10 +393,65 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 	return 0;
 }
 
+static u32 dp_panel_link_frequencies(struct device_node *of_node)
+{
+	struct device_node *endpoint;
+	u64 frequency = 0;
+	int cnt;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+	if (!endpoint)
+		return 0;
+
+	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
+
+	if (cnt > 0)
+		of_property_read_u64_index(endpoint, "link-frequencies",
+						cnt - 1, &frequency);
+	of_node_put(endpoint);
+
+	do_div(frequency,
+		10 * /* from symbol rate to link rate */
+		1000); /* kbytes */
+
+	return frequency;
+}
+
+static int dp_panel_parse_dt(struct dp_panel *dp_panel)
+{
+	struct dp_panel_private *panel;
+	struct device_node *of_node;
+	int cnt;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	of_node = panel->dev->of_node;
+
+	/*
+	 * data-lanes is the property of dp_out endpoint
+	 */
+	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
+	if (cnt < 0) {
+		/* legacy code, data-lanes is the property of mdss_dp node */
+		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
+	}
+
+	if (cnt > 0)
+		dp_panel->max_dp_lanes = cnt;
+	else
+		dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+
+	dp_panel->max_dp_link_rate = dp_panel_link_frequencies(of_node);
+	if (!dp_panel->max_dp_link_rate)
+		dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
+
+	return 0;
+}
+
 struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 {
 	struct dp_panel_private *panel;
 	struct dp_panel *dp_panel;
+	int ret;
 
 	if (!in->dev || !in->catalog || !in->aux || !in->link) {
 		DRM_ERROR("invalid input\n");
@@ -408,6 +470,10 @@ struct dp_panel *dp_panel_get(struct dp_panel_in *in)
 	dp_panel = &panel->dp_panel;
 	dp_panel->max_bw_code = DP_LINK_BW_8_1;
 
+	ret = dp_panel_parse_dt(dp_panel);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return dp_panel;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 2d0dd4353cdf..aa135d5cedbd 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,56 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-static u32 dp_parser_link_frequencies(struct device_node *of_node)
-{
-	struct device_node *endpoint;
-	u64 frequency = 0;
-	int cnt;
-
-	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
-	if (!endpoint)
-		return 0;
-
-	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
-
-	if (cnt > 0)
-		of_property_read_u64_index(endpoint, "link-frequencies",
-						cnt - 1, &frequency);
-	of_node_put(endpoint);
-
-	do_div(frequency,
-		10 * /* from symbol rate to link rate */
-		1000); /* kbytes */
-
-	return frequency;
-}
-
-static int dp_parser_misc(struct dp_parser *parser)
-{
-	struct device_node *of_node = parser->pdev->dev.of_node;
-	int cnt;
-
-	/*
-	 * data-lanes is the property of dp_out endpoint
-	 */
-	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
-	if (cnt < 0) {
-		/* legacy code, data-lanes is the property of mdss_dp node */
-		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
-	}
-
-	if (cnt > 0)
-		parser->max_dp_lanes = cnt;
-	else
-		parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
-
-	parser->max_dp_link_rate = dp_parser_link_frequencies(of_node);
-	if (!parser->max_dp_link_rate)
-		parser->max_dp_link_rate = DP_LINK_RATE_HBR2;
-
-	return 0;
-}
-
 int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
 {
 	struct platform_device *pdev = parser->pdev;
@@ -101,10 +51,6 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
-	rc = dp_parser_misc(parser);
-	if (rc)
-		return rc;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 7306768547a6..21a66932e35e 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -11,8 +11,6 @@
 #include "msm_drv.h"
 
 #define DP_MAX_PIXEL_CLK_KHZ	675000
-#define DP_MAX_NUM_DP_LANES	4
-#define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
 /**
  * struct dp_parser - DP parser's data exposed to clients
@@ -23,8 +21,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	u32 max_dp_lanes;
-	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
 };
 

-- 
2.39.2

