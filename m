Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B0A92489
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FD310E391;
	Thu, 17 Apr 2025 17:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jVcs/2GN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B0B10E391
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:55:18 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c59e7039eeso137644385a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744912517; x=1745517317; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDTyGaLtYvMzXIgfoaj4Rbqx4NtWqG+lF7urmkywNu8=;
 b=jVcs/2GN6fG+HcmCWMvd46IM6Ov1Ng55lkWS7SgreWHQPsXpzJCVapKH5hBbo2YC3p
 uKn723c1iBOhbjDgHkgPbXdrRc+0pse/TPlTSAUHTBleSCzH47WTLx92LZrh8qdtrFOA
 Bd/RtGUgvMUzcXpdLs2N2XsczlDIDtxUTE2FNh1KKR/gorw0jZwPeMjzjQANj+eyiEu0
 SpcZ3d7LYSsBoM5hXCUebVnIkuABZZI+/CAxLZmwC2ylBy5PcwwillQV+Co3cu5+btWL
 q/7l9JaJ4T3DFI8rJ83KSv6PoQOBy53WQD8EmD26rJAdw3+oDz8FIX8t7zIxvh6C2hKZ
 s5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744912517; x=1745517317;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDTyGaLtYvMzXIgfoaj4Rbqx4NtWqG+lF7urmkywNu8=;
 b=HmQe6EWZU777qXExOTWP3tMUUXxNXOhVRbYcaauay3o8GdJcl97CL4XOOSjBXn80zN
 33E11fA3Cmn1vX84PcFFz707DYW5zNGgIsM7blIDres8xI30umTFZqeLOuTAfaU3ZaSj
 TJxqsusRQounIPvK+UN+UQCnYAheOyViX3ec0r6/C+AWGVK7YBybulpZEpm52Fbg5Srz
 HWykFQrps76KgPQEajRWYDgj4T2NT6oaYVWL2WNn4AyUSiXGvzZvFep0QjW/JWK8vODP
 4PrGyhswT3mxoYDuquDCJQ6s0F9kbFR3VWvyDIke4eo4SuO13JTmF3cUtDvvUUHxUqSq
 p2VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuFThSi2GsLu+o55JczHuKy1p2QKzZkp7ptCgjsmT5a0uN/1Di5QhTRB5Pg4drRUeFitT2AG5qw74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3EAaX75I8kQ2d6dOGc9Zusx9032Klgw1lg/gFcnMAiz8731FX
 gHV1RjV7/s9ElbTusmUh79cZHRIAvfUj3DyAusT3ojE9e2e1ukZj
X-Gm-Gg: ASbGncsC/dAQ9TlI/ynor8oE7drvCpI1+cAFqhzG++2LbFygVqaszjF85ZmNnR1FxPZ
 HIfWNiHcb6o8AXnkex+iKwebJh8R6Z67BZU8ks5dkJHtexG+UQB4yFoJAiezYbGvuV2lP+qyJjF
 yOFTmdwLOihyUxngigDovQSxB4AGCJqzlummgGC3vyQ2X7M9L6IOAAht0fEUvhqDZUxR8KvOafq
 iTCaNenI/UItz4RUHKC5rvmiNxekcqPFHW91sFw/PwIov8/OeG0MaXSDLe7lBYkWVjPiE2eEkgh
 WLql119r/9+ev0EXGIJNGvO5hNbF6BAZ13iED3eBq9FcDAmrCxFQTNS5CH7+GmAPWwJZbanrplB
 UtR2Ikt9iCI3pkgB6qhf2915LX+ma4YPlPBB4sCmUJA==
X-Google-Smtp-Source: AGHT+IE3H7mH1nYpCtZAyCv0gNgV400qtjcEh3CsRpVjdOU7C2s1ueMnwNvcesjSj2oJQ2QEcjf+TA==
X-Received: by 2002:ad4:5c65:0:b0:6e8:fb92:dffa with SMTP id
 6a1803df08f44-6f2b2f97ff2mr117242546d6.25.1744912516938; 
 Thu, 17 Apr 2025 10:55:16 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2b0f0fdsm1708066d6.29.2025.04.17.10.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 10:55:16 -0700 (PDT)
Message-ID: <68014084.0c0a0220.394e75.122c@mx.google.com>
X-Google-Original-Message-ID: <aAFAgcqBweaMzlAE@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id 670A31200043;
 Thu, 17 Apr 2025 13:55:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 17 Apr 2025 13:55:15 -0400
X-ME-Sender: <xms:g0ABaKa4EcQUC7fK7BYEjgy2gGAJI13Q2EBEttkW1DIPfPkLwCPFjQ>
 <xme:g0ABaNbebtyF11d8GBpjn5jKGhVH8idOwX3TpiXtReZNPDn67VxvyPU3Dj87vHnRN
 zTQUiQ76o2uCZj22A>
X-ME-Received: <xmr:g0ABaE99EXDad75aTJ2E6BW8TM4x8UeYaddVaOt4TqmECgE8LQ-8NbXzqZf2SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelleduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcuhf
 gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
 rhhnpefgteetfeekheekleetffdvgfegkeetkeehudfhheegveekleekieeuudeitedvue
 enucffohhmrghinhepghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
 honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
 gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepge
 ejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtrghmihhrugesghhmrghilhdr
 tghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtph
 htthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurges
 khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
 drtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthho
 pegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvg
 hnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggs
 ohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:g0ABaMrAvrmxf3gdiJO3-ZbxmF7UIMs2PHeSVcsCn51Z8WkUFa-lgg>
 <xmx:g0ABaFpW6Zkb7KQ4fzsYJKoOfk2zeyEiqGixN0bi66xIrdlqUzS51w>
 <xmx:g0ABaKQ8zVN6GqRR5WsaFGM4miuik80rgyuL4NMBiOvmcykxiZ6Llg>
 <xmx:g0ABaFq7q6ScWpkgBnLDstyvt3GXcCW2ZUx7e4xF7jcBtfKiM7gZLg>
 <xmx:g0ABaC5uGjNwNtEanE9knMMkjvbEj0OWv_RcOmcNpy0TzVCHEUS3UHDL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 13:55:14 -0400 (EDT)
Date: Thu, 17 Apr 2025 10:55:13 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Frederic Weisbecker <frederic@kernel.org>,	Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/6] rust: enable `clippy::as_underscore` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:08PM -0400, Tamir Duberstein wrote:
> In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:
> 
> > The conversion might include lossy conversion or a dangerous cast that
> > might go undetected due to the type being inferred.
> >
> > The lint is allowed by default as using `_` is less wordy than always
> > specifying the type.
> 
> Always specifying the type is especially helpful in function call
> contexts where the inferred type may change at a distance. Specifying
> the type also allows Clippy to spot more cases of `useless_conversion`.
> 
> The primary downside is the need to specify the type in trivial getters.
> There are 4 such functions: 3 have become slightly less ergonomic, 1 was
> revealed to be a `useless_conversion`.
> 
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  Makefile                           |  1 +
>  rust/kernel/block/mq/operations.rs |  2 +-
>  rust/kernel/block/mq/request.rs    |  2 +-
>  rust/kernel/device_id.rs           |  2 +-
>  rust/kernel/devres.rs              | 15 ++++++++-------
>  rust/kernel/dma.rs                 |  2 +-
>  rust/kernel/error.rs               |  2 +-
>  rust/kernel/io.rs                  | 18 +++++++++---------
>  rust/kernel/miscdevice.rs          |  2 +-
>  rust/kernel/of.rs                  |  6 +++---
>  rust/kernel/pci.rs                 |  9 ++++++---
>  rust/kernel/str.rs                 |  8 ++++----
>  rust/kernel/workqueue.rs           |  2 +-
>  13 files changed, 38 insertions(+), 33 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 04a5246171f9..57080a64913f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -475,6 +475,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wunreachable_pub \
>  			    -Wclippy::all \
>  			    -Wclippy::as_ptr_cast_mut \
> +			    -Wclippy::as_underscore \
>  			    -Wclippy::ignored_unit_patterns \
>  			    -Wclippy::mut_mut \
>  			    -Wclippy::needless_bitwise_bool \
> diff --git a/rust/kernel/block/mq/operations.rs b/rust/kernel/block/mq/operations.rs
> index 864ff379dc91..d18ef55490da 100644
> --- a/rust/kernel/block/mq/operations.rs
> +++ b/rust/kernel/block/mq/operations.rs
> @@ -101,7 +101,7 @@ impl<T: Operations> OperationsVTable<T> {
>          if let Err(e) = ret {
>              e.to_blk_status()
>          } else {
> -            bindings::BLK_STS_OK as _
> +            bindings::BLK_STS_OK as u8
>          }
>      }
>  
> diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
> index af5c9ac94f36..22697104bf8c 100644
> --- a/rust/kernel/block/mq/request.rs
> +++ b/rust/kernel/block/mq/request.rs
> @@ -125,7 +125,7 @@ pub fn end_ok(this: ARef<Self>) -> Result<(), ARef<Self>> {
>          // success of the call to `try_set_end` guarantees that there are no
>          // `ARef`s pointing to this request. Therefore it is safe to hand it
>          // back to the block layer.
> -        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK_STS_OK as _) };
> +        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK_STS_OK as u8) };
>  

We could consider defining a const block::mq::BLK_STATUS_OK as:

	const BLK_STATUS_OK: u8 = bindings::BLK_STS_OK as u8;

, because repeating the as pattern is a bit err-prone. But maybe in a
later patch.

>          Ok(())
>      }
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index e5859217a579..4063f09d76d9 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T, U, N> {
>              unsafe {
>                  raw_ids[i]
>                      .as_mut_ptr()
> -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> +                    .byte_add(T::DRIVER_DATA_OFFSET)
>                      .cast::<usize>()
>                      .write(i);
>              }
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index f7e8f5f53622..70d12014e476 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -45,7 +45,7 @@ struct DevresInner<T> {
>  /// # Example
>  ///
>  /// ```no_run
> -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
> +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ffi::c_void, io::{Io, IoRaw}};
>  /// # use core::ops::Deref;
>  ///
>  /// // See also [`pci::Bar`] for a real example.
> @@ -59,19 +59,19 @@ struct DevresInner<T> {
>  ///     unsafe fn new(paddr: usize) -> Result<Self>{
>  ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
>  ///         // valid for `ioremap`.
> -///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
> +///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };


///         let addr = unsafe { bindings::ioremap(bindings::phys_addr_t::from(paddr), SIZE) };

better? Or even with .into()

///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };

>  ///         if addr.is_null() {
>  ///             return Err(ENOMEM);
>  ///         }
>  ///
> -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
>  ///     }
>  /// }
>  ///
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
>  ///     }
>  /// }
>  ///
[...]
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 43ecf3c2e860..851a6339aa90 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -38,7 +38,7 @@
>  impl Attrs {
>      /// Get the raw representation of this attribute.
>      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> -        self.0 as _
> +        self.0 as crate::ffi::c_ulong

        crate::ffi::c_ulong::from(self.0)

maybe, a C unsigned long should always be able to hold the whole `Attr`
and a lossly casting is what this function does.

>      }
>  
>      /// Check whether `flags` is contained in `self`.
[...]
> @@ -70,19 +70,19 @@ pub fn maxsize(&self) -> usize {
>  ///     unsafe fn new(paddr: usize) -> Result<Self>{
>  ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
>  ///         // valid for `ioremap`.
> -///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
> +///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };

Similarly:

///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };

or `from()`.

>  ///         if addr.is_null() {
>  ///             return Err(ENOMEM);
>  ///         }
>  ///
> -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
>  ///     }
>  /// }
>  ///
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
>  ///     }
>  /// }
>  ///
[...]

The rest looks good to me. Thanks!

Regards,
Boqun
