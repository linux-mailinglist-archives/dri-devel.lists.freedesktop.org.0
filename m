Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C739C2EEEEA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74646E811;
	Fri,  8 Jan 2021 08:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2E46E520
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 20:31:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610051486; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YYl290DkREy/lRtl2VM9orfBQXbhw1Z4uAXWYwa7zm0=;
 b=N98JlATS9Run1i3rN44erbassgmBrqIQJQorTgZ1XwcQ+Yl4xC2SmgSLlWaJr/UMsy4zqOv9
 Z0lhWp5ogBMFPOUgA+EgtDfBYj1KtBfPK1T5JAfoj0P/uqVO5XoRbTEvhQRSD1GUBnuhI4a6
 DTYNN0Sg9fUEwmojj6mJ9jFGiDc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5ff76f8c59b491b9d81a1168 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 20:31:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F667C43463; Thu,  7 Jan 2021 20:31:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C5603C433CA;
 Thu,  7 Jan 2021 20:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5603C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
Date: Thu,  7 Jan 2021 12:30:24 -0800
Message-Id: <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
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
