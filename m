Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898682807E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9510E3A8;
	Tue,  9 Jan 2024 08:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AED310E3A8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:23:52 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id EA50C1C059A;
 Tue,  9 Jan 2024 17:23:49 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 06/37] sh: kernel/setup Update DT support.
Date: Tue,  9 Jan 2024 17:23:03 +0900
Message-Id: <66567de276d44f7d67efe14f193dbce6259bc885.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix extrnal fdt initialize and bootargs.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/kernel/setup.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 3d80515298d2..e3f34027ac9e 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -30,6 +30,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/libfdt.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/mount.h>
 #include <asm/io.h>
@@ -269,8 +270,20 @@ void __ref sh_fdt_init(phys_addr_t dt_phys)
 
 void __init setup_arch(char **cmdline_p)
 {
+#if defined(CONFIG_OF) && defined(CONFIG_OF_EARLY_FLATTREE)
+	if (IS_ENABLED(CONFIG_USE_BUILTIN_DTB)) {
+		/* Relocate Embedded DTB */
+		unflatten_and_copy_device_tree();
+	} else if (initial_boot_params) {
+		/* Reserve external DTB area */
+		memblock_reserve(__pa(initial_boot_params),
+				 fdt_totalsize(initial_boot_params));
+		unflatten_device_tree();
+	}
+#endif
 	enable_mmu();
 
+#ifndef CONFIG_OF
 	ROOT_DEV = old_decode_dev(ORIG_ROOT_DEV);
 
 	printk(KERN_NOTICE "Boot params:\n"
@@ -299,6 +312,8 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = virt_to_phys(__bss_start);
 	bss_resource.end = virt_to_phys(__bss_stop)-1;
 
+#endif
+
 #ifdef CONFIG_CMDLINE_OVERWRITE
 	strscpy(command_line, CONFIG_CMDLINE, sizeof(command_line));
 #else
@@ -310,9 +325,17 @@ void __init setup_arch(char **cmdline_p)
 #endif
 
 	/* Save unparsed command line copy for /proc/cmdline */
+#ifndef CONFIG_OF
 	memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
-
+#else
+	if (!initial_boot_params) {
+		memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
+		*cmdline_p = command_line;
+	} else {
+		*cmdline_p = boot_command_line;
+	}
+#endif
 	parse_early_param();
 
 	plat_early_device_setup();
@@ -322,14 +345,6 @@ void __init setup_arch(char **cmdline_p)
 	/* Let earlyprintk output early console messages */
 	sh_early_platform_driver_probe("earlyprintk", 1, 1);
 
-#ifdef CONFIG_OF_EARLY_FLATTREE
-#ifdef CONFIG_USE_BUILTIN_DTB
-	unflatten_and_copy_device_tree();
-#else
-	unflatten_device_tree();
-#endif
-#endif
-
 	paging_init();
 
 	/* Perform the machine specific initialisation */
-- 
2.39.2

