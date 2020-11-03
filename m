Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995312A5F68
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1689B0B;
	Wed,  4 Nov 2020 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76406EC73;
 Tue,  3 Nov 2020 10:34:02 +0000 (UTC)
Message-Id: <20201103095859.335366302@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=A9fIQi2MIxDLlGKHATeOlK6WSHzl9bMxA6Vy6WK4kFg=;
 b=EFq00YaC2cfZ3tRBXG1AYeQj6Sgd3q/sRky5nMpbjN5ek1aWLKVPUv+JvoHWa6vjJFl3Ww
 awzO+FzbND5FKjPGN7gNTnp5Mb1tq9qO15q652V8S0pc9Ce+oaGECW/jZPsmCvsiKGY+B3
 KwlcTL/aSMXp1KJx2nFOb6gxG+DhM4n5p7kt5iTVZXpFOkBEw1cbStLJ+/3gWYcjPH26QY
 Sbv7PLzlBaetuHp8ai5dMyYUIWrRveb5P6ybl5UfTZhOpH3MacNEiFaKtx28E2gAmPiYft
 OZoB88IwwamuMjukOjyOm6rKIPayv2itPmrCw7QTvAcv81mGKSLdYHUqSDcl3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=A9fIQi2MIxDLlGKHATeOlK6WSHzl9bMxA6Vy6WK4kFg=;
 b=MNJFQ16TWMWokWTa10gHMVVbsQOpiB2QfbpOViNefBGxmMK6yL/K8NxBWEF2+7F4dQI9lX
 SBoVS11NJaJ9FoCQ==
Date: Tue, 03 Nov 2020 10:27:39 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 27/37] x86/crashdump/32: Simplify copy_oldmem_page()
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, Chris Mason <clm@fb.com>,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace kmap_atomic_pfn() with kmap_local_pfn() which is preemptible and
can take page faults.

Remove the indirection of the dump page and the related cruft which is not
longer required.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V3: New patch
---
 arch/x86/kernel/crash_dump_32.c |   48 ++++++++--------------------------------
 1 file changed, 10 insertions(+), 38 deletions(-)

--- a/arch/x86/kernel/crash_dump_32.c
+++ b/arch/x86/kernel/crash_dump_32.c
@@ -13,8 +13,6 @@
 
 #include <linux/uaccess.h>
 
-static void *kdump_buf_page;
-
 static inline bool is_crashed_pfn_valid(unsigned long pfn)
 {
 #ifndef CONFIG_X86_PAE
@@ -41,15 +39,11 @@ static inline bool is_crashed_pfn_valid(
  * @userbuf: if set, @buf is in user address space, use copy_to_user(),
  *	otherwise @buf is in kernel address space, use memcpy().
  *
- * Copy a page from "oldmem". For this page, there is no pte mapped
- * in the current kernel. We stitch up a pte, similar to kmap_atomic.
- *
- * Calling copy_to_user() in atomic context is not desirable. Hence first
- * copying the data to a pre-allocated kernel page and then copying to user
- * space in non-atomic context.
+ * Copy a page from "oldmem". For this page, there might be no pte mapped
+ * in the current kernel.
  */
-ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
-                               size_t csize, unsigned long offset, int userbuf)
+ssize_t copy_oldmem_page(unsigned long pfn, char *buf, size_t csize,
+			 unsigned long offset, int userbuf)
 {
 	void  *vaddr;
 
@@ -59,38 +53,16 @@ ssize_t copy_oldmem_page(unsigned long p
 	if (!is_crashed_pfn_valid(pfn))
 		return -EFAULT;
 
-	vaddr = kmap_atomic_pfn(pfn);
+	vaddr = kmap_local_pfn(pfn);
 
 	if (!userbuf) {
-		memcpy(buf, (vaddr + offset), csize);
-		kunmap_atomic(vaddr);
+		memcpy(buf, vaddr + offset, csize);
 	} else {
-		if (!kdump_buf_page) {
-			printk(KERN_WARNING "Kdump: Kdump buffer page not"
-				" allocated\n");
-			kunmap_atomic(vaddr);
-			return -EFAULT;
-		}
-		copy_page(kdump_buf_page, vaddr);
-		kunmap_atomic(vaddr);
-		if (copy_to_user(buf, (kdump_buf_page + offset), csize))
-			return -EFAULT;
+		if (copy_to_user(buf, vaddr + offset, csize))
+			csize = -EFAULT;
 	}
 
-	return csize;
-}
+	kunmap_local(vaddr);
 
-static int __init kdump_buf_page_init(void)
-{
-	int ret = 0;
-
-	kdump_buf_page = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!kdump_buf_page) {
-		printk(KERN_WARNING "Kdump: Failed to allocate kdump buffer"
-			 " page\n");
-		ret = -ENOMEM;
-	}
-
-	return ret;
+	return csize;
 }
-arch_initcall(kdump_buf_page_init);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
