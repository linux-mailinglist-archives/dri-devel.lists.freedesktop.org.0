Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE44A8ABDE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 01:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5618C10E395;
	Tue, 15 Apr 2025 23:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WrooOdwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B625E10E395
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 23:11:26 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6e8f6970326so58750006d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 16:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744758686; x=1745363486; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dKLRk0brjDNifaxxsd7Y9Fb9L/syicRgQ50i2EOVxk4=;
 b=WrooOdwElhTT51QmbzUGEjj6LZQkLR6742heOsFWjAoyxON5DubwkW1C9YseobQXsM
 qpV8bTh3cQQxTJJuEUDIqbCA4L4OxwwXPJkBk+aSJERiuDEcDQVJ4vEZGUm/88okM3FO
 Lw7pikmsb+IbeLJ9eIGRcMK/Y+/zMq4ujQvgNJLDKa0T5HHWLK2ogK8R/O2drbrDwyc2
 iBfYPrtiMDgKfkmfU5jS+iywBYakWpJ3chhsglf1cmI0tUitwIXzTwH8vQhifQwFuXjX
 XywbUdMkdhFg5UWtT8JW9IsoXuEi9IN1REIQSBHXwd4O+KugIQVeAJtGVEgthRn2eY+X
 ZX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744758686; x=1745363486;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dKLRk0brjDNifaxxsd7Y9Fb9L/syicRgQ50i2EOVxk4=;
 b=nkWTEFCVCguEr+aOU+qBC086oNGGAhw47R95wuv56PPLkY8EYalbJo58DwFsPwIcMW
 ezxLQSJkNxhDHlXL+CY5r4c+zAZISQvBmQhW3FmQBZX9CqjjP0e2vs3vb2uTor3eLvN/
 Ad/TNeXxS1USBVZWxvVGS5WftuMwo3//CjgNbAYlOjBsdI8kzM/uUsVUdRcEYDRfPvAu
 i0SsAatFAaL+BVu31Z0bgajw7O1WCBuuPTBIZtRkionHQIxqH/dBG214l3xV5S5N/JN/
 POoInt7LqUtfuafKN9FB107k9fjEQdL2O12KswxBSMmu4bXn1rN7PegHiF7pICtGIhxC
 SNHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlFacUrCHvXk44DQd/Hd9BySAjU+raeVfg5T8AVh3uWk2t0P936Ofs4qIug8GD7Yj0TKK16OhzdlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfJp8gXe1HAbz+qSvch9sbXwCS0stOXLXhq4BCt1+B5u59l3GJ
 X8Flq2tvKgNw7vTUF6cnGu0UgWr8MkW77xW/YIx2QJOAs+9ccRiR
X-Gm-Gg: ASbGncsHLlbJPAMpuc4XHMbyWw+JabR+piMl0FK7hFKELNFxSKyGL1afP//156O8Oj7
 a4GlYpa50WhjNBEqKRq70fg8FL6hIpE3ULQfnEqkfL9GkflqO2xgUw5P67mJbHf2oxRtE2vPVgQ
 d9VV7eo+knXdb2WzZ3cpf306FrNtrcaN6fxzTChCBdUjmtGywMs8qPb1UW0EA6QSnio2YggJG5y
 7QPd4soy7V4ytKaHS1YSoym1P6z+rfD5fPv2sUWE7xbhdGudDeTYsRuVp3sJ/gK/ec/qLmQYdTc
 jMyikYVWTqh9ydTtTcqzH3OwCnUBQ2NbQZ5w1en4eWt8rudxqGfeDPiTk/g4SS8cRgqCXhUyrgY
 yFuVzizDITQ/CqKZiZQZkU9DxNPhxx1o=
X-Google-Smtp-Source: AGHT+IFETheEP+xJhRNM1qZxIYPDxwWrcrPYC6B9CbiGQ1KKBk3+QdK0VZBgDiYVn1tco1xRTl5+1w==
X-Received: by 2002:a05:6214:1307:b0:6d8:99cf:d2db with SMTP id
 6a1803df08f44-6f2ad9cbc1cmr23831046d6.38.1744758685601; 
 Tue, 15 Apr 2025 16:11:25 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f0de95fa03sm107097036d6.8.2025.04.15.16.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 16:11:25 -0700 (PDT)
Message-ID: <67fee79d.050a0220.3c9498.bc23@mx.google.com>
X-Google-Original-Message-ID: <Z_7nmZxgQgdnm4JB@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id 20E271200043;
 Tue, 15 Apr 2025 19:11:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 15 Apr 2025 19:11:24 -0400
X-ME-Sender: <xms:nOf-Z6UDAdpnclVKCUfuXlUT7xZJhQHxa1dnwUsoRcSjQm30zBXuLQ>
 <xme:nOf-Z2nnxnX-_Ij-A7N0FCBF0eDRrWbwJvHn6GJuP-MZZEESZzNh9r3ewFNyYeGF6
 afBMgSeaPMenyMolA>
X-ME-Received: <xmr:nOf-Z-Y1xTO27wuhgzWJC5Si6Bp5mYdfOvvM417aDr9nRd13erD5_2O7RSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegjeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
 leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
 lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
 hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepgeejpdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopehtrghmihhrugesghhmrghilhdrtghomh
 dprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthho
 pehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
 mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjh
 horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhho
 rdhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgh
 eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nOf-ZxUDUKJJw3gmIqhuJ5y6d3EH6fSycZ8K1NDgJuuF1VT5kOWrpg>
 <xmx:nOf-Z0nydUhHJhu79epg3_0X0HbvWM9t8YjqixNvAj3x-HizuhdPyw>
 <xmx:nOf-Z2dbGPx55Mdho92Hf4sfcnBm9fbUszd7OJKLAiOGRx0BRb3SuQ>
 <xmx:nOf-Z2EGD0AdYD-E8v6eUS3p430M-l-WUTowU7PEhhm39z8EOjBi5w>
 <xmx:nOf-ZymqPc77udtVs7tC7u-E90mY3EYFJ-5O06XqK_nFkZnpDiCheWSX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Apr 2025 19:11:23 -0400 (EDT)
Date: Tue, 15 Apr 2025 16:11:21 -0700
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
 <67fee5a9.050a0220.25fe78.76d2@mx.google.com>
 <CAJ-ks9ni3iVY-PwUVdhxah325ovU5CWw=gfR+dhfPLGwDra8pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9ni3iVY-PwUVdhxah325ovU5CWw=gfR+dhfPLGwDra8pQ@mail.gmail.com>
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

On Tue, Apr 15, 2025 at 07:08:42PM -0400, Tamir Duberstein wrote:
[...]
> > > >
> > > > > > also from the link document you shared, looks like the suggestion is to
> > > > > > use core::ptr::from_{ref,mut}(), was this ever considered?
> > > > >
> > > > > I considered it, but I thought it was ugly. We don't have a linter to
> > > > > enforce it, so I'd be surprised if people reached for it.
> > > > >
> > > >
> > > > I think avoiding the extra line of `let` is a win, also I don't get why
> > > > you feel it's *ugly*: having the extra `let` line is ugly to me ;-)
> > >
> > > I admit it's subjective, so I'm happy to change it. But I've never
> > > seen that syntax used, and we lack enforcement for either one, so I
> > > don't find much value in arguing over this.
> > >
> >
> > If the original code use "as" for conversion purposes, I think it's good
> > to be consistent and using from_ref() or from_mut(): they are just
> > bullet-proof version of conversions, and having a separate let statement
> > looks like a distraction to me. If for new code, and the author has a
> > reason for let statement, then it's fine.
> 
> Fine by me. I'll change the let statements to those methods on the next spin.
> 

Thanks! There are a few instances in the early patches as well,
appreciate it if you can change them as well.

Regards,
Boqun

> Thanks for your feedback.
> Tamir
