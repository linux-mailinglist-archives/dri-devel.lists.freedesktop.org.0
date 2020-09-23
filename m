Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289B27646A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 01:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C221A6EA14;
	Wed, 23 Sep 2020 23:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4146EA14
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 23:25:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600903505; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=b2IYzLoqy+RT6Zl15hZRzCvo04WPMSa3Qlqf25e7kvM=;
 b=SB+GP4fpmKzRsn2AVnQ1nJkoS0bfjWM+CxF3Y7bifYzy1YpKPKuLk6IMtWLNbRS621IL8p4s
 UryaKvFFKALti41awA+taMmGWF7Fjoa5CP/D95oHSlUkZgJPfJIGQBtTFN4x6SWef7KhqQOe
 aN+b8pGARYzeTumfy6TNJxjH/8M=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f6bd94e51ea4325f325e176 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 23:25:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ADA34C433C8; Wed, 23 Sep 2020 23:25:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BCE3C433CA;
 Wed, 23 Sep 2020 23:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BCE3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: fix incorrect function prototype of dp_debug_get()
Date: Wed, 23 Sep 2020 16:24:48 -0700
Message-Id: <20200923232448.24516-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the incorrect function prototype for dp_debug_get()
in the dp_debug module to address compilation warning.

Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 377e166fd0ea..7eaedfbb149c 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -60,7 +60,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector)
+		struct drm_connector **connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
