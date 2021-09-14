Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452C40B911
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB68A6E7F1;
	Tue, 14 Sep 2021 20:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5F66E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:22:37 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u18so420261pgf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hnji6HmHn3h198fZCfXJbsIx77XAm6FSSW6Gmw6icZ4=;
 b=LlsrlgeFyVcVzaqoP17sYQiTWti94nz9ZaKhOb62IjgvegHXibbkv+1fXf7DpnJd8P
 VqnPbsMs9wzlSm9oKGgjcCE7wYNrhQwdhg6O1aEAu8v9ZD0r5SSZuA8wuuM/YJ27AzxF
 MuZ80sRjh7bZo6v0HoTTUxWXDN/12TVrTqkmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hnji6HmHn3h198fZCfXJbsIx77XAm6FSSW6Gmw6icZ4=;
 b=EfUmnD0TiqRkSnSOEybnycGsFgmVKzjAE27jqjd8IMfwj4pp7aYn2azLuFV+cL5PQE
 MbkeTfRKuVFjB4eh/cIRcd8MGhVYVe52TnzrJEjvLO/FcQenjqs63G9QAhkPFO+aVkVT
 iyVw0yrzEdbN1MzyhlqjgSz8pDVsL9IwsCGs4JRIaemyklohmQcdwlNnm8z+goJ70HHa
 De/NJasMJtC0NswfzzyavqWYaEPgQ/ASBtwUI+lKqbqLwzZQ/Y1VMWY+p8ECtffPZaYv
 vZQUVC5suhlDkym9glqHcAXNpOEATf9n9pGrGOF70PB67tMxU0QpI7WWOqmax+XM2Wtn
 h8xw==
X-Gm-Message-State: AOAM533j2BsBZAvvzFp895EInh+pyrDlsJQ3/kcP6FrTVH6efDu9x0Kg
 Pw/7UpXycTbvtTn/Q0cK/4Bnig==
X-Google-Smtp-Source: ABdhPJxS0nUI9vcJg0UC3ayLGViEl/QvSxe/+XGVcVT0WDyZj0jWNXj7hACimO06mIMfUJ2hZFofMA==
X-Received: by 2002:a65:5b04:: with SMTP id y4mr17187494pgq.195.1631650957426; 
 Tue, 14 Sep 2021 13:22:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
 by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:22:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/15] drm/panel-edp: Better describe eDP panel delays
Date: Tue, 14 Sep 2021 13:21:58 -0700
Message-Id: <20210914132020.v5.11.I2d798dd015332661c5895ef744bc8ec5cd2e06ca@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
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

(no changes since v4)

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

