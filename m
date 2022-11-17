Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F154462E60B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 21:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B99C10E5F1;
	Thu, 17 Nov 2022 20:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9A10E5F1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 20:39:06 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id h206so2310726iof.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cZEHbyUygY8mL/VudOEJPrn+JnbHs5KjIjH28m2m7pA=;
 b=UER82uY/1H5jglIAPvq1HsO4gdv4BFQBRhaokleoscz7Q4tld2LY9bERy0ACZV8fhB
 IxIqhMTIkOn6F4rz+ndD8NGvcSuANM7pvoitxcDZcPvzhzsADp3S64VuG+X0BO9X0ker
 Ux1ahNLGD7fRkaIH2Ib+C1+uCkYKYrs9mWlXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cZEHbyUygY8mL/VudOEJPrn+JnbHs5KjIjH28m2m7pA=;
 b=AwhPzO6syblEi3ckp5t6qmIWqAJOfbicqI3fERenKDCHxM+qQTlz1bUON7iFut8r68
 hF+SMGlGrjeiv/klbdkv57N0eHwehbC8LBYKYVUC14XJVByYgWEc026DZsSIBj8FwM/Y
 wDcQptghmzIkTQHRoaXVwgMGMdQFDHDHYzxfjLBA84AU8iefxkDerO8LazAOFAK03OtL
 yr3rDoHRZckCBg4R95cJ/59ltx7lyZYYKpgLR0rNRRHxrVS2rq9vM3Tq3t7CY3NgM1MM
 aQ6JcQZDr0bvrnNMX6g8Gvlj3bivtOs3DpX7pCh4AIyPuR6tzqRW3xN1/nwz6thEs2J1
 eL9Q==
X-Gm-Message-State: ANoB5plevcdXNqH8EBpiMGFje78k7IFF6yHSn1jJMq98yGhiFZWoWPaN
 5NeZm8jFhPNffHwKwExoHNQomp/6VTIR7Q==
X-Google-Smtp-Source: AA0mqf6DFioq87cI1ZJtq/Ye8wvmc8ZleSSIc+du2UJgDEkL5FsB9OHxasI3b5ipXufFJbhum4CRyA==
X-Received: by 2002:a05:6638:440b:b0:374:fbbe:2da6 with SMTP id
 bp11-20020a056638440b00b00374fbbe2da6mr1806005jab.163.1668717545484; 
 Thu, 17 Nov 2022 12:39:05 -0800 (PST)
Received: from midworld.bld.corp.google.com
 ([2620:15c:183:200:b285:6808:3f3e:f538])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00363da904602sm570192jac.13.2022.11.17.12.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 12:39:04 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/panel-edp: Use ktime_get_boottime for delays
Date: Thu, 17 Nov 2022 13:38:44 -0700
Message-Id: <20221117133655.1.I51639dc112bbbe27259df6bdad56dbabd655d91a@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
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
Cc: dianders@chromium.org, linux-kernel@vger.kernel.org,
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
2.38.1.584.g0f3c55d4c2-goog

