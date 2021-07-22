Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78A3D2F9D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 00:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421286E9F1;
	Thu, 22 Jul 2021 22:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED926EA81
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 22:15:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626992135; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UOL/xDtchMnEVadVXI4kwef9hh/xHdKFdcB+mkAykzw=;
 b=dd2F04l6XMLd8QE7fix2KmFggulsTsA+dtf6QuqaW1SF+PeG/MRDeKZO4Rp+/eTcPc74jQKl
 ELRpQRjoH0TlZnl8Rw1q5cQpj/LMb7jCDMYhLRUxL+vP79nNwKvPan01aw5A6CS/Vx+RJwLc
 pkmaAvfzDfkAQX3XnkTWZ4zzOS0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f9edfee31d882d18b99eb4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 22:15:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 343ABC4360C; Thu, 22 Jul 2021 22:15:26 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B4D5CC433F1;
 Thu, 22 Jul 2021 22:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B4D5CC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH] drm/msm/dp: signal audio plugged change at dp_pm_resume
Date: Thu, 22 Jul 2021 15:15:17 -0700
Message-Id: <1626992117-28887-1-git-send-email-khsieh@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a scenario that dp cable is unplugged from DUT during system
suspended  will cause audio option state does not match real connection
state. Fix this problem by Signaling audio plugged change with realtime
connection status at dp_pm_resume() so that audio option will be in
correct state after system resumed.

Fixes: bd52cfedb5a8 ("drm/msm/dp: power off DP phy at suspend")
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 78c5301..2b660e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1339,6 +1339,10 @@ static int dp_pm_resume(struct device *dev)
 	else
 		dp->dp_display.is_connected = false;
 
+	dp_display_handle_plugged_change(g_dp_display,
+				dp->dp_display.is_connected);
+
+
 	mutex_unlock(&dp->event_mutex);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

