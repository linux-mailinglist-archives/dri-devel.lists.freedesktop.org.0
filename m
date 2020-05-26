Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D212A1C47CD
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 22:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8EC6E09C;
	Mon,  4 May 2020 20:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9DC6E09C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 20:17:42 +0000 (UTC)
IronPort-SDR: YCY/HoxVD3j6eIGI4dxAdrVsRuiZcc/vCq0TpkMmxFSa1XMOnIMTTco/95TkFw0GrzRRb9GlqH
 JsfDbc94czfQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 13:17:41 -0700
IronPort-SDR: OYoBb9EcG6PzS5UAd9k77YV0gaTZYmm1DcRZ4uqQeCz86bBXFX/xyL9KJHExdor7XE7mjPR+P5
 pGDCvjdTpwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; d="scan'208";a="284015855"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2020 13:17:41 -0700
Date: Mon, 4 May 2020 13:17:41 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504053357.GV23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 04, 2020 at 06:33:57AM +0100, Al Viro wrote:
> On Sun, May 03, 2020 at 10:04:47PM -0700, Ira Weiny wrote:
> 
> > Grepping for 'asm/highmem.h' and investigations don't reveal any issues...  But
> > you do have me worried.  That said 0-day has been crunching on multiple
> > versions of this series without issues such as this (save the mips issue
> > above).
> > 
> > I have to say it would be nice if the relation between linux/highmem.h and
> > asm/highmem.h was more straightforward.
> 
> IIRC, the headache was due to asm/pgtable.h on several architectures and
> asm/cacheflush.h on parisc.
> 
> <digs the notes out>
> 
> ||         IOW, there's one in linux/highmem.h (conditional on !CONFIG_HIGHMEM,
> || !ARCH_HAS_KMAP) and several per-architecture variants, usually declared in
> || their asm/highmem.h.  In three of those (microblaze, parisc and powerpc) these
> || are inlines (parisc one identical to linux/highmem.h, lives in asm/cacheflush.h,
> || powerpc and microblaze ones calling kmap_atomic_prot() which is defined in
> || arch/$ARCH/mm/highmem.c).
> || 
> ||         parisc case is weird - essentially, they want to call 
> || flush_kernel_dcache_page_addr() at the places where kunmap/kunmap_atomic
> || is done.  And they do so despite not selecting HIGHMEM, with definitions
> || in usual place.  They do have ARCH_HAS_KMAP defined, which prevents
> || getting buggered in linux/highmem.h.  ARCH_HAS_KMAP is parisc-unique,
> || BTW, and checked only in linux/highmem.h.
> || 
> ||         All genuine arch-specific variants are defined in (or call functions
> || defined in) translation units that are only included CONFIG_HIGHMEM builds.

I agree with this statement.  But IMO additional confusion is caused by the
fact that some arch's condition the declarations on CONFIG_HIGHMEM within
asm/highmem.h (arc, arm, nds32) while others depend on linux/highmem.h (and
elsewhere) to do so (csky, microblaze, mips, powerpc, sparc, x86, xtensa).

Why?

I think (perhaps naive) over time asm/highmem.h needs to be isolated to being
included in linux/highmem.h.  But as you point out below that is not so easy.
I think that this series helps toward that goal.

> || 
> ||         It would be tempting to consolidate those, e.g. by adding __kmap_atomic()
> || and __kmap_atomic_prot() without that boilerplate, with universal kmap_atomic()
> || and kmap_atomic_prot() in linux/highmem.h.  Potential problem with that would
> || be something that pulls ash/highmem.h (or asm/cacheflush.h in case of parisc)
> || directly and uses kmap_atomic/kmap_atomic_prot.  There's not a lot places
> || pulling asm/highmem.h, and many of them are not even in includes:
> || 
> || arch/arm/include/asm/efi.h:13:#include <asm/highmem.h>
> || arch/arm/mm/dma-mapping.c:31:#include <asm/highmem.h>
> || arch/arm/mm/flush.c:14:#include <asm/highmem.h>
> || arch/arm/mm/mmu.c:27:#include <asm/highmem.h>
> || arch/mips/include/asm/pgtable-32.h:22:#include <asm/highmem.h>
> || arch/mips/mm/cache.c:19:#include <asm/highmem.h>
> || arch/mips/mm/fault.c:28:#include <asm/highmem.h>                /* For VMALLOC_END */
> || arch/nds32/include/asm/pgtable.h:60:#include <asm/highmem.h>
> || arch/x86/kernel/setup_percpu.c:20:#include <asm/highmem.h>
> || include/linux/highmem.h:35:#include <asm/highmem.h>
> || 
> || Users of asm/cacheflush.h are rather more numerous; however, anything
> || outside of parisc-specific code has to pull linux/highmem.h, or it won't see
> || the definitions of kmap_atomic/kmap_atomic_prot at all.  arch/parisc itself
> || has no callers of those.
> || 
> || Outside of arch/* there is a plenty of callers.  However, the following is
> || true: all instances of kmap_atomic or kmap_atomic_prot outside of arch/*
> || are either inside the linux/highmem.h or are preceded by include of
> || linux/highmem.h on any build that sees them (there is a common include
> || chain that is conditional upon CONFIG_BLOCK, but it's only needed in
> || drivers that are BLOCK-dependent).  It was not fun to verify, to put
> || it mildly...
> || 
> || So for parisc we have no problem - leaving __kmap_atomic()/__kmap_atomic_prot()
> || in asm/cachefile.h and adding universal wrappers in linux/highmem.h will be
> || fine.  For other architectures the things might be trickier.

And the follow up series removes kmap_* from asm/cachefile.h in parisc which
should be cleaner going forward.

> || 
> || * arc: all users in arch/arc/ are within arch/arc/mm/{cache,highmem}.c;
> || both pull linux/highmem.h.  We are fine.

Still fine.

> || 
> || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> || Those are fine, but we also have this:
> || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.

It does not pull asm/highmem.h either...

> || 
> || Fortunately, the users of pte_offset_map() (__pte_map() has no other users)
> || are few, both in arch/arm and outside of arch.  All arm ones are pulling
> || linux/highmem (arch/arm/mm/{pgd,fault*}.c).  Outside of arch we have several
> || that pull highmem.h (by way of rmap.h or pagemap.h, usually):
> ||         fs/userfaultfd.c, mm/gup.c, mm/hmm.c, mm/huge_memory.c,
> ||         mm/khugepaged.c, mm/memory-failure.c, mm/memory.c, mm/migrate.c,
> ||         mm/mremap.c, mm/page_vma_mapped.c, mm/swap_state.c, mm/swapfile.c,
> ||         mm/vmalloc.c
> || and then there are these in linux/mm.h:
> || 
> || #define pte_offset_map_lock(mm, pmd, address, ptlp)     \
> || ({                                                      \
> ||         spinlock_t *__ptl = pte_lockptr(mm, pmd);       \
> ||         pte_t *__pte = pte_offset_map(pmd, address);    \
> ||         *(ptlp) = __ptl;                                \
> ||         spin_lock(__ptl);                               \
> ||         __pte;                                          \
> || })
> || #define pte_alloc_map(mm, pmd, address)                 \
> ||         (pte_alloc(mm, pmd) ? NULL : pte_offset_map(pmd, address))
> || #define pte_alloc_map_lock(mm, pmd, address, ptlp)      \
> ||         (pte_alloc(mm, pmd) ?                   \
> ||                  NULL : pte_offset_map_lock(mm, pmd, address, ptlp))
> || 
> ||         These have two users in arch/arm (arch/arm/mm/pgd.c and
> || arch/arm/lib/uaccess_with_memcpy.c, both pulling highmem.h).  Outside of
> || arch there are several new files (plus a lot of what we'd already seen
> || in mm/*.c, unsurprisingly):
> ||         fs/proc/task_mmu.c, mm/ksm.c, mm/madvise.c, mm/memcontrol.c,
> ||         mm/mempolicy.c, mm/mincore.c, mm/mprotect.c, mm/pagewalk.c,
> ||         mm/shmem.c, mm/userfaultfd.c,
> || all pulling linux/highmem.h, as pretty much all core VM does.  So we are
> || still fine.

This all seems the same now.

> || 
> || * csky: users in arch/csky/abiv2/cacheflush.c, arch/csky/mm/dma-mapping.c,
> || arch/csky/mm/highmem.c, all pulling linux/highmem.h

Yes still are.

> || 
> || * microblaze: users in arch/microblaze/mm/highmem.c (pulls linux/highmem.h) and,
> || arch/microblaze/include/asm/pgtable.h, this:
> || #define pte_offset_map(dir, addr)               \
> ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> ||         One pte_offset_map user in arch/microblaze:
> || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> || there, and that pull linux/highmem.h).

AFAICS asm/pgtable.h does not include asm/highmem.h here...

So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h

> ||         Outside of arch we'd already sorted it out when looking at arm.
> || 
> || * mips: users in arch/mips/kernel/crash_dump.c, arch/mips/kernel/uprobes.c,
> || arch/mips/mm/c-r4k.c, arch/mips/mm/dma-noncoherent.c, arch/mips/mm/highmem.c,
> || and arch/mips/mm/init.c (all pulling linux/highmem.h) plus this
> || arch/mips/mm/cache.c, which relies upon asm/highmem.h.  This can be switched
> || to linux/highmem.h.  On !CONFIG_HIGHMEM builds the call of kmap_atomic() in
> || there is eliminated, since it's conditional upon PageHighMem().  IOW, even
> || though we get a call of (inexistent) out-of-line version, it's not going to
> || survive into object file.  With linux/highmem.h use it will be an equally
> || eliminated call of inlined version.
> || XXX: arch/mips/mm/cache.c

Fixed as part of this series.

> || 
> || * nds32: users in arch/nds32/kernel/dma.c, arch/nds32/mm/cacheflush.c and
> || arch/nds32/mm/highmem.c, all pulling linux/highmem.h

Still looks ok.

> || 
> || * powerpc: users in arch/powerpc/kvm/book3s_pr.c,
> || arch/powerpc/kvm/e500_mmu_host.c, arch/powerpc/mm/dma-noncoherent.c,
> || arch/powerpc/mm/highmem.c and arch/powerpc/mm/mem.c, all pulling
> || linux/highmem.h,

still good

> a user in arch/powerpc/mm/hugetlbpage.c pulling it
> || via asm/tlb.h -> linux/pagemap.h -> linux/highmem.h

good

> and
> || macros for pte_offset_map in arch/powerpc/include/asm/*/32/pgtable.h.
> || Users of that within arch/powerpc are either 64bit-only or
> || pull linux/highmem.h (arch/powerpc/mm/pgtable_32.c and
> || arch/powerpc/xmon/xmon.c).
>

Looks ok.

> || Users outside of arch - same as for arm.
> || 
> || * sparc: users in arch/sparc/kernel/uprobes.c and arch/sparc/mm/highmem.c
> || (both pulling linux/highmem.h directly) + arch/sparc/mm/init_64.c pulling
> || it via linux/pagemap.h.

Looks ok.

> Strangely, arch/sparc/mm/io-unit.c and
> || arch/sparc/mm/iommu.c both include linux/highmem.h with odd comment
> || that seems to indicate that once upon a time pte_offset_map() used to
> || requite kmap_atomic() there...  Right, it used to - until 2002.
> || These includes are pointless, then...

Looks like it...

I'll throw in a patch for that.

> || 
> || * x86: users in arch/x86/kernel/crash_dump_32.c, arch/x86/kvm/svm.c,
> || arch/x86/lib/usercopy_64.c, arch/x86/mm/highmem_32.c and arch/x86/mm/iomap_32.c,
> || all pulling linux/highmem.h, users in paging_tmpl.h (included from
> || arch/x86/kvm/mmu/mmu.c, which has pulled linux/highmem.h prior to that)
> || and definition of pte_offset_map() (in asm/pgtable_32.h)
> || Users of pte_offset_map() and friends in arch/x86 are in
> || arch/x86/kernel/vm86_32.c and arch/x86/mm/dump_pagetables.c (both
> || pulling linux/highmem.h), in arch/x86/mm/mem_encrypt_identity.c
> || (64bit-only, pte_offset_map() doesn't use kmap_atomic() there) and
> || arch/x86/kernel/tboot.c (pulls linux/highmem.h via asm/pgalloc.h
> || and linux/pagemap.h)

I've built these and they seem fine.

> || 
> || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> || linux/highmem.h).

Actually

arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h

arch/xtensa/platforms/iss/simdisk.c may have an issue?
	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
	<sigh>

So xtensa still seems good AFAICS.


In summary it looks like the use of kmap_atomic() in pte_offset_map() is a
potential issue in microblaze.  I've fixed that in my local tree.

Ira
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
