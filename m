Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B94465B6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 16:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF26E8A2;
	Fri,  5 Nov 2021 15:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6446E894;
 Fri,  5 Nov 2021 15:29:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="295364646"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="295364646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:29:31 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="668276282"
Received: from lucas-s2600cw.jf.intel.com (HELO lucas-S2600CW)
 ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 08:29:31 -0700
Date: Fri, 5 Nov 2021 08:29:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org
Subject: Re: [PATCH 2/2] x86/mm: nuke PAGE_KERNEL_IO
Message-ID: <20211105152936.vp4xikbg23uob7n3@lucas-S2600CW>
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
 <20211021181511.1533377-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211021181511.1533377-3-lucas.demarchi@intel.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, gentle ping on this. Is it something that could go through the tip
tree?

thanks
Lucas De Marchi

On Thu, Oct 21, 2021 at 11:15:11AM -0700, Lucas De Marchi wrote:
>PAGE_KERNEL_IO is only defined for x86 and nowadays is the same as
>PAGE_KERNEL. It was different for some time, OR'ing a `_PAGE_IOMAP` flag
>in commit be43d72835ba ("x86: add _PAGE_IOMAP pte flag for IO
>mappings").  This got removed in commit f955371ca9d3 ("x86: remove the
>Xen-specific _PAGE_IOMAP PTE flag"), so today they are just the same.
>
>With the last users outside arch/x86 being remove we can now remove
>PAGE_KERNEL_IO.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> arch/x86/include/asm/fixmap.h        | 2 +-
> arch/x86/include/asm/pgtable_types.h | 7 -------
> arch/x86/mm/ioremap.c                | 2 +-
> arch/x86/xen/setup.c                 | 2 +-
> include/asm-generic/fixmap.h         | 2 +-
> 5 files changed, 4 insertions(+), 11 deletions(-)
>
>diff --git a/arch/x86/include/asm/fixmap.h b/arch/x86/include/asm/fixmap.h
>index d0dcefb5cc59..5e186a69db10 100644
>--- a/arch/x86/include/asm/fixmap.h
>+++ b/arch/x86/include/asm/fixmap.h
>@@ -173,7 +173,7 @@ static inline void __set_fixmap(enum fixed_addresses idx,
>  * supported for MMIO addresses, so make sure that the memory encryption
>  * mask is not part of the page attributes.
>  */
>-#define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_IO_NOCACHE
>+#define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
>
> /*
>  * Early memremap routines used for in-place encryption. The mappings created
>diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
>index 40497a9020c6..a87224767ff3 100644
>--- a/arch/x86/include/asm/pgtable_types.h
>+++ b/arch/x86/include/asm/pgtable_types.h
>@@ -199,10 +199,6 @@ enum page_cache_mode {
> #define __PAGE_KERNEL_WP	 (__PP|__RW|   0|___A|__NX|___D|   0|___G| __WP)
>
>
>-#define __PAGE_KERNEL_IO		__PAGE_KERNEL
>-#define __PAGE_KERNEL_IO_NOCACHE	__PAGE_KERNEL_NOCACHE
>-
>-
> #ifndef __ASSEMBLY__
>
> #define __PAGE_KERNEL_ENC	(__PAGE_KERNEL    | _ENC)
>@@ -223,9 +219,6 @@ enum page_cache_mode {
> #define PAGE_KERNEL_LARGE_EXEC	__pgprot_mask(__PAGE_KERNEL_LARGE_EXEC | _ENC)
> #define PAGE_KERNEL_VVAR	__pgprot_mask(__PAGE_KERNEL_VVAR       | _ENC)
>
>-#define PAGE_KERNEL_IO		__pgprot_mask(__PAGE_KERNEL_IO)
>-#define PAGE_KERNEL_IO_NOCACHE	__pgprot_mask(__PAGE_KERNEL_IO_NOCACHE)
>-
> #endif	/* __ASSEMBLY__ */
>
> /*         xwr */
>diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
>index 026031b3b782..3102dda4b152 100644
>--- a/arch/x86/mm/ioremap.c
>+++ b/arch/x86/mm/ioremap.c
>@@ -243,7 +243,7 @@ __ioremap_caller(resource_size_t phys_addr, unsigned long size,
> 	 * make sure the memory encryption attribute is enabled in the
> 	 * resulting mapping.
> 	 */
>-	prot = PAGE_KERNEL_IO;
>+	prot = PAGE_KERNEL;
> 	if ((io_desc.flags & IORES_MAP_ENCRYPTED) || encrypted)
> 		prot = pgprot_encrypted(prot);
>
>diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
>index 8bfc10330107..5dc0771a50f3 100644
>--- a/arch/x86/xen/setup.c
>+++ b/arch/x86/xen/setup.c
>@@ -435,7 +435,7 @@ static unsigned long __init xen_set_identity_and_remap_chunk(
> 	for (pfn = start_pfn; pfn <= max_pfn_mapped && pfn < end_pfn; pfn++)
> 		(void)HYPERVISOR_update_va_mapping(
> 			(unsigned long)__va(pfn << PAGE_SHIFT),
>-			mfn_pte(pfn, PAGE_KERNEL_IO), 0);
>+			mfn_pte(pfn, PAGE_KERNEL), 0);
>
> 	return remap_pfn;
> }
>diff --git a/include/asm-generic/fixmap.h b/include/asm-generic/fixmap.h
>index 8cc7b09c1bc7..f1b0c6f3d0be 100644
>--- a/include/asm-generic/fixmap.h
>+++ b/include/asm-generic/fixmap.h
>@@ -54,7 +54,7 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
> #define FIXMAP_PAGE_NOCACHE PAGE_KERNEL_NOCACHE
> #endif
> #ifndef FIXMAP_PAGE_IO
>-#define FIXMAP_PAGE_IO PAGE_KERNEL_IO
>+#define FIXMAP_PAGE_IO PAGE_KERNEL
> #endif
> #ifndef FIXMAP_PAGE_CLEAR
> #define FIXMAP_PAGE_CLEAR __pgprot(0)
>-- 
>2.33.1
>
>
