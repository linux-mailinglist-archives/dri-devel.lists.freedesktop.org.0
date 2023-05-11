Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C27002EE
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907A10E13A;
	Fri, 12 May 2023 08:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5A110E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:30:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EBD7ECADF7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 13:22:29 +0000 (UTC)
Received: (Authenticated sender: contact@artur-rojek.eu)
 by mail.gandi.net (Postfix) with ESMTPA id AC3D220007;
 Thu, 11 May 2023 13:22:13 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 11 May 2023 15:22:13 +0200
From: Artur Rojek <contact@artur-rojek.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
In-Reply-To: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
References: <20230510110557.14343-6-tzimmermann@suse.de>
 <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com>
 <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
 <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <9c4be198444e9987c826c87b592e9dc6@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 May 2023 08:48:34 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "James
 E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Sam Ravnborg <sam@ravnborg.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 suijingfeng@loongson.cn, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-11 14:35, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> CC Artur, who's working on HP Jornada 680.
Thanks for CC'ing me - I faced this exact issue while working on my
(still not upstreamed) hd6446x PCMCIA controller driver. The PCMCIA
subsystem uses `inb/outb`, which expect the `sh_io_port_base` to be set
to something else than the default `-1`. At first I tried to set it to
`0xa0000000`, so that all I/O goes through the fixed, non-cacheable P2
area. That however broke some other driver code (I had no time to debug
which one). Eventually I ended up taking a suggestion from a MIPS PCMCIA
driver [1] and simply substract the broken `sh_io_port_base` address
from `HD64461_IOBASE`, as the base for `socket.io_offset`. This way all
the PCMCIA `inb/outb` accesses are absolute, no matter what the
`sh_io_port_base` is set to. This of course is a very ugly solution and
we should instead fix the root cause of this mess. I will have a better
look at this patch set and the problem at hand at a later date.

Cheers,
Artur

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pcmcia/db1xxx_ss.c?h=v6.4-rc1#n527

> 
> On Wed, May 10, 2023 at 5:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, May 10, 2023, at 16:27, Thomas Zimmermann wrote:
>> > Am 10.05.23 um 16:15 schrieb Arnd Bergmann:
>> >> On Wed, May 10, 2023, at 16:03, kernel test robot wrote:
>> 
>> >> I think that's a preexisting bug and I have no idea what the
>> >> correct solution is. Looking for HD64461 shows it being used
>> >> both with inw/outw and readw/writew, so there is no way to have
>> >> the correct type. The sh __raw_readw() definition hides this bug,
>> >> but that is a problem with arch/sh and it probably hides others
>> >> as well.
>> >
>> > The constant HD64461_IOBASE is defined as integer at
>> >
>> >
>> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/hd64461.h#L17
>> >
>> > but fb_readw() expects a volatile-void pointer. I guess we could add a
>> > cast somewhere to silence the problem. In the current upstream code,
>> > that appears to be done by sh's __raw_readw() internally:
>> >
>> >
>> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/io.h#L35
>> 
>> Sure, that would make it build again, but that still doesn't make the
>> code correct, since it's completely unclear what base address the
>> HD64461_IOBASE is relative to. The hp6xx platform code only passes it
>> through inw()/outw(), which take an offset relative to 
>> sh_io_port_base,
>> but that is not initialized on hp6xx. I tried to find in the history
>> when it broke, apparently that was in 2007 commit 34a780a0afeb ("sh:
>> hp6xx pata_platform support."), which removed the custom inw/outw
>> implementations.
> 
> See also commit 4aafae27d0ce73f8 ("sh: hd64461 tidying."), which
> claims they are no longer needed.
> 
> Don't the I/O port macros just treat the port as an absolute base 
> address
> when sh_io_port_base isn't set?
> 
> Gr{oetje,eeting}s,
> 
>                         Geert


