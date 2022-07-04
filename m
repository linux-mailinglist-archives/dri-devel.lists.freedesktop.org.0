Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFE565BCE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6311A10F68B;
	Mon,  4 Jul 2022 16:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4310E042
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 01:16:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6263761338;
 Mon,  4 Jul 2022 01:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E21C341C6;
 Mon,  4 Jul 2022 01:16:05 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH V3] drivers/firmware: Move sysfb_init() from device_initcall
 to subsys_initcall_sync
Date: Mon,  4 Jul 2022 09:17:04 +0800
Message-Id: <20220704011704.1418055-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
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
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Consider a configuration like this:
1, efifb (or simpledrm) is built-in;
2, a native display driver (such as radeon) is also built-in.

As Javier said, this is not a common configuration (the native display
driver is usually built as a module), but it can happen and cause some
trouble.

In this case, since efifb, radeon and sysfb are all in device_initcall()
level, the order in practise is like this:

efifb registered at first, but no "efi-framebuffer" device yet. radeon
registered later, and /dev/fb0 created. sysfb_init() comes at last, it
registers "efi-framebuffer" and then causes an error message "efifb: a
framebuffer is already registered". Make sysfb_init() to be subsys_
initcall_sync() can avoid this. And Javier Martinez Canillas is trying
to make a more general solution in commit 873eb3b11860 ("fbdev: Disable
sysfb device registration when removing conflicting FBs").

However, this patch still makes sense because it can make the screen
display as early as possible (We cannot move to subsys_initcall, since
sysfb_init() should be executed after PCI enumeration).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Update commit message.
V3: Update commit message again.

 drivers/firmware/sysfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 2bfbb05f7d89..aecf91517e54 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -80,4 +80,4 @@ static __init int sysfb_init(void)
 }
 
 /* must execute after PCI subsystem for EFI quirks */
-device_initcall(sysfb_init);
+subsys_initcall_sync(sysfb_init);
-- 
2.27.0

