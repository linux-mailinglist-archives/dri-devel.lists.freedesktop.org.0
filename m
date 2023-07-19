Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD675955E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 14:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BA610E490;
	Wed, 19 Jul 2023 12:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475E910E490
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 12:40:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8152361638;
 Wed, 19 Jul 2023 12:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A953C433C8;
 Wed, 19 Jul 2023 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689770426;
 bh=1xxJ92HMZHkMrmgB3qJ3qga4AePLoEhCYGynQ3AK3kw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VZOm7QC5zE9qow5z/O0EDrGX8NJ9D8oaachbTEVb6dqMZyd9CkI3ve99wALqTHxvv
 +0ztzgJSXF9aHuZ/o3AQSULXwlMSUjxU9CUHA9nlt9gmMg22pdnaE4oDrngr4qn3fG
 AF4sv+8wBgGUeXv0EF8lso8ikCxi+yWjNyOplvx8QbaNjmFdADYWpe6t/Pm1ff3FAa
 fO2s7aOOg5G2+dnygK5mltsm+LkrLRwoVQv4oHc9cBAFCX5TtO3O4DU+QFQGrG4kWQ
 Y96BjxgrLASmygoxIHOP10UeNkX0ZfqP48yrARJeixgalG/NuOUaIOmgXoPRNFyyVI
 8mhS4YO6UI+ig==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 2/9] vgacon: rework screen_info #ifdef checks
Date: Wed, 19 Jul 2023 14:39:37 +0200
Message-Id: <20230719123944.3438363-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
References: <20230719123944.3438363-1-arnd@kernel.org>
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

On non-x86 architectures, the screen_info variable is generally only
used for the VGA console where supported, and in some cases the EFI
framebuffer or vga16fb.

Now that we have a definite list of which architectures actually use it
for what, use consistent #ifdef checks so the global variable is only
defined when it is actually used on those architectures.

Loongarch and riscv have no support for vgacon or vga16fb, but
they support EFI firmware, so only that needs to be checked, and the
initialization can be removed because that is handled by EFI.
IA64 has both vgacon and EFI, though EFI apparently never uses
a framebuffer here.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2 changes:
 - split out mips/jazz change
 - improve ia64 #ifdef changes
---
 arch/alpha/kernel/setup.c      |  2 ++
 arch/alpha/kernel/sys_sio.c    |  2 ++
 arch/ia64/kernel/setup.c       |  6 ++++++
 arch/loongarch/kernel/setup.c  |  2 ++
 arch/mips/kernel/setup.c       |  2 +-
 arch/mips/sibyte/swarm/setup.c |  2 +-
 arch/mips/sni/setup.c          |  2 +-
 arch/riscv/kernel/setup.c      | 11 ++---------
 8 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index b650ff1cb022e..b4d2297765c02 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -131,6 +131,7 @@ static void determine_cpu_caches (unsigned int);
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 
+#ifdef CONFIG_VGA_CONSOLE
 /*
  * The format of "screen_info" is strange, and due to early
  * i386-setup code. This is just enough to make the console
@@ -147,6 +148,7 @@ struct screen_info screen_info = {
 };
 
 EXPORT_SYMBOL(screen_info);
+#endif
 
 /*
  * The direct map I/O window, if any.  This should be the same
diff --git a/arch/alpha/kernel/sys_sio.c b/arch/alpha/kernel/sys_sio.c
index 7c420d8dac53d..7de8a5d2d2066 100644
--- a/arch/alpha/kernel/sys_sio.c
+++ b/arch/alpha/kernel/sys_sio.c
@@ -57,11 +57,13 @@ sio_init_irq(void)
 static inline void __init
 alphabook1_init_arch(void)
 {
+#ifdef CONFIG_VGA_CONSOLE
 	/* The AlphaBook1 has LCD video fixed at 800x600,
 	   37 rows and 100 cols. */
 	screen_info.orig_y = 37;
 	screen_info.orig_video_cols = 100;
 	screen_info.orig_video_lines = 37;
+#endif
 
 	lca_init_arch();
 }
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index 5a55ac82c13a4..d2c66efdde560 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -86,9 +86,13 @@ EXPORT_SYMBOL(local_per_cpu_offset);
 #endif
 unsigned long ia64_cycles_per_usec;
 struct ia64_boot_param *ia64_boot_param;
+#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
 struct screen_info screen_info;
+#endif
+#ifdef CONFIG_VGA_CONSOLE
 unsigned long vga_console_iobase;
 unsigned long vga_console_membase;
+#endif
 
 static struct resource data_resource = {
 	.name	= "Kernel data",
@@ -497,6 +501,7 @@ early_console_setup (char *cmdline)
 static void __init
 screen_info_setup(void)
 {
+#ifdef CONFIG_VGA_CONSOLE
 	unsigned int orig_x, orig_y, num_cols, num_rows, font_height;
 
 	memset(&screen_info, 0, sizeof(screen_info));
@@ -525,6 +530,7 @@ screen_info_setup(void)
 	screen_info.orig_video_mode = 3;	/* XXX fake */
 	screen_info.orig_video_isVGA = 1;	/* XXX fake */
 	screen_info.orig_video_ega_bx = 3;	/* XXX fake */
+#endif
 }
 
 static inline void
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 95e6b579dfdd1..77e7a3722caa6 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -57,7 +57,9 @@
 #define SMBIOS_CORE_PACKAGE_OFFSET	0x23
 #define LOONGSON_EFI_ENABLE		(1 << 3)
 
+#ifdef CONFIG_EFI
 struct screen_info screen_info __section(".data");
+#endif
 
 unsigned long fw_arg0, fw_arg1, fw_arg2;
 DEFINE_PER_CPU(unsigned long, kernelsp);
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index cb871eb784a7c..1aba7dc95132c 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -54,7 +54,7 @@ struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
 
 EXPORT_SYMBOL(cpu_data);
 
-#ifdef CONFIG_VT
+#ifdef CONFIG_VGA_CONSOLE
 struct screen_info screen_info;
 #endif
 
diff --git a/arch/mips/sibyte/swarm/setup.c b/arch/mips/sibyte/swarm/setup.c
index 76683993cdd3a..37df504d3ecbb 100644
--- a/arch/mips/sibyte/swarm/setup.c
+++ b/arch/mips/sibyte/swarm/setup.c
@@ -129,7 +129,7 @@ void __init plat_mem_setup(void)
 	if (m41t81_probe())
 		swarm_rtc_type = RTC_M41T81;
 
-#ifdef CONFIG_VT
+#ifdef CONFIG_VGA_CONSOLE
 	screen_info = (struct screen_info) {
 		.orig_video_page	= 52,
 		.orig_video_mode	= 3,
diff --git a/arch/mips/sni/setup.c b/arch/mips/sni/setup.c
index efad85c8c823b..9984cf91be7d0 100644
--- a/arch/mips/sni/setup.c
+++ b/arch/mips/sni/setup.c
@@ -38,7 +38,7 @@ extern void sni_machine_power_off(void);
 
 static void __init sni_display_setup(void)
 {
-#if defined(CONFIG_VT) && defined(CONFIG_VGA_CONSOLE) && defined(CONFIG_FW_ARC)
+#if defined(CONFIG_VGA_CONSOLE) && defined(CONFIG_FW_ARC)
 	struct screen_info *si = &screen_info;
 	DISPLAY_STATUS *di;
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 971fe776e2f8b..a3dbe13f45fb3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -39,15 +39,8 @@
 
 #include "head.h"
 
-#if defined(CONFIG_DUMMY_CONSOLE) || defined(CONFIG_EFI)
-struct screen_info screen_info __section(".data") = {
-	.orig_video_lines	= 30,
-	.orig_video_cols	= 80,
-	.orig_video_mode	= 0,
-	.orig_video_ega_bx	= 0,
-	.orig_video_isVGA	= 1,
-	.orig_video_points	= 8
-};
+#if defined(CONFIG_EFI)
+struct screen_info screen_info __section(".data");
 #endif
 
 /*
-- 
2.39.2

