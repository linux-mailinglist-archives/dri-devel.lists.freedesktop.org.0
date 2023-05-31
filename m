Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F4717C09
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6691D10E4A5;
	Wed, 31 May 2023 09:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005C110E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685525718; x=1717061718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CeZyBNS3QF9KouIlDctPJ7e1JklhDZZucpDEsQfhwZw=;
 b=MHzgPv4z7jLmiZsWNNkbe9C6gZU+KSurRZbOtjK1pKXunXuTT9hNXyaH
 NecMAau3mlbIB56zt5vO6iN3o56oC1ii+5czNlex9ansqOa2Tfx0kX8Ok
 PHMjIkUaT6VHyYNu6KuCNJC7vU3C45WUcBfDF3jMgzk6T24bZPn6i5TxH
 0/sYal+KlcPxdVM7+KVnICmMUvct3bEGIS8zniBd5Cpnitm+I3TMFHk1P
 TJpbJeH+27pyEA/P4zduhic6nb6Cs5t/LS5u7KHBH2a8gV8ubRMtU7umS
 9eKIKgo0MCBLUq+yH5tOs5s/nmFLq5kKpi5zEWXQTRulpyaBmp2Tv9Gv+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="357578002"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="357578002"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="710002451"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="710002451"
Received: from itaraban-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 02:35:10 -0700
Date: Wed, 31 May 2023 11:35:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [RESUBMIT][PATCH] x86/mm: Fix PAT bit missing from page
 protection modify mask
Message-ID: <ZHcUyVdnJSr/kQ2K@ashyti-mobl2.lan>
References: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519183634.190364-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Juergen Gross <jgross@suse.com>, intel-linux@eclists.intel.com,
 x86@kernel.org, Yu Zhao <yuzhao@google.com>,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, drm-intel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marek =?iso-8859-15?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

a kind reminder about this fix.

Andi

On Fri, May 19, 2023 at 08:36:34PM +0200, Janusz Krzysztofik wrote:
> Visible glitches have been observed when running graphics applications on
> Linux under Xen hypervisor.  Those observations have been confirmed with
> failures from kms_pwrite_crc Intel GPU test that verifies data coherency
> of DRM frame buffer objects using hardware CRC checksums calculated by
> display controllers, exposed to userspace via debugfs.  Affected
> processing paths have then been identified with new IGT test variants that
> mmap the objects using different methods and caching modes [1].
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
> [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/0f0754413f14
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/7648
> Fixes: 281d4078bec3 ("x86: Make page cache mode a real type")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org # v3.19+
> ---
>  arch/x86/include/asm/pgtable.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 15ae4d6ba4768..56466afd04307 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -654,8 +654,10 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  #define pgprot_modify pgprot_modify
>  static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>  {
> -	pgprotval_t preservebits = pgprot_val(oldprot) & _PAGE_CHG_MASK;
> -	pgprotval_t addbits = pgprot_val(newprot) & ~_PAGE_CHG_MASK;
> +	unsigned long mask = _PAGE_CHG_MASK | _PAGE_CACHE_MASK;
> +
> +	pgprotval_t preservebits = pgprot_val(oldprot) & mask;
> +	pgprotval_t addbits = pgprot_val(newprot) & ~mask;
>  	return __pgprot(preservebits | addbits);
>  }
>  
> -- 
> 2.40.1
