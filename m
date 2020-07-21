Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F7227A5E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABC56E438;
	Tue, 21 Jul 2020 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296896E405
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 04:27:14 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id d1so9701765plr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 21:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+azHcaGZBExcNgCV7GvONNLJM0PsErlOdvqFw7KBEwo=;
 b=atLCSv1EBxJkYoBnJzRXFqbtgESLRJzG7/KIw7V61wkbSesm8DrfFClztE3hl0YKn2
 zhvMJB53o8AjyD15maS9ei03a8VdZ8V6ejQ3gOHpH8R4Ts2xqki/oXbuzosB2E9xVowQ
 REFefSCvyJiYypXQbs8xUXcMN6u34h1Y5A+PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+azHcaGZBExcNgCV7GvONNLJM0PsErlOdvqFw7KBEwo=;
 b=P0FBvewoao2dhzjVw0/MyWRogomI9X4BRQQStV6rv9fshvI6Qk7pL9wvd00GEkYnvt
 M8vsN0Jc51DUMnNUIijuf4mHWvxoSBQKTmxIbWM/XLZo+ux84zzh4b3ITbhF2ebKma/o
 EpvFGA1Hd354IWnQkBar6pZJIeVj1ihnPlJL1jGZJZ0+izIfoaz0pSJIGaLHkTmFZEHf
 8sceNJcBpuyF5H3/SqaahzLrOA8fCm9Dv2CjKPFmvLfhF0A/2wUGKqId86UKgQym85di
 XiwvxsCt7W7Y8VxtuYFdTYAFIiwXD2qZL1iUgbHdE+WlHPUaLsU+8VK+4PwVxFleVXgi
 eAwA==
X-Gm-Message-State: AOAM531s6gCi6A8WSgYOiTSzDugqzSt785kAbnBHy46LWkx0KBDYlYCs
 0ez9GHTDgLiWsNPWL9ki0NIB0Q==
X-Google-Smtp-Source: ABdhPJxiZFk82C8FZb8pZUiZcPJkkV38d0IGvRX9dQ3Cs3n9f4VCer+uXyyu86r8DyLmk2np2YlHiA==
X-Received: by 2002:a17:90a:240a:: with SMTP id
 h10mr2845650pje.225.1595305633715; 
 Mon, 20 Jul 2020 21:27:13 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net.
 [73.63.253.164])
 by smtp.gmail.com with ESMTPSA id o8sm1207075pjf.37.2020.07.20.21.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:27:13 -0700 (PDT)
From: Alexandru Stan <amstan@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] backlight: pwm_bl: Fix interpolation
Date: Mon, 20 Jul 2020 21:25:20 -0700
Message-Id: <20200720212502.1.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
References: <20200721042522.2403410-1-amstan@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Alexandru Stan <amstan@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Whenever num-interpolated-steps was larger than the distance
between 2 consecutive brightness levels the table would get really
discontinuous. The slope of the interpolation would stick with
integers only and if it was 0 the whole line segment would get skipped.

Example settings:
	brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
	num-interpolated-steps = <16>;

The distances between 1 2 4 and 8 would be 1, and only starting with 16
it would start to interpolate properly.

Let's change it so there's always interpolation happening, even if
there's no enough points available (read: values in the table would
appear more than once). This should match the expected behavior much
more closely.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Alexandru Stan <amstan@chromium.org>
---

 drivers/video/backlight/pwm_bl.c | 70 ++++++++++++++------------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 82b8d7594701..5193a72305a2 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -235,8 +235,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 				  struct platform_pwm_backlight_data *data)
 {
 	struct device_node *node = dev->of_node;
-	unsigned int num_levels = 0;
-	unsigned int levels_count;
+	unsigned int num_levels;
 	unsigned int num_steps = 0;
 	struct property *prop;
 	unsigned int *table;
@@ -265,12 +264,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
 	if (!prop)
 		return 0;
 
-	data->max_brightness = length / sizeof(u32);
+	num_levels = length / sizeof(u32);
 
 	/* read brightness levels from DT property */
-	if (data->max_brightness > 0) {
-		size_t size = sizeof(*data->levels) * data->max_brightness;
-		unsigned int i, j, n = 0;
+	if (num_levels > 0) {
+		size_t size = sizeof(*data->levels) * num_levels;
 
 		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
 		if (!data->levels)
@@ -278,7 +276,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 
 		ret = of_property_read_u32_array(node, "brightness-levels",
 						 data->levels,
-						 data->max_brightness);
+						 num_levels);
 		if (ret < 0)
 			return ret;
 
@@ -303,7 +301,13 @@ static int pwm_backlight_parse_dt(struct device *dev,
 		 * between two points.
 		 */
 		if (num_steps) {
-			if (data->max_brightness < 2) {
+			unsigned int num_input_levels = num_levels;
+			unsigned int i;
+			u32 x1, x2, x;
+			u32 y1, y2;
+			s64 dx, dy;
+
+			if (num_input_levels < 2) {
 				dev_err(dev, "can't interpolate\n");
 				return -EINVAL;
 			}
@@ -313,14 +317,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			 * taking in consideration the number of interpolated
 			 * steps between two levels.
 			 */
-			for (i = 0; i < data->max_brightness - 1; i++) {
-				if ((data->levels[i + 1] - data->levels[i]) /
-				   num_steps)
-					num_levels += num_steps;
-				else
-					num_levels++;
-			}
-			num_levels++;
+			num_levels = (num_input_levels - 1) * num_steps + 1;
 			dev_dbg(dev, "new number of brightness levels: %d\n",
 				num_levels);
 
@@ -332,24 +329,25 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			table = devm_kzalloc(dev, size, GFP_KERNEL);
 			if (!table)
 				return -ENOMEM;
-
-			/* Fill the interpolated table. */
-			levels_count = 0;
-			for (i = 0; i < data->max_brightness - 1; i++) {
-				value = data->levels[i];
-				n = (data->levels[i + 1] - value) / num_steps;
-				if (n > 0) {
-					for (j = 0; j < num_steps; j++) {
-						table[levels_count] = value;
-						value += n;
-						levels_count++;
-					}
-				} else {
-					table[levels_count] = data->levels[i];
-					levels_count++;
+			/*
+			 * Fill the interpolated table[x] = y
+			 * by draw lines between each (x1, y1) to (x2, y2).
+			 */
+			dx = num_steps;
+			for (i = 0; i < num_input_levels - 1; i++) {
+				x1 = i * dx;
+				x2 = x1 + dx;
+				y1 = data->levels[i];
+				y2 = data->levels[i + 1];
+				dy = y2 - y1;
+
+				for (x = x1; x < x2; x++) {
+					table[x] = y1 +
+						div_s64(dy * (x - x1), dx);
 				}
 			}
-			table[levels_count] = data->levels[i];
+			/* Fill in the last point, since no line starts here. */
+			table[x2] = y2;
 
 			/*
 			 * As we use interpolation lets remove current
@@ -358,15 +356,9 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			 */
 			devm_kfree(dev, data->levels);
 			data->levels = table;
-
-			/*
-			 * Reassign max_brightness value to the new total number
-			 * of brightness levels.
-			 */
-			data->max_brightness = num_levels;
 		}
 
-		data->max_brightness--;
+		data->max_brightness = num_levels - 1;
 	}
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
