Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07688AB56BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 16:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A1410E5AD;
	Tue, 13 May 2025 14:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JcimUHHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F910E39F;
 Tue, 13 May 2025 14:07:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C3BB8629CC;
 Tue, 13 May 2025 14:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96748C4CEE4;
 Tue, 13 May 2025 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747145259;
 bh=XQ0PtISiJMgGCU3R2QWS6wlTIRUGPytrW2EX30D6e7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JcimUHHeGhjNh5Mvyn/0+mHwha12SUXq/bzqXiYCaJvDlyuvWqt5KhUbpdrbCcH1/
 cT4Ehy28S5fCuVFxcz3E5GAB1gT6MgG9pHEoCq1C3akgfeedYk/M6HimsJy//j/8Wf
 428iF63D62aPQNlw/15ArDhPmQThH3Pfq57e6BMIh8CUSsxcZGE+8PeUErxlA5xgZk
 iG6c3C5A8FoCUWOOuzOxJztvCcwyUxWp7D3DM+1n1blv+9tbr3fgJrR5PxzEVAk72I
 1Ayo4c+kYTMQP/ARFFCd0lrwBktjRgmvTRTQtNDvYHmQ2lREVnC2PuY4Q1AjZIOzxp
 98STD1WVLgZ1Q==
Date: Tue, 13 May 2025 16:07:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 09/19] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aCNSI1iwvK8w51oJ@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-9-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:36PM +0900, Alexandre Courbot wrote:
> Upon reset, the GPU executes the GFW_BOOT firmware in order to
> initialize its base parameters such as clocks. The driver must ensure
> that this step is completed before using the hardware.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/devinit.rs   | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>  5 files changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5be2e0344fb651e5e53c9223aefeb5b2d95b8de1
> --- /dev/null
> +++ b/drivers/gpu/nova-core/devinit.rs
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Methods for device initialization.
> +
> +use kernel::bindings;
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +
> +/// Wait for devinit FW completion.
> +///
> +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
> +/// considered unusable until this step is completed, so it must be waited on very early during
> +/// driver initialization.
> +pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result<()> {
> +    let mut timeout = 2000;
> +
> +    loop {
> +        let gfw_booted = regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK::read(bar)
> +            .read_protection_level0()
> +            && (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05::read(bar).value() & 0xff) == 0xff;

What does it mean when the first 8 bits are set? Why don't we have a mask and
value to compare for that?

> +
> +        if gfw_booted {
> +            return Ok(());
> +        }
> +
> +        if timeout == 0 {
> +            return Err(ETIMEDOUT);
> +        }
> +        timeout -= 1;

NIT: This means the timeout is ~4s; can we start with timeout == 4000 and decrement
with the number of ms passed to msleep()?

Anyways, this should go away with read_poll_timeout() anyways.

> +
> +        // TODO: use `read_poll_timeout` once it is available.
> +        // (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
> +        // SAFETY: msleep should be safe to call with any parameter.
> +        unsafe { bindings::msleep(2) };
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>      pub(crate) gpu: Gpu,
>  }
>  
> -const BAR0_SIZE: usize = 8;
> +const BAR0_SIZE: usize = 0x1000000;

This means that we'll fail probing the card if BAR0 is not at least 16MiB.
AFAIK, that should be fine. However, can you make this a separate patch please?
