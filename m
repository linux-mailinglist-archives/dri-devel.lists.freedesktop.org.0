Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA792405E4B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0386E923;
	Thu,  9 Sep 2021 21:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C076E91D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:40 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id v1so1901202plo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CLlM7+qUUOK+OKmFCe1lPmfyE4IJNF2a5uSuj+2XYkE=;
 b=NtsJXg7Ld0WF4Ai4x3XjY3rnfGSlpc4hjymTsYyO66HKlGMA2S7iaJ3umoKZ0xlNqQ
 MFsKm4rnZSomKbLmKtEiU91bzM15BBhvqtJYoV8QjfjliUKZbmMHJCSmyNzNVFayLC2l
 vK4x/zbn2Yn/jHbBneef3rtWPnZ0Ri7Zey4Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLlM7+qUUOK+OKmFCe1lPmfyE4IJNF2a5uSuj+2XYkE=;
 b=WU37VajmNlgUSuF2K8RcyJ3zIcsecftbdyUKEY7IG+Y3jFPdwmi+1e/S0+btVB/lr6
 +FpeXMnZH78rwkRaL3aRVvao56MMba+SP5h26VDDgRAOuW31kQQ3a58VSy5JxQOl7rMO
 mmkDbJmihRYcPeW4jQ9yRLXXkUSUsgYmq4pGInh94G+1uTVWAaMRWKr6ZfTywAWtp2eW
 FDNkn6E+YXnktuBsING+kTJyy/qqx2q0VUsanfZA3glOLLqBdlVczfZbZkZOnLWRhSBs
 Frp52D2U85SICq3dD8vhWXh84ch1+ibCtNsNH3esi+v1KDPEqq2csUwNn1OU6yTv5gF8
 C6Lg==
X-Gm-Message-State: AOAM533xn0+LiXlii1MExm0ArOIRZUsV1ULXNBrqvUUhQqf+jWxz+XB8
 vh1azY07x2QE3srIv0LSVqlf1w==
X-Google-Smtp-Source: ABdhPJxO488ndNRnZLdwkSVZMULK608pAZclCMakOYBmYjpDCyYeiR348HpOGQBuoD87PLHm5g561Q==
X-Received: by 2002:a17:902:ab16:b0:13a:356c:6a03 with SMTP id
 ik22-20020a170902ab1600b0013a356c6a03mr4331735plb.38.1631221299398; 
 Thu, 09 Sep 2021 14:01:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:38 -0700 (PDT)
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
Subject: [PATCH v4 09/15] drm/panel-simple: Non-eDP panels don't need "HPD"
 handling
Date: Thu,  9 Sep 2021 14:00:25 -0700
Message-Id: <20210909135838.v4.9.I77d7a48df0a6585ef2cc2ff140fbe8f236a9a9f7@changeid>
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

All of the "HPD" handling added to panel-simple recently was for eDP
panels. Remove it from panel-simple now that panel-edp handles eDP
panels. The "prepare_to_enable" delay only makes sense in the context
of HPD, so remove it too. No non-eDP panels used it anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

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

