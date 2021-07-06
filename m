Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018533BDC1F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674756E56D;
	Tue,  6 Jul 2021 17:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2BD6E56A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:20:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625592060; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VGIy1W6ivYT8sZ3EiOYv0LQr/+OaguC7PuT4KKQp+Q8=;
 b=B6AAJj1Lsie9jXnRsM4J0BTtAFN5uE9i6nUKEBvpBYfQy5NrN/LOT6++W5gupp92yop+A+lS
 iFzjAdnfxei4Mc5v8OI1a6JMBkeaMOopCYy7Vin7byQ1hGVsMdRQXbdx3hsum8plTwc8NcUo
 DcUYU3cZoeuR6IGFgcrzrDUIj3s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60e490ec4ca9face34308f13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DE98BC4338A; Tue,  6 Jul 2021 17:20:43 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0306EC43217;
 Tue,  6 Jul 2021 17:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0306EC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Subject: [PATCH 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
Date: Tue,  6 Jul 2021 10:20:16 -0700
Message-Id: <1625592020-22658-4-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
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
 bjorn.andersson@linaro.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Aux hardware calibration sequence requires resetting the aux controller
in order for the new setting to take effect. However resetting the AUX
controller will also clear HPD interrupt status which may accidentally
cause pending unplug interrupt to get lost. Therefore reset aux
controller only when link is in connection state when dp_aux_cmd_fifo_tx()
fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 4a3293b..eb40d84 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -353,6 +353,9 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
 				dp_catalog_aux_update_cfg(aux->catalog);
 		}
+		/* reset aux if link is in connected state */
+		if (dp_catalog_link_is_connected(aux->catalog))
+			dp_catalog_aux_reset(aux->catalog);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

