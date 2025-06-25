Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5C8AE841B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF0910E228;
	Wed, 25 Jun 2025 13:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T8G3EQ2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A0310E228
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:15:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD1575C58CD;
 Wed, 25 Jun 2025 13:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E63CC4CEEA;
 Wed, 25 Jun 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857344;
 bh=SiGw3L1l09If7nNhE9f4Y+p2QgxBKROpVzagF3G3/e8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8G3EQ2lHp0dptizyG+VkHleIgy2U2HrI03Mp+9B0Ly1FOVyKAKEIWB8SrfP73QUa
 W95cKl8fKomJpBnwXXEx+rBK2DPwHpRUVzmuzDX1kBGTSH2jWRO3DQZ/j3xtViMC7y
 521MyaoAcT+ot5gbhO8G0suED5IYvJ1R0UL84W9+cXGF3VXYMesdLlQ+rUOQPNn+Bt
 9fP9JbFcGuRXgPSN4f42mq1VrLbAU35JyU6Iijdwt8NyOuLarkxCxTHrmqlF5OnfBd
 FUH+srkfseX2UDq/qOHl581XlSo9WChsFpnbJj9qPtmQCvV89MP8tbGyuJ1AFnAicB
 E4dygtqlIjqMg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] fbdev: remove metronomefb
Date: Wed, 25 Jun 2025 15:12:23 +0200
Message-Id: <20250625131511.3366522-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625131511.3366522-1-arnd@kernel.org>
References: <20250625131511.3366522-1-arnd@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

This driver has not worked correctly for many years, and the only in-tree
reference to it is going away as well, so remove the driver now.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/fb/index.rst        |   1 -
 Documentation/fb/metronomefb.rst  |  38 --
 drivers/video/fbdev/Kconfig       |   9 -
 drivers/video/fbdev/Makefile      |   1 -
 drivers/video/fbdev/metronomefb.c | 724 ------------------------------
 include/video/metronomefb.h       |  57 ---
 6 files changed, 830 deletions(-)
 delete mode 100644 Documentation/fb/metronomefb.rst
 delete mode 100644 drivers/video/fbdev/metronomefb.c
 delete mode 100644 include/video/metronomefb.h

diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index 33e3c49f8856..4f3f3b60ba9f 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -22,7 +22,6 @@ Frame Buffer
     internals
     lxfb
     matroxfb
-    metronomefb
     modedb
     pvr2fb
     pxafb
diff --git a/Documentation/fb/metronomefb.rst b/Documentation/fb/metronomefb.rst
deleted file mode 100644
index 63e1d31a7e54..000000000000
--- a/Documentation/fb/metronomefb.rst
+++ /dev/null
@@ -1,38 +0,0 @@
-===========
-Metronomefb
-===========
-
-Maintained by Jaya Kumar <jayakumar.lkml.gmail.com>
-
-Last revised: Mar 10, 2008
-
-Metronomefb is a driver for the Metronome display controller. The controller
-is from E-Ink Corporation. It is intended to be used to drive the E-Ink
-Vizplex display media. E-Ink hosts some details of this controller and the
-display media here http://www.e-ink.com/products/matrix/metronome.html .
-
-Metronome is interfaced to the host CPU through the AMLCD interface. The
-host CPU generates the control information and the image in a framebuffer
-which is then delivered to the AMLCD interface by a host specific method.
-The display and error status are each pulled through individual GPIOs.
-
-Metronomefb is platform independent and depends on a board specific driver
-to do all physical IO work. Currently, an example is implemented for the
-PXA board used in the AM-200 EPD devkit. This example is am200epd.c
-
-Metronomefb requires waveform information which is delivered via the AMLCD
-interface to the metronome controller. The waveform information is expected to
-be delivered from userspace via the firmware class interface. The waveform file
-can be compressed as long as your udev or hotplug script is aware of the need
-to uncompress it before delivering it. metronomefb will ask for metronome.wbf
-which would typically go into /lib/firmware/metronome.wbf depending on your
-udev/hotplug setup. I have only tested with a single waveform file which was
-originally labeled 23P01201_60_WT0107_MTC. I do not know what it stands for.
-Caution should be exercised when manipulating the waveform as there may be
-a possibility that it could have some permanent effects on the display media.
-I neither have access to nor know exactly what the waveform does in terms of
-the physical media.
-
-Metronomefb uses the deferred IO interface so that it can provide a memory
-mappable frame buffer. It has been tested with tinyx (Xfbdev). It is known
-to work at this time with xeyes, xclock, xloadimage, xpdf.
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 55c6686f091e..c661b2136009 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1698,15 +1698,6 @@ config XEN_FBDEV_FRONTEND
 	  frame buffer driver.  It communicates with a back-end
 	  in another domain.
 
-config FB_METRONOME
-	tristate "E-Ink Metronome/8track controller support"
-	depends on FB
-	select FB_SYSMEM_HELPERS_DEFERRED
-	help
-	  This driver implements support for the E-Ink Metronome
-	  controller. The pre-release name for this device was 8track
-	  and could also have been called by some vendors as PVI-nnnn.
-
 config FB_MB862XX
 	tristate "Fujitsu MB862xx GDC support"
 	depends on FB
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index b3d12f977c06..3be6ee8e9136 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -91,7 +91,6 @@ obj-$(CONFIG_FB_PMAG_AA)	  += pmag-aa-fb.o
 obj-$(CONFIG_FB_PMAG_BA)	  += pmag-ba-fb.o
 obj-$(CONFIG_FB_PMAGB_B)	  += pmagb-b-fb.o
 obj-$(CONFIG_FB_MAXINE)		  += maxinefb.o
-obj-$(CONFIG_FB_METRONOME)        += metronomefb.o
 obj-$(CONFIG_FB_BROADSHEET)       += broadsheetfb.o
 obj-$(CONFIG_FB_S1D13XXX)	  += s1d13xxxfb.o
 obj-$(CONFIG_FB_SH7760)		  += sh7760fb.o
diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
deleted file mode 100644
index 6f0942c6e5f1..000000000000
--- a/drivers/video/fbdev/metronomefb.c
+++ /dev/null
@@ -1,724 +0,0 @@
-/*
- * linux/drivers/video/metronomefb.c -- FB driver for Metronome controller
- *
- * Copyright (C) 2008, Jaya Kumar
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License. See the file COPYING in the main directory of this archive for
- * more details.
- *
- * Layout is based on skeletonfb.c by James Simmons and Geert Uytterhoeven.
- *
- * This work was made possible by help and equipment support from E-Ink
- * Corporation. https://www.eink.com/
- *
- * This driver is written to be used with the Metronome display controller.
- * It is intended to be architecture independent. A board specific driver
- * must be used to perform all the physical IO interactions. An example
- * is provided as am200epd.c
- *
- */
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/vmalloc.h>
-#include <linux/delay.h>
-#include <linux/interrupt.h>
-#include <linux/fb.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/list.h>
-#include <linux/firmware.h>
-#include <linux/dma-mapping.h>
-#include <linux/uaccess.h>
-#include <linux/irq.h>
-
-#include <video/metronomefb.h>
-
-#include <linux/unaligned.h>
-
-/* Display specific information */
-#define DPY_W 832
-#define DPY_H 622
-
-static int user_wfm_size;
-
-/* frame differs from image. frame includes non-visible pixels */
-struct epd_frame {
-	int fw; /* frame width */
-	int fh; /* frame height */
-	u16 config[4];
-	int wfm_size;
-};
-
-static struct epd_frame epd_frame_table[] = {
-	{
-		.fw = 832,
-		.fh = 622,
-		.config = {
-			15 /* sdlew */
-			| 2 << 8 /* sdosz */
-			| 0 << 11 /* sdor */
-			| 0 << 12 /* sdces */
-			| 0 << 15, /* sdcer */
-			42 /* gdspl */
-			| 1 << 8 /* gdr1 */
-			| 1 << 9 /* sdshr */
-			| 0 << 15, /* gdspp */
-			18 /* gdspw */
-			| 0 << 15, /* dispc */
-			599 /* vdlc */
-			| 0 << 11 /* dsi */
-			| 0 << 12, /* dsic */
-		},
-		.wfm_size = 47001,
-	},
-	{
-		.fw = 1088,
-		.fh = 791,
-		.config = {
-			0x0104,
-			0x031f,
-			0x0088,
-			0x02ff,
-		},
-		.wfm_size = 46770,
-	},
-	{
-		.fw = 1200,
-		.fh = 842,
-		.config = {
-			0x0101,
-			0x030e,
-			0x0012,
-			0x0280,
-		},
-		.wfm_size = 46770,
-	},
-};
-
-static struct fb_fix_screeninfo metronomefb_fix = {
-	.id =		"metronomefb",
-	.type =		FB_TYPE_PACKED_PIXELS,
-	.visual =	FB_VISUAL_STATIC_PSEUDOCOLOR,
-	.xpanstep =	0,
-	.ypanstep =	0,
-	.ywrapstep =	0,
-	.line_length =	DPY_W,
-	.accel =	FB_ACCEL_NONE,
-};
-
-static struct fb_var_screeninfo metronomefb_var = {
-	.xres		= DPY_W,
-	.yres		= DPY_H,
-	.xres_virtual	= DPY_W,
-	.yres_virtual	= DPY_H,
-	.bits_per_pixel	= 8,
-	.grayscale	= 1,
-	.nonstd		= 1,
-	.red =		{ 4, 3, 0 },
-	.green =	{ 0, 0, 0 },
-	.blue =		{ 0, 0, 0 },
-	.transp =	{ 0, 0, 0 },
-};
-
-/* the waveform structure that is coming from userspace firmware */
-struct waveform_hdr {
-	u8 stuff[32];
-
-	u8 wmta[3];
-	u8 fvsn;
-
-	u8 luts;
-	u8 mc;
-	u8 trc;
-	u8 stuff3;
-
-	u8 endb;
-	u8 swtb;
-	u8 stuff2a[2];
-
-	u8 stuff2b[3];
-	u8 wfm_cs;
-} __attribute__ ((packed));
-
-/* main metronomefb functions */
-static u8 calc_cksum(int start, int end, u8 *mem)
-{
-	u8 tmp = 0;
-	int i;
-
-	for (i = start; i < end; i++)
-		tmp += mem[i];
-
-	return tmp;
-}
-
-static u16 calc_img_cksum(u16 *start, int length)
-{
-	u16 tmp = 0;
-
-	while (length--)
-		tmp += *start++;
-
-	return tmp;
-}
-
-/* here we decode the incoming waveform file and populate metromem */
-static int load_waveform(u8 *mem, size_t size, int m, int t,
-			 struct metronomefb_par *par)
-{
-	int tta;
-	int wmta;
-	int trn = 0;
-	int i;
-	unsigned char v;
-	u8 cksum;
-	int cksum_idx;
-	int wfm_idx, owfm_idx;
-	int mem_idx = 0;
-	struct waveform_hdr *wfm_hdr;
-	u8 *metromem = par->metromem_wfm;
-	struct device *dev = par->info->device;
-
-	if (user_wfm_size)
-		epd_frame_table[par->dt].wfm_size = user_wfm_size;
-
-	if (size != epd_frame_table[par->dt].wfm_size) {
-		dev_err(dev, "Error: unexpected size %zd != %d\n", size,
-					epd_frame_table[par->dt].wfm_size);
-		return -EINVAL;
-	}
-
-	wfm_hdr = (struct waveform_hdr *) mem;
-
-	if (wfm_hdr->fvsn != 1) {
-		dev_err(dev, "Error: bad fvsn %x\n", wfm_hdr->fvsn);
-		return -EINVAL;
-	}
-	if (wfm_hdr->luts != 0) {
-		dev_err(dev, "Error: bad luts %x\n", wfm_hdr->luts);
-		return -EINVAL;
-	}
-	cksum = calc_cksum(32, 47, mem);
-	if (cksum != wfm_hdr->wfm_cs) {
-		dev_err(dev, "Error: bad cksum %x != %x\n", cksum,
-					wfm_hdr->wfm_cs);
-		return -EINVAL;
-	}
-	wfm_hdr->mc += 1;
-	wfm_hdr->trc += 1;
-	for (i = 0; i < 5; i++) {
-		if (*(wfm_hdr->stuff2a + i) != 0) {
-			dev_err(dev, "Error: unexpected value in padding\n");
-			return -EINVAL;
-		}
-	}
-
-	/* calculating trn. trn is something used to index into
-	the waveform. presumably selecting the right one for the
-	desired temperature. it works out the offset of the first
-	v that exceeds the specified temperature */
-	if ((sizeof(*wfm_hdr) + wfm_hdr->trc) > size)
-		return -EINVAL;
-
-	for (i = sizeof(*wfm_hdr); i <= sizeof(*wfm_hdr) + wfm_hdr->trc; i++) {
-		if (mem[i] > t) {
-			trn = i - sizeof(*wfm_hdr) - 1;
-			break;
-		}
-	}
-
-	/* check temperature range table checksum */
-	cksum_idx = sizeof(*wfm_hdr) + wfm_hdr->trc + 1;
-	if (cksum_idx >= size)
-		return -EINVAL;
-	cksum = calc_cksum(sizeof(*wfm_hdr), cksum_idx, mem);
-	if (cksum != mem[cksum_idx]) {
-		dev_err(dev, "Error: bad temperature range table cksum"
-				" %x != %x\n", cksum, mem[cksum_idx]);
-		return -EINVAL;
-	}
-
-	/* check waveform mode table address checksum */
-	wmta = get_unaligned_le32(wfm_hdr->wmta) & 0x00FFFFFF;
-	cksum_idx = wmta + m*4 + 3;
-	if (cksum_idx >= size)
-		return -EINVAL;
-	cksum = calc_cksum(cksum_idx - 3, cksum_idx, mem);
-	if (cksum != mem[cksum_idx]) {
-		dev_err(dev, "Error: bad mode table address cksum"
-				" %x != %x\n", cksum, mem[cksum_idx]);
-		return -EINVAL;
-	}
-
-	/* check waveform temperature table address checksum */
-	tta = get_unaligned_le32(mem + wmta + m * 4) & 0x00FFFFFF;
-	cksum_idx = tta + trn*4 + 3;
-	if (cksum_idx >= size)
-		return -EINVAL;
-	cksum = calc_cksum(cksum_idx - 3, cksum_idx, mem);
-	if (cksum != mem[cksum_idx]) {
-		dev_err(dev, "Error: bad temperature table address cksum"
-			" %x != %x\n", cksum, mem[cksum_idx]);
-		return -EINVAL;
-	}
-
-	/* here we do the real work of putting the waveform into the
-	metromem buffer. this does runlength decoding of the waveform */
-	wfm_idx = get_unaligned_le32(mem + tta + trn * 4) & 0x00FFFFFF;
-	owfm_idx = wfm_idx;
-	if (wfm_idx >= size)
-		return -EINVAL;
-	while (wfm_idx < size) {
-		unsigned char rl;
-		v = mem[wfm_idx++];
-		if (v == wfm_hdr->swtb) {
-			while (((v = mem[wfm_idx++]) != wfm_hdr->swtb) &&
-				wfm_idx < size)
-				metromem[mem_idx++] = v;
-
-			continue;
-		}
-
-		if (v == wfm_hdr->endb)
-			break;
-
-		rl = mem[wfm_idx++];
-		for (i = 0; i <= rl; i++)
-			metromem[mem_idx++] = v;
-	}
-
-	cksum_idx = wfm_idx;
-	if (cksum_idx >= size)
-		return -EINVAL;
-	cksum = calc_cksum(owfm_idx, cksum_idx, mem);
-	if (cksum != mem[cksum_idx]) {
-		dev_err(dev, "Error: bad waveform data cksum"
-				" %x != %x\n", cksum, mem[cksum_idx]);
-		return -EINVAL;
-	}
-	par->frame_count = (mem_idx/64);
-
-	return 0;
-}
-
-static int metronome_display_cmd(struct metronomefb_par *par)
-{
-	int i;
-	u16 cs;
-	u16 opcode;
-	static u8 borderval;
-
-	/* setup display command
-	we can't immediately set the opcode since the controller
-	will try parse the command before we've set it all up
-	so we just set cs here and set the opcode at the end */
-
-	if (par->metromem_cmd->opcode == 0xCC40)
-		opcode = cs = 0xCC41;
-	else
-		opcode = cs = 0xCC40;
-
-	/* set the args ( 2 bytes ) for display */
-	i = 0;
-	par->metromem_cmd->args[i] = 	1 << 3 /* border update */
-					| ((borderval++ % 4) & 0x0F) << 4
-					| (par->frame_count - 1) << 8;
-	cs += par->metromem_cmd->args[i++];
-
-	/* the rest are 0 */
-	memset((u8 *) (par->metromem_cmd->args + i), 0, (32-i)*2);
-
-	par->metromem_cmd->csum = cs;
-	par->metromem_cmd->opcode = opcode; /* display cmd */
-
-	return par->board->met_wait_event_intr(par);
-}
-
-static int metronome_powerup_cmd(struct metronomefb_par *par)
-{
-	int i;
-	u16 cs;
-
-	/* setup power up command */
-	par->metromem_cmd->opcode = 0x1234; /* pwr up pseudo cmd */
-	cs = par->metromem_cmd->opcode;
-
-	/* set pwr1,2,3 to 1024 */
-	for (i = 0; i < 3; i++) {
-		par->metromem_cmd->args[i] = 1024;
-		cs += par->metromem_cmd->args[i];
-	}
-
-	/* the rest are 0 */
-	memset(&par->metromem_cmd->args[i], 0,
-	       (ARRAY_SIZE(par->metromem_cmd->args) - i) * 2);
-
-	par->metromem_cmd->csum = cs;
-
-	msleep(1);
-	par->board->set_rst(par, 1);
-
-	msleep(1);
-	par->board->set_stdby(par, 1);
-
-	return par->board->met_wait_event(par);
-}
-
-static int metronome_config_cmd(struct metronomefb_par *par)
-{
-	/* setup config command
-	we can't immediately set the opcode since the controller
-	will try parse the command before we've set it all up */
-
-	memcpy(par->metromem_cmd->args, epd_frame_table[par->dt].config,
-		sizeof(epd_frame_table[par->dt].config));
-	/* the rest are 0 */
-	memset(&par->metromem_cmd->args[4], 0,
-	       (ARRAY_SIZE(par->metromem_cmd->args) - 4) * 2);
-
-	par->metromem_cmd->csum = 0xCC10;
-	par->metromem_cmd->csum += calc_img_cksum(par->metromem_cmd->args, 4);
-	par->metromem_cmd->opcode = 0xCC10; /* config cmd */
-
-	return par->board->met_wait_event(par);
-}
-
-static int metronome_init_cmd(struct metronomefb_par *par)
-{
-	int i;
-	u16 cs;
-
-	/* setup init command
-	we can't immediately set the opcode since the controller
-	will try parse the command before we've set it all up
-	so we just set cs here and set the opcode at the end */
-
-	cs = 0xCC20;
-
-	/* set the args ( 2 bytes ) for init */
-	i = 0;
-	par->metromem_cmd->args[i] = 0;
-	cs += par->metromem_cmd->args[i++];
-
-	/* the rest are 0 */
-	memset((u8 *) (par->metromem_cmd->args + i), 0, (32-i)*2);
-
-	par->metromem_cmd->csum = cs;
-	par->metromem_cmd->opcode = 0xCC20; /* init cmd */
-
-	return par->board->met_wait_event(par);
-}
-
-static int metronome_init_regs(struct metronomefb_par *par)
-{
-	int res;
-
-	res = par->board->setup_io(par);
-	if (res)
-		return res;
-
-	res = metronome_powerup_cmd(par);
-	if (res)
-		return res;
-
-	res = metronome_config_cmd(par);
-	if (res)
-		return res;
-
-	res = metronome_init_cmd(par);
-
-	return res;
-}
-
-static void metronomefb_dpy_update(struct metronomefb_par *par)
-{
-	int fbsize;
-	u16 cksum;
-	unsigned char *buf = par->info->screen_buffer;
-
-	fbsize = par->info->fix.smem_len;
-	/* copy from vm to metromem */
-	memcpy(par->metromem_img, buf, fbsize);
-
-	cksum = calc_img_cksum((u16 *) par->metromem_img, fbsize/2);
-	*((u16 *)(par->metromem_img) + fbsize/2) = cksum;
-	metronome_display_cmd(par);
-}
-
-static u16 metronomefb_dpy_update_page(struct metronomefb_par *par, int index)
-{
-	int i;
-	u16 csum = 0;
-	u16 *buf = (u16 *)(par->info->screen_buffer + index);
-	u16 *img = (u16 *)(par->metromem_img + index);
-
-	/* swizzle from vm to metromem and recalc cksum at the same time*/
-	for (i = 0; i < PAGE_SIZE/2; i++) {
-		*(img + i) = (buf[i] << 5) & 0xE0E0;
-		csum += *(img + i);
-	}
-	return csum;
-}
-
-/* this is called back from the deferred io workqueue */
-static void metronomefb_dpy_deferred_io(struct fb_info *info, struct list_head *pagereflist)
-{
-	u16 cksum;
-	struct fb_deferred_io_pageref *pageref;
-	struct metronomefb_par *par = info->par;
-
-	/* walk the written page list and swizzle the data */
-	list_for_each_entry(pageref, pagereflist, list) {
-		unsigned long pgoffset = pageref->offset >> PAGE_SHIFT;
-		cksum = metronomefb_dpy_update_page(par, pageref->offset);
-		par->metromem_img_csum -= par->csum_table[pgoffset];
-		par->csum_table[pgoffset] = cksum;
-		par->metromem_img_csum += cksum;
-	}
-
-	metronome_display_cmd(par);
-}
-
-static void metronomefb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
-{
-	struct metronomefb_par *par = info->par;
-
-	metronomefb_dpy_update(par);
-}
-
-static void metronomefb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
-					  u32 width, u32 height)
-{
-	struct metronomefb_par *par = info->par;
-
-	metronomefb_dpy_update(par);
-}
-
-FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(metronomefb,
-				   metronomefb_defio_damage_range,
-				   metronomefb_defio_damage_area)
-
-static const struct fb_ops metronomefb_ops = {
-	.owner	= THIS_MODULE,
-	FB_DEFAULT_DEFERRED_OPS(metronomefb),
-};
-
-static struct fb_deferred_io metronomefb_defio = {
-	.delay			= HZ,
-	.sort_pagereflist	= true,
-	.deferred_io		= metronomefb_dpy_deferred_io,
-};
-
-static int metronomefb_probe(struct platform_device *dev)
-{
-	struct fb_info *info;
-	struct metronome_board *board;
-	int retval = -ENOMEM;
-	int videomemorysize;
-	unsigned char *videomemory;
-	struct metronomefb_par *par;
-	const struct firmware *fw_entry;
-	int i;
-	int panel_type;
-	int fw, fh;
-	int epd_dt_index;
-
-	/* pick up board specific routines */
-	board = dev->dev.platform_data;
-	if (!board)
-		return -EINVAL;
-
-	/* try to count device specific driver, if can't, platform recalls */
-	if (!try_module_get(board->owner))
-		return -ENODEV;
-
-	info = framebuffer_alloc(sizeof(struct metronomefb_par), &dev->dev);
-	if (!info)
-		goto err;
-
-	/* we have two blocks of memory.
-	info->screen_buffer which is vm, and is the fb used by apps.
-	par->metromem which is physically contiguous memory and
-	contains the display controller commands, waveform,
-	processed image data and padding. this is the data pulled
-	by the device's LCD controller and pushed to Metronome.
-	the metromem memory is allocated by the board driver and
-	is provided to us */
-
-	panel_type = board->get_panel_type();
-	switch (panel_type) {
-	case 6:
-		epd_dt_index = 0;
-		break;
-	case 8:
-		epd_dt_index = 1;
-		break;
-	case 97:
-		epd_dt_index = 2;
-		break;
-	default:
-		dev_err(&dev->dev, "Unexpected panel type. Defaulting to 6\n");
-		epd_dt_index = 0;
-		break;
-	}
-
-	fw = epd_frame_table[epd_dt_index].fw;
-	fh = epd_frame_table[epd_dt_index].fh;
-
-	/* we need to add a spare page because our csum caching scheme walks
-	 * to the end of the page */
-	videomemorysize = PAGE_SIZE + (fw * fh);
-	videomemory = vzalloc(videomemorysize);
-	if (!videomemory)
-		goto err_fb_rel;
-
-	info->screen_buffer = videomemory;
-	info->fbops = &metronomefb_ops;
-
-	metronomefb_fix.line_length = fw;
-	metronomefb_var.xres = fw;
-	metronomefb_var.yres = fh;
-	metronomefb_var.xres_virtual = fw;
-	metronomefb_var.yres_virtual = fh;
-	info->var = metronomefb_var;
-	info->fix = metronomefb_fix;
-	info->fix.smem_len = videomemorysize;
-	par = info->par;
-	par->info = info;
-	par->board = board;
-	par->dt = epd_dt_index;
-	init_waitqueue_head(&par->waitq);
-
-	/* this table caches per page csum values. */
-	par->csum_table = vmalloc(videomemorysize/PAGE_SIZE);
-	if (!par->csum_table)
-		goto err_vfree;
-
-	/* the physical framebuffer that we use is setup by
-	 * the platform device driver. It will provide us
-	 * with cmd, wfm and image memory in a contiguous area. */
-	retval = board->setup_fb(par);
-	if (retval) {
-		dev_err(&dev->dev, "Failed to setup fb\n");
-		goto err_csum_table;
-	}
-
-	/* after this point we should have a framebuffer */
-	if ((!par->metromem_wfm) ||  (!par->metromem_img) ||
-		(!par->metromem_dma)) {
-		dev_err(&dev->dev, "fb access failure\n");
-		retval = -EINVAL;
-		goto err_csum_table;
-	}
-
-	info->fix.smem_start = par->metromem_dma;
-
-	/* load the waveform in. assume mode 3, temp 31 for now
-		a) request the waveform file from userspace
-		b) process waveform and decode into metromem */
-	retval = request_firmware(&fw_entry, "metronome.wbf", &dev->dev);
-	if (retval < 0) {
-		dev_err(&dev->dev, "Failed to get waveform\n");
-		goto err_csum_table;
-	}
-
-	retval = load_waveform((u8 *) fw_entry->data, fw_entry->size, 3, 31,
-				par);
-	release_firmware(fw_entry);
-	if (retval < 0) {
-		dev_err(&dev->dev, "Failed processing waveform\n");
-		goto err_csum_table;
-	}
-
-	retval = board->setup_irq(info);
-	if (retval)
-		goto err_csum_table;
-
-	retval = metronome_init_regs(par);
-	if (retval < 0)
-		goto err_free_irq;
-
-	info->flags = FBINFO_VIRTFB;
-
-	info->fbdefio = &metronomefb_defio;
-	fb_deferred_io_init(info);
-
-	retval = fb_alloc_cmap(&info->cmap, 8, 0);
-	if (retval < 0) {
-		dev_err(&dev->dev, "Failed to allocate colormap\n");
-		goto err_free_irq;
-	}
-
-	/* set cmap */
-	for (i = 0; i < 8; i++)
-		info->cmap.red[i] = (((2*i)+1)*(0xFFFF))/16;
-	memcpy(info->cmap.green, info->cmap.red, sizeof(u16)*8);
-	memcpy(info->cmap.blue, info->cmap.red, sizeof(u16)*8);
-
-	retval = register_framebuffer(info);
-	if (retval < 0)
-		goto err_cmap;
-
-	platform_set_drvdata(dev, info);
-
-	dev_dbg(&dev->dev,
-		"fb%d: Metronome frame buffer device, using %dK of video"
-		" memory\n", info->node, videomemorysize >> 10);
-
-	return 0;
-
-err_cmap:
-	fb_dealloc_cmap(&info->cmap);
-err_free_irq:
-	board->cleanup(par);
-err_csum_table:
-	vfree(par->csum_table);
-err_vfree:
-	vfree(videomemory);
-err_fb_rel:
-	framebuffer_release(info);
-err:
-	module_put(board->owner);
-	return retval;
-}
-
-static void metronomefb_remove(struct platform_device *dev)
-{
-	struct fb_info *info = platform_get_drvdata(dev);
-
-	if (info) {
-		struct metronomefb_par *par = info->par;
-
-		unregister_framebuffer(info);
-		fb_deferred_io_cleanup(info);
-		fb_dealloc_cmap(&info->cmap);
-		par->board->cleanup(par);
-		vfree(par->csum_table);
-		vfree(info->screen_buffer);
-		module_put(par->board->owner);
-		dev_dbg(&dev->dev, "calling release\n");
-		framebuffer_release(info);
-	}
-}
-
-static struct platform_driver metronomefb_driver = {
-	.probe	= metronomefb_probe,
-	.remove	= metronomefb_remove,
-	.driver	= {
-		.name	= "metronomefb",
-	},
-};
-module_platform_driver(metronomefb_driver);
-
-module_param(user_wfm_size, uint, 0);
-MODULE_PARM_DESC(user_wfm_size, "Set custom waveform size");
-
-MODULE_DESCRIPTION("fbdev driver for Metronome controller");
-MODULE_AUTHOR("Jaya Kumar");
-MODULE_LICENSE("GPL");
-
-MODULE_FIRMWARE("metronome.wbf");
diff --git a/include/video/metronomefb.h b/include/video/metronomefb.h
deleted file mode 100644
index 9863f4b6d418..000000000000
--- a/include/video/metronomefb.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * metronomefb.h - definitions for the metronome framebuffer driver
- *
- * Copyright (C) 2008 by Jaya Kumar
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License. See the file COPYING in the main directory of this archive for
- * more details.
- *
- */
-
-#ifndef _LINUX_METRONOMEFB_H_
-#define _LINUX_METRONOMEFB_H_
-
-/* command structure used by metronome controller */
-struct metromem_cmd {
-	u16 opcode;
-	u16 args[((64-2)/2)];
-	u16 csum;
-};
-
-/* struct used by metronome. board specific stuff comes from *board */
-struct metronomefb_par {
-	struct metromem_cmd *metromem_cmd;
-	unsigned char *metromem_wfm;
-	unsigned char *metromem_img;
-	u16 *metromem_img_csum;
-	u16 *csum_table;
-	dma_addr_t metromem_dma;
-	struct fb_info *info;
-	struct metronome_board *board;
-	wait_queue_head_t waitq;
-	u8 frame_count;
-	int extra_size;
-	int dt;
-};
-
-/* board specific routines and data */
-struct metronome_board {
-	struct module *owner; /* the platform device */
-	void (*set_rst)(struct metronomefb_par *, int);
-	void (*set_stdby)(struct metronomefb_par *, int);
-	void (*cleanup)(struct metronomefb_par *);
-	int (*met_wait_event)(struct metronomefb_par *);
-	int (*met_wait_event_intr)(struct metronomefb_par *);
-	int (*setup_irq)(struct fb_info *);
-	int (*setup_fb)(struct metronomefb_par *);
-	int (*setup_io)(struct metronomefb_par *);
-	int (*get_panel_type)(void);
-	unsigned char *metromem;
-	int fw;
-	int fh;
-	int wfm_size;
-	struct fb_info *host_fbinfo; /* the host LCD controller's fbi */
-};
-
-#endif
-- 
2.39.5

