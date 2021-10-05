Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251FA423443
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 01:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A39A6EC90;
	Tue,  5 Oct 2021 23:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E46EC92
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 23:11:47 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 h16-20020a9d3e50000000b0054e25708f41so102177otg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 16:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXBCYrJKUPOGWEc8dBm9AMnJ3AoGqh3lAsMFqG0I9WE=;
 b=CYWeCmd64U389/fJPUAQFW3gGmdlywUTbTuKQR5z7WswzXzZ9qvrAMC2uEoLHwY/WJ
 Ni1yyMOlSaIPGpeL25B6idvxGROpik74RD/znMIMoTi1KRJ0+laHZbFGz6CpZWKStAqd
 051O/keH6dyisRy3CWZCxgnZ55/CEYP7Gyf6Pzd+1Krta/Su0ier/GawoFwAnhR6NLPF
 VExub2gIIrehUudA6qQ8eatYW4IDA6Cj52kwQvdT57kIMfEXkecnVpLtLcrTVS1BGo87
 EJnIkGOKWb3vaTHuZsRqa3vV+0lYvSQ9FW7bhZL2/Ms7BRNIJsjxAwEzi32O+kKPe7Sf
 ZVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXBCYrJKUPOGWEc8dBm9AMnJ3AoGqh3lAsMFqG0I9WE=;
 b=YA+N7PM0nt9DFfha8SAmwmEFiJYXZ4+Qwgbj0CkOZOMGmk4mxAk5KDAy2Jjv3IE3tE
 A+hZ8tLlRtoad8kuA9mvoCSwtoHGee5S7A8GZN+NTWlJA2UeLw/AmxNG5oABGyvg4C2p
 x068/D8zTW2t11liMWN8M0H/y4RcEGwmHsDd9QpagQhPayKTFMLx+zuATvY/E2sJhT5T
 rIQYQozSWuqruEZ7fB8zHY91Vmb0loavNYnEJ9oO9J1goHiWHHpSMGbKvY2FS0SlkS2w
 7ODGbq8f3mPvKhDV5iG6m+Me4QPFRXWz2n9N2t+Stc52gznhd7O2si+XX571ptYDVtBg
 Fv4A==
X-Gm-Message-State: AOAM533rXQZ56+b0frL4AeUKOkjOsdXfzpkkfkypoAVN3lKdRY1LnI0E
 XyaWbO3n1gihyaBxT8WAojet4g==
X-Google-Smtp-Source: ABdhPJyBomwp0bowdkNIxHKO7gAJOuCcozkgPXTJC63VQVc8fCOjCp2x6RKbHi5vEt6nA7Y6rKakLA==
X-Received: by 2002:a05:6830:4488:: with SMTP id
 r8mr9817537otv.274.1633475506329; 
 Tue, 05 Oct 2021 16:11:46 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 v9sm1665141oth.62.2021.10.05.16.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 16:11:45 -0700 (PDT)
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
Subject: [PATCH v4 4/7] drm/msm/dp: Allow attaching a drm_panel
Date: Tue,  5 Oct 2021 16:13:20 -0700
Message-Id: <20211005231323.2663520-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
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

Changes since v3:
- Previously posted separately, now added to series
- Make the search for a panel conditional on it being an eDP connector
- Move the search to of_graph port 1 (was 2 to distinguish from DP link to USB-C connector)

 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     | 11 +++++++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 30 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ++-
 5 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index eaf08f9e7d87..bdaf227f05dc 100644
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
index 02999408c052..24aefca66029 100644
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

