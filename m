Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D735A8A5C7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 19:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF510E131;
	Tue, 15 Apr 2025 17:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hpVeitIk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB9110E131
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 17:37:58 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4774d68c670so80773211cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744738678; x=1745343478; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5I/lbzcnm7y9bOrI6tkPsLfvdAUJfIdrSK0G3vlKUTk=;
 b=hpVeitIk0aO6Z1jkiALVWYDfTHDvgP+Dn78sA3cvvQumeWBHHxN+PigqYESTMs++bE
 ltBhLL8LAoRpZVoo9dlu5/6s79erCmz07G3CPamvZTiuRBC06cKQJcKh1rNFAt3umwsr
 dECgXN+0mImE+0r+LzthGtJKXHpf79w2lst/XidDfmYN8WajRZ8Qw6s5v1zv1abBWjAU
 RVMYsoIDg95akfo4p8MKkjcluaG3uOab6NHByLTDGVOKIlOqYH59MI8zvr5qiiOYUhPc
 aD7eKPVODGEZ4CIksKi1dk3+pNvSdwB9GTqaE+OvDuLoaYf5vRHCt0J3TOBdd9kpzuj7
 fT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744738678; x=1745343478;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5I/lbzcnm7y9bOrI6tkPsLfvdAUJfIdrSK0G3vlKUTk=;
 b=jSJhho8p3k8VKDI88bZtpG2BdQ55bAWi/x7UqETALEPvbYwF3JiKp5iP4i7eHdE+Y+
 IVsX/r/rvLq4w6rjpqExG1LnulMvQD9V5PCW60pDGjg3I2sn22ZuIo+KVs00ZWljrkke
 svtGQnKktf9m2xcZBMKwsgVP8Eu8xMjdXvSum1kEMdPthL0FOdYnCqr/q4bU9u9ALEfc
 BjclgtS31igN7YPskJ5+1In0uJw9hP5mA6rOfh1DI5R3HxVayoitC7hZJqiepDFd0KpC
 6HfsgoMFpKynnXRqrg2jZtoMMSLR55mfSts0qN3DilUC1ES2z///loyc3XnHBX6bvuNp
 62kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5/9LrC97NIIpOYvP3Cnw4gnWE6m1dh8DAhXo6IwvpI8/+0FehP0oPP3Fyeu7oy+VfVvBp0FgVu9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoLXcYqd6z1RPncvNPyA7ZloYYayaj3ZCToaZZLhIhCWYp2IiA
 8ohOt5Aos7VAWDxVtD3tA4UFZP3B0dYnKfzM44ZmMxUeqZSP0ztg
X-Gm-Gg: ASbGncuO356w7ltuHs2gJ7CgNsXCNhq/pH3y8fnjRCzmkTt1+lfV59PFKhZv1+HeKXo
 MOcIpIboqCvI0jQJQmDv+kkrZ5Gbajun8qWuaQBpE1JyXo1bVUACPE0gGBLbW9OywWr7oBB28ZT
 stV7MYZGAi0rQ0QiyKE7CRW9DOZHJj/V/KEDOoKK35IyfGGgWaakSd9pn3+C4xFVD3uw4TIoz2d
 7x7PkENCSgOiYdNxtqYSb++8y9kIIzZH0eGgfhDmIJY8dcsFrJuYeyDCe3o6Rs+y/gnkvZ9yDED
 p7ic2pCOKT6+G3wXKvBh0dfFpspdYdGweqP4vzG97XyJvMxY6Rz4K6HUyxQbU7Vr+qEN6AvPCCP
 t6Hgmjik1RXpxVKrTuPCmMMYr0bf30qByqcvwZRLdSg==
X-Google-Smtp-Source: AGHT+IGkR8MSbX5xmugHqgBYEQDFUEijTd9yxoH0ceFRvcd1irCEct2C7eXZLGwLos15lMXOiuq9mw==
X-Received: by 2002:ac8:7d8b:0:b0:476:74de:81e2 with SMTP id
 d75a77b69052e-47ad3af4b38mr2813661cf.43.1744738677912; 
 Tue, 15 Apr 2025 10:37:57 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4796eb0b7f2sm95519271cf.12.2025.04.15.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 10:37:57 -0700 (PDT)
Message-ID: <67fe9975.c80a0220.1b5785.66e7@mx.google.com>
X-Google-Original-Message-ID: <Z_6ZcfB0epuBDEL_@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id 0150E1200043;
 Tue, 15 Apr 2025 13:37:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 15 Apr 2025 13:37:56 -0400
X-ME-Sender: <xms:c5n-Z9mKgZeE_ojYElwvYM3xxvpeBaIhYxw0RP6QdYoeRumuqXnZaw>
 <xme:c5n-Z40w6VrFakDAW2vGECHF9A_fLFnaSSvqn-Hwf1feWmUNfJVZf0k-dIVgsQqBo
 icLyJQUInpjmyhefQ>
X-ME-Received: <xmr:c5n-ZzqyRDZlfKrBN5iuXlXwfkKB4XNghEqZv3rWH5aQk-Y6jmyNz6Wj2myj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegudduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhf
 gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
 rhhnpeehiefhkeeivdeuudfgudelgeduheeijeelvdeigfefudekhfehtdfhkeeukefhtd
 enucffohhmrghinhepghhithhhuhgsrdhiohdpkhgvrhhnvghlrdhorhhgpdhiughsrdgr
 shenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepgeejpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehtrghmihhrugesghhmrghilhdrtghomhdprhgtphhtthhopehmrghsrghhih
 hrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghl
 rdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
 eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
 ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
 hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
 rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:c5n-Z9lqu7HXkmBmjQV8J66e7kuHBLMx_S9deoFCeJIInWPVm_9Jww>
 <xmx:c5n-Z704G_kHJrippeHYtHE3t7nXu0n76dttxp7gn6EcVbkb3481SQ>
 <xmx:c5n-Z8uSszo9xSCC36DLm-KbAlklJGImdUxYbJV7ewgn-wGF_-9yKg>
 <xmx:c5n-Z_VzGST7EmORzHRxIu-QGsRH7tkd4B-9Tcid439OsBqOYhcMoQ>
 <xmx:c5n-Zy1KkaH-nHxBE-qSlCchlhFgCOpOJ9atxzowhjD6zPbJ_9rvNDOV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 13:37:55 -0400 (EDT)
Date: Tue, 15 Apr 2025 10:37:53 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-ptr-as-ptr-v8-6-3738061534ef@gmail.com>
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

On Wed, Apr 09, 2025 at 10:47:23AM -0400, Tamir Duberstein wrote:
> In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> 
> > Using `as` casts may result in silently changing mutability or type.
> 
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  Makefile                 |  1 +
>  rust/bindings/lib.rs     |  1 +
>  rust/kernel/device_id.rs |  3 ++-
>  rust/kernel/fs/file.rs   |  3 ++-
>  rust/kernel/str.rs       |  6 ++++--
>  rust/kernel/uaccess.rs   | 10 ++++------
>  rust/uapi/lib.rs         |  1 +
>  7 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index eb5a942241a2..2a16e02f26db 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -485,6 +485,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wclippy::no_mangle_with_rust_abi \
>  			    -Wclippy::ptr_as_ptr \
>  			    -Wclippy::ptr_cast_constness \
> +			    -Wclippy::ref_as_ptr \
>  			    -Wclippy::undocumented_unsafe_blocks \
>  			    -Wclippy::unnecessary_safety_comment \
>  			    -Wclippy::unnecessary_safety_doc \
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index b105a0d899cc..2b69016070c6 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -27,6 +27,7 @@
>  #[allow(dead_code)]
>  #[allow(clippy::cast_lossless)]
>  #[allow(clippy::ptr_as_ptr)]
> +#[allow(clippy::ref_as_ptr)]
>  #[allow(clippy::undocumented_unsafe_blocks)]
>  mod bindings_raw {
>      // Manual definition for blocklisted types.
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index 4063f09d76d9..37cc03d1df4c 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -136,7 +136,8 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
>      fn as_ptr(&self) -> *const T::RawType {
>          // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
>          // to access the sentinel.
> -        (self as *const Self).cast()
> +        let this: *const Self = self;

Hmm.. so this lint usually just requires to use a let statement instead
of as expression when casting a reference to a pointer? Not 100%
convinced this results into better code TBH..

> +        this.cast()
>      }
>  
>      fn id(&self, index: usize) -> &T::RawType {
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 791f493ada10..559a4bfa123f 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -359,12 +359,13 @@ impl core::ops::Deref for File {
>      type Target = LocalFile;
>      #[inline]
>      fn deref(&self) -> &LocalFile {
> +        let this: *const Self = self;
>          // SAFETY: The caller provides a `&File`, and since it is a reference, it must point at a
>          // valid file for the desired duration.
>          //
>          // By the type invariants, there are no `fdget_pos` calls that did not take the
>          // `f_pos_lock` mutex.
> -        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
> +        unsafe { LocalFile::from_raw_file(this.cast()) }
>      }
>  }
>  
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 40034f77fc2f..75b4a18c67c4 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -28,8 +28,9 @@ pub const fn is_empty(&self) -> bool {
>      /// Creates a [`BStr`] from a `[u8]`.
>      #[inline]
>      pub const fn from_bytes(bytes: &[u8]) -> &Self {
> +        let bytes: *const [u8] = bytes;
>          // SAFETY: `BStr` is transparent to `[u8]`.
> -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> +        unsafe { &*(bytes as *const BStr) }

	unsafe { &*(bytes.cast::<BStr>()) }

? I'm curious why this dodged the other lint (ptr_as_ptr).

>      }
>  
>      /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
> @@ -289,8 +290,9 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
>      /// `NUL` byte (or the string will be truncated).
>      #[inline]
>      pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
> +        let bytes: *mut [u8] = bytes;
>          // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
> -        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
> +        unsafe { &mut *(bytes as *mut CStr) }

Ditto.

>      }
>  
>      /// Returns a C pointer to the string.
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e..7a6fc78fc314 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -240,9 +240,10 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
>      /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
>      /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
>      pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
> +        let out: *mut [u8] = out;
>          // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
>          // `out`.
> -        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
> +        let out = unsafe { &mut *(out as *mut [MaybeUninit<u8>]) };

Ditto.

Regards,
Boqun

>          self.read_raw(out)
>      }
>  
> @@ -348,6 +349,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          if len > self.length {
>              return Err(EFAULT);
>          }
> +        let value: *const T = value;
>          // SAFETY: The reference points to a value of type `T`, so it is valid for reading
>          // `size_of::<T>()` bytes.
>          //
> @@ -355,11 +357,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          // kernel pointer. This mirrors the logic on the C side that skips the check when the length
>          // is a compile-time constant.
>          let res = unsafe {
> -            bindings::_copy_to_user(
> -                self.ptr as *mut c_void,
> -                (value as *const T).cast::<c_void>(),
> -                len,
> -            )
> +            bindings::_copy_to_user(self.ptr as *mut c_void, value.cast::<c_void>(), len)
>          };
>          if res != 0 {
>              return Err(EFAULT);
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index d5dab4dfabec..6230ba48201d 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -16,6 +16,7 @@
>      clippy::all,
>      clippy::cast_lossless,
>      clippy::ptr_as_ptr,
> +    clippy::ref_as_ptr,
>      clippy::undocumented_unsafe_blocks,
>      dead_code,
>      missing_docs,
> 
> -- 
> 2.49.0
> 
> 
