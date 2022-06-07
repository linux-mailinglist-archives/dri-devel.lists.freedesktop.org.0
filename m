Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B2540F2A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4843B10F3FD;
	Tue,  7 Jun 2022 19:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 19:03:07 UTC
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B43B10F405
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:03:07 +0000 (UTC)
Received: from player738.ha.ovh.net (unknown [10.111.208.48])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 3C2F824816
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:55:35 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 98BE12B7105E6;
 Tue,  7 Jun 2022 18:55:22 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c3165992-545e-42a9-9988-75529117242b,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Len Baker <len.baker@gmx.com>
Subject: [PATCH] staging: ftbft: Use backlight helper
Date: Tue,  7 Jun 2022 20:55:16 +0200
Message-Id: <20220607185516.1129900-1-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11468134978585724588
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhephfevveeuhfduuedvteduheduveekveekkeduteduiedvkeejgeelveeuffetteetnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheekud
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Stephen Kitt <steve@sk2.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

backlight_properties.fb_blank is deprecated. The states it represents
are handled by other properties; but instead of accessing those
properties directly, drivers should use the helpers provided by
backlight.h.

Instead of manually checking the power state in struct
backlight_properties, use backlight_is_blank().

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Len Baker <len.baker@gmx.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/fbtft/fb_ssd1351.c | 3 +--
 drivers/staging/fbtft/fbtft-core.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 6fd549a424d5..b8d55aa8c5c7 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -196,8 +196,7 @@ static int update_onboard_backlight(struct backlight_device *bd)
 		      "%s: power=%d, fb_blank=%d\n",
 		      __func__, bd->props.power, bd->props.fb_blank);
 
-	on = (bd->props.power == FB_BLANK_UNBLANK) &&
-	     (bd->props.fb_blank == FB_BLANK_UNBLANK);
+	on = !backlight_is_blank(bd);
 	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
 	write_reg(par, 0xB5, on ? 0x03 : 0x02);
 
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 60b2278d8b16..9b3eaed80cdd 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -137,8 +137,7 @@ static int fbtft_backlight_update_status(struct backlight_device *bd)
 		      "%s: polarity=%d, power=%d, fb_blank=%d\n",
 		      __func__, polarity, bd->props.power, bd->props.fb_blank);
 
-	if ((bd->props.power == FB_BLANK_UNBLANK) &&
-	    (bd->props.fb_blank == FB_BLANK_UNBLANK))
+	if (!backlight_is_blank(bd))
 		gpiod_set_value(par->gpio.led[0], polarity);
 	else
 		gpiod_set_value(par->gpio.led[0], !polarity);

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.30.2

