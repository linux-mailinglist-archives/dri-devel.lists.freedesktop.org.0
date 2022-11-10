Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F8624D51
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 22:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D56110E056;
	Thu, 10 Nov 2022 21:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAA110E056
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 21:51:57 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id r81so2371344iod.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8xedc8fxi7Oy16t91/IwJKkMU3Vs8EWKD/qEznIlb8=;
 b=H6NyUOm0AbZkDaNkaLeJnr4J6eNslle8QEnwGkCsIc506Gkt8D9PxdaZWLFX05g60M
 RUiwxwgYUDNLWSY+yBK65p6rRPrxwHmgwhc4HYNv96+OL3GbuqXeObbh/nVpwfqq0Erw
 m1keT3DTD8rfvrZBGU87Bi6Mf4NKViG8XFZmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8xedc8fxi7Oy16t91/IwJKkMU3Vs8EWKD/qEznIlb8=;
 b=XlVyjbCFEogdKt2EejV2TH2/RLgU5WgUlhzcb2V5nmQ0M/DIJItXUimQ2KJWyB7LN8
 bTgACmVUYvEQNfL6H/gb3GDI0rbjplejuOuF8+dUyGNLn1K6QzvglsaSgbddsXee7hTY
 qBAXhDAHD3kT3O95gjSxa7mFSZaVd6WsIeBToS84vbn2RkKjlHyQXF7LH7EYCHVYG85c
 DYU+lhvsMO7+Sq5jfmLu8uv931MEk5KtEqiMowf5swdPEosrZ2pc92hnp+ORvnRFCTPH
 GFQlXJtCu8UKZSTUTVd5qqNKQIE2cTgKDCoLos0j3v0drFF8QNElnkQht24uRJmCm+en
 BwOw==
X-Gm-Message-State: ANoB5pnRe7pPu4enJFU2KtEPN0ZLqMN0L4JunD69M+V+6IC/yOzrmvjz
 7pg7qUcUT67vurDzM2ziTfntmCU920qAYA==
X-Google-Smtp-Source: AA0mqf4TRie33rF/wj+ylHAB2svpRQGImmoYU6TxD3zeVtzwd9csitWfe0srFuqjJuNMqM/bufN49A==
X-Received: by 2002:a5e:a908:0:b0:6dd:813a:bfaa with SMTP id
 c8-20020a5ea908000000b006dd813abfaamr2839325iod.146.1668117116136; 
 Thu, 10 Nov 2022 13:51:56 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:7240:bc49:e595:2755])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a0566022ccf00b006ce94d987a3sm109371iow.30.2022.11.10.13.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 13:51:55 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-edp: Use ktime_get_boottime for delays
Date: Thu, 10 Nov 2022 14:51:39 -0700
Message-Id: <20221110145102.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ktime_get is based on CLOCK_MONOTONIC which stops on suspend. On
suspend, the time that the panel was powerd off is recorded with
ktime_get, and on resume this time is compared to the current ktime_get
time to determine if the driver should wait for the panel to power down
completely before re-enabling it.

Because we're using ktime_get, this delay doesn't account for the time
that the device is suspended, during which the power down delay may have
already elapsed.

Change to use ktime_get_boottime throughout, which uses CLOCK_BOOTTIME
which does not stop when suspended. This ensures that the resume path
will not be delayed if the power off delay has already been met while
the device is suspended.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---

 drivers/gpu/drm/panel/panel-edp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5cb8dc2ebe184..a0a7ab35e08c9 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -351,7 +351,7 @@ static void panel_edp_wait(ktime_t start_ktime, unsigned int min_ms)
 		return;
 
 	min_ktime = ktime_add(start_ktime, ms_to_ktime(min_ms));
-	now_ktime = ktime_get();
+	now_ktime = ktime_get_boottime();
 
 	if (ktime_before(now_ktime, min_ktime))
 		msleep(ktime_to_ms(ktime_sub(min_ktime, now_ktime)) + 1);
@@ -378,7 +378,7 @@ static int panel_edp_suspend(struct device *dev)
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 	regulator_disable(p->supply);
-	p->unprepared_time = ktime_get();
+	p->unprepared_time = ktime_get_boottime();
 
 	return 0;
 }
@@ -464,14 +464,14 @@ static int panel_edp_prepare_once(struct panel_edp *p)
 		}
 	}
 
-	p->prepared_time = ktime_get();
+	p->prepared_time = ktime_get_boottime();
 
 	return 0;
 
 error:
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
 	regulator_disable(p->supply);
-	p->unprepared_time = ktime_get();
+	p->unprepared_time = ktime_get_boottime();
 
 	return err;
 }
-- 
2.38.1.493.g58b659f92b-goog

