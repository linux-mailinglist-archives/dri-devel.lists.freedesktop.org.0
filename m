Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C93B3A8E6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CFC10EA7A;
	Thu, 28 Aug 2025 17:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXpaF4Cz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D24710EA71;
 Thu, 28 Aug 2025 17:54:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFD1C438FA;
 Thu, 28 Aug 2025 17:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B120C4CEEB;
 Thu, 28 Aug 2025 17:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756403688;
 bh=fXyx8Pll8ccq5rpjbXHi8sH3cIXWDiQ3zBdWjHcYL8A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WXpaF4CziRCP+Rh7Bl80Zgk1i0cXE1XWeYg15HHqz4rBJlAoqYpfxYR8A9luRIyga
 tnRie2b0VdCjL0OYA5jZl0+UTRzNBXMdZhTDre/z0O9d1k1ioYs0bjBpEYYKMg/7HF
 Sb4Ze43i/MsGpUL304Yo/WINc3kk7YBHDRUysiT3Q3XSpv0+HPe/gaSATKu0IK7FRm
 icykPGFepL8RILrEQYtO5fXMESLEsKktO3m8OfWZnw/4TLtUiPthvVRuIpIvRbIMHT
 9mPxDd5TTiCsbgIm35KKe8KINE8C8Kdkhv2dqUcfd/Qb/6ZeOv2gNhMhZyatqvyS0a
 BMhheT5RctHcg==
Message-ID: <b680c343-ba97-4eb4-b426-56e318dce492@kernel.org>
Date: Thu, 28 Aug 2025 19:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: gpu: nova-core: arm32 build errors
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828160247.37492-1-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250828160247.37492-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Miguel,

Thanks for reporting!

On 8/28/25 6:02 PM, Miguel Ojeda wrote:
> Hi Danilo et al.,
> 
> In Linus' tree and -next, for an arm32 LLVM defconfig plus Rust build, I see:
> 
>      error[E0308]: mismatched types
>        --> drivers/gpu/nova-core/fb.rs:49:59
>         |
>      49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle())?;
>         |                              -----------------------      ^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
>         |                              |
>         |                              arguments to this method are incorrect
>         |
>      note: method defined here
>        --> drivers/gpu/nova-core/fb/hal.rs:19:8
>         |
>      19 |     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result;
>         |        ^^^^^^^^^^^^^^^^^^^^^^^
>      help: you can convert a `u32` to a `u64`
>         |
>      49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.dma_handle().into())?;
>         |                                                                            +++++++
> 
> 
>      error[E0308]: mismatched types
>        --> drivers/gpu/nova-core/fb.rs:65:47
>         |
>      65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle() {
>         |            -------------------------------    ^^^^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
>         |            |
>         |            expected because this is `u64`
>         |
>      help: you can convert a `u32` to a `u64`
>         |
>      65 |         if hal.read_sysmem_flush_page(bar) == self.page.dma_handle().into() {

I think those should just use the DMA address type introduced in [1].
Unfortunately, for a fix we have to stick to bindings::dma_addr_t.

[1] https://lore.kernel.org/lkml/20250828133323.53311-3-dakr@kernel.org/

>         |                                                                     +++++++
> 
> 
>      error: this arithmetic operation will overflow
>         --> drivers/gpu/nova-core/falcon.rs:469:23
>          |
>      469 |             .set_base((dma_start >> 40) as u16)
>          |                       ^^^^^^^^^^^^^^^^^ attempt to shift right by `40_i32`, which would overflow
>          |
>          = note: `#[deny(arithmetic_overflow)]` on by default

Should probably just be

	val.checked_shr(shift).unwrap_or(0)

I'll send a patch to fix this up.

> Similar to another one I sent, I hope it helps -- it may be useful to make it
> build in 32-bit as a test for those kinds of platforms.

Agreed.

Thanks,
Danilo
