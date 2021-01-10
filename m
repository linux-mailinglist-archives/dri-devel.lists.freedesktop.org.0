Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA912F0DBE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489ED8994A;
	Mon, 11 Jan 2021 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2AE89D00;
 Sun, 10 Jan 2021 11:35:34 +0000 (UTC)
Date: Sun, 10 Jan 2021 11:35:01 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Message-Id: <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
In-Reply-To: <20210109003352.GA18102@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
 <20210109003352.GA18102@alpha.franken.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: juri.lelli@redhat.com, linux-aio@kvack.org, airlied@linux.ie,
 nouveau@lists.freedesktop.org, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 bsegall@google.com, jcmvbkbc@gmail.com, ray.huang@amd.com, paulus@samba.org,
 kraxel@redhat.com, sparclinux@vger.kernel.org, deanbo422@gmail.com, hch@lst.de,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le sam. 9 janv. 2021 =E0 1:33, Thomas Bogendoerfer =

<tsbogend@alpha.franken.de> a =E9crit :
> On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
>>  On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
>>  > Hi Thomas,
>>  >
>>  > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this =

>> commit.
>>  >
>>  > Any idea what could be happening?
>> =

>>  not yet, kernel crash log of a Malta QEMU is below.
> =

> update:
> =

> This dirty hack lets the Malta QEMU boot again:
> =

> diff --git a/mm/highmem.c b/mm/highmem.c
> index c3a9ea7875ef..190cdda1149d 100644
> --- a/mm/highmem.c
> +++ b/mm/highmem.c
> @@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, =

> pgprot_t prot)
>  	vaddr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
>  	BUG_ON(!pte_none(*(kmap_pte - idx)));
>  	pteval =3D pfn_pte(pfn, prot);
> -	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
> +	set_pte(kmap_pte - idx, pteval);
>  	arch_kmap_local_post_map(vaddr, pteval);
>  	current->kmap_ctrl.pteval[kmap_local_idx()] =3D pteval;
>  	preempt_enable();
> =

> set_pte_at() tries to update cache and could do an kmap_atomic() =

> there.
> Not sure, if this is allowed at this point.

Yes, I can confirm that your workaround works here too.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
