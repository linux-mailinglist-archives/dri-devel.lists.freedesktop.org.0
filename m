Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01092A92394
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 19:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0820B10E1E7;
	Thu, 17 Apr 2025 17:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LBDW1R06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D2B10E1E7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 17:13:46 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6e8f7019422so10280716d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744910026; x=1745514826; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uMiNN63eUUM5t6fmwQT7MGcJeOTU1iqkIGAVW80wSWM=;
 b=LBDW1R06wfeV+vcoW4DOOKcjxcNen12CRtGXYSNyIARezos0bnw+wEcJtcwzv/YTQY
 p6508RTXGn5Iur0eLniu9rXmZ+tpRfZhTWOhiBbWnLm0wfJ5mqr1VWNQsGLTuKHj5Nv0
 Zzmu1ZegWkFT9kEFVMJANiHtkGbpxTvoPJiAM998lz+0r0EQ1POnDo2NNewbO14GKyQi
 gpjQJiq1SEelCaiuMZud04FH3/jY0937ZpkBUYLlvoruAmm73aaOF3a9vHpM0VtE53bZ
 5c/fVnAsNWT9XBIsyW1fsy0Ta/d5cG9yY2jqY4BepG/edRZ0BXCXW8V0NJrqxS7lCBzs
 5mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744910026; x=1745514826;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMiNN63eUUM5t6fmwQT7MGcJeOTU1iqkIGAVW80wSWM=;
 b=QZfCMJtd5q9YTqgorXb30oeRarQWaAeF/bnL8529c+03Eu0mOjtUmkc8ttD2yDZsNa
 vZDRwqy+OwGWcEMTgPiQRCmkkoKuWzBykiIdpCQFj96rcTsBBbgzne8TyCVHtqxmi9PI
 whS4C5Wiw6QIdwaxuvBfFPbENkf4nPJLIaxGYVJCLU+uKHdJbEqN52LfjMU5mBDPjBAb
 mTFr98Xzy5l2WSZcEuNAQnVl9Gkj3Gl7oVT6mOCYFaasiND1HI92b44StzxkXNCdUFPI
 qSl7KnIv13FXxalIN8Dfbvt8d9z4uOH7kQa8eNmeDhFNnzHs5VtkvFAndlL3OrjG/t7I
 Wb6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZIuEjLfKBaLoDsBulU9nha6qZCXOAF1viP6wLzXBOBvvewiNbWZ8TGMcrvaWl9zFesqyImkrjn2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySaKePVraqW4jHfKYvU1pYnfSJt9Elt2SVfg9sd5gRmKfpgq4V
 puWLe/MZrxFPaXFKpfcLOQPL/btFWkJoMYJLRLcBQkQKKMrLhYkH
X-Gm-Gg: ASbGnctIyz2SgR5DpybmyWTqZby9ehsUg/95EWqqi6kAQh89FS7VVfUu/Qm67N9sjPg
 tvK+5hu0UvAD/UfsG+wTtiLu+z1K6nMKcxoVQ4OX1QevQKAIooWmikf3sS6fg1/K3xWUpwZu1Hy
 kQTB/aGAHwqqWGqaHWlFOY/4zRhpNYot1bK1nI4ZlcNWny/wiNQHff6P9Ub247uueloNwxt2JSQ
 ReEuzoSTjjk/COpJcKI7RztS8jMGiEBdDpVaHWlN8CVVsWPETBvDEPg9Smr131TZtBDX3E0Hgkq
 MjIdr1jTGUt0JiLQHsdPLtQhozb/Ky1MQ72F3uBBOfqtfmXU+4xxA45TEfjTOJGXJvHOLvwa2pc
 3zx2lA0IlQQOc2NdhE9ozdTB4pZ4lJBI=
X-Google-Smtp-Source: AGHT+IFjAMymz+o8QFD3zeYcOgfTsX1rJmYVCrC8UuklVGxVBRToXezBFVxai8deeydLj3G4kuqUbg==
X-Received: by 2002:a05:6214:29ca:b0:6f2:aefb:948d with SMTP id
 6a1803df08f44-6f2b2f47dafmr111323006d6.15.1744910025787; 
 Thu, 17 Apr 2025 10:13:45 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c21d85sm1193506d6.107.2025.04.17.10.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 10:13:45 -0700 (PDT)
Message-ID: <680136c9.d40a0220.3a40bc.0bd0@mx.google.com>
X-Google-Original-Message-ID: <aAE2xsLJq-QnGamy@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfauth.phl.internal (Postfix) with ESMTP id 4A7821200043;
 Thu, 17 Apr 2025 13:13:44 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 17 Apr 2025 13:13:44 -0400
X-ME-Sender: <xms:yDYBaKP-8D2Cc1Qasl15QzYIKWEXmuEJNyu7NeylH87LFVV_OyaoUg>
 <xme:yDYBaI_5nESWhc4x7XO7Kw4SC8rxSyDiRyMg0FcQNLUttVtEKp05ZjLA7qGXWUc-L
 bswlrf6bKx-KuONyA>
X-ME-Received: <xmr:yDYBaBQUQUgJSQ_cEe2LZpJkNWc6_9yJwwld8UVgtygkbo3-_CO0cFVCfm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelkeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
 rhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnuc
 fhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthht
 vghrnhepfedvkeettdeluedtjeevleeugfehiedvuefhgfdvleduheegvdekudegvefhue
 ffnecuffhomhgrihhnpehgihhthhhusgdrihhonecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrh
 hsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgv
 nhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhope
 egjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgrmhhirhgusehgmhgrihhl
 rdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggr
 sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrih
 hlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
 ohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsg
 gvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgu
 sghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yDYBaKvwEls1Zv6MdJG_fBGROyvSZPi_smjaTZit-e5mcuMjphUgRw>
 <xmx:yDYBaCffMS8uRoKqZ7odUAvP81el5qkqHjyOniSsrdgkC12UYxz4FA>
 <xmx:yDYBaO2pk_HMexV47hY4tJuwpSETKzXzexChsPkbiSfrQ6HAuB9-hA>
 <xmx:yDYBaG_ZoyUhjasgiehzWnKMBRUdZTU7eKXpRc5jx2qcFp0R-6dfRQ>
 <xmx:yDYBaB8bIvlKrY0p0lTwqimjLRsBSCtP3OJvaLaUDpHBMf4dz94q4W3O>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 13:13:43 -0400 (EDT)
Date: Thu, 17 Apr 2025 10:13:42 -0700
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
Subject: Re: [PATCH v9 3/6] rust: enable `clippy::as_ptr_cast_mut` lint
References: <20250416-ptr-as-ptr-v9-0-18ec29b1b1f3@gmail.com>
 <20250416-ptr-as-ptr-v9-3-18ec29b1b1f3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-ptr-as-ptr-v9-3-18ec29b1b1f3@gmail.com>
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

On Wed, Apr 16, 2025 at 01:36:07PM -0400, Tamir Duberstein wrote:
> In Rust 1.66.0, Clippy introduced the `as_ptr_cast_mut` lint [1]:
> 
> > Since `as_ptr` takes a `&self`, the pointer won’t have write
> > permissions unless interior mutability is used, making it unlikely
> > that having it as a mutable pointer is correct.
> 
> There is only one affected callsite, and the change amounts to replacing
> `as _` with `.cast_mut().cast()`. This doesn't change the semantics, but
> is more descriptive of what's going on.
> 
> Apply this change and enable the lint -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_ptr_cast_mut [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> ---
>  Makefile              | 1 +
>  rust/kernel/devres.rs | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 7b85b2a8d371..04a5246171f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -474,6 +474,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wrust_2018_idioms \
>  			    -Wunreachable_pub \
>  			    -Wclippy::all \
> +			    -Wclippy::as_ptr_cast_mut \
>  			    -Wclippy::ignored_unit_patterns \
>  			    -Wclippy::mut_mut \
>  			    -Wclippy::needless_bitwise_bool \
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 9e649d70716a..f7e8f5f53622 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -143,7 +143,7 @@ fn remove_action(this: &Arc<Self>) {
>              bindings::devm_remove_action_nowarn(
>                  this.dev.as_raw(),
>                  Some(this.callback),
> -                this.as_ptr() as _,
> +                this.as_ptr().cast_mut().cast(),
>              )
>          };
>  
> 
> -- 
> 2.49.0
> 
