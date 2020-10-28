Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A229D9A1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 23:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC8F6E7EA;
	Wed, 28 Oct 2020 22:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE66E7EA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 22:58:28 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id s22so734152pga.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JrNRWkX7EOt8SVl4zWRV9sKmFHfyMIG2OqzNYF3b1M=;
 b=FlAUuLWzuw4wyGQlXQPvLmW7TDzRwrWOn7nj+yU138n3wf1/Ss6yWLBsI6l320puRM
 OJuS3tXIeV/UtDOjqvL57DPMv9d5VUunc2MFA5W06K3LywQLLFi++HLcqV4vuqth/vSq
 Qrv+z+ZN2iEFcAPNb1UdB9E9REkSFVTiD9hN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6JrNRWkX7EOt8SVl4zWRV9sKmFHfyMIG2OqzNYF3b1M=;
 b=AVqRy1l1zgkOHeO4URobNEpeIz/6LAwp0EU1iLkFhJooMNs5ZwKyd53vtuay8gvfpk
 X3pO0rgDT2DPNjIUKBrxbxNSXQzOo536n37yzDNA/G69vttvz9TajbmN/PIazMkmGX52
 QefGimWwz6POx5XRJtgBbd4k7G2XH8yy1PdVmNmxhOyY6voY9E7UncyCN+ofo9yAvTHX
 cPRkCtC03affTgkhZRDINsRTryQb+IDm/g4+kBzPR1EiIZ5LXnhFV+j4wuxKC5x+iumX
 kM83XeV1uoN3b7tuAoyaXqM0pFW8GO/9tSZ9k5wymllpmaj3PFNAbFf+MTLffUOZVQ4B
 RCzQ==
X-Gm-Message-State: AOAM530PhXqmBKjA4eVRTi9WnGfnKlVjTOvHOgS5BguYu2gWxqsd/LFU
 PaDmG4i0uQd1wFnWigrZZjaWcQ==
X-Google-Smtp-Source: ABdhPJxe0Y9rORN07q3KsR3t9GhM59XksWeUXABlljFXed/iVl2hw85V8N4/e6n2yfJnZenjSqNdfw==
X-Received: by 2002:a17:90a:a4c9:: with SMTP id
 l9mr1060040pjw.203.1603925907664; 
 Wed, 28 Oct 2020 15:58:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id b185sm394364pgc.68.2020.10.28.15.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 15:58:26 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/3] drm: panel: simple: Allow timing constraints,
 not fixed delays
Date: Wed, 28 Oct 2020 15:58:01 -0700
Message-Id: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
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

The simple panel code currently allows panels to define fixed delays
at certain stages of initialization.  These work OK, but they don't
really map all that clearly to the requirements presented in many
panel datasheets.  Instead of defining a fixed delay, those datasheets
provide a timing diagram and specify a minimum amount of time that
needs to pass from event A to event B.

Because of the way things are currently defined, most panels end up
over-delaying.  One prime example here is that a number of panels I've
looked at define the amount of time that must pass between turning a
panel off and turning it back on again.  Since there is no way to
specify this, many developers have listed this as the "unprepare"
delay.  However, if nobody ever tried to turn the panel on again in
the next 500 ms (or whatever the delay was) then this delay was
pointless.  It's better to do the delay only in the case that someone
tried to turn the panel on too quickly.

Let's support specifying delays as constraints.  We'll start with the
one above and also a second one: the minimum time between prepare
being done and doing the enable.  On the panel I'm looking at, there's
an 80 ms minimum time between HPD being asserted by the panel and
setting the backlight enable GPIO.  By specifying as a constraint we
can enforce this without over-delaying.  Specifically the link
training is allowed to happen in parallel with this delay so adding a
fixed 80 ms delay isn't ideal.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Inline the kernel doc for the two new members.
- Beefed up kernel doc saying exactly when the delay happens.
- Removed "_ms" from the end of members to shorten them.
- Renamed "timing_constraints" to "min_times" to shorten it.
- Renamed "enforce_constraint()" to "wait_min_time()" to shorten it.
- Check "prepared_time" against 0 to see if we've been prepared.

 drivers/gpu/drm/panel/panel-simple.c | 99 ++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358fb46f7..2613b9434548 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -92,6 +92,68 @@ struct panel_desc {
 		unsigned int unprepare;
 	} delay;
 
+	struct {
+		/**
+		 * @prepare_to_enable: Time between prepare and enable.
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
+		/**
+		 * @unprepare_to_prepare: Time between unprepare and prepare.
+		 *
+		 * The minimum time, in milliseconds, that needs to have passed
+		 * between when unprepare finished and prepare may begin. If at
+		 * prepare time less time has passed since unprepare finished,
+		 * the driver waits for the remaining time.
+		 *
+		 * If a fixed unprepare delay is also specified, we'll start
+		 * counting before delaying for the fixed delay.
+		 *
+		 * If a fixed prepare delay is also specified, it will happen
+		 * separately and after we've enforced this minimum. We can't
+		 * overlap this fixed delay with the min time because the
+		 * fixed delay doesn't happen at the start of the function
+		 * if a regulator or enable GPIO was specified.
+		 *
+		 * In other words:
+		 *   unprepare():
+		 *     ...
+		 *     // start counting for unprepare_to_prepare
+		 *     // do fixed unprepare delay
+		 *
+		 *   prepare():
+		 *     // enforce unprepare_to_prepare min time
+		 *     // turn on regulator / set enable GPIO if applicable
+		 *     // do fixed prepare delay
+		 */
+		unsigned int unprepare_to_prepare;
+	} min_times;
+
 	u32 bus_format;
 	u32 bus_flags;
 	int connector_type;
@@ -99,10 +161,12 @@ struct panel_desc {
 
 struct panel_simple {
 	struct drm_panel base;
-	bool prepared;
 	bool enabled;
 	bool no_hpd;
 
+	ktime_t prepared_time;
+	ktime_t unprepared_time;
+
 	const struct panel_desc *desc;
 
 	struct regulator *supply;
@@ -230,6 +294,20 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	return num;
 }
 
+static void panel_simple_wait_min_time(ktime_t start_ktime, unsigned int min_ms)
+{
+	ktime_t now_ktime, min_ktime;
+
+	if (!min_ms)
+		return;
+
+	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
+	now_ktime = ktime_get();
+
+	if (ktime_before(now_ktime, min_ktime))
+		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
+}
+
 static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
@@ -249,18 +327,19 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->prepared)
+	if (p->prepared_time != 0)
 		return 0;
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 
 	regulator_disable(p->supply);
 
+	p->prepared_time = 0;
+	p->unprepared_time = ktime_get();
+
 	if (p->desc->delay.unprepare)
 		msleep(p->desc->delay.unprepare);
 
-	p->prepared = false;
-
 	return 0;
 }
 
@@ -296,9 +375,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	int err;
 	int hpd_asserted;
 
-	if (p->prepared)
+	if (p->prepared_time == 0)
 		return 0;
 
+	panel_simple_wait_min_time(p->unprepared_time,
+				   p->desc->min_times.unprepare_to_prepare);
+
 	err = regulator_enable(p->supply);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable supply: %d\n", err);
@@ -333,7 +415,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		}
 	}
 
-	p->prepared = true;
+	p->prepared_time = ktime_get();
 
 	return 0;
 }
@@ -348,6 +430,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
+	panel_simple_wait_min_time(p->prepared_time,
+				   p->desc->min_times.prepare_to_enable);
+
 	p->enabled = true;
 
 	return 0;
@@ -514,7 +599,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return -ENOMEM;
 
 	panel->enabled = false;
-	panel->prepared = false;
+	panel->prepared_time = 0;
 	panel->desc = desc;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
-- 
2.29.1.341.ge80a0c044ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
