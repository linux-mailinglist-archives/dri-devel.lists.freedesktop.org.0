Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8416F151D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 12:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B89110E3A1;
	Fri, 28 Apr 2023 10:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1336D10E3A1;
 Fri, 28 Apr 2023 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682676960; x=1714212960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qSnBD9Q/OPngNLKT5XE2IH5dyiEzxoNCFq97JA9HfyU=;
 b=lWYucIY6+OIKgt1/eFPFuYIuyKDMyV9p5HwUE2Wc3s4BJZ/+bwJLmLJ3
 R2k6LHMN3JVVRENak1nB9NY1pf70cPCgMxGwkfTFTftErn1ILnW6+FB5W
 9CdXmQ11rYpwtBdz7k1oOKvqy45Vg1hpRYv23NxPZoL07UFr6cKGUFu7p
 pMCd3T0BDPqYU+601yblNyhazYnu4ikdpE785eMtL8y52RBt+XEDfC9zT
 7cZUkMRoTxk1Ks9naS2Np94ASjh5M/xUuH8Lt8c3kU2L/mrWFDYbFpGZa
 bOceyEIJACcawJ4Sbz2cLX/VhyrvbyHjZQ8/PhYb031nkmBqDtIY8a0z1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336764979"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="336764979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 03:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="838802319"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="838802319"
Received: from ahermans-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 03:15:53 -0700
Date: Fri, 28 Apr 2023 12:15:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
Message-ID: <ZEuc12/4hilGXYUL@ashyti-mobl2.lan>
References: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org,
 Yu Zhao <yuzhao@google.com>, David Hildenbrand <david@redhat.com>,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Mon, Apr 24, 2023 at 02:35:24PM +0200, Janusz Krzysztofik wrote:
> Visible glitches have been observed when running graphics applications on
> Linux under Xen hypervisor.  Those observations have been confirmed with
> failures from kms_pwrite_crc Intel GPU test that verifies data coherency
> of DRM frame buffer objects using hardware CRC checksums calculated by
> display controllers, exposed to userspace via debugfs.  Affected
> processing paths have then been identified with new test variants that
> mmap the objects using different methods and caching modes.
> 
> When running as a Xen PV guest, Linux uses Xen provided PAT configuration
> which is different from its native one.  In particular, Xen specific PTE
> encoding of write-combining caching, likely used by graphics applications,
> differs from the Linux default one found among statically defined minimal
> set of supported modes.  Since Xen defines PTE encoding of the WC mode as
> _PAGE_PAT, it no longer belongs to the minimal set, depends on correct
> handling of _PAGE_PAT bit, and can be mismatched with write-back caching.
> 
> When a user calls mmap() for a DRM buffer object, DRM device specific
> .mmap file operation, called from mmap_region(), takes care of setting PTE
> encoding bits in a vm_page_prot field of an associated virtual memory area
> structure.  Unfortunately, _PAGE_PAT bit is not preserved when the vma's
> .vm_flags are then applied to .vm_page_prot via vm_set_page_prot().  Bits
> to be preserved are determined with _PAGE_CHG_MASK symbol that doesn't
> cover _PAGE_PAT.  As a consequence, WB caching is requested instead of WC
> when running under Xen (also, WP is silently changed to WT, and UC
> downgraded to UC_MINUS).  When running on bare metal, WC is not affected,
> but WP and WT extra modes are unintentionally replaced with WC and UC,
> respectively.
> 
> WP and WT modes, encoded with _PAGE_PAT bit set, were introduced by commit
> 281d4078bec3 ("x86: Make page cache mode a real type").  Care was taken
> to extend _PAGE_CACHE_MASK symbol with that additional bit, but that
> symbol has never been used for identification of bits preserved when
> applying page protection flags.  Support for all cache modes under Xen,
> including the problematic WC mode, was then introduced by commit
> 47591df50512 ("xen: Support Xen pv-domains using PAT").
> 
> Extend bitmask used by pgprot_modify() for selecting bits to be preserved
> with _PAGE_PAT bit.  However, since that bit can be reused as _PAGE_PSE,
> and the _PAGE_CHG_MASK symbol, primarly used by pte_modify(), is likely
> intentionally defined with that bit not set, keep that symbol unchanged.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7648
> Fixes: 281d4078bec3 ("x86: Make page cache mode a real type")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: stable@vger.kernel.org # v3.19+
> ---
>  arch/x86/include/asm/pgtable.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 7425f32e52932..f797f8da2e5b6 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -654,8 +654,10 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  #define pgprot_modify pgprot_modify
>  static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>  {
> -	pgprotval_t preservebits = pgprot_val(oldprot) & _PAGE_CHG_MASK;
> -	pgprotval_t addbits = pgprot_val(newprot) & ~_PAGE_CHG_MASK;
> +	unsigned long mask = _PAGE_CHG_MASK | _PAGE_CACHE_MASK;

nice catch!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi

> +
> +	pgprotval_t preservebits = pgprot_val(oldprot) & mask;
> +	pgprotval_t addbits = pgprot_val(newprot) & ~mask;
>  	return __pgprot(preservebits | addbits);
>  }
>  
> -- 
> 2.40.0
