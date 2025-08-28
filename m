Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DB9B3AB1E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 21:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B5F10E05C;
	Thu, 28 Aug 2025 19:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kNzv9GTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8E10E05C;
 Thu, 28 Aug 2025 19:57:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 937AD42B21;
 Thu, 28 Aug 2025 19:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA52C4CEEB;
 Thu, 28 Aug 2025 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756411040;
 bh=J9p1+SFkJ1DD0HNbdzfpG7QiXzTQqNC+170Di7UX3P8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=kNzv9GTBNQw2jmLbuHmLZwNm2lSRbeCVYQ8MZyO7IT4qf+br2F68+vMxaR6PNdrzP
 1X8X0YEiamcGhGG5GXHBcCW2ncGrs7CQPvsiFVeqoty2ZhrZWX6KKUqTb1euHHcpFK
 hvNF9FUDlhjdu6iXqa9yuH3uvKsCEtzjc6vevSa33siMTlemYmawxKt9LWn88KvvST
 I/UmSsYXKQ0d3l3m9a00ZXevKDezOezVyGqdrNfZ+QsbxdznbjMk4PejknKbcxmI6g
 c5/Sn98//btbhZVl+z/Mn6tPawLn61Rp78bs0COCJhcQuX/9Bciwn3q+DOYVwvDRPM
 ZuEU5ofQTpT/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 21:57:16 +0200
Message-Id: <DCEBQZ7WA1KI.1G8TNWH32QWG@kernel.org>
Subject: Re: gpu: nova-core: arm32 build errors
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250828160247.37492-1-ojeda@kernel.org>
 <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
 <DCEB1J2P3MZS.3IGXEYP0MAC5H@kernel.org>
 <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
In-Reply-To: <CANiq72mkPqFnb4ztiCokE6+ntVSmgOTgERshg-4SMmLboFOqNg@mail.gmail.com>
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

On Thu Aug 28, 2025 at 9:31 PM CEST, Miguel Ojeda wrote:
> On Thu, Aug 28, 2025 at 9:24=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> Maybe I spoke too soon, it's actually pretty painful to keep 32-bit
>> compatibility, even though it would be nice for testing purposes.
>>
>> I'll paste the diff to fix it below, I think that makes it obvious why I=
 say
>> that.
>>
>> Instead, we should really just depend on CONFIG_64BIT (which implies
>> ARCH_DMA_ADDR_T_64BIT).
>
> Yeah, it isn't great.
>
> If it were just that, maybe it it is worth it (and a `DmaAddress`
> newtype, not just a typedef, could perhaps be nice anyway?)

What do you have in mind what the newtype can do?

I assume the idea is to make it provide methods {to,from}_u64, where to_u64=
()
has to be fallible? This would be an improvement, but not really solve the =
issue
entirely.

The annoying part really is

	pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> DmaAddress {
	    let addr =3D u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).=
adr_39_08())
	        << FLUSH_SYSMEM_ADDR_SHIFT
	        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_=
63_40())
	            << FLUSH_SYSMEM_ADDR_SHIFT_HI;
=09
	    addr.try_into().unwrap_or_else(|_| {
	        kernel::warn_on!(true);
=09
	        0
	    })
	}

i.e. when we read a u64 from registers, but we know that what we've orignal=
ly
written there is a DmaAddress, so we can assume that a cast to DmaAddress i=
s
fine.

But this really depends on driver specific semantics.

> but if
> you think it will become increasingly painful later, then it may be
> best to focus on what matters.

We'll have a couple more such cases for sure; I think being able to assume =
that
DmaAddress is always 64-bit will result in simpler and less distracting cod=
e.

But if we can come up with a good idea to deal with this with a DmaAddress =
type;
I'm open to that.

> It is unlikely there is going to be actual users on a 32-bit platform, ri=
ght?

Yeah, I doubt that someone could think it's a great idea to run a Turing+ G=
PU on
some 32-bit machine.
