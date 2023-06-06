Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C862723FD1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FC210E231;
	Tue,  6 Jun 2023 10:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07AF10E227
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 10:41:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84FEE21995;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686048059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhJJbcCjd3StHqJY4ZuLu9T5nuWJxmVKfKSicKaY06E=;
 b=fhkdcuuNTFfkTsYxRC/trm0HiIGlI7N0tPU5JtPtkHEoE/C5tSPS40kMArl7JPEqOdWfcI
 V28vPj5JF6msqyDZsuloWa6bDE5wVX8x7aLuKOIpBcpEDQZDJsb07a/wFr5db3JOTU9fRN
 XvMB6zGKYKVRxPl8XKxBu2te/YBZ9So=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686048059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhJJbcCjd3StHqJY4ZuLu9T5nuWJxmVKfKSicKaY06E=;
 b=M/mH8AVJdfgbAVzmL8r3efISjouuT4PsG67RwapQGbLypQ2qS9lF2mTKs5YX8GFd4mIVDm
 8eQAsU5rkga3s3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6481413A47;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id COm/FzsNf2SHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 10:40:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	David.Laight@ACULAB.COM
Subject: [PATCH 1/3] fbdev/hitfb: Declare hitfb_blank() as static
Date: Tue,  6 Jun 2023 12:40:54 +0200
Message-Id: <20230606104056.29553-2-tzimmermann@suse.de>
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

Fixes the following warnings:

../drivers/video/fbdev/hitfb.c:186:5: warning: no previous prototype for 'hitfb_blank' [-Wmissing-prototypes]
  186 | int hitfb_blank(int blank_mode, struct fb_info *info)
      |     ^~~~~~~~~~~

../drivers/video/fbdev/hitfb.c:186:5: warning: symbol 'hitfb_blank' was not declared. Should it be static?

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hitfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/hitfb.c b/drivers/video/fbdev/hitfb.c
index fb82869283db..551b00f761a7 100644
--- a/drivers/video/fbdev/hitfb.c
+++ b/drivers/video/fbdev/hitfb.c
@@ -183,7 +183,7 @@ static int hitfb_pan_display(struct fb_var_screeninfo *var,
 	return 0;
 }
 
-int hitfb_blank(int blank_mode, struct fb_info *info)
+static int hitfb_blank(int blank_mode, struct fb_info *info)
 {
 	unsigned short v;
 
-- 
2.40.1

