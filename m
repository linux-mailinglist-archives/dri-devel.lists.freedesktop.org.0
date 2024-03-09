Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 508EB8772DA
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95311122C1;
	Sat,  9 Mar 2024 18:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZqWx+wgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C181122AA
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D045060AB6;
 Sat,  9 Mar 2024 18:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02096C43141;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008150;
 bh=dG2HwNR+C3lMliIKYIzA/W3s069/aToueIZGDZPnlUg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ZqWx+wgofwMCxs5+IK51hbX1qmMOrajodCMpqnlPYYvRtzzjUTC8Vn1MlTfwp8+1E
 4Y0PIc1NMkw8yR7HD7ggCc0JtK2r4WQ/LxaA/ks4M+sANtabkuviUhIxlDR/+LU0MZ
 p5YDERk+6DwqfvaTM0gFRO7pbBmLVJux+yUiAM7oxgJIJq4ngCNsGO91jk3ZC5rEjZ
 bzC7Zn4g025cDT2GW3Mtco/uwqrmrM9oVJ2Ys3/grjG4Ta530GLoyG0SHFnYySxeSa
 ZO9vrUw1gu1J6paRLKdNy2Mr0PCTeRHj3l/+YVVwebBT92hIw/6sPEj9A9M2Sboora
 KwQmPS6Kbvj6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DF69FC54E64;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:42 +0100
Subject: [PATCH v2 21/28] sparc32: Drop unused prom ranges support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-21-f09912574d2c@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=6535;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=K3rk+CKeEjj6JsTZVS6JKZy5Vp3Mqk/HiQ45gbUMCak=; =?utf-8?q?b=3DXlh6SkGV7xQ/?=
 =?utf-8?q?Aiby+Nk69A7e1I/oGZ4ReqRAIpd1CPOtW0xkcGIQWePNtmkTEpAQJxHR1ZJVnAbp?=
 3au55v7/CjNiNDzSHBrKGGPwAONX+rPgrdQil2Ekj1S5LRk7cn39
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

Drop support for prom ranges - not used anymore.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/oplib_32.h |  11 ----
 arch/sparc/prom/Makefile          |   1 -
 arch/sparc/prom/init_32.c         |   2 -
 arch/sparc/prom/ranges.c          | 114 --------------------------------------
 4 files changed, 128 deletions(-)

diff --git a/arch/sparc/include/asm/oplib_32.h b/arch/sparc/include/asm/oplib_32.h
index d1cf3a27a40d..4ef7f05978d3 100644
--- a/arch/sparc/include/asm/oplib_32.h
+++ b/arch/sparc/include/asm/oplib_32.h
@@ -163,17 +163,6 @@ int prom_setprop(phandle node, const char *prop_name, char *prop_value,
 
 phandle prom_inst2pkg(int);
 
-/* Dorking with Bus ranges... */
-
-/* Apply promlib probes OBIO ranges to registers. */
-void prom_apply_obio_ranges(struct linux_prom_registers *obioregs, int nregs);
-
-/* Apply ranges of any prom node (and optionally parent node as well) to registers. */
-void prom_apply_generic_ranges(phandle node, phandle parent,
-			       struct linux_prom_registers *sbusregs, int nregs);
-
-void prom_ranges_init(void);
-
 /* CPU probing helpers.  */
 int cpu_find_by_instance(int instance, phandle *prom_node, int *mid);
 int cpu_find_by_mid(int mid, phandle *prom_node);
diff --git a/arch/sparc/prom/Makefile b/arch/sparc/prom/Makefile
index a1adc75d8055..0be170eeb57a 100644
--- a/arch/sparc/prom/Makefile
+++ b/arch/sparc/prom/Makefile
@@ -9,7 +9,6 @@ lib-y                 += init_$(BITS).o
 lib-$(CONFIG_SPARC32) += memory.o
 lib-y                 += misc_$(BITS).o
 lib-$(CONFIG_SPARC32) += mp.o
-lib-$(CONFIG_SPARC32) += ranges.o
 lib-y                 += console_$(BITS).o
 lib-y                 += printf.o
 lib-y                 += tree_$(BITS).o
diff --git a/arch/sparc/prom/init_32.c b/arch/sparc/prom/init_32.c
index d20470166cb1..1681f1f980d4 100644
--- a/arch/sparc/prom/init_32.c
+++ b/arch/sparc/prom/init_32.c
@@ -67,8 +67,6 @@ void __init prom_init(struct linux_romvec *rp)
 
 	prom_meminit();
 
-	prom_ranges_init();
-
 	printk("PROMLIB: Sun Boot Prom Version %d Revision %d\n",
 	       romvec->pv_romvers, prom_rev);
 
diff --git a/arch/sparc/prom/ranges.c b/arch/sparc/prom/ranges.c
deleted file mode 100644
index 20cb828bc5f4..000000000000
--- a/arch/sparc/prom/ranges.c
+++ /dev/null
@@ -1,114 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * ranges.c: Handle ranges in newer proms for obio/sbus.
- *
- * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
- * Copyright (C) 1997 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-
-#include <asm/openprom.h>
-#include <asm/oplib.h>
-#include <asm/types.h>
-
-static struct linux_prom_ranges promlib_obio_ranges[PROMREG_MAX];
-static int num_obio_ranges;
-
-/* Adjust register values based upon the ranges parameters. */
-static void prom_adjust_regs(struct linux_prom_registers *regp, int nregs,
-			     struct linux_prom_ranges *rangep, int nranges)
-{
-	int regc, rngc;
-
-	for (regc = 0; regc < nregs; regc++) {
-		for (rngc = 0; rngc < nranges; rngc++)
-			if (regp[regc].which_io == rangep[rngc].ot_child_space)
-				break; /* Fount it */
-		if (rngc == nranges) /* oops */
-			prom_printf("adjust_regs: Could not find range with matching bus type...\n");
-		regp[regc].which_io = rangep[rngc].ot_parent_space;
-		regp[regc].phys_addr -= rangep[rngc].ot_child_base;
-		regp[regc].phys_addr += rangep[rngc].ot_parent_base;
-	}
-}
-
-static void prom_adjust_ranges(struct linux_prom_ranges *ranges1, int nranges1,
-			       struct linux_prom_ranges *ranges2, int nranges2)
-{
-	int rng1c, rng2c;
-
-	for (rng1c = 0; rng1c < nranges1; rng1c++) {
-		for (rng2c = 0; rng2c < nranges2; rng2c++)
-			if (ranges1[rng1c].ot_parent_space == ranges2[rng2c].ot_child_space &&
-			   ranges1[rng1c].ot_parent_base >= ranges2[rng2c].ot_child_base &&
-			   ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size - ranges1[rng1c].ot_parent_base > 0U)
-			break;
-		if (rng2c == nranges2) /* oops */
-			prom_printf("adjust_ranges: Could not find matching bus type...\n");
-		else if (ranges1[rng1c].ot_parent_base + ranges1[rng1c].or_size > ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size)
-			ranges1[rng1c].or_size = ranges2[rng2c].ot_child_base + ranges2[rng2c].or_size - ranges1[rng1c].ot_parent_base;
-		ranges1[rng1c].ot_parent_space = ranges2[rng2c].ot_parent_space;
-		ranges1[rng1c].ot_parent_base += ranges2[rng2c].ot_parent_base;
-	}
-}
-
-/* Apply probed obio ranges to registers passed, if no ranges return. */
-void prom_apply_obio_ranges(struct linux_prom_registers *regs, int nregs)
-{
-	if (num_obio_ranges)
-		prom_adjust_regs(regs, nregs, promlib_obio_ranges, num_obio_ranges);
-}
-EXPORT_SYMBOL(prom_apply_obio_ranges);
-
-void __init prom_ranges_init(void)
-{
-	phandle node, obio_node;
-	int success;
-
-	num_obio_ranges = 0;
-
-	/* Check for obio and sbus ranges. */
-	node = prom_getchild(prom_root_node);
-	obio_node = prom_searchsiblings(node, "obio");
-
-	if (obio_node) {
-		success = prom_getproperty(obio_node, "ranges",
-					   (char *) promlib_obio_ranges,
-					   sizeof(promlib_obio_ranges));
-		if (success != -1)
-			num_obio_ranges = (success / sizeof(struct linux_prom_ranges));
-	}
-
-	if (num_obio_ranges)
-		prom_printf("PROMLIB: obio_ranges %d\n", num_obio_ranges);
-}
-
-void prom_apply_generic_ranges(phandle node, phandle parent,
-			       struct linux_prom_registers *regs, int nregs)
-{
-	int success;
-	int num_ranges;
-	struct linux_prom_ranges ranges[PROMREG_MAX];
-
-	success = prom_getproperty(node, "ranges",
-				   (char *) ranges,
-				   sizeof(ranges));
-	if (success != -1) {
-		num_ranges = (success / sizeof(struct linux_prom_ranges));
-		if (parent) {
-			struct linux_prom_ranges parent_ranges[PROMREG_MAX];
-			int num_parent_ranges;
-
-			success = prom_getproperty(parent, "ranges",
-						   (char *) parent_ranges,
-						   sizeof(parent_ranges));
-			if (success != -1) {
-				num_parent_ranges = (success / sizeof(struct linux_prom_ranges));
-				prom_adjust_ranges(ranges, num_ranges, parent_ranges, num_parent_ranges);
-			}
-		}
-		prom_adjust_regs(regs, nregs, ranges, num_ranges);
-	}
-}

-- 
2.34.1

