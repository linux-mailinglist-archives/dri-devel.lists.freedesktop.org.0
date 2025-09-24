Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637E0B9975D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 12:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AEA10E6E8;
	Wed, 24 Sep 2025 10:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LKFMqXQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540AC10E6E8;
 Wed, 24 Sep 2025 10:40:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6F69436EF;
 Wed, 24 Sep 2025 10:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA070C4CEE7;
 Wed, 24 Sep 2025 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1758710453;
 bh=WLTg6YhgypSTinJluMxh2Q1bjm4WVEf8y8wZlXZnQg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKFMqXQPRy4tKUX1osFG2qJmVgiVfCn4hrzZTfy6Hc0iDau9ChwwRcHsb93S7dFAq
 CRjAvxRLq0kPwdCkoQLeE0j+q2YFfAlMZn9y4CW022IV53eEvOkL0JkiErBgqoIvF3
 gH2uTYZs0FsR1VNgjSgu0uwikqlKDIqvfuwRbeIs=
Date: Wed, 24 Sep 2025 12:40:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
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
Message-ID: <2025092425-sinuous-playoff-3618@gregkh>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
 <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh>
 <20250923222434.GA2479829@joelbox2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923222434.GA2479829@joelbox2>
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

On Tue, Sep 23, 2025 at 06:24:34PM -0400, Joel Fernandes wrote:
> Hi Greg,
> 
> On Sun, Sep 21, 2025 at 02:45:27PM +0200, Greg KH wrote:
> > On Sun, Sep 21, 2025 at 02:33:56PM +0200, Benno Lossin wrote:
> > > On Sun Sep 21, 2025 at 11:36 AM CEST, Greg KH wrote:
> > > > On Sat, Sep 20, 2025 at 02:22:27PM -0400, Joel Fernandes wrote:
> > > >> The bitfield-specific into new macro. This will be used to define
> > > >> structs with bitfields, similar to C language.
> > > >> 
> > > >> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> > > >> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > > >> ---
> > > >>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
> > > >>  drivers/gpu/nova-core/nova_core.rs   |   3 +
> > > >>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
> > > >>  3 files changed, 327 insertions(+), 249 deletions(-)
> > > >>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
> > > >> 
> > > >> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
> > > >> new file mode 100644
> > > >> index 000000000000..ba6b7caa05d9
> > > >> --- /dev/null
> > > >> +++ b/drivers/gpu/nova-core/bitfield.rs
> > > >> @@ -0,0 +1,314 @@
> > > >> +// SPDX-License-Identifier: GPL-2.0
> > > >> +
> > > >> +//! Bitfield library for Rust structures
> > > >> +//!
> > > >> +//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
> > > >> +//!
> > > >> +//! # Syntax
> > > >> +//!
> > > >> +//! ```rust
> > > >> +//! #[derive(Debug, Clone, Copy)]
> > > >> +//! enum Mode {
> > > >> +//!     Low = 0,
> > > >> +//!     High = 1,
> > > >> +//!     Auto = 2,
> > > >> +//! }
> > > >> +//!
> > > >> +//! impl TryFrom<u8> for Mode {
> > > >> +//!     type Error = u8;
> > > >> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
> > > >> +//!         match value {
> > > >> +//!             0 => Ok(Mode::Low),
> > > >> +//!             1 => Ok(Mode::High),
> > > >> +//!             2 => Ok(Mode::Auto),
> > > >> +//!             _ => Err(value),
> > > >> +//!         }
> > > >> +//!     }
> > > >> +//! }
> > > >> +//!
> > > >> +//! impl From<Mode> for u32 {
> > > >> +//!     fn from(mode: Mode) -> u32 {
> > > >> +//!         mode as u32
> > > >> +//!     }
> > > >> +//! }
> > > >> +//!
> > > >> +//! #[derive(Debug, Clone, Copy)]
> > > >> +//! enum State {
> > > >> +//!     Inactive = 0,
> > > >> +//!     Active = 1,
> > > >> +//! }
> > > >> +//!
> > > >> +//! impl From<bool> for State {
> > > >> +//!     fn from(value: bool) -> Self {
> > > >> +//!         if value { State::Active } else { State::Inactive }
> > > >> +//!     }
> > > >> +//! }
> > > >> +//!
> > > >> +//! impl From<State> for u32 {
> > > >> +//!     fn from(state: State) -> u32 {
> > > >> +//!         state as u32
> > > >> +//!     }
> > > >> +//! }
> > > >> +//!
> > > >> +//! bitfield! {
> > > >> +//!     struct ControlReg {
> > > >> +//!         3:0       mode        as u8 ?=> Mode;
> > > >> +//!         7         state       as bool => State;
> > > >> +//!     }
> > > >> +//! }
> > > >
> > > > As discussed at the conference this week, I do object to this as it
> > > > will allow the same mistakes to happen that we used to do in the kernel
> > > > for a long time before the regmap() api happened, along with GENMASK().
> > > 
> > > Have you read the following macro arm of the implementation?
> > > 
> > >     // Generates the accessor methods for a single field.
> > >     (
> > >         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
> > >             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
> > >     ) => {
> > >         ::kernel::macros::paste!(
> > >         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> > >         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> > >         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
> > >         );
> > >     
> > >         $(
> > >         #[doc="Returns the value of this field:"]
> > >         #[doc=$comment]
> > >         )?
> > >         #[inline(always)]
> > >         pub(crate) fn $field(self) -> $res_type {
> > >             ::kernel::macros::paste!(
> > >             const MASK: u32 = $name::[<$field:upper _MASK>];
> > >             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> > >             );
> > >             let field = ((self.0 & MASK) >> SHIFT);
> > > 
> > > Here you can see that it's just a mask + shift operation internally to
> > > access the field.
> > >     
> > >             $process(field)
> > >         }
> > >     
> > >         ::kernel::macros::paste!(
> > >         $(
> > >         #[doc="Sets the value of this field:"]
> > >         #[doc=$comment]
> > >         )?
> > >         #[inline(always)]
> > >         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
> > >             const MASK: u32 = $name::[<$field:upper _MASK>];
> > >             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
> > >             let value = (u32::from(value) << SHIFT) & MASK;
> > >             self.0 = (self.0 & !MASK) | value;
> > >     
> > >             self
> > >         }
> > >         );
> > >     };
> > 
> > Yes, that's great, but that is all done in "native cpu" endian, and
> > might not actually represent what the hardware does at all, which is
> > what I was trying to get at here, sorry for not being more specific.
> > 
> > > Now I too would like to see how exactly this will be used to read data
> > > from hardware. But at least in theory if the conversion from hardware
> > > endianness to native endianness is done correctly, this will do the
> > > right thing :)
> > 
> > That's great, so we are close, but it's not quite correct.  How about
> > something like:
> > 
> > 	0:7	reg_X	as __le32
> > 	8:15	reg_y	as __le32
> 
> I don't think we should force endianness requirements within specific fields in
> the bitfield rust library itself, it is upto the user. bitfields are not only
> for registers even in C. If you see on the C side, we have rcu_special union
> which uses 'u32' and does not enforce endianness within the fields or bytes
> of the struct with respect to the fields. Its all native CPU endian and works
> fine. You're basically saying in terms of C that, the designers of the C
> bitfield in C standard force the C language to use endianness in the types, no
> they can't / shouldn't be forced to.

For "cpu native" structures, just use the bit and genmask macros we have
today, on top of a normal variable type and you should be fine.  The
only place you need/want to do stuff like what is being proposed here is
when you are trying to match up a data structure that is in hardware to
be able to split the values out of it safely.

And when dealing with data that goes outside of the kernel (i.e. to/from
hardware), you HAVE to specify the endianness of that data as the
hardware is the one that defines this, NOT the cpu that the kernel is
running on.

So you should NEVER see a bitfield structure that is defined just as a
"u32" and expect that to work properly when read/written to hardware
because while little-endian is what seems to have "won" the recent
battles on this topic it's not always the case for many places that
Linux runs on today.

> For the separate issue of enforcing endianness with respect to (across)
> multiple fields, I agree with you that if the user's backend (the consumer of
> the data) is not doing such conversion, say via regmap, then that becomes a
> problem. But that problem is orthogonal/different and cannot be solved here.  

But that is exactly what these macros are being defined here for, so to
ignore that is going to cause problems :)

thanks,

greg k-h
