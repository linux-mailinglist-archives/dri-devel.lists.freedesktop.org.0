Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038143054F
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 00:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172996E8F6;
	Sat, 16 Oct 2021 22:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7A36E8E8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 22:16:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so181975otb.10
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8CkjnvD4XYRJbxbrS217o1yjl7s34UqdCCgpWSb1Mk=;
 b=AwNEKj9pbK/6em9liphva8EPTdEhaVRayPPdnsAA6F/l6pw8BaPCPLNq8bUoVeXjWQ
 Nw4FQj+jSQhS8ILFhIvZYoUDCQj9EY6nzxLW7Mq4V+hc0nfU1IN/PYnrDOu7WFNdwYV8
 ESvgmjqGlyDtGmcPr7J9dMq54Dvwm27Sq16AegCuDSxdx8OJodxBGOWibYukb6zB9/Cj
 d7mjEGc5HKbgIMT659oc/daYTQxQO4n+wfZVgcf7BdRnMFvgcRnG3bCfMmS76TjXm7Ij
 Hi+ExykxQHHt/WvU9PA/FzGDhMyNAMesFXpYekBR7qDQOjI15PMzaA352oFoVgr0VB5g
 E18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8CkjnvD4XYRJbxbrS217o1yjl7s34UqdCCgpWSb1Mk=;
 b=U71LO+ANPGhjY9u9ZjOwCRxSCh2vMClKkdjw0oXDbh9p02e1GH9buhe/qLILCJLoTF
 NUWszgD+8agozazWJMmMCIBqs6+5jXo9LoC8xqrjDJ95+aXpiXV+sSXVGDIdJ2bIJnq8
 DhhhvSaQdoDAUM4lqDKnyAJI2FziWES8X4gL8NXk/s2yxg0+tap3u4eOrG4MksMNlZj/
 +2Vzkyf4vi9/x56URI1m6SwGLL1qfwhtZQUo/FEzDNTM02IhundzEJLG0ZGkGvdqc8Yu
 r6+7x1Wq3w3P79kOgtjFgVXAoRqM6VDfQXYYzf0ay269nIEf9RmpwJ6/wVxP9BzCGd9N
 0s6w==
X-Gm-Message-State: AOAM530iCg9JkJoz983laize3pR6+aDfjKqattctcSg6j1Ya4HmYrV4j
 JlgVd6G/r81P54rS59oC99T/6Q==
X-Google-Smtp-Source: ABdhPJxgl7avB2mLcg2PB6GA+phwgmJNxUz+VaE+2gzimNVpdXjoF6ly/4xdO8ldK04YhM8pLLehQA==
X-Received: by 2002:a9d:718e:: with SMTP id o14mr15089096otj.299.1634422618854; 
 Sat, 16 Oct 2021 15:16:58 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 d15sm1747058oic.32.2021.10.16.15.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 15:16:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] drm/msm/dp: Allow attaching a drm_panel
Date: Sat, 16 Oct 2021 15:18:40 -0700
Message-Id: <20211016221843.2167329-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
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

eDP panels might need some power sequencing and backlight management,
so make it possible to associate a drm_panel with an eDP instance and
prepare and enable the panel accordingly.

Now that we know which hardware instance is DP and which is eDP,
parser->parse() is passed the connector_type and the parser is limited
to only search for a panel in the eDP case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- None

 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 30 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ++-
 5 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6913970c8cf9..c663cd619925 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/of_irq.h>
 #include <linux/delay.h>
+#include <drm/drm_panel.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
@@ -230,12 +231,14 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	priv = drm->dev_private;
 	priv->dp = &(dp->dp_display);
 
-	rc = dp->parser->parse(dp->parser);
+	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
 	if (rc) {
 		DRM_ERROR("device tree parsing failed\n");
 		goto end;
 	}
 
+	dp->dp_display.panel_bridge = dp->parser->panel_bridge;
+
 	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
 	if (rc) {
@@ -822,7 +825,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_prepare(struct msm_dp *dp)
+static int dp_display_prepare(struct msm_dp *dp_display)
 {
 	return 0;
 }
@@ -896,7 +899,7 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_display_unprepare(struct msm_dp *dp)
+static int dp_display_unprepare(struct msm_dp *dp_display)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 75fcabcfbbdd..8e80e3bac394 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,6 +15,7 @@ struct msm_dp {
 	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	struct drm_bridge *panel_bridge;
 	bool is_connected;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f33e31523f56..76856c4ee1d6 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 
 #include "msm_drv.h"
@@ -160,5 +161,15 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
+	if (dp_display->panel_bridge) {
+		ret = drm_bridge_attach(dp_display->encoder,
+					dp_display->panel_bridge, NULL,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret < 0) {
+			DRM_ERROR("failed to attach panel bridge: %d\n", ret);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return connector;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 4d6e047f803d..eb6bbfbea484 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -6,6 +6,7 @@
 #include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
 #include "dp_parser.h"
@@ -263,7 +264,28 @@ static int dp_parser_clock(struct dp_parser *parser)
 	return 0;
 }
 
-static int dp_parser_parse(struct dp_parser *parser)
+static int dp_parser_find_panel(struct dp_parser *parser)
+{
+	struct device *dev = &parser->pdev->dev;
+	struct drm_panel *panel;
+	int rc;
+
+	rc = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
+	if (rc) {
+		DRM_ERROR("failed to acquire DRM panel: %d\n", rc);
+		return rc;
+	}
+
+	parser->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	if (IS_ERR(parser->panel_bridge)) {
+		DRM_ERROR("failed to create panel bridge\n");
+		return PTR_ERR(parser->panel_bridge);
+	}
+
+	return 0;
+}
+
+static int dp_parser_parse(struct dp_parser *parser, int connector_type)
 {
 	int rc = 0;
 
@@ -284,6 +306,12 @@ static int dp_parser_parse(struct dp_parser *parser)
 	if (rc)
 		return rc;
 
+	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
+		rc = dp_parser_find_panel(parser);
+		if (rc)
+			return rc;
+	}
+
 	/* Map the corresponding regulator information according to
 	 * version. Currently, since we only have one supported platform,
 	 * mapping the regulator directly.
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index dac10923abde..3172da089421 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -123,8 +123,9 @@ struct dp_parser {
 	struct dp_display_data disp_data;
 	const struct dp_regulator_cfg *regulator_cfg;
 	u32 max_dp_lanes;
+	struct drm_bridge *panel_bridge;
 
-	int (*parse)(struct dp_parser *parser);
+	int (*parse)(struct dp_parser *parser, int connector_type);
 };
 
 /**
-- 
2.29.2

