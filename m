Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97702F88A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 23:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238E6E4AB;
	Fri, 15 Jan 2021 22:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9D16E4AB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 22:44:48 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id y12so5894707pji.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oDHPk7JANOuofXo//uyQamPz+seSLXpO5Xv0qoPNlbw=;
 b=Qc+B5q9O+2fWa+TSZw8zhoS5aVrF5nF4tujkRDTi6eOOhWaqdFNj6G5xRR2TY4v5Un
 qs/Q/uUaoq+bsv26QmjXezvSrDrO0Vc1bRd+OrM75YX5OTgtnWNkV85c4VvAE0ae870O
 0S0ZtYPvbdeJHdIU2/7hM1BgVWgnH5t81hOZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oDHPk7JANOuofXo//uyQamPz+seSLXpO5Xv0qoPNlbw=;
 b=h/AVKF1SMpe0k1gwHlqlbeDUKTGeQBZlsUgVkKZD8lRh0qv0HPDdIv+BrjGTOY0kM2
 uFj/qNitxxyrRMw2sK2aaczvQmHKUStvDfn8/5br/TZGKZxSFBhrobGjFgz5bYKD/JWE
 H2xsb1waMu1HzKmnaDBAKRIVLTsJ1TBeUutfPviVpVe0rivAY2rIq+l97MV3dMb1Cze2
 xOJSMMh7meqI33ak2XWN9YBNt4Gabr1tS1FQqFWd+k6YFhW4G7G39Vvem5AG8L5RhZat
 K3J6tMSB9Wi2Osge9wugVuMIU1TqupCpUEBA4Wnz5xKy9ptavlvpd1c5xAZ1crJdEuyp
 8BRQ==
X-Gm-Message-State: AOAM5301YtYl1QzaJPlgDs7jsJ64Z1snBtYfQV9BSHCfXndlm9z9PCRq
 rqot/4CA7TCPESlCuZRDw9sSxA==
X-Google-Smtp-Source: ABdhPJw8Oi8GnQQgpwj7t/wOBKjCGXLyC2Rv6QWB2CfwV4PvIFvHUjuWJuKEjD1ugabirHxb7MBU1A==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr13141654pjt.108.1610750688320; 
 Fri, 15 Jan 2021 14:44:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q16sm9131100pfg.139.2021.01.15.14.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:47 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/5] drm/panel-simple: Undo enable if HPD never asserts
Date: Fri, 15 Jan 2021 14:44:16 -0800
Message-Id: <20210115144345.v2.1.I33fcbd64ab409cfe4f9491bf449f51925a4d3281@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210115224420.1635017-1-dianders@chromium.org>
References: <20210115224420.1635017-1-dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the HPD signal never asserts in panel_simple_prepare() and we
return an error, we should unset the enable GPIO and disable the
regulator to make it consistent for the caller.

At the moment I have some hardware where HPD sometimes doesn't assert.
Obviously that needs to be debugged, but this patch makes it so that
if I add a retry that I can make things work.

Fixes: 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying prepare()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Stephen: I didn't take your Reviewed-by tag since I made a small
change.  If you're OK with this change please re-add.

Changes in v2:
- Set the "unprepared_time" so if we retry we give the proper delay.

 drivers/gpu/drm/panel/panel-simple.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 71ae200ac48a..581ab6810b70 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -406,7 +406,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		if (IS_ERR(p->hpd_gpio)) {
 			err = panel_simple_get_hpd_gpio(panel->dev, p, false);
 			if (err)
-				return err;
+				goto error;
 		}
 
 		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
@@ -418,13 +418,20 @@ static int panel_simple_prepare(struct drm_panel *panel)
 		if (err) {
 			dev_err(panel->dev,
 				"error waiting for hpd GPIO: %d\n", err);
-			return err;
+			goto error;
 		}
 	}
 
 	p->prepared_time = ktime_get();
 
 	return 0;
+
+error:
+	gpiod_set_value_cansleep(p->enable_gpio, 0);
+	regulator_disable(p->supply);
+	p->unprepared_time = ktime_get();
+
+	return err;
 }
 
 static int panel_simple_enable(struct drm_panel *panel)
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
