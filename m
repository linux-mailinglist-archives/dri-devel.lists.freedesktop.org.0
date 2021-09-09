Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45192405E4D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908076E924;
	Thu,  9 Sep 2021 21:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6436E91D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:43 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s11so3104464pgr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oYnWksVLhfA1R7ALQl3PxpsacVSjPRXCokLKSEOGM/Q=;
 b=Dk92n7Lxse9IPihpZ8DVxM5vzWEDEXuTGhIU8DjK0BhbUtmp+C2kyps5MLQjOp6+XQ
 8UpHL0lVglb2LgHir4cFUJ2md0omqitp/865+cdyjTGJYZ3okqSKVj0Hr/gBiPx+Skc5
 YDNi0JGAeBM0sfPSHX2Ob0e7Fm19+grtHscKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oYnWksVLhfA1R7ALQl3PxpsacVSjPRXCokLKSEOGM/Q=;
 b=ibyjyFk5W9UWY3I9kLr5FxO8YY8CqebXtpN+4gFEASt+XJkYBHfRrxLZW4jNlY5XE0
 tOBjKAzaVDRTGvOU00bmmOzGNSRLNLGo+1jV2hQ+VmmE7tnjVD5m7P1k3UY0ykBLpFWk
 oJ5HXsrv2BnKkvLcAbHoKpulVpROTIPufHbO1q5944++p9lVuIx7r2IpCZ5nmlb8btQG
 K7DyMWD0wcl4s8h4BxRC04V4Olw3jz4hNOzVZ64kA+ehmGe+4PCmBYzgph673QVRfYyz
 9lZMM0XN1VwgKq/taXEJKw0YhpHsjjzE/Wk+7nDYAgDCuhB/MHByBv0en+KSksKsT3LN
 LXHg==
X-Gm-Message-State: AOAM532cjvCXbNesfDgzioYJWkvedCCP7pbML8tv3jbAUNUnfGWua8Vt
 uEbMvIZ0EhGMZN0eNO2beZx7CA==
X-Google-Smtp-Source: ABdhPJxSlg2mzoZmZnTT3z44PdDt2iiPdrcdjxAAeRW7aBBsWoMe5Pa4sMoCf9hGrKNdbF7vyiX7SA==
X-Received: by 2002:aa7:98ce:0:b0:40d:a02f:5a59 with SMTP id
 e14-20020aa798ce000000b0040da02f5a59mr4937588pfm.20.1631221303315; 
 Thu, 09 Sep 2021 14:01:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/15] drm/panel-edp: Better describe eDP panel delays
Date: Thu,  9 Sep 2021 14:00:27 -0700
Message-Id: <20210909135838.v4.11.I2d798dd015332661c5895ef744bc8ec5cd2e06ca@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now that the eDP panel driver only handles eDP panels we can make
better sense of the delays here. Let's describe them in terms of the
standard eDP timing diagram from the eDP spec.

As part of this, it becomes pretty clear that some eDP panels have too
long of a "hpd_reliable_delay". This used to be the "prepare"
delay. It's the fixed delay that we do in the panel driver after
powering on our panel before we look at the HPD signal. To understand
this better, first realize that there could be 3 paths we follow
depending on how HPD is hooked up. Let's walk through them:
1. HPD is handled by the eDP controller driver. Until "recently"
   (commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
   delaying prepare()") in May 2020) this was the only supported
   way. This is supposed to be when the controller driver gets HPD
   straight to a dedicated pin. In this case the controller driver
   should be waiting for HPD in its pre_enable() routine which should
   be called right after the panel's prepare() function is
   called. That means that the old "prepare" delay was only needed as
   a delay after powering the panel but before looking at HPD.
2. HPD is handled via hpd-gpios in the panel. This is much like #1 but
   much easier to follow since all the handling is in the panel
   driver.
3. The no-hpd case. This is also easy to follow.

In any case, even though it seems like some old panel data was using
this incorrectly, let's not touch the old data structures but we'll
add a note indicating that something seems off.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- ("Better describe eDP panel delays") new for v3.

 drivers/gpu/drm/panel/panel-edp.c | 82 ++++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 26f4ae7921e5..1547e4797594 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -45,20 +45,28 @@
  */
 struct panel_delay {
 	/**
-	 * @prepare: Time for the panel to become ready.
+	 * @hpd_reliable: Time for HPD to be reliable
 	 *
-	 * The time (in milliseconds) that it takes for the panel to
-	 * become ready and start receiving video data
+	 * The time (in milliseconds) that it takes after powering the panel
+	 * before the HPD signal is reliable. Ideally this is 0 but some panels,
+	 * board designs, or bad pulldown configs can cause a glitch here.
+	 *
+	 * NOTE: on some old panel data this number appers to be much too big.
+	 * Presumably some old panels simply didn't have HPD hooked up and put
+	 * the hpd_absent here because this field predates the
+	 * hpd_absent. While that works, it's non-ideal.
 	 */
-	unsigned int prepare;
+	unsigned int hpd_reliable;
 
 	/**
-	 * @hpd_absent_delay: Time to wait if HPD isn't hooked up.
+	 * @hpd_absent: Time to wait if HPD isn't hooked up.
 	 *
-	 * Add this to the prepare delay if we know Hot Plug Detect
-	 * isn't used.
+	 * Add this to the prepare delay if we know Hot Plug Detect isn't used.
+	 *
+	 * This is T3-max on eDP timing diagrams or the delay from power on
+	 * until HPD is guaranteed to be asserted.
 	 */
-	unsigned int hpd_absent_delay;
+	unsigned int hpd_absent;
 
 	/**
 	 * @prepare_to_enable: Time between prepare and enable.
@@ -87,6 +95,10 @@ struct panel_delay {
 	 *   enable()
 	 *     // do fixed enable delay
 	 *     // enforce prepare_to_enable min time
+	 *
+	 * This is not specified in a standard way on eDP timing diagrams.
+	 * It is effectively the time from HPD going high till you can
+	 * turn on the backlight.
 	 */
 	unsigned int prepare_to_enable;
 
@@ -96,6 +108,10 @@ struct panel_delay {
 	 * The time (in milliseconds) that it takes for the panel to
 	 * display the first valid frame after starting to receive
 	 * video data.
+	 *
+	 * This is (T6-min + max(T7-max, T8-min)) on eDP timing diagrams or
+	 * the delay after link training finishes until we can turn the
+	 * backlight on and see valid data.
 	 */
 	unsigned int enable;
 
@@ -104,6 +120,9 @@ struct panel_delay {
 	 *
 	 * The time (in milliseconds) that it takes for the panel to
 	 * turn the display off (no content is visible).
+	 *
+	 * This is T9-min (delay from backlight off to end of valid video
+	 * data) on eDP timing diagrams. It is not common to set.
 	 */
 	unsigned int disable;
 
@@ -117,6 +136,8 @@ struct panel_delay {
 	 * starting until at least this many milliseconds has passed.
 	 * If at prepare time less time has passed since unprepare
 	 * finished, the driver waits for the remaining time.
+	 *
+	 * This is T12-min on eDP timing diagrams.
 	 */
 	unsigned int unprepare;
 };
@@ -400,15 +421,15 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	delay = p->desc->delay.prepare;
+	delay = p->desc->delay.hpd_reliable;
 	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent_delay;
+		delay += p->desc->delay.hpd_absent;
 	if (delay)
 		msleep(delay);
 
 	if (p->hpd_gpio) {
-		if (p->desc->delay.hpd_absent_delay)
-			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
+		if (p->desc->delay.hpd_absent)
+			hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
 		else
 			hpd_wait_us = 2000000;
 
@@ -772,7 +793,7 @@ static const struct panel_desc auo_b116xak01 = {
 		.height = 144,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 	},
 };
 
@@ -823,7 +844,7 @@ static const struct panel_desc auo_b133han05 = {
 		.height = 165,
 	},
 	.delay = {
-		.prepare = 100,
+		.hpd_reliable = 100,
 		.enable = 20,
 		.unprepare = 50,
 	},
@@ -850,7 +871,7 @@ static const struct panel_desc auo_b133htn01 = {
 		.height = 165,
 	},
 	.delay = {
-		.prepare = 105,
+		.hpd_reliable = 105,
 		.enable = 20,
 		.unprepare = 50,
 	},
@@ -899,7 +920,7 @@ static const struct panel_desc auo_b140han06 = {
 		.height = 174,
 	},
 	.delay = {
-		.prepare = 100,
+		.hpd_reliable = 100,
 		.enable = 20,
 		.unprepare = 50,
 	},
@@ -939,7 +960,8 @@ static const struct panel_desc boe_nv101wxmn51 = {
 		.height = 136,
 	},
 	.delay = {
-		.prepare = 210,
+		/* TODO: should be hpd-absent and no-hpd should be set? */
+		.hpd_reliable = 210,
 		.enable = 50,
 		.unprepare = 160,
 	},
@@ -981,7 +1003,7 @@ static const struct panel_desc boe_nv110wtm_n61 = {
 		.height = 155,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 		.prepare_to_enable = 80,
 		.enable = 50,
 		.unprepare = 500,
@@ -1018,14 +1040,14 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 		 * was until the TCON data download was complete.  On
 		 * one system this was measured at 8 ms.  We'll put 15 ms
 		 * in the prepare delay just to be safe and take it away
-		 * from the hpd_absent_delay (which would otherwise be 200 ms)
+		 * from the hpd_absent (which would otherwise be 200 ms)
 		 * to handle this.  That means:
 		 * - If HPD isn't hooked up you still have 200 ms delay.
 		 * - If HPD is hooked up we won't try to look at it for the
 		 *   first 15 ms.
 		 */
-		.prepare = 15,
-		.hpd_absent_delay = 185,
+		.hpd_reliable = 15,
+		.hpd_absent = 185,
 
 		.unprepare = 500,
 	},
@@ -1054,7 +1076,8 @@ static const struct panel_desc boe_nv140fhmn49 = {
 		.height = 174,
 	},
 	.delay = {
-		.prepare = 210,
+		/* TODO: should be hpd-absent and no-hpd should be set? */
+		.hpd_reliable = 210,
 		.enable = 50,
 		.unprepare = 160,
 	},
@@ -1082,7 +1105,7 @@ static const struct panel_desc innolux_n116bca_ea1 = {
 		.height = 144,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 		.prepare_to_enable = 80,
 		.unprepare = 500,
 	},
@@ -1165,7 +1188,7 @@ static const struct panel_desc innolux_p120zdg_bf1 = {
 		.height = 169,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 		.unprepare = 500,
 	},
 };
@@ -1192,7 +1215,7 @@ static const struct panel_desc ivo_m133nwf4_r0 = {
 		.height = 165,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 		.unprepare = 500,
 	},
 };
@@ -1219,7 +1242,7 @@ static const struct panel_desc kingdisplay_kd116n21_30nv_a010 = {
 		.height = 144,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		.hpd_absent = 200,
 	},
 };
 
@@ -1345,7 +1368,7 @@ static const struct panel_desc neweast_wjfh116008a = {
 		.height = 150,
 	},
 	.delay = {
-		.prepare = 110,
+		.hpd_reliable = 110,
 		.enable = 20,
 		.unprepare = 500,
 	},
@@ -1439,7 +1462,7 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 		.height = 173,
 	},
 	.delay = {
-		.prepare = 110,
+		.hpd_reliable = 110,
 		.enable = 50,
 		.unprepare = 550,
 	},
@@ -1466,7 +1489,8 @@ static const struct panel_desc starry_kr122ea0sra = {
 		.height = 164,
 	},
 	.delay = {
-		.prepare = 10 + 200,
+		/* TODO: should be hpd-absent and no-hpd should be set? */
+		.hpd_reliable = 10 + 200,
 		.enable = 50,
 		.unprepare = 10 + 500,
 	},
-- 
2.33.0.309.g3052b89438-goog

