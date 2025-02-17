Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF0A38E11
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 22:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF7510E5E1;
	Mon, 17 Feb 2025 21:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nNkTDYpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE48110E5E1;
 Mon, 17 Feb 2025 21:33:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 752AD5C584B;
 Mon, 17 Feb 2025 21:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F1FC4CED1;
 Mon, 17 Feb 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739828014;
 bh=kudnxAtRl/tDWg4bJcLUVW1vOsh4vA4q3gFnmmnVfwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nNkTDYpuZG/KWMls9s4bXcfkxuJ3WK2RopCubxtg2qc6Py+Bufvtzwap/5//fa0aJ
 fXgezJMLxgFnFb9ag7NB9ju2Sc54Duia6rj3lXMEpg1SL2dh6S7Txlsm+YKEnKAAS7
 vnyyoTvih2EZ86IAboFIx1K2rZEEy15xE/b46WJ9G7uDTH+YMnSms88WuNafZhgf+P
 dLo4CNRHvcwKmUDXwVZY1DYTjfkhrhu9Diq5AVPoASuvp25pITHFApD//gnjRWULeQ
 tgBm+bSe/xeyKncUZCzuHtG51SEnTrEDb8xhJBn/uVDtXK0FpT4FnFuqeFmpnKTf7N
 B7FSxUG59DBPg==
Date: Mon, 17 Feb 2025 22:33:29 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7OrKX3zzjrzZdyz@pollux>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
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

Hi Alex,

On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
> Hi everyone,
> 
> This short RFC is based on top of Danilo's initial driver stub series
> [1] and has for goal to initiate discussions and hopefully some design
> decisions using the simplest subdevice of the GPU (the timer) as an
> example, before implementing more devices allowing the GPU
> initialization sequence to progress (Falcon being the logical next step
> so we can get the GSP rolling).
> 
> It is kept simple and short for that purpose, and to avoid bumping into
> a wall with much more device code because my assumptions were incorrect.
> 
> This is my first time trying to write Rust kernel code, and some of my
> questions below are probably due to me not understanding yet how to use
> the core kernel interfaces. So before going further I thought it would
> make sense to raise the most obvious questions that came to my mind
> while writing this draft:

Thanks for sending this RFC, that makes a lot of sense.

It's great to see you picking up work on Nova and Rust in the kernel in general!

One nit: For the future, please make sure to copy in the folks listed under the
RUST entry in the maintainers file explicitly.

> 
> - Where and how to store subdevices. The timer device is currently a
>   direct member of the GPU structure. It might work for GSP devices
>   which are IIUC supposed to have at least a few fixed devices required
>   to bring the GSP up ; but as a general rule this probably won't scale
>   as not all subdevices are present on all GPU variants, or in the same
>   numbers. So we will probably need to find an equivalent to the
>   `subdev` linked list in Nouveau.

Hm...I think a Vec should probably do the job for this. Once we know the
chipset, we know the exact topology of subdevices too.

> 
> - BAR sharing between subdevices. Right now each subdevice gets access
>   to the full BAR range. I am wondering whether we could not split it
>   into the relevant slices for each-subdevice, and transfer ownership of
>   each slice to the device that is supposed to use it. That way each
>   register would have a single owner, which is arguably safer - but
>   maybe not as flexible as we will need down the road?

I think for self-contained subdevices we can easily add an abstraction for
pci_iomap_range() to pci::Device. I considered doing that from the get-go, but
then decided to wait until we have some actual use for that.

For where we have to share a mapping of the same set of registers between
multiple structures, I think we have to embedd in into an Arc (unfortunately,
we can't re-use the inner Arc of Devres for that).

An alternative would be to request a whole new mapping, i.e. Devres<pci::Bar>
instance, but that includes an inner Arc anyways and, hence, is more costly.

> 
> - On a related note, since the BAR is behind a Devres its availability
>   must first be secured before any hardware access using try_access().
>   Doing this on a per-register or per-operation basis looks overkill, so
>   all methods that access the BAR take a reference to it, allowing to
>   call try_access() from the highest-level caller and thus reducing the
>   number of times this needs to be performed. Doing so comes at the cost
>   of an extra argument to most subdevice methods ; but also with the
>   benefit that we don't need to put the BAR behind another Arc and share
>   it across all subdevices. I don't know which design is better here,
>   and input would be very welcome.

I'm not sure I understand you correctly, because what you describe here seem to
be two different things to me.

1. How to avoid unnecessary calls to try_access().

This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
think we can just call try_access() once and then propage the guard through the
callchain, where necessary.

2. Share the MMIO mapping between subdevices.

This is where I can follow. How does 1. help with that? How are 1. and 2.
related?

> 
> - We will probably need sometime like a `Subdevice` trait or something
>   down the road, but I'll wait until we have more than one subdevice to
>   think about it.

Yeah, that sounds reasonable.

> 
> The first 2 patches are small additions to the core Rust modules, that
> the following patches make use of and which might be useful for other
> drivers as well. The last patch is the naive implementation of the timer
> device. I don't expect it to stay this way at all, so please point out
> all the deficiencies in this very early code! :)
> 
> [1] https://lore.kernel.org/nouveau/20250209173048.17398-1-dakr@kernel.org/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Alexandre Courbot (3):
>       rust: add useful ops for u64
>       rust: make ETIMEDOUT error available
>       gpu: nova-core: add basic timer device
> 
>  drivers/gpu/nova-core/driver.rs    |  4 +-
>  drivers/gpu/nova-core/gpu.rs       | 35 ++++++++++++++-
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 43 ++++++++++++++++++
>  drivers/gpu/nova-core/timer.rs     | 91 ++++++++++++++++++++++++++++++++++++++
>  rust/kernel/error.rs               |  1 +
>  rust/kernel/lib.rs                 |  1 +
>  rust/kernel/num.rs                 | 32 ++++++++++++++
>  8 files changed, 206 insertions(+), 2 deletions(-)
> ---
> base-commit: 6484e46f33eac8dd42aa36fa56b51d8daa5ae1c1
> change-id: 20250216-nova_timer-c69430184f54
> 
> Best regards,
> -- 
> Alexandre Courbot <acourbot@nvidia.com>
> 
