Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23B9227A69
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301E889BD5;
	Tue, 21 Jul 2020 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576456E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 04:27:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id s26so10124538pfm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 21:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N/wJfZ0DKQLS30NQ3l5EIxZJq9J06grk8ARjTDSck7w=;
 b=PFRa/z5GQ2aechR5xdic5ratkkROo9TDbkDV0lfEhzl5c2wyBrpnCvl57h3r6cKVo6
 pxMZ02n3ejPcvOlM99KP4pcnPYYp5sRlNo/dXiQZyn4d8IORomjDiBWZKyIRJOjrllZF
 SdnwlQpb6nT2RAeLooiCOTqO33gn75W0W9hgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N/wJfZ0DKQLS30NQ3l5EIxZJq9J06grk8ARjTDSck7w=;
 b=pxB0y7U85EBxeVxX8mkLpS2dvhGlW9rggl/+ebOpHbNcdrfoQVnD0LzY7GyA0n6MNI
 d1/xPMQG+7sp990rUB3q4enJIDV40ieNHs8/xv9csWfRWTk2LOew0k8xGIktq1WujDmr
 gBVbQAn0jt2Yma4dNxs3L5hK0C4gD8GeIczCl9LF2Qq5x5WJ+i/Ai1wN7GijHVuzqPwJ
 hp0Jt+ku8Sz/ED4LJ9AWdCFsFECmx6p7HPI4iSrVllGtBjgO/5HYNjQn/ke9xHwbKX1Z
 ffBuUXi4ILN4MVMDuSJ1UEuyAo5wO4g3YKeSjCWwy7R7o7zPHNvU2Apmlv2buYHjlJ+l
 vpcg==
X-Gm-Message-State: AOAM533LHM3QYW3aK6PTs5n1PL0xIhZe13grzGcfDAgIVEDjZ5XqHfJy
 6KdbSWe9zyciuVSNSs74VrGqUybqYbQ=
X-Google-Smtp-Source: ABdhPJyUx8c12Dq9u0oNfnaJvKI51s1Ej6i9NFYa2LGNRTz8LXng/MMLgsjl9D/uUGj8e5JMXp2RVw==
X-Received: by 2002:a62:647:: with SMTP id 68mr12022813pfg.45.1595305639994;
 Mon, 20 Jul 2020 21:27:19 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net.
 [73.63.253.164])
 by smtp.gmail.com with ESMTPSA id o8sm1207075pjf.37.2020.07.20.21.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 21:27:19 -0700 (PDT)
From: Alexandru Stan <amstan@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
Date: Mon, 20 Jul 2020 21:25:21 -0700
Message-Id: <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721042522.2403410-1-amstan@chromium.org>
References: <20200721042522.2403410-1-amstan@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Alexandru Stan <amstan@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some displays need the low end of the curve cropped in order to make
them happy. In that case we still want to have the 0% point, even though
anything between 0% and 5%(example) would be skipped.

Signed-off-by: Alexandru Stan <amstan@chromium.org>
---

 drivers/video/backlight/pwm_bl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 5193a72305a2..b24711ddf504 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
 			/* Fill in the last point, since no line starts here. */
 			table[x2] = y2;
 
+			/*
+			 * If we don't start at 0 yet we're increasing, assume
+			 * the dts wanted to crop the low end of the range, so
+			 * insert a 0 to provide a display off mode.
+			 */
+			if (table[0] > 0 && table[0] < table[num_levels - 1])
+				table[0] = 0;
+
 			/*
 			 * As we use interpolation lets remove current
 			 * brightness levels table and replace for the
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
