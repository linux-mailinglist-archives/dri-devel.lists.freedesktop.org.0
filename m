Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB96660554
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D5110E884;
	Fri,  6 Jan 2023 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1126 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 17:08:46 UTC
Received: from 2.mo581.mail-out.ovh.net (2.mo581.mail-out.ovh.net
 [87.98.143.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CF110E884
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:08:46 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.211])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id BD49025EB8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 16:49:58 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dkv5l (unknown [10.110.171.46])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C0B041FF00;
 Fri,  6 Jan 2023 16:49:57 +0000 (UTC)
Received: from sk2.org ([37.59.142.107])
 by ghost-submission-6684bf9d7b-dkv5l with ESMTPSA
 id KI4TJzVRuGOnAQEAwhnnFg
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 16:49:57 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0018fb2c2a3-f80b-4d71-80ed-2036c37f7c47,
 9FE29456621203A27B372E1E0503D45BE0167874) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Date: Fri,  6 Jan 2023 17:48:52 +0100
Message-Id: <20230106164856.1453819-2-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5851864767681496795
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkedupdhmohguvgepshhmthhpohhuth
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
Cc: linux-fbdev@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/video/backlight/aat2870_bl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/backlight/aat2870_bl.c b/drivers/video/backlight/aat2870_bl.c
index a7af9adafad6..1cbb303e9c88 100644
--- a/drivers/video/backlight/aat2870_bl.c
+++ b/drivers/video/backlight/aat2870_bl.c
@@ -59,7 +59,7 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	struct aat2870_bl_driver_data *aat2870_bl = bl_get_data(bd);
 	struct aat2870_data *aat2870 =
 			dev_get_drvdata(aat2870_bl->pdev->dev.parent);
-	int brightness = bd->props.brightness;
+	int brightness = backlight_get_brightness(bd);
 	int ret;
 
 	if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
@@ -70,11 +70,6 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
 	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
 		 bd->props.brightness, bd->props.power, bd->props.state);
 
-	if ((bd->props.power != FB_BLANK_UNBLANK) ||
-			(bd->props.state & BL_CORE_FBBLANK) ||
-			(bd->props.state & BL_CORE_SUSPENDED))
-		brightness = 0;
-
 	ret = aat2870->write(aat2870, AAT2870_BLM,
 			     (u8)aat2870_brightness(aat2870_bl, brightness));
 	if (ret < 0)
-- 
2.30.2

