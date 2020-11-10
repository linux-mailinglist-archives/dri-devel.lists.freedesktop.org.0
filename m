Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B12AC9F6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 02:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4510897B5;
	Tue, 10 Nov 2020 01:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26E389623
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:01:23 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r10so8641672pgb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 17:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XE/eiLRe0EzKnuEmtXJpsdCg0RCwLO38rEooTfIDQMk=;
 b=kgeSNd5r6y7VySLvrEJTmSPLzVgGC6xx35IcjWvlWgHWDJ4SkpKEau64eZsz44+mS+
 SCfIp23Q5KYBhtN/oiUR+rO7G9SQF5GT4JP+5fcp0QvER5G+tQ/4Tvc4fnSLD1PH2stX
 e66j57JoOIRxUmySAFCWJqJ8dKnjWVipFRyqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE/eiLRe0EzKnuEmtXJpsdCg0RCwLO38rEooTfIDQMk=;
 b=LSmFWFhtvmU2JStnsoxK8lZzCDKvJSfFGfOM7kU2ePDEgGN4lXo36p35PTDvHwg6c3
 q71HLWMSTh8wRFVXMcli8aQFBdDPFjM2iiO8coUAYB47cJp6TtVw62ryPOPONn2OHbUU
 YleTXHUrDiCwOkZfxnZELKzwTER9Thkpcq5d7Pll7tuPDEUqTIVNeg3x+3tJdXyRuNpX
 aX4xq8B+IEgQPcWetCqoZq6d3GYyaCEc2adHCpNAjqYOXGJ87Oga5WwHl1MOJ1+bKn7A
 StxSm4yl35ZTILThin5pS5KQM03IPmLldFiBEeExs+NP4Ll9F+KmC/M+u6j5aTF2TW8P
 yg/A==
X-Gm-Message-State: AOAM5330iuQ4eeQkM/jcv/MRb+zrFFIEgyC4pNrI+kRRt/8OcMI7vfVQ
 5kolqp2SKaWHRjEt/536Wvhwmv+3DIctjQ==
X-Google-Smtp-Source: ABdhPJx21BjRHTr9ChM8FxvchE8RAGw5VpEQWBVRK6i4W9u11UzmSxyOBdWYlGtt19JFENBzEI8Wqw==
X-Received: by 2002:a05:6a00:158b:b029:18b:fd84:956d with SMTP id
 u11-20020a056a00158bb029018bfd84956dmr7826261pfk.22.1604970083550; 
 Mon, 09 Nov 2020 17:01:23 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u197sm7283233pfc.127.2020.11.09.17.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 17:01:23 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 3/5] drm: panel: simple: Allow specifying the delay from
 prepare to enable
Date: Mon,  9 Nov 2020 17:00:57 -0800
Message-Id: <20201109170018.v4.3.Ib9ce3c6482f464bf594161581521ced46bbd54ed@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
In-Reply-To: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the panel I'm looking at, there's an 80 ms minimum time between HPD
being asserted by the panel and setting the backlight enable GPIO.
While we could just add an 80 ms "enable" delay, this is not ideal.
Link training is allowed to happen in parallel with this delay so the
fixed 80 ms delay over-delays.

We'll support this by logging the time at the end of prepare and then
delaying in enable if enough time hasn't passed.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Split ("Allow timing constraints, not fixed delays") into 2 patches.
- Fixed kerneldoc.

 drivers/gpu/drm/panel/panel-simple.c | 44 ++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4bc61d71f068..a54f42cb3adc 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -93,6 +93,36 @@ struct panel_desc {
 		 */
 		unsigned int hpd_absent_delay;
 
+		/**
+		 * @delay.prepare_to_enable: Time between prepare and enable.
+		 *
+		 * The minimum time, in milliseconds, that needs to have passed
+		 * between when prepare finished and enable may begin. If at
+		 * enable time less time has passed since prepare finished,
+		 * the driver waits for the remaining time.
+		 *
+		 * If a fixed enable delay is also specified, we'll start
+		 * counting before delaying for the fixed delay.
+		 *
+		 * If a fixed prepare delay is also specified, we won't start
+		 * counting until after the fixed delay. We can't overlap this
+		 * fixed delay with the min time because the fixed delay
+		 * doesn't happen at the end of the function if a HPD GPIO was
+		 * specified.
+		 *
+		 * In other words:
+		 *   prepare()
+		 *     ...
+		 *     // do fixed prepare delay
+		 *     // wait for HPD GPIO if applicable
+		 *     // start counting for prepare_to_enable
+		 *
+		 *   enable()
+		 *     // do fixed enable delay
+		 *     // enforce prepare_to_enable min time
+		 */
+		unsigned int prepare_to_enable;
+
 		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
@@ -131,10 +161,10 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool prepared;
 	bool enabled;
 	bool no_hpd;
 
+	ktime_t prepared_time;
 	ktime_t unprepared_time;
 
 	const struct panel_desc *desc;
@@ -297,14 +327,14 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->prepared)
+	if (p->prepared_time == 0)
 		return 0;
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->supply);
 
-	p->prepared = false;
+	p->prepared_time = 0;
 	p->unprepared_time = ktime_get();
 
 	return 0;
@@ -342,7 +372,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	int err;
 	int hpd_asserted;
 
-	if (p->prepared)
+	if (p->prepared_time != 0)
 		return 0;
 
 	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
@@ -381,7 +411,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		}
 	}
 
-	p->prepared = true;
+	p->prepared_time = ktime_get();
 
 	return 0;
 }
@@ -396,6 +426,8 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
+	panel_simple_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
+
 	p->enabled = true;
 
 	return 0;
@@ -562,7 +594,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return -ENOMEM;
 
 	panel->enabled = false;
-	panel->prepared = false;
+	panel->prepared_time = 0;
 	panel->desc = desc;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
