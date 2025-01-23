Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135CA1A6AE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE2810E843;
	Thu, 23 Jan 2025 15:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WV4Mo8wW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307310E843;
 Thu, 23 Jan 2025 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644971; x=1769180971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pF/kDcBdLVM7aYd9aJedufMh9LibuSV9mXkSDswmU+8=;
 b=WV4Mo8wWIx0SQTuHODIRmCBsEu/sQOLQqF4OHuetcsNTeoHgcOqhKKBy
 TI4BXXNaDSdqsgo16XC7UozjS3Phw/hfJYCTjSAWlggMzSUY9IjwLjlMt
 l+Fur43kfUuXlBRppjrSIEiAuHjk0Kpk9XgZ+b3qvOXUMlZ1qn4R3hMjC
 Qto3nilJYNgZKoT6SjU9b92t3JkRhNXJ4C6/zh3XY0EtTEoLdH4rSdOeM
 A47D/1ruVSHelo9xchMb3F3G24lWk2Cn4ctHfW/FhnhEq3DdSbKhEumQm
 QIiJfUSTYRcYtxpg4tJzT9MMSnHBfQtRUOL8hoYb41dn+LxrG/7j9h9Ey A==;
X-CSE-ConnectionGUID: SBRIW6xhT9eT182eUe5ygw==
X-CSE-MsgGUID: MI3wXeyOTaiN26Jryxpf4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48644532"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48644532"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:31 -0800
X-CSE-ConnectionGUID: xPbLHVeBSq616OQf1WAQSA==
X-CSE-MsgGUID: TzDUErmnQpiQQvLgaCPQJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107297820"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device to
 drm_err() and friends
Date: Thu, 23 Jan 2025 17:09:09 +0200
Message-Id: <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
current usage, but drops "[drm] *ERROR*" prefix from logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Looks like it's possible to hunt down the struct drm_device in most of
these cases, if that's desired. This was the simplest change.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    | 16 ++++++++--------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index e7a6669c46b0..f737e7d46e66 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -203,7 +203,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
 		return PTR_ERR(hdmi->regmap);
 	}
 
@@ -214,7 +214,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	if (IS_ERR(hdmi->ref_clk)) {
 		ret = PTR_ERR(hdmi->ref_clk);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get reference clock\n");
+			dev_err(hdmi->dev, "failed to get reference clock\n");
 		return ret;
 	}
 
@@ -222,7 +222,7 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	if (IS_ERR(hdmi->grf_clk)) {
 		ret = PTR_ERR(hdmi->grf_clk);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get grf clock\n");
+			dev_err(hdmi->dev, "failed to get grf clock\n");
 		return ret;
 	}
 
@@ -302,16 +302,16 @@ static void dw_hdmi_rockchip_encoder_enable(struct drm_encoder *encoder)
 
 	ret = clk_prepare_enable(hdmi->grf_clk);
 	if (ret < 0) {
-		drm_err(hdmi, "failed to enable grfclk %d\n", ret);
+		dev_err(hdmi->dev, "failed to enable grfclk %d\n", ret);
 		return;
 	}
 
 	ret = regmap_write(hdmi->regmap, hdmi->chip_data->lcdsel_grf_reg, val);
 	if (ret != 0)
-		drm_err(hdmi, "Could not write to GRF: %d\n", ret);
+		dev_err(hdmi->dev, "Could not write to GRF: %d\n", ret);
 
 	clk_disable_unprepare(hdmi->grf_clk);
-	drm_dbg(hdmi, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
+	dev_dbg(hdmi->dev, "vop %s output to hdmi\n", ret ? "LIT" : "BIG");
 }
 
 static int
@@ -574,7 +574,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "Unable to parse OF data\n");
+			dev_err(hdmi->dev, "Unable to parse OF data\n");
 		return ret;
 	}
 
@@ -582,7 +582,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get phy\n");
+			dev_err(hdmi->dev, "failed to get phy\n");
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index f41151d49fca..3d1dddb34603 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -242,7 +242,7 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_struct *work)
 	if (drm) {
 		changed = drm_helper_hpd_irq_event(drm);
 		if (changed)
-			drm_dbg(hdmi, "connector status changed\n");
+			dev_dbg(hdmi->dev, "connector status changed\n");
 	}
 }
 
@@ -472,7 +472,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 		}
 	}
 	if (hdmi->port_id < 0) {
-		drm_err(hdmi, "Failed to match HDMI port ID\n");
+		dev_err(hdmi->dev, "Failed to match HDMI port ID\n");
 		return hdmi->port_id;
 	}
 
@@ -496,20 +496,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	hdmi->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 						       "rockchip,grf");
 	if (IS_ERR(hdmi->regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,grf\n");
 		return PTR_ERR(hdmi->regmap);
 	}
 
 	hdmi->vo_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
 							  "rockchip,vo-grf");
 	if (IS_ERR(hdmi->vo_regmap)) {
-		drm_err(hdmi, "Unable to get rockchip,vo-grf\n");
+		dev_err(hdmi->dev, "Unable to get rockchip,vo-grf\n");
 		return PTR_ERR(hdmi->vo_regmap);
 	}
 
 	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
 	if (ret < 0) {
-		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
+		dev_err(hdmi->dev, "Failed to get clocks: %d\n", ret);
 		return ret;
 	}
 
@@ -517,7 +517,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(hdmi->enable_gpio)) {
 		ret = PTR_ERR(hdmi->enable_gpio);
-		drm_err(hdmi, "Failed to request enable GPIO: %d\n", ret);
+		dev_err(hdmi->dev, "Failed to request enable GPIO: %d\n", ret);
 		return ret;
 	}
 
@@ -525,7 +525,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
 		if (ret != -EPROBE_DEFER)
-			drm_err(hdmi, "failed to get phy: %d\n", ret);
+			dev_err(hdmi->dev, "failed to get phy: %d\n", ret);
 		return ret;
 	}
 
@@ -564,7 +564,7 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
-		drm_err(hdmi, "failed to init bridge connector: %d\n", ret);
+		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
 		return ret;
 	}
 
-- 
2.39.5

