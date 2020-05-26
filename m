Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C51C92E3
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88246E9D8;
	Thu,  7 May 2020 15:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3FD6E9D8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:00:08 +0000 (UTC)
IronPort-SDR: HHeKh1PAki0zRwgPy6AZcCI8gXykCVou9DsWTiLgoIhVDowWe94st5OlnrW9zkjwbBhA1ykW13
 Q3sibJ6Y0gFg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:07 -0700
IronPort-SDR: b/s7ZWxVBNmG4J2I+k7yxw4bkhrO5iMaLGMsoiM7CLNhxvnQQ99q0hnTaoBLVOL1NGGxx8SlhW
 4VsFNQaNuTzg==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="407664102"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:06 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 00/15] Remove duplicated kmap code
Date: Thu,  7 May 2020 07:59:48 -0700
Message-Id: <20200507150004.1423069-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code by defining core functions
which call into the architectures only when needed.

Some of the k[un]map_atomic() implementations have some similarities but the
similarities were not sufficient to warrant further changes.

In addition we remove a duplicate implementation of kmap() in DRM.

Testing was done by 0day to cover all the architectures I can't readily
build/test.

---
Changes from V2:
	Collect review/acks
	Add kmap_prot consolidation patch from Christoph
	Add 3 suggested patches from Al Viro
	Fix include for microblaze
	Fix static inline for microblaze

Changes from V1:
	Fix bisect-ability
	Update commit message and fix line lengths
	Remove unneded kunmap_atomic_high() declarations
	Remove unneded kmap_atomic_high() declarations
	collect reviews
	rebase to 5.7-rc4

Changes from V0:
	Define kmap_flush_tlb() and make kmap() truely arch independent.
	Redefine the k[un]map_atomic_* code to call into the architectures for
		high mem pages
	Ensure all architectures define kmap_prot, use it appropriately, and
		define kmap_atomic_prot()
	Remove drm implementation of kmap_atomic()


Ira Weiny (15):
  arch/kmap: Remove BUG_ON()
  arch/xtensa: Move kmap build bug out of the way
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  {x86,powerpc,microblaze}/kmap: Move preempt disable
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code
  arch/kmap: Ensure kmap_prot visibility
  arch/kmap: Don't hard code kmap_prot values
  arch/kmap: Define kmap_atomic_prot() for all arch's
  drm: Remove drm specific kmap_atomic code
  kmap: Remove kmap_atomic_to_page()
  parisc/kmap: Remove duplicate kmap code
  sparc: Remove unnecessary includes
  kmap: Consolidate kmap_prot definitions

 arch/arc/include/asm/highmem.h        | 18 -------
 arch/arc/mm/highmem.c                 | 28 ++--------
 arch/arm/include/asm/highmem.h        |  9 ----
 arch/arm/mm/highmem.c                 | 35 ++-----------
 arch/csky/include/asm/highmem.h       | 12 +----
 arch/csky/mm/highmem.c                | 56 ++++----------------
 arch/microblaze/include/asm/highmem.h | 27 ----------
 arch/microblaze/mm/highmem.c          | 16 ++----
 arch/microblaze/mm/init.c             |  3 --
 arch/mips/include/asm/highmem.h       | 11 +---
 arch/mips/mm/cache.c                  |  6 +--
 arch/mips/mm/highmem.c                | 49 +++---------------
 arch/nds32/include/asm/highmem.h      |  9 ----
 arch/nds32/mm/highmem.c               | 39 ++------------
 arch/parisc/include/asm/cacheflush.h  | 30 +----------
 arch/powerpc/include/asm/highmem.h    | 28 ----------
 arch/powerpc/mm/highmem.c             | 21 ++------
 arch/powerpc/mm/mem.c                 |  3 --
 arch/sparc/include/asm/highmem.h      | 25 +--------
 arch/sparc/mm/highmem.c               | 20 ++------
 arch/sparc/mm/io-unit.c               |  1 -
 arch/sparc/mm/iommu.c                 |  1 -
 arch/x86/include/asm/fixmap.h         |  1 -
 arch/x86/include/asm/highmem.h        |  9 ----
 arch/x86/mm/highmem_32.c              | 50 ++----------------
 arch/xtensa/include/asm/highmem.h     | 27 ----------
 arch/xtensa/mm/highmem.c              | 22 ++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c     | 56 ++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c  | 16 +++---
 include/drm/ttm/ttm_bo_api.h          |  4 --
 include/linux/highmem.h               | 74 ++++++++++++++++++++++++---
 31 files changed, 150 insertions(+), 556 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
