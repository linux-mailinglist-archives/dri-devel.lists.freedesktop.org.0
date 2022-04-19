Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA27507373
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6310F0A4;
	Tue, 19 Apr 2022 16:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA6510F0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:42:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21AC3B81AC8;
 Tue, 19 Apr 2022 16:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B5C385AB;
 Tue, 19 Apr 2022 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386535;
 bh=+H1+foy7TUNvzKw9IPZ9qQkuYfuC23E40xmiZHmyw8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgydP6yEicIIy/M8QwJCJbhglFA8foOzULMKyltFmXik239VsGUTgzFUAL5wLF9vR
 yMxOF9N17d8Gm13CkVHGOLvN9CkP3A9XaFnJ0xREaPP+arGnEFt4ixw3igMl35EqXV
 yxBPns0uK7j+Cic3VAPSr0NWnY/Kss2HLt0dOUCUdopKPuayIfSMRO8b8Yj/pflE6d
 OgZPFC3CPPvEmh9bxKnVBRiwj34m6rBrBxkiq/Ht4gtHbcdwAztw59OZASONXWI66Q
 OniZDp9F3QNfXA1+UztViTDb9rtV9YEMtE7mjC9f5RB2LhtOcy2aBCYHme+bCs4eAF
 KcmwBn+/vfrjA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 26/48] input: touchscreen: mainstone: fix pxa2xx+pxa3xx
 configuration
Date: Tue, 19 Apr 2022 18:37:48 +0200
Message-Id: <20220419163810.2118169-27-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There are two different ways of flushing the ac97 queue
in this driver, selected by a compile time option.

Change this to a runtime selection to make it work when both
are enabled.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 87655105ef3a..618c80847d9f 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -98,25 +98,20 @@ MODULE_PARM_DESC(ac97_touch_slot, "Touch screen data slot AC97 number");
 
 
 /* flush AC97 slot 5 FIFO on pxa machines */
-#ifdef CONFIG_PXA27x
-static void wm97xx_acc_pen_up(struct wm97xx *wm)
-{
-	schedule_timeout_uninterruptible(1);
-
-	while (MISR & (1 << 2))
-		MODR;
-}
-#else
 static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
 	schedule_timeout_uninterruptible(1);
 
-	for (count = 0; count < 16; count++)
-		MODR;
+	if (cpu_is_pxa27x()) {
+		while (MISR & (1 << 2))
+			MODR;
+	} else if (cpu_is_pxa3xx()) {
+		for (count = 0; count < 16; count++)
+			MODR;
+	}
 }
-#endif
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
-- 
2.29.2

