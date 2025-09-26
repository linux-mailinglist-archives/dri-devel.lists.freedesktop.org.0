Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAABA38ED
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 14:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8E910E03B;
	Fri, 26 Sep 2025 12:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Tnw2Ux0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270D210E03B;
 Fri, 26 Sep 2025 12:00:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C30814380B;
 Fri, 26 Sep 2025 12:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DEAC4CEF4;
 Fri, 26 Sep 2025 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758888007;
 bh=SxKEpvT1xfQHA95My4WDzhWTJSuoe5gKWO8GLmU6P/4=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=Tnw2Ux0FXaCZhG83mBnRs5GzQ2vXUEIMniK7JrrcK5fARqbzP5qZ5mW02eke7Jzcm
 ZKthAQLJPdnvYpSUIEIcvMeS7KPuoq3XbIvqXO43QWeNU+4Ui4WD+BjSi37u+JhkQb
 F8dKR4fyEyI9yb0ZmrlODwNyZxHP9fBOIo2hkmQrDeEf/COMrfD5oncP/gk0Do+OOp
 I1pTwnfu5Ily1OmwrnNHcJe24td5/dAXD2TDke5WxoPj3WBnyXYFpIDy+z4Hd6BbdD
 bj2H2XVCsKRYHpS9wr/N4o18onL+ecm6fnxWY+oxaCtUiTkwVdArjlo0Gq8mN+siYr
 DhXhyFiOOkK7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 14:00:01 +0200
Message-Id: <DD2PRD2XEZRE.1YACAPZWRYLZO@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
 <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
 <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
In-Reply-To: <eblaubjmsesi6gh64ekm74qyzvfk23vjcmotc33upkc5w6edin@rbsezy6f7bai>
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

On Tue Sep 23, 2025 at 6:29 AM CEST, Alistair Popple wrote:
> On 2025-09-23 at 12:16 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
>> On 9/22/25 9:08 AM, Danilo Krummrich wrote:
>> > On 9/22/25 1:30 PM, Alistair Popple wrote:
>> >> +        // SAFETY: No DMA allocations have been made yet
>> >=20
>> > It's not really about DMA allocations that have been made previously, =
there is
>> > no unsafe behavior in that.
>> >=20
>> > It's about the method must not be called concurrently with any DMA all=
ocation or
>> > mapping primitives.
>> >=20
>> > Can you please adjust the comment correspondingly?
>
> Sure.
>
>> >> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>()=
)? };
>> >=20
>> > As Boqun mentioned, we shouldn't have a magic number for this. I don't=
 know if
>> > it will change for future chips, but maybe we should move this to gpu:=
:Spec to
>>=20
>> It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
>> patches, I'll use a HAL to select the value.
>>=20
>> > be safe.
>> >=20
>> > At least, create a constant for it (also in gpu::Spec?); in Nouveau I =
named this
>> > NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a bette=
r idea,
>> > please go for it. :)
>
> Well it's certainly not the VA_SPACE width ... that's a different address=
 space :-)

I mean, sure. But isn't the limitation of 47 bits coming from the MMU and h=
ence
defines the VA space width and the DMA bit width we can support?

> I thought from the context that the magic number was pretty obviously the
> supported DMA address width in bits, especially given the extra decoratio=
n
> of the DmaMask type. Certainly that's been the accepted practice for the =
rest
> of the kernel where pretty much all drivers just use something of the for=
m
> dma_set_mask(drm_dev->dev, DMA_BIT_MASK(44)) or whatever DMA address widt=
hs
> they support.
>
>> GPU_DMA_BIT_WIDTH, for now?
>
> Works for me.
>
>> thanks,
>> --=20
>> John Hubbard
>>=20

