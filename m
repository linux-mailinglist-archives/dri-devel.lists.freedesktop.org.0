Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B317AA90A9B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091AC10E98E;
	Wed, 16 Apr 2025 17:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bhWeDBUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494FF10E98E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 17:58:53 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7c5c815f8efso643929385a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744826332; x=1745431132; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Xw162kgFschDiIV5cGynK2BOAJTwtOVScNTTzDVE1U8=;
 b=bhWeDBUunY7jP3pWcXfn7wSciZk6Ry3nO/MtXKmu6MTvNvKf6/fA0PJHubqCwcBTJh
 GDIuIi71ITrQAuVFXHzcwydk87qh/KcEX6GCPNTM2A+kMUtl+mj/B3T+EtRmoAjBzA1K
 o3VPa6ZXMhvhIeCKkIUyAkwUMQg5WGueedeQUhlURfcaVu4HRLRG19ke6bVlORb+r1dZ
 qFIdfiqGHmzrCYKtiV9Z/5n8xKDDkYwfmR6gdNwKXd2fNmYrutAKJevAxkOLjFpUqhQi
 HdzDrREft0Cg9vZwqjQQCeM8tHmFlJiKpCRRQ0N1SgnL8ndr5suxcK/H7QtHxLoSpUP7
 n60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744826332; x=1745431132;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:feedback-id
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xw162kgFschDiIV5cGynK2BOAJTwtOVScNTTzDVE1U8=;
 b=Zk+dqaIx5S20kCsrjkB9OcQQMEwK8dWxg1War7vBwL7NNwmMV1aFCdcGwsXuRtCC/F
 0P2uKJY4/5m/XMc+EAnePiU8T7H8On8yd5m3Ihzo/RBQsdBS2Lw0A/qasge5e5SOn3cL
 NtIShEc5pKi/mqqpo8bjMVyBzRCIYFD3refpBzzVg0qK8WXgF0IuWwtUFNVQne1GpvS0
 HuUIuqzwBlrD/Zrp2lMSm9obaZRZWZbN6gzXZFvHmpIFXCf0OYicvcta+NoHOpESfpaM
 CvKXJiwvOVApV0DowQgwZ96H0dmfgRZ/PdF+RUa/tZlxPgUpoEtsFTeFBaLjMB0+aoZd
 LqUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHwSp8UrGQpkK8QZP5jnifRaS7/f/+6FfFddiv5wo9VQ4HNSnyJrU/JUiJ6n/FVOQn6F1ip8+j17Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1nmRzrVQX12JJZFXve+0etuTJ078CMpRN1cYxP8Ah32vqyA29
 C8hVVr/V+0Wxxl5iEoJgvRx7CojEv7BDcCO0GLBCxKFWezRtKwOy
X-Gm-Gg: ASbGnct29obD7yLbVjynwQpIP96Tx28U2/KDmB4QVP1GgekWwJOt0aDxtyw62gCykzL
 GuUmx1ZgA0iSnv0SdyLML/gklIaxDo2iT0VZfNAdNcBqO1pnuH/GhpFHq6r0ussvWNEfpdR7/Ht
 hG3yLfwrTmCMrKmp7n++FUy6fznsy/u6iWZRlk5lHFW+eNvimz1FehzWfR0TJaqgd513jpsxB/o
 S5JUVoTRRYyjbTPAQZ+A6X2QtHOM7y6J1WwDM2u03iLGwx4gAn5uMf6WkIK5/VDEAI0ZNUOmMB2
 ZtjkcQhS1TWGuW9vO7J8rzxQOySC7t7hbCpI9qDESyaWJrhoj7NhDil5aiBYdKkhUXlmBe1+hCf
 N4Pq8ZnUe7qPHgXgu1rq+MpJ0uLFq15I=
X-Google-Smtp-Source: AGHT+IG2xgMUSPM66Q42gFKXA+8KAt65yWia1nfFwf2fIYwzoFAy7Rqdy1Qgw0W9zJEn9qMHB/aQBQ==
X-Received: by 2002:a05:620a:318f:b0:7c5:a513:1fd2 with SMTP id
 af79cd13be357-7c918fce4c8mr432709285a.6.1744826332212; 
 Wed, 16 Apr 2025 10:58:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c7a8a0dc9fsm1083506885a.96.2025.04.16.10.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 10:58:51 -0700 (PDT)
Message-ID: <67ffefdb.e90a0220.61a9e.ae40@mx.google.com>
X-Google-Original-Message-ID: <Z__v2fIvInI7C5po@winterfell.>
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfauth.phl.internal (Postfix) with ESMTP id C82631200043;
 Wed, 16 Apr 2025 13:58:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Wed, 16 Apr 2025 13:58:50 -0400
X-ME-Sender: <xms:2u__Z-6e9bwRfBqXn5ZV5KAPHX2Erzyf2g9lCPuzWusdcJVI92JRyQ>
 <xme:2u__Z36bvFCsweDpyolBa0bQ1sjrqLNn_EADA-OlYnY0YPOLBn4A_CbOC0Iu_6BkE
 9dYeox8dGIx2g735w>
X-ME-Received: <xmr:2u__Z9fAiWc4vPjhZzUtI2Of0WLaEHNUYVAgVs94XRZGi9JwR07HuAXTOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejtdefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:2u__Z7Kx_1V_DGAuo7rklz4-YXbV9iH6ZLmsAEXvUKvN65NZ_gXY_A>
 <xmx:2u__ZyJZ4L9Rw_LxO7hsWD8QSr-EAsu1YlQLSWQ5wRvqPcAvOWsBPQ>
 <xmx:2u__Z8wb2Wq1I1vj43mGXf3hSkxSiNKUMtFUY0H_8DLETvV3GsyL3Q>
 <xmx:2u__Z2KvF4iMjtFKev_1qUqJlGoO2GUd2iZaEbJY2NRkmC-t818okA>
 <xmx:2u__Z5aFsOy6LALo_VQ9BGXCOVtcyZn2dgILL7wK0bjLLbI-qFf-__Ot>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Apr 2025 13:58:50 -0400 (EDT)
Date: Wed, 16 Apr 2025 10:58:49 -0700
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
 <67ffee16.c80a0220.1dbd15.c3ad@mx.google.com>
 <CAJ-ks9n-5Gkp61ODfBbf3==fYp1AbexANLZaQpsGj_mj1WRfkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9n-5Gkp61ODfBbf3==fYp1AbexANLZaQpsGj_mj1WRfkA@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 01:53:34PM -0400, Tamir Duberstein wrote:
> On Wed, Apr 16, 2025 at 1:51 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Wed, Apr 16, 2025 at 01:36:10PM -0400, Tamir Duberstein wrote:
> > > In Rust 1.78.0, Clippy introduced the `ref_as_ptr` lint [1]:
> > >
> > > > Using `as` casts may result in silently changing mutability or type.
> > >
> > > While this doesn't eliminate unchecked `as` conversions, it makes such
> > > conversions easier to scrutinize.  It also has the slight benefit of
> > > removing a degree of freedom on which to bikeshed. Thus apply the
> > > changes and enable the lint -- no functional change intended.
> > >
> > > Link: https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr [1]
> > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > Link: https://lore.kernel.org/all/D8PGG7NTWB6U.3SS3A5LN4XWMN@proton.me/
> > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >
> > Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> >
> > Thanks!
> 
> Thank you! I updated the earlier patches as well.

Yeah, those look good to me in a quick look, I do plan to take a deep
look and provide Reviewed-bys later.

Regards,
Boqun
