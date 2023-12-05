Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB048059B3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581BF10E5B1;
	Tue,  5 Dec 2023 16:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBAA110E4CD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:55:32 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 164F21C04FD;
 Tue,  5 Dec 2023 18:46:13 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v5 06/37] sh: kernel/setup Update DT support.
Date: Tue,  5 Dec 2023 18:45:25 +0900
Message-Id: <76bbd45b22ef6cc1fa69369aff908c9c4e366860.1701768028.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 16:16:42 +0000
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
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
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix extrnal fdt initialize and bootargs.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/kernel/setup.c | 51 ++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 3d80515298d2..b299abff68e0 100644
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
@@ -74,7 +75,13 @@ extern int root_mountflags;
 #define RAMDISK_PROMPT_FLAG		0x8000
 #define RAMDISK_LOAD_FLAG		0x4000
 
+#if defined(CONFIG_OF) && !defined(CONFIG_USE_BUILTIN_DTB)
+#define CHOSEN_BOOTARGS
+#endif
+
+#ifndef CHOSEN_BOOTARGS
 static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
+#endif
 
 static struct resource code_resource = {
 	.name = "Kernel code",
@@ -244,18 +251,18 @@ void __init __weak plat_early_device_setup(void)
 void __ref sh_fdt_init(phys_addr_t dt_phys)
 {
 	static int done = 0;
-	void *dt_virt;
+	void *fdt;
 
 	/* Avoid calling an __init function on secondary cpus. */
 	if (done) return;
 
 #ifdef CONFIG_USE_BUILTIN_DTB
-	dt_virt = __dtb_start;
+	fdt = __dtb_start;
 #else
-	dt_virt = phys_to_virt(dt_phys);
+	fdt = phys_to_virt(dt_phys);
 #endif
 
-	if (!dt_virt || !early_init_dt_scan(dt_virt)) {
+	if (!fdt || !early_init_dt_scan(fdt)) {
 		pr_crit("Error: invalid device tree blob"
 			" at physical address %p\n", (void *)dt_phys);
 
@@ -269,8 +276,20 @@ void __ref sh_fdt_init(phys_addr_t dt_phys)
 
 void __init setup_arch(char **cmdline_p)
 {
+#ifdef CONFIG_OF_EARLY_FLATTREE
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
@@ -299,19 +318,25 @@ void __init setup_arch(char **cmdline_p)
 	bss_resource.start = virt_to_phys(__bss_start);
 	bss_resource.end = virt_to_phys(__bss_stop)-1;
 
-#ifdef CONFIG_CMDLINE_OVERWRITE
-	strscpy(command_line, CONFIG_CMDLINE, sizeof(command_line));
-#else
+#endif
+
+#ifndef CHOSEN_BOOTARGS
+#ifndef CONFIG_CMDLINE_OVERWRITE
 	strscpy(command_line, COMMAND_LINE, sizeof(command_line));
 #ifdef CONFIG_CMDLINE_EXTEND
 	strlcat(command_line, " ", sizeof(command_line));
 	strlcat(command_line, CONFIG_CMDLINE, sizeof(command_line));
 #endif
-#endif
-
+#else   /* !CONFIG_CMDLINE_OVERWRITE*/
+	strscpy(command_line, CONFIG_CMDLINE, sizeof(command_line));
+#endif  /* CONFIG_CMDLINE_OVERWRITE */
 	/* Save unparsed command line copy for /proc/cmdline */
 	memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
+#else	/* CHOSEN_BOOTARGS */
+	/* Use "/chosen/bootargs" specified in devicetree. */
+	*cmdline_p = boot_command_line;
+#endif
 
 	parse_early_param();
 
@@ -322,14 +347,6 @@ void __init setup_arch(char **cmdline_p)
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

