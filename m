Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C4ABD3A2
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B285D10E217;
	Tue, 20 May 2025 09:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z9bihbti";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC0510E217
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:41:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF74E5C05CD;
 Tue, 20 May 2025 09:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0C7C4CEEB;
 Tue, 20 May 2025 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747734090;
 bh=B9V4qKH/i2E6tTGsCihryVv51mK/NkF7DleeEUfylJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z9bihbti/zHkO7bNWfl3FNjyyDAvgGIFI03fN1Zy2940E5kNMtKoZkx9NDQiFRPTs
 pOFCN5jDOYRdQwoDSKZEmaS2AMsVaQS+IsuDEbaRCfuNgChUaZOF3SJlmw9StJsrR1
 xT4GvbMEZs0a9rFFgFG8Eh2tnbe8VLhqhe/P0882MM2FLPjCv2P37ctawPBaM2ln7r
 1vpFDl4TsOm1BgVLibctOaaYHuaHCTezYGO/J3fnsXZWaEB6Dy5KA1I6d1sUuNAlER
 sJqhwX4+YFJVGbu1D39rCtcKSgoFWDqUsoY3BmWFU73AddxobgQ1y+zU8JGSd8uLBq
 kH3VCQ8TEqD+w==
Date: Tue, 20 May 2025 11:41:24 +0200
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
Message-ID: <aCxORJga9goyt9N7@gmail.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-5-seanjc@google.com>
 <aCgw6sbpE6f42sC_@gmail.com> <aCtcqlP8MAqgyTbd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCtcqlP8MAqgyTbd@google.com>
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

> > and to point out that the 'invalidate' part of the WBNOINVD name is 
> > a misnomer, as it doesn't invalidate anything, it only writes back 
> > dirty cachelines.
> 
> I wouldn't call it a misnomer, the NO part makes it semantically 
> accurate.

If only 'NO' in that context was unambiguous: initially I fully read it 
as some sort of acronym or abbreviation :) Why wasn't it named WBCACHE 
or so? But I digress.

> [...]  I actually think the mnemonic was well chosen, as it helps 
> capture the relationships and behaviors of INVD, WBINVD, and 
> WBNOINVD.
> 
> How about this?

Much better!

> +/*
> + * Write back all modified lines in all levels of cache associated with this
> + * logical processor to main memory, and then invalidate all caches.  Depending
> + * on the micro-architecture, WBINVD (and WBNOINVD below) may or may not affect
> + * lower level caches associated with another logical processor that shares any
> + * level of this processor’s cache hierarchy.
> + *
> + * Note, AMD CPUs enumerate the behavior or WB{NO}{INVD} with respect to other
> + * logical, non-originating processors in CPUID 0x8000001D.EAX[N:0].
> + */
>  static __always_inline void wbinvd(void)
>  {
> +       asm volatile("wbinvd" : : : "memory");
> +}
> +
> +/* Instruction encoding provided for binutils backwards compatibility. */
> +#define ASM_WBNOINVD _ASM_BYTES(0xf3,0x0f,0x09)
> +
> +/*
> + * Write back all modified lines in all levels of cache associated with this
> + * logical processor to main memory, but do NOT explicitly invalidate caches,
> + * i.e. leave all/most cache lines in the hierarchy in non-modified state.
> + */
> +static __always_inline void wbnoinvd(void)
> +{
> +       /*
> +        * Explicitly encode WBINVD if X86_FEATURE_WBNOINVD is unavailable even
> +        * though WBNOINVD is backwards compatible (it's simply WBINVD with an
> +        * ignored REP prefix), to guarantee that WBNOINVD isn't used if it
> +        * needs to be avoided for any reason.  For all supported usage in the
> +        * kernel, WBINVD is functionally a superset of WBNOINVD.
> +        */
> +       alternative("wbinvd", ASM_WBNOINVD, X86_FEATURE_WBNOINVD);
>  }

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
