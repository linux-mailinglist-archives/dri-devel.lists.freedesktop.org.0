Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1382AC9F7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 02:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448089623;
	Tue, 10 Nov 2020 01:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3E5897B4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:01:22 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id f21so5606472plr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 17:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bW1B13MA+lpPF6obdjVtfz4uu2DnlzXJwA4hsuPKBZM=;
 b=OyMbX78C5V0d7RSyIgee1PPNW2ZO8LENAU6+xOMJwz0rntmWC8FnJBSUt9lL+TQ+Rt
 2x6U85pZQa9AZrUkySIoP+GlPZj8k/bHqc1rP5i+5cLkeUnHj1Tzt7oADS2Zoe2VY70q
 QbV8STcGdOaBg31JdsiZDBeGrc+Kz5tyQzcfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bW1B13MA+lpPF6obdjVtfz4uu2DnlzXJwA4hsuPKBZM=;
 b=hAyTQBWbgTIllKefctP4+d6+bFN3aQYxNY4BUzcfILZBo2NEX8J84gU+W7YtQvUzyT
 KPvFswJKEnP3EKK9ZBd8wbIi5QUA5bnVzhwgiHrxOOrZ2swYmSaH9cR0oyaWGuR4UBY8
 +vTZ5MvQ/elSnP0iP+I+BOxQCCad/cA0nu6Ip5/jXb2CV3B+adZz5HT0osu1TxnrWptt
 5M5NQ0d9VoisHtUiTipML1Qvc2pEaOYcr45ZmQQXmCio5bO6tv9w6z1t/K1Tr4aLD21z
 QtJEdMRFu+r63v3J2sCN3xqjVdHAFtZ76P0lvPKlr7C9qwYyqK5gCCLWuC12CKT/J3+Z
 3M6w==
X-Gm-Message-State: AOAM532S1pm8/tAguzdV+UYRGuFhQlerMRFpMgRpn4TqEZNsPZ9fKLda
 UnRs1FUSTROm8Msnn3XsX2mClg==
X-Google-Smtp-Source: ABdhPJy9bs+Rprsk5hzIlJbn+gxTdb4kEK+sylbcZHNFCrVE6MBigUyOI3vHG8/L+2CJOuEbVdQRDw==
X-Received: by 2002:a17:902:bf0c:b029:d8:86aa:eb4e with SMTP id
 bi12-20020a170902bf0cb02900d886aaeb4emr1977511plb.82.1604970082146; 
 Mon, 09 Nov 2020 17:01:22 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u197sm7283233pfc.127.2020.11.09.17.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 17:01:21 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 2/5] drm: panel: simple: Defer unprepare delay till next
 prepare to shorten it
Date: Mon,  9 Nov 2020 17:00:56 -0800
Message-Id: <20201109170018.v4.2.I06a95d83e7fa1bd919c8edd63dacacb5436e495a@changeid>
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

It is believed that all of the current users of the "unprepare" delay
don't actually need to wait the amount of time specified directly in
the unprepare phase.  The purpose of the delay that's specified is to
allow the panel to fully power off so that we don't try to power it
back on before it's managed to full power down.

Let's use this observation to avoid the fixed delay that we currently
have.  Instead of delaying, we'll note the current time when the
unprepare happens.  If someone then tries to prepare the panel later
and not enough time has passed, we'll do the delay before starting the
prepare phase.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Split ("Allow timing constraints, not fixed delays") into 2 patches.
- Reuse the existing "unprepare" and assume it means "unprepare_to_prepare".
- Shortened function name to panel_simple_wait().
- Change to fix kerneldoc is now patch #1 in the series.

 drivers/gpu/drm/panel/panel-simple.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 813c90274631..4bc61d71f068 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -115,6 +115,11 @@ struct panel_desc {
 		 *
 		 * The time (in milliseconds) that it takes for the panel
 		 * to power itself down completely.
+		 *
+		 * This time is used to prevent a future "prepare" from
+		 * starting until at least this many milliseconds has passed.
+		 * If at prepare time less time has passed since unprepare
+		 * finished, the driver waits for the remaining time.
 		 */
 		unsigned int unprepare;
 	} delay;
@@ -130,6 +135,8 @@ struct panel_simple {
 	bool enabled;
 	bool no_hpd;
 
+	ktime_t unprepared_time;
+
 	const struct panel_desc *desc;
 
 	struct regulator *supply;
@@ -257,6 +264,20 @@ static int panel_simple_get_non_edid_modes(struct panel_simple *panel,
 	return num;
 }
 
+static void panel_simple_wait(ktime_t start_ktime, unsigned int min_ms)
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
@@ -283,10 +304,8 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 
 	regulator_disable(p->supply);
 
-	if (p->desc->delay.unprepare)
-		msleep(p->desc->delay.unprepare);
-
 	p->prepared = false;
+	p->unprepared_time = ktime_get();
 
 	return 0;
 }
@@ -326,6 +345,8 @@ static int panel_simple_prepare(struct drm_panel *panel)
 	if (p->prepared)
 		return 0;
 
+	panel_simple_wait(p->unprepared_time, p->desc->delay.unprepare);
+
 	err = regulator_enable(p->supply);
 	if (err < 0) {
 		dev_err(panel->dev, "failed to enable supply: %d\n", err);
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
