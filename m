Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25124FC919
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B0210E179;
	Tue, 12 Apr 2022 00:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DE710E16C;
 Tue, 12 Apr 2022 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649722139; x=1681258139;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=DLDI2IJxrURbomnkYSPFOqTi3nETLpUA42/90O1WM0Q=;
 b=fuSdXIR7sgk2pUetmlZeHwJVEj6Rsxf0WNnSL5QAVaPt3UcBBpQGFVLj
 QjiWmdMHJeOydtiPXE7AljLUAtjFyKYuRXL5Q0DKY5lOrOV2hB+6Jivcm
 Hr0VmfCfeW3b/BOEk8BHDBGj4cxTXv2puKOVYlYllW3g5BSjjYfgoD+rO Q=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Apr 2022 17:08:59 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:08:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Apr 2022 17:08:57 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 11 Apr 2022 17:08:56 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
Date: Mon, 11 Apr 2022 17:08:49 -0700
Message-ID: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current DP driver implementation, event thread is kept running
after DP display is unbind. This patch fix this problem by disabling
DP irq and stop event thread to exit gracefully at dp_display_unbind().

Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 01453db..fa1ef8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -113,6 +113,7 @@ struct dp_display_private {
 	u32 hpd_state;
 	u32 event_pndx;
 	u32 event_gndx;
+	struct task_struct *ev_tsk;
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
@@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	return rc;
 }
 
+static void dp_hpd_event_stop(struct dp_display_private *dp_priv);
+
 static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
@@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
+	disable_irq(dp->irq);
+	dp_hpd_event_stop(dp);
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
 	priv->dp[dp->id] = NULL;
@@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
 
 	dp_priv = (struct dp_display_private *)data;
 
-	while (1) {
+	while (!kthread_should_stop()) {
 		if (timeout_mode) {
 			wait_event_timeout(dp_priv->event_q,
 				(dp_priv->event_pndx == dp_priv->event_gndx),
@@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
 	init_waitqueue_head(&dp_priv->event_q);
 	spin_lock_init(&dp_priv->event_lock);
 
-	kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
+	dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
+
+	if (IS_ERR(dp_priv->ev_tsk))
+		DRM_ERROR("failed to create DP event thread\n");
+}
+
+static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
+{
+	if (IS_ERR(dp_priv->ev_tsk))
+		return;
+
+	kthread_stop(dp_priv->ev_tsk);
+
+	/* reset event q to empty */
+	dp_priv->event_gndx = 0;
+	dp_priv->event_pndx = 0;
 }
 
 static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

