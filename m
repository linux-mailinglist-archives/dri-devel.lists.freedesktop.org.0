Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87547A8A999
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EE710E156;
	Tue, 15 Apr 2025 20:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fHb9VT/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3890D10E156
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:51:14 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6f0c30a1cf8so68030236d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744750273; x=1745355073; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0tQ00eLs4Tm633P+iqIgo5YfEEsfyJPoQay6prk03E=;
 b=fHb9VT/F7io+S4djidjo88oFIUDpIz0iTT5U4i7EsqgpbOg8Azh1Ykv+n1EtiTRkVo
 aHbTpLnynWSoow0RlphrhBGRYcqPKp/gvU+MoX9clqSdlNkQB++2t3gpUTHYC7pzNqp6
 JNapfZVBO5kLpIXsPlGKpCIEAdKYtWKnbxbKGGwcQqubFX53CBH37Ac2Q6PiEaURjBII
 0eqjb2MqmuKy2fXItmJB/zx0ZojcatugpQqFqTbjglH4G29d4u+D1CBVLY44ErKPOd1N
 5TdgvKUO2GmX5GXc8/WfdJyGhGuYcRpmj2NyhPem3ChBRbkheHV+9GM64QTuab53Qy6w
 FYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744750273; x=1745355073;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q0tQ00eLs4Tm633P+iqIgo5YfEEsfyJPoQay6prk03E=;
 b=HxXjXSgN60PIaZf/+4DF8sNmxiI0XGMTADvTFBj/xibPJMuCDzQxUwrHxUAKvbgrbt
 D7e7+2ax0RVUhbr2oTerFzPUxu3QrjGFvibnAN9foQDDRjQwGOBFpE9WISG8AexBSYT9
 JW0R8nuvF3AnGg/FGPzaE7r00IhW093weuywwUsODzS23HPo4iyzBeSr1JHRobmqm4Kg
 bpjCMfofd2tgjeoGrwmAYETPeEQ0re1oElne+W3k40eYYtNp1GztaTGeShgrFFEJp/mZ
 nWP610REjkGYjS5JpEmHAznOl6q+Uwz41kqJy7rKGk39pzail43in8SaaPie1HQ+lSO4
 iSug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYNUiizaXBc/xEDu+fi/hlBfhAsklup4wst10zpAVLTFUNCtff9Jx+fWROFTy6LTe/FUtRLrXOac4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqg8WunxEvWAUG+OPcWKJ9N6cAio7FgI/uUpqIXemCgeQyT9Wq
 jpFdsxiEjuKDGYVKr/tUakzLypX5PAHpdm7LKn9oyXCCm9xuSLMV
X-Gm-Gg: ASbGncvfFSfDjEW1bHa7bwv5OTC/hBgQqam1X1Mnhxx8czyS5tKehjng0JzYXuGkPs6
 RZhPCsZyW8Vf14urkYNzyMGY5HXpCgGKz3Qy5HoS5a/u8BXr26/qF6eICq4T3heftpTpkl/Z/Rp
 20z9aOHicclznerqAdYF5o6bm5udG+OyeEPBAUQBv6iq5t+mL9ov08cZ3uzPk9RawKiKexeTZhR
 8VCdtiwN3CIK+15Ht08yv2+DCjfkufycoaGrzftZQJ0OKxobhsRc9Fzx2EyC2PKIa7l4+UFl7eX
 KHnCIJzDB6yvbfHGjZkfft5w7t1l/sQHDwvhcfIMAefNqZ3BTwRLXRXXBNoVwaSabRqVaO4Ne8F
 LR3mCNclWDYam4BU0J67LdC46/A6QjMk=
X-Google-Smtp-Source: AGHT+IE1dCcR96vlLkQXzQT/eFHlRGeTTVVl5g6zbx9Rg8qrLjTfCEPFy9rO4Jl8bAnKBfMwWo/c5A==
X-Received: by 2002:a05:6214:238b:b0:6e8:fc05:aa23 with SMTP id
 6a1803df08f44-6f2ad849efamr13993126d6.3.1744750273501; 
 Tue, 15 Apr 2025 13:51:13 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f29427ede1sm54651296d6.68.2025.04.15.13.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 13:51:13 -0700 (PDT)
Message-ID: <67fec6c1.0c0a0220.f907e.c6dd@mx.google.com>
X-Google-Original-Message-ID: <Z_7GvFc4nNc6CflX@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id D6518120006A;
 Tue, 15 Apr 2025 16:51:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 15 Apr 2025 16:51:11 -0400
X-ME-Sender: <xms:v8b-ZwSpeeMWS-AgOReIxu212BJqnnL3IWn6oRc050tdsemAyDXCsA>
 <xme:v8b-Z9yqTLhPtZwgT79r-lFQ8w4fAPKNhnQ5ppgRXAIXlxCed2Vy6S8qJoEFEgYwj
 LsJjbfV3DXCkOIZRg>
X-ME-Received: <xmr:v8b-Z92_VpxSpx99qWuk85VVZBAhwkzOia9W81q9OF1Vo5CszxM9W2DEs3k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeggeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnuc
 fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
 vghrnhephffgheetjeegieduheelieeujefhgfegtdefgedtteejveetjeeugfehueekff
 ejnecuffhomhgrihhnpehgihhthhhusgdrihhopdhkvghrnhgvlhdrohhrghdpihgushdr
 rghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeegjedpmhhouggvpehsmhhtphhouhhtpdhr
 tghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrshgrhh
 hirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhih
 sehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtoh
 hnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothho
 nhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:v8b-Z0Cr70trTNBX-anqf51yRU3N8WDn8qOJFNRvZ7lpdqHPkC3FNQ>
 <xmx:v8b-Z5guK0RN-dfE70nWF85kSlzQ4S0XYzF6b7nKdlvnAyY_QcfmXw>
 <xmx:v8b-ZwoDRhdajbxAMI6eokapqoCceE19AubRD3dPMzWsRwZl7QHAbQ>
 <xmx:v8b-Z8jYX7sLlzb_GxXi6MUD9MEewlysZn-977joyUwMeTpZadBETQ>
 <xmx:v8b-ZwTKozWWpgzl1E2O9D5hLYHTSeM3J9b0S-ksk4pMmJ3RLiaZgxpO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 16:51:11 -0400 (EDT)
Date: Tue, 15 Apr 2025 13:51:08 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9=G1ajyT8gwLHyvHW09Z2gG=Geg7LDS6iyRyqx_wyp5Sg@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 04:10:01PM -0400, Tamir Duberstein wrote:
> On Tue, Apr 15, 2025 at 2:18 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Tue, Apr 15, 2025 at 01:58:41PM -0400, Tamir Duberstein wrote:
> > > Hi Boqun, thanks for having a look!
> > >
> > > On Tue, Apr 15, 2025 at 1:37 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> > > >
> > > > On Wed, Apr 09, 2025 at 10:47:23AM -0400, Tamir Duberstein wrote:
> > > > > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> > > > >
> > > > > > Using `as` casts may result in silently changing mutability or type.
> > > > >
> > > > > While this doesn't eliminate unchecked `as` conversions, it makes such
> > > > > conversions easier to scrutinize.  It also has the slight benefit of
> > > > > removing a degree of freedom on which to bikeshed. Thus apply the
> > > > > changes and enable the lint -- no functional change intended.
> > > > >
> > > > > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
> > > > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > > > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> > > > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > > > ---
> > > > >  Makefile                 |  1 +
> > > > >  rust/bindings/lib.rs     |  1 +
> > > > >  rust/kernel/device_id.rs |  3 ++-
> > > > >  rust/kernel/fs/file.rs   |  3 ++-
> > > > >  rust/kernel/str.rs       |  6 ++++--
> > > > >  rust/kernel/uaccess.rs   | 10 ++++------
> > > > >  rust/uapi/lib.rs         |  1 +
> > > > >  7 files changed, 15 insertions(+), 10 deletions(-)
> > > > >
> > > > > diff --git a/Makefile b/Makefile
> > > > > index eb5a942241a2..2a16e02f26db 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
> > > > >                           -Wclippy::no_mangle_with_rust_abi \
> > > > >                           -Wclippy::ptr_as_ptr \
> > > > >                           -Wclippy::ptr_cast_constness \
> > > > > +                         -Wclippy::ref_as_ptr \
> > > > >                           -Wclippy::undocumented_unsafe_blocks \
> > > > >                           -Wclippy::unnecessary_safety_comment \
> > > > >                           -Wclippy::unnecessary_safety_doc \
> > > > > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > > > > index b105a0d899cc..2b69016070c6 100644
> > > > > --- a/rust/bindings/lib.rs
> > > > > +++ b/rust/bindings/lib.rs
> > > > > @@ -27,6 +27,7 @@
> > > > >  #[allow(dead_code)]
> > > > >  #[allow(clippy::cast_lossless)]
> > > > >  #[allow(clippy::ptr_as_ptr)]
> > > > > +#[allow(clippy::ref_as_ptr)]
> > > > >  #[allow(clippy::undocumented_unsafe_blocks)]
> > > > >  mod bindings_raw {
> > > > >      // Manual definition for blocklisted types.
> > > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > > > index 4063f09d76d9..37cc03d1df4c 100644
> > > > > --- a/rust/kernel/device_id.rs
> > > > > +++ b/rust/kernel/device_id.rs
> > > > > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
> > > > >      fn as_ptr(&self) -> *const T::RawType {
> > > > >          // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
> > > > >          // to access the sentinel.
> > > > > -        (self as *const Self).cast()
> > > > > +        let this: *const Self = self;
> > > >
> > > > Hmm.. so this lint usually just requires to use a let statement instead
> > > > of as expression when casting a reference to a pointer? Not 100%
> > > > convinced this results into better code TBH..
> > >
> > > The rationale is in the lint description and quoted in the commit
> > > message: "Using `as` casts may result in silently changing mutability
> > > or type.".
> > >
> >
> > Could you show me how you can silently change the mutability or type? A
> > simple try like below doesn't compile:
> >
> >         let x = &42;
> >         let ptr = x as *mut i32; // <- error
> >         let another_ptr = x as *const i64; // <- error
> 
> I think the point is that the meaning of an `as` cast can change when
> the type of `x` changes, which can happen at a distance. The example

So my example shows that you can only use `as` to convert a `&T` into a
`*const T`, no matter how far it happens, and..

> shown in the clippy docs uses `as _`, which is where you get into real
> trouble.
> 

... no matter whether `as _` is used or not. Of course once you have a
`*const T`, using `as` can change it to a different type or mutability,
but that's a different problem. Your argument still lacks convincing
evidences or examples showing this is a real trouble. For example, if
you have a `x` of type `&i32`, and do a `x as _` somewhere, you will
have a compiler error once compilers infers a type that is not `*const
i32` for `_`. If your argument being it's better do the
reference-to-pointer conversion explicitly, then that makes some sense,
but I still don't think we need to do it globablly.

> > also from the link document you shared, looks like the suggestion is to
> > use core::ptr::from_{ref,mut}(), was this ever considered?
> 
> I considered it, but I thought it was ugly. We don't have a linter to
> enforce it, so I'd be surprised if people reached for it.
> 

I think avoiding the extra line of `let` is a win, also I don't get why
you feel it's *ugly*: having the extra `let` line is ugly to me ;-)

Regards,
Boqun

[...]
