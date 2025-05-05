Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C70AA8D39
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101010E021;
	Mon,  5 May 2025 07:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 05 May 2025 07:42:43 UTC
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A7310E021
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:42:43 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d7e4:b7bb:4b2:82d6])
 by xavier.telenet-ops.be with cmsmtp
 id lKdX2E00M1ymvt901KdXWs; Mon, 05 May 2025 09:37:32 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.97)
 (envelope-from <geert@linux-m68k.org>) id 1uBqOJ-00000000jmg-1kdV;
 Mon, 05 May 2025 09:37:31 +0200
Date: Mon, 5 May 2025 09:37:31 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
cc: Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
Message-ID: <5bcf120e-72a4-fd2e-c70a-3cd34d04fc88@linux-m68k.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
 <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

 	Hi Russell,

On Mon, 14 Apr 2025, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>    >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>    >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>     let out = (self.carry / pow) as u16;
>>>     self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
>
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including

s/isn't supported/isn't supported implicitly/

> 32-bit ARM don't support it.

It is supported when called explicitly through div64_u64()
https://elixir.bootlin.com/linux/v6.14.5/source/include/linux/math64.h#L60
But you better think twice before using it, especially in
performance-critical code.

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
