Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F221CADFD4F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E3410E99D;
	Thu, 19 Jun 2025 05:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pyt+hxED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2810E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:54:17 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b31d8dd18cbso499367a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 22:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750312456; x=1750917256; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
 b=pyt+hxED4/HoDsp6vP4EohohWfK5T54pBNU4vBIQYvcOzySI9nXcLV9GewRYeIlxMP
 nDbd6FtPCBNR73djvhy/Fao0s8532i/rRSQPrfcInyNOMCCLCvs2z1tNSRw6cAVpgdgB
 kjGxfJlDc2mPbhvVaq4uMXY6/I3FqfNnL1vVrL7Orsj0YNXWPKikuIwVLoUFElYTHwRu
 3ji2vNEI+wGtQvqoFOknXLgxDDmjHk5gdQwAgn9yWz1vAG1roipFwam/lY8H2QooAQa7
 wRg2QPWGHvRTq1v0kR4nhC4DBlmWEZOJNzPuTKcZ2YPTgMBt8ZSLfO0eq54g7EoTV4EJ
 ewHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750312456; x=1750917256;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mNX8x8v1rA4gsmPSGKn+LRzfhgT9AcyvzOiTf8D9D0s=;
 b=orqEGmHt4RpBROH2C+ysxtAyynk7msm1QvysbNbB5CeQpcNQ1s01+H4b25K3fP0tqa
 7irKksMItigZcUqC38y51AGByy3NlnwPwLfrsFhUFhd2SiHstXg6FV3XTaL+Rb9K9G/X
 9BOVjFgcJ5qw1ell3CW93CtOhaM6lwG+J0yKiZD7sQM31VEZrWl7qtNv2HzDslqRuWvp
 XXAdGlIg1dlxZyxST9XTdsKxOWXBWt2r6bF9wKGjBAAEbwtZijEUpHG5QE7sQ5QYDp1e
 Yg9vk+NUTR8XP1IE/CbQAV8ULXHP1xutNnewivSs8h5Y+CMaqrqDVZU05bZ5KDzgRy/v
 KU1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9+68JnyVVSuENTqFu4Lx92keNPaGJy7U4YVnvsYf3YbDTWNR5fLeZLGoQ3i6tnvv6exH7xhTAHuo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOHgUQDnZ9yhTzmZ0+rciVKCRZXJn6TUJfPEZz0R7YrAKHtd4X
 u+eliuDmiVvpT6xk+MiLk6IoIgXoZV5n+7IoCSr9BRpss7CpPIfBC4GNg+gG+5bJUVg=
X-Gm-Gg: ASbGncsLy7nurXbUlLptMVyBx3ip9hnfQLAFO56yHs+avXEr/whNB1qq7VQM7O9pV8F
 bVnJVrTaHPTgtZ/NbINXQ5AljxMnqWxUzUtWmOjbPscMgcMceXsWLFb/i6WzNOUiSsWC/T31sXH
 AgymDfW45pvZEqNR42lEdV9bdCryGT5bo7vkkRMieZjfRyL77VNXtHZ//PRpJwSYk4J0ncET4Hg
 5tqhbz8kNkDeHYWvK2VcDj46h07t4sfsTN7k/ZWYf6R3pTNlDaQWvC7EBGc5QUGiaVh+LW5OSiH
 JQsdOFUcPgSFDnpInRMWCbn73abojltdcOHKwHyzTcdFliAPJx+gy4zF/lgqjVE=
X-Google-Smtp-Source: AGHT+IHpBy809k4j/mgtJ3pLZAei1vSVsYHbL1LodLYl1qhBrEB6gEr4Vdl8NOXI+5UF/UVojJEPMQ==
X-Received: by 2002:a05:6a21:8dc3:b0:21a:ede2:2ea3 with SMTP id
 adf61e73a8af0-21fbd4d2985mr27026444637.17.1750312442235; 
 Wed, 18 Jun 2025 22:54:02 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b04e4sm12287505b3a.121.2025.06.18.22.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 22:54:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:23:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Benno Lossin <lossin@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Breno Leitao <leitao@debian.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
Message-ID: <20250619055359.tormmysgxxcper6q@vireshk-i7>
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
 <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mfjzXj0f4PKPKg7QgbOrhay4CF_+TBgScecKWO6acmyQ@mail.gmail.com>
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

On 18-06-25, 18:48, Miguel Ojeda wrote:
> On Sun, Jun 15, 2025 at 10:55 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > Apply these changes and enable the lint -- no functional change
> > intended.
> 
> We need one more for `opp` [1] -- Viresh: I can do it on apply, unless
> you disagree.

Please do. Thanks.

> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index a566fc3e7dcb..bc82a85ca883 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -92,7 +92,7 @@ fn to_c_str_array(names: &[CString]) ->
> Result<KVec<*const u8>> {
>      let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
> 
>      for name in names.iter() {
> -        list.push(name.as_ptr() as _, GFP_KERNEL)?;
> +        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
>      }
> 
>      list.push(ptr::null(), GFP_KERNEL)?;

For cpufreq/opp:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
