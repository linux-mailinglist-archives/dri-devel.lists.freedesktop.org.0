Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D24362B4C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047BD6ECF0;
	Fri, 16 Apr 2021 22:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424196ECE4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:01 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 10so10387718pfl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4INPsktRh63MYznTPEEwmqN4qH+4+y6bOootcCGCpqs=;
 b=kgDbFvpoaiTtEYJP/SI4i/wU3eREZ10ugre9Kjus0KuOlxxFF0adtLiKAcm1gyzJ+c
 naAccRw1h9kCrgHQJeNZw/jlAkUmX2FqzN4eR1zv/AqYXgRpFpNDhd9szX6PzibqbUq6
 syf8bF1GO3vgBLnpBUqPPL0vI72391UvUDl5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4INPsktRh63MYznTPEEwmqN4qH+4+y6bOootcCGCpqs=;
 b=juGEbGzTELXhD0svNrvt1UUHqY1nMnab1K/228OzoVoGJcFOPG+j98ez0CzHg3/B8r
 cjEuE2tes2AVmTgxa+8gr5mFOGsKojh9CWwyBM1pINFFTTLEIhbsesirIzppSfjq7mTA
 T+sV9QtMF6UDUIffGUpuxJYQeR30hpf5/8nSjoJnwY7WWDhcpNkOrR7iK6owUcMIpi1a
 KvOftBkFJdz59rrsbyRM8vDGHNMeWfbj7nxOJ8StchMxUNEIcIu8jnNElOozFIddWYU+
 C9TwFe5S44BSXZGZXlX4aYH+C2IYj0tyrrSaQJrEM7bJMl0DRFH5mg+SKq9IrEnUPtPR
 gYBg==
X-Gm-Message-State: AOAM532dv+KH4uQ5tn4DuabiDWJlPbrX8doZPxLdk2JAIjCUUfDgj6Pk
 2wDkkwKxp1RTTqQiPmpZ7v3AwA==
X-Google-Smtp-Source: ABdhPJxdxpzcVYaUk0y3l3qc/9b9JdCgkaUw8QkdRQqUWBnzRKxRKV4SFk9rcOynna/BuiRHtzXx8Q==
X-Received: by 2002:aa7:8d5a:0:b029:227:7b07:7d8b with SMTP id
 s26-20020aa78d5a0000b02902277b077d8bmr9605907pfe.26.1618612860869; 
 Fri, 16 Apr 2021 15:41:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 07/27] drm/panel: panel-simple: Use runtime pm to avoid
 excessive unprepare / prepare
Date: Fri, 16 Apr 2021 15:39:30 -0700
Message-Id: <20210416153909.v4.7.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unpreparing and re-preparing a panel can be a really heavy
operation. Panels datasheets often specify something on the order of
500ms as the delay you should insert after turning off the panel
before turning it on again. In addition, turning on a panel can have
delays on the order of 100ms - 200ms before the panel will assert HPD
(AKA "panel ready"). The above means that we should avoid turning a
panel off if we're going to turn it on again shortly.

The above becomes a problem when we want to read the EDID of a
panel. The way that ordering works is that userspace wants to read the
EDID of the panel _before_ fully enabling it so that it can set the
initial mode correctly. However, we can't read the EDID until we power
it up. This leads to code that does this dance (like
ps8640_bridge_get_edid()):

1. When userspace requests EDID / the panel modes (through an ioctl),
   we power on the panel just enough to read the EDID and then power
   it off.
2. Userspace then turns the panel on.

There's likely not much time between step #1 and #2 and so we want to
avoid powering the panel off and on again between those two steps.

Let's use Runtime PM to help us. We'll move the existing prepare() and
unprepare() to be runtime resume() and runtime suspend(). Now when we
want to prepare() or unprepare() we just increment or decrement the
refcount. We'll default to a 1 second autosuspend delay which seems
sane given the typical delays we see for panels.

A few notes:
- It seems the existing unprepare() and prepare() are defined to be
  no-ops if called extra times. We'll preserve that behavior but may
  try to remove it in a future patch.
- This is a slight change in the ABI of simple panel. If something was
  absolutely relying on the unprepare() to happen instantly that
  simply won't be the case anymore. I'm not aware of anyone relying on
  that behavior, but if there is someone then we'll need to figure out
  how to enable (or disable) this new delayed behavior selectively.
- In order for this to work we now have a hard dependency on
  "PM". From memory this is a legit thing to assume these days and we
  don't have to find some fallback to keep working if someone wants to
  build their system without "PM".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/r/20210402152701.v3.12.I9e8bd33b49c496745bfac58ea9ab418bd3b6f5ce@changeid
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Laurent pointed out that perhaps we don't need to make unprepare() and
prepare() no-ops if called extra times [1]. Since I worry that will
break someone out there, I have left it as a separate change at the
end of this series. See ("drm/panel: panel-simple: Prepare/unprepare
are refcounted, not forced")

[1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com/

(no changes since v1)

 drivers/gpu/drm/panel/Kconfig        |  1 +
 drivers/gpu/drm/panel/panel-simple.c | 93 +++++++++++++++++++++-------
 2 files changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4894913936e9..ef87d92cdf49 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -80,6 +80,7 @@ config DRM_PANEL_SIMPLE
 	tristate "support for simple panels"
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on PM
 	select VIDEOMODE_HELPERS
 	help
 	  DRM panel driver for dumb panels that need at most a regulator and
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index be312b5c04dd..6b22872b3281 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/display_timing.h>
@@ -175,6 +176,8 @@ struct panel_simple {
 	bool enabled;
 	bool no_hpd;
 
+	bool prepared;
+
 	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
@@ -334,19 +337,31 @@ static int panel_simple_disable(struct drm_panel *panel)
 	return 0;
 }
 
+static int panel_simple_suspend(struct device *dev)
+{
+	struct panel_simple *p = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+	p->unprepared_time = ktime_get();
+
+	return 0;
+}
+
 static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
+	int ret;
 
-	if (p->prepared_time == 0)
+	/* Unpreparing when already unprepared is a no-op */
+	if (!p->prepared)
 		return 0;
 
-	gpiod_set_value_cansleep(p->enable_gpio, 0);
-
-	regulator_disable(p->supply);
-
-	p->prepared_time = 0;
-	p->unprepared_time = ktime_get();
+	pm_runtime_mark_last_busy(panel->dev);
+	ret = pm_runtime_put_autosuspend(panel->dev);
+	if (ret < 0)
+		return ret;
+	p->prepared = false;
 
 	return 0;
 }
@@ -376,22 +391,19 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
 	return 0;
 }
 
-static int panel_simple_prepare_once(struct drm_panel *panel)
+static int panel_simple_prepare_once(struct panel_simple *p)
 {
-	struct panel_simple *p = to_panel_simple(panel);
+	struct device *dev = p->base.dev;
 	unsigned int delay;
 	int err;
 	int hpd_asserted;
 	unsigned long hpd_wait_us;
 
-	if (p->prepared_time != 0)
-		return 0;
-
 	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
 
 	err = regulator_enable(p->supply);
 	if (err < 0) {
-		dev_err(panel->dev, "failed to enable supply: %d\n", err);
+		dev_err(dev, "failed to enable supply: %d\n", err);
 		return err;
 	}
 
@@ -405,7 +417,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
 
 	if (p->hpd_gpio) {
 		if (IS_ERR(p->hpd_gpio)) {
-			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
+			err = panel_simple_get_hpd_gpio(dev, p, false);
 			if (err)
 				goto error;
 		}
@@ -423,7 +435,7 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
 
 		if (err) {
 			if (err != -ETIMEDOUT)
-				dev_err(panel->dev,
+				dev_err(dev,
 					"error waiting for hpd GPIO: %d\n", err);
 			goto error;
 		}
@@ -447,25 +459,46 @@ static int panel_simple_prepare_once(struct drm_panel *panel)
  */
 #define MAX_PANEL_PREPARE_TRIES		5
 
-static int panel_simple_prepare(struct drm_panel *panel)
+static int panel_simple_resume(struct device *dev)
 {
+	struct panel_simple *p = dev_get_drvdata(dev);
 	int ret;
 	int try;
 
 	for (try = 0; try < MAX_PANEL_PREPARE_TRIES; try++) {
-		ret = panel_simple_prepare_once(panel);
+		ret = panel_simple_prepare_once(p);
 		if (ret != -ETIMEDOUT)
 			break;
 	}
 
 	if (ret == -ETIMEDOUT)
-		dev_err(panel->dev, "Prepare timeout after %d tries\n", try);
+		dev_err(dev, "Prepare timeout after %d tries\n", try);
 	else if (try)
-		dev_warn(panel->dev, "Prepare needed %d retries\n", try);
+		dev_warn(dev, "Prepare needed %d retries\n", try);
 
 	return ret;
 }
 
+static int panel_simple_prepare(struct drm_panel *panel)
+{
+	struct panel_simple *p = to_panel_simple(panel);
+	int ret;
+
+	/* Preparing when already prepared is a no-op */
+	if (p->prepared)
+		return 0;
+
+	ret = pm_runtime_get_sync(panel->dev);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(panel->dev);
+		return ret;
+	}
+
+	p->prepared = true;
+
+	return 0;
+}
+
 static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
@@ -748,6 +781,18 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		break;
 	}
 
+	dev_set_drvdata(dev, panel);
+
+	/*
+	 * We use runtime PM for prepare / unprepare since those power the panel
+	 * on and off and those can be very slow operations. This is important
+	 * to optimize powering the panel on briefly to read the EDID before
+	 * fully enabling the panel.
+	 */
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
 	err = drm_panel_of_backlight(&panel->base);
@@ -756,8 +801,6 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	drm_panel_add(&panel->base);
 
-	dev_set_drvdata(dev, panel);
-
 	return 0;
 
 free_ddc:
@@ -4603,10 +4646,17 @@ static void panel_simple_platform_shutdown(struct platform_device *pdev)
 	panel_simple_shutdown(&pdev->dev);
 }
 
+static const struct dev_pm_ops panel_simple_pm_ops = {
+	SET_RUNTIME_PM_OPS(panel_simple_suspend, panel_simple_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
 static struct platform_driver panel_simple_platform_driver = {
 	.driver = {
 		.name = "panel-simple",
 		.of_match_table = platform_of_match,
+		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_platform_probe,
 	.remove = panel_simple_platform_remove,
@@ -4901,6 +4951,7 @@ static struct mipi_dsi_driver panel_simple_dsi_driver = {
 	.driver = {
 		.name = "panel-simple-dsi",
 		.of_match_table = dsi_of_match,
+		.pm = &panel_simple_pm_ops,
 	},
 	.probe = panel_simple_dsi_probe,
 	.remove = panel_simple_dsi_remove,
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
