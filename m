Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A67A967AE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 13:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531E10E56F;
	Tue, 22 Apr 2025 11:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FAfcjjF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D26A10E1E4;
 Tue, 22 Apr 2025 11:36:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 180B061362;
 Tue, 22 Apr 2025 11:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65B9C4CEE9;
 Tue, 22 Apr 2025 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745321795;
 bh=OFp61Brk73190htdAxSLAvDHCTjmWH2uMYVj61vQuOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FAfcjjF4SXULbg1huHByX8jRpJl7IYpofDy1hhJBvBTc5e3kFIPiYe/MjeS1xx2+L
 Ev2cOfnFyYtPANDH8+v/oHUcEd5+UdPWmPZ5wcLZGIkBixWndagBPRd2gaG8SmtL3q
 H7I1iyN0MRXHiDNB+3H2TLUYvoOFz1vt7nH5OWR6Pw1l1A6+6SPA9aWjoehArIsn9A
 VFhyJPv3o0+pxbUjZlJgcfoUM9NYEUnGSWXX10IJsvlJbBuqC2PvfEXUiLPwd3LwJF
 3xY+UOB4Z2ji0SNZk1IY4MDyzITzaCgXphC6RskwRuP4D8CXmxm18rBwej2TTrDOMA
 i6lRCx9vGMcQQ==
Date: Tue, 22 Apr 2025 13:36:28 +0200
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
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
Message-ID: <aAd_PBVB5S5pHeP0@cassiopeiae>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
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

On Sun, Apr 20, 2025 at 09:19:40PM +0900, Alexandre Courbot wrote:
> Upon reset, the GPU executes the GFW_BOOT firmware in order to
> initialize its base parameters such as clocks. The driver must ensure
> that this step is completed before using the hardware.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/devinit.rs   | 40 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>  5 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/devinit.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Methods for device initialization.
> +
> +use kernel::bindings;
> +use kernel::devres::Devres;
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
> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {
> +    let mut timeout = 2000;
> +
> +    loop {
> +        let gfw_booted = with_bar!(
> +            bar,
> +            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)
> +                .read_protection_level0_enabled()
> +                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() & 0xff) == 0xff
> +        )?;
> +
> +        if gfw_booted {
> +            return Ok(());
> +        }
> +
> +        if timeout == 0 {
> +            return Err(ETIMEDOUT);
> +        }
> +        timeout -= 1;
> +
> +        // SAFETY: msleep should be safe to call with any parameter.
> +        unsafe { bindings::msleep(2) };

I assume this goes away with [1]? Can we please add a corresponding TODO? Also,
do you mind preparing the follow-up patches for cases like this (there's also
the transmute one), such that we can apply them, once the dependencies did land
and such that we can verify that they suit our needs?

[1] https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/

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
>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>  
>  kernel::pci_device_table!(
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01414f5ca347ae9ecc 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -2,6 +2,7 @@
>  
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
> +use crate::devinit;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -168,6 +169,10 @@ pub(crate) fn new(
>              spec.revision
>          );
>  
> +        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
> +        devinit::wait_gfw_boot_completion(&bar)
> +            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
> +
>          Ok(pin_init!(Self { spec, bar, fw }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -20,6 +20,7 @@ macro_rules! with_bar {
>      }
>  }
>  
> +mod devinit;
>  mod driver;
>  mod firmware;
>  mod gpu;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -13,3 +13,14 @@
>      7:4     major_rev => as u8, "major revision of the chip";
>      28:20   chipset => try_into Chipset, "chipset model"
>  );
> +
> +/* GC6 */
> +
> +register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
> +    0:0     read_protection_level0_enabled => as_bit bool
> +);
> +
> +/* TODO: This is an array of registers. */
> +register!(Pgc6AonSecureScratchGroup05@0x00118234;
> +    31:0    value => as u32
> +);

Please also document new register definitions.
