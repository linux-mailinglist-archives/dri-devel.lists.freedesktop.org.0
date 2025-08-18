Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8043B2A029
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 13:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F1410E42F;
	Mon, 18 Aug 2025 11:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AsVLVy4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D1810E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 11:17:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AFD0D601ED;
 Mon, 18 Aug 2025 11:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC3DC4CEEB;
 Mon, 18 Aug 2025 11:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1755515829;
 bh=0WlSjThrIqH1ECsNqbXuiaU9TmstXt89kVGSxVPpRtM=;
 h=Subject:To:Cc:From:Date:From;
 b=AsVLVy4+mWGja1LOKgADu0NLywaehb4p+9Udg7Ft6YQy4C+pMMDv64GfTJYoFlW38
 gggECNl/aNPibCsqGlj0wwb0NwuN5AsgA4MFLLI8/gwUdpCg3zdXLkDp6gz1vUJLpJ
 WsFNm3gL2ECEt1r5VSmM0DdA0b5+QFZwwJjo3WIw=
Subject: Patch "fbdev: nvidiafb: add depends on HAS_IOPORT" has been added to
 the 6.16-stable tree
To: adaplas@gmail.com, arnd@kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, schnelle@linux.ibm.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 18 Aug 2025 13:16:05 +0200
Message-ID: <2025081805-junior-tightwad-5ecf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    fbdev: nvidiafb: add depends on HAS_IOPORT

to the 6.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbdev-nvidiafb-add-depends-on-has_ioport.patch
and it can be found in the queue-6.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ecdd7df997fd992f0ec70b788e3b12258008a2bf Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 15 Jun 2025 11:36:51 -0700
Subject: fbdev: nvidiafb: add depends on HAS_IOPORT
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Randy Dunlap <rdunlap@infradead.org>

commit ecdd7df997fd992f0ec70b788e3b12258008a2bf upstream.

The nvidiafb driver uses inb()/outb() without depending on HAS_IOPORT,
which leads to build errors since kernel v6.13-rc1:
commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
for HAS_IOPORT=n")

Add the HAS_IOPORT dependency to prevent the build errors.

(Found in ARCH=um allmodconfig builds)

drivers/video/fbdev/nvidia/nv_accel.c: In function ‘NVDmaWait’:
include/asm-generic/io.h:596:15: error: call to ‘_outb’ declared with attribute error: outb() requires CONFIG_HAS_IOPORT
  596 | #define _outb _outb

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -660,7 +660,7 @@ config FB_ATMEL
 
 config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
-	depends on FB && PCI
+	depends on FB && PCI && HAS_IOPORT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-6.16/fbdev-nvidiafb-add-depends-on-has_ioport.patch
queue-6.16/parisc-makefile-fix-a-typo-in-palo.conf.patch
queue-6.16/kconfig-gconf-fix-potential-memory-leak-in-renderer_.patch
queue-6.16/kconfig-nconf-ensure-null-termination-where-strncpy-.patch
