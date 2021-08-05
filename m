Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D93E1D85
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 22:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830F6EB4E;
	Thu,  5 Aug 2021 20:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45A6EB4C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 20:45:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628196355; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ixN/G0wD2Tem26eG8Y4vIh8M91ioKBwKM8eJ2m/0tjo=;
 b=NVqIckW4cF6LXnMWkdcjobxlOxF26VDbG4s9CuIHtPE3vecS6gUkBTE82qWdcp113Q6630zX
 0bMcQ1DspPM0lSiP3GtzGXTvjaPJsSMXLNM/87qXvDUVF/IqSQwczsCSANaCf1SKyWVLcQZM
 k8wjMy+5q8MnQsyk3MexqeP72+A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 610c4df63f14248172a28f50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Aug 2021 20:45:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2FB21C433F1; Thu,  5 Aug 2021 20:45:41 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DFB0EC433F1;
 Thu,  5 Aug 2021 20:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DFB0EC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
Date: Thu,  5 Aug 2021 13:44:52 -0700
Message-Id: <1628196295-7382-4-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Aux hardware calibration sequence requires resetting the aux controller
in order for the new setting to take effect. However resetting the AUX
controller will also clear HPD interrupt status which may accidentally
cause pending unplug interrupt to get lost. Therefore reset aux
controller only when link is in connection state when dp_aux_cmd_fifo_tx()
fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.

Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

