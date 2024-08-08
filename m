Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F8F94B9F1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 11:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5CB10E6A6;
	Thu,  8 Aug 2024 09:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YO2BeQ7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-72.smtpout.orange.fr [80.12.242.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C9910E6A6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 09:47:23 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id bzipsrAPUHEYLbzipszOrg; Thu, 08 Aug 2024 11:46:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1723110376;
 bh=ya2xzpSe2RMDa9pYPN22dbVPek6YtgZI0yveQDSkuLk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=YO2BeQ7magrcKLdEkaEIDMDjzQb6CwsJZhL914LoddIA57elZMI+ZfYrM0oVKdoqa
 DNhCfR07NPJzmTow59qUwKsj527OFI5lSPCBTQ46y7tF+owmHHy6tmJOxXzRGYVFSL
 qbErfS3RejWvEGVvpj95ee2Z774m+AUMG+6SE+5lXYysnTaVxDJcyuOY5zG92upOiV
 lif5FsnOE9eRikrbUzL1c1y4ucLgznOVItWkoipsh1mTyOBaqkhuMUfq5D/Ww7AOyd
 cbiQVbo0MHqtwUh1088ZuxgIQeQ0fYphoynjg4ZI1vbUlJ8Cd8k0xohkrT3mop2kL6
 NHIh24i0u2xrQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 08 Aug 2024 11:46:16 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Date: Thu,  8 Aug 2024 11:46:11 +0200
Message-ID: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use sysfs_emit_at() instead of snprintf() + custom logic.
Using sysfs_emit_at() is much more simple.

Also, sysfs_emit() is already used in this function, so using
sysfs_emit_at() is more consistent.

Also simplify the logic:
  - always add a space after an entry
  - change the last space into a '\n'

Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
can not be reached.
So better keep everything simple (and correct).

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 .../omap2/omapfb/displays/panel-sony-acx565akm.c  | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
index 71d2e015960c..fc975615d5c9 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c
@@ -466,19 +466,20 @@ static ssize_t show_cabc_available_modes(struct device *dev,
 		char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	int len;
+	int len = 0;
 	int i;
 
 	if (!ddata->has_cabc)
 		return sysfs_emit(buf, "%s\n", cabc_modes[0]);
 
-	for (i = 0, len = 0;
-	     len < PAGE_SIZE && i < ARRAY_SIZE(cabc_modes); i++)
-		len += snprintf(&buf[len], PAGE_SIZE - len, "%s%s%s",
-			i ? " " : "", cabc_modes[i],
-			i == ARRAY_SIZE(cabc_modes) - 1 ? "\n" : "");
+	for (i = 0; i < ARRAY_SIZE(cabc_modes); i++)
+		len += sysfs_emit_at(buf, len, "%s ", cabc_modes[i]);
+
+	/* Remove the trailing space */
+	if (len)
+		buf[len - 1] = '\n';
 
-	return len < PAGE_SIZE ? len : PAGE_SIZE - 1;
+	return len;
 }
 
 static DEVICE_ATTR(cabc_mode, S_IRUGO | S_IWUSR,
-- 
2.46.0

