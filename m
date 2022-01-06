Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CE4860DE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 08:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D69D112BA0;
	Thu,  6 Jan 2022 07:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0784112B9F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 07:06:59 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id i11so2631112ljm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 23:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeZITS2hbPgnRPSasq0/v8/l0kJaM5t3PVHYhFxDOLU=;
 b=kZi73krNgb+uFyic1z9Zmf5+OVrkW75BfSF0YR8TeWelZlInutyrqhzQo3E9TGGDGQ
 nXi/hq2nc8tUWl/oPDflCCXoKMr+WUhcr8NxY3SdN82fBbasCnxmQ0BAMpBR1HcaUTkC
 CI20BRGmrGTZBYWcsIFy/oLBy0ien9GEpzVMcDWCVjH6ACyDYpzlAOme7k8rOex0SIGa
 fYzruSr/nWxQmnfQ9Rknedl1TWEtG98H50+b5oEsRpLMC27S3b101Elgjx7m9XIaN1Ag
 EmMUZiVxY4rLVndw2wNFjfv9FmDN8H1JNL1xFWRFdF6kGNG+F/HlF9tOcg1FnSgsfYUj
 gYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SeZITS2hbPgnRPSasq0/v8/l0kJaM5t3PVHYhFxDOLU=;
 b=aBfxNwbn20EwHPof6WY4ZPxqlc8a/EUztUuQ7lhy0Tm/+22vwUM8KOCxJA1B3xt3W8
 f6iUkISSybyJYxcCkaR2RrJ8h5rr4Z8Rpe9fUx4E92R9r4dOMHGHhhcK02RD5WeKK7ep
 Nfkrbb4aYGvDvRjIHLn2rUs3vA/dnmTfPeTkkFeTIwHAqUBg4sR7s6msS1uhMxR+/xOk
 MA9MicwHtJFfBCvQPnBAsbw5aa++yF7i2sAo9sPXjYsqRBXvBoYMHyiV3FKj7PYHXmrv
 hjgQlNWYjB9SkV+9x51lRO9N1oXXWtaoUK65LYywIYQA7wjUSjerviM6tOkRQvvGOOd1
 6UrA==
X-Gm-Message-State: AOAM532d1O6/bGI0O8ccq7/pixw4tNkY8zYakoyREF+PI03anshPQ3DN
 Khb/lsar9uRZ71fO2NNuEHJuug==
X-Google-Smtp-Source: ABdhPJwlxzfS87+2bRBS2ruQE5ZSDCpELJcogn4BR3LwqrrkwsLWFE5cge8Nd9bz+4Bsd0Pz9OOxFg==
X-Received: by 2002:a2e:a816:: with SMTP id l22mr9917936ljq.119.1641452817974; 
 Wed, 05 Jan 2022 23:06:57 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k24sm99814lji.27.2022.01.05.23.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 23:06:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2] drm/msm: reduce usage of round_pixclk callback
Date: Thu,  6 Jan 2022 10:06:56 +0300
Message-Id: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The round_pixclk() callback returns different rate only on MDP4 in HDMI
(DTV) case. Stop using this callback in other cases to simplify
mode_valid callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Rebased on top of HDMI changes
 - Dropped eDP part, driver got removed

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  7 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  7 -------
 drivers/gpu/drm/msm/dsi/dsi_manager.c    | 22 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c   | 11 +++++++----
 4 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..ebbee5f103e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -774,12 +774,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return ret;
 }
 
-static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
-		struct drm_encoder *encoder)
-{
-	return rate;
-}
-
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
 	int i;
@@ -948,7 +942,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.disable_vblank  = dpu_kms_disable_vblank,
 	.check_modified_format = dpu_format_check_modified_format,
 	.get_format      = dpu_get_msm_format,
-	.round_pixclk    = dpu_kms_round_pixclk,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 12a5f81e402b..20859fd7af4a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -190,12 +190,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
 }
 
-static long mdp5_round_pixclk(struct msm_kms *kms, unsigned long rate,
-		struct drm_encoder *encoder)
-{
-	return rate;
-}
-
 static int mdp5_set_split_display(struct msm_kms *kms,
 		struct drm_encoder *encoder,
 		struct drm_encoder *slave_encoder,
@@ -278,7 +272,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
 		.get_format      = mdp_get_format,
-		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index f19bae475c96..1dbbfca163d9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -305,27 +305,6 @@ static int dsi_mgr_connector_get_modes(struct drm_connector *connector)
 	return num;
 }
 
-static enum drm_mode_status dsi_mgr_connector_mode_valid(struct drm_connector *connector,
-				struct drm_display_mode *mode)
-{
-	int id = dsi_mgr_connector_get_id(connector);
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
-	struct msm_drm_private *priv = connector->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	long actual, requested;
-
-	DBG("");
-	requested = 1000 * mode->clock;
-	actual = kms->funcs->round_pixclk(kms, requested, encoder);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static struct drm_encoder *
 dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 {
@@ -586,7 +565,6 @@ static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
 
 static const struct drm_connector_helper_funcs dsi_mgr_conn_helper_funcs = {
 	.get_modes = dsi_mgr_connector_get_modes,
-	.mode_valid = dsi_mgr_connector_mode_valid,
 	.best_encoder = dsi_mgr_connector_best_encoder,
 };
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 68fba4bf7212..10ebe2089cb6 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -282,15 +282,18 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 	long actual, requested;
 
 	requested = 1000 * mode->clock;
-	actual = kms->funcs->round_pixclk(kms,
-			requested, hdmi_bridge->hdmi->encoder);
 
 	/* for mdp5/apq8074, we manage our own pixel clk (as opposed to
 	 * mdp4/dtv stuff where pixel clk is assigned to mdp/encoder
 	 * instead):
 	 */
-	if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], actual);
+	if (kms->funcs->round_pixclk)
+		actual = kms->funcs->round_pixclk(kms,
+			requested, hdmi_bridge->hdmi->encoder);
+	else if (config->pwr_clk_cnt > 0)
+		actual = clk_round_rate(hdmi->pwr_clks[0], requested);
+	else
+		actual = requested;
 
 	DBG("requested=%ld, actual=%ld", requested, actual);
 
-- 
2.34.1

