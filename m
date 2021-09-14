Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71940B919
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394686E802;
	Tue, 14 Sep 2021 20:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33D6E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:22:36 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 5so165264plo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFVooNpkXKL6QaH2NxgTwLnrt9lRR1lq61UFSNpROL4=;
 b=YiHuT2U32Cavd1ndhjDmW7DKt1dTQ9jdfsYNbuJK7wL0LwwJpqTsldmHl+sKQJMBC9
 IbK6Vfi4j/jH205T7GDyfxD2h0ffjTgtxAXPiukh9299+XxKYh2RFkNJY7LJ0y1ffXb7
 mFmNs8jHRzXJz7tVoOlDCYYFC9CsGr1pECE18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zFVooNpkXKL6QaH2NxgTwLnrt9lRR1lq61UFSNpROL4=;
 b=Sel4qND4NlF2xaaPxk8R9pyQ0kaysDo1C88uumv55Cdkrj0ebPiFZnnF8qRMDXuYeH
 bnNVjBl1MfOFrDLWG8K6unSaNQ765EfiyTIgDIowwHDeriF9JVLfOHu/wk7eFqXxH9fg
 Gi4KJArc0S3F1PM+woMxSitYIOPho/825tOOvsSjUhDXqLStXQRKdxL6mIcvtWChBlYV
 Vfip3UcC/tMUYnoXsr+OwABBJoWiWgla76dFE5WxOdeH9X8yFZLcnzJDKDjlWuBnnIcA
 bbGQqo5c/4Ihx7Z274HbcjvB0qTzEHTWwmpA7RM9TN/3AekTwk+pV1RYK39ubYzkf/NT
 nG8w==
X-Gm-Message-State: AOAM53158Qbla7SpZ4SoLluIC6NGZ0S5yrFQhb1Gu6zR86rt5HKsLZui
 kP98Dhwtdthf0t+Rz1AIUQRPGw==
X-Google-Smtp-Source: ABdhPJxpb59hFktEUsGtipn4+6ObQpKxVDWnubnmEtjcV7gbXHLUZBLllQ3TmuYjqw1ZgK8f97Znjg==
X-Received: by 2002:a17:90b:1646:: with SMTP id
 il6mr4148242pjb.210.1631650954684; 
 Tue, 14 Sep 2021 13:22:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
 by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:22:34 -0700 (PDT)
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
Subject: [PATCH v5 09/15] drm/panel-simple: Non-eDP panels don't need "HPD"
 handling
Date: Tue, 14 Sep 2021 13:21:56 -0700
Message-Id: <20210914132020.v5.9.I77d7a48df0a6585ef2cc2ff140fbe8f236a9a9f7@changeid>
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

All of the "HPD" handling added to panel-simple recently was for eDP
panels. Remove it from panel-simple now that panel-edp handles eDP
panels. The "prepare_to_enable" delay only makes sense in the context
of HPD, so remove it too. No non-eDP panels used it anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- ("Non-eDP panels don't need "HPD" handling") new for v3.

 drivers/gpu/drm/panel/panel-simple.c | 134 +--------------------------
 1 file changed, 4 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 79cbad7e8c84..323d24427ec0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -23,7 +23,6 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -92,44 +91,6 @@ struct panel_desc {
 		 */
 		unsigned int prepare;
 
-		/**
-		 * @delay.hpd_absent_delay: Time to wait if HPD isn't hooked up.
-		 *
-		 * Add this to the prepare delay if we know Hot Plug Detect
-		 * isn't used.
-		 */
-		unsigned int hpd_absent_delay;
-
-		/**
-		 * @delay.prepare_to_enable: Time between prepare and enable.
-		 *
-		 * The minimum time, in milliseconds, that needs to have passed
-		 * between when prepare finished and enable may begin. If at
-		 * enable time less time has passed since prepare finished,
-		 * the driver waits for the remaining time.
-		 *
-		 * If a fixed enable delay is also specified, we'll start
-		 * counting before delaying for the fixed delay.
-		 *
-		 * If a fixed prepare delay is also specified, we won't start
-		 * counting until after the fixed delay. We can't overlap this
-		 * fixed delay with the min time because the fixed delay
-		 * doesn't happen at the end of the function if a HPD GPIO was
-		 * specified.
-		 *
-		 * In other words:
-		 *   prepare()
-		 *     ...
-		 *     // do fixed prepare delay
-		 *     // wait for HPD GPIO if applicable
-		 *     // start counting for prepare_to_enable
-		 *
-		 *   enable()
-		 *     // do fixed enable delay
-		 *     // enforce prepare_to_enable min time
-		 */
-		unsigned int prepare_to_enable;
-
 		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
@@ -174,7 +135,6 @@ struct panel_desc {
 struct panel_simple {
 	struct drm_panel base;
 	bool enabled;
-	bool no_hpd;
 
 	bool prepared;
 
@@ -187,7 +147,6 @@ struct panel_simple {
 	struct i2c_adapter *ddc;
 
 	struct gpio_desc *enable_gpio;
-	struct gpio_desc *hpd_gpio;
 
 	struct edid *edid;
 
@@ -371,30 +330,10 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
-{
-	int err;
-
-	p->hpd_gpio = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
-	if (IS_ERR(p->hpd_gpio)) {
-		err = PTR_ERR(p->hpd_gpio);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
-
-		return err;
-	}
-
-	return 0;
-}
-
-static int panel_simple_prepare_once(struct panel_simple *p)
+static int panel_simple_resume(struct device *dev)
 {
-	struct device *dev = p->base.dev;
-	unsigned int delay;
+	struct panel_simple *p = dev_get_drvdata(dev);
 	int err;
-	int hpd_asserted;
-	unsigned long hpd_wait_us;
 
 	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
 
@@ -406,68 +345,12 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
-	delay = p->desc->delay.prepare;
-	if (p->no_hpd)
-		delay += p->desc->delay.hpd_absent_delay;
-	if (delay)
-		msleep(delay);
-
-	if (p->hpd_gpio) {
-		if (p->desc->delay.hpd_absent_delay)
-			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
-		else
-			hpd_wait_us = 2000000;
-
-		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
-					 hpd_asserted, hpd_asserted,
-					 1000, hpd_wait_us);
-		if (hpd_asserted < 0)
-			err = hpd_asserted;
-
-		if (err) {
-			if (err != -ETIMEDOUT)
-				dev_err(dev,
-					"error waiting for hpd GPIO: %d\n", err);
-			goto error;
-		}
-	}
+	if (p->desc->delay.prepare)
+		msleep(p->desc->delay.prepare);
 
 	p->prepared_time = ktime_get();
 
 	return 0;
-
-error:
-	gpiod_set_value_cansleep(p->enable_gpio, 0);
-	regulator_disable(p->supply);
-	p->unprepared_time = ktime_get();
-
-	return err;
-}
-
-/*
- * Some panels simply don't always come up and need to be power cycled to
- * work properly.  We'll allow for a handful of retries.
- */
-#define MAX_PANEL_PREPARE_TRIES		5
-
-static int panel_simple_resume(struct device *dev)
-{
-	struct panel_simple *p = dev_get_drvdata(dev);
-	int ret;
-	int try;
-
-	for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
-		ret = panel_simple_prepare_once(p);
-		if (ret != -ETIMEDOUT)
-			break;
-	}
-
-	if (ret == -ETIMEDOUT)
-		dev_err(dev, "Prepare timeout after %d tries\n", try);
-	else if (try)
-		dev_warn(dev, "Prepare needed %d retries\n", try);
-
-	return ret;
 }
 
 static int panel_simple_prepare(struct drm_panel *panel)
@@ -500,8 +383,6 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
-	panel_simple_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
-
 	p->enabled = true;
 
 	return 0;
@@ -674,13 +555,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	panel->prepared_time = 0;
 	panel->desc = desc;
 
-	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
-	if (!panel->no_hpd) {
-		err = panel_simple_get_hpd_gpio(dev, panel);
-		if (err)
-			return err;
-	}
-
 	panel->supply = devm_regulator_get(dev, "power");
 	if (IS_ERR(panel->supply))
 		return PTR_ERR(panel->supply);
-- 
2.33.0.309.g3052b89438-goog

