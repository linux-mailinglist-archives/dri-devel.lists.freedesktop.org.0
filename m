Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F9FAB1DAF
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 22:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18ED10EAD6;
	Fri,  9 May 2025 20:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iy/5oKN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98DA10EAD6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 20:06:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CA9C5C6F62;
 Fri,  9 May 2025 20:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EB6C4CEE4;
 Fri,  9 May 2025 20:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746821211;
 bh=c4N2IUsmCh9moub2+ZGNMBv0CyfWrRcXPTvqAC6Ij/I=;
 h=From:To:Cc:Subject:Date:From;
 b=iy/5oKN4Rax6mwtekgtc7DQfTrvQ+wam5Jjx0PiEo57N2FQa4laN6F5Pf713nTxcz
 rJEKhMVmFHqunx+dD0tttYsmVTr3ljhtZkRRXt72Eyp6MN40bBWGnd7jPE51VFcuy0
 i7gZuoE0yo8pyIk39tDuTrZhCRcj6Eef1sSRKhrUiN8a5ZXpazJ7IgDWPySCEmQLHJ
 MPbITL1LhxUGGm/K+byLzshRh6tfymDBT3+MV8td9nOUqPPHF2aV8LZdCkhjTvjYoq
 T1y0I6GYGXjkCfNWD6FfzmSHmMSfr9Cf/S1pIjYJdyfeipJ60e9WNd90d6m0jzRCif
 kAwjMTPHPtD2g==
From: Kees Cook <kees@kernel.org>
To: Simona Vetter <simona@ffwll.ch>
Cc: Kees Cook <kees@kernel.org>,
 syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com,
 Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Shixiong Ou <oushixiong@kylinos.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qianqiang Liu <qianqiang.liu@163.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 linux-kernel@vger.kernel.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com,
 linux-hardening@vger.kernel.org
Subject: [PATCH] fbdev: fbcon: Make sure modelist not set on unregistered
 console
Date: Fri,  9 May 2025 13:06:47 -0700
Message-Id: <20250509200643.work.355-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305; i=kees@kernel.org;
 h=from:subject:message-id; bh=c4N2IUsmCh9moub2+ZGNMBv0CyfWrRcXPTvqAC6Ij/I=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBlyCWH//WaueRBfJHD5a+nhDd/L42/f/L542tUJ0+wrn
 q/LdFl3oKOUhUGMi0FWTJElyM49zsXjbXu4+1xFmDmsTCBDGLg4BWAiy3IY/vsXvG2+e+HLYqtZ
 s3c+nt0XKsTc77J8XhOHfXjeZU7Ody4M/2v/VTEwFcQLZcqcWP5U1fes1kHGJ0HbGN4e2f3j5/e
 p/rwA
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

It looks like attempting to write to the "store_modes" sysfs node will
run afoul of unregistered consoles:

UBSAN: array-index-out-of-bounds in drivers/video/fbdev/core/fbcon.c:122:28
index -1 is out of range for type 'fb_info *[32]'
...
 fbcon_info_from_console+0x192/0x1a0 drivers/video/fbdev/core/fbcon.c:122
 fbcon_new_modelist+0xbf/0x2d0 drivers/video/fbdev/core/fbcon.c:3048
 fb_new_modelist+0x328/0x440 drivers/video/fbdev/core/fbmem.c:673
 store_modes+0x1c9/0x3e0 drivers/video/fbdev/core/fbsysfs.c:113
 dev_attr_store+0x55/0x80 drivers/base/core.c:2439

static struct fb_info *fbcon_registered_fb[FB_MAX];
...
static signed char con2fb_map[MAX_NR_CONSOLES];
...
static struct fb_info *fbcon_info_from_console(int console)
...
        return fbcon_registered_fb[con2fb_map[console]];

If con2fb_map contains a -1 things go wrong here. Instead, return NULL,
as callers of fbcon_info_from_console() are trying to compare against
existing "info" pointers, so error handling should kick in correctly.

Reported-by: syzbot+a7d4444e7b6e743572f7@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/679d0a8f.050a0220.163cdc.000c.GAE@google.com/
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>
Cc: <linux-fbdev@vger.kernel.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/video/fbdev/core/fbcon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ac3c99ed92d1..2df48037688d 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -117,9 +117,14 @@ static signed char con2fb_map_boot[MAX_NR_CONSOLES];
 
 static struct fb_info *fbcon_info_from_console(int console)
 {
+	signed char fb;
 	WARN_CONSOLE_UNLOCKED();
 
-	return fbcon_registered_fb[con2fb_map[console]];
+	fb = con2fb_map[console];
+	if (fb < 0 || fb >= ARRAY_SIZE(fbcon_registered_fb))
+		return NULL;
+
+	return fbcon_registered_fb[fb];
 }
 
 static int logo_lines;
-- 
2.34.1

