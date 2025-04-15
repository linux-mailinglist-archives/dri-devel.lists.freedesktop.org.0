Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0906A8ABBB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 01:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05D710E08D;
	Tue, 15 Apr 2025 23:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PZxgoVWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54E10E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 23:03:06 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c5aecec8f3so923285485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744758186; x=1745362986; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q21DKRIHxJEvdt+r1VLoxzAfD1ZQ4fXtiMyb7UHuaZI=;
 b=PZxgoVWvoM9AAggWH0/MrTalaAdT+WI0Iapa5itNMRuFCRaa6bkB39dyqoh6TuJ9Hz
 FC0VB/aHXFULeEF0wMtXGpwomL7Njvb5xQnh6tmTcQLBBH9o306WZtzKfwhuMit06T9l
 pqL+iyWkYufnG0LAPUtO+Cd6JH6sSLNYTehFd6862AOXVhuQuLKyZv0tjdReaFUnO51h
 NMNG+71V+vzep9nZUKSatw4oHfmS2FTSG8eb0gJxaWzqA3VJrqyREQnj8QyQDdnoFoo/
 fFBV0eUo4LZFIQYiVMqNXNm9SMX7o1LhSE2VGCqpciRlPVllCnp5a1iA3a1XT7tWYjEC
 sKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744758186; x=1745362986;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q21DKRIHxJEvdt+r1VLoxzAfD1ZQ4fXtiMyb7UHuaZI=;
 b=Va4TfPNU5gOSElyBazq+VxKV59tVSqOoExCVQSZYCOJ2rEk3+mcTEXCMVFBRj8iItL
 dv6+Ae9BvPNsZj5wcw7+aRYIVPig9fI3quZsTmfjI1Ms15B0ulEYp4w+cTrXNxtuOXJp
 1UvWesv0y93YLueLQjq//f70pFMHng+pzuEWchKRBOSuja/ws5qT+LISZ9GKWrpsVw9D
 fbOkafIbnLbpfuebG/eyNjonv4gG7ZUnwmbu3lsEAktMZtW94fb5gaLLCiFZrPVZ8YQ6
 ShW+VCzK3EV17xYUUyJr3Z6hmIwDaQQQ056wkSWx2o/uvSwUFzOyuvKg4MzF+uK+Tv+5
 ZdZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFOHpdCiY2aFogl2CLylZiILSmwbVGaAH+Kamr7HdyrxK5emRfEQnVm1xh815U+ne9CXfldbArJe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz727ety05ZaIWi/MfVBUL7a75FDKFp7SI5oeDhGB2gp3O+bvow
 2FHwSKoPu9os9YJSUqe2DjdYr4JYb24682HFr/l42BfQuqAl48o8
X-Gm-Gg: ASbGncvhMaCDu4KNmqML9UfEpEBqVeli3pSJQ+prTCR4tprzn4aPOCkERBjWS60SKYB
 qMHxyCAmzRxURdq7VEk49hvXB+h3qpEkDjc8fOTpQF0F+9Tjq5B/ax/D9VY7Ip3snfggwYbgd1Y
 FrClCoW0JUiiJaV4ns63/AhIA59AoqO/qPBEYuDWZi/vXhv6CM4z00Uvk1KBxzqDfMk6llW6A4F
 8rxDFL011Nk3PKmESL6JgfylsvW70mNxPcQHvx6WB8WOc0wVZI51z9mSwVfY7GM6RfllYgWENw1
 6IMnNvVKAyQSHnUvPJD45rfeBQKjUtq0YXHcv5v8/FE3kGVSqaYECMu2B/X+LLHQUOsS4+JclBQ
 mTRLYCGgArSFoX7IdRA5pPwJcnoknUu0=
X-Google-Smtp-Source: AGHT+IFD/29vIxMjxOFxQ8BkiE/LEbZtqORNAZrDSp4aJ594XboCIC4xgBiV7FVPqr3EbX3zcQVpqw==
X-Received: by 2002:a05:620a:459f:b0:7c5:4c6d:7fa5 with SMTP id
 af79cd13be357-7c91428098amr221292185a.48.1744758185614; 
 Tue, 15 Apr 2025 16:03:05 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c7a896a708sm969451385a.58.2025.04.15.16.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 16:03:05 -0700 (PDT)
Message-ID: <67fee5a9.050a0220.25fe78.76d2@mx.google.com>
X-Google-Original-Message-ID: <Z_7lpfy3H74dI1Ad@winterfell.>
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfauth.phl.internal (Postfix) with ESMTP id C4F0F1200043;
 Tue, 15 Apr 2025 19:03:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 15 Apr 2025 19:03:03 -0400
X-ME-Sender: <xms:p-X-Zz3WUcQHo5SPerJTk_Pdw6EezJuTH-lYjWN5uKuxBZn4sbkqSQ>
 <xme:p-X-ZyEihct8Y5-jYRn-hwKhJNfUEQet1OPd2N-am8r60UUrmWLlmSgr1LcjP_tKs
 b9VG5Lbohie4BDeIg>
X-ME-Received: <xmr:p-X-Zz6GJVAyNj9lTiZEOMLtdkuSmnFOQWBwbEVDi79-oJdfu-HslPmbdD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegjeeiucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudejhfekieevvddvgeehhfdutdeggfel
 gedugfejhffggeelkeeuffdthfetgeenucffohhmrghinhepihgushdrrghspdhkvghrnh
 gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvge
 ehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhm
 sehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepgeejpdhmohguvgepshhmthhpoh
 huthdprhgtphhtthhopehtrghmihhrugesghhmrghilhdrtghomhdprhgtphhtthhopehm
 rghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskh
 gvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
 tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
 hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehp
 rhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesph
 hrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdho
 rhhg
X-ME-Proxy: <xmx:p-X-Z41IoaAkSc3EBgjWc6FXL709swaRQ4uUE1JmJ7uwRMFyWIM8qw>
 <xmx:p-X-Z2FWGrBqGBVjFOLFXxauA-nSn0cOk80DjxXcxIfFi4pNOTsFBw>
 <xmx:p-X-Z5-JJOXIKKn2Ask5SGKUS8sj6aH_plq-OmVqa5Dc4Y2gCsioRQ>
 <xmx:p-X-ZzkEZZfroB1PnsAsuNes8k_rpPpUslzDA-16Zho9eYd0LiRujQ>
 <xmx:p-X-ZyHPCpMV7Nst1ncTZ1st-JDeh20IBOZOttD2KMdbEi0SFLxqXbnu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 19:03:02 -0400 (EDT)
Date: Tue, 15 Apr 2025 16:03:01 -0700
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
 <67fea2d6.050a0220.8fa7f.6690@mx.google.com>
 <CAJ-ks9=G1ajyT8gwLHyvHW09Z2gG=Geg7LDS6iyRyqx_wyp5Sg@mail.gmail.com>
 <67fec6c1.0c0a0220.f907e.c6dd@mx.google.com>
 <CAJ-ks9mZ4qqRwQTWyGYgPy9kf3=od=zbvX67ELVgctU0t6qHuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9mZ4qqRwQTWyGYgPy9kf3=od=zbvX67ELVgctU0t6qHuQ@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 04:59:01PM -0400, Tamir Duberstein wrote:
[...]
> > > > > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > > > > > index 4063f09d76d9..37cc03d1df4c 100644
> > > > > > > --- a/rust/kernel/device_id.rs
> > > > > > > +++ b/rust/kernel/device_id.rs
> > > > > > > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
> > > > > > >      fn as_ptr(&self) -> *const T::RawType {
> > > > > > >          // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
> > > > > > >          // to access the sentinel.
> > > > > > > -        (self as *const Self).cast()
> > > > > > > +        let this: *const Self = self;
> > > > > >
> > > > > > Hmm.. so this lint usually just requires to use a let statement instead
> > > > > > of as expression when casting a reference to a pointer? Not 100%
> > > > > > convinced this results into better code TBH..
> > > > >
> > > > > The rationale is in the lint description and quoted in the commit
> > > > > message: "Using `as` casts may result in silently changing mutability
> > > > > or type.".
> > > > >
> > > >
> > > > Could you show me how you can silently change the mutability or type? A
> > > > simple try like below doesn't compile:
> > > >
> > > >         let x = &42;
> > > >         let ptr = x as *mut i32; // <- error
> > > >         let another_ptr = x as *const i64; // <- error
> > >
> > > I think the point is that the meaning of an `as` cast can change when
> > > the type of `x` changes, which can happen at a distance. The example
> >
> > So my example shows that you can only use `as` to convert a `&T` into a
> > `*const T`, no matter how far it happens, and..
> 
> I don't think you're engaging with the point I'm making here. Suppose
> the type is `&mut T` initially and `as _` is being used to convert it
> to `*mut T`; now if the type of `&mut T` changes to `*const T`, you have
> completely different semantics.
> 

You're right, I had some misunderstanding, the "`_`" part of `as _`
seems to be a red herring, the problematic code snippet you meant can be
shown as (without a `as _`):

	f(x as *mut T); // f() takes a `*mut T`.

where it compiles with `x` being either a `&mut T` or `*const T`, and
`as` has different meanings in these cases.

> >
> > > shown in the clippy docs uses `as _`, which is where you get into real
> > > trouble.
> > >
> >
> > ... no matter whether `as _` is used or not. Of course once you have a
> > `*const T`, using `as` can change it to a different type or mutability,
> > but that's a different problem. Your argument still lacks convincing
> > evidences or examples showing this is a real trouble. For example, if
> > you have a `x` of type `&i32`, and do a `x as _` somewhere, you will
> > have a compiler error once compilers infers a type that is not `*const
> > i32` for `_`. If your argument being it's better do the
> > reference-to-pointer conversion explicitly, then that makes some sense,
> > but I still don't think we need to do it globablly.
> 
> Can you help me understand what it is I need to convince you of? There
> was prior discussion in
> https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/,
> where it was suggested to use this lint.
> 
> I suppose in any discussion of a chance, we should also enumerate the
> costs -- you're taking the position that the status quo is preferable,
> yes? Can you help me understand why?
> 

In this case the status quo is not having the lint, which allows users
to convert a raw pointer from a reference with `as`. What you proposed
in patch is to do the conversion with a stand-alone let statement, and
that IMO doesn't suit all the cases: we are dealing with C code a lot,
that means dealing raw pointers a lot, it's handy and logically tight if
we have an expression that converts a Rust location into a raw pointer.
And forcing let statements every time is not really reasonble because of
this.

Also I didn't get the problematic code the lint can prevent as well
until very recent discussion in this thread.

I would not say the status quo is preferable, more like your changes in
this patch complicate some simple patterns which are reasonable to me.
And it's also weird that we use a lint but don't use its suggestion.

So in short, I'm not against this lint, but if we only use let-statement
resolution, I need to understand why and as you said, we need to
evaluate the cost.

> >
> > > > also from the link document you shared, looks like the suggestion is to
> > > > use core::ptr::from_{ref,mut}(), was this ever considered?
> > >
> > > I considered it, but I thought it was ugly. We don't have a linter to
> > > enforce it, so I'd be surprised if people reached for it.
> > >
> >
> > I think avoiding the extra line of `let` is a win, also I don't get why
> > you feel it's *ugly*: having the extra `let` line is ugly to me ;-)
> 
> I admit it's subjective, so I'm happy to change it. But I've never
> seen that syntax used, and we lack enforcement for either one, so I
> don't find much value in arguing over this.
> 

If the original code use "as" for conversion purposes, I think it's good
to be consistent and using from_ref() or from_mut(): they are just
bullet-proof version of conversions, and having a separate let statement
looks like a distraction to me. If for new code, and the author has a
reason for let statement, then it's fine.

Regards,
Boqun
