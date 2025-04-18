Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E6A93969
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DB10EBB1;
	Fri, 18 Apr 2025 15:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMm8el59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A310EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:16:27 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bf5d7d107so14637941fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744989386; x=1745594186; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eg/XryCXtmzIR8VElx3wkFZ2q0fuZ+2pn069yJHEtd8=;
 b=KMm8el59gHyGgY1c0BDNOwcjWBm/S51li2Q0v2BT6fyf2gn0EFqKdScSCBKsX2Lpns
 xrqL7bOOANQNtPr/qEbFAf42kzu3AM/5yodJL0Le9tHPtLWaVOxGeVdVG4OgFdaHkS5X
 cc7IdG4fonZMFNQ+yTtbyZ30OX9gqf0vXAkbKhK74a8VA2ux746iwe6tkfmOis5XNjq5
 gEZNTIz0SbO2zWdOdrYkPZgMyIbL9KKU6G1XCnQeqmD2XTOE4GUQ/TPPR88Pr4ugabw7
 T3kk4fVyx4WqkUsb71ku0MDfIW3zCn/jRnZe2LbRvuX0m4ia2nTjfcNSUGjiR3Q7wBlG
 MSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744989386; x=1745594186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eg/XryCXtmzIR8VElx3wkFZ2q0fuZ+2pn069yJHEtd8=;
 b=SwVABMht06H/KWGT/SWNK2emiiospWTP5P0/mmaqljiNlmU2VyayylYVjyt+iBHP8E
 RP3QD4uy3rymhPVkKQgWg2WdbTEF8iUX+KrzgJsAxYB5+8263A7Z+Q1J/eXYVxNt8Uvm
 6M33P00Wib1MgNctQliGyMdXxrIKLdf9pGcMjDgL0QJdtnbFEMHENLZPofLCWIJe+x2J
 Ew8p/QOoVyzXqqc8kNIwv0WNCCMLuRqlpfH3l3FS9+Jl+x4h4aq20Lam80dnal+nrLQx
 FBDYAu7EMpfuVEwhV1xIxLqBJWf/uOQbc5q0Zw4ldxOKG2IPMBmsSUTd2WSfRyj2VDtx
 11LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlFgI2lxdQwh+0fBessL4CxAXUQENkFuFjgJC0z6w83jLgkSoujyZA+vU0dFITdKsTRudZJy1OR0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznaAoSk2zzCeMbJSDamf5sjTqaVgXHivCYPqBDZfmh6JNjfBjz
 TAJB0FbI3SKzCSYRRdD1BgrKDQOPORjxZpxgG8B+pOhKGQvwpegu5s5YKiWY/fxkV3jzqKoHxyd
 VAS/QyMprM7QspOR+UQPTklv/EOg=
X-Gm-Gg: ASbGncsXmtXN24ApxfwjCvpzWKXTbM8Fgkx0atY0LvSyhWJJw5BavFGVoYNAskNeQjG
 fZG41Kq+Ablm1l2xJqOb09kSqr2/iemlnDbdRtPb/Xl1Pgr7og29U3drMVkJPq9gcQtHXhK11zX
 KwiQ7rLnzB9ESp//j5UO3Y3lcNDZsbSJhE/1vjYsUbOlTXrZ5cvutECzj1
X-Google-Smtp-Source: AGHT+IF7s4G6MY5J8Z9f/kRrKwwOP8kRUFivscO5d8i28kyI9/OrydmeokG0mUI1GGr9ZtKyzTHEiIGDsj2mMK1VKSM=
X-Received: by 2002:a2e:a590:0:b0:308:f3b4:ea66 with SMTP id
 38308e7fff4ca-31090556784mr13001471fa.28.1744989385268; Fri, 18 Apr 2025
 08:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
 <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
 <680160b8.050a0220.223d09.180f@mx.google.com>
 <CAJ-ks9=TXjk8W18ZMG4mx0JpYvXr4nwnUJqjCnqvW9zu2Y1xjA@mail.gmail.com>
 <aAJrOV88S-4Qb5o0@Mac.home>
In-Reply-To: <aAJrOV88S-4Qb5o0@Mac.home>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 18 Apr 2025 11:15:49 -0400
X-Gm-Features: ATxdqUGa0yL3BJTd10vx67e5vgbZ6t-kHCwTvjIRZDePw3OECStFIEAsMMp1hyE
Message-ID: <CAJ-ks9=FauL4LGMhrdDbd-NSaxHQ=w_ZtcntSuz2ZgSJWx2wvw@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] rust: enable `clippy::as_underscore` lint
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Apr 18, 2025 at 11:09=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Fri, Apr 18, 2025 at 08:08:02AM -0400, Tamir Duberstein wrote:
> > On Thu, Apr 17, 2025 at 4:12=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Thu, Apr 17, 2025 at 03:26:14PM -0400, Tamir Duberstein wrote:
> > > [...]
> > > > >
> > > > > >          Ok(())
> > > > > >      }
> > > > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.r=
s
> > > > > > index e5859217a579..4063f09d76d9 100644
> > > > > > --- a/rust/kernel/device_id.rs
> > > > > > +++ b/rust/kernel/device_id.rs
> > > > > > @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArr=
ay<T, U, N> {
> > > > > >              unsafe {
> > > > > >                  raw_ids[i]
> > > > > >                      .as_mut_ptr()
> > > > > > -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> > > > > > +                    .byte_add(T::DRIVER_DATA_OFFSET)
> > > > > >                      .cast::<usize>()
> > > > > >                      .write(i);
> > > > > >              }
> > > > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > > > index f7e8f5f53622..70d12014e476 100644
> > > > > > --- a/rust/kernel/devres.rs
> > > > > > +++ b/rust/kernel/devres.rs
> > > > > > @@ -45,7 +45,7 @@ struct DevresInner<T> {
> > > > > >  /// # Example
> > > > > >  ///
> > > > > >  /// ```no_run
> > > > > > -/// # use kernel::{bindings, c_str, device::Device, devres::De=
vres, io::{Io, IoRaw}};
> > > > > > +/// # use kernel::{bindings, c_str, device::Device, devres::De=
vres, ffi::c_void, io::{Io, IoRaw}};
> > > > > >  /// # use core::ops::Deref;
> > > > > >  ///
> > > > > >  /// // See also [`pci::Bar`] for a real example.
> > > > > > @@ -59,19 +59,19 @@ struct DevresInner<T> {
> > > > > >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> > > > > >  ///         // SAFETY: By the safety requirements of this func=
tion [`paddr`, `paddr` + `SIZE`) is
> > > > > >  ///         // valid for `ioremap`.
> > > > > > -///         let addr =3D unsafe { bindings::ioremap(paddr as _=
, SIZE as _) };
> > > > > > +///         let addr =3D unsafe { bindings::ioremap(paddr as b=
indings::phys_addr_t, SIZE) };
> > > > >
> > > > >
> > > > > ///         let addr =3D unsafe { bindings::ioremap(bindings::phy=
s_addr_t::from(paddr), SIZE) };
> > > > >
> > > > > better? Or even with .into()
> > > > >
> > > > > ///         let addr =3D unsafe { bindings::ioremap(paddr.into(),=
 SIZE) };
> > > >
> > > > This doesn't compile because `paddr` is usize, and
> > > > `bindings::phys_addr_t` is u64 (on my machine, which is aarch64).
> > > >
> > >
> > > Ok, looks like Rust yet doesn't provide From/Into between usize and u=
64
> > > even if the pointer size is fixed. Latest discussion can be found at:
> > >
> > >         https://github.com/rust-lang/rust/issues/41619#issuecomment-2=
056902943
> > >
> > > Lemme see if we can get an issue tracking this. Thanks for taking a
> > > look.
> > >
> > > > > >  ///         if addr.is_null() {
> > > > > >  ///             return Err(ENOMEM);
> > > > > >  ///         }
> > > > > >  ///
> > > > > > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > > > > > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> > > > > >  ///     }
> > > > > >  /// }
> > > > > >  ///
> > > > > >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> > > > > >  ///     fn drop(&mut self) {
> > > > > >  ///         // SAFETY: `self.0.addr()` is guaranteed to be pro=
perly mapped by `Self::new`.
> > > > > > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > > > > > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c=
_void); };
> > > > > >  ///     }
> > > > > >  /// }
> > > > > >  ///
> > > > > [...]
> > > > > > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > > > > > index 43ecf3c2e860..851a6339aa90 100644
> > > > > > --- a/rust/kernel/dma.rs
> > > > > > +++ b/rust/kernel/dma.rs
> > > > > > @@ -38,7 +38,7 @@
> > > > > >  impl Attrs {
> > > > > >      /// Get the raw representation of this attribute.
> > > > > >      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > > > > > -        self.0 as _
> > > > > > +        self.0 as crate::ffi::c_ulong
> > > > >
> > > > >         crate::ffi::c_ulong::from(self.0)
> > > > >
> > > > > maybe, a C unsigned long should always be able to hold the whole =
`Attr`
> > > > > and a lossly casting is what this function does.
> > > >
> > > > This also doesn't compile: "the trait `core::convert::From<u32>` is
> > > > not implemented for `usize`". Upstream has ambitions of running on
> > > > 16-bit, I guess :)
> > > >
> > >
> > > They do but they also have the target_pointer_width cfg, so they can
> > > totally provide these functions. It's just they want to find a better
> > > way (like the link I post above).
> >
> > Did you want me to hold off on the respin on this point, or shall I go =
ahead?
>
> No need to wait. This doesn't affect your current patch. But we do need
> to start making some decisions about how we handle the conversions *32
> =3D> *size, *size =3D> *64 and c*long <=3D> *size, they should all be los=
sless
> in the context of kernel. We have 3 options:
>
> 1.      Using `as`.
> 2.      Having our own to_*size(*32), to_*64(*size), to_*size(*64),
>         to_c*long(*size) and to_*size(c*long) helper functions.
> 3.      Waiting and using what Rust upstream comes up.
>
> I'm leaning towards to 2 and then 3, because using `as` can sometimes
> surprise you when you change the type. Thoughts?

Yes, I think that's the right thing to do. That, along with the
provenance functions, might even allow us to turn on
https://rust-lang.github.io/rust-clippy/master/index.html#as_conversions.
