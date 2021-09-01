Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15CF3FE3BB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D666E2DF;
	Wed,  1 Sep 2021 20:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79DE6E2DC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:20:46 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x19so739226pfu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 13:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4fpY0eLBwj2U4FLaelgRrA4nNjF8yAIZlmqv9iLR+tE=;
 b=FTL8M/mHaIAxpDkQl0wEW/FMv78iEhK602T4tA32+vhl2d/Mz3qWTX2fmV2pXKd8DT
 GMaCxAclSY6rHw5an6KgVWpz3ss37X9Lq9ZGx793GNOeM/vcTwZ2doYdePd9LnjDPFoV
 Sbcm8gJPraSIc2tryzRu/rsReHJAI0MvU4BdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4fpY0eLBwj2U4FLaelgRrA4nNjF8yAIZlmqv9iLR+tE=;
 b=oejxbsx+MdEzZdBO+9M3b+Bfib0ZVHeVTvYZWrRox/XHZ+CE46kcSrLLVljSKPYiHZ
 1K8E4LMIJIJh5nYh+cyxS9yy1HyZeLDIQN3gVqv1d1evOz7H1PLiFIsluL31PGVL8TWu
 bCDipEWYtOU0aenzo9whtawyrKcWEzG7W+hncVuU85Q/TtHwLlmRIK1C4bTVD78CPphS
 8lQ6h4zyJok7LQxwf5Cu9qlQSAc5ltzDClGjvSehsykYExzO4BmWF3EJGZVe5tAMc0Sg
 FJo4Sh+hEHz7gTI5gwg+kgwv7gKXrJ994jj7qbQtvCNXaTBR9nBw7nZ6lvEbIKU/CqDd
 LabQ==
X-Gm-Message-State: AOAM530IJphcIzXgIhJg680VOJ8jhvAz96NX0BkcJpXvKdbqoURWiV+M
 O1zgQa5ipgTPxJDNvYHp05YVPQ==
X-Google-Smtp-Source: ABdhPJzSba4UggTnOX5p7AZGkS8aFd8DvsD7HeNoVfAzr/fT09ehlgAjJylastBFWg4sc8Cg4LnqVQ==
X-Received: by 2002:a05:6a00:140e:b029:38b:c129:9f2f with SMTP id
 l14-20020a056a00140eb029038bc1299f2fmr1056089pfu.75.1630527646423; 
 Wed, 01 Sep 2021 13:20:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:958b:b561:a735:e774])
 by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 13:20:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/16] drm/panel-simple: Non-eDP panels don't need "HPD"
 handling
Date: Wed,  1 Sep 2021 13:19:28 -0700
Message-Id: <20210901131531.v3.10.I77d7a48df0a6585ef2cc2ff140fbe8f236a9a9f7@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
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
panels. Remove it from panel-simple now that panel-simple-edp handles
eDP panels. The "prepare_to_enable" delay only makes sense in the
context of HPD, so remove it too. No non-eDP panels used it anyway.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("Non-eDP panels don't need "HPD" handling") new for v3.

 drivers/gpu/drm/panel/panel-simple.c | 134 +--------------------------
 1 file changed, 4 insertions(+), 130 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcfec124d69d..abec01d9798e 100644
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
2.33.0.259.gc128427fd7-goog

