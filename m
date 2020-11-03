Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AA2A5F65
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B5A6E985;
	Wed,  4 Nov 2020 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1706E8CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 20:49:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604436591; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QXDW7ApX0OmVBkOprTaLa95T5xEPy4i9pE3/1IvLL/s=;
 b=s36trbt6V2MiZnOePagaPHGITrabzRPQllbC3VZvAtvipsqg69S7TSSHwF14XVgQz5XLY9xv
 pHxwrQEX73TdhXRubPtlWr152SvxVQ6D5n97d3ytHLH99Ql4CHlBkwxDtVIaTx+mj7DUfcug
 9AloyCTyud4joz3MuqZelinlaQM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa1c269fcec43b783bd6352 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 20:49:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 79D47C38522; Tue,  3 Nov 2020 20:49:44 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 53AB2C38522;
 Tue,  3 Nov 2020 20:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53AB2C38522
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 3/3] drm/msm/dp: promote irq_hpd handle to handle link
 training correctly
Date: Tue,  3 Nov 2020 12:49:02 -0800
Message-Id: <20201103204902.11899-4-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103204902.11899-1-khsieh@codeaurora.org>
References: <20201103204902.11899-1-khsieh@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some dongles require link training done at irq_hpd request instead
of plugin request. This patch promote irq_hpd handler to handle link
training and setup hpd_state correctly.

 Fixes: fdaf9a5e3c15 (drm/msm/dp: fixes wrong connection state caused by failure of link training)
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0c0573ad34e6..27e7e27b8b90 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -449,10 +449,9 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 	sink_request = dp->link->sink_request;
 
 	if (sink_request & DS_PORT_STATUS_CHANGED) {
-		dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 		if (dp_display_is_sink_count_zero(dp)) {
 			DRM_DEBUG_DP("sink count is zero, nothing to do\n");
-			return 0;
+			return -ENOTCONN;
 		}
 
 		return dp_display_process_hpd_high(dp);
@@ -469,7 +468,9 @@ static int dp_display_handle_irq_hpd(struct dp_display_private *dp)
 static int dp_display_usbpd_attention_cb(struct device *dev)
 {
 	int rc = 0;
+	u32 sink_request;
 	struct dp_display_private *dp;
+	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -483,10 +484,26 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -ENODEV;
 	}
 
+	hpd = dp->usbpd;
+
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
-	if (!rc)
-		dp_display_handle_irq_hpd(dp);
+	if (!rc) {
+		sink_request = dp->link->sink_request;
+		if (sink_request & DS_PORT_STATUS_CHANGED) {
+			/* same as unplugged */
+			hpd->hpd_high = 0;
+			dp->hpd_state = ST_DISCONNECT_PENDING;
+			dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+		}
+
+		rc = dp_display_handle_irq_hpd(dp);
+
+		if (!rc && (sink_request & DS_PORT_STATUS_CHANGED)) {
+			hpd->hpd_high = 1;
+			dp->hpd_state = ST_CONNECT_PENDING;
+		}
+	}
 
 	return rc;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
