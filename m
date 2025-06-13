Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F9AD9137
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 17:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69F410E987;
	Fri, 13 Jun 2025 15:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CQjyG/V1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB8B10E987;
 Fri, 13 Jun 2025 15:25:14 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-7c922169051so140821685a.0; 
 Fri, 13 Jun 2025 08:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749828313; x=1750433113; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAvMYCY7N602oTIv1xbvy3rwaOD5ob45HmfKgySj4yM=;
 b=CQjyG/V1GjGSSnBeZzuJiBqfCdVbBNOeAYp0g9jN9huLpg4cWFWO6+JTGhcTDRsKYn
 iyaLxsY/M4KUEXWRCdZ7R9aOY9kfN+IyI5fKaBLPyEz490Yx8fPzZNa71MXB7hXixACo
 PcJ4bF0iTwzeNL9CBbQ3HHQViv8POW/sEMOw9Zfpx2U3fxoqdJtFDSTNQaEcTPbP2I9X
 k5s46bN6a/M6031bpTeAtE5eNjRoDN2ECR/14j8k325aaKtW+WX3I78Ra6a9P/Uk1pbr
 EZ1q1JVemvdr/YU1wgqjE7Lxt6Ds6QoDhC/74b79p/sp7PqMjDjUwMwe3Uh1O0n22C3o
 Sj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749828313; x=1750433113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAvMYCY7N602oTIv1xbvy3rwaOD5ob45HmfKgySj4yM=;
 b=NkVJlYrG2PUaKdpPSse2tTYWwNA7TpYB/v94thTujp/Hlxf+O/WjFXOl2p3nNw/Mkm
 KiJbustKyWUzu1J7U2Is8LwVRs3WWgWkdhRYKDQUojc3eNJ886fVpxqcinM5FnkaHuKK
 dyvUdwP7f754RPt6UepE81qyJXznMtgzse6mzG28PIdvhMRXxiDly0ho32SPjYDSjkwg
 s3+8tTNehUbhifa8oytsynyrx/T67M441quvqujJgyC3j6uFJY2foiTS4sUTDiedDAE/
 p8zmHZdU7iZrosSpQjNoFzdPMHiYBLUn5wOWYLNLnRDjjMbjlDsmnK1eSM9uZfUzbggp
 uUsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1A9vmUNKFc6U+GYnKHNoUen9RKvmvjQVYl7qtMmWylZE/QCK5FAFBA47KrTMlxFQSTydCoZ1a2/Y=@lists.freedesktop.org,
 AJvYcCVik+vYcR63ugHIdB+fsKtCrKYNHMbX3N5r7H9PqDybuqq/gXod3tuDKPeO2oBLfA/Fo2h1/+8LQQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrTIAMx55B7JQFL3j4Hvi4umELUUWGINZwRiei/sBntTvKxqxN
 FcFcNYYO8VzqbJ5ZAVkYO7Kay5k2OtURpPlV6WloHGMshV6fWqQLCf7l
X-Gm-Gg: ASbGncs1AkJWyq6CqCvRN4jVhCkw5ZZAibX3Pb3i/PwAYpDB0vetByTs4t1GXN35hrQ
 PWZ9qEqQNJ8pgILmTq21l8NwmziBTp7AJiMQeqzVroIyX26kJYqGCW/uy8JZvDUTfEAoOFmb8z/
 tnS5GLpdojxh+zfbAoc8hD40opTO34SaXTjnCGAO1JReAaipCdc45rKArQD3c8E241jZMWu7Vqi
 rcXWqLQ5EbsAoV6QxAM3C0KDdCwoKPhe89+1guXOZAUUUBT/jW2xDiQ9MTDXdVW0rUfOIza3q5y
 Hw3gP3Ur6UmvYfCflG8HfH4JsdfmHskzEdoq1Bo2bFxFmMOPd/5dNa8J+UlUOsbw6KN6hhqEBp4
 5ryXBtbMTfjcbu3zFZOjj778He0/B7Z1DsV6xRdU7UFOuEfoQFTF9
X-Google-Smtp-Source: AGHT+IF0nUAxa3ReBaADmdgbTluy0nUpM5l1CqJ7CF4aRQW+mAF+H8dNcq9aeQVegX9bYVkg1XO5gw==
X-Received: by 2002:a05:620a:2905:b0:7ca:df2c:e112 with SMTP id
 af79cd13be357-7d3bc4b8904mr469287285a.45.1749828313083; 
 Fri, 13 Jun 2025 08:25:13 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8eac852sm184655885a.71.2025.06.13.08.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:25:12 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfauth.phl.internal (Postfix) with ESMTP id B68461200043;
 Fri, 13 Jun 2025 11:25:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 11:25:11 -0400
X-ME-Sender: <xms:10JMaOdiZhcyzdY9O-UyB-HYPT4bQ2eExX7BSrCeeVb_lvLYlm5YuQ>
 <xme:10JMaIPCXbrhyhWgzd2KbHv3tqiEgajb8TKENsm-AA05nZMNtwojaMca2R1AEfHoG
 PHK8lHfRad0WPP8Iw>
X-ME-Received: <xmr:10JMaPjb0XgDR_VD9sZev4hdAsMDoQjNbtigy7Ghh-_dV-W9yvAHZM1Hvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
 homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
 lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
 hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
 ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
 pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
 gvlhdrohhrgh
X-ME-Proxy: <xmx:10JMaL_kfhoKrO6X8e3fz52F0wnehq8a6jKkLf17zQC5_DLEj2z-0A>
 <xmx:10JMaKvD4gdM7EQ95ZJZjAv5YReN4IXxytDIypr7FBVye2qNKA75zg>
 <xmx:10JMaCGO40MMjFycUE4eFTeVCmv8MrGVbGoWc57K13ufV-rjUvrk0w>
 <xmx:10JMaJO7nnDgCfmU5iEo8WgGK6AoKvkSkG8oC9hOFgZth1sQ5r7QFQ>
 <xmx:10JMaHO8UP66GCv2E26QOvTPmojbt-HM3WaXjUu0O8N_sb9of3oQwtMv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:25:11 -0400 (EDT)
Date: Fri, 13 Jun 2025 08:25:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aExC1j8WmkJn3Csb@Mac.home>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
 <aErtL6yxLu3Azbsm@tardis.local>
 <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DALGWEM3TD3O.95L77CD6R62S@nvidia.com>
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

On Fri, Jun 13, 2025 at 11:16:10PM +0900, Alexandre Courbot wrote:
[...]
> >> +#[repr(transparent)]
> >> +pub struct PowerOfTwo<T>(T);
> >> +
> >> +macro_rules! power_of_two_impl {
> >> +    ($($t:ty),+) => {
> >> +        $(
> >> +            impl PowerOfTwo<$t> {
> >> +                /// Validates that `v` is a power of two at build-time, and returns it wrapped into
> >> +                /// `PowerOfTwo`.
> >> +                ///
> >> +                /// A build error is triggered if `v` cannot be asserted to be a power of two.
> >> +                ///
> >> +                /// # Examples
> >> +                ///
> >> +                /// ```
> >> +                /// use kernel::num::PowerOfTwo;
> >> +                ///
> >> +                /// let v = PowerOfTwo::<u32>::new(256);
> >> +                /// assert_eq!(v.value(), 256);
> >> +                /// ```
> >> +                #[inline(always)]
> >> +                pub const fn new(v: $t) -> Self {
> >
> > Then this function should be unsafe, because an invalid `v` can create
> > an invalid PowerOfTwo.
> 
> Doesn't the `build_assert` below allow us to keep this method safe,
> since it will fail at build-time if it cannot be asserted that `v` is a
> power of two?
> 

You're right, I misunderstood a bit, so if compiler cannot be sure about
the assertion from build_assert!() it'll still generate a build error,
i.e. even for cases like:

    pub fn my_power_of_two(v: i32) -> PowerOfTwo<i32> {
        PowerOfTwo::new(v)
    }

where `v` is a user input and the value is unknown at the build time.
build_assert!() will trigger.

Regards,
Boqun

> >
> >> +                    build_assert!(v.count_ones() == 1);
> >> +                    Self(v)
> >> +                }
[...]
