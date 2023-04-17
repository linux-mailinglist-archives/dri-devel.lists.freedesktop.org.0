Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3A6E485D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B567010E4B2;
	Mon, 17 Apr 2023 12:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B38510E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:57:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D662321A87;
 Mon, 17 Apr 2023 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681736221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFDYtj/p55wXFlixZTM7qmGD63jo20Zks5qJy+aO2N4=;
 b=hxXbx2by2ceKis2BkuZW6Jdr22dlEFNpbWbxJ3cG9+GIl7w4NfB4EAvHyW06cd3irF08BJ
 FxrfYnjd8kWBAlruZTb63L9GrwdStTdY5vYwaUHR9kotpryTA/rJcqcpyj2EVZPzyAKf6A
 nOOfSPOHQmhjMpiC+ipxqIoQ07C1Oi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681736221;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QFDYtj/p55wXFlixZTM7qmGD63jo20Zks5qJy+aO2N4=;
 b=+20MRO6FXDPHw0n9k6ddFTctDjj/7L8rUKzYIYwGV3WDsGkfpuIulEoiAVNdBdYgpZ9QcO
 9XQy249kuJ2g0pCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B5611390E;
 Mon, 17 Apr 2023 12:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MHn4HB1CPWToWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v3 08/19] arch/m68k: Implement <asm/fb.h> with generic helpers
Date: Mon, 17 Apr 2023 14:56:40 +0200
Message-Id: <20230417125651.25126-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the architecture's fb_is_primary_device() with the generic
one from <asm-generic/fb.h>. No functional changes.

v2:
	* provide empty fb_pgprotect() on non-MMU systems

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/fb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/fb.h b/arch/m68k/include/asm/fb.h
index 4f96989922af..24273fc7ad91 100644
--- a/arch/m68k/include/asm/fb.h
+++ b/arch/m68k/include/asm/fb.h
@@ -2,11 +2,11 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
 #include <asm/setup.h>
 
+struct file;
+
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
@@ -24,10 +24,8 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 #endif /* CONFIG_SUN3 */
 #endif /* CONFIG_MMU */
 }
+#define fb_pgprotect fb_pgprotect
 
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
-- 
2.40.0

