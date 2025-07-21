Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F600B0BDCD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9AA10E48B;
	Mon, 21 Jul 2025 07:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fHwUENaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6A510E48B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:37:20 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-237311f5a54so30468085ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753083440; x=1753688240; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AW7C0Fw+OUlttGGnAPG+jvEboZ7WFaopv/dP3AY9iLI=;
 b=fHwUENaUgWO1XyQW2GyiwoyEOnNueXM+AJeFwrXiFLMRiZGQA/4swd2Z9FoDOoKKfB
 BxccmCnT7d9B/NTp0puQLTzmUm59vTFhKbWfxCyp0Vtdc44PvP/RfBA9+YvxizXyp2kI
 r+p5PKMuF0VM77JfmEXGidP2t1cLNjpDDWVyUAFRYTTkUqKVw0BXDv6YwDWOyn4RFsAC
 F3X5cVhFQ6XizI1V7jkI9fznIW0h6qWJOycC7NmHGeiCjnO4nTHKnlAfvWMcDKdMMau9
 k7c64LgL1xTUxLbVewF8J//TfiC5VPtrkG0tgqWT2qONjNINypX2cfgGIiM4aiIB8F26
 yP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753083440; x=1753688240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AW7C0Fw+OUlttGGnAPG+jvEboZ7WFaopv/dP3AY9iLI=;
 b=O6od0fEsGeo8rtYHpzM5HsbNC7GgcGCM3dQmpMr93NY8WEBOCyGTnbHyOsXae1DBm3
 BmGvFGioM6Qdt7K4ZbBeFyMF0YqCimFlu0vn6JsDSVFDe9odtag4gxuN0p2LsInaTwJM
 QlCFyFKuieHTDDBIGZO+oIBMx37RftgmM2y3LOtF0sEu7hN1nLnwHwxvH4kCd+yTpOcw
 BrTPvgcZemyp4uVm/fgtfjQw9RwOLzkQOHF2/j+ylS17XV8sWkIL/XEnoXRrCavq8si1
 mlLM1HvZLwayq+0gW4z1GlKQjuu0PjmJR+88lVZEGvQoxETj7vZQpXOxblekVKeFWq4Z
 whVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiKgilW3ihHHNnSGyTkdemY4O/AwXX9d5ScyZVe8J9h1JoSmhS+BhE2/qYx/KdwBBrZNt/erE01vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvMQiN2N2ctI0sPshfqZhx93EM61YOfhPsOIK3om6bLMnSBGNB
 ReB0c8XUEFztxMeCh8+EJU2xdRmWstO9hwKE+zQ9OEJcK5+VnNLygchc6QGAWgs8pSk=
X-Gm-Gg: ASbGncuiarrueBJKiW9yR5zhzLyeB3suKwZ6+mGhRFSbdD/ATZ5Zwcgi1imzrfro3Uj
 lQ+16mm4VlRubHqusiN0Ak6xCflzWnOWsOmp4FZKpiZjNtgMtkRTUTqEgWXIwJnmAZ5Z9841n7J
 35OKy2ZXCuVFRUXF1FPMpM24cz6Gdoxb7OKF85/H/KV3nbfHwGkxQL62XAKcUkbNICwX6RMOx3K
 QwEbM0IGRjHl+21TWJr0QJha6KR9PE96jnpdIXFuGj8r9P1CZjVQcD5GnlCgfHqC3UpnUY1VSSL
 ejxndqmHks3JMBFw2Bh1kQlUCLiLNlFjMoG0ztyl5tMMjsqtgBX9usw6RxF/c+cccxW2OzekACe
 jmpSZiI0b3q8s8jeCAZ3iUsc=
X-Google-Smtp-Source: AGHT+IFk3DmrxLSOuu1QML7M9aZcW/M1lwjmHi2A/P/8p7kUrsmSSAAA7m474B7f7eHzVA50L8YW7Q==
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id
 d9443c01a7336-23e2576c1bfmr262018575ad.43.1753083440496; 
 Mon, 21 Jul 2025 00:37:20 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60ec88sm52502155ad.65.2025.07.21.00.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 00:37:19 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:07:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`, fix
 clippy::uninlined-format-args
Message-ID: <20250721073717.i6hr4iesfupzvtwf@vireshk-i7>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
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

On 04-07-25, 16:14, Tamir Duberstein wrote:
> Rather than export a macro that delegates to `core::format_args`, simply
> re-export `core::format_args` as `fmt` from the prelude. This exposes
> clippy warnings which were previously obscured by this macro, such as:
> 
>     warning: variables can be used directly in the `format!` string
>       --> ../drivers/cpufreq/rcpufreq_dt.rs:21:43
>        |
>     21 |     let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
>        |                                           ^^^^^^^^^^^^^^^^^^^^^^^
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#uninlined_format_args
>        = note: `-W clippy::uninlined-format-args` implied by `-W clippy::all`
>        = help: to override `-W clippy::all` add `#[allow(clippy::uninlined_format_args)]`
>     help: change this to
>        |
>     21 -     let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
>     21 +     let prop_name = CString::try_from_fmt(fmt!("{name}-supply")).ok()?;
>        |
> 
> Thus fix them in the same commit. This could possibly be fixed in two
> stages, but the diff is small enough (outside of kernel/str.rs) that I
> hope it can taken in a single commit.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +--
>  rust/kernel/opp.rs                |  2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
