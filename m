Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9B3B7917
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 22:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458BC6E8EA;
	Tue, 29 Jun 2021 20:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689176E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 20:09:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624997360; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Dhc0W9vUgT2dL4RFtAFw6gqKf7r7LCHzbli6TwXb/Gc=;
 b=i7I+tmldo9xLYSkhO8fgurwWdid+o5OlAmAfifnivGoVGcxqwrbZzMbbr8EcYJ8fUbxw3LtB
 W6uSv5lSFpYgLTRnNxp5RjfUvreQKLwSqd4GGvhO99+G39wrzi8J+ZvPiFBBRyxXwgnSybdP
 qbz+3bJmjdO2dj6ZKcUQjpXSPCw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60db7de74ca9face349ef902 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 29 Jun 2021 20:09:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9CD81C433D3; Tue, 29 Jun 2021 20:09:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C8D04C433F1;
 Tue, 29 Jun 2021 20:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8D04C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Subject: [PATCH] drm/dp_mst: Fix return code on sideband message failure
Date: Tue, 29 Jun 2021 13:08:56 -0700
Message-Id: <1624997336-2245-1-git-send-email-khsieh@codeaurora.org>
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
Cc: rnayak@codeaurora.org, tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajkumar Subbiah <rsubbia@codeaurora.org>

The commit 2f015ec6eab69301fdcf54d397810d72362d7223 added some debug
code for sideband message tracing. But it seems to have unintentionally
changed the behavior on sideband message failure. It catches and returns
failure only if DRM_UT_DP is enabled. Otherwise it ignores the error code
and returns success. So on an MST unplug, the caller is unaware that the
clear payload message failed and ends up waiting for 4 seconds for the
response.

This change fixes the issue by returning the proper error code.

Change-Id: I2887b7ca21355fe84a7968f7619d5e8199cbb0c6
Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 1590144..8d97430 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
 	idx += tosend + 1;
 
 	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
-	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
-		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
+	if (unlikely(ret)) {
+		if (drm_debug_enabled(DRM_UT_DP)) {
+			struct drm_printer p = drm_debug_printer(DBG_PREFIX);
 
-		drm_printf(&p, "sideband msg failed to send\n");
-		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
+			drm_printf(&p, "sideband msg failed to send\n");
+			drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
+		}
 		return ret;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

