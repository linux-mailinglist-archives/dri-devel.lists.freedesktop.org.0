Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B092A8A697
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 20:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EB510E13D;
	Tue, 15 Apr 2025 18:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XMwMKaF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C162310E13D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 18:18:00 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-476b4c9faa2so72723481cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744741079; x=1745345879; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ExhlIGj+yTSPW/bDWyFi4TK2XTBBWSbc3TeamRQDEM0=;
 b=XMwMKaF27j6ohdHySE0f0Y0l3e1AuO2v4Q3RlIsy8X3FrStDRzZRueYnSU8TROJ/Da
 kXuYVnmMxYHIPLqE273w+utLY2vj3awXk7QhT0RaqFU01fhsNINBeerfacZMPY7FssBs
 CiUEaTfq/T0cu06L+5xO+VxmAdd/ZQr5d86qjyOZkahmgbMkDcNLUPb5mpUw7O4JZLJ+
 qTO+JgHj/FsJA0uwf9KVrOBlUOkJR1H1stjQDdN9sN8B3rxxr6G4btYDMfjWdZrC0Fp9
 cXNkBajb/ppLLMfaccshZxBuTPjf4clVs1nfxdceMHhZ8kKEHms+Tna4eKsD66Am2v0W
 0teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744741079; x=1745345879;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExhlIGj+yTSPW/bDWyFi4TK2XTBBWSbc3TeamRQDEM0=;
 b=HZrH8BMN8KXO64rNzgQ28vdmqvFf9xfZuJtFz0DTW2814zaM4Vu4A7y45H7uQYDUV3
 ycv7DGer/2/Awq+1kC13J/ZnKjf30RxRYt9ObQsBQ6ay3bGvFWu2WPIY4UhC8aoXl8OW
 PAhMCIVE4/fwVl4b4JxO7pcFm/ARflVCikK2vW1U2Dy3fpGsFi0wkQ0RX9H0ECVW21eM
 pqjxLYshR9n91HVbtmCGwTB/KAlJtQwhlt/rl+QLOfEfIe7e4dgPAr7GHkdg639vGBCZ
 CCGNO0S6AepdhnBqr163idYcXYxQPoBBy7B4+mTr4vSQz6zM6m37CQjlsfoeVG/3o5Y8
 kS4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/cXjPaMWis7DK5Be8jAhfebwxWmZvhetivxmkoFt+ufb8lVDb9lx+N0B3xRsLseBrRSC3B7qMpL8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtbGsea5H4JyILP6GVGHXjy7GyYaVUPkMItxQF5u+2xd+GK7I6
 Ox+7VtnUGQojWaRjRQMUq3Tao8r2EFNo/E0ZrplyltQoF8ab0z/1
X-Gm-Gg: ASbGnctNig55hw9WbdSxfqACOBM++dwX2Rv7U08PkIR+KOUWLGNJgDaOu4hJ6ADmIBv
 ekeTqwEiukB7bAl2QsBQaaUbRAnC6lV4oQVM4patqy8wV1uSRFDNGHiB4BkZzbhI5o8LvA4aFDj
 hNA6x3ndg8zOsxNb0DEw7Pq5/RX4UnwNnCY9IuiPoV6zG6DEWOtKIS4zluXoTh9zYt9Rq/ZT1VL
 qCCXET31/xG2dNuDtHrtSaXKKX9avfAyogLMI0jYgr4C3Ib8ZpZ42HRcNYaJdt5PQv5YVLQeDi2
 qmTIX2nG8QSeFiyPX5U+FhaZtclNzhhq2T2UDZ6iWxwYYEL0rFV+q+IGnDY8lPrfYtTw+/DmSll
 pZXiMluve3B+EoeHrER6Lzy9Zg8t6QKk=
X-Google-Smtp-Source: AGHT+IFVhSC6OL+aHzP4UlljX/heiemumch2r3K6vBxStW09sbsikfEhG8+kvEM3mf7eRSQiqbICcQ==
X-Received: by 2002:a05:620a:bcc:b0:7c5:3ca5:58fb with SMTP id
 af79cd13be357-7c91415d59emr74272085a.4.1744741079462; 
 Tue, 15 Apr 2025 11:17:59 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c7a8951562sm936825785a.35.2025.04.15.11.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 11:17:58 -0700 (PDT)
Message-ID: <67fea2d6.050a0220.8fa7f.6690@mx.google.com>
X-Google-Original-Message-ID: <Z_6i0yjysPAaySGW@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id D1ACA1200069;
 Tue, 15 Apr 2025 14:17:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 15 Apr 2025 14:17:57 -0400
X-ME-Sender: <xms:1aL-ZzOZ7kkx6oxN54FGRf3pqCp4eRIaxCOhh4pwFwYV8BSAoE68sA>
 <xme:1aL-Z98oNZWbcy7I7imgoURM7wrGUlGwt87cF0JY67yzZVOJoKUl4idcScql3_NDK
 8hqw7iHfzt-5ux_uw>
X-ME-Received: <xmr:1aL-ZyQZT1Fnk6K32y51NUIZVCOSEkXr9XkKDLh3Xn-KlNM2K587N9isrYgX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegudelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnuc
 fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
 vghrnhepgfeiffdvheeiheeuudejgeeuffeiledvvdffvdduteehvdfhiedvffdukeevhf
 ehnecuffhomhgrihhnpehgihhthhhusgdrihhopdhkvghrnhgvlhdrohhrghdpihgushdr
 rghspdhgihhthhhusgdrtghomhdpphhtrhgprghspghpthhrrdhrshenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhht
 phgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqd
 gsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgs
 pghrtghpthhtohepgeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtrghmih
 hrugesghhmrghilhdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpth
 htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgih
 nhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
 gvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdp
 rhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtth
 hopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:1aL-Z3t4V1nrnDRpDe3waAoDcwL-GT2iKdz-e9M1OlfleZb4jENPyA>
 <xmx:1aL-Z7eSJJgAc9FzMJTBxxOc2BlYKIs16ufbEqnCTVnUFBnVzUW3sg>
 <xmx:1aL-Zz1-_Rbwhxszl-I2Fi4Fh-tnnCR2L9c2t2uyyWEL-p59Ujgbaw>
 <xmx:1aL-Z38fM0JFsuSXIKsSdFYK73Z2nyEo2suHLtyJcymmhVEpWDmX0A>
 <xmx:1aL-Z-9P1VFxFc4GoBFdNDkQp0zG9p8sGfilqgSN_7dnXPmKSilVoZy->
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 14:17:57 -0400 (EDT)
Date: Tue, 15 Apr 2025 11:17:55 -0700
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
Subject: Re: [PATCH v8 6/6] rust: enable `clippy::ref_as_ptr` lint
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
 <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
 <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
 <CAJ-ks9mzyfvsxkyud_wLXfhLD_zP95bivCQ9i2aC-3ea=Y7+0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9mzyfvsxkyud_wLXfhLD_zP95bivCQ9i2aC-3ea=Y7+0A@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 01:58:41PM -0400, Tamir Duberstein wrote:
> Hi Boqun, thanks for having a look!
> 
> On Tue, Apr 15, 2025 at 1:37 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Apr 09, 2025 at 10:47:23AM -0400, Tamir Duberstein wrote:
> > > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> > >
> > > > Using `as` casts may result in silently changing mutability or type.
> > >
> > > While this doesn't eliminate unchecked `as` conversions, it makes such
> > > conversions easier to scrutinize.  It also has the slight benefit of
> > > removing a degree of freedom on which to bikeshed. Thus apply the
> > > changes and enable the lint -- no functional change intended.
> > >
> > > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
> > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > ---
> > >  Makefile                 |  1 +
> > >  rust/bindings/lib.rs     |  1 +
> > >  rust/kernel/device_id.rs |  3 ++-
> > >  rust/kernel/fs/file.rs   |  3 ++-
> > >  rust/kernel/str.rs       |  6 ++++--
> > >  rust/kernel/uaccess.rs   | 10 ++++------
> > >  rust/uapi/lib.rs         |  1 +
> > >  7 files changed, 15 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index eb5a942241a2..2a16e02f26db 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
> > >                           -Wclippy::no_mangle_with_rust_abi \
> > >                           -Wclippy::ptr_as_ptr \
> > >                           -Wclippy::ptr_cast_constness \
> > > +                         -Wclippy::ref_as_ptr \
> > >                           -Wclippy::undocumented_unsafe_blocks \
> > >                           -Wclippy::unnecessary_safety_comment \
> > >                           -Wclippy::unnecessary_safety_doc \
> > > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > > index b105a0d899cc..2b69016070c6 100644
> > > --- a/rust/bindings/lib.rs
> > > +++ b/rust/bindings/lib.rs
> > > @@ -27,6 +27,7 @@
> > >  #[allow(dead_code)]
> > >  #[allow(clippy::cast_lossless)]
> > >  #[allow(clippy::ptr_as_ptr)]
> > > +#[allow(clippy::ref_as_ptr)]
> > >  #[allow(clippy::undocumented_unsafe_blocks)]
> > >  mod bindings_raw {
> > >      // Manual definition for blocklisted types.
> > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > index 4063f09d76d9..37cc03d1df4c 100644
> > > --- a/rust/kernel/device_id.rs
> > > +++ b/rust/kernel/device_id.rs
> > > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
> > >      fn as_ptr(&self) -> *const T::RawType {
> > >          // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
> > >          // to access the sentinel.
> > > -        (self as *const Self).cast()
> > > +        let this: *const Self = self;
> >
> > Hmm.. so this lint usually just requires to use a let statement instead
> > of as expression when casting a reference to a pointer? Not 100%
> > convinced this results into better code TBH..
> 
> The rationale is in the lint description and quoted in the commit
> message: "Using `as` casts may result in silently changing mutability
> or type.".
> 

Could you show me how you can silently change the mutability or type? A
simple try like below doesn't compile:

	let x = &42;
	let ptr = x as *mut i32; // <- error
	let another_ptr = x as *const i64; // <- error

also from the link document you shared, looks like the suggestion is to
use core::ptr::from_{ref,mut}(), was this ever considered?

> >
> > > +        this.cast()
> > >      }
> > >
> > >      fn id(&self, index: usize) -> &T::RawType {
> > > diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> > > index 791f493ada10..559a4bfa123f 100644
> > > --- a/rust/kernel/fs/file.rs
> > > +++ b/rust/kernel/fs/file.rs
> > > @@ -359,12 +359,13 @@ impl core::ops::Deref for File {
> > >      type Target = LocalFile;
> > >      #[inline]
> > >      fn deref(&self) -> &LocalFile {
> > > +        let this: *const Self = self;
> > >          // SAFETY: The caller provides a `&File`, and since it is a reference, it must point at a
> > >          // valid file for the desired duration.
> > >          //
> > >          // By the type invariants, there are no `fdget_pos` calls that did not take the
> > >          // `f_pos_lock` mutex.
> > > -        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
> > > +        unsafe { LocalFile::from_raw_file(this.cast()) }
> > >      }
> > >  }
> > >
> > > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > > index 40034f77fc2f..75b4a18c67c4 100644
> > > --- a/rust/kernel/str.rs
> > > +++ b/rust/kernel/str.rs
> > > @@ -28,8 +28,9 @@ pub const fn is_empty(&self) -> bool {
> > >      /// Creates a [`BStr`] from a `[u8]`.
> > >      #[inline]
> > >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> > > +        let bytes: *const [u8] = bytes;
> > >          // SAFETY: `BStr` is transparent to `[u8]`.
> > > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> > > +        unsafe { &*(bytes as *const BStr) }
> >
> >         unsafe { &*(bytes.cast::<BStr>()) }
> >
> > ? I'm curious why this dodged the other lint (ptr_as_ptr).
> 
> The reason it has to be written this way is that BStr is !Sized, and
> `pointer::cast` has an implicit Sized bound.
> 
> Perhaps the lint is smart enough to avoid the suggestion in that case?
> Seems like yes:
> https://github.com/rust-lang/rust-clippy/blob/d3267e9230940757fde2fcb608605bf8dbfd85e1/clippy_lints/src/casts/ptr_as_ptr.rs#L36.
> 

Oh, I see, so fat pointers get their way from this check? Hmm... however
fat pointers also suffer the same problem that ptr_as_ptr prevents,
right? How should we avoid that?

Regards,
Boqun
