Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C2A93B61
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 18:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31110E22C;
	Fri, 18 Apr 2025 16:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ITa5cthY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F610E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 16:53:46 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6e8ec399427so16345896d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744995226; x=1745600026; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3t/WaZrLOk89oF+EDQCe/b1X08N9WTsCNvmuCONFWag=;
 b=ITa5cthYsdgEqOjkxQU3PDOv729Xm+dybAOywLlVJ948LZWzbCchJsmNTnjpus62g7
 Jflj/XO2xCY73q112D/curYWhyHLZzatv74243oW5cVT4e97eMqE5NrbSKZp2rPtlki+
 n3eeINGk/SU5tUrUyWhgzCbEqddLKvv5Yg20TEIzSon1UktkzLJLE5ZSPXeP8Bb6k26L
 qVJwbO32dVnY45GJVGb7Y2lX6seAMYm+MRYs2sIaN/MqpXZhnQsYnPeWthFFmXDaBdxm
 KlSiP/4lZXjwtdvtoSbhXJx0y/QHpc61USlovIjKnH9eauJmNygyU4z5uCpXQKrsAhe/
 HLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744995226; x=1745600026;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3t/WaZrLOk89oF+EDQCe/b1X08N9WTsCNvmuCONFWag=;
 b=xH/AfXXFcRC9NehgOXJMetBCqupGZJqTRtYID0Cf2nzGQEuGNLnytuaP4isOElT5ar
 Shf6pk7qlhykrLF1u6URRc1eMRdi7tgnG761LkLN5RiOrrQ9MdBZRHHnHDbCqgapFjUo
 MWNF2KT70ooY5zOWbwytqaUgM8PSh8/LO1Jm+8QAMV1G6qIFbg01Og4VXfpXgvNfJf0m
 45XyICiyKMXPPJrLIU14QtWYWUeVE99emtVLnT5OgQDZb1DAPfSxYi3not4Il0Aa1bZf
 ttnWavx7uiaEPiQ2ZdXp0mQvWJGVbS9m5syy5Z43+tA7zy0sQjBDNdEWlnXBqfSJqRjJ
 GKhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP1vMyIWai88CjsBi7qslYN/EA+7P/9ANAX+IWLsH9UAFFUJI+NDkE+j72Wb/saAxU0gzbNc/0+2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZbEEe3JBnynoHRXJFrdv+iKqeuxZhH/7MJdCR7DWc0Z9w9/SC
 BJKRCzVlnGlW7twVl8dd6kPoVJaMZBvbGhI711C9qOj0apSltjIc
X-Gm-Gg: ASbGncsqMbwOOsugoY1kWWc5apQSqOwysn5w9kt9qigVPTjHthtmA1hR7wWx+FVs/wJ
 9q6pQR9s9DuEe5edRGLssXhxfSkrpVeLWmyTulcfjAn9BafMA0UExtOA9PguM3l01ZaLd4oBt0x
 0a9qxOF31intim1qHCdPkWyqPPklOGzmCUAJZtTsU3/v1+NK9JiCaQwMKd66X/rpqsw0ZtMrptw
 X5Lh16gagCRg1N5AR06QN89cpmjmVteb5LlxDhvuwShmKj1+kCrp6iCsSfYVOt0eRk4OMFosbQ2
 c8XLp/5UmPHKiFM6McncfaQQeslJTFG8cCTfP1HcPnKcwSmRiIJ/jugoqpBisLjKS1+o5ytD2Cu
 aLqb9jxnXxIk6tTkmEtlc3ply2EwzC1Q=
X-Google-Smtp-Source: AGHT+IFK5F7pjTh+gDI22NM3J/gMlBfdXSYFP16c7YCh2IMcJ2ycP9QTVW7R2aFWqMe//5+hwErVFQ==
X-Received: by 2002:ad4:5d4a:0:b0:6e6:61f1:458a with SMTP id
 6a1803df08f44-6f2c454e561mr61427996d6.14.1744995225599; 
 Fri, 18 Apr 2025 09:53:45 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2b0dc58sm12429256d6.30.2025.04.18.09.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 09:53:45 -0700 (PDT)
Message-ID: <68028399.0c0a0220.389db7.61aa@mx.google.com>
X-Google-Original-Message-ID: <aAKDlapFVulZac94@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 066C51200043;
 Fri, 18 Apr 2025 12:53:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Fri, 18 Apr 2025 12:53:44 -0400
X-ME-Sender: <xms:l4MCaOS0MZu7VrDm1Ob2LRUYzATn3lvCrSx3mxKtRJynmiJf91vuQw>
 <xme:l4MCaDz51H7htPFXnN1I5J2eYclIkY2hxlzLEpBwVsysaX8a6d4yyVxY1Z2XsvVGA
 osS__YVT1a0RizI-w>
X-ME-Received: <xmr:l4MCaL1eShu7QA0LgrTDuktgHW2xyyXGbxMkMlvWru2HnE6VgzKO-vQd-oIGFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvieekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:l4MCaKCQ5_AOxgrM9RUujgkgseBZnmKKzmalnkhJG6SECBu9lWm2pg>
 <xmx:l4MCaHgYTO7zyl3noT53XHpiSgVpbmcFFmbFQNR8UOf2kvASWVyHpA>
 <xmx:l4MCaGrX6PPw9obSYJcN3qrnBS7WfC_zXPJu5mxchXy92dGdyigYSQ>
 <xmx:l4MCaKiFAgA2HoDBXSctPHo_XFldUBwHaFxEgeDfvkjr87N1ON2s_A>
 <xmx:mIMCaGSluDRYYRt5sBgRuiMWR_Dz1ykK0mZeKIfuwnIwbJoOeQ4WxXkb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 12:53:43 -0400 (EDT)
Date: Fri, 18 Apr 2025 09:53:41 -0700
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
Subject: Re: [PATCH v10 5/6] rust: enable `clippy::cast_lossless` lint
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-5-3d63d27907aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418-ptr-as-ptr-v10-5-3d63d27907aa@gmail.com>
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

On Fri, Apr 18, 2025 at 11:37:21AM -0400, Tamir Duberstein wrote:
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
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8ORTXSUTKGL.1KOJAGBM8F8TN@proton.me/
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

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
> index f2a99681b998..7555513a4fd8 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -386,7 +386,7 @@ fn next(&mut self) -> Option<Self::Item> {
>          match self.segment {
>              Segment::Binary(data) => {
>                  if self.offset < data.len() {
> -                    let byte = data[self.offset] as u16;
> +                    let byte = u16::from(data[self.offset]);
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
> index a59469c785e3..f821480ad72b 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -142,7 +142,7 @@ pub fn is_autoneg_enabled(&self) -> bool {
>          // SAFETY: The struct invariant ensures that we may access
>          // this field without additional synchronization.
>          let bit_field = unsafe { &(*self.0.get())._bitfield_1 };
> -        bit_field.get(13, 1) == bindings::AUTONEG_ENABLE as u64
> +        bit_field.get(13, 1) == u64::from(bindings::AUTONEG_ENABLE)
>      }
>  
>      /// Gets the current auto-negotiation state.
> @@ -426,7 +426,7 @@ impl<T: Driver> Adapter<T> {
>          // where we hold `phy_device->lock`, so the accessors on
>          // `Device` are okay to call.
>          let dev = unsafe { Device::from_raw(phydev) };
> -        T::match_phy_device(dev) as i32
> +        T::match_phy_device(dev).into()
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
