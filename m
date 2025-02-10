Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A062BA2EE33
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4C810E542;
	Mon, 10 Feb 2025 13:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QRrxgkgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096810E542
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:35:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2346FA41483;
 Mon, 10 Feb 2025 13:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5341C4CED1;
 Mon, 10 Feb 2025 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739194523;
 bh=I4j5W/pnsr09AuIq4++PkJ3F54KwWK1ZjO4ElKOyTac=;
 h=Subject:To:Cc:From:Date:From;
 b=QRrxgkgG5lx0xWLMTXmue3dlpe2jKigIxUAKPaJ30vz3ZFqdTqU+yIelds6lk3qov
 8igTxzX87SKRYLOkgzGmcCv8i6MMeE341Y9wXtKvzDlpHH5CRFWSV27ecD7BsNM3/D
 5U3zzhABTnalkLrirmpZ6d0ipQ2pSD9a7/BvuDkc=
Subject: Patch "m68k: vga: Fix I/O defines" has been added to the 6.13-stable
 tree
To: deller@gmx.de, dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
 gregkh@linuxfoundation.org, lkp@intel.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 10 Feb 2025 14:31:49 +0100
Message-ID: <2025021049-paprika-roman-040d@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
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

    m68k: vga: Fix I/O defines

to the 6.13-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     m68k-vga-fix-i-o-defines.patch
and it can be found in the queue-6.13 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 53036937a101b5faeaf98e7438555fa854a1a844 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 7 Jan 2025 10:58:56 +0100
Subject: m68k: vga: Fix I/O defines

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 53036937a101b5faeaf98e7438555fa854a1a844 upstream.

Including m68k's <asm/raw_io.h> in vga.h on nommu platforms results
in conflicting defines with io_no.h for various I/O macros from the
__raw_read and __raw_write families. An example error is

   In file included from arch/m68k/include/asm/vga.h:12,
                 from include/video/vga.h:22,
                 from include/linux/vgaarb.h:34,
		 from drivers/video/aperture.c:12:
>> arch/m68k/include/asm/raw_io.h:39: warning: "__raw_readb" redefined
      39 | #define __raw_readb in_8
	 |
   In file included from arch/m68k/include/asm/io.h:6,
		    from include/linux/io.h:13,
		    from include/linux/irq.h:20,
		    from include/asm-generic/hardirq.h:17,
		    from ./arch/m68k/include/generated/asm/hardirq.h:1,
		    from include/linux/hardirq.h:11,
		    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
		    from include/linux/ftrace.h:10,
		    from include/linux/kprobes.h:28,
		    from include/linux/kgdb.h:19,
		    from include/linux/fb.h:6,
		    from drivers/video/aperture.c:5:
   arch/m68k/include/asm/io_no.h:16: note: this is the location of the previous definition
      16 | #define __raw_readb(addr) \
	 |

Include <asm/io.h>, which avoids raw_io.h on nommu platforms.
Also change the defined values of some of the read/write symbols in
vga.h to __raw_read/__raw_write as the raw_in/raw_out symbols are not
generally available.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501071629.DNEswlm8-lkp@intel.com/
Fixes: 5c3f968712ce ("m68k/video: Create <asm/vga.h>")
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org # v3.5+
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/20250107095912.130530-1-tzimmermann@suse.de
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/m68k/include/asm/vga.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/arch/m68k/include/asm/vga.h
+++ b/arch/m68k/include/asm/vga.h
@@ -9,7 +9,7 @@
  */
 #ifndef CONFIG_PCI
 
-#include <asm/raw_io.h>
+#include <asm/io.h>
 #include <asm/kmap.h>
 
 /*
@@ -29,9 +29,9 @@
 #define inw_p(port)		0
 #define outb_p(port, val)	do { } while (0)
 #define outw(port, val)		do { } while (0)
-#define readb			raw_inb
-#define writeb			raw_outb
-#define writew			raw_outw
+#define readb			__raw_readb
+#define writeb			__raw_writeb
+#define writew			__raw_writew
 
 #endif /* CONFIG_PCI */
 #endif /* _ASM_M68K_VGA_H */


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.13/drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
queue-6.13/drm-client-handle-tiled-displays-better.patch
queue-6.13/drm-modeset-handle-tiled-displays-in-pan_display_atomic.patch
queue-6.13/drm-ast-astdp-fix-timeout-for-enabling-video-signal.patch
queue-6.13/m68k-vga-fix-i-o-defines.patch
