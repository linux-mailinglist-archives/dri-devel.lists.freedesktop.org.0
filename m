Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79E8772C0
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F091122B7;
	Sat,  9 Mar 2024 18:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OdQ3HAP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA081122AA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 41003CE0224;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD08EC433B2;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008148;
 bh=lY2Ipf3Tzw0Bxc3mcuYdmgC6i5v5g85xug+O6Qs1EbY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=OdQ3HAP4WNCN6aUrM2v0E9ql4o1O4d8MjB8XOLxLliRCXX00tomWz6dDCciPszrbA
 ZTYrhaqikGereJ2geK06yE3aTytJqTob0tvVCRXXT5bZwHDyEQy7vG7CptUxwsZJaO
 9KYnpH/Ng82fJTPOUvBvz6owNdBW0YvhcnwKELpqYxd7ZouKKtm51OpqBCdbslzQc2
 kWN1DPRTGCe/Xe4dQRMvMiDg7k7oSSUOLaUIex2hI4wRyUzYWry2qbucpsOY+SxYNQ
 94WSNN3ouc4AgeSrSJ9KlfjAxMztVJMyJa9huUqP1Qlu2chHmflo5uKE6+FY1HXeLn
 5O/KNlswyx3gQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 94455C54E60;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:25 +0100
Subject: [PATCH v2 04/28] sparc32: Drop sun4m specific led driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-4-f09912574d2c@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=5309;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=nHENULW1+SgZ2NAJYTIx7b3r6yWENGwntF0/duScqoA=; =?utf-8?q?b=3DMVo5ZgcJhY4Y?=
 =?utf-8?q?4cSp49zv0wI9dUXSZtJ5ZAEpC5OMSce8SiSeydzoONsM4oihJmOtWsAELu8fhm/X?=
 RKxTjW5FA/woDaxqzqlecuG12rWBBEbCAHT+Gfy4UfNBGLXL+zhd
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

The led driver is only relevant for the sun4m machines.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig         |   9 ---
 arch/sparc/kernel/Makefile |   1 -
 arch/sparc/kernel/led.c    | 146 ---------------------------------------------
 3 files changed, 156 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 278452f22f75..df88ad5df470 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -327,15 +327,6 @@ config SUN_PM
 	  Enable power management and CPU standby features on supported
 	  SPARC platforms.
 
-config SPARC_LED
-	tristate "Sun4m LED driver"
-	depends on SPARC32
-	help
-	  This driver toggles the front-panel LED on sun4m systems
-	  in a user-specifiable manner.  Its state can be probed
-	  by reading /proc/led and its blinking mode can be changed
-	  via writes to /proc/led
-
 config SERIAL_CONSOLE
 	bool
 	depends on SPARC32
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 58ea4ef9b622..d3a0e0ebcfe7 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -89,7 +89,6 @@ obj-y                     += termios.o
 
 obj-$(CONFIG_MODULES)     += module.o
 obj-$(CONFIG_MODULES)     += sparc_ksyms.o
-obj-$(CONFIG_SPARC_LED)   += led.o
 obj-$(CONFIG_KGDB)        += kgdb_$(BITS).o
 
 obj-$(CONFIG_DYNAMIC_FTRACE) += ftrace.o
diff --git a/arch/sparc/kernel/led.c b/arch/sparc/kernel/led.c
deleted file mode 100644
index ab657b359789..000000000000
--- a/arch/sparc/kernel/led.c
+++ /dev/null
@@ -1,146 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/jiffies.h>
-#include <linux/timer.h>
-#include <linux/uaccess.h>
-#include <linux/sched/loadavg.h>
-
-#include <asm/auxio.h>
-
-#define LED_MAX_LENGTH 8 /* maximum chars written to proc file */
-
-static inline void led_toggle(void)
-{
-	unsigned char val = get_auxio();
-	unsigned char on, off;
-
-	if (val & AUXIO_LED) {
-		on = 0;
-		off = AUXIO_LED;
-	} else {
-		on = AUXIO_LED;
-		off = 0;
-	}
-
-	set_auxio(on, off);
-}
-
-static struct timer_list led_blink_timer;
-static unsigned long led_blink_timer_timeout;
-
-static void led_blink(struct timer_list *unused)
-{
-	unsigned long timeout = led_blink_timer_timeout;
-
-	led_toggle();
-
-	/* reschedule */
-	if (!timeout) { /* blink according to load */
-		led_blink_timer.expires = jiffies +
-			((1 + (avenrun[0] >> FSHIFT)) * HZ);
-	} else { /* blink at user specified interval */
-		led_blink_timer.expires = jiffies + (timeout * HZ);
-	}
-	add_timer(&led_blink_timer);
-}
-
-#ifdef CONFIG_PROC_FS
-static int led_proc_show(struct seq_file *m, void *v)
-{
-	if (get_auxio() & AUXIO_LED)
-		seq_puts(m, "on\n");
-	else
-		seq_puts(m, "off\n");
-	return 0;
-}
-
-static int led_proc_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, led_proc_show, NULL);
-}
-
-static ssize_t led_proc_write(struct file *file, const char __user *buffer,
-			      size_t count, loff_t *ppos)
-{
-	char *buf = NULL;
-
-	if (count > LED_MAX_LENGTH)
-		count = LED_MAX_LENGTH;
-
-	buf = memdup_user_nul(buffer, count);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	/* work around \n when echo'ing into proc */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
-
-	/* before we change anything we want to stop any running timers,
-	 * otherwise calls such as on will have no persistent effect
-	 */
-	del_timer_sync(&led_blink_timer);
-
-	if (!strcmp(buf, "on")) {
-		auxio_set_led(AUXIO_LED_ON);
-	} else if (!strcmp(buf, "toggle")) {
-		led_toggle();
-	} else if ((*buf > '0') && (*buf <= '9')) {
-		led_blink_timer_timeout = simple_strtoul(buf, NULL, 10);
-		led_blink(&led_blink_timer);
-	} else if (!strcmp(buf, "load")) {
-		led_blink_timer_timeout = 0;
-		led_blink(&led_blink_timer);
-	} else {
-		auxio_set_led(AUXIO_LED_OFF);
-	}
-
-	kfree(buf);
-
-	return count;
-}
-
-static const struct proc_ops led_proc_ops = {
-	.proc_open	= led_proc_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
-	.proc_release	= single_release,
-	.proc_write	= led_proc_write,
-};
-#endif
-
-#define LED_VERSION	"0.1"
-
-static int __init led_init(void)
-{
-	timer_setup(&led_blink_timer, led_blink, 0);
-
-#ifdef CONFIG_PROC_FS
-	if (!proc_create("led", 0, NULL, &led_proc_ops))
-		return -ENOMEM;
-#endif
-	printk(KERN_INFO
-	       "led: version %s, Lars Kotthoff <metalhead@metalhead.ws>\n",
-	       LED_VERSION);
-
-	return 0;
-}
-
-static void __exit led_exit(void)
-{
-	remove_proc_entry("led", NULL);
-	del_timer_sync(&led_blink_timer);
-}
-
-module_init(led_init);
-module_exit(led_exit);
-
-MODULE_AUTHOR("Lars Kotthoff <metalhead@metalhead.ws>");
-MODULE_DESCRIPTION("Provides control of the front LED on SPARC systems.");
-MODULE_LICENSE("GPL");
-MODULE_VERSION(LED_VERSION);

-- 
2.34.1

