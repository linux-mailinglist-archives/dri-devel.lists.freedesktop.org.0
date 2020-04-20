Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98C1B1F20
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104186E8B1;
	Tue, 21 Apr 2020 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D446E843
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:36:42 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495b523jdPz9v1wF;
 Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XiJTacZn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ydRhInMpmuvi; Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495b5229JQz9v1wB;
 Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587407798; bh=z1ku9hxEGoQuGttzXytVBzvzwGsEoyeTAvXO8AsaXT4=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=XiJTacZnZczISTod4CLG6UW8drTZIjNjkMTkv6RfvRCfgKTdnaCWOf0pec/TYRFFp
 mKIdv2jlB9VRqoAHDBODt7MIo+lb546AUwmFkjoKDiuxgtlzdPCUqU6wpjmj10HQV7
 vKGCH4zInR7ksdJkB0ScDNfIbc8VSYprRrC85sSo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AD6B8B78A;
 Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 46rWLkPC9tUI; Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02B098B77E;
 Mon, 20 Apr 2020 20:36:38 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C81F1657AE; Mon, 20 Apr 2020 18:36:37 +0000 (UTC)
Message-Id: <4006d9c8e69f8eaccee954899f6b5fb76240d00b.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/5] powerpc: Replace _ALIGN() by ALIGN()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 20 Apr 2020 18:36:37 +0000 (UTC)
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

_ALIGN() is specific to powerpc
ALIGN() is generic and does the same

Replace _ALIGN() by ALIGN()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h | 2 +-
 arch/powerpc/kernel/prom_init.c              | 8 ++++----
 arch/powerpc/platforms/powermac/bootx_init.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 53b5c93eaf5d..0d4bccb4b9f2 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -188,7 +188,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  * memory shall not share segments.
  */
 #if defined(CONFIG_STRICT_KERNEL_RWX) && defined(CONFIG_MODULES)
-#define VMALLOC_START ((_ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
+#define VMALLOC_START ((ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
 		       ~(VMALLOC_OFFSET - 1))
 #else
 #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 5b4d4c4297e1..4315d40906a0 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -110,7 +110,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  */
 #define VMALLOC_OFFSET (0x1000000) /* 16M */
 #ifdef PPC_PIN_SIZE
-#define VMALLOC_START (((_ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
+#define VMALLOC_START (((ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
 #else
 #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
 #endif
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 3a5a7db4564f..e3a9fde51c4f 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2426,7 +2426,7 @@ static void __init *make_room(unsigned long *mem_start, unsigned long *mem_end,
 {
 	void *ret;
 
-	*mem_start = _ALIGN(*mem_start, align);
+	*mem_start = ALIGN(*mem_start, align);
 	while ((*mem_start + needed) > *mem_end) {
 		unsigned long room, chunk;
 
@@ -2562,7 +2562,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
 				*lp++ = *p;
 		}
 		*lp = 0;
-		*mem_start = _ALIGN((unsigned long)lp + 1, 4);
+		*mem_start = ALIGN((unsigned long)lp + 1, 4);
 	}
 
 	/* get it again for debugging */
@@ -2608,7 +2608,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
 		/* push property content */
 		valp = make_room(mem_start, mem_end, l, 4);
 		call_prom("getprop", 4, 1, node, pname, valp, l);
-		*mem_start = _ALIGN(*mem_start, 4);
+		*mem_start = ALIGN(*mem_start, 4);
 
 		if (!prom_strcmp(pname, "phandle"))
 			has_phandle = 1;
@@ -2667,7 +2667,7 @@ static void __init flatten_device_tree(void)
 		prom_panic ("couldn't get device tree root\n");
 
 	/* Build header and make room for mem rsv map */ 
-	mem_start = _ALIGN(mem_start, 4);
+	mem_start = ALIGN(mem_start, 4);
 	hdr = make_room(&mem_start, &mem_end,
 			sizeof(struct boot_param_header), 4);
 	dt_header_start = (unsigned long)hdr;
diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
index c3374a90952f..9d4ecd292255 100644
--- a/arch/powerpc/platforms/powermac/bootx_init.c
+++ b/arch/powerpc/platforms/powermac/bootx_init.c
@@ -386,7 +386,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
 	hdr->dt_strings_size = bootx_dt_strend - bootx_dt_strbase;
 
 	/* Build structure */
-	mem_end = _ALIGN(mem_end, 16);
+	mem_end = ALIGN(mem_end, 16);
 	DBG("Building device tree structure at: %x\n", mem_end);
 	hdr->off_dt_struct = mem_end - mem_start;
 	bootx_scan_dt_build_struct(base, 4, &mem_end);
@@ -404,7 +404,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
 	 * also bump mem_reserve_cnt to cause further reservations to
 	 * fail since it's too late.
 	 */
-	mem_end = _ALIGN(mem_end, PAGE_SIZE);
+	mem_end = ALIGN(mem_end, PAGE_SIZE);
 	DBG("End of boot params: %x\n", mem_end);
 	rsvmap[0] = mem_start;
 	rsvmap[1] = mem_end;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
