Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EBC2DF51F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5396E14C;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1438928B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 17:54:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608314047; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YYl290DkREy/lRtl2VM9orfBQXbhw1Z4uAXWYwa7zm0=;
 b=OADjz2OCcAvwPqucuRLnG9QC+TsdLnTXZ9mz3N9tyP6w2XjWUTkMQ4rkXqum2jyKqshvKRwv
 4k62OxfP31MFdjkZo1Zu2OB5GIW3akPAhxDNbJM2MqY4+HU9oZlpGfQp45hlZCCa0wIxYYs8
 rA2MXKT9nC62O+nqrjtA20qHbn8=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fdcecb50564dfefcd272dae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 17:53:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C01C5C43464; Fri, 18 Dec 2020 17:53:56 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B805C433CA;
 Fri, 18 Dec 2020 17:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B805C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH] drm/msm/dp: postpone irq_hpd event during connection pending
 state
Date: Fri, 18 Dec 2020 09:53:40 -0800
Message-Id: <1608314020-26791-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

irq_hpd event can only be executed at connected state. Therefore
irq_hpd event should be postponed if it happened at connection
pending state. This patch also make sure both link rate and lane
are valid before start link training.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6e971d5..3bc7ed2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -693,6 +693,13 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	if (state == ST_CONNECT_PENDING) {
+		/* wait until ST_CONNECTED */
+		dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
+		mutex_unlock(&dp->event_mutex);
+		return 0;
+	}
+
 	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
 	if (ret == -ECONNRESET) { /* cable unplugged */
 		dp->core_initialized = false;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 97dca3e..d1780bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -167,12 +167,18 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
 
 	rc = dp_panel_read_dpcd(dp_panel);
+	if (rc) {
+		DRM_ERROR("read dpcd failed %d\n", rc);
+		return rc;
+	}
+
 	bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
-	if (rc || !is_link_rate_valid(bw_code) ||
+	if (!is_link_rate_valid(bw_code) ||
 			!is_lane_count_valid(dp_panel->link_info.num_lanes) ||
 			(bw_code > dp_panel->max_bw_code)) {
-		DRM_ERROR("read dpcd failed %d\n", rc);
-		return rc;
+		DRM_ERROR("Illegal link rate=%d lane=%d\n", dp_panel->link_info.rate,
+				dp_panel->link_info.num_lanes);
+		return -EINVAL;
 	}
 
 	if (dp_panel->dfp_present) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
