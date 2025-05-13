Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33188AB5A5B
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF5710E20C;
	Tue, 13 May 2025 16:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kJtyN6qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964110E20A;
 Tue, 13 May 2025 16:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4F833A4DA22;
 Tue, 13 May 2025 16:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43926C4CEE4;
 Tue, 13 May 2025 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747154524;
 bh=/Ux1HyjQpDgAp9sU7Ea8h3m+O43EqtR+LSbkjZzf9sU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJtyN6qzbU8Rs6/rCCgnuXBAtvewFagk5TAUVRxX1QPIN8TFuaQuMN3c1y9V4yX8C
 hx0bHCmFdTpoBmZ01k1kkc3770bCWN4vp4bPvV6htromxmClw9AajgKwMJCStCMsgk
 71MXDMB9kN1V1un54zvQk7W6T0yGYatEu5DfM0ufB7PKmWrG9Yx2Cd//04fY6iRb+n
 p8Zwd984PLAoRB837Tnx4vFoEIov7okdyLYuG6c+2q4VgnOotBWn9ABNIqvXFXrbQu
 vOVU9a9ggdng1Mc2fe2LWZn6DcRPolaiknLJK8epyNToqYRl5iZA9PFjV273r8uL0S
 NO7sEUgHO/CRw==
Date: Tue, 13 May 2025 18:41:56 +0200
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
Subject: Re: [PATCH v3 17/19] gpu: nova-core: compute layout of the FRTS region
Message-ID: <aCN2VIIKYGcVtctN@pollux>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-17-fcb02749754d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-nova-frts-v3-17-fcb02749754d@nvidia.com>
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

On Wed, May 07, 2025 at 10:52:44PM +0900, Alexandre Courbot wrote:
> FWSEC-FRTS is run with the desired address of the FRTS region as
> parameter, which we need to compute depending on some hardware
> parameters.
> 
> Do this in a `FbLayout` structure, that will be later extended to
> describe more memory regions used to boot the GSP.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs       |   4 ++
>  drivers/gpu/nova-core/gsp.rs       |   3 ++
>  drivers/gpu/nova-core/gsp/fb.rs    | 108 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |  27 ++++++++++
>  5 files changed, 143 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 4bf7f72247e5320935a517270b5a0e1ec2becfec..a3d96639706e808305cce66416778d2bf6e7e683 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -7,6 +7,7 @@
>  use crate::driver::Bar0;
>  use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>  use crate::firmware::Firmware;
> +use crate::gsp::fb::FbLayout;
>  use crate::regs;
>  use crate::util;
>  use crate::vbios::Vbios;
> @@ -239,6 +240,9 @@ pub(crate) fn new(
>  
>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>  
> +        let fb_layout = FbLayout::new(spec.chipset, bar)?;
> +        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
> +
>          let _bios = Vbios::new(pdev, bar)?;
>  
>          Ok(pin_init!(Self {
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97811fa1cac285b8f8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -0,0 +1,3 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +pub(crate) mod fb;
> diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp/fb.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..f28ded59469d52daf39e5d19c09efd7bf08fee92
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/fb.rs
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::ops::Range;
> +
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::gpu::Chipset;
> +use crate::regs;
> +
> +fn align_down(value: u64, align: u64) -> u64 {
> +    value & !(align - 1)
> +}

Can this go in the previous patch, i.e. "rust: num: Add an upward alignment
helper for usize"?

> +
> +/// Layout of the GPU framebuffer memory.
> +///
> +/// Contains ranges of GPU memory reserved for a given purpose during the GSP bootup process.
> +#[derive(Debug)]
> +#[expect(dead_code)]
> +pub(crate) struct FbLayout {
> +    pub fb: Range<u64>,
> +
> +    pub vga_workspace: Range<u64>,
> +    pub bios: Range<u64>,
> +
> +    pub frts: Range<u64>,

Please remove the empty lines.

> +}
> +
> +impl FbLayout {
> +    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
> +        let fb = {
> +            let fb_size = vidmem_size(bar, chipset);
> +
> +            0..fb_size
> +        };
> +        let fb_len = fb.end - fb.start;

Isn't this the same as fb_size? Why not just write it as

	let fb_size = vidmem_size(bar, chipset);
	let fb = 0..fb_size;

> +
> +        let vga_workspace = {
> +            let vga_base = vga_workspace_addr(bar, fb_len, chipset);
> +
> +            vga_base..fb.end
> +        };
> +
> +        let bios = vga_workspace.clone();

Why? And why store the same thing twice in FbLayout? If it's really needed,
clone it in the constructor below and add a comment why it's the same.

> +
> +        let frts = {
> +            const FRTS_DOWN_ALIGN: u64 = 0x20000;
> +            const FRTS_SIZE: u64 = 0x100000;
> +            let frts_base = align_down(vga_workspace.start, FRTS_DOWN_ALIGN) - FRTS_SIZE;
> +
> +            frts_base..frts_base + FRTS_SIZE
> +        };
> +
> +        Ok(Self {
> +            fb,
> +            vga_workspace,
> +            bios,
> +            frts,
> +        })
> +    }
> +}

I'd probably wrap those helpers below in

	mod hal { ... }

or even a new file fb/hal.rs to make their purpose obvious.

> +/// Returns `true` if the display is disabled.
> +fn display_disabled(bar: &Bar0, chipset: Chipset) -> bool {
> +    if chipset >= Chipset::GA100 {
> +        regs::NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL::read(bar).display_disabled()
> +    } else {
> +        regs::NV_FUSE_STATUS_OPT_DISPLAY_AMPERE::read(bar).display_disabled()
> +    }
> +}
> +
> +/// Returns the video memory size in bytes.
> +fn vidmem_size(bar: &Bar0, chipset: Chipset) -> u64 {
> +    if chipset >= Chipset::GA102 {

Is GA102 intentional or should this also be GA100?

> +        (regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_42::read(bar).value() as u64) << 20

Why isn't this shift part of the register abstraction?

> +    } else {
> +        let local_mem_range = regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar);
> +        let size =
> +            (local_mem_range.lower_mag() as u64) << ((local_mem_range.lower_scale() as u64) + 20);

Same here. Please make this part of the register abstraction as it is done in
previous patches.

> +
> +        if local_mem_range.ecc_mode_enabled() {
> +            size / 16 * 15
> +        } else {
> +            size
> +        }
> +    }
> +}
> +
> +/// Returns the vga workspace address.
> +fn vga_workspace_addr(bar: &Bar0, fb_size: u64, chipset: Chipset) -> u64 {
> +    let base = fb_size - 0x100000;

What's this offset? How do you guarantee that this never underflows?

> +    let vga_workspace_base = if display_disabled(bar, chipset) {
> +        regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar)
> +    } else {
> +        return base;
> +    };
> +
> +    if !vga_workspace_base.status_valid() {
> +        return base;
> +    }
> +
> +    let addr = (vga_workspace_base.addr() as u64) << 16;

Where does this shift come from? Shouldn't this be part of the register
abstraction?

> +    if addr < base {
> +        fb_size - 0x20000

What's this offset? Can this ever underflow?

> +    } else {
> +        addr
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index ff6d0b40c18f36af4c7e2d5c839fdf77dba23321..202e978e56f024de3ae8b178e65b63c2cea244e1 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -8,6 +8,7 @@
>  mod falcon;
>  mod firmware;
>  mod gpu;
> +mod gsp;
>  mod regs;
>  mod util;
>  mod vbios;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index b5c6eeb6ed873a06b4aefcb375f4944eb0b20597..15ec9b7e69694ff198b5353d562fc1aff5eefd3f 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -53,6 +53,12 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
>      23:0    adr_63_40 as u32;
>  });
>  
> +register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
> +    3:0     lower_scale as u8;
> +    9:4     lower_mag as u8;
> +    30:30   ecc_mode_enabled as bool;
> +});
> +
>  /* PGC6 */
>  
>  register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
> @@ -64,6 +70,27 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
>      31:0    value as u32;
>  });
>  
> +register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
> +    31:0    value as u32;
> +});
> +
> +/* PDISP */
> +
> +register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
> +    3:3     status_valid as bool;
> +    31:8    addr as u32;
> +});
> +
> +/* FUSE */
> +
> +register!(NV_FUSE_STATUS_OPT_DISPLAY_MAXWELL @ 0x00021c04 {
> +    0:0     display_disabled as bool;
> +});
> +
> +register!(NV_FUSE_STATUS_OPT_DISPLAY_AMPERE @ 0x00820c04 {
> +    0:0     display_disabled as bool;
> +});
> +
>  /* PFALCON */
>  
>  register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
> 
> -- 
> 2.49.0
> 
