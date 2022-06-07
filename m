Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2C54106E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A520D10E0D2;
	Tue,  7 Jun 2022 19:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 909 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jun 2022 19:24:59 UTC
Received: from 20.mo581.mail-out.ovh.net (20.mo581.mail-out.ovh.net
 [46.105.49.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F30410E0D2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:24:59 +0000 (UTC)
Received: from player698.ha.ovh.net (unknown [10.110.103.226])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id ED05A243F8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:24:57 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id E709F2B480533;
 Tue,  7 Jun 2022 19:24:48 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004ebbb6147-dba4-4caf-9f19-68181d083c87,
 38FB55E0ED6224772C245AF554E1AE62085133ED) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Helge Deller <deller@gmx.de>, Paul Mackerras <paulus@samba.org>
Subject: [PATCH 7/7] fbdev: riva: Use backlight helper
Date: Tue,  7 Jun 2022 21:23:35 +0200
Message-Id: <20220607192335.1137249-8-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220607192335.1137249-1-steve@sk2.org>
References: <20220607192335.1137249-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11964093888347408105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddthedgudefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeeghffhleeigffhteeiffelveefhfeiudehkedtgefhgedvleffgfejgfdtveeigeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrheileekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehkedu
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
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/riva/fbdev.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 84d5e23ad7d3..534722b38053 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -292,13 +292,7 @@ static int riva_bl_update_status(struct backlight_device *bd)
 {
 	struct riva_par *par = bl_get_data(bd);
 	U032 tmp_pcrt, tmp_pmc;
-	int level;
-
-	if (bd->props.power != FB_BLANK_UNBLANK ||
-	    bd->props.fb_blank != FB_BLANK_UNBLANK)
-		level = 0;
-	else
-		level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	tmp_pmc = NV_RD32(par->riva.PMC, 0x10F0) & 0x0000FFFF;
 	tmp_pcrt = NV_RD32(par->riva.PCRTC0, 0x081C) & 0xFFFFFFFC;
-- 
2.30.2

