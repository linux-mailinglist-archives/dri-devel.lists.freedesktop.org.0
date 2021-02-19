Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3931FD0C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 17:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74A16EB70;
	Fri, 19 Feb 2021 16:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5496E6EB3E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 14:08:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613743704; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BvCkg/paXzY5wotaiWjohuLxYHDvmIcymi+lM0WTGmY=;
 b=WSnL3SjHMjnSAyORQh2xjFWMH8zz6Tk8drtBiOvtTw5eYjIbNze840GrYE/FJFhMbKx/5pah
 UlJBZpU4soBYUdTDhKH9udfQyq5YFfjevFr0MK3XgusIxvTCyYL22az8DRONfyu39VuHA7fT
 U85pMwxVOwde5yKizDloITFFXMU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 602fc64d37f02eb714dab387 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 14:08:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2A2BC433CA; Fri, 19 Feb 2021 14:08:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 32529C433C6;
 Fri, 19 Feb 2021 14:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32529C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH V1 1/2] backlight: qcom-wled: Fix FSC update issue for WLED5
Date: Fri, 19 Feb 2021 19:37:38 +0530
Message-Id: <1613743659-4726-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
References: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Fri, 19 Feb 2021 16:21:49 +0000
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
Cc: Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, for WLED5, after FSC register update MOD_SYNC_BIT
is toggled instead of SYNC_BIT. MOD_SYNC_BIT has to be toggled
after the brightness update and SYNC_BIT has to be toggled after
FSC update for WLED5. Fix it.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800..aef52b9 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
-static int wled5_sync_toggle(struct wled *wled)
+static int wled5_mod_sync_toggle(struct wled *wled)
 {
 	int rc;
 	u8 val;
@@ -445,10 +445,23 @@ static int wled_update_status(struct backlight_device *bl)
 			goto unlock_mutex;
 		}
 
-		rc = wled->wled_sync_toggle(wled);
-		if (rc < 0) {
-			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
-			goto unlock_mutex;
+		if (wled->version < 5) {
+			rc = wled->wled_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
+				goto unlock_mutex;
+			}
+		} else {
+			/*
+			 * For WLED5 toggling the MOD_SYNC_BIT updates the
+			 * brightness
+			 */
+			rc = wled5_mod_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
+					rc);
+				goto unlock_mutex;
+			}
 		}
 	}
 
@@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
 		size = ARRAY_SIZE(wled5_opts);
 		*cfg = wled5_config_defaults;
 		wled->wled_set_brightness = wled5_set_brightness;
-		wled->wled_sync_toggle = wled5_sync_toggle;
+		wled->wled_sync_toggle = wled3_sync_toggle;
 		wled->wled_cabc_config = wled5_cabc_config;
 		wled->wled_ovp_delay = wled5_ovp_delay;
 		wled->wled_auto_detection_required =
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
