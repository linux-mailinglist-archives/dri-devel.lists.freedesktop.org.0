Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94958772AD
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816131122AC;
	Sat,  9 Mar 2024 18:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XhCRqoA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F501122A8
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF9B860ABB;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE6DC43601;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008148;
 bh=m9rDGJG3yT0hInpV7CP8HSKCj+Qqpk8lQAChvTHQ+JI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=XhCRqoA1LUAdAsPrelPfBQKSairM63iEyzo/2MnuJMeI1JHoXH6nMw8oEEIHQ/syI
 v4vLygGU8cGtoOkHJHokSSl4Il2nyP7hd5QW5CitlrjA8h0CMiZxuhR4iONO7B6Bc5
 XHfgqjiOTrE6BIvC3qpJn4h89nj3vxKxNyOZH/N5kkFHI2jyBKKf8mdbr+YS6t8HQb
 SSBjC6LTMA/rwxiQwzLvvMAYm6zJS0r92d6oYi2gQhv5iLzXCKWM3bTJVowhsQdWPP
 sEQK+rahsrpcdtkCA1EOg2nfQwp2Xd/eXpjQMiWPdhjUdp+/4M73Y/p0ftL9HGCjWW
 +VsFEKtdE8RsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A187EC54E63;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:26 +0100
Subject: [PATCH v2 05/28] sparc32: Drop sun specific power management drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-5-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=8732;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=xfye2ufSuL0q3FGRI3G6gKy5PSSX4RF61bEbgiVwBO8=; =?utf-8?q?b=3D/u2Vf5aiwBMX?=
 =?utf-8?q?tpyvGyUoEm7qRPdOrPBd/CSU00cO28yLEKxrUTuJzRxxHNZp85vOc/+aOenx79R2?=
 udWx8gu8B3xzaHXB7DQ7zqAbNkE0+WQLJ3zD335/prJJc7YcbIrd
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Drop the two sun specific apc and pmc drivers.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig         |   7 --
 arch/sparc/kernel/Makefile |   1 -
 arch/sparc/kernel/apc.c    | 196 ---------------------------------------------
 arch/sparc/kernel/pmc.c    | 100 -----------------------
 4 files changed, 304 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index df88ad5df470..23cdf1959991 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -320,13 +320,6 @@ config CMDLINE
 
 	  NOTE: This option WILL override the PROM bootargs setting!
 
-config SUN_PM
-	bool
-	default y if SPARC32
-	help
-	  Enable power management and CPU standby features on supported
-	  SPARC platforms.
-
 config SERIAL_CONSOLE
 	bool
 	depends on SPARC32
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index d3a0e0ebcfe7..1a942546dd00 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -83,7 +83,6 @@ obj-$(CONFIG_SPARC32_SMP) += sun4m_smp.o sun4d_smp.o leon_smp.o
 obj-$(CONFIG_SPARC64_SMP) += hvtramp.o
 
 obj-y                     += auxio_$(BITS).o
-obj-$(CONFIG_SUN_PM)      += apc.o pmc.o
 
 obj-y                     += termios.o
 
diff --git a/arch/sparc/kernel/apc.c b/arch/sparc/kernel/apc.c
deleted file mode 100644
index d44725d37e30..000000000000
--- a/arch/sparc/kernel/apc.c
+++ /dev/null
@@ -1,196 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* apc - Driver implementation for power management functions
- * of Aurora Personality Chip (APC) on SPARCstation-4/5 and
- * derivatives.
- *
- * Copyright (c) 2002 Eric Brower (ebrower@usa.net)
- */
-
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/miscdevice.h>
-#include <linux/pm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-
-#include <asm/io.h>
-#include <asm/oplib.h>
-#include <linux/uaccess.h>
-#include <asm/auxio.h>
-#include <asm/apc.h>
-#include <asm/processor.h>
-
-/* Debugging
- * 
- * #define APC_DEBUG_LED
- */
-
-#define APC_MINOR	MISC_DYNAMIC_MINOR
-#define APC_OBPNAME	"power-management"
-#define APC_DEVNAME "apc"
-
-static u8 __iomem *regs;
-static int apc_no_idle = 0;
-
-#define apc_readb(offs)		(sbus_readb(regs+offs))
-#define apc_writeb(val, offs) 	(sbus_writeb(val, regs+offs))
-
-/* Specify "apc=noidle" on the kernel command line to 
- * disable APC CPU standby support.  Certain prototype
- * systems (SPARCstation-Fox) do not play well with APC
- * CPU idle, so disable this if your system has APC and 
- * crashes randomly.
- */
-static int __init apc_setup(char *str) 
-{
-	if(!strncmp(str, "noidle", strlen("noidle"))) {
-		apc_no_idle = 1;
-		return 1;
-	}
-	return 0;
-}
-__setup("apc=", apc_setup);
-
-/* 
- * CPU idle callback function
- * See .../arch/sparc/kernel/process.c
- */
-static void apc_swift_idle(void)
-{
-#ifdef APC_DEBUG_LED
-	set_auxio(0x00, AUXIO_LED); 
-#endif
-
-	apc_writeb(apc_readb(APC_IDLE_REG) | APC_IDLE_ON, APC_IDLE_REG);
-
-#ifdef APC_DEBUG_LED
-	set_auxio(AUXIO_LED, 0x00); 
-#endif
-} 
-
-static inline void apc_free(struct platform_device *op)
-{
-	of_iounmap(&op->resource[0], regs, resource_size(&op->resource[0]));
-}
-
-static int apc_open(struct inode *inode, struct file *f)
-{
-	return 0;
-}
-
-static int apc_release(struct inode *inode, struct file *f)
-{
-	return 0;
-}
-
-static long apc_ioctl(struct file *f, unsigned int cmd, unsigned long __arg)
-{
-	__u8 inarg, __user *arg = (__u8 __user *) __arg;
-
-	switch (cmd) {
-	case APCIOCGFANCTL:
-		if (put_user(apc_readb(APC_FANCTL_REG) & APC_REGMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCGCPWR:
-		if (put_user(apc_readb(APC_CPOWER_REG) & APC_REGMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCGBPORT:
-		if (put_user(apc_readb(APC_BPORT_REG) & APC_BPMASK, arg))
-			return -EFAULT;
-		break;
-
-	case APCIOCSFANCTL:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_REGMASK, APC_FANCTL_REG);
-		break;
-
-	case APCIOCSCPWR:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_REGMASK, APC_CPOWER_REG);
-		break;
-
-	case APCIOCSBPORT:
-		if (get_user(inarg, arg))
-			return -EFAULT;
-		apc_writeb(inarg & APC_BPMASK, APC_BPORT_REG);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static const struct file_operations apc_fops = {
-	.unlocked_ioctl =	apc_ioctl,
-	.open =			apc_open,
-	.release =		apc_release,
-	.llseek =		noop_llseek,
-};
-
-static struct miscdevice apc_miscdev = { APC_MINOR, APC_DEVNAME, &apc_fops };
-
-static int apc_probe(struct platform_device *op)
-{
-	int err;
-
-	regs = of_ioremap(&op->resource[0], 0,
-			  resource_size(&op->resource[0]), APC_OBPNAME);
-	if (!regs) {
-		printk(KERN_ERR "%s: unable to map registers\n", APC_DEVNAME);
-		return -ENODEV;
-	}
-
-	err = misc_register(&apc_miscdev);
-	if (err) {
-		printk(KERN_ERR "%s: unable to register device\n", APC_DEVNAME);
-		apc_free(op);
-		return -ENODEV;
-	}
-
-	/* Assign power management IDLE handler */
-	if (!apc_no_idle)
-		sparc_idle = apc_swift_idle;
-
-	printk(KERN_INFO "%s: power management initialized%s\n", 
-	       APC_DEVNAME, apc_no_idle ? " (CPU idle disabled)" : "");
-
-	return 0;
-}
-
-static const struct of_device_id apc_match[] = {
-	{
-		.name = APC_OBPNAME,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, apc_match);
-
-static struct platform_driver apc_driver = {
-	.driver = {
-		.name = "apc",
-		.of_match_table = apc_match,
-	},
-	.probe		= apc_probe,
-};
-
-static int __init apc_init(void)
-{
-	return platform_driver_register(&apc_driver);
-}
-
-/* This driver is not critical to the boot process
- * and is easiest to ioremap when SBus is already
- * initialized, so we install ourselves thusly:
- */
-__initcall(apc_init);
diff --git a/arch/sparc/kernel/pmc.c b/arch/sparc/kernel/pmc.c
deleted file mode 100644
index 69a0206e56f0..000000000000
--- a/arch/sparc/kernel/pmc.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* pmc - Driver implementation for power management functions
- * of Power Management Controller (PMC) on SPARCstation-Voyager.
- *
- * Copyright (c) 2002 Eric Brower (ebrower@usa.net)
- */
-
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/errno.h>
-#include <linux/init.h>
-#include <linux/pm.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/module.h>
-
-#include <asm/io.h>
-#include <asm/oplib.h>
-#include <linux/uaccess.h>
-#include <asm/auxio.h>
-#include <asm/processor.h>
-
-/* Debug
- *
- * #define PMC_DEBUG_LED
- * #define PMC_NO_IDLE
- */
-
-#define PMC_OBPNAME	"SUNW,pmc"
-#define PMC_DEVNAME	"pmc"
-
-#define PMC_IDLE_REG	0x00
-#define PMC_IDLE_ON	0x01
-
-static u8 __iomem *regs;
-
-#define pmc_readb(offs)		(sbus_readb(regs+offs))
-#define pmc_writeb(val, offs)	(sbus_writeb(val, regs+offs))
-
-/*
- * CPU idle callback function
- * See .../arch/sparc/kernel/process.c
- */
-static void pmc_swift_idle(void)
-{
-#ifdef PMC_DEBUG_LED
-	set_auxio(0x00, AUXIO_LED);
-#endif
-
-	pmc_writeb(pmc_readb(PMC_IDLE_REG) | PMC_IDLE_ON, PMC_IDLE_REG);
-
-#ifdef PMC_DEBUG_LED
-	set_auxio(AUXIO_LED, 0x00);
-#endif
-}
-
-static int pmc_probe(struct platform_device *op)
-{
-	regs = of_ioremap(&op->resource[0], 0,
-			  resource_size(&op->resource[0]), PMC_OBPNAME);
-	if (!regs) {
-		printk(KERN_ERR "%s: unable to map registers\n", PMC_DEVNAME);
-		return -ENODEV;
-	}
-
-#ifndef PMC_NO_IDLE
-	/* Assign power management IDLE handler */
-	sparc_idle = pmc_swift_idle;
-#endif
-
-	printk(KERN_INFO "%s: power management initialized\n", PMC_DEVNAME);
-	return 0;
-}
-
-static const struct of_device_id pmc_match[] = {
-	{
-		.name = PMC_OBPNAME,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(of, pmc_match);
-
-static struct platform_driver pmc_driver = {
-	.driver = {
-		.name = "pmc",
-		.of_match_table = pmc_match,
-	},
-	.probe		= pmc_probe,
-};
-
-static int __init pmc_init(void)
-{
-	return platform_driver_register(&pmc_driver);
-}
-
-/* This driver is not critical to the boot process
- * and is easiest to ioremap when SBus is already
- * initialized, so we install ourselves thusly:
- */
-__initcall(pmc_init);

-- 
2.34.1

