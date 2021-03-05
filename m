Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDEB32F3A6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 20:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA9C6EC25;
	Fri,  5 Mar 2021 19:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9196EC24
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 19:17:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614971853; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sDcKWD9OFSQiSe3X6JjAwqGBeAWyF8ycO02Wzq243Yw=;
 b=DC12vo+zNti3IiVf+I5ngsVFpKnyR0GgL757uP8KqH36xirPaUfQ7jI32WpEOQCx/vzVS5Dy
 J9RoQoAuVPfQ82Cykzc9TfUWxFVvecxubbN2vMxh2r6UwtkOLR31QsQPyxP00dHotLgsLQ3I
 WkDiATpDvhxcUa1AyysZ0D6EDrg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 604283cc7b648e24363bae54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 19:17:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 42E04C433CA; Fri,  5 Mar 2021 19:17:32 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AD45C433CA;
 Fri,  5 Mar 2021 19:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0AD45C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dp: Fix incorrect NULL check kbot warnings in DP
 driver
Date: Fri,  5 Mar 2021 11:17:18 -0800
Message-Id: <1614971839-2686-2-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, dan.carpenter@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix an incorrect NULL check reported by kbot in the MSM DP driver

smatch warnings:
drivers/gpu/drm/msm/dp/dp_hpd.c:37 dp_hpd_connect()
error: we previously assumed 'hpd_priv->dp_cb' could be null
(see line 37)

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_hpd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index 5b8fe3202..e1c90fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -34,8 +34,8 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 
 	dp_usbpd->hpd_high = hpd;
 
-	if (!hpd_priv->dp_cb && !hpd_priv->dp_cb->configure
-				&& !hpd_priv->dp_cb->disconnect) {
+	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
+				|| !hpd_priv->dp_cb->disconnect) {
 		pr_err("hpd dp_cb not initialized\n");
 		return -EINVAL;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
