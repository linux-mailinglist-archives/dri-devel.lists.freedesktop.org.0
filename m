Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747082F296F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAFA6E0A8;
	Tue, 12 Jan 2021 07:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Mon, 11 Jan 2021 09:24:55 UTC
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0E189780;
 Mon, 11 Jan 2021 09:24:55 +0000 (UTC)
Date: Mon, 11 Jan 2021 10:16:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1610356608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LEXe/B0Q3kSQ+pyi11QVzunFEXSDJfyzRctZD/mSGwY=;
 b=uCnnwbctZA1rQ3V0p2kZu+d3zaZFHTKUJPOo76b5D7cuxWEOXVJdpIqiLFP5aTXpvIjv9s
 qwAvW5WhwffRTnvcztEi2+1v/oENxwE79UOubMC7jJKeubOBD6zsvQUL74GztGQIAKB8HO
 BT4sxjhTakFs4dVqAQh6GY6Sn14JBtplCvPA2cmstH/p72FEB2TnSYVyeSL8sjTNI80v3T
 oCsDUl6wYJXQ9QueQxoB6wuP+fNUTobWuAtyizRQCOtZthAqYs4ojlXRNfsr2J83hANEKU
 KrLFmoV7Ai9vVG4RtXD3Lh/qUjXo6jULZnNtu/UYw3EhRXUZtNRGRg4NMuxugQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1610356608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LEXe/B0Q3kSQ+pyi11QVzunFEXSDJfyzRctZD/mSGwY=;
 b=aQ0P+BB77W0OA8uLsIQDcnYrwKkOka8jvG0VLRGl2/Wpm04Edp57/CM7syBgLiKrsJkDcC
 9SLKzMSTP9RzBiAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Message-ID: <20210111091646.hkugbtlcced3vmno@linutronix.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
 <20210109003352.GA18102@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109003352.GA18102@alpha.franken.de>
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: juri.lelli@redhat.com, linux-aio@kvack.org,
 Paul Cercueil <paul@crapouillou.net>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com,
 ray.huang@amd.com, paulus@samba.org, kraxel@redhat.com,
 sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
 vincent.guittot@linaro.org, paulmck@kernel.org, mpe@ellerman.id.au,
 x86@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 mingo@kernel.org, peterz@infradead.org, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, airlied@redhat.com, linux-snps-arc@lists.infradead.org,
 linux-mm@kvack.org, mgorman@suse.de, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, intel-gfx@lists.freedesktop.org, sroland@vmware.com,
 josef@toxicpanda.com, rostedt@goodmis.org, torvalds@linuxfoundation.org,
 green.hu@gmail.com, rodrigo.vivi@intel.com, dsterba@suse.com,
 tglx@linutronix.de, virtualization@lists.linux-foundation.org,
 dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, monstr@monstr.eu, nickhu@andestech.com, clm@fb.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, bcrl@kvack.org, spice-devel@lists.freedesktop.org,
 vgupta@synopsys.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 bristot@redhat.com, davem@davemloft.net, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-09 01:33:52 [+0100], Thomas Bogendoerfer wrote:
> On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
> > On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> > > Hi Thomas,
> > > 
> > > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> > > 
> > > Any idea what could be happening?
> > 
> > not yet, kernel crash log of a Malta QEMU is below.
> 
> update:
> 
> This dirty hack lets the Malta QEMU boot again:
> 
> diff --git a/mm/highmem.c b/mm/highmem.c
> index c3a9ea7875ef..190cdda1149d 100644
> --- a/mm/highmem.c
> +++ b/mm/highmem.c
> @@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
>  	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
>  	BUG_ON(!pte_none(*(kmap_pte - idx)));
>  	pteval = pfn_pte(pfn, prot);
> -	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
> +	set_pte(kmap_pte - idx, pteval);
>  	arch_kmap_local_post_map(vaddr, pteval);
>  	current->kmap_ctrl.pteval[kmap_local_idx()] = pteval;
>  	preempt_enable();
> 
> set_pte_at() tries to update cache and could do an kmap_atomic() there.
So the old implementation used set_pte() while the new one uses
set_pte_at().

> Not sure, if this is allowed at this point.
The problem is the recursion
  kmap_atomic() -> __update_cache() -> kmap_atomic()

and kmap_local_idx_push() runs out if index space before stack space.

I'm not sure if the __update_cache() worked for highmem. It has been
added for that in commit
   f4281bba81810 ("MIPS: Handle highmem pages in __update_cache")

but it assumes that the address returned by kmap_atomic() is the same or
related enough for flush_data_cache_page() to work.

> Thomas.
> 

Sebastian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
