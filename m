Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5BABF6B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EBC14A8E2;
	Wed, 21 May 2025 13:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKJ3C3FX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0931124DD;
 Wed, 21 May 2025 12:45:11 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6f8b0fdd5ffso66358846d6.0; 
 Wed, 21 May 2025 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747831510; x=1748436310; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vhnzj3NnJO366VT/ATwYapAPa7ylDj+dwVk+TFu/WXo=;
 b=jKJ3C3FXpzIExSP0AuiXYfjceEI2df8wbzfX0dfDrY73QDwQH9N2cJ1PD7wdPfR6BX
 zrAqgY9zhVNPbtLNWFFWUoKgRgBihNWpiNq0+HfifsR1SBwWUkqn6OP2Xu3obJu6ki6/
 9v2e1+8STX0Hxhwg6T8pa3QL6QbgDyNRnZ31lm6pcEAmuf8xkanvSRBGn18FGlpmb240
 B5M9oQGaMYzCMldd9v2Dm2w7JOiP7mQ2uNulMOmfB3oFnlPMsOzlauyRw1blRU9ugi5n
 Fb43n8rPpgJe3/bCy7OPkuXQwb5yZ6CldWPPrPdhJNy4NcJnFY3qauifO30lrW5VCoiP
 Yc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747831510; x=1748436310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vhnzj3NnJO366VT/ATwYapAPa7ylDj+dwVk+TFu/WXo=;
 b=wzPhx08hOdfI/F2Qb+XjPTItdoPYQTDyj7I1Ad3G4NnK7wllUH75sF3+MfCSs8NsOZ
 binM668JAdW5U4Zc+j1TT0aylzUA5aebiKRsW6kUa+D1Rh2pJ46CvJLBcM2nJ/kShKc8
 rnbojG2r33rdErG1vyKROHyW9hPAD4XMOVlUx4PchpbaeL7DmCffPSTvDNlTwFFX/jFF
 Rb3Os6lFtHQTjktN+PP5AXLVHyyIRodNnO03vo++xk/7gu2eImDNsyQepRSZhVxDEG4w
 nQ1P3SqK3b9+SH+Q1T0sSv9FN/2dJ0B+46ZBZGz5y2PZyg3Q8zsddRlOI7xAxgXGLmIZ
 IWpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcla+kpNyWPFuKiFosC9Yy+e0jvT3VP9fHQHWAE85NLBHMMPidOFCE+MG+4eq4qCegQc8LcfhNJw==@lists.freedesktop.org,
 AJvYcCVPHoOs1eQVG0dXIY0fjaP/e5v6U9JqlHSnKLQ7dX8RZH7oX0+vI7ZPlhAfCfGsa9qDBdVMuycjN18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7bJJ/YF3XprC0U5CFak+NkdOnPeuJtsZqvn+sdIbd33HhqUm/
 2U8cC8L1R9nxF6ST4e2kJJDkQUpSKMTnYTtf5x7mlqhsvyXZxcbzh3u2wudQdA==
X-Gm-Gg: ASbGncskXl18P5wdy3mOLRaADb6TaYz2yhkbn2gRhe+E4B2QjuCdXktqIe9GsPt2bqr
 joNjrkc9+E5u6dMSNt5oP+sWZTLYkhmL2P1SDSm9jKGARodimDwQFcxW5Nz0XYRp0NgsFQkQGBp
 OdOUcdQwqeqQ1tquBhJ/RboInU36E3uYJLAlo+ZMdyBKH/JRBFw6QCA40A5uqX5FxbKcdNNtX2r
 ntSQoDftKIpHaeK1g4Y+K2o8LRlyWNxbA7LgAe7gPYV43FQAXlJqzpfKbfBzq31FVKnmsie1y+7
 UcPIdlm6M9GpDYn100v2VgQ7iK+J4zG05FYs2AkehSdIrfEtTPGrI5cpDZt/9KD073DSCtZd3b2
 0FNBlihvSMLbzcosELlT1K/lxE9kFViGsEaBK1S8tpA==
X-Google-Smtp-Source: AGHT+IEfRSqcGJ5t4rcRxmzM2k920FXsaJwu1wxt9D1Hfdpn8uKSN3fb6OCq2dNh4iOIGz1TYtv/Hg==
X-Received: by 2002:a05:6214:cac:b0:6fa:864f:87cc with SMTP id
 6a1803df08f44-6fa864f8a4fmr18904046d6.33.1747831510427; 
 Wed, 21 May 2025 05:45:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08bf66bsm84578696d6.63.2025.05.21.05.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:45:09 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfauth.phl.internal (Postfix) with ESMTP id 5CD34120007A;
 Wed, 21 May 2025 08:45:09 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 21 May 2025 08:45:09 -0400
X-ME-Sender: <xms:1cotaFbzhLa-AVxwpQ35d8kX6hIq-ZwWislwhChbDGrE886dcXNkqg>
 <xme:1cotaMb7eFhXctyLi7ci4R4k3tFn2T2VAuphJPlupRodTcGwYg19z8qCxeIB3OiXg
 GoUBfDa8naZrFuR_A>
X-ME-Received: <xmr:1cotaH9vnyOR6XHBgx3dt1S-54GBmy0ro27iatwvJnw6GrIg8QlhdE-Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefuddvucdltddurdegfedvrddttd
 dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
 nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
 enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
 tggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunh
 drfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffet
 uedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
 uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
 hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
 tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsg
 hothesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
 htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegp
 ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhssh
 hinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpd
 hrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:1cotaDr_BZnTBO2ZZrxy5srrQmZLzeo9gWXnSOIXgNKffweWuOxofg>
 <xmx:1cotaAqMl1zRLe7L77t9gwX1n54-xBKwNgVE1PMBxXFMnUOO50bscw>
 <xmx:1cotaJQ4dtper7JsxvJG39LklNMIPguYPvErgkSuMnOiT_alNE6wdA>
 <xmx:1cotaIqgOC4ilrO4JZb18O9O6GbSlFri46ozj22VjBeOFxpIB5P63g>
 <xmx:1cotaJ4jQULX3Xw0qsN9n-dwPqENjGgYpRv_JvJUfS2Dt1RcyknYAt6Z>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 08:45:08 -0400 (EDT)
Date: Wed, 21 May 2025 05:45:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 03/20] rust: sizes: add constants up to SZ_2G
Message-ID: <aC3K0-z7JARmg7Cc@Mac.home>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-3-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-3-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:44:58PM +0900, Alexandre Courbot wrote:
> nova-core will need to use SZ_1M, so make the remaining constants
> available.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  rust/kernel/sizes.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
> index 834c343e4170f507821b870e77afd08e2392911f..661e680d9330616478513a19fe2f87f9521516d7 100644
> --- a/rust/kernel/sizes.rs
> +++ b/rust/kernel/sizes.rs
> @@ -24,3 +24,27 @@
>  pub const SZ_256K: usize = bindings::SZ_256K as usize;
>  /// 0x00080000
>  pub const SZ_512K: usize = bindings::SZ_512K as usize;
> +/// 0x00100000
> +pub const SZ_1M: usize = bindings::SZ_1M as usize;
> +/// 0x00200000
> +pub const SZ_2M: usize = bindings::SZ_2M as usize;
> +/// 0x00400000
> +pub const SZ_4M: usize = bindings::SZ_4M as usize;
> +/// 0x00800000
> +pub const SZ_8M: usize = bindings::SZ_8M as usize;
> +/// 0x01000000
> +pub const SZ_16M: usize = bindings::SZ_16M as usize;
> +/// 0x02000000
> +pub const SZ_32M: usize = bindings::SZ_32M as usize;
> +/// 0x04000000
> +pub const SZ_64M: usize = bindings::SZ_64M as usize;
> +/// 0x08000000
> +pub const SZ_128M: usize = bindings::SZ_128M as usize;
> +/// 0x10000000
> +pub const SZ_256M: usize = bindings::SZ_256M as usize;
> +/// 0x20000000
> +pub const SZ_512M: usize = bindings::SZ_512M as usize;
> +/// 0x40000000
> +pub const SZ_1G: usize = bindings::SZ_1G as usize;
> +/// 0x80000000
> +pub const SZ_2G: usize = bindings::SZ_2G as usize;
> 
> -- 
> 2.49.0
> 
