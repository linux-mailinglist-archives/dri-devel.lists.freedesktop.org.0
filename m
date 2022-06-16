Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A254DDCB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77701113BB3;
	Thu, 16 Jun 2022 09:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1874113BB3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:03:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id 20so1217550lfz.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
 b=Y3riwIpAM2iIU/hX5yfy2hJLoLXc2eVsvqBz5J/HPfEm9R7mPOxVbj3hnD0a0sS2UE
 GAQw8868YRHX1Fjkoohlndz0Mjqk9srWEneE2dKvhXqE7US7tc0FHRWOj1PhZNiwo0oe
 kYat/gsfFBdTcGTtrGU0wKjxzp4zv6mse69Pl4Mf+6cYg9zMPLD5/14P8Mwuh2u/YgXo
 /qyXHlfALdRhJIO1Lx8Hn7Hik+5vQKIveWgG4uYGQUtfTf6MtLkvJtwOH26CvJmRh5n0
 f+3wcXdzKf42K8UfEpTrl0TCfuhdeVDbB8HvB6MaveajTCdbvzID5p0HdqNNG/wdd/nN
 O2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
 b=5bbVt/IP3kRO7NsGpyyWtt57d1yFeCKFQYDSlmQ6HYqTyFHLnEKXfkOE36eYf5csvk
 l4CJRZGIVKV2rr/UhOsCb4eLAhzobfqlvUvaJ6ZXz//VErHVB7jOTUe2S1sc73yCAR+z
 3eSEopHSQJ2qH4hRBpcXo8Waul0bdTxtYgeqNZyxLOvwn0Bz+LL2ihOsjJ3OrTzn0mud
 EG8h5Ik8GHYCD64XlHUipO08oJfxzMOiEBFBzQ3HDrfUcRMUBAnYX9MCOy13wAoXdWQ4
 KWoX2/CSBW6MIKmGgf9U3VHPVTjVJjUo+JI+EN8B6qbqh7axZCPMVNexNQpZpf84HgBE
 nBmw==
X-Gm-Message-State: AJIora+AOe2ZSdgD7+U5ogdtZnbftW2MbiJ9G+GZ8Uc8ZZNLoO782kWF
 oieM4dzNYujqx38+A/u4jUk7Og==
X-Google-Smtp-Source: AGRyM1sJd/hJj6+kBa8lG/oP1fzLl5O9w8ImTr+6IK3JzwaOublnKhnxn0YOYGPyQKguDCqpcQTx4Q==
X-Received: by 2002:ac2:58e1:0:b0:47d:b1fa:d09f with SMTP id
 v1-20020ac258e1000000b0047db1fad09fmr1926144lfo.213.1655370203866; 
 Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j9-20020a2e8009000000b0025575338c41sm172573ljg.127.2022.06.16.02.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH 1/2] drm/msm/mdp4: move move_valid callback to lcdc_encoder
Date: Thu, 16 Jun 2022 12:03:20 +0300
Message-Id: <20220616090321.433249-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
References: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  1 -
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 26 ++++++++++++++-----
 .../drm/msm/disp/mdp4/mdp4_lvds_connector.c   | 20 --------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..d27fa761bfc2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -197,7 +197,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..341dcd5087da 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -366,19 +366,31 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static int mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..4755eb13ef79 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,25 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -86,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */
-- 
2.35.1

