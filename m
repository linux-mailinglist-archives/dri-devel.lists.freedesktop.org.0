Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A566DBF9E29
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 05:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7C810E696;
	Wed, 22 Oct 2025 03:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VAYegrEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D7C10E69E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 03:57:20 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3327f8ed081so7693786a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 20:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761105440; x=1761710240; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eJJGHuWNBUYeZe+bCjnWrKJ6vdZrDU3vtt+RVJeuIe8=;
 b=VAYegrExcAnNfggJYO+glauOQWa7RtxiBGbE3YMRUXoQLQaWDjYeauLsS/Uf7TYSfV
 FW/ewiy+5bqIa28vHU6fIYYNo3Qwf0VAsh1IuBoReV5SpBxJ9O2372toXl6h2gf25rR0
 G4QZjskl02sqEjW+KoydhehVe7rpFExdlJQNFwPXoiHLG8ltc28Aqj1UJkpo5O4/ysbV
 ft9DPVZME6sdMr07k+/Za0BaMFIhDeFKc0Zr5EzN208DCoq+fuKpZiSpju3fuu2pU4SZ
 oOCzGF68dBEKxexOmCpMPd22yoY42MPoTFIVS0O+LS9r/d9Hku/wbvKi7TAwNr80EYjh
 QgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761105440; x=1761710240;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJJGHuWNBUYeZe+bCjnWrKJ6vdZrDU3vtt+RVJeuIe8=;
 b=SXWIB2qlzkRx1nhB+6ILg7vbRaQQQ/O9QC4COGbTbmgTDZ4rQ2zbDZA70vmQfZVL4+
 lOIhZcQ5PaRhpZQfeDe8dB6+91J68w6ebhN2tePfarIjBw2zGHfYr2v+T3UL1+7yyGSK
 1CdcmcnXOCaox/UJ0pjytEC2bBCgoxyVO1gLTPkQzjuPk3tAUW0p/yksqfwNvNI4wSaQ
 fhhphvxvohxXhnco1FsIZzFi0AJ87yHvVD8wrRs6xZXDiWz56GmcNylrb14l6N8MwwhP
 B7FOnAUzbb3pZmFAmuLTHP9FroMfRenqyrYDFUD/oDGMRWT229mDEjv7UurhZqcwPr2D
 Furg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1s7o/FOGBFmh0+MzuVnOKxHJ0iiiUAqsFRntemsoB4SYy46rumKFRUC+1ASkuPzcQxk+Sfi//UOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBM5cjNr08WYLd94rI3cuc/ldRVOp9GxCXxm7Y17it4k47Agf8
 vfm6yq9tXkDCgu6iROX/6k9/JF46kSEAGL2q2HY2pGBLJRmmnIEbFaIJbdTp3yQgJbU=
X-Gm-Gg: ASbGncu8hCq2jfh8KT+zbhYL3KBKt0pabeDeGBYf02NhpeEy5gr4PCBYEjy9L0akJFc
 3Sl2mzApxglMUrpwgUEi5toIiDasGdvyR/NNUu6cEetFh/9j6TbU+bMvU71UNp5hT7co8WrgYXQ
 5LSi03ckE2yQ5FeFvItzT2CyQC8ChGcticrooRMzkB+lz3d7OhK5GnUGZUgPA6GWmj1t7QvnlC2
 Z0GfvoLNZQ5fukVao7ZZe1rIpBjQC6ikBWJhST/RUZo7sn0TiCD5H98XmJQWekG6pmdOe/tE1Ri
 UtiI4xSfB8fpzTnYmHyJXVcGYMvAadz8srFBdp8mE1b4lt7eKHl+KSjlForNASS/0B9VjW/ZRYT
 heZ73TwZoY2ehjfEg/VB/cR9nqOyGJiROU/KcQGgx78K23OPGXn80b4IvwNYBSXwrv4J+BlU/ai
 71tQ==
X-Google-Smtp-Source: AGHT+IElJYs5hS03PBXdQxnYWI3VpdFMd3uudSGQGvl+AqJvx2HQM7kb+KxG1SNdziFnaV4FdnABlg==
X-Received: by 2002:a17:90a:ec8b:b0:32e:9a24:2df9 with SMTP id
 98e67ed59e1d1-33bcf86c09emr22277403a91.14.1761105439473; 
 Tue, 21 Oct 2025 20:57:19 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33e223c7fb5sm1164284a91.2.2025.10.21.20.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 20:57:18 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:27:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>,
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 llvm@lists.linux.dev, Tamir Duberstein <tamird@gmail.com>
Subject: Re: [RESEND PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <4cweppdfmaei5isgmfg575eikx2qycjl457iggips2reuk247n@o242mrr5ghiy>
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
 <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
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

On 19-10-25, 23:25, Miguel Ojeda wrote:
> On Sat, Oct 18, 2025 at 9:17 PM Tamir Duberstein <tamird@kernel.org> wrote:
> >
> > From: Tamir Duberstein <tamird@gmail.com>
> >
> > Correct the spelling of "CString" to make the link work.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> 
> It is private, but it is good to have this done so that eventually we
> can potentially enable a runtime toggle for private docs.
> 
> However, this is independent of the series, so I would suggest that
> Viresh et al. apply it independently.
> 
> Fixes: ce32e2d47ce6 ("rust: opp: Add abstractions for the
> configuration options")

Applied. Thanks.

-- 
viresh
