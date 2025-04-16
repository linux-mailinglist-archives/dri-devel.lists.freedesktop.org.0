Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1AA90A72
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D42110E0F2;
	Wed, 16 Apr 2025 17:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNGQ0xwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687110E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:51:19 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7c5b2472969so689870785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744825878; x=1745430678; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pxmabfoSz1UC2/iusFbiOKQsFJLtRsKidKPRh/82Z6c=;
 b=SNGQ0xwR5vSHjbtRpBgJajerR6dNSBjy+rWVtVOoLctFhvzXilpY9+JTwKQnz9lr0p
 Fwb64teg8ghDOKbp86Wezoz9RmbbAMRxByDj/CEkPGyDqfcJ87qZWiualcocPJWdDDlx
 zIunfTh908LSXyl4LbSQGUs8Jpw/ri9yo+FuDQ6O+/3mdGsueDbu6NGCt9ScKKc7Zaqx
 vtrSZhJY0xepfWolqxYvLNC+6uvFDpp4RQvTSL8IozFALuhAptn32SHSR0WccH8Mtp6S
 wf3fyN4AIV8DYJMY67JYBQv31HfscukZNDmpE7cFq3V5VDPOwW3i/3zfM+IcTdGxXMAC
 ubGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744825878; x=1745430678;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pxmabfoSz1UC2/iusFbiOKQsFJLtRsKidKPRh/82Z6c=;
 b=sCzEMPjt7pDOeIftnWNUDtUK0Pc3vN1g9xvBYvfpYBvOmwGS72ofBZjR0lLYowSTYN
 4FAves5i10QsiaDiGqzPb/WeICCvRsSdpx4ZJq1EJQJSd4an+2lWdYoAGy7RDrFG67sS
 PqbIMeGkIAYL9uVlHEnmuDhEWjLtI8N7sLLq700YS+aDKiYNkA7ew5mFXJHy6Eollzbv
 74pWkCSKnp/SwBKPJWB5v7VgMhgIqYUkQFacX8GP2ZXVY7b5Gpr2aThUzA5j59UVlLrp
 fmzqN6MmchT03bDwSic4tH/4Faa2bJnMpLGCGwaFYzsVdrClFFeY0ACyXYy6EaeBhjyi
 uF4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6P7Y3Q+f2+XgPPKc1a5cW6IlnXPcqxKc5TR4k/tiE7ZWIOi6ql2EF9qi7iAM/62ysLYM/HNX4Ed4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj+82Bewy2h0e4G85alA4FZDRmWezt9BZy/moHhDmqxo2Jql6U
 d1l6W8YcNk/SGCwpi1m7luyCR2PHUfYBPM1mnl555RVkH7DIhQQl
X-Gm-Gg: ASbGncvW8ckwuZLLSRFnpy3wxIj3fNLbe43d3q+fqbO3bBQ3SwiroiTF8V0kxKeCE7/
 O8m1EEccCHclF2dqzb6LNjB9QW5uNKAWgAHdjb1FVwbXJFA5orA4YytuG8ZIFDuWty7Ua4/D5ns
 rZsmkRRl207Lw6EtEMbFjXHlNba27Hjv6bMgGDVoYFPnnD99FQAvw08xiUE04EwD0f4fwPPBsKV
 tr4rDKJz+hnc7h9owbyNsEcBlw4XCqvqTvqFF19z+npxOKToanqdr1i5qWQyHfEOXMYSvqf1Bch
 JpQbyAsiO+VEeiIAiyyuRGLjKJKVGQqpMPK2EZa2Esj9t4+maUUCSNZOAj073qmOs9Dw+G8ewaw
 EzcJuKBg8jC/Whr2/kqpnIkiCwRbyFqj5G5YX120Odg==
X-Google-Smtp-Source: AGHT+IGGLUHlF/ro+tSRAKgK3O23q3SFcRGg8/CGpAj8dDvCRn/QTQvePZZIchd3r3e5NNm1hwoSig==
X-Received: by 2002:a05:620a:1909:b0:7c7:ba67:38a with SMTP id
 af79cd13be357-7c918fcb37emr391552185a.6.1744825878397; 
 Wed, 16 Apr 2025 10:51:18 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4796eb2cb57sm113073921cf.46.2025.04.16.10.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:51:18 -0700 (PDT)
Message-ID: <67ffee16.c80a0220.1dbd15.c3ad@mx.google.com>
X-Google-Original-Message-ID: <Z__uE6MgkgJrp-tE@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id DA6A2120006E;
 Wed, 16 Apr 2025 13:51:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 16 Apr 2025 13:51:16 -0400
X-ME-Sender: <xms:FO7_Z2XYN9IYDeB3mtJRUBFSCjtvzgikZeHj79Rfca0h0fKJvYi8hg>
 <xme:FO7_Zyn9QwmorqiltjQibB4rzoRNVlNEUwbnC4RLGfBgkrYjt26xay1t5HvFE99hg
 6B2vcQPz8oWdYKV4g>
X-ME-Received: <xmr:FO7_Z6b4ke6cEb6Jg3ryde6BT_S0ioKeYkl0-Wd_SJ7q9VpzJGit3FAmZ4RDsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejtdduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:FO7_Z9VudysmBmTWm3hZGP8vY_QV8lOGnO5Q5MODAfwanmptAH_Nzg>
 <xmx:FO7_ZwlTDe7WY4QyGQVNPLRex3wgLMTD8vp4toob_epM24Hpl4dWHQ>
 <xmx:FO7_ZycNeS8mHtUr_Ks6My7SIQgHoRidkBnKqmlON6b6gjqRiFP8_w>
 <xmx:FO7_ZyE17Vy68KpuCMbTEzBrE3PONeD4UOz36xOjwG5JsPYJJpZOCQ>
 <xmx:FO7_Z-kR2E_GNlwbZ7igmOLLH3hmWihg4c6wxEbUWsnvqi55tXRhmC8D>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 13:51:16 -0400 (EDT)
Date: Wed, 16 Apr 2025 10:51:15 -0700
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
Subject: Re: [PATCH v9 6/6] rust: enable `clippy::ref_as_ptr` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-6-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-ptr-as-ptr-v9-6-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:10PM -0400, Tamir Duberstein wrote:
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
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

Regards,
Boqun

> ---
>  Makefile                 | 1 +
>  rust/bindings/lib.rs     | 1 +
>  rust/kernel/device_id.rs | 2 +-
>  rust/kernel/fs/file.rs   | 2 +-
>  rust/kernel/str.rs       | 4 ++--
>  rust/kernel/uaccess.rs   | 4 ++--
>  rust/uapi/lib.rs         | 1 +
>  7 files changed, 9 insertions(+), 6 deletions(-)
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
> index 4063f09d76d9..74b5db81231f 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -136,7 +136,7 @@ impl<T: RawDeviceId, U, const N: usize> IdTable<T, U> for IdArray<T, U, N> {
>      fn as_ptr(&self) -> *const T::RawType {
>          // This cannot be `self.ids.as_ptr()`, as the return pointer must have correct provenance
>          // to access the sentinel.
> -        (self as *const Self).cast()
> +        core::ptr::from_ref(self).cast()
>      }
>  
>      fn id(&self, index: usize) -> &T::RawType {
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 791f493ada10..c9a86beacb65 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -364,7 +364,7 @@ fn deref(&self) -> &LocalFile {
>          //
>          // By the type invariants, there are no `fdget_pos` calls that did not take the
>          // `f_pos_lock` mutex.
> -        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) }
> +        unsafe { LocalFile::from_raw_file(core::ptr::from_ref(self).cast()) }
>      }
>  }
>  
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 40034f77fc2f..ca173ae3282d 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
>      #[inline]
>      pub const fn from_bytes(bytes: &[u8]) -> &Self {
>          // SAFETY: `BStr` is transparent to `[u8]`.
> -        unsafe { &*(bytes as *const [u8] as *const BStr) }
> +        unsafe { &*(core::ptr::from_ref(bytes) as *const BStr) }
>      }
>  
>      /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
> @@ -290,7 +290,7 @@ pub const fn from_bytes_with_nul(bytes: &[u8]) -> Result<&Self, CStrConvertError
>      #[inline]
>      pub unsafe fn from_bytes_with_nul_unchecked_mut(bytes: &mut [u8]) -> &mut CStr {
>          // SAFETY: Properties of `bytes` guaranteed by the safety precondition.
> -        unsafe { &mut *(bytes as *mut [u8] as *mut CStr) }
> +        unsafe { &mut *(core::ptr::from_mut(bytes) as *mut CStr) }
>      }
>  
>      /// Returns a C pointer to the string.
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e..5f8e1e7babb3 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -242,7 +242,7 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
>      pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
>          // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
>          // `out`.
> -        let out = unsafe { &mut *(out as *mut [u8] as *mut [MaybeUninit<u8>]) };
> +        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<u8>]) };
>          self.read_raw(out)
>      }
>  
> @@ -357,7 +357,7 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          let res = unsafe {
>              bindings::_copy_to_user(
>                  self.ptr as *mut c_void,
> -                (value as *const T).cast::<c_void>(),
> +                core::ptr::from_ref(value).cast::<c_void>(),
>                  len,
>              )
>          };
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
