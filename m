Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689AC6390B4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D7A10E0DD;
	Fri, 25 Nov 2022 20:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70C10E796
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 20:31:21 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
 by laurent.telenet-ops.be with bizsmtp
 id okXG2800G4su47u01kXGlC; Fri, 25 Nov 2022 21:31:18 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLv-001aQz-VB; Fri, 25 Nov 2022 21:31:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLv-003Kz7-CY; Fri, 25 Nov 2022 21:31:15 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 3/3] drm: atari: Add a DRM driver for Atari graphics
 hardware
Date: Fri, 25 Nov 2022 21:31:10 +0100
Message-Id: <9ef3ed30a45a367db0231ea2e98f6f37ba860b4c.1669406382.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669406380.git.geert@linux-m68k.org>
References: <cover.1669406380.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Supported formats:
  - C[1248],
  - RG16 (both standard DRM (little-endian) and native (big-endian)),
  - XR24.

RG16 and XR24 are only supported with the underlying RGB565 hardware
mode on Falcon, and are subject to hardware restrictions (limited to
e.g. "qvga" and "hvga" modes).

All formats use a shadow buffer (TODO: BE RG16 buffers from ST-RAM).
Initial mode setting works, later mode changes sometimes fail.

Developed and tested on ARAnyM.

Probably this should not be under /tiny ;-)

root@atari:~# modetest -M atari_drm
Encoders:
id	crtc	type	possible crtcs	possible clones
35	34	none	0x00000001	0x00000001

Connectors:
id	encoder	status		name		size (mm)	modes	encoders
31	35	connected	VGA-1          	0x0		9	35
  modes:
	index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
  #0 vga70 70.72 640 658 758 800 400 411 414 445 25176 flags: nhsync, pvsync, pcsync; type: preferred, driver
  #1 tt-mid 60.33 640 740 880 1000 480 496 526 534 32216 flags: nhsync, nvsync, ncsync; type: driver
  #2 vga 59.94 640 658 758 800 480 491 494 525 25176 flags: nhsync, nvsync, ncsync; type: driver
  #3 st-high 78.51 640 640 768 896 400 414 418 458 32216 flags: nhsync, nvsync, ncsync; type: driver
  #4 tt-low 88.72 320 420 560 680 480 496 526 534 32216 flags: nhsync, nvsync, ncsync; type: driver
  #5 hvga 59.94 320 329 379 400 480 491 494 525 12588 flags: nhsync, nvsync, ncsync; type: driver
  #6 st-mid 165.03 640 656 752 784 200 214 218 249 32216 flags: nhsync, nvsync, ncsync; type: driver
  #7 qvga 60.06 320 329 379 400 240 245 247 262 12588 flags: nhsync, nvsync, dblscan, ncsync; type: driver
  #8 st-low 278.84 320 336 432 464 200 214 218 249 32216 flags: nhsync, nvsync, ncsync; type: driver
  props:
	1 EDID:
		flags: immutable blob
		blobs:

		value:
	2 DPMS:
		flags: enum
		enums: On=0 Standby=1 Suspend=2 Off=3
		value: 0
	5 link-status:
		flags: enum
		enums: Good=0 Bad=1
		value: 0
	6 non-desktop:
		flags: immutable range
		values: 0 1
		value: 0
	4 TILE:
		flags: immutable blob
		blobs:

		value:

CRTCs:
id	fb	pos	size
34	36	(0,0)	(320x240)
  #0 qvga 60.06 320 329 379 400 240 245 247 262 12588 flags: nhsync, nvsync, dblscan, ncsync; type: driver
  props:
	24 VRR_ENABLED:
		flags: range
		values: 0 1
		value: 0
	28 GAMMA_LUT:
		flags: blob
		blobs:

		value:
			000000000000000000000000aaaa0000
			0000aaaa000000000000aaaaaaaa0000
			aaaa000000000000aaaa0000aaaa0000
			aaaa555500000000aaaaaaaaaaaa0000
			555555555555000055555555ffff0000
			5555ffff555500005555ffffffff0000
			ffff555555550000ffff5555ffff0000
			ffffffff55550000ffffffffffff0000
			10001000100000001100110011000000
			12001200120000001300130013000000
			14001400140000001500150015000000
			16001600160000001700170017000000
			18001800180000001900190019000000
			1a001a001a0000001b001b001b000000
			1c001c001c0000001d001d001d000000
			1e001e001e0000001f001f001f000000
			20002000200000002100210021000000
			22002200220000002300230023000000
			24002400240000002500250025000000
			26002600260000002700270027000000
			28002800280000002900290029000000
			2a002a002a0000002b002b002b000000
			2c002c002c0000002d002d002d000000
			2e002e002e0000002f002f002f000000
			30003000300000003100310031000000
			32003200320000003300330033000000
			34003400340000003500350035000000
			36003600360000003700370037000000
			38003800380000003900390039000000
			3a003a003a0000003b003b003b000000
			3c003c003c0000003d003d003d000000
			3e003e003e0000003f003f003f000000
			40004000400000004100410041000000
			42004200420000004300430043000000
			44004400440000004500450045000000
			46004600460000004700470047000000
			48004800480000004900490049000000
			4a004a004a0000004b004b004b000000
			4c004c004c0000004d004d004d000000
			4e004e004e0000004f004f004f000000
			50005000500000005100510051000000
			52005200520000005300530053000000
			54005400540000005500550055000000
			56005600560000005700570057000000
			58005800580000005900590059000000
			5a005a005a0000005b005b005b000000
			5c005c005c0000005d005d005d000000
			5e005e005e0000005f005f005f000000
			60006000600000006100610061000000
			62006200620000006300630063000000
			64006400640000006500650065000000
			66006600660000006700670067000000
			68006800680000006900690069000000
			6a006a006a0000006b006b006b000000
			6c006c006c0000006d006d006d000000
			6e006e006e0000006f006f006f000000
			70007000700000007100710071000000
			72007200720000007300730073000000
			74007400740000007500750075000000
			76007600760000007700770077000000
			78007800780000007900790079000000
			7a007a007a0000007b007b007b000000
			7c007c007c0000007d007d007d000000
			7e007e007e0000007f007f007f000000
			80008000800000008100810081000000
			82008200820000008300830083000000
			84008400840000008500850085000000
			86008600860000008700870087000000
			88008800880000008900890089000000
			8a008a008a0000008b008b008b000000
			8c008c008c0000008d008d008d000000
			8e008e008e0000008f008f008f000000
			90009000900000009100910091000000
			92009200920000009300930093000000
			94009400940000009500950095000000
			96009600960000009700970097000000
			98009800980000009900990099000000
			9a009a009a0000009b009b009b000000
			9c009c009c0000009d009d009d000000
			9e009e009e0000009f009f009f000000
			a000a000a0000000a100a100a1000000
			a200a200a2000000a300a300a3000000
			a400a400a4000000a500a500a5000000
			a600a600a6000000a700a700a7000000
			a800a800a8000000a900a900a9000000
			aa00aa00aa000000ab00ab00ab000000
			ac00ac00ac000000ad00ad00ad000000
			ae00ae00ae000000af00af00af000000
			b000b000b0000000b100b100b1000000
			b200b200b2000000b300b300b3000000
			b400b400b4000000b500b500b5000000
			b600b600b6000000b700b700b7000000
			b800b800b8000000b900b900b9000000
			ba00ba00ba000000bb00bb00bb000000
			bc00bc00bc000000bd00bd00bd000000
			be00be00be000000bf00bf00bf000000
			c000c000c0000000c100c100c1000000
			c200c200c2000000c300c300c3000000
			c400c400c4000000c500c500c5000000
			c600c600c6000000c700c700c7000000
			c800c800c8000000c900c900c9000000
			ca00ca00ca000000cb00cb00cb000000
			cc00cc00cc000000cd00cd00cd000000
			ce00ce00ce000000cf00cf00cf000000
			d000d000d0000000d100d100d1000000
			d200d200d2000000d300d300d3000000
			d400d400d4000000d500d500d5000000
			d600d600d6000000d700d700d7000000
			d800d800d8000000d900d900d9000000
			da00da00da000000db00db00db000000
			dc00dc00dc000000dd00dd00dd000000
			de00de00de000000df00df00df000000
			e000e000e0000000e100e100e1000000
			e200e200e2000000e300e300e3000000
			e400e400e4000000e500e500e5000000
			e600e600e6000000e700e700e7000000
			e800e800e8000000e900e900e9000000
			ea00ea00ea000000eb00eb00eb000000
			ec00ec00ec000000ed00ed00ed000000
			ee00ee00ee000000ef00ef00ef000000
			f000f000f0000000f100f100f1000000
			f200f200f2000000f300f300f3000000
			f400f400f4000000f500f500f5000000
			f600f600f6000000f700f700f7000000
			f800f800f8000000f900f900f9000000
			fa00fa00fa000000fb00fb00fb000000
			fc00fc00fc000000fd00fd00fd000000
			fe00fe00fe000000ff00ff00ff000000
	29 GAMMA_LUT_SIZE:
		flags: immutable range
		values: 0 4294967295
		value: 256

Planes:
id	crtc	fb	CRTC x,y	x,y	gamma size	possible crtcs
32	34	36	0,0		0,0	0       	0x00000001
  formats: C1   C2   C4   C8   RG16 RG16be XR24
  props:
	8 type:
		flags: immutable enum
		enums: Overlay=0 Primary=1 Cursor=2
		value: 1
	30 IN_FORMATS:
		flags: immutable blob
		blobs:

		value:
			00000001000000000000000700000018
			00000001000000382020314320203243
			202034432020384336314752b6314752
			3432525800000000000000000000007f
			00000000000000000000000000000000
		in_formats blob decoded:
			 C1  :  LINEAR
			 C2  :  LINEAR
			 C4  :  LINEAR
			 C8  :  LINEAR
			 RG16:  LINEAR
			 RG16be:  LINEAR
			 XR24:  LINEAR

Frame buffers:
id	size	pitch

root@atari:~#

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/gpu/drm/tiny/Kconfig                  |    8 +
 drivers/gpu/drm/tiny/Makefile                 |    1 +
 .../atafb.c => gpu/drm/tiny/atari_drm.c}      | 2536 +++++++++++++----
 3 files changed, 2017 insertions(+), 528 deletions(-)
 copy drivers/{video/fbdev/atafb.c => gpu/drm/tiny/atari_drm.c} (57%)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc18217..177ccf40f05a2b99 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -10,6 +10,14 @@ config DRM_ARCPGU
 
 	  If M is selected the module will be called arcpgu.
 
+config DRM_ATARI
+	tristate "DRM support for Atari native chipset"
+	depends on DRM && ATARI
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	help
+	 This is a KMS driver for the builtin graphics chipset found in Ataris.
+
 config DRM_BOCHS
 	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
 	depends on DRM && PCI && MMU
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 76dde89a044b7ddd..1f54bdfee1623083 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
+obj-$(CONFIG_DRM_ATARI)			+= atari_drm.o
 obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
diff --git a/drivers/video/fbdev/atafb.c b/drivers/gpu/drm/tiny/atari_drm.c
similarity index 57%
copy from drivers/video/fbdev/atafb.c
copy to drivers/gpu/drm/tiny/atari_drm.c
index 2bc4089865e60ac2..d26e0fddd3bea1be 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/gpu/drm/tiny/atari_drm.c
@@ -1,81 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * linux/drivers/video/atafb.c -- Atari builtin chipset frame buffer device
- *
- *  Copyright (C) 1994 Martin Schaller & Roman Hodek
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive
- * for more details.
- *
- * History:
- *   - 03 Jan 95: Original version by Martin Schaller: The TT driver and
- *                all the device independent stuff
- *   - 09 Jan 95: Roman: I've added the hardware abstraction (hw_switch)
- *                and wrote the Falcon, ST(E), and External drivers
- *                based on the original TT driver.
- *   - 07 May 95: Martin: Added colormap operations for the external driver
- *   - 21 May 95: Martin: Added support for overscan
- *		  Andreas: some bug fixes for this
- *   -    Jul 95: Guenther Kelleter <guenther@pool.informatik.rwth-aachen.de>:
- *                Programmable Falcon video modes
- *                (thanks to Christian Cartus for documentation
- *                of VIDEL registers).
- *   - 27 Dec 95: Guenther: Implemented user definable video modes "user[0-7]"
- *                on minor 24...31. "user0" may be set on commandline by
- *                "R<x>;<y>;<depth>". (Makes sense only on Falcon)
- *                Video mode switch on Falcon now done at next VBL interrupt
- *                to avoid the annoying right shift of the screen.
- *   - 23 Sep 97: Juergen: added xres_virtual for cards like ProMST
- *                The external-part is legacy, therefore hardware-specific
- *                functions like panning/hardwarescrolling/blanking isn't
- *				  supported.
- *   - 29 Sep 97: Juergen: added Romans suggestion for pan_display
- *				  (var->xoffset was changed even if no set_screen_base avail.)
- *	 - 05 Oct 97: Juergen: extfb (PACKED_PIXEL) is FB_PSEUDOCOLOR 'cause
- *				  we know how to set the colors
- *				  ext_*palette: read from ext_colors (former MV300_colors)
- *							    write to ext_colors and RAMDAC
- *
- * To do:
- *   - For the Falcon it is not possible to set random video modes on
- *     SM124 and SC/TV, only the bootup resolution is supported.
+ * Copyright 2020-2022 Glider bv
  *
+ * Based on drivers/video/atafb.c
+ * Copyright (C) 1994 Martin Schaller & Roman Hodek
  */
 
-#define ATAFB_TT
-#define ATAFB_STE
-#define ATAFB_EXT
-#define ATAFB_FALCON
-
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
+#include <linux/console.h>
 #include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
-
-#include <asm/setup.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
-#include <asm/irq.h>
-#include <asm/io.h>
 
 #include <asm/atarihw.h>
 #include <asm/atariints.h>
-#include <asm/atari_stram.h>
-
-#include <linux/fb.h>
 #include <asm/atarikb.h>
+#include <asm/atari_stram.h>
+#include <asm/io.h>
+#include <asm/irq.h>
+#include <asm/setup.h>
+#include <asm/unaligned.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_file.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "../../../video/fbdev/c2p.h"
+#include "../../../video/fbdev/c2p_core.h"
 
-#include "c2p.h"
-#include "atafb.h"
+#define ATAFB_TT
+#define ATAFB_STE
+#define ATAFB_EXT
+#define ATAFB_FALCON
 
 #define SWITCH_ACIA 0x01		/* modes for switch on OverScan */
 #define SWITCH_SND6 0x40
 #define SWITCH_SND7 0x80
 #define SWITCH_NONE 0x00
 
+#define DRIVER_NAME "atari_drm"
+
+// FIXME Without rounding						With rounding
+// FIXME 12588 kHz => 79440 ps						12588 kHz => 79441 ps
+// FIXME falcon_encode_var changed pixclock from 79440 to 79442		... from 79441 to 79442
+// FIXME 79442 ps => 12587 kHz						79442 ps => 12588 kHz
+// FIXME 12587 kHz => 79447 ps => FAIL
+#undef PICOS2KHZ
+#undef KHZ2PICOS
+#define PICOS2KHZ(a) DIV_ROUND_CLOSEST(1000000000UL, (a))
+#define KHZ2PICOS(a) DIV_ROUND_CLOSEST(1000000000UL, (a))
 
 static int default_par;		/* default resolution (0=none) */
 
@@ -123,7 +121,6 @@ static struct atafb_par {
 			short mono;
 			short ste_mode;
 			short bpp;
-			u32 pseudo_palette[16];
 		} falcon;
 #endif
 		/* Nothing needed for external mode */
@@ -236,64 +233,24 @@ static int *MV300_reg = MV300_reg_8bit;
 #endif /* ATAFB_EXT */
 
 
-/*
- * struct fb_ops {
- *	* open/release and usage marking
- *	struct module *owner;
- *	int (*fb_open)(struct fb_info *info, int user);
- *	int (*fb_release)(struct fb_info *info, int user);
- *
- *	* For framebuffers with strange non linear layouts or that do not
- *	* work with normal memory mapped access
- *	ssize_t (*fb_read)(struct file *file, char __user *buf, size_t count, loff_t *ppos);
- *	ssize_t (*fb_write)(struct file *file, const char __user *buf, size_t count, loff_t *ppos);
- *
- *	* checks var and eventually tweaks it to something supported,
- *	* DOES NOT MODIFY PAR *
- *	int (*fb_check_var)(struct fb_var_screeninfo *var, struct fb_info *info);
- *
- *	* set the video mode according to info->var *
- *	int (*fb_set_par)(struct fb_info *info);
- *
- *	* set color register *
- *	int (*fb_setcolreg)(unsigned int regno, unsigned int red, unsigned int green,
- *			    unsigned int blue, unsigned int transp, struct fb_info *info);
- *
- *	* set color registers in batch *
- *	int (*fb_setcmap)(struct fb_cmap *cmap, struct fb_info *info);
- *
- *	* blank display *
- *	int (*fb_blank)(int blank, struct fb_info *info);
- *
- *	* pan display *
- *	int (*fb_pan_display)(struct fb_var_screeninfo *var, struct fb_info *info);
- *
- *	*** The meat of the drawing engine ***
- *	* Draws a rectangle *
- *	void (*fb_fillrect) (struct fb_info *info, const struct fb_fillrect *rect);
- *	* Copy data from area to another *
- *	void (*fb_copyarea) (struct fb_info *info, const struct fb_copyarea *region);
- *	* Draws a image to the display *
- *	void (*fb_imageblit) (struct fb_info *info, const struct fb_image *image);
- *
- *	* Draws cursor *
- *	int (*fb_cursor) (struct fb_info *info, struct fb_cursor *cursor);
- *
- *	* wait for blit idle, optional *
- *	int (*fb_sync)(struct fb_info *info);
- *
- *	* perform fb specific ioctl (optional) *
- *	int (*fb_ioctl)(struct fb_info *info, unsigned int cmd,
- *			unsigned long arg);
- *
- *	* Handle 32bit compat ioctl (optional) *
- *	int (*fb_compat_ioctl)(struct fb_info *info, unsigned int cmd,
- *			unsigned long arg);
- *
- *	* perform fb specific mmap *
- *	int (*fb_mmap)(struct fb_info *info, struct vm_area_struct *vma);
- * } ;
- */
+struct atari_drm_device {
+	struct drm_device dev;
+	struct drm_simple_display_pipe pipe;
+	struct drm_connector conn;
+	unsigned int bpp;
+	unsigned int pitch;
+	unsigned int defmode;
+	// FIXME global fields
+	unsigned int next_bpp;
+};
+
+// FIXME pass atari_drm to all functions that use atari_drm_from_dev()?
+#define atari_drm_from_dev(_dev)	\
+	container_of(_dev, struct atari_drm_device, dev)
+#define atari_drm_from_pipe(_pipe)	\
+	container_of(_pipe, struct atari_drm_device, pipe)
+#define atari_drm_from_conn(_conn)	\
+	container_of(_conn, struct atari_drm_device, conn)
 
 
 /* ++roman: This structure abstracts from the underlying hardware (ST(e),
@@ -311,6 +268,9 @@ static int *MV300_reg = MV300_reg_8bit;
  *   values in the 'par' structure.
  * !!! Obsolete, perhaps !!!
  *
+ * int (*config_init)(struct atari_drm_device *atari_drm)
+ *   FIXME
+
  * int (*decode_var)(struct fb_var_screeninfo *var,
  *                   struct atafb_par *par)
  *   Get the video params out of 'var'. If a value doesn't fit, round
@@ -348,6 +308,7 @@ static struct fb_hwswitch {
 	int (*detect)(void);
 	int (*encode_fix)(struct fb_fix_screeninfo *fix,
 			  struct atafb_par *par);
+	int (*config_init)(struct atari_drm_device *atari_drm);
 	int (*decode_var)(struct fb_var_screeninfo *var,
 			  struct atafb_par *par);
 	int (*encode_var)(struct fb_var_screeninfo *var,
@@ -355,6 +316,8 @@ static struct fb_hwswitch {
 	void (*get_par)(struct atafb_par *par);
 	void (*set_par)(struct atafb_par *par);
 	void (*set_screen_base)(void *s_base);
+	void (*set_col_reg)(unsigned int regno, unsigned int red,
+			    unsigned int green, unsigned int blue);
 	int (*blank)(int blank_mode);
 	int (*pan_display)(struct fb_var_screeninfo *var,
 			   struct fb_info *info);
@@ -451,70 +414,35 @@ static struct fb_var_screeninfo atafb_predefined[] = {
 
 static int num_atafb_predefined = ARRAY_SIZE(atafb_predefined);
 
-static struct fb_videomode atafb_modedb[] __initdata = {
-	/*
-	 *  Atari Video Modes
-	 *
-	 *  If you change these, make sure to update DEFMODE_* as well!
-	 */
-
-	/*
-	 *  ST/TT Video Modes
-	 */
-
-	{
-		/* 320x200, 15 kHz, 60 Hz (ST low) */
-		"st-low", 60, 320, 200, 32000, 32, 16, 31, 14, 96, 4,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 640x200, 15 kHz, 60 Hz (ST medium) */
-		"st-mid", 60, 640, 200, 32000, 32, 16, 31, 14, 96, 4,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 640x400, 30.25 kHz, 63.5 Hz (ST high) */
-		"st-high", 63, 640, 400, 32000, 128, 0, 40, 14, 128, 4,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 320x480, 15 kHz, 60 Hz (TT low) */
-		"tt-low", 60, 320, 480, 31041, 120, 100, 8, 16, 140, 30,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 640x480, 29 kHz, 57 Hz (TT medium) */
-		"tt-mid", 60, 640, 480, 31041, 120, 100, 8, 16, 140, 30,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 1280x960, 72 kHz, 72 Hz (TT high) */
-		"tt-high", 72, 1280, 960, 7760, 260, 60, 36, 4, 192, 4,
-		0, FB_VMODE_NONINTERLACED
-	},
-
-	/*
-	 *  VGA Video Modes
-	 */
-
-	{
-		/* 640x480, 31 kHz, 60 Hz (VGA) */
-		"vga", 60, 640, 480, 39721, 42, 18, 31, 11, 100, 3,
-		0, FB_VMODE_NONINTERLACED
-	}, {
-		/* 640x400, 31 kHz, 70 Hz (VGA) */
-		"vga70", 70, 640, 400, 39721, 42, 18, 31, 11, 100, 3,
-		FB_SYNC_VERT_HIGH_ACT | FB_SYNC_COMP_HIGH_ACT, FB_VMODE_NONINTERLACED
-	},
-
-	/*
-	 *  Falcon HiRes Video Modes
-	 */
-
-	{
-		/* 896x608, 31 kHz, 60 Hz (Falcon High) */
-		"falh", 60, 896, 608, 32000, 18, 42, 31, 1, 96,3,
-		0, FB_VMODE_NONINTERLACED
-	},
+// FIXME 32.215905 MHz NTSC
+// FIXME 32.084988 MHz PAL
+static const struct drm_display_mode atari_drm_modes[] = {
+	{ DRM_MODE("st-low", DRM_MODE_TYPE_DRIVER, 32216, 320, 336, 432, 464, 0, 200, 214, 218, 249, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("st-mid", DRM_MODE_TYPE_DRIVER, 32216, 640, 656, 752, 784, 0, 200, 214, 218, 249, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("st-high", DRM_MODE_TYPE_DRIVER, 32216, 640, 640, 768, 896, 0, 400, 414, 418, 458, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("tt-low", DRM_MODE_TYPE_DRIVER, 32216, 320, 420, 560, 680, 0, 480, 496, 526, 534, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("tt-mid", DRM_MODE_TYPE_DRIVER, 32216, 640, 740, 880, 1000, 0, 480, 496, 526, 534, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	// Not using tt-high mode: VIRTUAL_X
+	{ DRM_MODE("tt-high", DRM_MODE_TYPE_DRIVER, 128864, 1280, 1340, 1532, 1792, 0, 960, 964, 968, 1004, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("vga", DRM_MODE_TYPE_DRIVER, 25176, 640, 658, 758, 800, 0, 480, 491, 494, 525, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("vga70", DRM_MODE_TYPE_DRIVER, 25176, 640, 658, 758, 800, 0, 400, 411, 414, 445, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PCSYNC) },
+        { DRM_MODE("qvga", DRM_MODE_TYPE_DRIVER, 12588, 320, 329, 379, 400, 0, 240, 245, 247, 262, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_DBLSCAN | DRM_MODE_FLAG_NCSYNC) },
+	{ DRM_MODE("hvga", DRM_MODE_TYPE_DRIVER, 12588, 320, 329, 379, 400, 0, 480, 491, 494, 525, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
+	// Not using falh mode: VIRTUAL_X
+	{ DRM_MODE("falh", DRM_MODE_TYPE_DRIVER, 31250, 896, 938, 1034, 1052, 0, 608, 609, 612, 643, 0,
+		 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NCSYNC) },
 };
 
-#define NUM_TOTAL_MODES  ARRAY_SIZE(atafb_modedb)
-
 static char *mode_option __initdata = NULL;
 
  /* default modes */
@@ -546,7 +474,6 @@ static int get_video_mode(char *vname)
 }
 
 
-
 /* ------------------- TT specific functions ---------------------- */
 
 #ifdef ATAFB_TT
@@ -576,6 +503,26 @@ static int tt_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 	return 0;
 }
 
+static int tt_config_init(struct atari_drm_device *atari_drm)
+{
+	struct drm_device *dev = &atari_drm->dev;
+
+	if (mono_moni) {
+		dev->mode_config.min_width = 0;
+		dev->mode_config.min_height = 0;
+		dev->mode_config.max_width = sttt_xres * 2;
+		dev->mode_config.max_height = tt_yres * 2;
+		dev->mode_config.preferred_depth = 1;
+	} else {
+		dev->mode_config.min_width = 0;
+		dev->mode_config.min_height = 0;
+		dev->mode_config.max_width = sttt_xres;
+		dev->mode_config.max_height = tt_yres;
+		dev->mode_config.preferred_depth = 4;
+	}
+	return 0;
+}
+
 static int tt_decode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 {
 	int xres = var->xres;
@@ -766,20 +713,18 @@ static void tt_set_par(struct atafb_par *par)
 		fbhw->set_screen_base(par->screen_base);
 }
 
-static int tt_setcolreg(unsigned int regno, unsigned int red,
-			unsigned int green, unsigned int blue,
-			unsigned int transp, struct fb_info *info)
+static void tt_set_col_reg(unsigned int regno, unsigned int red,
+			   unsigned int green, unsigned int blue)
 {
 	if ((shifter_tt.tt_shiftmode & TT_SHIFTER_MODEMASK) == TT_SHIFTER_STHIGH)
 		regno += 254;
 	if (regno > 255)
-		return 1;
+		return;
 	tt_palette[regno] = (((red >> 12) << 8) | ((green >> 12) << 4) |
 			     (blue >> 12));
 	if ((shifter_tt.tt_shiftmode & TT_SHIFTER_MODEMASK) ==
 	    TT_SHIFTER_STHIGH && regno == 254)
 		tt_palette[0] = 0;
-	return 0;
 }
 
 static int tt_detect(void)
@@ -877,6 +822,18 @@ static int falcon_encode_fix(struct fb_fix_screeninfo *fix,
 	return 0;
 }
 
+static int falcon_config_init(struct atari_drm_device *atari_drm)
+{
+	struct drm_device *dev = &atari_drm->dev;
+
+	dev->mode_config.min_width = 320;
+	dev->mode_config.min_height = 200;
+	dev->mode_config.max_width = 640;	// FIXME 896;
+	dev->mode_config.max_height = 480;	// FIXME 608;
+	dev->mode_config.preferred_depth = 4;
+	return 0;
+}
+
 static int falcon_decode_var(struct fb_var_screeninfo *var,
 			     struct atafb_par *par)
 {
@@ -1253,6 +1210,9 @@ static int falcon_decode_var(struct fb_var_screeninfo *var,
 		goto again;
 	}
 	if (hfreq > fb_info.monspecs.hfmax || hfreq < fb_info.monspecs.hfmin)
+// FIXME atari_drm_pipe_mode_fixup: "hvga": 63 12588 320 341 391 400 480 496 498 503 0x40 0x10a
+// FIXME falcon_decode_var:1316: hfreq 20000 out-of-range
+// FIXME 320x480 virt 320x1945 off 0,0 bpp 4 gray 0 red 0/4/0 green 0/4/0 blue 0/4/0 transp 0/0/0 nonstd 0 act 0 0x0mm accel_flags 0x0 pixclock 79447 margins 9/21/5/16 sync 50/2/0 vmode 0 rotate 0 colorspace 0x0
 		return -EINVAL;
 
 	/* Vxx-registers */
@@ -1571,9 +1531,12 @@ static void falcon_set_par(struct atafb_par *par)
 	f_change_mode = 1;
 }
 
-static irqreturn_t falcon_vbl_switcher(int irq, void *dummy)
+static int f_vblank_enabled;	// FIXME
+
+static irqreturn_t falcon_vbl_switcher(int irq, void *dev)
 {
 	struct falcon_hw *hw = &f_new_mode;
+	struct drm_crtc *crtc = dev;
 
 	if (f_change_mode) {
 		f_change_mode = 0;
@@ -1626,6 +1589,14 @@ static irqreturn_t falcon_vbl_switcher(int irq, void *dummy)
 		videl.xoffset = current_par.hw.falcon.xoffset;
 		shifter_f030.off_next = current_par.hw.falcon.line_offset;
 	}
+
+	if (f_vblank_enabled)
+		drm_crtc_handle_vblank(crtc);
+	if (crtc->state && crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -1661,12 +1632,12 @@ static int falcon_pan_display(struct fb_var_screeninfo *var,
 	return 0;
 }
 
-static int falcon_setcolreg(unsigned int regno, unsigned int red,
-			    unsigned int green, unsigned int blue,
-			    unsigned int transp, struct fb_info *info)
+static void falcon_set_col_reg(unsigned int regno, unsigned int red,
+			       unsigned int green, unsigned int blue)
 {
 	if (regno > 255)
-		return 1;
+		return;
+
 	f030_col[regno] = (((red & 0xfc00) << 16) |
 			   ((green & 0xfc00) << 8) |
 			   ((blue & 0xfc00) >> 8));
@@ -1675,11 +1646,7 @@ static int falcon_setcolreg(unsigned int regno, unsigned int red,
 			((((red & 0xe000) >> 13)   | ((red & 0x1000) >> 12)) << 8)   |
 			((((green & 0xe000) >> 13) | ((green & 0x1000) >> 12)) << 4) |
 			   ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
-		((u32 *)info->pseudo_palette)[regno] = ((red & 0xf800) |
-						       ((green & 0xfc00) >> 5) |
-						       ((blue & 0xf800) >> 11));
 	}
-	return 0;
 }
 
 static int falcon_blank(int blank_mode)
@@ -1795,6 +1762,18 @@ static int stste_encode_fix(struct fb_fix_screeninfo *fix,
 	return 0;
 }
 
+static int stste_config_init(struct atari_drm_device *atari_drm)
+{
+	struct drm_device *dev = &atari_drm->dev;
+
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.max_width = sttt_xres;
+	dev->mode_config.max_height = st_yres;
+	dev->mode_config.preferred_depth = mono_moni ? 1 : 4;
+	return 0;
+}
+
 static int stste_decode_var(struct fb_var_screeninfo *var,
 			    struct atafb_par *par)
 {
@@ -1949,12 +1928,11 @@ static void stste_set_par(struct atafb_par *par)
 		fbhw->set_screen_base(par->screen_base);
 }
 
-static int stste_setcolreg(unsigned int regno, unsigned int red,
-			   unsigned int green, unsigned int blue,
-			   unsigned int transp, struct fb_info *info)
+static void stste_set_col_reg(unsigned int regno, unsigned int red,
+			      unsigned int green, unsigned int blue)
 {
 	if (regno > 15)
-		return 1;
+		return;
 	red >>= 12;
 	blue >>= 12;
 	green >>= 12;
@@ -1968,7 +1946,6 @@ static int stste_setcolreg(unsigned int regno, unsigned int red,
 			((red & 0xe) << 7) |
 			((green & 0xe) << 3) |
 			((blue & 0xe) >> 1);
-	return 0;
 }
 
 static int stste_detect(void)
@@ -2112,6 +2089,19 @@ static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 	return 0;
 }
 
+static int ext_config_init(struct atari_drm_device *atari_drm)
+{
+	struct fb_var_screeninfo *myvar = &atafb_predefined[0];
+	struct drm_device *dev = &atari_drm->dev;
+
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.max_width = myvar->xres;
+	dev->mode_config.max_height = myvar->yres;
+	dev->mode_config.preferred_depth = myvar->bits_per_pixel;
+	return 0;
+}
+
 static int ext_decode_var(struct fb_var_screeninfo *var, struct atafb_par *par)
 {
 	struct fb_var_screeninfo *myvar = &atafb_predefined[0];
@@ -2187,17 +2177,16 @@ static void ext_set_par(struct atafb_par *par)
 		tmp = INB(0x3da);			\
 	} while (0)
 
-static int ext_setcolreg(unsigned int regno, unsigned int red,
-			 unsigned int green, unsigned int blue,
-			 unsigned int transp, struct fb_info *info)
+static void ext_set_col_reg(unsigned int regno, unsigned int red,
+			    unsigned int green, unsigned int blue)
 {
 	unsigned char colmask = (1 << external_bitspercol) - 1;
 
 	if (!external_vgaiobase)
-		return 1;
+		return;
 
 	if (regno > 255)
-		return 1;
+		return;
 
 	red >>= 8;
 	green >>= 8;
@@ -2213,16 +2202,16 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
 		DACDelay;
 		OUTB(0x3c9, blue & colmask);
 		DACDelay;
-		return 0;
+		return;
 
 	case IS_MV300:
 		OUTB((MV300_reg[regno] << 2) + 1, red);
 		OUTB((MV300_reg[regno] << 2) + 1, green);
 		OUTB((MV300_reg[regno] << 2) + 1, blue);
-		return 0;
+		return;
 
 	default:
-		return 1;
+		return;
 	}
 }
 
@@ -2275,11 +2264,13 @@ static int pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 static struct fb_hwswitch tt_switch = {
 	.detect		= tt_detect,
 	.encode_fix	= tt_encode_fix,
+	.config_init	= tt_config_init,
 	.decode_var	= tt_decode_var,
 	.encode_var	= tt_encode_var,
 	.get_par	= tt_get_par,
 	.set_par	= tt_set_par,
 	.set_screen_base = set_screen_base,
+	.set_col_reg	= tt_set_col_reg,
 	.pan_display	= pan_display,
 };
 #endif
@@ -2288,11 +2279,13 @@ static struct fb_hwswitch tt_switch = {
 static struct fb_hwswitch falcon_switch = {
 	.detect		= falcon_detect,
 	.encode_fix	= falcon_encode_fix,
+	.config_init	= falcon_config_init,
 	.decode_var	= falcon_decode_var,
 	.encode_var	= falcon_encode_var,
 	.get_par	= falcon_get_par,
 	.set_par	= falcon_set_par,
 	.set_screen_base = set_screen_base,
+	.set_col_reg	= falcon_set_col_reg,
 	.blank		= falcon_blank,
 	.pan_display	= falcon_pan_display,
 };
@@ -2302,11 +2295,13 @@ static struct fb_hwswitch falcon_switch = {
 static struct fb_hwswitch st_switch = {
 	.detect		= stste_detect,
 	.encode_fix	= stste_encode_fix,
+	.config_init	= stste_config_init,
 	.decode_var	= stste_decode_var,
 	.encode_var	= stste_encode_var,
 	.get_par	= stste_get_par,
 	.set_par	= stste_set_par,
 	.set_screen_base = stste_set_screen_base,
+	.set_col_reg	= stste_set_col_reg,
 	.pan_display	= pan_display
 };
 #endif
@@ -2315,10 +2310,12 @@ static struct fb_hwswitch st_switch = {
 static struct fb_hwswitch ext_switch = {
 	.detect		= ext_detect,
 	.encode_fix	= ext_encode_fix,
+	.config_init	= ext_config_init,
 	.decode_var	= ext_decode_var,
 	.encode_var	= ext_encode_var,
 	.get_par	= ext_get_par,
 	.set_par	= ext_set_par,
+	.set_col_reg	= ext_set_col_reg,
 };
 #endif
 
@@ -2386,9 +2383,6 @@ static int atafb_get_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	return 0;
 }
 
-// No longer called by fbcon!
-// Still called by set_var internally
-
 static void atafb_set_disp(struct fb_info *info)
 {
 	atafb_get_var(&info->var, info);
@@ -2408,189 +2402,6 @@ atafb_pan_display(struct fb_var_screeninfo *var, struct fb_info *info)
 	return fbhw->pan_display(var, info);
 }
 
-/*
- * generic drawing routines; imageblit needs updating for image depth > 1
- */
-
-static void atafb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
-{
-	struct atafb_par *par = info->par;
-	int x2, y2;
-	u32 width, height;
-
-	if (!rect->width || !rect->height)
-		return;
-
-#ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
-		cfb_fillrect(info, rect);
-		return;
-	}
-#endif
-
-	/*
-	 * We could use hardware clipping but on many cards you get around
-	 * hardware clipping by writing to framebuffer directly.
-	 * */
-	x2 = rect->dx + rect->width;
-	y2 = rect->dy + rect->height;
-	x2 = x2 < info->var.xres_virtual ? x2 : info->var.xres_virtual;
-	y2 = y2 < info->var.yres_virtual ? y2 : info->var.yres_virtual;
-	width = x2 - rect->dx;
-	height = y2 - rect->dy;
-
-	if (info->var.bits_per_pixel == 1)
-		atafb_mfb_fillrect(info, par->next_line, rect->color,
-				   rect->dy, rect->dx, height, width);
-	else if (info->var.bits_per_pixel == 2)
-		atafb_iplan2p2_fillrect(info, par->next_line, rect->color,
-					rect->dy, rect->dx, height, width);
-	else if (info->var.bits_per_pixel == 4)
-		atafb_iplan2p4_fillrect(info, par->next_line, rect->color,
-					rect->dy, rect->dx, height, width);
-	else
-		atafb_iplan2p8_fillrect(info, par->next_line, rect->color,
-					rect->dy, rect->dx, height, width);
-
-	return;
-}
-
-static void atafb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
-{
-	struct atafb_par *par = info->par;
-	int x2, y2;
-	u32 dx, dy, sx, sy, width, height;
-	int rev_copy = 0;
-
-#ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
-		cfb_copyarea(info, area);
-		return;
-	}
-#endif
-
-	/* clip the destination */
-	x2 = area->dx + area->width;
-	y2 = area->dy + area->height;
-	dx = area->dx > 0 ? area->dx : 0;
-	dy = area->dy > 0 ? area->dy : 0;
-	x2 = x2 < info->var.xres_virtual ? x2 : info->var.xres_virtual;
-	y2 = y2 < info->var.yres_virtual ? y2 : info->var.yres_virtual;
-	width = x2 - dx;
-	height = y2 - dy;
-
-	if (area->sx + dx < area->dx || area->sy + dy < area->dy)
-		return;
-
-	/* update sx,sy */
-	sx = area->sx + (dx - area->dx);
-	sy = area->sy + (dy - area->dy);
-
-	/* the source must be completely inside the virtual screen */
-	if (sx + width > info->var.xres_virtual ||
-			sy + height > info->var.yres_virtual)
-		return;
-
-	if (dy > sy || (dy == sy && dx > sx)) {
-		dy += height;
-		sy += height;
-		rev_copy = 1;
-	}
-
-	if (info->var.bits_per_pixel == 1)
-		atafb_mfb_copyarea(info, par->next_line, sy, sx, dy, dx, height, width);
-	else if (info->var.bits_per_pixel == 2)
-		atafb_iplan2p2_copyarea(info, par->next_line, sy, sx, dy, dx, height, width);
-	else if (info->var.bits_per_pixel == 4)
-		atafb_iplan2p4_copyarea(info, par->next_line, sy, sx, dy, dx, height, width);
-	else
-		atafb_iplan2p8_copyarea(info, par->next_line, sy, sx, dy, dx, height, width);
-
-	return;
-}
-
-static void atafb_imageblit(struct fb_info *info, const struct fb_image *image)
-{
-	struct atafb_par *par = info->par;
-	int x2, y2;
-	const char *src;
-	u32 dx, dy, width, height, pitch;
-
-#ifdef ATAFB_FALCON
-	if (info->var.bits_per_pixel == 16) {
-		cfb_imageblit(info, image);
-		return;
-	}
-#endif
-
-	/*
-	 * We could use hardware clipping but on many cards you get around
-	 * hardware clipping by writing to framebuffer directly like we are
-	 * doing here.
-	 */
-	x2 = image->dx + image->width;
-	y2 = image->dy + image->height;
-	dx = image->dx;
-	dy = image->dy;
-	x2 = x2 < info->var.xres_virtual ? x2 : info->var.xres_virtual;
-	y2 = y2 < info->var.yres_virtual ? y2 : info->var.yres_virtual;
-	width = x2 - dx;
-	height = y2 - dy;
-
-	if (image->depth == 1) {
-		// used for font data
-		src = image->data;
-		pitch = (image->width + 7) / 8;
-		while (height--) {
-
-			if (info->var.bits_per_pixel == 1)
-				atafb_mfb_linefill(info, par->next_line,
-						   dy, dx, width, src,
-						   image->bg_color, image->fg_color);
-			else if (info->var.bits_per_pixel == 2)
-				atafb_iplan2p2_linefill(info, par->next_line,
-							dy, dx, width, src,
-							image->bg_color, image->fg_color);
-			else if (info->var.bits_per_pixel == 4)
-				atafb_iplan2p4_linefill(info, par->next_line,
-							dy, dx, width, src,
-							image->bg_color, image->fg_color);
-			else
-				atafb_iplan2p8_linefill(info, par->next_line,
-							dy, dx, width, src,
-							image->bg_color, image->fg_color);
-			dy++;
-			src += pitch;
-		}
-	} else {
-		c2p_iplan2(info->screen_base, image->data, dx, dy, width,
-			   height, par->next_line, image->width,
-			   info->var.bits_per_pixel);
-	}
-}
-
-static int
-atafb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
-{
-	switch (cmd) {
-#ifdef FBCMD_GET_CURRENTPAR
-	case FBCMD_GET_CURRENTPAR:
-		if (copy_to_user((void *)arg, &current_par,
-				 sizeof(struct atafb_par)))
-			return -EFAULT;
-		return 0;
-#endif
-#ifdef FBCMD_SET_CURRENTPAR
-	case FBCMD_SET_CURRENTPAR:
-		if (copy_from_user(&current_par, (void *)arg,
-				   sizeof(struct atafb_par)))
-			return -EFAULT;
-		ata_set_par(&current_par);
-		return 0;
-#endif
-	}
-	return -EINVAL;
-}
 
 /* (un)blank/poweroff
  * 0 = unblank
@@ -2601,27 +2412,20 @@ atafb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
  */
 static int atafb_blank(int blank, struct fb_info *info)
 {
-	unsigned short black[16];
-	struct fb_cmap cmap;
+	unsigned int i;
+
 	if (fbhw->blank && !fbhw->blank(blank))
 		return 1;
+
 	if (blank) {
-		memset(black, 0, 16 * sizeof(unsigned short));
-		cmap.red = black;
-		cmap.green = black;
-		cmap.blue = black;
-		cmap.transp = NULL;
-		cmap.start = 0;
-		cmap.len = 16;
-		fb_set_cmap(&cmap, info);
+		// FIXME What if bpp > 4?
+		for (i = 0; i < 16; i++)
+			fbhw->set_col_reg(i, 0, 0, 0);
 	}
-#if 0
-	else
-		do_install_cmap(info);
-#endif
 	return 0;
 }
 
+
 	/*
 	 * New fbcon interface ...
 	 */
@@ -2669,10 +2473,6 @@ static struct fb_ops atafb_ops = {
 	.fb_set_par	= atafb_set_par,
 	.fb_blank =	atafb_blank,
 	.fb_pan_display	= atafb_pan_display,
-	.fb_fillrect	= atafb_fillrect,
-	.fb_copyarea	= atafb_copyarea,
-	.fb_imageblit	= atafb_imageblit,
-	.fb_ioctl =	atafb_ioctl,
 };
 
 static void check_default_par(int detected_mode)
@@ -2716,7 +2516,7 @@ static void check_default_par(int detected_mode)
 }
 
 #ifdef ATAFB_EXT
-static void __init atafb_setup_ext(char *spec)
+static void atafb_setup_ext(char *spec)
 {
 	int xres, xres_virtual, yres, depth, planes;
 	unsigned long addr, len;
@@ -2948,9 +2748,7 @@ static int __init atafb_setup(char *options)
 		if ((temp = get_video_mode(this_opt))) {
 			default_par = temp;
 			mode_option = this_opt;
-		} else if (!strcmp(this_opt, "inverse"))
-			fb_invert_cmaps();
-		else if (!strncmp(this_opt, "hwscroll_", 9)) {
+		} else if (!strncmp(this_opt, "hwscroll_", 9)) {
 			hwscroll = simple_strtoul(this_opt + 9, NULL, 10);
 			if (hwscroll < 0)
 				hwscroll = 0;
@@ -2983,86 +2781,1728 @@ static int __init atafb_setup(char *options)
 	return 0;
 }
 
-static int __init atafb_probe(struct platform_device *pdev)
+
+/* ------------------------------------------------------------------ */
+/*
+ * The meat of this driver. The core passes us a mode and we have to program
+ * it. The modesetting here is the bare minimum required to satisfy the qemu
+ * emulation of this hardware, and running this against a real device is
+ * likely to result in an inadequately programmed mode. We've already had
+ * the opportunity to modify the mode, so whatever we receive here should
+ * be something that can be correctly programmed and displayed
+ */
+
+static void atari_drm_set_start_address(struct atari_drm_device *atari_drm,
+					u32 offset)
 {
-	int pad, detected_mode, error;
-	unsigned int defmode = 0;
-	unsigned long mem_req;
-	char *option = NULL;
+	int idx;
 
-	if (fb_get_options("atafb", &option))
-		return -ENODEV;
-	atafb_setup(option);
-	dev_dbg(&pdev->dev, "%s: start\n", __func__);
+	if (!drm_dev_enter(&atari_drm->dev, &idx))
+		return;
 
-	do {
-#ifdef ATAFB_EXT
-		if (external_addr) {
-			dev_dbg(&pdev->dev, "initializing external hw\n");
-			fbhw = &ext_switch;
-			atafb_ops.fb_setcolreg = &ext_setcolreg;
-			defmode = DEFMODE_EXT;
-			break;
-		}
-#endif
-#ifdef ATAFB_TT
-		if (ATARIHW_PRESENT(TT_SHIFTER)) {
-			dev_dbg(&pdev->dev, "initializing TT hw\n");
-			fbhw = &tt_switch;
-			atafb_ops.fb_setcolreg = &tt_setcolreg;
-			defmode = DEFMODE_TT;
-			break;
-		}
-#endif
-#ifdef ATAFB_FALCON
-		if (ATARIHW_PRESENT(VIDEL_SHIFTER)) {
-			dev_dbg(&pdev->dev, "initializing Falcon hw\n");
-			fbhw = &falcon_switch;
-			atafb_ops.fb_setcolreg = &falcon_setcolreg;
-			error = request_irq(IRQ_AUTO_4, falcon_vbl_switcher, 0,
-					    "framebuffer:modeswitch",
-					    falcon_vbl_switcher);
-			if (error)
-				return error;
-			defmode = DEFMODE_F30;
-			break;
-		}
-#endif
-#ifdef ATAFB_STE
-		if (ATARIHW_PRESENT(STND_SHIFTER) ||
-		    ATARIHW_PRESENT(EXTD_SHIFTER)) {
-			dev_dbg(&pdev->dev, "initializing ST/E hw\n");
-			fbhw = &st_switch;
-			atafb_ops.fb_setcolreg = &stste_setcolreg;
-			defmode = DEFMODE_STE;
-			break;
-		}
-		fbhw = &st_switch;
-		atafb_ops.fb_setcolreg = &stste_setcolreg;
-		dev_warn(&pdev->dev,
-			 "Cannot determine video hardware; defaulting to ST(e)\n");
-#else /* ATAFB_STE */
-		/* no default driver included */
-		/* Nobody will ever see this message :-) */
-		panic("Cannot initialize video hardware");
-#endif
-	} while (0);
+	if (fbhw->set_screen_base)
+		fbhw->set_screen_base(screen_base + offset);
 
-	/* Multisync monitor capabilities */
-	/* Atari-TOS defaults if no boot option present */
-	if (fb_info.monspecs.hfmin == 0) {
-		fb_info.monspecs.hfmin = 31000;
-		fb_info.monspecs.hfmax = 32000;
-		fb_info.monspecs.vfmin = 58;
-		fb_info.monspecs.vfmax = 62;
-	}
+	drm_dev_exit(idx);
+}
 
-	detected_mode = fbhw->detect();
-	check_default_par(detected_mode);
-#ifdef ATAFB_EXT
-	if (!external_addr) {
-#endif /* ATAFB_EXT */
-		mem_req = default_mem_req + ovsc_offset + ovsc_addlen;
+static int atari_drm_mode_set(struct atari_drm_device *atari_drm,
+			      struct drm_display_mode *mode,
+			      struct drm_framebuffer *fb)
+{
+	int idx;
+
+	if (!drm_dev_enter(&atari_drm->dev, &idx))
+		return -1;
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
+		break;
+
+	case DRM_FORMAT_C8:
+		// FIXME TT & Falcon only
+		break;
+
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
+	case DRM_FORMAT_XRGB8888:
+		// FIXME Falcon only
+		break;
+
+		// FIXME
+		break;
+
+	default:
+		drm_dev_exit(idx);
+		return -1;
+	}
+
+	// FIXME switch mode
+	atari_drm->bpp = fb_info.var.bits_per_pixel;
+
+	/* Program the pitch */
+	atari_drm->pitch = current_par.next_line;
+
+	atari_drm_set_start_address(atari_drm, 0);
+
+	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
+	// FIXME
+
+	drm_dev_exit(idx);
+	return 0;
+}
+
+// FIXME plain copy
+static void atari_drm_fb_c1_to_iplan2p1(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int bytes, lines, x1;
+	void *dst = screen_base;
+
+	bytes = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 8, 8);
+	x1 = rect->x1 & -8;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 / 8;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 8;
+
+	while (lines--) {
+		memcpy(dst, vaddr, bytes);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_fb_c2_to_iplan2p2_line(char *dst, const char *vaddr,
+					     unsigned int words)
+{
+	union {
+		u8 pixels[4];
+		u32 words[2];
+	} c2p;
+
+	while (words--) {
+		/*
+		 * Load 16 chunky 2-bit pixels
+		 */
+		memcpy(c2p.pixels, vaddr, sizeof(c2p.pixels));
+		vaddr += 4;
+
+		/*
+		 * Perform a full C2P step on 2 32-bit words
+		 */
+		transp2x(c2p.words, 1, 1);
+		transp2(c2p.words, 16, 1);
+		transp2(c2p.words, 8, 1);
+		transp2(c2p.words, 4, 1);
+		transp2(c2p.words, 2, 1);
+		transp2(c2p.words, 1, 1);
+
+		/*
+		 * Store planar data (2 planes per 32-bit word)
+		 * Second word only!
+		 */
+		memcpy(dst, &c2p.words[1], sizeof(c2p.words[1]));
+		dst += 4;
+	}
+}
+
+static void atari_drm_fb_c2_to_iplan2p2(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 / 4;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 4;
+
+	while (lines--) {
+		atari_drm_fb_c2_to_iplan2p2_line(dst, vaddr, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_fb_c4_to_iplan2p4_line(char *dst, const char *vaddr,
+					     unsigned int words)
+{
+	union {
+		u8 pixels[8];
+		u32 words[2];
+	} c2p;
+
+	while (words--) {
+		/*
+		 * Load 16 chunky 4-bit pixels
+		 */
+		memcpy(c2p.pixels, vaddr, sizeof(c2p.pixels));
+		vaddr += 8;
+
+		/*
+		 * Perform a full C2P step on 2 32-bit words
+		 */
+		transp2(c2p.words, 8, 1);
+		transp2(c2p.words, 2, 1);
+		transp2x(c2p.words, 1, 1);
+		transp2(c2p.words, 16, 1);
+		transp2(c2p.words, 4, 1);
+		transp2(c2p.words, 1, 1);
+
+		/*
+		 * Store planar data (2 planes per 32-bit word)
+		 */
+		memcpy(dst, c2p.words, sizeof(c2p.words));
+		dst += 8;
+	}
+}
+
+static void atari_drm_fb_c4_to_iplan2p4(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 / 2;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 2;
+
+	while (lines--) {
+		atari_drm_fb_c4_to_iplan2p4_line(dst, vaddr, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_fb_c8_to_iplan2p8_line(void *dst, const void *vaddr,
+					     unsigned int words)
+{
+	// FIXME Get rid of pixels and union
+	// FIXME Use get_unaligned_be32() and store directly in words
+	// FIXME Is it more efficient to work on 16-bit words?
+	// FIXME aranym/src/hostscreen.cpp:HostScreen::bitplaneToChunky()
+	// FIXME Check asm output!!!!
+	union {
+		u8 pixels[16];
+		u32 words[4];
+	} c2p;
+
+	while (words--) {
+		/*
+		 * Load 16 chunky 8-bit pixels
+		 */
+		memcpy(c2p.pixels, vaddr, sizeof(c2p.pixels));
+		vaddr += 16;
+
+		/*
+		 * Perform a full C2P step on 4 32-bit words
+		 */
+		transp4(c2p.words, 8, 2);
+		transp4(c2p.words, 1, 2);
+		transp4x(c2p.words, 16, 2);
+		transp4x(c2p.words, 2, 2);
+		transp4(c2p.words, 4, 1);
+
+		/*
+		 * Store permutated planar data (2 planes per 32-bit word)
+		 */
+		put_unaligned_be32(c2p.words[1], dst);
+		dst += 4;
+		put_unaligned_be32(c2p.words[3], dst);
+		dst += 4;
+		put_unaligned_be32(c2p.words[0], dst);
+		dst += 4;
+		put_unaligned_be32(c2p.words[2], dst);
+		dst += 4;
+	}
+}
+
+static void atari_drm_fb_c8_to_iplan2p8(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1;
+	vaddr += rect->y1 * fb->pitches[0] + x1;
+
+	while (lines--) {
+		atari_drm_fb_c8_to_iplan2p8_line(dst, vaddr, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_load_clut332(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < 256; i++) {
+		u16 r = ((i >> 5) & 7) * 0x1fff;
+		u16 g = ((i >> 2) & 7) * 0x1fff;
+		u16 b = (i & 3) * 0x3fff;
+		fbhw->set_col_reg(i, r, g, b);
+	}
+}
+
+//#define EMULATE_LESSER_FORMATS
+
+#ifdef EMULATE_LESSER_FORMATS
+static void atari_drm_fb_c1_to_iplan2pX_line(char *dst, const char *vaddr,
+					     unsigned int words,
+					     unsigned int bpp)
+{
+	while (words--) {
+		put_unaligned_be16(get_unaligned_be16(vaddr), dst);
+		dst += 2;
+		vaddr += 2;
+
+		memset(dst, 0, (bpp - 1) * 2);
+		dst += (bpp - 1) * 2;
+	}
+}
+
+static void atari_drm_fb_c1_to_iplan2pX(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1, bpp = atari_drm->bpp;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 * bpp / 8;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 8;
+
+	while (lines--) {
+		atari_drm_fb_c1_to_iplan2pX_line(dst, vaddr, words, bpp);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_fb_c2_to_iplan2pX_line(char *dst, const char *vaddr,
+					     unsigned int words,
+					     unsigned int bpp)
+{
+	union {
+		u8 pixels[4];
+		u32 words[2];
+	} c2p;
+
+	while (words--) {
+		/*
+		 * Load 16 chunky 2-bit pixels
+		 */
+		memcpy(c2p.pixels, vaddr, sizeof(c2p.pixels));
+		vaddr += 4;
+
+		/*
+		 * Perform a full C2P step on 2 32-bit words
+		 */
+		transp2x(c2p.words, 1, 1);
+		transp2(c2p.words, 16, 1);
+		transp2(c2p.words, 8, 1);
+		transp2(c2p.words, 4, 1);
+		transp2(c2p.words, 2, 1);
+		transp2(c2p.words, 1, 1);
+
+		/*
+		 * Store planar data (2 planes per 32-bit word)
+		 * Second word only!
+		 */
+		memcpy(dst, &c2p.words[1], sizeof(c2p.words[1]));
+		dst += 4;
+		memset(dst, 0, (bpp - 2) * 2);
+		dst += (bpp - 2) * 2;
+	}
+}
+
+static void atari_drm_fb_c2_to_iplan2pX(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1, bpp = atari_drm->bpp;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 * bpp / 8;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 4;
+
+	while (lines--) {
+		atari_drm_fb_c2_to_iplan2pX_line(dst, vaddr, words, bpp);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void atari_drm_fb_c4_to_iplan2pX_line(char *dst, const char *vaddr,
+					     unsigned int words,
+					     unsigned int bpp)
+{
+	union {
+		u8 pixels[8];
+		u32 words[2];
+	} c2p;
+
+	while (words--) {
+		/*
+		 * Load 16 chunky 4-bit pixels
+		 */
+		memcpy(c2p.pixels, vaddr, sizeof(c2p.pixels));
+		vaddr += 8;
+
+		/*
+		 * Perform a full C2P step on 2 32-bit words
+		 */
+		transp2(c2p.words, 8, 1);
+		transp2(c2p.words, 2, 1);
+		transp2x(c2p.words, 1, 1);
+		transp2(c2p.words, 16, 1);
+		transp2(c2p.words, 4, 1);
+		transp2(c2p.words, 1, 1);
+
+		/*
+		 * Store planar data (2 planes per 32-bit word)
+		 */
+		memcpy(dst, c2p.words, sizeof(c2p.words));
+		dst += 8;
+		memset(dst, 0, (bpp - 4) * 2);
+		dst += (bpp - 4) * 2;
+	}
+}
+
+static void atari_drm_fb_c4_to_iplan2pX(const void *vaddr,
+					const struct drm_framebuffer *fb,
+					const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, lines, x1, bpp = atari_drm->bpp;
+	void *dst = screen_base;
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	lines = drm_rect_height(rect);
+
+	dst += rect->y1 * atari_drm->pitch + x1 * bpp / 8;
+	vaddr += rect->y1 * fb->pitches[0] + x1 / 2;
+
+	while (lines--) {
+		atari_drm_fb_c4_to_iplan2pX_line(dst, vaddr, words, bpp);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+}
+
+static void drm_fb_rgb565_to_rgb332_line(u8 *dbuf, const __le16 *sbuf,
+					 unsigned int pixels)
+{
+	unsigned int x;
+	u16 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le16_to_cpu(sbuf[x]);
+		dbuf[x] = ((pix & 0xe000) >> 8) |
+			  ((pix & 0x0700) >> 6) |
+			  ((pix & 0x001c) >> 3);
+	}
+}
+
+static void atari_drm_fb_rgb565_to_rgb332(const void *vaddr,
+					  const struct drm_framebuffer *fb,
+					  const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, pixels, lines, x1;
+	void *dst = screen_base;
+	void *buf;
+
+	// FIXME Just for testing
+	// FIXME RGB565 should only be used with RGB565 (Falcon or ARAnyM)
+	atari_drm_load_clut332();
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	pixels = words * 16;
+	lines = drm_rect_height(rect);
+
+	buf = kmalloc(pixels, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	dst += rect->y1 * atari_drm->pitch + x1;
+	vaddr += rect->y1 * fb->pitches[0] + x1 * fb->format->cpp[0];
+
+	while (lines--) {
+		drm_fb_rgb565_to_rgb332_line(buf, vaddr, pixels);
+		atari_drm_fb_c8_to_iplan2p8_line(dst, buf, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+
+	kfree(buf);
+}
+
+static void drm_fb_rgb565be_to_rgb332_line(u8 *dbuf, const __be16 *sbuf,
+					   unsigned int pixels)
+{
+	unsigned int x;
+	u16 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = be16_to_cpu(sbuf[x]);
+		dbuf[x] = ((pix & 0xe000) >> 8) |
+			  ((pix & 0x0700) >> 6) |
+			  ((pix & 0x001c) >> 3);
+	}
+}
+
+static void atari_drm_fb_rgb565be_to_rgb332(const void *vaddr,
+					    const struct drm_framebuffer *fb,
+					    const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, pixels, lines, x1;
+	void *dst = screen_base;
+	void *buf;
+
+	// FIXME Just for testing
+	// FIXME RGB565 should only be used with RGB565 (Falcon or ARAnyM)
+	atari_drm_load_clut332();
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	pixels = words * 16;
+	lines = drm_rect_height(rect);
+
+	buf = kmalloc(pixels, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	dst += rect->y1 * atari_drm->pitch + x1;
+	vaddr += rect->y1 * fb->pitches[0] + x1 * fb->format->cpp[0];
+
+	while (lines--) {
+		drm_fb_rgb565be_to_rgb332_line(buf, vaddr, pixels);
+		atari_drm_fb_c8_to_iplan2p8_line(dst, buf, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+
+	kfree(buf);
+}
+#endif // EMULATE_LESSER_FORMATS
+
+// FIXME Export in drivers/gpu/drm/drm_format_helper.c?
+static void drm_fb_xrgb8888_to_rgb332_line(u8 *dbuf, const __le32 *sbuf,
+					   unsigned int pixels)
+{
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf[x]);
+		dbuf[x] = ((pix & 0x00e00000) >> 16) |
+			  ((pix & 0x0000e000) >> 11) |
+			  ((pix & 0x000000c0) >> 6);
+	}
+}
+
+static void atari_drm_fb_xrgb8888_to_rgb332(const void *vaddr,
+					    const struct drm_framebuffer *fb,
+					    const struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	unsigned int words, pixels, lines, x1;
+	void *dst = screen_base;
+	void *buf;
+
+	// FIXME Just for testing
+	// FIXME XRGB8888 should only be used with RGB565 (Falcon or ARAnyM)
+	atari_drm_load_clut332();
+
+	words = DIV_ROUND_UP(drm_rect_width(rect) + rect->x1 % 16, 16);
+	x1 = rect->x1 & -16;
+	pixels = words * 16;
+	lines = drm_rect_height(rect);
+
+	buf = kmalloc(pixels, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	dst += rect->y1 * atari_drm->pitch + x1;
+	vaddr += rect->y1 * fb->pitches[0] + x1 * fb->format->cpp[0];
+
+	while (lines--) {
+		drm_fb_xrgb8888_to_rgb332_line(buf, vaddr, pixels);
+		atari_drm_fb_c8_to_iplan2p8_line(dst, buf, words);
+		vaddr += fb->pitches[0];
+		dst += atari_drm->pitch;
+	}
+
+	kfree(buf);
+}
+
+static int atari_drm_fb_blit_rect(const struct drm_framebuffer *fb,
+				  const struct iosys_map *map,
+				  struct drm_rect *rect)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_dev(fb->dev);
+	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
+	struct iosys_map dst = IOSYS_MAP_INIT_VADDR(screen_base);
+	int idx;
+
+	if (!drm_dev_enter(&atari_drm->dev, &idx))
+		return -ENODEV;
+
+	// FIXME Do we need to support conversion from Cn to Cm?
+	// FIXME Only up (n < m)?
+	// FIXME Also down (n > m)?
+	// FIXME No, just for testing
+	switch (fb->format->format) {
+	case DRM_FORMAT_C1:
+#ifdef EMULATE_LESSER_FORMATS
+		if (atari_drm->bpp > 1 && atari_drm->bpp <= 8) {
+			// FIXME For testing only
+			atari_drm_fb_c1_to_iplan2pX(vmap, fb, rect);
+			break;
+		}
+#endif // EMULATE_LESSER_FORMATS
+
+		if (atari_drm->bpp != 1)
+			goto unsupported;
+
+		// FIXME like bpp=16 after aligning rect with pixel grid
+		atari_drm_fb_c1_to_iplan2p1(vmap, fb, rect);
+		break;
+
+	case DRM_FORMAT_C2:
+#ifdef EMULATE_LESSER_FORMATS
+		if (atari_drm->bpp > 2 && atari_drm->bpp <= 8) {
+			// FIXME For testing only
+			atari_drm_fb_c2_to_iplan2pX(vmap, fb, rect);
+			break;
+		}
+#endif // EMULATE_LESSER_FORMATS
+
+		if (atari_drm->bpp != 2)
+			goto unsupported;
+
+		atari_drm_fb_c2_to_iplan2p2(vmap, fb, rect);
+		break;
+
+	case DRM_FORMAT_C4:
+#ifdef EMULATE_LESSER_FORMATS
+		if (atari_drm->bpp > 4 && atari_drm->bpp <= 8) {
+			// FIXME For testing only
+			atari_drm_fb_c4_to_iplan2pX(vmap, fb, rect);
+			break;
+		}
+#endif // EMULATE_LESSER_FORMATS
+
+		if (atari_drm->bpp != 4)
+			goto unsupported;
+
+		atari_drm_fb_c4_to_iplan2p4(vmap, fb, rect);
+		break;
+
+	case DRM_FORMAT_C8:
+		if (atari_drm->bpp != 8)
+			goto unsupported;
+
+		atari_drm_fb_c8_to_iplan2p8(vmap, fb, rect);
+		break;
+
+	case DRM_FORMAT_RGB565:
+		switch (atari_drm->bpp) {
+#ifdef EMULATE_LESSER_FORMATS
+		case 8:
+			// FIXME For testing only
+			atari_drm_fb_rgb565_to_rgb332(vmap, fb, rect);
+			break;
+#endif // EMULATE_LESSER_FORMATS
+
+		case 16:
+			iosys_map_incr(&dst,
+				       drm_fb_clip_offset(atari_drm->pitch,
+							  fb->format, rect));
+			drm_fb_swab(&dst, &atari_drm->pitch, map, fb, rect,
+				    true);
+			break;
+
+		default:
+			goto unsupported;
+		}
+		break;
+
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
+		switch (atari_drm->bpp) {
+#ifdef EMULATE_LESSER_FORMATS
+		case 8:
+			// FIXME For testing only
+			atari_drm_fb_rgb565be_to_rgb332(vmap, fb, rect);
+			break;
+#endif // EMULATE_LESSER_FORMATS
+
+		case 16:
+			iosys_map_incr(&dst,
+				       drm_fb_clip_offset(atari_drm->pitch,
+							  fb->format, rect));
+			drm_fb_memcpy(&dst, &atari_drm->pitch, map, fb, rect);
+			break;
+
+		default:
+			goto unsupported;
+		}
+		break;
+
+	case DRM_FORMAT_XRGB8888:
+		switch (atari_drm->bpp) {
+		case 8:
+			atari_drm_fb_xrgb8888_to_rgb332(vmap, fb, rect);
+			break;
+
+		case 16:
+			iosys_map_incr(&dst,
+				       drm_fb_clip_offset(atari_drm->pitch,
+							  fb->format, rect));
+			drm_fb_xrgb8888_to_rgb565(&dst, &atari_drm->pitch, map,
+						  fb, rect, false);
+			break;
+
+		default:
+			goto unsupported;
+		}
+		break;
+
+	default:
+		drm_WARN_ONCE(fb->dev, 1, "Format %p4cc not supported\n",
+			      fb->format);
+		goto unsupported;
+	}
+
+unsupported:
+	drm_dev_exit(idx);
+	return 0;
+}
+
+static int atari_drm_fb_blit_fullscreen(struct drm_framebuffer *fb,
+					const struct iosys_map *map)
+{
+	struct drm_rect fullscreen = {
+		.x1 = 0,
+		.x2 = fb->width,
+		.y1 = 0,
+		.y2 = fb->height,
+	};
+	return atari_drm_fb_blit_rect(fb, map, &fullscreen);
+}
+
+static int atari_drm_check_size(int width, int height,
+				struct drm_framebuffer *fb)
+{
+	int pitch = width;
+
+	if (fb)
+		pitch = fb->pitches[0];
+
+	if (fb && width > fb->dev->mode_config.max_width)
+		return -EINVAL;
+
+	if (pitch * height > screen_len)
+		{} //FIXME return -EINVAL;
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* atari_drm connector						      */
+
+static int atari_drm_conn_get_modes(struct drm_connector *conn)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_conn(conn);
+	struct drm_device *dev = conn->dev;
+	struct drm_display_mode *mode;
+	unsigned int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(atari_drm_modes); i++) {
+		mode = drm_mode_duplicate(dev, &atari_drm_modes[i]);
+		if (!mode)
+			break;
+
+		if (i == atari_drm->defmode)
+			mode->type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(conn, mode);
+	}
+
+	return i;
+}
+
+/**
+ * atari_drm_conn_mode_valid
+ *
+ * Callback to validate a mode for a connector, irrespective of the
+ * specific display configuration.
+ *
+ * This callback is used by the probe helpers to filter the mode list
+ * (which is usually derived from the EDID data block from the sink).
+ * See e.g. drm_helper_probe_single_connector_modes().
+ *
+ * This function is optional.
+ *
+ * NOTE:
+ *
+ * This only filters the mode list supplied to userspace in the
+ * GETCONNECTOR IOCTL. Compared to &drm_encoder_helper_funcs.mode_valid,
+ * &drm_crtc_helper_funcs.mode_valid and &drm_bridge_funcs.mode_valid,
+ * which are also called by the atomic helpers from
+ * drm_atomic_helper_check_modeset(). This allows userspace to force and
+ * ignore sink constraint (like the pixel clock limits in the screen's
+ * EDID), which is useful for e.g. testing, or working around a broken
+ * EDID. Any source hardware constraint (which always need to be
+ * enforced) therefore should be checked in one of the above callbacks,
+ * and not this one here.
+ *
+ * To avoid races with concurrent connector state updates, the helper
+ * libraries always call this with the &drm_mode_config.connection_mutex
+ * held. Because of this it's safe to inspect &drm_connector->state.
+ *
+ * RETURNS:
+ *
+ * Either &drm_mode_status.MODE_OK or one of the failure reasons in &enum
+ * drm_mode_status.
+ */
+static enum drm_mode_status atari_drm_conn_mode_valid(
+	struct drm_connector *conn, struct drm_display_mode *mode)
+{
+	// FIXME
+	return MODE_OK;
+}
+
+static const struct drm_connector_helper_funcs atari_drm_conn_helper_funcs = {
+	.get_modes = atari_drm_conn_get_modes,
+	.mode_valid = atari_drm_conn_mode_valid,
+};
+
+static const struct drm_connector_funcs atari_drm_conn_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+// FIXME create dynamically from atari_drm_modes[]?
+static const struct drm_named_mode atari_drm_named_modes[] =
+{
+	{ .name = "st-low" },
+	{ .name = "st-mid" },
+	{ .name = "st-high" },
+	{ .name = "tt-low" },
+	{ .name = "tt-mid" },
+	{ .name = "tt-high" },
+	{ .name = "vga" },
+	{ .name = "vga70" },
+	{ .name = "qvga" },
+	{ .name = "hvga" },
+	{ .name = "falh" },
+	{ /* sentinel */ }
+};
+
+static int atari_drm_conn_init(struct atari_drm_device *atari_drm)
+{
+	struct drm_connector *conn = &atari_drm->conn;
+	const struct drm_cmdline_mode *cmdline_mode;
+	int ret;
+
+	// FIXME Depends on monitor type. Handle in .config_init()?
+	conn->interlace_allowed = true;
+	conn->doublescan_allowed = true;
+	conn->named_modes = atari_drm_named_modes;
+
+	drm_connector_helper_add(conn, &atari_drm_conn_helper_funcs);
+	ret = drm_connector_init(&atari_drm->dev, conn, &atari_drm_conn_funcs,
+				 DRM_MODE_CONNECTOR_VGA);
+
+	cmdline_mode = &conn->cmdline_mode;
+	if (cmdline_mode->specified) {
+		pr_info("    name %s\n", cmdline_mode->name);
+		pr_info("    resolution %ux%u\n", cmdline_mode->xres,
+			cmdline_mode->yres);
+	}
+	if (cmdline_mode->bpp_specified)
+		pr_info("    bpp %u\n", cmdline_mode->bpp);
+	if (cmdline_mode->refresh_specified)
+		pr_info("    refresh %u\n", cmdline_mode->refresh);
+
+	return ret;
+}
+
+// FIXME helpers from
+// "[PATCH v2 5/15] drm/fbconv: Add DRM <-> fbdev pixel-format conversion"
+// by Thomas Zimmermann <tzimmermann@suse.de>
+// FIXME helpers from
+// "[PATCH v2 6/15] drm/fbconv: Add mode conversion DRM <-> fbdev"
+// by Thomas Zimmermann <tzimmermann@suse.de>
+/**
+ * drm_mode_update_from_fb_videomode - Sets a drm_display mode struecture
+ *	from an fb_videomode structure
+ * @mode:	the DRM display mode structure to update
+ * @fb_mode:	an fb_videomode structure
+ */
+static void drm_mode_update_from_fb_videomode(struct drm_display_mode *mode,
+				       const struct fb_videomode *fb_mode)
+{
+	mode->type = DRM_MODE_TYPE_DRIVER;
+
+	mode->clock = PICOS2KHZ(fb_mode->pixclock);
+
+	mode->hdisplay = fb_mode->xres;
+	mode->hsync_start = mode->hdisplay + fb_mode->right_margin;
+	mode->hsync_end = mode->hsync_start + fb_mode->hsync_len;
+	mode->htotal = mode->hsync_end + fb_mode->left_margin;
+	mode->hskew = 0;
+
+	mode->vdisplay = fb_mode->yres;
+	mode->vsync_start = mode->vdisplay + fb_mode->lower_margin;
+	mode->vsync_end = mode->vsync_start + fb_mode->vsync_len;
+	mode->vtotal = mode->vsync_end + fb_mode->upper_margin;
+	mode->vscan = 0;
+
+	mode->flags = 0;
+
+	if (fb_mode->sync & FB_SYNC_HOR_HIGH_ACT)
+		mode->flags |= DRM_MODE_FLAG_PHSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NHSYNC;
+
+	if (fb_mode->sync & FB_SYNC_VERT_HIGH_ACT)
+		mode->flags |= DRM_MODE_FLAG_PVSYNC;
+	else
+		mode->flags |= DRM_MODE_FLAG_NVSYNC;
+
+	if (fb_mode->sync & FB_SYNC_COMP_HIGH_ACT)
+		mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_PCSYNC;
+
+	if (fb_mode->vmode & FB_VMODE_INTERLACED)
+		mode->flags |= DRM_MODE_FLAG_INTERLACE;
+
+	if (fb_mode->vmode & FB_VMODE_DOUBLE)
+		mode->flags |= DRM_MODE_FLAG_DBLSCAN;
+
+	mode->width_mm = 0;
+	mode->height_mm = 0;
+
+	/* final step; depends on previous setup */
+	if (fb_mode->name) {
+		strncpy(mode->name, fb_mode->name, sizeof(mode->name) - 1);
+		mode->name[sizeof(mode->name) - 1] = '\0';
+	} else {
+		drm_mode_set_name(mode);
+	}
+}
+
+/**
+ * drm_mode_update_from_fb_var_screeninfo - Sets a drm_display mode structure
+ *	from an fb_var_screenmode structure
+ * @mode:	the DRM display mode structure to update
+ * @fb_var:	an fb_var_screeninfo structure
+ */
+static void drm_mode_update_from_fb_var_screeninfo(
+	struct drm_display_mode *mode, const struct fb_var_screeninfo *fb_var)
+{
+	struct fb_videomode fb_mode;
+
+	fb_var_to_videomode(&fb_mode, fb_var);
+	drm_mode_update_from_fb_videomode(mode, &fb_mode);
+}
+
+/**
+ * drm_fbconv_init_fb_videomode_from_mode - initializes an fb_videomode
+ *	structure from a DRM display mode
+ * @fb_mode:	the fb_videomode structure to update
+ * @mode:	a DRM display mode
+ */
+static void drm_fbconv_init_fb_videomode_from_mode(
+	struct fb_videomode *fb_mode, const struct drm_display_mode *mode)
+{
+	memset(fb_mode, 0, sizeof(*fb_mode));
+
+	fb_mode->name = NULL;
+	fb_mode->refresh = drm_mode_vrefresh(mode);
+	fb_mode->xres = mode->hdisplay;
+	fb_mode->yres = mode->vdisplay;
+	fb_mode->pixclock = KHZ2PICOS(mode->clock);
+	fb_mode->left_margin = mode->htotal - mode->hsync_end;
+	fb_mode->right_margin = mode->hsync_start - mode->hdisplay;
+	fb_mode->upper_margin = mode->vtotal - mode->vsync_end;
+	fb_mode->lower_margin = mode->vsync_start - mode->vdisplay;
+	fb_mode->hsync_len = mode->hsync_end - mode->hsync_start;
+	fb_mode->vsync_len = mode->vsync_end - mode->vsync_start;
+
+	fb_mode->sync = 0;
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+		fb_mode->sync |= FB_SYNC_HOR_HIGH_ACT;
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+		fb_mode->sync |= FB_SYNC_VERT_HIGH_ACT;
+	if (mode->flags & (DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_PCSYNC))
+		fb_mode->sync |= FB_SYNC_COMP_HIGH_ACT;
+
+	fb_mode->vmode = 0;
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		fb_mode->vmode |= FB_VMODE_INTERLACED;
+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+		fb_mode->vmode |= FB_VMODE_DOUBLE;
+
+	fb_mode->flag = 0;
+}
+
+/**
+ * drm_fbconv_update_fb_var_screeninfo_from_mode - updates an
+ *	fb_var_screeninfo structure from a DRM display mode
+ * @fb_var:	the fb_var_screeninfo structure to update
+ * @mode:	a DRM display mode
+ */
+static void drm_fbconv_update_fb_var_screeninfo_from_mode(
+	struct fb_var_screeninfo *fb_var, const struct drm_display_mode *mode)
+{
+	struct fb_videomode fb_mode;
+
+	drm_fbconv_init_fb_videomode_from_mode(&fb_mode, mode);
+	fb_videomode_to_var(fb_var, &fb_mode);
+
+	fb_var->height = mode->height_mm;
+	fb_var->width = mode->width_mm;
+}
+
+/**
+ * drm_fbconv_init_fb_var_screeninfo_from_mode - initialize an
+ *	fb_var_screeninfo structure from a DRM display mode
+ * @fb_var:	the fb_var_screeninfo structure to update
+ * @mode:	a DRM display mode
+ *
+ * This is the same as drm_fbconv_update_fb_var_screeninfo_from_mode(), but
+ * first clears the fb_screeninfo structure to 0.
+ */
+static void drm_fbconv_init_fb_var_screeninfo_from_mode(
+	struct fb_var_screeninfo *fb_var, const struct drm_display_mode *mode)
+{
+	memset(fb_var, 0, sizeof(*fb_var));
+	drm_fbconv_update_fb_var_screeninfo_from_mode(fb_var, mode);
+}
+
+// FIXME helpers from
+// "[PATCH v2 8/15] drm/fbconv: Add plane-state check and update"
+// by Thomas Zimmermann <tzimmermann@suse.de>
+static void drm_fbconv_update_fb_var_screeninfo_from_crtc_state(
+	struct fb_var_screeninfo *fb_var, struct drm_crtc_state *crtc_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+
+	drm_fbconv_update_fb_var_screeninfo_from_mode(fb_var, mode);
+}
+
+static int drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
+	struct fb_var_screeninfo *var, struct drm_framebuffer *fb)
+{
+	switch (fb->format[0].format) {
+	case DRM_FORMAT_C1:
+		var->bits_per_pixel = 1;
+		goto color_indexed;
+
+	case DRM_FORMAT_C2:
+		var->bits_per_pixel = 2;
+		goto color_indexed;
+
+	case DRM_FORMAT_C4:
+		var->bits_per_pixel = 4;
+		goto color_indexed;
+
+	case DRM_FORMAT_C8:
+		var->bits_per_pixel = 8;
+color_indexed:
+		var->red.offset = 0;
+		var->red.length = var->bits_per_pixel;
+		var->green.offset = 0;
+		var->green.length = var->bits_per_pixel;
+		var->blue.offset = 0;
+		var->blue.length = var->bits_per_pixel;
+		break;
+
+	case DRM_FORMAT_RGB565:				// FIXME Falcon only
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:	// FIXME Falcon only
+	case DRM_FORMAT_XRGB8888:			// FIXME Emulated
+		// FIXME Fall back to C8/RGB332 if !Falcon or pixclock too high
+		var->bits_per_pixel = 16;
+		var->red.offset = 11;
+		var->red.length = 5;
+		var->green.offset = 5;
+		var->green.length = 6;
+		var->blue.offset = 0;
+		var->blue.length = 5;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	var->red.msb_right = 0;
+	var->green.msb_right = 0;
+	var->blue.msb_right = 0;
+	var->transp.offset = 0;
+	var->transp.length = 0;
+	var->transp.msb_right = 0;
+	var->grayscale = 0;
+	var->nonstd = 0;
+
+	/* Our virtual screen covers all the graphics memory (sans some
+	 * trailing bytes). This allows for setting the scanout buffer's
+	 * address with fb_pan_display().
+	 */
+
+#if 0
+	// FIXME fb->pitches[0] is not const?
+	// FIXME hvga@XR24
+	// FIXME 320x480 virt 640x243 off 0,0 bpp 16 gray 0 red 11/5/0 green 5/6/0 blue 0/5/0 transp 0/0/0 nonstd 0 act 0x0 0x0mm accel_flags 0x0 pixclock 79441 margins 9/21/5/16 sync 50/2/0 vmode 0x0 rotate 0 colorspace 0x0
+	// FIXME falcon_decode_var:1417: virtual screen 640x480 too large
+	var->xres_virtual = fb->pitches[0] * 8 / var->bits_per_pixel;
+	var->yres_virtual = screen_len / fb->pitches[0];
+#else
+	var->xres_virtual = var->xres;
+	var->yres_virtual = var->yres;
+#endif
+	return 0;
+}
+
+// FIXME helpers from
+// "[PATCH v2 9/15] drm/fbconv: Mode-setting pipeline enable / disable"
+// by Thomas Zimmermann <tzimmermann@suse.de>
+static int drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
+	struct fb_var_screeninfo *fb_var, struct drm_simple_display_pipe *pipe)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_pipe(pipe);
+	struct drm_plane *primary = pipe->crtc.primary;
+
+	if (primary && primary->state && primary->state->fb)
+		return drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
+			fb_var, primary->state->fb);
+
+	fb_var->xres_virtual = fb_var->xres;
+	fb_var->yres_virtual = fb_var->yres;
+#if 0
+	// FIXME This is wrong! Bpp should be derived from fourcc
+	fb_var->bits_per_pixel = atari_drm->dev.mode_config.preferred_depth;
+	pr_info("%s:%u: using %u bpp (from preferred_depth)\n", __func__,
+		__LINE__, fb_var->bits_per_pixel);
+#else
+	fb_var->bits_per_pixel = atari_drm->next_bpp;
+#endif
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* atari_drm (simple) display pipe				      */
+
+/**
+ * atari_drm_pipe_mode_valid
+ *
+ * This callback is used to check if a specific mode is valid in the
+ * crtc used in this simple display pipe. This should be implemented
+ * if the display pipe has some sort of restriction in the modes
+ * it can display. For example, a given display pipe may be responsible
+ * to set a clock value. If the clock can not produce all the values
+ * for the available modes then this callback can be used to restrict
+ * the number of modes to only the ones that can be displayed. Another
+ * reason can be bandwidth mitigation: the memory port on the display
+ * controller can have bandwidth limitations not allowing pixel data
+ * to be fetched at any rate.
+ *
+ * This hook is used by the probe helpers to filter the mode list in
+ * drm_helper_probe_single_connector_modes(), and it is used by the
+ * atomic helpers to validate modes supplied by userspace in
+ * drm_atomic_helper_check_modeset().
+ *
+ * This function is optional.
+ *
+ * NOTE:
+ *
+ * Since this function is both called from the check phase of an atomic
+ * commit, and the mode validation in the probe paths it is not allowed
+ * to look at anything else but the passed-in mode, and validate it
+ * against configuration-invariant hardware constraints.
+ *
+ * RETURNS:
+ *
+ * drm_mode_status Enum
+ */
+static enum drm_mode_status
+atari_drm_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
+			  const struct drm_display_mode *mode)
+{
+	if (atari_drm_check_size(mode->hdisplay, mode->vdisplay, NULL) < 0)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
+/**
+ * atari_drm_pipe_mode_fixup:
+ *
+ * This callback is used to validate a mode. The parameter mode is the
+ * display mode that userspace requested, adjusted_mode is the mode the
+ * encoders need to be fed with. Note that this is the inverse semantics
+ * of the meaning for the &drm_encoder and &drm_bridge_funcs.mode_fixup
+ * vfunc. If the CRTC of the simple display pipe cannot support the
+ * requested conversion from mode to adjusted_mode it should reject the
+ * modeset.
+ *
+ * This function is optional.
+ *
+ * NOTE:
+ *
+ * This function is called in the check phase of atomic modesets, which
+ * can be aborted for any reason (including on userspace's request to
+ * just check whether a configuration would be possible). Atomic drivers
+ * MUST NOT touch any persistent state (hardware or software) or data
+ * structures except the passed in adjusted_mode parameter.
+ *
+ * Atomic drivers which need to inspect and adjust more state should
+ * instead use the @atomic_check callback, but note that they're not
+ * perfectly equivalent: @mode_valid is called from
+ * drm_atomic_helper_check_modeset(), but @atomic_check is called from
+ * drm_atomic_helper_check_planes(), because originally it was meant for
+ * plane update checks only.
+ *
+ * Also beware that userspace can request its own custom modes, neither
+ * core nor helpers filter modes to the list of probe modes reported by
+ * the GETCONNECTOR IOCTL and stored in &drm_connector.modes. To ensure
+ * that modes are filtered consistently put any CRTC constraints and
+ * limits checks into @mode_valid.
+ *
+ * RETURNS:
+ *
+ * True if an acceptable configuration is possible, false if the modeset
+ * operation should be rejected.
+ */
+static bool atari_drm_pipe_mode_fixup(struct drm_crtc *crtc,
+				      const struct drm_display_mode *mode,
+				      struct drm_display_mode *adjusted_mode)
+{
+	// FIXME
+	// Based on drm_fbconv_simple_display_pipe_mode_fixup() in
+	// "[PATCH v2 9/15] drm/fbconv: Mode-setting pipeline enable / disable"
+	// by Thomas Zimmermann <tzimmermann@suse.de>
+	struct drm_simple_display_pipe *pipe =
+		container_of(crtc, struct drm_simple_display_pipe, crtc);
+	struct fb_var_screeninfo var;
+	int ret;
+
+	drm_fbconv_init_fb_var_screeninfo_from_mode(&var, mode);
+
+	// FIXME This is wrong! Bpp should be derived from fourcc
+	ret = drm_fbconv_update_fb_var_screeninfo_from_simple_display_pipe(
+		&var, pipe);
+	if (ret)
+		return true;
+
+return true; // FIXME
+	ret = atafb_check_var(&var, &fb_info);
+	if (ret < 0)
+		return false;
+
+	drm_mode_update_from_fb_var_screeninfo(adjusted_mode, &var);
+
+	return true;
+}
+static int atari_drm_pipe_check(struct drm_simple_display_pipe *pipe,
+				struct drm_plane_state *plane_state,
+				struct drm_crtc_state *crtc_state)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_pipe(pipe);
+	struct drm_framebuffer *fb = plane_state->fb;
+
+	// FIXME
+	// Based on drm_fbconv_simple_display_pipe_check() in
+	// "[PATCH v2 8/15] drm/fbconv: Add plane-state check and update"
+	// by Thomas Zimmermann <tzimmermann@suse.de>
+	int ret;
+	struct fb_var_screeninfo var;
+
+	/*
+	 * CRTC check
+	 */
+
+	/* DRM porting notes: when fbcon takes over the console, it regularly
+	 * changes the display mode. Where's apparently no way to detect this
+	 * directly from fbcon itself. DRM's mode information might therefore
+	 * be out of data, after it takes over the display at a later time.
+	 * Here, we test the CRTC's current mode with the fbdev state. If they
+	 * do not match, we request a mode change from DRM. If you port an
+	 * fbdev driver to DRM, you can remove this code section, DRM will
+	 * be in full control of the display device and doesn't have to react
+	 * to changes from external sources.
+	 */
+
+	if (!crtc_state->mode_changed && crtc_state->adjusted_mode.clock) {
+		struct fb_videomode fb_mode, fb_var_mode;
+
+		drm_fbconv_init_fb_videomode_from_mode(
+			&fb_mode, &crtc_state->adjusted_mode);
+		fb_var_to_videomode(&fb_var_mode, &fb_info.var);
+		if (!fb_mode_is_equal(&fb_mode, &fb_var_mode))
+			crtc_state->mode_changed = true;
+	}
+
+	/*
+	 * Plane check
+	 */
+
+	if (!plane_state->crtc)
+		return 0;
+
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  1 << 16, 1 << 16,
+						  false, true);
+	if (ret < 0)
+		return ret;
+
+	if (!plane_state->visible || !fb)
+		return 0;
+
+	/* Virtual screen sizes are not supported.
+	 */
+
+	if (drm_rect_width(&plane_state->dst) != fb->width ||
+	    drm_rect_height(&plane_state->dst) != fb->height) {
+		DRM_ERROR("fbconv: virtual screen sizes not supported\n");
+		return -EINVAL;
+	}
+	if (plane_state->dst.x1 || plane_state->dst.y1) {
+		DRM_ERROR("fbconv: virtual screen offset not supported\n");
+		return -EINVAL;
+	}
+
+	/* Pixel formats have to be compatible with fbdev. This is
+	 * usually some variation of XRGB.
+	 */
+
+	if (!pipe->plane.state || !pipe->plane.state->fb ||
+	    pipe->plane.state->fb->format[0].format != fb->format[0].format) {
+		memcpy(&var, &fb_info.var, sizeof(var));
+		drm_fbconv_update_fb_var_screeninfo_from_crtc_state(
+			&var, crtc_state);
+		atari_drm->next_bpp = var.bits_per_pixel;
+		drm_fbconv_update_fb_var_screeninfo_from_framebuffer(&var, fb);
+		ret = atafb_check_var(&var, &fb_info);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void atari_drm_pipe_enable(struct drm_simple_display_pipe *pipe,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_plane_state *plane_state)
+{
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
+	struct atari_drm_device *atari_drm = atari_drm_from_pipe(pipe);
+	struct drm_shadow_plane_state *shadow_plane_state =
+		to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct fb_var_screeninfo var;
+	int ret;
+
+	drm_crtc_vblank_on(crtc);
+	f_vblank_enabled = 1;	// FIXME
+	// FIXME
+
+	// FIXME
+	// Based on drm_fbconv_simple_display_pipe_enable() in
+	// "[PATCH v2 9/15] drm/fbconv: Mode-setting pipeline enable / disable"
+	// by Thomas Zimmermann <tzimmermann@suse.de>
+
+	/* As this is atomic mode setting, any function call is not
+	 * allowed to fail. If it does, an additional test should be
+	 * added to simple_display_pipe_check().
+	 */
+
+	drm_fbconv_init_fb_var_screeninfo_from_mode(&var, mode);
+
+	if (plane_state && fb) {
+		ret = drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
+			&var, fb);
+		if (ret)
+			return;
+	} else {
+		var.xres_virtual = var.xres;
+		var.yres_virtual = var.yres;
+	}
+
+	fb_info.var = var;
+	atafb_set_par(&fb_info);
+	atari_drm_mode_set(atari_drm, &crtc_state->mode, fb);
+	atafb_blank(FB_BLANK_UNBLANK, &fb_info);
+
+	atari_drm_fb_blit_fullscreen(fb, &shadow_plane_state->data[0]);
+}
+
+static void atari_drm_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct drm_crtc *crtc = &pipe->crtc;
+
+	f_vblank_enabled = 0;	// FIXME
+	drm_crtc_vblank_off(crtc);
+	atafb_blank(FB_BLANK_POWERDOWN, &fb_info);
+}
+
+static void atari_drm_load_lut(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_color_lut *lut;
+	unsigned int i;
+
+	if (!crtc_state->gamma_lut || !crtc->enabled)
+		return;
+
+	lut = crtc_state->gamma_lut->data;
+
+	// FIXME hardcoded 256
+	for (i = 0; i < 256; i++)
+		fbhw->set_col_reg(i, lut[i].red, lut[i].green, lut[i].blue);
+}
+
+static void atari_drm_pipe_update(struct drm_simple_display_pipe *pipe,
+				  struct drm_plane_state *old_plane_state)
+{
+	struct atari_drm_device *atari_drm = atari_drm_from_pipe(pipe);
+	struct drm_plane_state *plane_state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state =
+		to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct fb_var_screeninfo var;
+	struct drm_rect rect;
+	int ret;
+
+	if (!fb) {
+		/* No framebuffer installed; blank display. */
+		atafb_blank(FB_BLANK_NORMAL, &fb_info);
+		return;
+	}
+
+	// FIXME
+	// Based on drm_fbconv_simple_display_pipe_enable() in
+	// "[PATCH v2 8/15] drm/fbconv: Add plane-state check and update"
+	// by Thomas Zimmermann <tzimmermann@suse.de>
+
+	/*
+	 * Plane update
+	 */
+
+	// FIXME Always true for xrgb8888-to-rgb332/rgb565?
+	if (atari_drm->bpp != drm_format_info_bpp(fb->format, 0) ||
+	    fb_info.var.xres_virtual != fb->width) {
+		/*
+		 * Pixel format changed, update fb_info accordingly
+		 */
+
+		var = fb_info.var;
+		ret = drm_fbconv_update_fb_var_screeninfo_from_framebuffer(
+			&var, fb);
+		if (ret)
+			return;
+
+		fb_info.var = var;
+		atafb_set_par(&fb_info);
+#if 1
+		atari_drm_mode_set(atari_drm, &crtc->mode, fb);
+#endif
+	}
+
+	// FIXME Called multiple times (fb_set_logocmap() uses fb_cmap.len = 16)
+	if (!old_plane_state->fb || /* first-time update */
+	    atari_drm->bpp != drm_format_info_bpp(fb->format, 0) ||
+	    crtc->state->color_mgmt_changed) {
+
+		/* DRM porting notes: Below we set the LUTs for palette and
+		 * gamma correction. This is required by some fbdev drivers,
+		 * such as nvidiafb and atyfb, which don't initialize the
+		 * table to pass-through the framebuffer values unchanged. This
+		 * is actually CRTC state, but the respective function
+		 * crtc_helper_mode_set_nofb() is only called when a CRTC
+		 * property changes, changes in color formats are not handled
+		 * there. When you're porting a fbdev driver to DRM, remove
+		 * the call. Gamma LUTs are CRTC properties and should be
+		 * handled there. Either remove gamma correction or set up
+		 * the respective CRTC properties for userspace.
+		 */
+		atari_drm_load_lut(crtc);
+	}
+
+	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state,
+					    &rect))
+		atari_drm_fb_blit_rect(fb, &shadow_plane_state->data[0], &rect);
+
+	// FIXME removing the block below triggers WARN_ON(new_crtc_state->event) in drivers/gpu/drm/drm_atomic_helper.c:2475 drm_atomic_helper_commit_hw_done
+	// FIXME I still see that warning when running modetest
+	if (crtc->state->event) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_simple_display_pipe_funcs atari_drm_pipe_funcs = {
+	.mode_valid = atari_drm_pipe_mode_valid,
+	.mode_fixup = atari_drm_pipe_mode_fixup,
+	.check	    = atari_drm_pipe_check,
+	.enable	    = atari_drm_pipe_enable,
+	.disable    = atari_drm_pipe_disable,
+	.update	    = atari_drm_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+};
+
+static const uint32_t atari_drm_formats[] = {
+	DRM_FORMAT_C1,		/* FIXME */
+	DRM_FORMAT_C2,		/* FIXME */
+	DRM_FORMAT_C4,		/* FIXME */
+	DRM_FORMAT_C8,		/* FIXME TT & Falcon only */
+	DRM_FORMAT_RGB565,	/* FIXME Falcon only */
+	DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN,	/* FIXME Falcon only */
+	DRM_FORMAT_XRGB8888,	/* FIXME Always needed? E.g. for modetest */
+};
+
+static const uint64_t atari_drm_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+static int atari_drm_pipe_init(struct atari_drm_device *atari_drm)
+{
+	int ret;
+
+	ret = drm_simple_display_pipe_init(&atari_drm->dev, &atari_drm->pipe,
+					   &atari_drm_pipe_funcs,
+					   atari_drm_formats,
+					   ARRAY_SIZE(atari_drm_formats),
+					   atari_drm_modifiers,
+					   &atari_drm->conn);
+	if (ret)
+		return ret;
+
+	// FIXME hardcoded 256
+	drm_mode_crtc_set_gamma_size(&atari_drm->pipe.crtc, 256);
+	drm_crtc_enable_color_mgmt(&atari_drm->pipe.crtc, 0, false, 256);
+
+	drm_plane_enable_fb_damage_clips(&atari_drm->pipe.plane);
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* atari_drm framebuffers & mode config				      */
+
+static struct drm_framebuffer*
+atari_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		    const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct drm_framebuffer *fb;
+
+	switch (mode_cmd->pixel_format) {
+	case DRM_FORMAT_C1:
+	case DRM_FORMAT_C2:
+	case DRM_FORMAT_C4:
+		break;
+
+	case DRM_FORMAT_C8:
+		// FIXME TT & Falcon only
+		break;
+
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN:
+		// FIXME Falcon only
+		break;
+
+	case DRM_FORMAT_XRGB8888:
+		// FIXME
+		break;
+
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (atari_drm_check_size(mode_cmd->width, mode_cmd->height, NULL) < 0)
+		return ERR_PTR(-EINVAL);
+
+	// FIXME allocate C1 and RGB565 in ST-RAM?
+	fb = drm_gem_fb_create_with_dirty(dev, file_priv, mode_cmd);
+	drm_WARN_ON_ONCE(dev, fb->pitches[0] > fb->width *
+			      drm_format_info_bpp(fb->format, 0) / 8);
+	return fb;
+}
+
+static const struct drm_mode_config_funcs atari_drm_mode_config_funcs = {
+	.fb_create = atari_drm_fb_create,
+	.atomic_check = drm_atomic_helper_check,	// FIXME
+	.atomic_commit = drm_atomic_helper_commit,	// FIXME
+};
+
+static int atari_drm_mode_config_init(struct atari_drm_device *atari_drm)
+{
+	struct drm_device *dev = &atari_drm->dev;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	ret = fbhw->config_init(atari_drm);
+	if (ret)
+		return ret;
+
+	dev->mode_config.prefer_shadow = 0;
+	// FIXME drm_mode_addfb2_ioctl() needs
+	// FIXME quirk_addfb_prefer_host_byte_order on big-endian
+	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
+	dev->mode_config.funcs = &atari_drm_mode_config_funcs;
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+
+DEFINE_DRM_GEM_FOPS(atari_drm_fops);
+
+static const struct drm_driver atari_drm_driver = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+
+	.name		 = DRIVER_NAME,
+	.desc		 = "Atari",
+	.date		 = "2020",
+	.major		 = 1,
+	.minor		 = 0,
+
+	.fops		 = &atari_drm_fops,
+	DRM_GEM_SHMEM_DRIVER_OPS,
+};
+
+static int __init atari_drm_probe(struct platform_device *pdev)
+{
+	struct atari_drm_device *atari_drm;
+	int pad, detected_mode, error;
+	struct drm_device *dev;
+	unsigned long mem_req;
+	char *option = NULL;
+	int ret;
+
+	if (fb_get_options("atafb", &option))
+		return -ENODEV;
+
+	ret = -ENOMEM;
+	atari_drm = devm_drm_dev_alloc(&pdev->dev, &atari_drm_driver,
+				       struct atari_drm_device, dev);
+	if (IS_ERR(atari_drm))
+		return PTR_ERR(atari_drm);
+
+	dev = &atari_drm->dev;
+
+	atafb_setup(option);
+	dev_dbg(&pdev->dev, "%s: start\n", __func__);
+
+	do {
+#ifdef ATAFB_EXT
+		if (external_addr) {
+			dev_dbg(&pdev->dev, "initializing external hw\n");
+			fbhw = &ext_switch;
+			atari_drm->defmode = DEFMODE_EXT;
+			break;
+		}
+#endif
+#ifdef ATAFB_TT
+		if (ATARIHW_PRESENT(TT_SHIFTER)) {
+			dev_dbg(&pdev->dev, "initializing TT hw\n");
+			fbhw = &tt_switch;
+			atari_drm->defmode = DEFMODE_TT;
+			break;
+		}
+#endif
+#ifdef ATAFB_FALCON
+		if (ATARIHW_PRESENT(VIDEL_SHIFTER)) {
+			dev_dbg(&pdev->dev, "initializing Falcon hw\n");
+			fbhw = &falcon_switch;
+			error = request_irq(IRQ_AUTO_4, falcon_vbl_switcher, 0,
+					    "framebuffer:modeswitch",
+					    &atari_drm->pipe.crtc);
+			if (error)
+				return error;
+			atari_drm->defmode = DEFMODE_F30;
+			break;
+		}
+#endif
+#ifdef ATAFB_STE
+		if (ATARIHW_PRESENT(STND_SHIFTER) ||
+		    ATARIHW_PRESENT(EXTD_SHIFTER)) {
+			dev_dbg(&pdev->dev, "initializing ST/E hw\n");
+			fbhw = &st_switch;
+			atari_drm->defmode = DEFMODE_STE;
+			break;
+		}
+		fbhw = &st_switch;
+		dev_warn(&pdev->dev,
+			 "Cannot determine video hardware; defaulting to ST(e)\n");
+#else /* ATAFB_STE */
+		/* no default driver included */
+		/* Nobody will ever see this message :-) */
+		panic("Cannot initialize video hardware");
+#endif
+	} while (0);
+
+	/* Multisync monitor capabilities */
+	/* Atari-TOS defaults if no boot option present */
+	if (fb_info.monspecs.hfmin == 0) {
+		fb_info.monspecs.hfmin = 31000;
+		fb_info.monspecs.hfmax = 33000;	// FIXME stmid fails with 32000
+		fb_info.monspecs.vfmin = 58;
+		fb_info.monspecs.vfmax = 62;
+	}
+
+	detected_mode = fbhw->detect();
+	check_default_par(detected_mode);
+#ifdef ATAFB_EXT
+	if (!external_addr) {
+#endif /* ATAFB_EXT */
+		mem_req = default_mem_req + ovsc_offset + ovsc_addlen;
 		mem_req = PAGE_ALIGN(mem_req) + PAGE_SIZE;
 		screen_base = atari_stram_alloc(mem_req, "atafb");
 		if (!screen_base)
@@ -3098,7 +4538,6 @@ static int __init atafb_probe(struct platform_device *pdev)
 	}
 #endif /* ATAFB_EXT */
 
-//	strcpy(fb_info.mode->name, "Atari Builtin ");
 	fb_info.fbops = &atafb_ops;
 	// try to set default (detected; requested) var
 	do_fb_set_var(&atafb_predefined[default_par - 1], 1);
@@ -3109,25 +4548,10 @@ static int __init atafb_probe(struct platform_device *pdev)
 	// so set sane var first, then call atafb_set_par
 	atafb_get_var(&fb_info.var, &fb_info);
 
-#ifdef ATAFB_FALCON
-	fb_info.pseudo_palette = current_par.hw.falcon.pseudo_palette;
-#endif
 	fb_info.flags = FBINFO_FLAG_DEFAULT;
 
-	if (!fb_find_mode(&fb_info.var, &fb_info, mode_option, atafb_modedb,
-			  NUM_TOTAL_MODES, &atafb_modedb[defmode],
-			  fb_info.var.bits_per_pixel)) {
-		return -EINVAL;
-	}
-
-	fb_videomode_to_modelist(atafb_modedb, NUM_TOTAL_MODES,
-				 &fb_info.modelist);
-
 	atafb_set_disp(&fb_info);
 
-	fb_alloc_cmap(&(fb_info.cmap), 1 << fb_info.var.bits_per_pixel, 0);
-
-
 	dev_info(&pdev->dev, "Determined %dx%d, depth %d\n", fb_info.var.xres,
 		 fb_info.var.yres, fb_info.var.bits_per_pixel);
 	if ((fb_info.var.xres != fb_info.var.xres_virtual) ||
@@ -3135,53 +4559,109 @@ static int __init atafb_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "   virtual %dx%d\n",
 			 fb_info.var.xres_virtual, fb_info.var.yres_virtual);
 
-	if (register_framebuffer(&fb_info) < 0) {
+	atari_drm->bpp = fb_info.var.bits_per_pixel;
+
+	ret = drm_vblank_init(&atari_drm->dev, 1);
+	if (ret)
+		goto fail;
+
+	ret = atari_drm_mode_config_init(atari_drm);
+	if (ret)
+		goto fail;
+
+	ret = atari_drm_conn_init(atari_drm);
+	if (ret < 0)
+		goto fail;
+
+	ret = atari_drm_pipe_init(atari_drm);
+	if (ret < 0)
+		goto fail;
+
+	drm_mode_config_reset(dev);
+
+	platform_set_drvdata(pdev, dev);
+	ret = drm_dev_register(dev, 0);
+	if (ret)
+		goto fail;
+
+	dev_info(&pdev->dev, "Atari DRM, using %dK of video memory\n",
+		 screen_len >> 10);
+
+	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+
+	/* TODO: This driver cannot be unloaded yet */
+	return 0;
+
+fail:
+	/* FIXME drmm_add_action_or_reset() */
+	/* FIXME cleanup non-external frame buffer */
 #ifdef ATAFB_EXT
-		if (external_addr) {
-			iounmap(external_screen_base);
-			external_addr = 0;
-		}
-		if (external_vgaiobase) {
-			iounmap((void*)external_vgaiobase);
-			external_vgaiobase = 0;
-		}
-#endif
-		return -EINVAL;
+	if (external_addr) {
+		iounmap(external_screen_base);
+		external_addr = 0;
+	}
+	if (external_vgaiobase) {
+		iounmap((void*)external_vgaiobase);
+		external_vgaiobase = 0;
 	}
+#endif
+	return ret;
+}
 
-	fb_info(&fb_info, "frame buffer device, using %dK of video memory\n",
-		screen_len >> 10);
+#if 0 // FIXME
+static int atari_drm_remove(struct platform_device *pdev)
+{
+	struct drm_device *dev = platform_get_drvdata(pdev);
+
+	drm_dev_unplug(dev);
+	drm_atomic_helper_shutdown(dev);
 
-	/* TODO: This driver cannot be unloaded yet */
 	return 0;
 }
+#endif
 
-static void atafb_shutdown(struct platform_device *pdev)
+static void atari_drm_shutdown(struct platform_device *pdev)
 {
 	/* Unblank before kexec */
 	if (fbhw->blank)
 		fbhw->blank(0);
 }
 
-static struct platform_driver atafb_driver = {
-	.shutdown	= atafb_shutdown,
+static struct platform_driver atari_drm_platform_driver = {
 	.driver	= {
-		.name	= "atafb",
+		.name = DRIVER_NAME,
 	},
+	// FIXME .probe = atari_drm_probe,
+	// FIXME .remove = atari_drm_remove,
+	.shutdown = atari_drm_shutdown,
 };
 
-static int __init atafb_init(void)
+static int __init atari_drm_init(void)
 {
 	struct platform_device *pdev;
 
 	if (!MACH_IS_ATARI)
 		return -ENODEV;
 
-	pdev = platform_device_register_simple("atafb", -1, NULL, 0);
+	// FIXME Should use the same platform device as atafb
+	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
-	return platform_driver_probe(&atafb_driver, atafb_probe);
+	// FIXME platform_driver_register
+	return platform_driver_probe(&atari_drm_platform_driver,
+				     atari_drm_probe);
+}
+
+module_init(atari_drm_init);
+
+#if 0 // FIXME
+static void __exit atari_drm_exit(void)
+{
+	platform_driver_unregister(&atari_drm_platform_driver);
 }
 
-device_initcall(atafb_init);
+module_exit(atari_drm_exit);
+#endif
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

