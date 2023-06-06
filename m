Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FE2723FD2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F0510E328;
	Tue,  6 Jun 2023 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C656A10E231
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 10:41:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9AB321997;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686048059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHaQ4p1ZZgK5068OJFPl0Y5AohEdwjG5YjLSQjOHpjc=;
 b=0SzAsIVKHqSNoBQ4l2Pp0gKPFxrUaKWG0W+6C6A/eC85JJdIcMalwTtYVY6LGonoeCTAgF
 fDzUDRQRUBD60Oq0UnK5aKhzHF2onIWVVFIa4QeXpFvS7ENiueOvW4xB95VkbJ2LwMpvzH
 CKXzTb9LXX3yXo/ndJotWuJfX6+noSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686048059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHaQ4p1ZZgK5068OJFPl0Y5AohEdwjG5YjLSQjOHpjc=;
 b=XOsR5SQ1tU1m2vIdjTc4QEjn+k/MUTns19BZXy5miwos7tXxDy+BOl3cn/FLocRLvpXagD
 muGxyUAEipSVnlDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8852013776;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OE14IDsNf2SHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 10:40:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	David.Laight@ACULAB.COM
Subject: [PATCH 2/3] fbdev/hitfb: Fix integer-to-pointer cast
Date: Tue,  6 Jun 2023 12:40:55 +0200
Message-Id: <20230606104056.29553-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606104056.29553-1-tzimmermann@suse.de>
References: <20230606104056.29553-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the type casting from unsigned long to char __iomem *. Resolves
the following warning:

../drivers/video/fbdev/hitfb.c:411:27: warning: incorrect type in assignment (different address spaces)
../drivers/video/fbdev/hitfb.c:411:27:    expected char [noderef] __iomem *screen_base
../drivers/video/fbdev/hitfb.c:411:27:    got void *

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hitfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index 551b00f761a7..1ee3aa3d3fc7 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -408,7 +408,7 @@ static int hitfb_probe(struct platform_device *dev)
 	info->flags = FBINFO_DEFAULT | FBINFO_HWACCEL_YPAN |
 		FBINFO_HWACCEL_FILLRECT | FBINFO_HWACCEL_COPYAREA;
 
-	info->screen_base = (void *)hitfb_fix.smem_start;
+	info->screen_base = (char __iomem *)(uintptr_t)hitfb_fix.smem_start;
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (unlikely(ret < 0))
-- 
2.40.1

