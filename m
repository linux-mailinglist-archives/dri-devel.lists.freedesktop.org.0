Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33140660550
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F6610E888;
	Fri,  6 Jan 2023 17:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1044 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 17:07:27 UTC
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net
 [46.105.62.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D510E888
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:07:27 +0000 (UTC)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.20.16])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 1651325A5E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 16:50:01 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dkv5l (unknown [10.110.171.46])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 34F0B1FE9B;
 Fri,  6 Jan 2023 16:50:01 +0000 (UTC)
Received: from sk2.org ([37.59.142.107])
 by ghost-submission-6684bf9d7b-dkv5l with ESMTPSA
 id 4GNNCjlRuGOnAQEAwhnnFg
 (envelope-from <steve@sk2.org>); Fri, 06 Jan 2023 16:50:01 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00126819975-9ec8-4c29-9bdd-5acdba6470ab,
 9FE29456621203A27B372E1E0503D45BE0167874) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH RESEND 4/4] backlight: tosa: Use backlight helper
Date: Fri,  6 Jan 2023 17:48:55 +0100
Message-Id: <20230106164856.1453819-5-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5852709192662877915
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsthgvvhgvsehskhdvrdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
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
 drivers/video/backlight/tosa_bl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/tosa_bl.c
index 77b71f6c19b5..e338b1f00f6a 100644
--- a/drivers/video/backlight/tosa_bl.c
+++ b/drivers/video/backlight/tosa_bl.c
@@ -50,13 +50,8 @@ static void tosa_bl_set_backlight(struct tosa_bl_data *data, int brightness)
 
 static int tosa_bl_update_status(struct backlight_device *dev)
 {
-	struct backlight_properties *props = &dev->props;
 	struct tosa_bl_data *data = bl_get_data(dev);
-	int power = max(props->power, props->fb_blank);
-	int brightness = props->brightness;
-
-	if (power)
-		brightness = 0;
+	int brightness = backlight_get_brightness(dev);
 
 	tosa_bl_set_backlight(data, brightness);
 
-- 
2.30.2

