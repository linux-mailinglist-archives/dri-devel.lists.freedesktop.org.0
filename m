Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9942C7C33
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0066E3EF;
	Mon, 30 Nov 2020 01:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F00E6F3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 13F9A1F465A8
Received: by jupiter.universe (Postfix, from userid 1000)
 id C796D4800D9; Fri, 27 Nov 2020 21:05:07 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/panel: sony-acx565akm: Fix race condition in probe
Date: Fri, 27 Nov 2020 21:04:29 +0100
Message-Id: <20201127200429.129868-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: kernel@collabora.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Jarkko Nikula <jarkko.nikula@bitmer.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The probe routine acquires the reset GPIO using GPIOD_OUT_LOW. Directly
afterwards it calls acx565akm_detect(), which sets the GPIO value to
HIGH. If the bootloader initialized the GPIO to HIGH before the probe
routine was called, there is only a very short time period of a few
instructions where the reset signal is LOW. Exact time depends on
compiler optimizations, kernel configuration and alignment of the stars,
but I expect it to be always way less than 10us. There are no public
datasheets for the panel, but acx565akm_power_on() has a comment with
timings and reset period should be at least 10us. So this potentially
brings the panel into a half-reset state.

The result is, that panel may not work after boot and can get into a
working state by re-enabling it (e.g. by blanking + unblanking), since
that does a clean reset cycle. This bug has recently been hit by Ivaylo
Dimitrov, but there are some older reports which are probably the same
bug. At least Tony Lindgren, Peter Ujfalusi and Jarkko Nikula have
experienced it in 2017 describing the blank/unblank procedure as
possible workaround.

Note, that the bug really goes back in time. It has originally been
introduced in the predecessor of the omapfb driver in 3c45d05be382
("OMAPDSS: acx565akm panel: handle gpios in panel driver") in 2012.
That driver eventually got replaced by a newer one, which had the bug
from the beginning in 84192742d9c2 ("OMAPDSS: Add Sony ACX565AKM panel
driver") and still exists in fbdev world. That driver has later been
copied to omapdrm and then was used as a basis for this driver. Last
but not least the omapdrm specific driver has been removed in
45f16c82db7e ("drm/omap: displays: Remove unused panel drivers").

Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Reported-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reported-by: Tony Lindgren <tony@atomide.com>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Fixes: 1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index e95fdfb16b6c..ba0b3ead150f 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -629,7 +629,7 @@ static int acx565akm_probe(struct spi_device *spi)
 	lcd->spi = spi;
 	mutex_init(&lcd->mutex);
 
-	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	lcd->reset_gpio = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(lcd->reset_gpio)) {
 		dev_err(&spi->dev, "failed to get reset GPIO\n");
 		return PTR_ERR(lcd->reset_gpio);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
