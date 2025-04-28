Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA309A9F4B6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 17:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4A510E5AB;
	Mon, 28 Apr 2025 15:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="d8C8pdi3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Mon, 28 Apr 2025 15:41:25 UTC
Received: from ksmg02.maxima.ru (ksmg02.mt-integration.ru [81.200.124.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5310E5AA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 15:41:25 +0000 (UTC)
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
 by ksmg02.maxima.ru (Postfix) with ESMTP id 2715B1E00F2;
 Mon, 28 Apr 2025 18:34:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru 2715B1E00F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
 s=sl; t=1745854498; bh=+n+eGEbFGzc/bT9tVeanhiC6miBZ/CHfMbZh2/TH8kc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=d8C8pdi3s5qCwAc/bOWSrFkZWGLJg1at6kZgMPwBaM+NxnxKTVQ544NQ/hqk6bPRE
 lURayV5G1OF74p9VsiEOTxcbXTWamNBEx9YcN/krc/mqBG/Y9++qXtlKQ56ImCszcu
 YNoHGA9+7PeErDPjM8RiMi8UmAZsD3IJxi53QfbXknnqPJ4GnI2o4e1Z2vveTh19T6
 mOwIJ+xKnHCGz66msha4iaKKf1g1Jy5ldFA9cD0xscUq/hC46ZVyPWyeqydpic/fnS
 ogIfh2ZPTeXNu/4ydVblCKWR/PxE1Pdb5iMGfPaF4OwCqPofm9jUyocpw8q/d5OWgJ
 WbbX/Lnc8/D6A==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (not verified))
 by ksmg02.maxima.ru (Postfix) with ESMTPS;
 Mon, 28 Apr 2025 18:34:58 +0300 (MSK)
Received: from deb16-01-masimov-t-build.mti-lab.com (172.25.20.25) by
 mmail-p-exch02.mt.ru (81.200.124.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 28 Apr 2025 18:34:56 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Simona Vetter <simona@ffwll.ch>
CC: Helge Deller <deller@gmx.de>, Murad Masimov <m.masimov@mt-integration.ru>, 
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>,
 <stable@vger.kernel.org>
Subject: [PATCH 1/2] fbdev: Fix do_register_framebuffer to prevent
 null-ptr-deref in fb_videomode_to_var
Date: Mon, 28 Apr 2025 18:34:06 +0300
Message-ID: <20250428153407.3743416-2-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250428153407.3743416-1-m.masimov@mt-integration.ru>
References: <20250428153407.3743416-1-m.masimov@mt-integration.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.20.25]
X-ClientProxiedBy: mmail-p-exch01.mt.ru (81.200.124.61) To
 mmail-p-exch02.mt.ru (81.200.124.62)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;
 spf=none smtp.mailfrom=mt-integration.ru; dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 56 0.3.56
 52db7f275cc9b6820389ba9ab2ac225370e1c244, {rep_avail},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 mt-integration.ru:7.1.1; 81.200.124.62:7.1.2; ksmg02.maxima.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s,
 ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 192977 [Apr 28 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310,
 bases: 2025/04/28 14:14:00 #27936619
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7
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

If fb_add_videomode() in do_register_framebuffer() fails to allocate
memory for fb_videomode, it will later lead to a null-ptr dereference in
fb_videomode_to_var(), as the fb_info is registered while not having the
mode in modelist that is expected to be there, i.e. the one that is
described in fb_info->var.

================================================================
general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 30371 Comm: syz-executor.1 Not tainted 5.10.226-syzkaller #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
RIP: 0010:fb_videomode_to_var+0x24/0x610 drivers/video/fbdev/core/modedb.c:901
Call Trace:
 display_to_var+0x3a/0x7c0 drivers/video/fbdev/core/fbcon.c:929
 fbcon_resize+0x3e2/0x8f0 drivers/video/fbdev/core/fbcon.c:2071
 resize_screen drivers/tty/vt/vt.c:1176 [inline]
 vc_do_resize+0x53a/0x1170 drivers/tty/vt/vt.c:1263
 fbcon_modechanged+0x3ac/0x6e0 drivers/video/fbdev/core/fbcon.c:2720
 fbcon_update_vcs+0x43/0x60 drivers/video/fbdev/core/fbcon.c:2776
 do_fb_ioctl+0x6d2/0x740 drivers/video/fbdev/core/fbmem.c:1128
 fb_ioctl+0xe7/0x150 drivers/video/fbdev/core/fbmem.c:1203
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x19a/0x210 fs/ioctl.c:739
 do_syscall_64+0x33/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x67/0xd1
================================================================

Even though fbcon_init() checks beforehand if fb_match_mode() in
var_to_display() fails, it can not prevent the panic because fbcon_init()
does not return error code. Considering this and the comment in the code
about fb_match_mode() returning NULL - "This should not happen" - it is
better to prevent registering the fb_info if its mode was not set
successfully. Also move fb_add_videomode() closer to the beginning of
do_register_framebuffer() to avoid having to do the cleanup on fail.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Murad Masimov <m.masimov@mt-integration.ru>
---
 drivers/video/fbdev/core/fbmem.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 3c568cff2913..e1557d80768f 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -388,7 +388,7 @@ static int fb_check_foreignness(struct fb_info *fi)

 static int do_register_framebuffer(struct fb_info *fb_info)
 {
-	int i;
+	int i, err = 0;
 	struct fb_videomode mode;

 	if (fb_check_foreignness(fb_info))
@@ -397,10 +397,18 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	if (num_registered_fb == FB_MAX)
 		return -ENXIO;

-	num_registered_fb++;
 	for (i = 0 ; i < FB_MAX; i++)
 		if (!registered_fb[i])
 			break;
+
+	if (!fb_info->modelist.prev || !fb_info->modelist.next)
+		INIT_LIST_HEAD(&fb_info->modelist);
+
+	fb_var_to_videomode(&mode, &fb_info->var);
+	err = fb_add_videomode(&mode, &fb_info->modelist);
+	if (err < 0)
+		return err;
+
 	fb_info->node = i;
 	refcount_set(&fb_info->count, 1);
 	mutex_init(&fb_info->lock);
@@ -426,16 +434,12 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 	if (bitmap_empty(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT))
 		bitmap_fill(fb_info->pixmap.blit_y, FB_MAX_BLIT_HEIGHT);

-	if (!fb_info->modelist.prev || !fb_info->modelist.next)
-		INIT_LIST_HEAD(&fb_info->modelist);
-
 	if (fb_info->skip_vt_switch)
 		pm_vt_switch_required(fb_info->device, false);
 	else
 		pm_vt_switch_required(fb_info->device, true);

-	fb_var_to_videomode(&mode, &fb_info->var);
-	fb_add_videomode(&mode, &fb_info->modelist);
+	num_registered_fb++;
 	registered_fb[i] = fb_info;

 #ifdef CONFIG_GUMSTIX_AM200EPD
--
2.39.2

