Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7C540EA1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DF510F06E;
	Tue,  7 Jun 2022 18:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1795 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 18:58:13 UTC
Received: from 6.mo561.mail-out.ovh.net (6.mo561.mail-out.ovh.net
 [188.165.43.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9910E10F023
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:13 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.110.171.5])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 8C2B624679
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:21:19 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id CA4DE2B3FFBEF;
 Tue,  7 Jun 2022 18:21:11 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005316ed421-19f3-47a4-8681-230257df63a6,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] drm/panel: sony-acx565akm: Use backlight helpers
Date: Tue,  7 Jun 2022 20:20:26 +0200
Message-Id: <20220607182026.1121992-4-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607182026.1121992-1-steve@sk2.org>
References: <20220607182026.1121992-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10889422424181868166
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehiedu
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
Cc: Stephen Kitt <steve@sk2.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Instead of manually checking the power state in struct
backlight_properties, use backlight_is_blank().

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 0d7541a33f87..a6bc8c8cf6c8 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -298,13 +298,7 @@ static void acx565akm_set_brightness(struct acx565akm_panel *lcd, int level)
 static int acx565akm_bl_update_status_locked(struct backlight_device *dev)
 {
 	struct acx565akm_panel *lcd = dev_get_drvdata(&dev->dev);
-	int level;
-
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-	    dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
+	int level = backlight_get_brightness(dev);
 
 	acx565akm_set_brightness(lcd, level);
 
@@ -330,8 +324,7 @@ static int acx565akm_bl_get_intensity(struct backlight_device *dev)
 
 	mutex_lock(&lcd->mutex);
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-	    dev->props.power == FB_BLANK_UNBLANK)
+	if (!backlight_is_blank(dev))
 		intensity = acx565akm_get_actual_brightness(lcd);
 	else
 		intensity = 0;
-- 
2.30.2

