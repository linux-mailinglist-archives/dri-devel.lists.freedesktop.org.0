Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF0FBA93CA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1DD10E3F6;
	Mon, 29 Sep 2025 12:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JuxIws05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1A10E3F6;
 Mon, 29 Sep 2025 12:49:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2534E624B1;
 Mon, 29 Sep 2025 12:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C51CC4CEF4;
 Mon, 29 Sep 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759150181;
 bh=g9LISi377z68weUApT7rlrGLz0VrlT0E61wPfG+gzYQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=JuxIws05uY4HtJ81XyI9ZQtSzRZTOboStYFx0zFrD5Q0hxskSYJnJO8CfoZq3XW7h
 PGNbKCIJp0GWyWAcJ8kkxfCQVJ2CZK4io1aDU7YYGxBUmP9jDDL7VnIf+qWC6djEeL
 dZhLPJpc4gRJGEwAzAmp9jaI2pMiUCTgbnzoWTsvp2tJ/NAuCgF1LLrIqvXMHl27CG
 XiJPykGxL4dFDCqzwzpQdb1ek1L9DRJyazoM9YtnxCd2SCCtIINPtPweVhtKu+hM2H
 TcEaMfVcPy94MaPwM82PLzUNLp/n5zxI3tC3+g4HLeBFP7iUkax5G4hFY6x24vKhsr
 taL6Udjnm9anQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 14:49:35 +0200
Message-Id: <DD5AOYADIBSX.O3CFPGMX9M9J@kernel.org>
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Cc: "John Hubbard" <jhubbard@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
 <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
 <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
 <DD53EE5HJUZY.2EMREPXQ9P090@kernel.org>
 <e2twlxdothcm4vbg3vytxppdpjdocx2l54mfnvhn7dbdncbxhx@ut4kpu7qwwe7>
In-Reply-To: <e2twlxdothcm4vbg3vytxppdpjdocx2l54mfnvhn7dbdncbxhx@ut4kpu7qwwe7>
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

On Mon Sep 29, 2025 at 9:39 AM CEST, Alistair Popple wrote:
> On 2025-09-29 at 17:06 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
>> On Mon Sep 29, 2025 at 2:19 AM CEST, Alistair Popple wrote:
>> > On 2025-09-26 at 22:00 +1000, Danilo Krummrich <dakr@kernel.org> wrote=
...
>> >> On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
>> >> > On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wr=
ote...
>> >> >> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
>> >> >> > On 9/22/25 1:30 PM, Alistair Popple wrote:
>> >> >> >> +        // SAFETY: No DMA allocations have been made yet
>> >> >> >=20
>> >> >> > It's not really about DMA allocations that have been made previo=
usly, there is
>> >> >> > no unsafe behavior in that.
>> >> >> >=20
>> >> >> > It's about the method must not be called concurrently with any D=
MA allocation or
>> >> >> > mapping primitives.
>> >> >> >=20
>> >> >> > Can you please adjust the comment correspondingly?
>> >> >
>> >> > Sure.
>> >> >
>> >> >> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::=
<47>())? };
>> >> >> >=20
>> >> >> > As Boqun mentioned, we shouldn't have a magic number for this. I=
 don't know if
>> >> >> > it will change for future chips, but maybe we should move this t=
o gpu::Spec to
>> >> >>=20
>> >> >> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post =
those
>> >> >> patches, I'll use a HAL to select the value.
>> >> >>=20
>> >> >> > be safe.
>> >> >> >=20
>> >> >> > At least, create a constant for it (also in gpu::Spec?); in Nouv=
eau I named this
>> >> >> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a=
 better idea,
>> >> >> > please go for it. :)
>> >> >
>> >> > Well it's certainly not the VA_SPACE width ... that's a different a=
ddress space :-)
>> >>=20
>> >> I mean, sure. But isn't the limitation of 47 bits coming from the MMU=
 and hence
>> >> defines the VA space width and the DMA bit width we can support?
>> >
>> > Not at all. The 47 bit limitation comes from what the DMA engines can =
physically
>> > address, whilst the MMU converts virtual addresses to physical DMA add=
resses.
>>=20
>> I'm well aware -- what I'm saying is that the number given to
>> dma_set_mask_and_coherent() does not necessarily only depend on the phys=
ical bus
>> and DMA controller capabilities.
>>=20
>> It may also depend on the MMU, since we still need to be able to map DMA=
 memory
>> in the GPU's virtual address space.
>
> Sure, I'm probably being a bit loose with terminology - I'm not saying it
> doesn't depend on the MMU capabilities just that the physical addressing =
limits
> are independent of the virtual addressing limits so setting the DMA mask =
based
> on VA_SPACE_BITS (ie. virtual addressing limits) seems incorrect.

I think no one said that physical addressing limits depend on virtual addre=
ssing
limits.

What I'm saying is that the DMA mask may depend on more than the physical
addressing limits or the DMA controller limits -- that's a different statem=
ent.

>> > So the two address spaces are different and can have different widths.=
 Indeed
>> > most of our current GPUs have a virtual address space of 49 bits whils=
t only
>> > supporting 47 bits of DMA address space.
>>=20
>> Now, it seems that in this case the DMA engine is the actual limiting fa=
ctor,
>> but is this the case for all architectures or may we have cases where th=
e MMU
>> (or something else) becomes the limiting factor, e.g. in future architec=
tures?
>
> Hmm. I'm not sure I follow - the virtual addressing capabilities of the G=
PU MMU
> are entirely indepedent of the DMA addressing capabilities of the GPU and=
 bus.
> For example you can still use 49-bit GPU virtual addresses with 47-bits o=
f DMA
> bits or less and vice-versa.
>
> So the DMA address mask has nothing to do with the virtual address (ie.
> VA_SPACE) width AFAICT? But maybe we've got slightly different terminolog=
y?

Again, no one said it has anything to do with virtual address space width, =
but
it has something to do with the physical addresses the MMU can handle.

Otherwise, let me answer with a question: What do we set the DMA mask to if=
 the
DMA controller supports wider addresses than the MMU does? We still want to=
 be
able to map DMA buffers in the GPU's virtual address space, no?

In other words, the value for the DMA mask may depend on multiple device
capabilities, i.e. physical bus, DMA controller, MMU, etc.

Hence, the DMA mask should be the minimum of all of those.

Whether we define all of them and compute the minimum, or just create a glo=
bal
constant is a different question. But should at least document it cleanly.
