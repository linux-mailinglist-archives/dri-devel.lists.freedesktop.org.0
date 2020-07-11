Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8521E8E5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EFC6E8F6;
	Tue, 14 Jul 2020 07:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1178C6ED94
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 00:50:23 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d27so5919391qtg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=o704Ym7dIhKXAkyDL8wWtM4GXO7WB+4QK8fwOAGIviSDXDDm0/+HMQIQ/ljFUGi6vu
 FD8S6XgLIGOgfVANnGtaQnj6TrfXjfs4oghvM+iSUGO0Nq6YVKkL6unc5KpoPLDcKQWd
 IBvJ3aMtJlbvSqkCtRGAoy0CyeyNpKYEhn+hcHlXjVVVzETEcfVxw1Aw1Z2lthekKnv2
 R3EKsdFsM40+3TfLhz1x+n3RYAxPTl9g/Vh+Nqmku88ML+Mtd+XC8m5nFLRMBPknRrg/
 8tO8eEu3b3vWHKHKn7hBzPSLpybOAf3I3JBZsxb5Nihub8DeCs8DAwcVQ6gecq1Ezkr2
 dcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=AW3+psNq8PiG+EyQD5pi/2J8AxAZPoiKkq1U87XwXDiz8PpILOwxTLCJPsBBhJv42v
 cA1kFlzfjldQ48Ui5BqoE1eSzxgRnHNw6d5vtI8lhsgzdukGh8RnO17UmoEmysmj7Wod
 u/KMQKj0FtvzhJtZoBTEBAsrTD7dUx9Emqp3vanToIANWsnY+LUmOYIeK+OmRiNiqkIP
 zHKnFkXqh9PWnIcVYQaAeQOZAWXtuI38vLRZ4ibdAPY3/R8FJ4JLs6zK6nh0n2ETCs7w
 u84x6VQTI4ZRVN45dWo4WmS130RNeMOsVTn9Y4M39aXkh5poGYMyy1ZzuhMsxXWCTxOD
 2KWg==
X-Gm-Message-State: AOAM532XBb3ynHBYNeN0NotBMc/ozccnGtsmQnuiydb9X78Za6bonUwB
 3YklWS8ttgx4/3dfs1YQqKv3yw==
X-Google-Smtp-Source: ABdhPJyB7Ha2yTM+Stl8pYFfDl5fldqN1HEwj9OFsLXc478vVz/hiCOClq5YiBaMnQ0i3Sp/gZ75Xw==
X-Received: by 2002:ac8:4e08:: with SMTP id c8mr74451649qtw.299.1594428622218; 
 Fri, 10 Jul 2020 17:50:22 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id g20sm10427510qtc.46.2020.07.10.17.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 17:50:21 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/msm/dpu: intf timing path for displayport
Date: Fri, 10 Jul 2020 20:47:29 -0400
Message-Id: <20200711004752.30760-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200711004752.30760-1-jonathan@marek.ca>
References: <20200711004752.30760-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: Shubhashree Dhar <dhar@codeaurora.org>,
 Raviteja Tamatam <travitej@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate the correct timings for displayport, from downstream driver.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 64f556d693dd..6f0f54588124 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -107,11 +107,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
 	p->hsync_skew - 1;
 
-	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
-		display_v_start += p->hsync_pulse_width + p->h_back_porch;
-		display_v_end -= p->h_front_porch;
-	}
-
 	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
 	hsync_end_x = hsync_period - p->h_front_porch - 1;
 
@@ -144,10 +139,25 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
+	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
+		active_h_start = hsync_start_x;
+		active_h_end = active_h_start + p->xres - 1;
+		active_v_start = display_v_start;
+		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
+
+		display_v_start += p->hsync_pulse_width + p->h_back_porch;
+
+		active_hctl = (active_h_end << 16) | active_h_start;
+		display_hctl = active_hctl;
+	}
+
 	den_polarity = 0;
 	if (ctx->cap->type == INTF_HDMI) {
 		hsync_polarity = p->yres >= 720 ? 0 : 1;
 		vsync_polarity = p->yres >= 720 ? 0 : 1;
+	} else if (ctx->cap->type == INTF_DP) {
+		hsync_polarity = p->hsync_polarity;
+		vsync_polarity = p->vsync_polarity;
 	} else {
 		hsync_polarity = 0;
 		vsync_polarity = 0;
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
