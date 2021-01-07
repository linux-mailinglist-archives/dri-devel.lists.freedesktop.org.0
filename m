Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6472EEED7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1E56E7E6;
	Fri,  8 Jan 2021 08:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE296E527
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 20:31:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610051496; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rGtiyIUQzSQUfcYufCkTsN6R9TU5i6mxMo6AQakOfqs=;
 b=G/AD3AVqNHUKPMElv0sKL3uImGGraKQNh6tqhL9zVQrbTZmfbGxcKBdjMH3ePzrLO61ZxR0X
 qK4e1lJ/4AGVtbK0wRHOMveT5edchH8379Arruy4/9Z6tAGnLgC4RiV5RN3/u231mPfw7qsv
 M2QdTOYvn1fDKQRl/YMnFlPfKbc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ff76f92661021aa283e79d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 20:31:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF4DFC43462; Thu,  7 Jan 2021 20:31:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 402E1C433CA;
 Thu,  7 Jan 2021 20:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 402E1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd handler
Date: Thu,  7 Jan 2021 12:30:25 -0800
Message-Id: <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
References: <y>
 <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is HPD unplug interrupts missed at scenario of an irq_hpd
followed by unplug interrupts with around 10 ms in between.
Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
irq_hpd handler should not issues either aux or sw reset to avoid
following unplug interrupt be cleared accidentally.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |  7 -------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++++-----
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 19b35ae..1c6e1d2 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -336,7 +336,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ssize_t ret;
 	int const aux_cmd_native_max = 16;
 	int const aux_cmd_i2c_max = 128;
-	int const retry_count = 5;
 	struct dp_aux_private *aux = container_of(dp_aux,
 		struct dp_aux_private, dp_aux);
 
@@ -378,12 +377,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ret = dp_aux_cmd_fifo_tx(aux, msg);
 
 	if (ret < 0) {
-		if (aux->native) {
-			aux->retry_cnt++;
-			if (!(aux->retry_cnt % retry_count))
-				dp_catalog_aux_update_cfg(aux->catalog);
-			dp_catalog_aux_reset(aux->catalog);
-		}
 		usleep_range(400, 500); /* at least 400us to next try */
 		goto unlock_exit;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 44f0c57..9c0ce98 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 	return 0;
 }
 
+/**
+ * dp_catalog_aux_reset() - reset AUX controller
+ *
+ * @aux: DP catalog structure
+ *
+ * return: void
+ *
+ * This function reset AUX controller
+ *
+ * NOTE: reset AUX controller will also clear any pending HPD related interrupts
+ * 
+ */
 void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
 {
 	u32 aux_ctrl;
@@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 	return 0;
 }
 
+/**
+ * dp_catalog_ctrl_reset() - reset DP controller
+ *
+ * @aux: DP catalog structure
+ *
+ * return: void
+ *
+ * This function reset DP controller
+ *
+ * NOTE: reset DP controller will also clear any pending HPD related interrupts
+ * 
+ */
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
 {
 	u32 sw_reset;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e3462f5..f96c415 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
 	 * transitioned to PUSH_IDLE. In order to start transmitting
 	 * a link training pattern, we have to first do soft reset.
 	 */
-	dp_catalog_ctrl_reset(ctrl->catalog);
+	if (*training_step != DP_TRAINING_NONE)
+		dp_catalog_ctrl_reset(ctrl->catalog);
 
 	ret = dp_ctrl_link_train(ctrl, cr, training_step);
 
@@ -1491,15 +1492,18 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	return 0;
 }
 
+static void dp_ctrl_link_idle_reset(struct dp_ctrl_private *ctrl)
+{
+	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+	dp_catalog_ctrl_reset(ctrl->catalog);
+}
+
 static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 {
 	int ret = 0;
 	struct dp_cr_status cr;
 	int training_step = DP_TRAINING_NONE;
 
-	dp_ctrl_push_idle(&ctrl->dp_ctrl);
-	dp_catalog_ctrl_reset(ctrl->catalog);
-
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
 	ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
@@ -1626,6 +1630,7 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		dp_link_send_test_response(ctrl->link);
+		dp_ctrl_link_idle_reset(ctrl);
 		if (dp_ctrl_link_maintenance(ctrl)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
@@ -1679,7 +1684,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 			break;
 		}
 
-		training_step = DP_TRAINING_NONE;
+		training_step = DP_TRAINING_1;
 		rc = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
