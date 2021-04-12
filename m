Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9A35CF27
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 19:03:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDE389B69;
	Mon, 12 Apr 2021 17:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E1789B69
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 17:03:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1618247010; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TTWM4MVoGT/Cank+4XgJKBM2sorLT1dJwiBEtujGX0o=;
 b=mb//kdkEhdXQORf4gmxSoIl6CWUi4JD89W6g+KYc6zMMOMlZ/47DM2bp7UeYdDFJe9N/q6xy
 kZ+VQp4aErG99Lq32pF3IxrzIwlB/5R3uUk2UuO6H+iSv2PhGvDIjQSFC/i3QdXwnEt49/e6
 2jwlE9mRwjVAo3i+dSWIa/gf2Cs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60747d54c06dd10a2d61e915 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Apr 2021 17:03:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 61F09C43468; Mon, 12 Apr 2021 17:03:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C5A36C43462;
 Mon, 12 Apr 2021 17:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5A36C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH 1/2] drm/msm/dp: check sink_count before update is_connected
 status
Date: Mon, 12 Apr 2021 10:02:51 -0700
Message-Id: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At pm_resume check link sisnk_count before update is_connected status
base on HPD real time link status. Also print out error message only
when either EV_CONNECT_PENDING_TIMEOUT or EV_DISCONNECT_PENDING_TIMEOUT
happen.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a39da6..4992a049 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -587,7 +587,7 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 
 	state = dp->hpd_state;
 	if (state == ST_CONNECT_PENDING) {
-		dp_display_enable(dp, 0);
+		DRM_ERROR("EV_CONNECT_PENDING_TIMEOUT error\n");
 		dp->hpd_state = ST_CONNECTED;
 	}
 
@@ -670,7 +670,7 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
 
 	state =  dp->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
-		dp_display_disable(dp, 0);
+		DRM_ERROR("EV_DISCONNECT_PENDING_TIMEOUT error\n");
 		dp->hpd_state = ST_DISCONNECTED;
 	}
 
@@ -1272,7 +1272,7 @@ static int dp_pm_resume(struct device *dev)
 
 	status = dp_catalog_link_is_connected(dp->catalog);
 
-	if (status)
+	if (status && dp->link->sink_count)
 		dp->dp_display.is_connected = true;
 	else
 		dp->dp_display.is_connected = false;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
