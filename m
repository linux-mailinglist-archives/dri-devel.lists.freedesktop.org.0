Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBF1E1C3F
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1BA6E0BC;
	Tue, 26 May 2020 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE9389C17
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:23:05 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id dh1so8820565qvb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 20:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=iAcLYGImXt7qU+Oj1+OrSH57RdqT0EzL8qM0lMEU0Fw9Z2OuBXZsRENIkFPa7zKuqd
 dhDJFAVOXSO/u5g85UjqfVfA38EJhysYo/k2Jr5sCg8MhlaWXp/jT9hvrWbxNg+Khr9f
 ZbuugSxq4Z+4ysN6DfC4lnb1zQw+Xy3nHU23FKOHHJCxGI/yDixXer5//HYetBpzSuta
 gRmqtXHWrkK5sPPWQyRLYjgTRomva9uRYh392t/3EjtehTLwNzgmLnymLpbUlYAYrhhi
 0I/egqEEolBC8qVZcKTW8GZqcSVbLwwvrJDN7/kBlW4R8tPYALp3l7vrcmzI+PyvDhWx
 A10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DZjkvReBVpxbpSNmHSMVv60YPHC0WHPyESfR7wPaf0g=;
 b=FZ2p3PJoiHB5FlT/u6kV/GiC8p+J7b414Pfip8QA7lF77HX/e8mH+22r8xO1kxZQVz
 88Ecf6Ac+hk/7nkq2fMaI76l4KlBlgbMcH1kyQE1RxZZfSHeiOt/07eSd+yde+zEpcj+
 RLu6sxBMJLGuubWl82qFSKodP/5hgRay5MWQbkrcQ9uSmPK6yVRrsTnQGpvRmFCNpKAy
 4BU2fsmhIgAuHrmkIWQBgjIzZc6EhDeuwEm1/A2yr8VVVmsPKnVOuDqRbSW98LB+vgqF
 vSIEjJDI1pRHjeU6Axc6EPoX+fCPeyvgFAKKfOasaq/HdNkshA3kqdAaAPo1k3KbI3Rk
 PFAw==
X-Gm-Message-State: AOAM532AJYu8oZEJKMJ2lFgDX1VEOrJrmfS/aau49XCj1zsQqj+WzzX6
 h3UWzcwZI7PP0xfWuc1NJZ9xvA==
X-Google-Smtp-Source: ABdhPJzRkywAd6OOmXgCnPe/1+ksB8fOOWAWM2ed8Hl4/LLIF4lXfUb2uE2H7ftcxkzujzi2+9sbxg==
X-Received: by 2002:a0c:fe88:: with SMTP id d8mr17702304qvs.208.1590463384541; 
 Mon, 25 May 2020 20:23:04 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id k20sm2530796qtu.16.2020.05.25.20.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 20:23:04 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 6/8] drm/msm/dpu: intf timing path for displayport
Date: Mon, 25 May 2020 23:22:13 -0400
Message-Id: <20200526032235.21930-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200526032235.21930-1-jonathan@marek.ca>
References: <20200526032235.21930-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
 Stephen Boyd <swboyd@chromium.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
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
