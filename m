Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85F7540F8C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDD710ECA6;
	Tue,  7 Jun 2022 19:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1924 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 19:10:16 UTC
Received: from 2.mo575.mail-out.ovh.net (2.mo575.mail-out.ovh.net
 [46.105.52.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AC610ECA6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:10:16 +0000 (UTC)
Received: from player797.ha.ovh.net (unknown [10.111.208.23])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 76D66244A5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:10:15 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id 6C1C5273DCAFE;
 Tue,  7 Jun 2022 19:10:06 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0044cfacc26-662a-4bfb-be9e-be6068cb65b5,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH 3/4] backlight: ipaq_micro: Use backlight helper
Date: Tue,  7 Jun 2022 21:09:24 +0200
Message-Id: <20220607190925.1134737-4-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607190925.1134737-1-steve@sk2.org>
References: <20220607190925.1134737-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11715832959796545158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehjeeh
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/backlight/ipaq_micro_bl.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
index 85b16cc82878..f595b8c8cbb2 100644
--- a/drivers/video/backlight/ipaq_micro_bl.c
+++ b/drivers/video/backlight/ipaq_micro_bl.c
@@ -16,17 +16,12 @@
 static int micro_bl_update_status(struct backlight_device *bd)
 {
 	struct ipaq_micro *micro = dev_get_drvdata(&bd->dev);
-	int intensity = bd->props.brightness;
+	int intensity = backlight_get_brightness(bd);
 	struct ipaq_micro_msg msg = {
 		.id = MSG_BACKLIGHT,
 		.tx_len = 3,
 	};
 
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-	if (bd->props.state & (BL_CORE_FBBLANK | BL_CORE_SUSPENDED))
-		intensity = 0;
-
 	/*
 	 * Message format:
 	 * Byte 0: backlight instance (usually 1)
-- 
2.30.2

