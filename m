Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F377762D9C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F09F10E59E;
	Thu, 17 Nov 2022 11:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5510E59E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 11:47:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7EF81F8CC;
 Thu, 17 Nov 2022 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668685651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Wzy7xEyhUdDlxC1bAmO3ib74A9kXG9xQXitEdnb4pc=;
 b=wu/SUa1v0E5OqGuYJTrTfVVIwuuzp7TIxEfN8zo7Lz7iiRiGouAVF6+h7lpHlRJ3iLCY4R
 uUsDcDX3z6a5jkV41ysJU46g084gugghCb3OS90cm1fwidBFsnkXrJ2SkaqM5vrynE9T4q
 +aJDL1JhvzUFFWa+bYkm5+rnejC2mFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668685651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/Wzy7xEyhUdDlxC1bAmO3ib74A9kXG9xQXitEdnb4pc=;
 b=pFnHcBOvrNgy7o1nH3X8zlTN/W1DPgblDDc/dpBNSM702t4IFjjrIXPR8emXzHvLdN0953
 TEovxXHdEjTS4KCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC31613B56;
 Thu, 17 Nov 2022 11:47:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TN0mKVMfdmPIRQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Nov 2022 11:47:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	sfr@canb.auug.org.au
Subject: [PATCH] fbdev: Make fb_modesetting_disabled() static inline
Date: Thu, 17 Nov 2022 12:47:29 +0100
Message-Id: <20221117114729.7570-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make fb_modesetting_disabled() a static-inline function when it is
defined in the header file. Avoid the linker error shown below.

 ld: drivers/video/fbdev/core/fbmon.o: in function `fb_modesetting_disabled':
 fbmon.c:(.text+0x1e4): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here

A bug report is at [1].

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 0ba2fa8cbd29 ("fbdev: Add support for the nomodeset kernel parameter")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/dri-devel/20221117183214.2473e745@canb.auug.org.au/T/#u # 1
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 3a822e4357b12..ea421724f7338 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -807,7 +807,7 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
 #if defined(CONFIG_VIDEO_NOMODESET)
 bool fb_modesetting_disabled(const char *drvname);
 #else
-bool fb_modesetting_disabled(const char *drvname)
+static inline bool fb_modesetting_disabled(const char *drvname)
 {
 	return false;
 }
-- 
2.38.1

