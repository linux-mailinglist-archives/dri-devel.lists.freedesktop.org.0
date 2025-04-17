Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609FAA92402
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBB210E201;
	Thu, 17 Apr 2025 17:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="goWeqtHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62E710E201
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:29:12 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6ed0cc5eca4so22069896d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744910952; x=1745515752; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=pSQ1spRHIDXyTBieqdfcsIAEuIswLKlLRhvaKNh6hmQ=;
 b=goWeqtHr6rSagYfon75oWSc8bzmgyFKg+GJfe+zUDRz1x2IGx6asPX7aAmpXgCt3gv
 DOevtlQ/GApMPE7eIMfIImpXCqT/A7cf/7/z79s1JrmvjxoFu1NY38oSFRkgNFw5J6lR
 SvYr59TzN4fKvUugLEasDMXWJtM4fUwPSJNmluQRdmPqxpEl+WQEnL7CTqmYQs1mPMrJ
 jIdRLOyEdQ14oS8mq4g4Nm2L2qd7m4nKWbLjJK9nqWrm5/EGIv5UC01WShZ6hfqkjofP
 zNmEWRBZkARJH5vDkIQcU2/bNKUGSDCYc/kaDuPN/2HR/C9ckB2sUvlLj141EtTgSn6H
 9htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744910952; x=1745515752;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSQ1spRHIDXyTBieqdfcsIAEuIswLKlLRhvaKNh6hmQ=;
 b=oXXEchLLQYFLyGEBZ28uWfo0q2BmudoXxuqC1BTpdd3deVV7+G7kSqqiIYzH++M2Vw
 wnbMxDexdUExZVR+ez2LkEHIuKQunOYcsLvOR37D/O3hDtrvMgvWUPKWMKN5B58JaFPq
 L1CUteIZjPRgZ+YqUuibYD5SV/2sa0FNzJA6mwzYRO7mmc3kf5CUNsegqxpijt5j+s92
 WwEHr/qnmViL9NpEL0dD1RthHZwlE6McaGeLKHOWZ3PljtyFwSRtVcCxi6f7QGluAliC
 p43IqF9H11SepHE597MKXq6MC6TyPljNBpNj7Pe3EKnrkE6ndeHhhMgHV0+ciopTHFYu
 +kdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYJaABkZitivKPEuEB49Jrgb+vqm2Oeok3QNRoO2d8lOPN/UvI8xMQclq5Ku7doyC+dG/WLp7/ooI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJjOeZuA+FYeZCH+5H+BjPla55X1ZQRsg7H5qp62K0XRT6C5fF
 iCTcVIH+L+91gkhjgjEOWNrK+D3qN0awiX3tyBLQT26051T5eWni
X-Gm-Gg: ASbGncsE/LI0fNIurXpEbKhxU/3CY45fa5VRGAUjxRWrD36u86I2ZHKpUXaAdDgsthK
 /qDPPYPNFplD4dZTKg2Z05DGBjBQbZ+yRFDwyZUMxIrFtLSAZuhIe2CV8Lj/F1lyeY6mjmyM6mM
 yV9BRYdflkEy4Duq/ow3xNOZdoeKQGRg28viCmtuZFMNGr8u/sLyVPWgLpMoDfcRNlDGNADtHZb
 ZDWOghn0OtVE0qAp8PhdGie5nYZ/OHsr0pPysfCZ1j/T9jQNjvS6kTYAeHBQOqsNUxH3/0SSyxp
 EhXujIo5IbpoeSpWc3dDWztynd59jyY7RT5quIH36skicckvfGlhF8x97qTXUVt/8W4AOSFb3Fs
 1Q3ij403KgsfQM7vaRsQHVHMUOGkej8A=
X-Google-Smtp-Source: AGHT+IGBADq9qPvv1GmF3HVY3rBXqSEWoPoSmke4fv07LljyRbGPQ0FVYp1KghRKdl4sqaPo7U3Nqw==
X-Received: by 2002:a05:6214:1316:b0:6e8:ec18:a1be with SMTP id
 6a1803df08f44-6f2c26c409cmr12409486d6.7.1744910951815; 
 Thu, 17 Apr 2025 10:29:11 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2af5595sm1459996d6.9.2025.04.17.10.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 10:29:11 -0700 (PDT)
Message-ID: <68013a67.050a0220.8a966.0ee4@mx.google.com>
X-Google-Original-Message-ID: <aAE6ZG6D2M6DGr2d@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 2B7B31200043;
 Thu, 17 Apr 2025 13:29:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 17 Apr 2025 13:29:10 -0400
X-ME-Sender: <xms:ZjoBaGiPBApOT3KF_cFKmqlP0bbriY55u7x8VYpRa0qowU7KQZinpA>
 <xme:ZjoBaHCbngiXNmyQlXWezOZ5Bc_fDItA-xjSijhF5X27mIsBYx5vLNmq-g4RjAf3q
 HIBZ8uGb1KPn3BNKw>
X-ME-Received: <xmr:ZjoBaOEmz40_zhoT86dRO0JRh_S1te3xyGwFb7aD8S0P7tlTf0SnsHJhSd5P7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelkeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnuc
 fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
 vghrnhepkeekheeuudefgeelfedthfduheehkeellefhleegveeljeduheeufeelkeejie
 egnecuffhomhgrihhnpehgihhthhhusgdrihhopdhkvghrnhgvlhdrohhrghenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
 hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
 hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
 dpnhgspghrtghpthhtohepgeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
 rghmihhrugesghhmrghilhdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvg
 hrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhr
 tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrd
 hgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhu
 ohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtg
 homhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgt
 phhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ZjoBaPQfcbgUf6Yh8VYFMzyHPR0de0KrtNwsOgI0EoaJwSCpSGcmYQ>
 <xmx:ZjoBaDyXE3R3Pe0e4Lcs8QsUAONUuo-ONw4acJ0XzoE03FenFK-ZWQ>
 <xmx:ZjoBaN7obfouPd4NCLnREA0UyfouapS6Ixg3HFXOj8RTtj7lrb04Fg>
 <xmx:ZjoBaAwsSQO1lRMSgp4ADQSdo85_yXrulLD8K-_wB-TpI4cf9HMiUA>
 <xmx:ZjoBaPhVey_mPsmOnJZOLjB_TA5tgpIB2Y9NYUQT7nBENqG6OlUXuFVS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 13:29:09 -0400 (EDT)
Date: Thu, 17 Apr 2025 10:29:08 -0700
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
Subject: Re: [PATCH v9 5/6] rust: enable `clippy::cast_lossless` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-5-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-ptr-as-ptr-v9-5-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:09PM -0400, Tamir Duberstein wrote:
> Before Rust 1.29.0, Clippy introduced the `cast_lossless` lint [1]:
> 
> > Rust’s `as` keyword will perform many kinds of conversions, including
> > silently lossy conversions. Conversion functions such as `i32::from`
> > will only perform lossless conversions. Using the conversion functions
> > prevents conversions from becoming silently lossy if the input types
> > ever change, and makes it clear for people reading the code that the
> > conversion is lossless.
> 
> While this doesn't eliminate unchecked `as` conversions, it makes such
> conversions easier to scrutinize.  It also has the slight benefit of
> removing a degree of freedom on which to bikeshed. Thus apply the
> changes and enable the lint -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#cast_lossless [1]

Hmm.. I agree with the solution mentioned from the lint URL, using
`from()` is better, so..

> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  Makefile                        | 1 +
>  drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>  rust/bindings/lib.rs            | 1 +
>  rust/kernel/net/phy.rs          | 4 ++--
>  rust/uapi/lib.rs                | 1 +
>  5 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 57080a64913f..eb5a942241a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -476,6 +476,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wclippy::all \
>  			    -Wclippy::as_ptr_cast_mut \
>  			    -Wclippy::as_underscore \
> +			    -Wclippy::cast_lossless \
>  			    -Wclippy::ignored_unit_patterns \
>  			    -Wclippy::mut_mut \
>  			    -Wclippy::needless_bitwise_bool \
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index f2a99681b998..d28e8f199d11 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -386,7 +386,7 @@ fn next(&mut self) -> Option<Self::Item> {
>          match self.segment {
>              Segment::Binary(data) => {
>                  if self.offset < data.len() {
> -                    let byte = data[self.offset] as u16;
> +                    let byte = data[self.offset].into();

	let byte = u16::from(data[self.offset]);

otherwise, the code has not local indicator saying what type the byte
is, and given its name is "byte" but it's really a `u16`, I think it's
better we mention the type here.

>                      self.offset += 1;
>                      Some((byte, 8))
>                  } else {
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index 0486a32ed314..b105a0d899cc 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -25,6 +25,7 @@
>  )]
>  
>  #[allow(dead_code)]
> +#[allow(clippy::cast_lossless)]
>  #[allow(clippy::ptr_as_ptr)]
>  #[allow(clippy::undocumented_unsafe_blocks)]
>  mod bindings_raw {
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index a59469c785e3..abc58b4d1bf4 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
>          // SAFETY: The struct invariant ensures that we may access
>          // this field without additional synchronization.
>          let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
> -        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
> +        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE.into()

        bit_field.get(13, 1) == u64::from(bindings::AUTONEG_ENABLE)

>      }
>  
>      /// Gets the current auto-negotiation state.
> @@ -426,7 +426,7 @@ impl<T: Driver> Adapter<T> {
>          // where we hold `phy_device->lock`, so the accessors on
>          // `Device` are okay to call.
>          let dev = unsafe { Device::from_raw(phydev) };
> -        T::match_phy_device(dev) as i32
> +        T::match_phy_device(dev).into()

	i32::from(T::match_phy_device(dev))

Thoughts? Better be explicit in these cases, IMO.

Regards,
Boqun

>      }
>  
>      /// # Safety
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index f03b7aead35a..d5dab4dfabec 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -14,6 +14,7 @@
>  #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
>  #![allow(
>      clippy::all,
> +    clippy::cast_lossless,
>      clippy::ptr_as_ptr,
>      clippy::undocumented_unsafe_blocks,
>      dead_code,
> 
> -- 
> 2.49.0
> 
