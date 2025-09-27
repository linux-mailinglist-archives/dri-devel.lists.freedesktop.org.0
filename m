Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D61BA5FC9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 15:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6967010E1A0;
	Sat, 27 Sep 2025 13:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrH/hUST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A478610E1B3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 13:33:11 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-71b9d805f2fso26265826d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758979990; x=1759584790; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jAJz2iZlVqH7fub6DPlrBF+dlNC7fGvqpAeWouU/7VM=;
 b=JrH/hUSTYvF1q8iPIQUC49gFstatYEead4tEZO7p+77d84yIBcdL2C/fK9L5wOjxtd
 M3DaeN5i5C6ZGGKPC35keL3XCW6WLaL52+4V6fv1exkWD+/ABoygPXIx40ebQQFwe3m+
 WPLfJNULEBHFcekihf4QMHbpcuMq9SlYXPS55mvGxK+mOQdn4V4QAHypgHiOJ+yOF9am
 ukEJkc1PTKgutP2CbK7pvgyFOPlM29Gm04tTPovrV2LcoNXUb8eb5+txyle6OkZ65Nna
 QRLSCXI6ieEW0LMjvFbJH7ULpTUk5oXHXvOdrBAYGeRA4qlvFeeNsneWZPmjqEewFbUX
 LpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758979990; x=1759584790;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jAJz2iZlVqH7fub6DPlrBF+dlNC7fGvqpAeWouU/7VM=;
 b=h+z2+j9KARjWg/cf8hg1S4AK4LZofJovbb92K4IZ3NJJjW2yoTaABhyGfHzmmUGaWH
 dUjP//2bq3nnhD2xA6cfGHPekWMZCWYwYbz2jnKAdeb3iWW2AnQdOlIyfMmlgJvrjydq
 KfgqOnQG0feb89VA5qH6unfgX3BQ3yjwOfNKXS10SXNnlYU4Fac56N5JmbSoiJomgF3w
 /3qneKomR4q+f2TCtPQcnuP5c4r24E00wpt7AQb3iYsMJKtaLCX2BgRnMBRQ0XtZc8vG
 kqE0p/Jtzr7yFQ3g88SiWMIlNRRZ82fmotWKGIdCcQmW8dOB7GJ+e78141INaYCOe6sb
 KIyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOVGBKCrd3c13yzV9dgGg6yAjEurqxUCqn+NCwi6K6sieLP2e2z7ro4iWIlc6NHsnWJGzYjIdcvFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqTBTYB2ZDgvPDG+861UGZtZUYFjra1o0khDNmnGsHoGpT3Q+g
 zWW+BmJbKi1mcMm8qoM2OXyttP9t4ZLwioO1V8JTyqBXiaFMPCTENjLC
X-Gm-Gg: ASbGncvbgA0rPTj3ylGOu/GNB18Lycp1IRqSvnwZmapVRRYfyQ6IaRr4DKG3/aETcmE
 2TWzh4PKGFEeJHG5lqxsrgsz9m/xGRLGQvDtYu3FOATrKHDQJsUFUe+p26iLbsaqhWA6pmSFxdh
 U2KEy9zmKmGvjZ0WBpO4p0DqJrZ6cBXa7dMWR9kUDfFMxOvdi/KGg9Os0YCykqJOUESLyTfJStB
 A4S3BK50fwbVTyJpYsEIizLXJq0CII4zNvG1crK+ztKCXO0bamr1DUf0cRP0FFbBG8p4h59jGhP
 qI3xmKDkQV6VV/iuenvoGaQZJ3jOtpkq4n0s2mvSWEMTsow4cH5f+GTXEk1pjhRKHeR+nJoEtP+
 mH0zghOe1faiexFQilUYrm+Nbu/LQT6DnrHXnw/6B7cVgD9ey4xrW+qZB/9aPld+kONUUAxQH7v
 rhrIEBh2zMCbY4wjNFG3LU22xY7ZAtf8OkFQ==
X-Google-Smtp-Source: AGHT+IGH5UGkTv252dC01JpSDkaJcJ8KfFAosg2KR2cHgR/gkXTKN8Ezxd2HpK6jf4Aw75VWq5kbPQ==
X-Received: by 2002:a05:6214:1301:b0:79a:5e61:b6e7 with SMTP id
 6a1803df08f44-7fc2bc2f235mr148121586d6.17.1758979990313; 
 Sat, 27 Sep 2025 06:33:10 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4db11fc7e33sm41268141cf.51.2025.09.27.06.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 06:33:09 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id E0E02F40066;
 Sat, 27 Sep 2025 09:33:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sat, 27 Sep 2025 09:33:08 -0400
X-ME-Sender: <xms:lOfXaK-F5kwgMw7tlcjOR660qWhqCLrWrAZEe7epHUwd9o-JfImhfQ>
 <xme:lOfXaJeKeS3Xn5-Akgf5PnQayfL0UCcRj32akuvmHJrsFVIOi6RoXygEImaCEDIDs
 FodizH3rP8OG9AiW8mo21ldnIliy9zWjHGum-JJePd4NLv7IVo7>
X-ME-Received: <xmr:lOfXaEmj95r0yOYn4h5v7ABWtbr87idcTFHf5aZzJcHSW2oJnmLCcIBGTulB3ceINcf1FxPwdVPDxPn2_NQAntzVNQpHx5Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdejvdefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtugfgjgesthekrodttddtudenucfhrhhomhepuehoqhhunhcu
 hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
 gvrhhnpedtvefhfeetveeiueethefhhedvieelveeuffetudevueevueekveduheehieff
 ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
 hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
 udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
 gvrdhnrghmvgdpnhgspghrtghpthhtohepfeehpdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopehphhgrshhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
 eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
 lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
 hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehl
 ohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgse
 hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdr
 tghomhdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:lOfXaOgQUiKGJ76g8NZ3aKhHZKRXR7xf4qy4eWoMhRhJJcbnDuEnNg>
 <xmx:lOfXaGolzL_423YlYH3OllI9b70btOBalabRJPBlP9aNbpqsYXS1rA>
 <xmx:lOfXaBR23bkhC3zmGaCIYkInVEKP6yWKxQEt16HtkdLcLxC61_QuUw>
 <xmx:lOfXaBmk8fFkFier3uut9Rv3MypIL-z6K2i5_I21X4JLUoAXwJIKSA>
 <xmx:lOfXaPzq6u9J9Oep9xQ1JEINrLFC0m-OW4emMKoTX6g68CsOPyX8PaPg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Sep 2025 09:33:08 -0400 (EDT)
Date: Sat, 27 Sep 2025 06:33:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>,
 Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aNfnkhXnnxqdfPYz@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
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

On Sat, Sep 27, 2025 at 11:01:38AM +0200, Philipp Stanner wrote:
[..]
> > > ---
> > >  rust/bindings/bindings_helper.h |   1 +
> > >  rust/helpers/dma_fence.c        |  23 ++
> > >  rust/helpers/helpers.c          |   1 +
> > >  rust/helpers/spinlock.c         |   5 +
> > >  rust/kernel/sync.rs             |   2 +
> > >  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++
> > 
> > I missed this part, and I don't think kernel::sync is where dma_fence
> > should be, as kernel::sync is mostly for the basic synchronization
> > between threads/irqs. dma_fence is probably better to be grouped with
> > dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
> > 
> > rust/kernel/dma.rs
> > rust/kernel/dma/dma_buf.rs
> > rust/kernel/dma/dma_fence.rs
> > 
> > Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
> 
> @Christian König's opinion would be valuable, too.
> 
> I'm not super convinced of that because dma_fence has not really much
> to do with DMA. They're not very different from completions and are a
> mechanism to synchronize consumers and producers.
> 
> Actually, before f54d1867005c3 they were just called "fence" and then
> renamed to "dma_fence" because someone wanted that name.
> 

Well, dma-fence.c lives in drivers/dma-buf/, and IIUC it will only be
built in CONFIG_DMA_SHARED_BUFFER is selected. They are enough evidences
to show that dma_fence is not considered as a general fence. Of course,
the implementation of dma_fence may not be tied to any DMA
functionality, but before we make it a general fence in Rust, we need to
at least change it in C as well.

Regards,
Boqun

> 
> Anyways, I don't have strong objections and mostly care about having
> them available somewhere.
> 
> P.
> 
> > 
> > Regards,
> > Boqun
> > 
> > >  6 files changed, 420 insertions(+)
> > >  create mode 100644 rust/helpers/dma_fence.c
> > >  create mode 100644 rust/kernel/sync/dma_fence.rs
> > > 
> > [...]
> 
