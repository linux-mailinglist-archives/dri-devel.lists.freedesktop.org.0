Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDAB8D8AB
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EB710E35F;
	Sun, 21 Sep 2025 09:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IBHp5ON4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5710E0A3;
 Sun, 21 Sep 2025 09:36:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DCEA240513;
 Sun, 21 Sep 2025 09:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2D9C4CEE7;
 Sun, 21 Sep 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758447370;
 bh=B1a3RGharGmCIvj2BlNX0YJdxwU67f9Wln5wfzrRxaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IBHp5ON4Y0MzVBdp/SQVrusWgdsQOkON1+sM4XMlqt2qWqQeldR2Kqn3flhTKRkFI
 XUQqDA5EPWnMsY8D8M9Lx7FQgu8PA3dq92euFw6Y5QzqNkJ1UO9tCIIHApLAPh+d1I
 KVr7iIDTR1iPy1a2XSuTc99aBCYwcdSPWUDgac3w=
Date: Sun, 21 Sep 2025 11:36:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
Message-ID: <2025092157-pauper-snap-aad1@gregkh>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920182232.2095101-2-joelagnelf@nvidia.com>
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

On Sat, Sep 20, 2025 at 02:22:27PM -0400, Joel Fernandes wrote:
> The bitfield-specific into new macro. This will be used to define
> structs with bitfields, similar to C language.
> 
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>  3 files changed, 327 insertions(+), 249 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
> 
> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
> new file mode 100644
> index 000000000000..ba6b7caa05d9
> --- /dev/null
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Bitfield library for Rust structures
> +//!
> +//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
> +//!
> +//! # Syntax
> +//!
> +//! ```rust
> +//! #[derive(Debug, Clone, Copy)]
> +//! enum Mode {
> +//!     Low = 0,
> +//!     High = 1,
> +//!     Auto = 2,
> +//! }
> +//!
> +//! impl TryFrom<u8> for Mode {
> +//!     type Error = u8;
> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
> +//!         match value {
> +//!             0 => Ok(Mode::Low),
> +//!             1 => Ok(Mode::High),
> +//!             2 => Ok(Mode::Auto),
> +//!             _ => Err(value),
> +//!         }
> +//!     }
> +//! }
> +//!
> +//! impl From<Mode> for u32 {
> +//!     fn from(mode: Mode) -> u32 {
> +//!         mode as u32
> +//!     }
> +//! }
> +//!
> +//! #[derive(Debug, Clone, Copy)]
> +//! enum State {
> +//!     Inactive = 0,
> +//!     Active = 1,
> +//! }
> +//!
> +//! impl From<bool> for State {
> +//!     fn from(value: bool) -> Self {
> +//!         if value { State::Active } else { State::Inactive }
> +//!     }
> +//! }
> +//!
> +//! impl From<State> for u32 {
> +//!     fn from(state: State) -> u32 {
> +//!         state as u32
> +//!     }
> +//! }
> +//!
> +//! bitfield! {
> +//!     struct ControlReg {
> +//!         3:0       mode        as u8 ?=> Mode;
> +//!         7         state       as bool => State;
> +//!     }
> +//! }

As discussed at the conference this week, I do object to this as it
will allow the same mistakes to happen that we used to do in the kernel
for a long time before the regmap() api happened, along with GENMASK().

The issue is that you are going to want to take these bitfields as part
of a larger structure, and attempt to "lay it over" a chunk of memory
that came from, or is going to, hardware.  When that happens, all of the
endian issues of mis-matches between hardware and cpus come into play,
which is not able to be properly expressed here at all, unless you
attempt to either resolve it all later on in something like the regmap
api, or you have #ifdef stuff to attempt to capture all of the possible
combinations and deal with it at build time (which is strongly never
recommended, but is what we used to do in previous decades.)

Your example code using this is nice, and it shows how to set up, and
query these bits, but that's not anything anyone actually does in the
kernel, what they want to do is read/write from hardware with this.

So, how does that work?  Where does this "drop down" to the native
bus/memory transactions and swizzle the bits properly to work correctly?

And where does this allow us to define things like BIT(2) for values?
(ok, that's kind of not the point of this patch series, but it will come
up over time...)

Ideally, this would map to our existing regmap api, which does handle
all of this properly, but I know that's not usually used by PCI drivers
like where this code is coming from, as they "just assume" endian
formats are all little and can get away with it due to the limited
nature of different hardware types for their hardware.

Also, a larger meta-comment, why doesn't rust have bit types?  Why does
everyone either have to roll their own or rely on an external crate?  Is
anyone working to provide native bit support to the language?  I'm sure
the embedded people would love it as I imagine it's what they reach for
first when using the language on their hardware.

thanks,

greg k-h
