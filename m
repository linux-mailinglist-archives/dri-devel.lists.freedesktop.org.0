Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BA29BD33
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCBE6E1D2;
	Tue, 27 Oct 2020 16:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159516E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:46:29 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 10so1243828pfp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsZEVeTPuxeWNhyuGo8tUdund/O3OcaD79qUn4oefT8=;
 b=jpUCUhjI1DzbIPLIhYF0iFV+0AMGhMrCYScsCt6V1q+QGIqVOxiHOO2/cwxW2p/vXi
 357pMeH7v+k393kaf0E0crX1Mm3IotUsit7Faw4aj1eiGRJeQkeUNcQWj5HLAVREyHgy
 m5LkfV9zfgN+hNqjsJYsKE783iPGkc7R5YPh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsZEVeTPuxeWNhyuGo8tUdund/O3OcaD79qUn4oefT8=;
 b=Bs/xHYCcIf1z0ab/l6T3vjVCXBfsjUyCuNWhnQJEnvFByEcwdc9tSsE8GLubGHhCd9
 LcJ228fAn/+7M02CCtOq0C90VDnr23+6ni+ZALYnaVKCygNoaDqD3N1nKv5zS2p15zp0
 a52hSBueavPo9VEKVn2Z58PfjpV+Sz94Erl9AkRu8iSXAdoKXFGt11dxPjI7ehvH9Iwy
 liC2gCQtDlF1p5KYsITiIfFnuix9I9Y/wodkydKuHXH8ttEnGbk1JVvxNYhLKPhuPrWV
 QDdPG5uoD2RafrxqsV4Zs3a5l6iUXvfTwAqPIbv93DSTQxbmCNszNI/Xkk5CDDzuh3Xt
 6d8Q==
X-Gm-Message-State: AOAM532swsfOnC0O1N4R2gSWdk/rlO8SNSGNVxxBJnVv/aQol9607xWE
 PLlIjgIClapcpQWrR1txAdGiCg==
X-Google-Smtp-Source: ABdhPJy6kI/jv5TbL1WQCyeCthgUrZ18nX4JbLu7XsYrfHw0VtV5ZfSNPYg6/axupJDydAQHOkNGEA==
X-Received: by 2002:a63:7408:: with SMTP id p8mr2559660pgc.273.1603817188516; 
 Tue, 27 Oct 2020 09:46:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id c12sm3002688pgi.14.2020.10.27.09.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:46:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/3] drm: panel: simple: Allow timing constraints,
 not fixed delays
Date: Tue, 27 Oct 2020 09:45:54 -0700
Message-Id: <20201027094553.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
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

 drivers/gpu/drm/panel/panel-simple.c | 51 ++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 2be358fb46f7..cbbe71a2a940 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -92,6 +92,19 @@ struct panel_desc {
 		unsigned int unprepare;
 	} delay;
 
+	/**
+	 * @prepare_to_enable_ms: If this many milliseconds hasn't passed after
+	 *                        prepare finished, add a delay to the start
+	 *                        of enable.
+	 * @unprepare_to_prepare_ms: If this many milliseconds hasn't passed
+	 *                           unprepare finished, add a delay to the
+	 *                           start of prepare.
+	 */
+	struct {
+		unsigned int prepare_to_enable_ms;
+		unsigned int unprepare_to_prepare_ms;
+	} timing_constraints;
+
 	u32 bus_format;
 	u32 bus_flags;
 	int connector_type;
@@ -99,10 +112,12 @@ struct panel_desc {
 
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
@@ -230,6 +245,21 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	return num;
 }
 
+static void panel_simple_enforce_constraint(ktime_t start_ktime,
+					    unsigned int min_ms)
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
@@ -249,18 +279,19 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
 
-	if (!p->prepared)
+	if (!p->prepared_time)
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
 
@@ -296,9 +327,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	int err;
 	int hpd_asserted;
 
-	if (p->prepared)
+	if (p->prepared_time)
 		return 0;
 
+	panel_simple_enforce_constraint(p->unprepared_time,
+					p->desc->timing_constraints.unprepare_to_prepare_ms);
+
 	err = regulator_enable(p->supply);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable supply: %d\n", err);
@@ -333,7 +367,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		}
 	}
 
-	p->prepared = true;
+	p->prepared_time = ktime_get();
 
 	return 0;
 }
@@ -348,6 +382,9 @@ static int panel_simple_enable(struct drm_panel *panel)
 	if (p->desc->delay.enable)
 		msleep(p->desc->delay.enable);
 
+	panel_simple_enforce_constraint(p->prepared_time,
+					p->desc->timing_constraints.prepare_to_enable_ms);
+
 	p->enabled = true;
 
 	return 0;
@@ -514,7 +551,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 		return -ENOMEM;
 
 	panel->enabled = false;
-	panel->prepared = false;
+	panel->prepared_time = 0;
 	panel->desc = desc;
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
-- 
2.29.0.rc2.309.g374f81d7ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
