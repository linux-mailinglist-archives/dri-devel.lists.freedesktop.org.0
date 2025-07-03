Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A797CAF83D2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CC710E1DD;
	Thu,  3 Jul 2025 22:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bwcgBWSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E7510E1DD;
 Thu,  3 Jul 2025 22:46:30 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-32aabfd3813so4214241fa.3; 
 Thu, 03 Jul 2025 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751582789; x=1752187589; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ89OCdtlbGh5+E9e/L5GelOcn+S1I4YLQnLaEx1cYY=;
 b=bwcgBWSda92jcRdxiSvda0mSJ8+P/mmPDXAeb70/0OAT0cfJPq+wEtlesQCTubjseA
 3gZtw098w6Hqg7kA3eoZYM9GzsdvUR/BLJVPSyRVBv+FCrisWTCJeaSUFtK7MBJrmavn
 9e7nEOVuT7rr9rYDUyG3lkcWFAQS3fT8GiLmjHSR3/skjwo2eZn+H6ZTadZUJcZDWoqU
 WLHDJ1LgBo0IHZ20ZVB7GwiJ8Yrk1SMj0LelHrApQBzbnT0naRWdMuiNz2PwAuDBI3vl
 VZuKVDKI1G0EVnslbYJfrFxy7RFdUHhku15v/z+L/ssU9g0C2XoTIx65AvF6d2fNRtjL
 2S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751582789; x=1752187589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQ89OCdtlbGh5+E9e/L5GelOcn+S1I4YLQnLaEx1cYY=;
 b=F1XQCFb1oVnKOvHan/yd4WToW/36mJFxbxBrVO682r/DqddHqTLmqlLtfIa3zH0zbJ
 FGXYSzeGOCskSOBWHNMk6bov9sGOcnKZ65h0cikwAdX1B5QWAetXJjfkU5sNoSbGPTxX
 TuqkOU1N7wY5HvG55Xqvc+bhzVZZsbMR3cY6WndI5kqDQEfqBtYrytHcMxeBlnPOvPkp
 MQKMkgQp9TWTV5N3LHbWwOH7M6XR9RJn0erZSX/Xq/Luo13lOuDrmVf7tsekcSR6u2lr
 ot5Ie1b7WIeVxQpm8K6Zg9CVWlMvv+2vZd7LkkObdEUJxiAgfuIvR3ucJqhWkxMN+owO
 nDbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/8fFKQcdVHaIBJ2lJDPpKP/nUc3euU4hMEioROZBYiagnMUBbrejOdYzsGxfyOYWmX+hj5gvujgA=@lists.freedesktop.org,
 AJvYcCVYKU8pcxeODvyKicjjAW9NIjishiGvZcwQHEJfs8f07/coTU8/MlrT+agMz1wSU9znTkbH+KBnAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVUmLr0uXYmvlwwW0ntTXB2mLwHDWRQdkfrZBJXgMEaOJG6YM3
 kB/fUm0sp1MtEvl7+CQ1JE5ZIAOkSPQJpR/2nYw+zyN7Gg71lp2Z+ACT4WMqgzIsbuReiZyrbJi
 8Ko/fmN3lkCTmgD/vnRRvHdxSDJhi8Ro=
X-Gm-Gg: ASbGncvKl7ifxVk1DNDYuxapGz6LsY1Y1P8esXAFhdeEJTdMS+LSYY9c8/DVS1Hj5/5
 PF3Vzmkyza56zqe77ZRjZfb6DPfx2AANmllqqsONnZ8icfBj59cGRLU+n0UDkLgbeBMpaYZuF9r
 6VxTCmzwiG19hOqWfaQsK0Qywl1BEHMfzlhMO5REaYSVmkzjjDvKPNzo/PV4OFD8l1eN2QH83/G
 ACEBg==
X-Google-Smtp-Source: AGHT+IEl+sPP1B8mCxMl52InEsjqgDrQhGFgZ4gKQQCtMPmYktkmfkeMhqG8tc4KCe8e7E7L2nh/1DkqsMZO1oU3bHY=
X-Received: by 2002:a05:651c:4013:b0:32a:7856:7412 with SMTP id
 38308e7fff4ca-32e5f617942mr529651fa.27.1751582788733; Thu, 03 Jul 2025
 15:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com>
 <20250701-cstr-core-v13-2-29f7d3eb97a6@gmail.com>
 <DB2BDSN1JH51.14ZZPETJORBC6@kernel.org>
 <CAJ-ks9nC=AyBPXRY3nJ0NuZvjFskzMcOkVNrBEfXD2hZ5uRntQ@mail.gmail.com>
 <DB2IJ9HBIM0W.3N0JVGKX558QI@kernel.org>
 <CAJ-ks9nF5+m+_bn0Pzi9yU0pw0TyN7Fs4x--mQ4ygyHz4A6hzg@mail.gmail.com>
 <34c00dfa-8302-45ee-8d80-58b97a08e52e@lunn.ch>
 <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
In-Reply-To: <CANiq72ksOG10vc36UDdBytsM-LT7PdgjcZ9B0dkqSETH6a0ezA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 3 Jul 2025 18:45:52 -0400
X-Gm-Features: Ac12FXzLoSh37LekSqc1NAd_zq6FaEAH_wUVbUZ0bDWsTpL5vqgS5iCX-O9_oZo
Message-ID: <CAJ-ks9mkC3ncTeTiJo54p2nAgoBgTKdRsAwEEwZE2CtwbAS7BA@mail.gmail.com>
Subject: Re: [PATCH v13 2/5] rust: support formatting of foreign types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Benno Lossin <lossin@kernel.org>, 
 Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, llvm@lists.linux.dev, 
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, 
 linux-block@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 3, 2025 at 5:38=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jul 3, 2025 at 11:28=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > A small patch tends to be more obviously correct than a big patch. The
> > commit message is more focused and helpful because it refers to a
> > small chunk of code. Because the commit message is more focused, it
> > can answer questions reviewers might ask, before they ask them. If i
>
> Yeah, also better for smaller reverts, as well as typically easier to
> backport if needed, etc.

I appreciate that this advice is well-intentioned, thank you. I agree
that all things being equal, small changes are better. In this
particular case, there are specific downsides to splitting for its own
sake which I tried to explain in previous replies: splitting the proc
macro from the rest of the machinery risks forcing a reviewer to
assess a chunk of code without seeing how it is used; in my experience
this limits the scope of the review. Splitting by subsystem has other
downsides, which I attempted to enumerate in my reply to Benno in the
other fork of this discussion (let's discuss those there, please).

There's also a tactical question about splitting by subsystem: are
there any tools that would assist in doing this, or is it a matter of
manually consulting MAINTAINERS to figure out file groupings?
