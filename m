Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBC3094C5
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FC16ECA3;
	Sat, 30 Jan 2021 11:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AB66EABB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:16:23 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u67so5953590pfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 02:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EVHMn1baZvQLJLGxCuW7aI/+62Jj0sfPfF7kM8sXVg=;
 b=eLMJBLcdnSpeb2uDEumlUhtkgf83mSKXsbhjUF3e8gZWgl2Ja3kYicWY7e72x0+CAg
 WW1LQ7qQjlnNSW9MJxgyYB+lu6qvg3jTshj2R37lqCMgBJr2Z/BAnqQOc6KGhm/RX4be
 GE5GJUEYc8P0/EubtAb6difG07L6NAxPAp+Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0EVHMn1baZvQLJLGxCuW7aI/+62Jj0sfPfF7kM8sXVg=;
 b=hhSpVJbE+3wQlxtxQqzRV0loVJjbbo6nGdSLkKZFf27m9iLeh+ajT+kXD0P1p4mqCM
 1fQ+jiBNs0WvsmwsFeuphn60niqH5/flourWNfQTgwF9jouYfQT0UDvYBG3b4EUeyt/d
 xjeZh2i8wMEv07GrO42hS5uZi/V75iZsfwsCaCVl7skTYSgV00RymfowofiFvql+l80q
 tMO44pHMibp7wIjUQehjbdRoQwVh30o/pN9CmO8LkqznGqVfYcL/fux5rQ9RJ2Xcfoac
 3Yl+43yEt6lmCc07A/2I23XnX0yeD58JPCvecyZYKQUSQooeTW+YVTfB7xmd6vu1zAtQ
 ZWjw==
X-Gm-Message-State: AOAM5318bC0kZa5eDZODRxZjtTfrsHEnl2ZZ5um6T6AtReypGXU8IZZt
 bpc+3Cy6Yx8LlUraouPa+7q+pA==
X-Google-Smtp-Source: ABdhPJwKOYUPsux7DRsNvdfjJEJ/mslvZ47fOQUY0EgVE9lTzc/KmhVJmZHLLd+cEdrXaIOjUv9CJQ==
X-Received: by 2002:a63:1047:: with SMTP id 7mr4043761pgq.292.1611915383690;
 Fri, 29 Jan 2021 02:16:23 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:2991:e2d5:3583:ab3f])
 by smtp.gmail.com with ESMTPSA id r194sm8486165pfr.168.2021.01.29.02.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:16:22 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH v2] drm/msm/dp: trigger unplug event in msm_dp_display_disable
Date: Fri, 29 Jan 2021 18:16:03 +0800
Message-Id: <20210129101603.3151367-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, Judy Hsiao <judyhsiao@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Sean Paul <sean@poorly.run>, Judy Hsiao <judyhsiao@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Judy Hsiao <judyhsiao@google.com>

1. Trigger the unplug event in msm_dp_display_disable() to shutdown audio
   properly.
2. Reset the completion before signal the disconnect event.

Fixes: 158b9aa74479 ("drm/msm/dp: wait for audio notification before disabling clocks")
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 v2:
 - --to the correct maintainers.

 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3bc7ed21de286..81f6794a25100 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -651,8 +651,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, DP_TIMEOUT_5_SECOND);
 
 	/* signal the disconnect event early to ensure proper teardown */
-	dp_display_handle_plugged_change(g_dp_display, false);
 	reinit_completion(&dp->audio_comp);
+	dp_display_handle_plugged_change(g_dp_display, false);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
@@ -890,6 +890,9 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	/* wait only if audio was enabled */
 	if (dp_display->audio_enabled) {
+		/* signal the disconnect event */
+		reinit_completion(&dp->audio_comp);
+		dp_display_handle_plugged_change(dp_display, false);
 		if (!wait_for_completion_timeout(&dp->audio_comp,
 				HZ * 5))
 			DRM_ERROR("audio comp timeout\n");
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
