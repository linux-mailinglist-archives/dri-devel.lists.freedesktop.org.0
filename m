Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9474558E1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E516E934;
	Thu, 18 Nov 2021 10:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5CCC6E934
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:20:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637230845; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8grzA7wlYzBqRilFeYBvLQm90ydwuJD4YjemvC4tAqw=;
 b=cFhiWPcDEaORhBONYA12EpGtaY3PhYcEKXChVH+1qw4aqupgoX/q3wSiKkhBD49dQ9ZQaMKU
 3Z2kZDn6A8EJ9NprA2xcTCogzEjLXiNZl6PmYZr3qZM4y0Ba5v62oXC90xtFPa5lW1DdQS8j
 0qiHIqj+xweO22gAq200G2LQufo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 619628fced14d5980fd51512 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 10:20:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BF3FDC43617; Thu, 18 Nov 2021 10:20:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 91F63C4338F;
 Thu, 18 Nov 2021 10:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 91F63C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/4] drm/msm: Increase gpu boost interval
Date: Thu, 18 Nov 2021 15:50:29 +0530
Message-Id: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we boost gpu freq after 25ms of inactivity. This regresses
some of the 30 fps usecases where the workload on gpu (at 33ms internval)
is very small which it can finish at the lowest OPP before the deadline.
Lets increase this inactivity threshold to 50ms (same as the current
devfreq interval) to fix this.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index d32b729..c4d8920 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -178,7 +178,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	 * interval, then we won't meet the threshold of busyness for
 	 * the governor to ramp up the freq.. so give some boost
 	 */
-	if (idle_time > msm_devfreq_profile.polling_ms/2) {
+	if (idle_time > msm_devfreq_profile.polling_ms) {
 		target_freq *= 2;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

