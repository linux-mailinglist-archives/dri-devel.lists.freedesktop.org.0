Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024841C4EA7
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 08:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539D56E53E;
	Tue,  5 May 2020 06:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2C36E4AB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 21:03:09 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jViEL-0010Kx-57; Mon, 04 May 2020 21:02:25 +0000
Date: Mon, 4 May 2020 22:02:25 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504210225.GW23230@ZenIV.linux.org.uk>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
 <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
X-Mailman-Approved-At: Tue, 05 May 2020 06:58:49 +0000
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

On Mon, May 04, 2020 at 01:17:41PM -0700, Ira Weiny wrote:

> > || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> > || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> > || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> > || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> > || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> > || Those are fine, but we also have this:
> > || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> > || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> > || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.
> 
> It does not pull asm/highmem.h either...

No, but the users of those macros need to be considered.

> > || #define pte_offset_map(dir, addr)               \
> > ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> > ||         One pte_offset_map user in arch/microblaze:
> > || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> > || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> > || there, and that pull linux/highmem.h).
> 
> AFAICS asm/pgtable.h does not include asm/highmem.h here...
> 
> So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h

See above - line 39 in there is
#include <asm/pgalloc.h>
and line 14 in arch/microblaze/include/asm/pgalloc.h is
#include <linux/highmem.h>
It's conditional upon CONFIG_MMU in there, but so's the use of
pte_offset_map() in arch/microblaze/kernel/signal.c 

So it shouldn't be a problem.

> > || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> > || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> > || linux/highmem.h).
> 
> Actually
> 
> arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h
> 
> arch/xtensa/platforms/iss/simdisk.c may have an issue?
> 	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
> 	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
> 	<sigh>

Yep - see above re major chain of indirect includes conditional upon CONFIG_BLOCK
and its uses in places that only build with such configs.  There's a plenty of
similar considerations outside of arch/*, unfortunately...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
