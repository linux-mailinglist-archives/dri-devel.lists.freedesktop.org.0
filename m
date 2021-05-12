Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE137BC52
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 14:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BCC6EB8A;
	Wed, 12 May 2021 12:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 12 May 2021 09:56:07 UTC
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070886EB4C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 09:56:07 +0000 (UTC)
Received: from iota-build.ysoft.local (unknown [10.1.5.151])
 by uho.ysoft.cz (Postfix) with ESMTP id 61FCCA02C2;
 Wed, 12 May 2021 11:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
 s=20160406-ysoft-com; t=1620812935;
 bh=2985J8QEH7ypkIWT9eXgR8S1j/LwdOsTbCDZrn2V8iY=;
 h=From:To:Cc:Subject:Date:From;
 b=R9RP4TAfFQKyc869XKMykTIB2y/DaUteIxfcu/WAqiD5OkWu+IWclRRZIHUNl7SDZ
 LipOKwxTcu1P6R7giYF9eLI03p4yzyt1h1hlwTZEdFxy44Eww1bI3rUTDrsg8bqDqJ
 94EdkamI3qf6053FEfpVbln1Tb4esF2gOaAMhWmo=
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH RESEND] video: ssd1307fb: Enable charge pump only on displays
 that actually have it
Date: Wed, 12 May 2021 11:48:50 +0200
Message-Id: <1620812930-30356-1-git-send-email-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 May 2021 12:12:25 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A note in the datasheet says:

 "Patterns other than those given in the Command Table are prohibited to
  enter the chip as a command; as unexpected results can occur."

So do not send the charge pump command to displays that do not support it.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
 drivers/video/fbdev/ssd1307fb.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 1b0b2a096afa..54903ea2e3ac 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -497,14 +497,16 @@ static int ssd1307fb_init_regs(struct ssd1307fb_par *par)
 		return ret;
 
 	/* Turn on the DC-DC Charge Pump */
-	ret = ssd1307fb_write_cmd(par->client, SSD1307FB_CHARGE_PUMP);
-	if (ret < 0)
-		return ret;
+	if (par->device_info->need_chargepump) {
+		ret = ssd1307fb_write_cmd(par->client, SSD1307FB_CHARGE_PUMP);
+		if (ret < 0)
+			return ret;
 
-	ret = ssd1307fb_write_cmd(par->client,
-		BIT(4) | (par->device_info->need_chargepump ? BIT(2) : 0));
-	if (ret < 0)
-		return ret;
+		ret = ssd1307fb_write_cmd(par->client,
+			BIT(4) | (par->device_info->need_chargepump ? BIT(2) : 0));
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Set lookup table */
 	if (par->lookup_table_set) {
-- 
2.1.4

