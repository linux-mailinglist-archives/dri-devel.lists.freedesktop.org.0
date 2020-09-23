Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F452274D9D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 02:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C3889E5B;
	Wed, 23 Sep 2020 00:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090B46E3B7;
 Wed, 23 Sep 2020 00:05:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB822239A1;
 Wed, 23 Sep 2020 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600819538;
 bh=BN2JO8cF+jS2JfvaTCuvroT3lVzAjAOUVtydtxaO3O4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mmPGcm7LxHfM3JkO5ukjrArXyU1stUbRtAzscnDWEGc5Aza2N+gH0OERfj402Z7+n
 8PvMXWK05ebNEqKv4755UuUp0qiqi0R46iiKvnS6ot9b86RGdNOKVtk3VzgEbcs4gc
 6pcfGM0E8ZH8NSSWjmZRwuT92Y5H/UBEelVk9/FM=
Received: by mail-lf1-f46.google.com with SMTP id u8so20025051lff.1;
 Tue, 22 Sep 2020 17:05:37 -0700 (PDT)
X-Gm-Message-State: AOAM5306P/jZamt5BT5gI+5vdWUGWSqL7hOFgEYTwldQVTd3e1FbS2KQ
 Dg/HPeaiTrWgSWIWAoPPH09H3p4JG4aDuxwO4WI=
X-Google-Smtp-Source: ABdhPJzKHKLgsGXChluCkkkYPY85+IzWQtpjD+xwRPqP5lLV/gun1FBs3gKk0smb1Hrbxlj4VdZ3a5tMZisYukVr51E=
X-Received: by 2002:ac2:51aa:: with SMTP id f10mr2347652lfk.451.1600819535428; 
 Tue, 22 Sep 2020 17:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <20200919092616.432209211@linutronix.de>
In-Reply-To: <20200919092616.432209211@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Sep 2020 08:05:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTcs2589gj6iYhumuoXPa6ejycedAKv4O8QwXQkKU0_fw@mail.gmail.com>
Message-ID: <CAJF2gTTcs2589gj6iYhumuoXPa6ejycedAKv4O8QwXQkKU0_fw@mail.gmail.com>
Subject: Re: [patch RFC 06/15] csky/mm/highmem: Switch to generic kmap atomic
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Guo Ren <guoren@kernel.org>

On Sat, Sep 19, 2020 at 5:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
> ---
> Note: Completely untested
> ---
>  arch/csky/Kconfig               |    1
>  arch/csky/include/asm/highmem.h |    4 +-
>  arch/csky/mm/highmem.c          |   75 ----------------------------------------
>  3 files changed, 5 insertions(+), 75 deletions(-)
>
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -285,6 +285,7 @@ config NR_CPUS
>  config HIGHMEM
>         bool "High Memory Support"
>         depends on !CPU_CK610
> +       select KMAP_ATOMIC_GENERIC
>         default y
>
>  config FORCE_MAX_ZONEORDER
> --- a/arch/csky/include/asm/highmem.h
> +++ b/arch/csky/include/asm/highmem.h
> @@ -32,10 +32,12 @@ extern pte_t *pkmap_page_table;
>
>  #define ARCH_HAS_KMAP_FLUSH_TLB
>  extern void kmap_flush_tlb(unsigned long addr);
> -extern void *kmap_atomic_pfn(unsigned long pfn);
>
>  #define flush_cache_kmaps() do {} while (0)
>
> +#define arch_kmap_temp_post_map(vaddr, pteval) kmap_flush_tlb(vaddr)
> +#define arch_kmap_temp_post_unmap(vaddr)       kmap_flush_tlb(vaddr)
> +
>  extern void kmap_init(void);
>
>  #endif /* __KERNEL__ */
> --- a/arch/csky/mm/highmem.c
> +++ b/arch/csky/mm/highmem.c
> @@ -9,8 +9,6 @@
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>
> -static pte_t *kmap_pte;
> -
>  unsigned long highstart_pfn, highend_pfn;
>
>  void kmap_flush_tlb(unsigned long addr)
> @@ -19,67 +17,7 @@ void kmap_flush_tlb(unsigned long addr)
>  }
>  EXPORT_SYMBOL(kmap_flush_tlb);
>
> -void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
> -{
> -       unsigned long vaddr;
> -       int idx, type;
> -
> -       type = kmap_atomic_idx_push();
> -       idx = type + KM_TYPE_NR*smp_processor_id();
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> -#ifdef CONFIG_DEBUG_HIGHMEM
> -       BUG_ON(!pte_none(*(kmap_pte - idx)));
> -#endif
> -       set_pte(kmap_pte-idx, mk_pte(page, prot));
> -       flush_tlb_one((unsigned long)vaddr);
> -
> -       return (void *)vaddr;
> -}
> -EXPORT_SYMBOL(kmap_atomic_high_prot);
> -
> -void kunmap_atomic_high(void *kvaddr)
> -{
> -       unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
> -       int idx;
> -
> -       if (vaddr < FIXADDR_START)
> -               return;
> -
> -#ifdef CONFIG_DEBUG_HIGHMEM
> -       idx = KM_TYPE_NR*smp_processor_id() + kmap_atomic_idx();
> -
> -       BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
> -
> -       pte_clear(&init_mm, vaddr, kmap_pte - idx);
> -       flush_tlb_one(vaddr);
> -#else
> -       (void) idx; /* to kill a warning */
> -#endif
> -       kmap_atomic_idx_pop();
> -}
> -EXPORT_SYMBOL(kunmap_atomic_high);
> -
> -/*
> - * This is the same as kmap_atomic() but can map memory that doesn't
> - * have a struct page associated with it.
> - */
> -void *kmap_atomic_pfn(unsigned long pfn)
> -{
> -       unsigned long vaddr;
> -       int idx, type;
> -
> -       pagefault_disable();
> -
> -       type = kmap_atomic_idx_push();
> -       idx = type + KM_TYPE_NR*smp_processor_id();
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> -       set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
> -       flush_tlb_one(vaddr);
> -
> -       return (void *) vaddr;
> -}
> -
> -static void __init kmap_pages_init(void)
> +void __init kmap_init(void)
>  {
>         unsigned long vaddr;
>         pgd_t *pgd;
> @@ -96,14 +34,3 @@ static void __init kmap_pages_init(void)
>         pte = pte_offset_kernel(pmd, vaddr);
>         pkmap_page_table = pte;
>  }
> -
> -void __init kmap_init(void)
> -{
> -       unsigned long vaddr;
> -
> -       kmap_pages_init();
> -
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN);
> -
> -       kmap_pte = pte_offset_kernel((pmd_t *)pgd_offset_k(vaddr), vaddr);
> -}
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
