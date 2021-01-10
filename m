Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A6D2F0DCC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EE889A57;
	Mon, 11 Jan 2021 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 498 seconds by postgrey-1.36 at gabe;
 Sun, 10 Jan 2021 12:06:59 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC3589EEB;
 Sun, 10 Jan 2021 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610280417;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:From:
 Subject:Sender;
 bh=suxnFiUZXehwYdxu3HHH3yerlSomJchhrhNdK2IYwzY=;
 b=kgjzebl1pdLpd8gwEDpD6V0AERckmwr/qqxoAMpwMgVX0Q4DpvO+VntOMRltmiQTDf
 mpBCzLfPuAk3J9C3bqVCH01CKkmDSReG+JazzEaC3vOUnfZGXdEbjle0AUpPDDj2C6oY
 DU3ZC9Ow5HnHwZzMh/+500aiAaOaYmAKG+UrVmXfpO69iZqh89Cxys2HuEoolyaQ+uCs
 nWaOP9ngk7ShCRXAfxfOnmWzsQ96R5eufk2jNuH9dEl2p5eXccnFjW1t7m+TBEUb7UQK
 W9Xq1LN84At+ImQ5P/VCbmi7XtANU1tTGaT88+PGEYzP+dqM6tXnZhVNfYsb5CSC+e7Y
 yArQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrrwDOsPyQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id m056b3x0ABrBL8P
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 10 Jan 2021 12:53:11 +0100 (CET)
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
Date: Sun, 10 Jan 2021 12:53:10 +0100
Message-Id: <6B074439-2E91-4FCF-84C8-82AE13D8C7F0@goldelico.com>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
 <20210109003352.GA18102@alpha.franken.de>
 <DUUPMQ.U53A0W7YJPGM@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, bsegall@google.com, clm@fb.com,
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
 dietmar.eggemann@arm.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, chris@zankel.net,
 monstr@monstr.eu, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 christian.koenig@amd.com, bcrl@kvack.org, spice-devel@lists.freedesktop.org,
 vgupta@synopsys.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 bristot@redhat.com, davem@davemloft.net, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 10.01.2021 um 12:35 schrieb Paul Cercueil <paul@crapouillou.net>:
> =

> Hi Thomas,
> =

> Le sam. 9 janv. 2021 =E0 1:33, Thomas Bogendoerfer <tsbogend@alpha.franke=
n.de> a =E9crit :
>> On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
>>> On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
>>> > Hi Thomas,
>>> >
>>> > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this com=
mit.

Just for completeness, I have no such problems booting CI20/jz4780 or Skyto=
ne400/jz4730 (unpublished work) with 5.11-rc2.
But may depend on board capabilites (ram size, memory layout or something e=
lse).

>>> >
>>> > Any idea what could be happening?
>>> not yet, kernel crash log of a Malta QEMU is below.
>> update:
>> This dirty hack lets the Malta QEMU boot again:
>> diff --git a/mm/highmem.c b/mm/highmem.c
>> index c3a9ea7875ef..190cdda1149d 100644
>> --- a/mm/highmem.c
>> +++ b/mm/highmem.c
>> @@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgpro=
t_t prot)
>> 	vaddr =3D __fix_to_virt(FIX_KMAP_BEGIN + idx);
>> 	BUG_ON(!pte_none(*(kmap_pte - idx)));
>> 	pteval =3D pfn_pte(pfn, prot);
>> -	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
>> +	set_pte(kmap_pte - idx, pteval);
>> 	arch_kmap_local_post_map(vaddr, pteval);
>> 	current->kmap_ctrl.pteval[kmap_local_idx()] =3D pteval;
>> 	preempt_enable();
>> set_pte_at() tries to update cache and could do an kmap_atomic() there.
>> Not sure, if this is allowed at this point.
> =

> Yes, I can confirm that your workaround works here too.
> =

> Cheers,
> -Paul
> =

> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
