Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC0BA93926
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162710E215;
	Fri, 18 Apr 2025 15:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IOE93dZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B40B10E215
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:09:50 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4769aef457bso21584571cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744988990; x=1745593790; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0Dsv3z7t+31gGPh4O3y1P8SBdY+OOoan8i9lPYxKHL8=;
 b=IOE93dZUm/xW93c8/t4LTl4Aj+fuoQeD61mpmdMvZ0fa9Ed/Zpk+9uklGTH9wZTdVr
 3sk9yohQVsRbaSdnlNc6NnLBnqCvTp0rUFc5CnwG30lF5bxIxfqF8QqDeoOwLr6i7v11
 dDbzbEGQacXLS2I7juIzstNFQexBI+uPuK6RP7r0caEQQRXeY/GM85ne1ck4x2+SdrZO
 TAH/BIq+g9yDkbo79fgO3IwHdLaRriab/fVyd6MCnD/BVwhde0iu7kOKUv6UuN0h3f+Y
 veBYBnqFHzUORH/d2DVXrPKxbxYY5jYEnOBfb0v+wnA0irq7gjX3LyowzRlZ0YKaMvJi
 izrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744988990; x=1745593790;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Dsv3z7t+31gGPh4O3y1P8SBdY+OOoan8i9lPYxKHL8=;
 b=sU/tfT1a6nwVyqf0WmtR7OczQx51GqrqU/1tf7rMSUK+9B82HGnUPIOPMoN63pHkiY
 MN9PXcND+ET2lMPC0YcMCZnEx/rH5G0byHChQZK1jQn/Z9ehC6P/eXWlTI7RrmrOWmF0
 HIgbBBWFB3NFH830jPOMkTBBfHM7gqENH+TieyMj9ZDWp+TvBlTJh2w/yq35/9yMiG/9
 wUuqHLd8l8b6qSrmr27RBcdEvllxS2AUzXcBkRw92N7/QDSzuP3RU3gCF1bOxS52/PeZ
 sVO//H4VlV1Jfy05i4hSIPnkpASitBptmOnvmA5qyVmF9eRhYqoHPLKg2UJAtPGWNv1k
 ny4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAB+nm221XwEZux3rCPbEg5+dsxWw9U5207VN+QbukSypC3K0ZKlKhLluwlBq4YCea6LT2YgkZzEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhKVNBHn0DNYr1me0N95e+bpFaYJGSGvZ9Av0GqdoKs2EJhMHC
 JxRdPDKsVpG1T70u7huIeIPX2+/LhpZQtchuSISh1BkTkpUdeoQv
X-Gm-Gg: ASbGnctm9pX7Wogdu/ft0VsqTra4KrpCm6O8CrfvA/OtNaN5AlbqspEcKBrviHvymOs
 KPJcvIkd7a/YWV6Z/zNWzMKKRvzdGtSOHoP0/auiB65BYHNYBSLHe36YBbtPvg4hiUxJWwiNMXT
 HKvPsw9/ng0vHvyTArxaNwivR7BxGUA45LK7bg9qd4l4ZN6Y05gYWiIIIXn21eZkUCw3zQW8Bue
 BqOyRp3Cb9vPWL0WwGa3EVO9fCHMgtA/oHJ3EE7DaY0ueyYpR8xnmf3SERyJCjjoDTW0zbJJ8SO
 0ddTSCgEKS12T2cBzeHaiOCFdbSqzxNSIiM4ABXe0oZGNsrqAsiQPMMeYP+bqshjalTgnZJtT4i
 a+c0dZ9dWfLKxaPywaH9qYdOE3ieigW2ewRubotSYqg==
X-Google-Smtp-Source: AGHT+IENEr3mX6PNJMlR4IakA2btIJgcBi6yGsy3CWuKCMQCTZa3fx5UCe5roskHzM+fY4R7JQ9Zyg==
X-Received: by 2002:a05:622a:149:b0:478:e507:f6ec with SMTP id
 d75a77b69052e-47aec3cbeb8mr46335091cf.23.1744988989483; 
 Fri, 18 Apr 2025 08:09:49 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47ae9ce265esm11369861cf.61.2025.04.18.08.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 08:09:48 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 7C0111200068;
 Fri, 18 Apr 2025 11:09:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 18 Apr 2025 11:09:47 -0400
X-ME-Sender: <xms:O2sCaLMhqtSLrMPEVrBKEwlEADIQtbU9grYGxMnfCXzawkEVjnGAgg>
 <xme:O2sCaF9Hsfk4vAzVRky2EsF4PC_6jpyZYHwU41x5RVIaqUX2JSllDSSSubBpMT13J
 XqULEmQuEZoaZFvEg>
X-ME-Received: <xmr:O2sCaKQVj7sXB8lrgwyiHjq21aI9bjI-fTGTdf7KQDlG9haG8hKooPPo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvgeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddt
 tdejnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrg
 hilhdrtghomheqnecuggftrfgrthhtvghrnhepgeekgeettdelffekfedtveelueeiudev
 jeegieekvdegkedufeetfeeiiedvueelnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhq
 uhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqud
 ejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgv
 rdhnrghmvgdpnhgspghrtghpthhtohepgeejpdhmohguvgepshhmthhpohhuthdprhgtph
 htthhopehtrghmihhrugesghhmrghilhdrtghomhdprhgtphhtthhopehmrghsrghhihhr
 ohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrd
 horhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
 rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
 grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
 rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
 hmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:O2sCaPv6cNkYR1L3v22OmPBlaF5_uj-Gtc9bYF5g5p9BJfOt4b_5dw>
 <xmx:O2sCaDcjQFwv41gesK7o9bhI6QS8B6tcOIUZ-7q4OhbhpwXN0jPYmg>
 <xmx:O2sCaL0EjZCSXp9otVr_7pj1-H_eEXfRqUCHCt8XuygwskGmVCfBrg>
 <xmx:O2sCaP9jJvWQyVCMOnIEGzRC47Id55SrzRt6ZAN9OQaN3PR42rfEvw>
 <xmx:O2sCaG969DiVW1gusFm6htOCOhywAJcscNqrIN65Wdqy4Pjto7nvliKg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 11:09:46 -0400 (EDT)
Date: Fri, 18 Apr 2025 08:09:45 -0700
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
Message-ID: <aAJrOV88S-4Qb5o0@Mac.home>
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-4-18ec29b1b1f3@gmail.com>
 <68014084.0c0a0220.394e75.122c@mx.google.com>
 <CAJ-ks9muaNU9v2LZ5=cmfXV6R5AO+joNOoPP=+hs-GJN=APfKQ@mail.gmail.com>
 <680160b8.050a0220.223d09.180f@mx.google.com>
 <CAJ-ks9=TXjk8W18ZMG4mx0JpYvXr4nwnUJqjCnqvW9zu2Y1xjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=TXjk8W18ZMG4mx0JpYvXr4nwnUJqjCnqvW9zu2Y1xjA@mail.gmail.com>
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

On Fri, Apr 18, 2025 at 08:08:02AM -0400, Tamir Duberstein wrote:
> On Thu, Apr 17, 2025 at 4:12 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Thu, Apr 17, 2025 at 03:26:14PM -0400, Tamir Duberstein wrote:
> > [...]
> > > >
> > > > >          Ok(())
> > > > >      }
> > > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > > > index e5859217a579..4063f09d76d9 100644
> > > > > --- a/rust/kernel/device_id.rs
> > > > > +++ b/rust/kernel/device_id.rs
> > > > > @@ -82,7 +82,7 @@ impl<T: RawDeviceId, U, const N: usize> IdArray<T, U, N> {
> > > > >              unsafe {
> > > > >                  raw_ids[i]
> > > > >                      .as_mut_ptr()
> > > > > -                    .byte_offset(T::DRIVER_DATA_OFFSET as _)
> > > > > +                    .byte_add(T::DRIVER_DATA_OFFSET)
> > > > >                      .cast::<usize>()
> > > > >                      .write(i);
> > > > >              }
> > > > > diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> > > > > index f7e8f5f53622..70d12014e476 100644
> > > > > --- a/rust/kernel/devres.rs
> > > > > +++ b/rust/kernel/devres.rs
> > > > > @@ -45,7 +45,7 @@ struct DevresInner<T> {
> > > > >  /// # Example
> > > > >  ///
> > > > >  /// ```no_run
> > > > > -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::{Io, IoRaw}};
> > > > > +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ffi::c_void, io::{Io, IoRaw}};
> > > > >  /// # use core::ops::Deref;
> > > > >  ///
> > > > >  /// // See also [`pci::Bar`] for a real example.
> > > > > @@ -59,19 +59,19 @@ struct DevresInner<T> {
> > > > >  ///     unsafe fn new(paddr: usize) -> Result<Self>{
> > > > >  ///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
> > > > >  ///         // valid for `ioremap`.
> > > > > -///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE as _) };
> > > > > +///         let addr = unsafe { bindings::ioremap(paddr as bindings::phys_addr_t, SIZE) };
> > > >
> > > >
> > > > ///         let addr = unsafe { bindings::ioremap(bindings::phys_addr_t::from(paddr), SIZE) };
> > > >
> > > > better? Or even with .into()
> > > >
> > > > ///         let addr = unsafe { bindings::ioremap(paddr.into(), SIZE) };
> > >
> > > This doesn't compile because `paddr` is usize, and
> > > `bindings::phys_addr_t` is u64 (on my machine, which is aarch64).
> > >
> >
> > Ok, looks like Rust yet doesn't provide From/Into between usize and u64
> > even if the pointer size is fixed. Latest discussion can be found at:
> >
> >         https://github.com/rust-lang/rust/issues/41619#issuecomment-2056902943
> >
> > Lemme see if we can get an issue tracking this. Thanks for taking a
> > look.
> >
> > > > >  ///         if addr.is_null() {
> > > > >  ///             return Err(ENOMEM);
> > > > >  ///         }
> > > > >  ///
> > > > > -///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> > > > > +///         Ok(IoMem(IoRaw::new(addr as usize, SIZE)?))
> > > > >  ///     }
> > > > >  /// }
> > > > >  ///
> > > > >  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> > > > >  ///     fn drop(&mut self) {
> > > > >  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> > > > > -///         unsafe { bindings::iounmap(self.0.addr() as _); };
> > > > > +///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
> > > > >  ///     }
> > > > >  /// }
> > > > >  ///
> > > > [...]
> > > > > diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> > > > > index 43ecf3c2e860..851a6339aa90 100644
> > > > > --- a/rust/kernel/dma.rs
> > > > > +++ b/rust/kernel/dma.rs
> > > > > @@ -38,7 +38,7 @@
> > > > >  impl Attrs {
> > > > >      /// Get the raw representation of this attribute.
> > > > >      pub(crate) fn as_raw(self) -> crate::ffi::c_ulong {
> > > > > -        self.0 as _
> > > > > +        self.0 as crate::ffi::c_ulong
> > > >
> > > >         crate::ffi::c_ulong::from(self.0)
> > > >
> > > > maybe, a C unsigned long should always be able to hold the whole `Attr`
> > > > and a lossly casting is what this function does.
> > >
> > > This also doesn't compile: "the trait `core::convert::From<u32>` is
> > > not implemented for `usize`". Upstream has ambitions of running on
> > > 16-bit, I guess :)
> > >
> >
> > They do but they also have the target_pointer_width cfg, so they can
> > totally provide these functions. It's just they want to find a better
> > way (like the link I post above).
> 
> Did you want me to hold off on the respin on this point, or shall I go ahead?

No need to wait. This doesn't affect your current patch. But we do need
to start making some decisions about how we handle the conversions *32
=> *size, *size => *64 and c*long <=> *size, they should all be lossless
in the context of kernel. We have 3 options:

1.	Using `as`.
2.	Having our own to_*size(*32), to_*64(*size), to_*size(*64),
	to_c*long(*size) and to_*size(c*long) helper functions.
3.	Waiting and using what Rust upstream comes up.

I'm leaning towards to 2 and then 3, because using `as` can sometimes
surprise you when you change the type. Thoughts?

Regards,
Boqun
