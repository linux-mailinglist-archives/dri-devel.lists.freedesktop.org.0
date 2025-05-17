Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD5ABA898
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 09:02:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6A10E133;
	Sat, 17 May 2025 07:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T3gCiwps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D399C10E133
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 07:01:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B491B49EA2;
 Sat, 17 May 2025 07:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47667C4CEE3;
 Sat, 17 May 2025 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747465316;
 bh=0TGH3Z2yqnXd+NhMwwLuh0QscC/jqHB7HMFZA3nImdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3gCiwps+bvCo+e2c9WBsfA/DZdpcVi0pSLY4U1iOcbEjzWma91+nmTJfCQUuMiSI
 cDmEpnVUfXy+AFICgsKGty6tXCR2VfIMEjJQYfa9MuYlf+qEJlnOXPc31Q5RPzDkRT
 qco3VLd+egOpUy7gqCIR4iZgTdDtRjEPlUmNSHcfENC6t2n0QaxzudjXqcDhy/BnJ6
 dVufvXuNto/E+fDHK/yiguqhQgiULiKstVBsDTVd9EPeCWd9vpNuyu/HDV1ddF0BVE
 xDTwD7ZZsIQv0D0b6WK1kkqmdskguE4Z50oiawIrjOL6IlzhvX9ViktANk6RuXt8QK
 7UAR9rHg9I7tQ==
Date: Sat, 17 May 2025 09:01:49 +0200
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
Subject: Re: [PATCH v2 7/8] x86, lib: Add wbinvd and wbnoinvd helpers to
 target multiple CPUs
Message-ID: <aCg0Xc9fEB2Qn5Th@gmail.com>
References: <20250516212833.2544737-1-seanjc@google.com>
 <20250516212833.2544737-8-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516212833.2544737-8-seanjc@google.com>
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

> From: Zheyun Shen <szy0127@sjtu.edu.cn>
> 
> Extract KVM's open-coded calls to do writeback caches on multiple CPUs to
> common library helpers for both WBINVD and WBNOINVD (KVM will use both).
> Put the onus on the caller to check for a non-empty mask to simplify the
> SMP=n implementation, e.g. so that it doesn't need to check that the one
> and only CPU in the system is present in the mask.
> 
> Signed-off-by: Zheyun Shen <szy0127@sjtu.edu.cn>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Link: https://lore.kernel.org/r/20250128015345.7929-2-szy0127@sjtu.edu.cn
> [sean: move to lib, add SMP=n helpers, clarify usage]
> Acked-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/smp.h | 12 ++++++++++++
>  arch/x86/kvm/x86.c         |  8 +-------
>  arch/x86/lib/cache-smp.c   | 12 ++++++++++++
>  3 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index e08f1ae25401..fe98e021f7f8 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -113,7 +113,9 @@ void native_play_dead(void);
>  void play_dead_common(void);
>  void wbinvd_on_cpu(int cpu);
>  void wbinvd_on_all_cpus(void);
> +void wbinvd_on_many_cpus(struct cpumask *cpus);
>  void wbnoinvd_on_all_cpus(void);
> +void wbnoinvd_on_many_cpus(struct cpumask *cpus);

Let's go with the _on_cpumask() suffix:

    void wbinvd_on_cpu(int cpu);
   +void wbinvd_on_cpumask(struct cpumask *cpus);
    void wbinvd_on_all_cpus(void);

And the wb*invd_all_cpus() methods should probably be inlined wrappers 
with -1 as the cpumask, or so - not two separate functions?

In fact it would be nice to have the DRM preparatory patch and all the 
x86 patches at the beginning of the next version of the series, so 
those 4 patches can be applied to the x86 tree. Can make it a separate 
permanent branch based on v6.15-rc6/rc7.

Thanks,

	Ingo
