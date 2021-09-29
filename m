Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CD41C3D8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 13:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3BD6EA2A;
	Wed, 29 Sep 2021 11:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617646EA29;
 Wed, 29 Sep 2021 11:53:54 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id CEB314060E; 
 Wed, 29 Sep 2021 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632916432;
 bh=SA3MOhUQB8LiGeG2R1qfgrcRYehbqo7vhZPQxaRL3OU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=jtY1PiModmvCpOJ9on9ATR8EYWn4f0xjXLFdHz/GnD5zjepReEYx9+6JuzHeXnTNN
 aXgW3N/Da0O0NbUV1k/P3scgIjJytZfrTddN9sj5di67DIkmrRSfVTgHOFLN1FHcbE
 BFYBe5S8o5QVsI72uG3akFb5Y4m+J3iNfyub/RXPu4fXsR5ECTmUGYpOOTvKzVSH6m
 LQEhzoYzeQL/MOdI5Pmn75MUuNfG7rd+Sg0S/W9OjD2mRC9nPv3I9aiJB9kjBzqdKJ
 wadzjsHAiAVLeT7/u7n1JE+FBdN4C8NMlRmumkooFn+1IDPv89R3Vs6sB++vGRFIh0
 KsS0uqJDv1plw==
From: Colin King <colin.king@canonical.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][V2] drm/msm: Fix potential integer overflow on 32 bit multiply
Date: Wed, 29 Sep 2021 12:53:52 +0100
Message-Id: <20210929115352.212849-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

In the case where clock is 2147485 or greater the 32 bit multiplication
by 1000 will cause an integer overflow. Fix this by making the constant
1000 an unsigned long to ensure a long multiply occurs to avoid the
overflow before assigning the result to the long result in variable
requested.  Most probably a theoretical overflow issue, but worth fixing
to clear up static analysis warnings.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
Fixes: 3e87599b68e7 ("drm/msm/mdp4: add LVDS panel support")
Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
Fixes: ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Find and fix all unintentional integer overflows that match this
    overflow pattern.
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c    | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c   | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                    | 4 ++--
 drivers/gpu/drm/msm/edp/edp_connector.c             | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c              | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c           | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
index 88645dbc3785..83140066441e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
@@ -50,7 +50,7 @@ static void mdp4_dtv_encoder_mode_set(struct drm_encoder *encoder,
 
 	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
 
-	mdp4_dtv_encoder->pixclock = mode->clock * 1000;
+	mdp4_dtv_encoder->pixclock = mode->clock * 1000U;
 
 	DBG("pixclock=%lu", mdp4_dtv_encoder->pixclock);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..d90dc0a39855 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -225,7 +225,7 @@ static void mdp4_lcdc_encoder_mode_set(struct drm_encoder *encoder,
 
 	DBG("set mode: " DRM_MODE_FMT, DRM_MODE_ARG(mode));
 
-	mdp4_lcdc_encoder->pixclock = mode->clock * 1000;
+	mdp4_lcdc_encoder->pixclock = mode->clock * 1000U;
 
 	DBG("pixclock=%lu", mdp4_lcdc_encoder->pixclock);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..a965e7962a7f 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -64,7 +64,7 @@ static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
 	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
 	long actual, requested;
 
-	requested = 1000 * mode->clock;
+	requested = 1000U * mode->clock;
 	actual = mdp4_lcdc_round_pixclk(encoder, requested);
 
 	DBG("requested=%ld, actual=%ld", requested, actual);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 62e75dc8afc6..6babeb79aeb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1316,7 +1316,7 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	opts_dp->lanes = ctrl->link->link_params.num_lanes;
 	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
 	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
-					ctrl->link->link_params.rate * 1000);
+					ctrl->link->link_params.rate * 1000U);
 
 	phy_configure(phy, &dp_io->phy_opts);
 	phy_power_on(phy);
@@ -1336,7 +1336,7 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	int ret = 0;
 
 	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
-					ctrl->dp_ctrl.pixel_rate * 1000);
+					ctrl->dp_ctrl.pixel_rate * 1000U);
 
 	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/edp/edp_connector.c b/drivers/gpu/drm/msm/edp/edp_connector.c
index 73cb5fd97a5a..837e7873141f 100644
--- a/drivers/gpu/drm/msm/edp/edp_connector.c
+++ b/drivers/gpu/drm/msm/edp/edp_connector.c
@@ -64,7 +64,7 @@ static int edp_connector_mode_valid(struct drm_connector *connector,
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
 
-	requested = 1000 * mode->clock;
+	requested = 1000L * mode->clock;
 	actual = kms->funcs->round_pixclk(kms,
 			requested, edp_connector->edp->encoder);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 6e380db9287b..e4c68a59772a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -209,7 +209,7 @@ static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 
 	mode = adjusted_mode;
 
-	hdmi->pixclock = mode->clock * 1000;
+	hdmi->pixclock = mode->clock * 1000U;
 
 	hstart = mode->htotal - mode->hsync_start;
 	hend   = mode->htotal - mode->hsync_start + mode->hdisplay;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 58707a1f3878..ce116a7b1bba 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -385,7 +385,7 @@ static int msm_hdmi_connector_mode_valid(struct drm_connector *connector,
 	struct msm_kms *kms = priv->kms;
 	long actual, requested;
 
-	requested = 1000 * mode->clock;
+	requested = 1000U * mode->clock;
 	actual = kms->funcs->round_pixclk(kms,
 			requested, hdmi_connector->hdmi->encoder);
 
-- 
2.32.0

