Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D6A563F25
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 11:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2200B18BDB0;
	Sat,  2 Jul 2022 09:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4364518BDB0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 09:03:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13425B82D7B;
 Sat,  2 Jul 2022 09:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57486C34114;
 Sat,  2 Jul 2022 09:03:16 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH V2] drivers/firmware: Move sysfb_init() from device_initcall
 to subsys_initcall_sync
Date: Sat,  2 Jul 2022 17:04:16 +0800
Message-Id: <20220702090416.1217209-1-chenhuacai@loongson.cn>
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
to make a more general solution [1].

However, this patch still makes sense because it can make the screen
display as early as possible (We cannot move to subsys_initcall, since
sysfb_init() should be executed after PCI enumeration).

[1] https://lore.kernel.org/all/20220607182338.344270-1-javierm@redhat.com/

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
V2: Update commit messages.

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

