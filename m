Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9ACA8A8E8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 22:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4136410E13B;
	Tue, 15 Apr 2025 20:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OPiny7H+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1C710E13B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 20:10:39 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bee278c2aso473061fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744747838; x=1745352638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHELFzxVVmsy2zgSKA6PLaix5nlp2CFpgVoQsmmD40s=;
 b=OPiny7H+4gImLG2Qc9JwheY4IJuaoTvs7mrJVjd5Tpi80Fy6r3m0rAypLadIS/6cDk
 ZobjxKNtPOc20idElrgiFvs7Jis0FvFOpwxBFGHhisFnQH6YVt3lz2X312xK356ayXYA
 K/QnUDuVtB5tYpWbYf+UpCyQ6rFrIQtpBOOHtZTBhDbFWNXk1rFEr1VHifou3Dtqrjcl
 B28p9+gBjqkaGuSvk2dxM5ikKr5QG8lj0YbCYUdr2N1TVrbCuKU/4oVpLxaZ0sx9xKa8
 WwZizUZoT9nm81dV2ppAkDmzNjS6kuiyc9PH3Lb6flD6QJ5NaCvKxEX2kkQBKl1aPF8k
 J9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744747838; x=1745352638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHELFzxVVmsy2zgSKA6PLaix5nlp2CFpgVoQsmmD40s=;
 b=syZwqK1Eu0RsbvCyDsu4D0zSRAeIcT82Gna9QGow1uwZ15z2gGYgYvoyasnrvZKRA5
 pSiCmc9/GWvtMZ3lRdqzebmD83xqz8k1uEkNM04Lzjg3IDzWFqzOUiZr1c7aiKDYYVko
 kKLXdo5QkCa+uVCreTU4/MTjKIjL0WsKN3BEDNoj5GJC/+qnWZeeuOB9rlmtPyqF8HT1
 JsqDKbm17O3BmJcRYDfekzNi6CYmvAtzQRbQ06Bh6jzGWmeO0LdwYKemLFhrChT32GLn
 66zFPYb1S4v5yM6+y/ELsSIiS3aF5du7GAScZ/8WXRDiM7hYZax7IRDoKKyoO7au8Kv4
 JZiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyVFV7n/e7aHMVWTsNc8Q4/lQk5k10FNP7Sz0q50wsYKNTAbZiY8XGBQ6aOJLLb7vLR7itLp5W3/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOKdCLP8gvNbTnJ5+CO6gbSvhB16H6D+BvSUWj6Qs5Hbq8QwCi
 fw+UMizQpv4Yd72bs4en51741pH5RvDXCnH4UAsw0ohGra2wLAh5lbEsJEmKptZl5XYnqOAfRHA
 0onZ+Pg7wSzQW7tDSjBs088SXoQI=
X-Gm-Gg: ASbGncu6qesyNeAysfx/3nQQ2oJh9L9vEk2eWcBk+oYuGr2+l6KFj6i5Z2UiLvBMEye
 xaQsAF62oVY4mMASfaUdpmlgcgi6jVdCQtn8DL9JsgOBwYE2u88LlDD4PborYdRuOSdLqV2bJGl
 6vMF7/GnQapu9baHhVGu8oCwTUSp6vWhNtCwEeDg==
X-Google-Smtp-Source: AGHT+IHHpITksB955oQm5ARBuGAcVFAjDyvUs2PTCTEghg3Tq3v8kUReDzyNimxph/3Sw67RckF5NDVyJKnzu5cOggg=
X-Received: by 2002:a2e:e09:0:b0:30b:9f7b:c186 with SMTP id
 38308e7fff4ca-31071be6a50mr16553061fa.1.1744747837350; Tue, 15 Apr 2025
 13:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250409-ptr-as-ptr-v8-0-3738061534ef@gmail.com>
 <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
 <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
 <CAJ-ks9mzyfvsxkyud_wLXfhLD_zP95bivCQ9i2aC-3ea=Y7+0A@mail.gmail.com>
 <67fea2d6.050a0220.8fa7f.6690@mx.google.com>
In-Reply-To: <67fea2d6.050a0220.8fa7f.6690@mx.google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Apr 2025 16:10:01 -0400
X-Gm-Features: ATxdqUH2AXGR5D179vLUcxKCqAiKWiqv74mYwXiMQpvC31RtT7QM1E9QIgjYVQU
Message-ID: <CAJ-ks9=G1ajyT8gwLHyvHW09Z2gG=Geg7LDS6iyRyqx_wyp5Sg@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] rust: enable `clippy::ref_as_ptr` lint
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

On Tue, Apr 15, 2025 at 2:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Tue, Apr 15, 2025 at 01:58:41PM -0400, Tamir Duberstein wrote:
> > Hi Boqun, thanks for having a look!
> >
> > On Tue, Apr 15, 2025 at 1:37=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Wed, Apr 09, 2025 at 10:47:23AM -0400, Tamir Duberstein wrote:
> > > > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> > > >
> > > > > Using `as` casts may result in silently changing mutability or ty=
pe.
> > > >
> > > > While this doesn't eliminate unchecked `as` conversions, it makes s=
uch
> > > > conversions easier to scrutinize.  It also has the slight benefit o=
f
> > > > removing a degree of freedom on which to bikeshed. Thus apply the
> > > > changes and enable the lint -- no functional change intended.
> > > >
> > > > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref=
_as_ptr [1]
> > > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton=
.me/
> > > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > > > ---
> > > >  Makefile                 |  1 +
> > > >  rust/bindings/lib.rs     |  1 +
> > > >  rust/kernel/device_id.rs |  3 ++-
> > > >  rust/kernel/fs/file.rs   |  3 ++-
> > > >  rust/kernel/str.rs       |  6 ++++--
> > > >  rust/kernel/uaccess.rs   | 10 ++++------
> > > >  rust/uapi/lib.rs         |  1 +
> > > >  7 files changed, 15 insertions(+), 10 deletions(-)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index eb5a942241a2..2a16e02f26db 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -485,6 +485,7 @@ export rust_common_flags :=3D --edition=3D2021 =
\
> > > >                           -Wclippy::no_mangle_with_rust_abi \
> > > >                           -Wclippy::ptr_as_ptr \
> > > >                           -Wclippy::ptr_cast_constness \
> > > > +                         -Wclippy::ref_as_ptr \
> > > >                           -Wclippy::undocumented_unsafe_blocks \
> > > >                           -Wclippy::unnecessary_safety_comment \
> > > >                           -Wclippy::unnecessary_safety_doc \
> > > > diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> > > > index b105a0d899cc..2b69016070c6 100644
> > > > --- a/rust/bindings/lib.rs
> > > > +++ b/rust/bindings/lib.rs
> > > > @@ -27,6 +27,7 @@
> > > >  #[allow(dead_code)]
> > > >  #[allow(clippy::cast_lossless)]
> > > >  #[allow(clippy::ptr_as_ptr)]
> > > > +#[allow(clippy::ref_as_ptr)]
> > > >  #[allow(clippy::undocumented_unsafe_blocks)]
> > > >  mod bindings_raw {
> > > >      // Manual definition for blocklisted types.
> > > > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > > > index 4063f09d76d9..37cc03d1df4c 100644
> > > > --- a/rust/kernel/device_id.rs
> > > > +++ b/rust/kernel/device_id.rs
> > > > @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable=
<T, U> for IdArray<T, U, N> {
> > > >      fn as_ptr(&self) -> *const T::RawType {
> > > >          // This cannot be `self.ids.as_ptr()`, as the return point=
er must have correct provenance
> > > >          // to access the sentinel.
> > > > -        (self as *const Self).cast()
> > > > +        let this: *const Self =3D self;
> > >
> > > Hmm.. so this lint usually just requires to use a let statement inste=
ad
> > > of as expression when casting a reference to a pointer? Not 100%
> > > convinced this results into better code TBH..
> >
> > The rationale is in the lint description and quoted in the commit
> > message: "Using `as` casts may result in silently changing mutability
> > or type.".
> >
>
> Could you show me how you can silently change the mutability or type? A
> simple try like below doesn't compile:
>
>         let x =3D &42;
>         let ptr =3D x as *mut i32; // <- error
>         let another_ptr =3D x as *const i64; // <- error

I think the point is that the meaning of an `as` cast can change when
the type of `x` changes, which can happen at a distance. The example
shown in the clippy docs uses `as _`, which is where you get into real
trouble.

> also from the link document you shared, looks like the suggestion is to
> use core::ptr::from_{ref,mut}(), was this ever considered?

I considered it, but I thought it was ugly. We don't have a linter to
enforce it, so I'd be surprised if people reached for it.

>
> > >
> > > > +        this.cast()
> > > >      }
> > > >
> > > >      fn id(&self, index: usize) -> &T::RawType {
> > > > diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> > > > index 791f493ada10..559a4bfa123f 100644
> > > > --- a/rust/kernel/fs/file.rs
> > > > +++ b/rust/kernel/fs/file.rs
> > > > @@ -359,12 +359,13 @@ impl core::ops::Deref for File {
> > > >      type Target =3D LocalFile;
> > > >      #[inline]
> > > >      fn deref(&self) -> &LocalFile {
> > > > +        let this: *const Self =3D self;
> > > >          // SAFETY: The caller provides a `&File`, and since it is =
a reference, it must point at a
> > > >          // valid file for the desired duration.
> > > >          //
> > > >          // By the type invariants, there are no `fdget_pos` calls =
that did not take the
> > > >          // `f_pos_lock` mutex.
> > > > -        unsafe { LocalFile::from_raw_file((self as *const Self).ca=
st()) }
> > > > +        unsafe { LocalFile::from_raw_file(this.cast()) }
> > > >      }
> > > >  }
> > > >
> > > > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > > > index 40034f77fc2f..75b4a18c67c4 100644
> > > > --- a/rust/kernel/str.rs
> > > > +++ b/rust/kernel/str.rs
> > > > @@ -28,8 +28,9 @@ pub const fn is_empty(&self) -> bool {
> > > >      /// Creates a [`BStr`] from a `[u8]`.
> > > >      #[inline]
> > > >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> > > > +        let bytes: *const [u8] =3D bytes;
> > > >          // SAFETY: `BStr` is transparent to `[u8]`.
> > > > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> > > > +        unsafe { &*(bytes as *const BStr) }
> > >
> > >         unsafe { &*(bytes.cast::<BStr>()) }
> > >
> > > ? I'm curious why this dodged the other lint (ptr_as_ptr).
> >
> > The reason it has to be written this way is that BStr is !Sized, and
> > `pointer::cast` has an implicit Sized bound.
> >
> > Perhaps the lint is smart enough to avoid the suggestion in that case?
> > Seems like yes:
> > https://github.com/rust-lang/rust-clippy/blob/d3267e9230940757fde2fcb60=
8605bf8dbfd85e1/clippy_lints/src/casts/ptr_as_ptr.rs#L36.
> >
>
> Oh, I see, so fat pointers get their way from this check? Hmm... however
> fat pointers also suffer the same problem that ptr_as_ptr prevents,
> right? How should we avoid that?

Probably the proper solution is to remove the `Sized` bound from
`pointer::cast`. Short of that, I'm not sure how -- but I don't think
this deficiency should prevent us from the benefits of this change,
even if they are a bit limited.
