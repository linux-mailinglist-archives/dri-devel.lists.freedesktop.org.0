Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA242ABA889
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 08:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE30210E059;
	Sat, 17 May 2025 06:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OM7++1gd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F0E10E059
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 06:47:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1415B44650;
 Sat, 17 May 2025 06:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECB2C4CEE3;
 Sat, 17 May 2025 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747464433;
 bh=RHK4CtJGH2p06WOpFgy9zdi60XoyDOOf/9Jg0eJNxR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OM7++1gdM4gVt7G7V4rBgQVdky8Cd43RBI4rk4vpM1SIP+vJWrMuYsMUVcgqF2BkT
 Wmf/Te1qMODBePzh2uxrxk5QOIaKt0EFN4rLbUZ1CxWw3jsFsUdtSf2clwDo3RyVrV
 mKlHUHwzC0Oa0OGiVl0FZB6fGY0tKn5QWHVUoymYdm5vL0l6six0AFyyI5mPO/dsVA
 ZdXShhtauTw0M1a7RKRPqL+KNdNvwurPp6kiRItc0w0VdvwJPHQHUQWF+tJ9Lh1oBT
 Pe6KiTR233c620DnlDcywLHVI+KTOPwbiDs3ado0i+P5E2/ubNZr4abgYysRb+dvrb
 ciaIckKYW3rcA==
Date: Sat, 17 May 2025 08:47:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zheyun Shen <szy0127@sjtu.edu.cn>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Kevin Loughlin <kevinloughlin@google.com>,
 Kai Huang <kai.huang@intel.com>, Mingwei Zhang <mizhang@google.com>
Subject: Re: [PATCH v2 4/8] x86, lib: Add WBNOINVD helper functions
Message-ID: <aCgw6sbpE6f42sC_@gmail.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-5-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516212833.2544737-5-seanjc@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


* Sean Christopherson <seanjc@google.com> wrote:

> From: Kevin Loughlin <kevinloughlin@google.com>
> 
> In line with WBINVD usage, add WBONINVD helper functions.  Fall back to
> WBINVD (via alternative()) if WBNOINVD isn't supported, as WBINVD provides
> a superset of functionality, just more slowly.
> 
> Note, alternative() ensures compatibility with early boot code as needed.
> 
> Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> [sean: massage changelog and comments, use ASM_WBNOINVD and _ASM_BYTES]
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/smp.h           |  6 ++++++
>  arch/x86/include/asm/special_insns.h | 19 ++++++++++++++++++-
>  arch/x86/lib/cache-smp.c             | 11 +++++++++++
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index 028f126018c9..e08f1ae25401 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -113,6 +113,7 @@ void native_play_dead(void);
>  void play_dead_common(void);
>  void wbinvd_on_cpu(int cpu);
>  void wbinvd_on_all_cpus(void);
> +void wbnoinvd_on_all_cpus(void);
>  
>  void smp_kick_mwait_play_dead(void);
>  void __noreturn mwait_play_dead(unsigned int eax_hint);
> @@ -153,6 +154,11 @@ static inline void wbinvd_on_all_cpus(void)
>  	wbinvd();
>  }
>  
> +static inline void wbnoinvd_on_all_cpus(void)
> +{
> +	wbnoinvd();
> +}
> +
>  static inline struct cpumask *cpu_llc_shared_mask(int cpu)
>  {
>  	return (struct cpumask *)cpumask_of(0);
> diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
> index 6266d6b9e0b8..46b3961e3e4b 100644
> --- a/arch/x86/include/asm/special_insns.h
> +++ b/arch/x86/include/asm/special_insns.h
> @@ -117,7 +117,24 @@ static inline void wrpkru(u32 pkru)
>  
>  static __always_inline void wbinvd(void)
>  {
> -	asm volatile("wbinvd": : :"memory");
> +	asm volatile("wbinvd" : : : "memory");
> +}
> +
> +/* Instruction encoding provided for binutils backwards compatibility. */
> +#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
> +
> +/*
> + * Cheaper version of wbinvd(). Call when caches need to be written back but
> + * not invalidated.
> + */
> +static __always_inline void wbnoinvd(void)
> +{
> +	/*
> +	 * If WBNOINVD is unavailable, fall back to the compatible but
> +	 * more destructive WBINVD (which still writes the caches back
> +	 * but also invalidates them).
> +	 */
> +	alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
>  }

Would be nice here to use the opportunity and document both WBINVD and 
WBNOINVD a bit more comprehensively, to point out that WBINVD writes 
back and flushes the caches (and point out which level of caches this 
affects typically), and to point out that the 'invalidate' part of the 
WBNOINVD name is a misnomer, as it doesn't invalidate anything, it only 
writes back dirty cachelines.

Thanks,

	Ingo
