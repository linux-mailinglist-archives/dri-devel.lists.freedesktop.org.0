Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABEBA8366
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0D10E220;
	Mon, 29 Sep 2025 07:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iviEzko9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925810E02C;
 Mon, 29 Sep 2025 07:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8948453BC;
 Mon, 29 Sep 2025 07:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866FBC4CEF4;
 Mon, 29 Sep 2025 07:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759129606;
 bh=zGQHYFZJRxNF9v5B5ZQ3iTL2YoC48kcSK/AH+EjsG5U=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=iviEzko9domWThvZHdlyfdupWopKBEIfZuNVwFPjeQjoAC5yTE4we4GeFteDsTbUg
 6tF3ksuAgXkfHfCp6tS+iR2gZ69JSQ5o6DvTC9W6MtwxVjZowMdr855aiUcizdcg+b
 zbn+61CiJtWtX36a4+uYg00mlK9VAhv2mHzOoEWrzOM5Yyfrhqh3ZP+ksx8iJF9+vM
 VKsBQohjCnFbVH1FYUpgBnm6atq9Jds2x44XsScUntR+gVPH6V5Whww/WAiK4pCWf4
 oU/o4Xh/7xFFAxttR3oEmGT6IN/bY977SJJS9VRjaz77vXeuNhcA84izTmaPXqSvK1
 Jgx2YPtPNgorQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 09:06:40 +0200
Message-Id: <DD53EE5HJUZY.2EMREPXQ9P090@kernel.org>
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
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
 <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
 <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
In-Reply-To: <um3463eyjtecebxdgjpegankwxgezqgeiqff6xy5wducnv7ayf@pnjhxbro2sh5>
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

On Mon Sep 29, 2025 at 2:19 AM CEST, Alistair Popple wrote:
> On 2025-09-26 at 22:00 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
>> On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
>> > On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote=
...
>> >> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
>> >> > On 9/22/25 1:30 PM, Alistair Popple wrote:
>> >> >> +        // SAFETY: No DMA allocations have been made yet
>> >> >=20
>> >> > It's not really about DMA allocations that have been made previousl=
y, there is
>> >> > no unsafe behavior in that.
>> >> >=20
>> >> > It's about the method must not be called concurrently with any DMA =
allocation or
>> >> > mapping primitives.
>> >> >=20
>> >> > Can you please adjust the comment correspondingly?
>> >
>> > Sure.
>> >
>> >> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47=
>())? };
>> >> >=20
>> >> > As Boqun mentioned, we shouldn't have a magic number for this. I do=
n't know if
>> >> > it will change for future chips, but maybe we should move this to g=
pu::Spec to
>> >>=20
>> >> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post tho=
se
>> >> patches, I'll use a HAL to select the value.
>> >>=20
>> >> > be safe.
>> >> >=20
>> >> > At least, create a constant for it (also in gpu::Spec?); in Nouveau=
 I named this
>> >> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a be=
tter idea,
>> >> > please go for it. :)
>> >
>> > Well it's certainly not the VA_SPACE width ... that's a different addr=
ess space :-)
>>=20
>> I mean, sure. But isn't the limitation of 47 bits coming from the MMU an=
d hence
>> defines the VA space width and the DMA bit width we can support?
>
> Not at all. The 47 bit limitation comes from what the DMA engines can phy=
sically
> address, whilst the MMU converts virtual addresses to physical DMA addres=
ses.

I'm well aware -- what I'm saying is that the number given to
dma_set_mask_and_coherent() does not necessarily only depend on the physica=
l bus
and DMA controller capabilities.

It may also depend on the MMU, since we still need to be able to map DMA me=
mory
in the GPU's virtual address space.

> So the two address spaces are different and can have different widths. In=
deed
> most of our current GPUs have a virtual address space of 49 bits whilst o=
nly
> supporting 47 bits of DMA address space.

Now, it seems that in this case the DMA engine is the actual limiting facto=
r,
but is this the case for all architectures or may we have cases where the M=
MU
(or something else) becomes the limiting factor, e.g. in future architectur=
es?
