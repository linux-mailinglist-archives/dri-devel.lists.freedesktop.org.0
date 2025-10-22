Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98B8BF9B63
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 04:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB98210E0B9;
	Wed, 22 Oct 2025 02:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a7aK/hGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ABA10E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:27:01 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7835321bc98so5664443b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761100021; x=1761704821; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
 b=a7aK/hGO7jRf4cT4ya3bDOKqQYJOh53g7ktCi0bWKmwt/XukgxIf2bSzewynVA8leo
 iuzaa7WB+OtcQSTFecxr5Yc0GtEl/NlZvn8P1vuUAWfD3LexRLrUt4bBJeYBJ5uF7j3F
 QzqWXi2gDlCTDc+7gWaa3wfinqQEz1zfuayz+Ld3lAda5AgQDpt89M94GlFC6gQIa1m9
 IWGMqsHovC4Ip7sou9Xw4mcGDVq1QX/no48jVAySw4/9bZ5ZdzNBv4kXeFCYSj7ooaMK
 WcX0Nb1fT2AyZs0cPSdImkUKEros8rYIdsb5qcRH+gxhvdJKM9KcVM7ZAC0y5iAZS7Uu
 qqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761100021; x=1761704821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
 b=uF7Za+eVNkwMXjRZtOvI8LBN0UjtEo7HWCC5oZ5jBLVegrx0c6BjOf76YocRUVZQS7
 yKw/SPAbEbMoTXVKyOKkadAl1uTFZB2/ijYQcP86op+o7htEz16v27f0kcyMXN2f938Y
 TT+V5yIZ+DRgFh5SJRAskY5NIVQbF6iJ1wu0DCpnRj1zTO8dL5ovwHme1A14WaezkPtU
 KMrOW/j7JwGFmITa9s6zrtxSxcCasVFfysNprj8WeXMgyOcpi0aWbth1JghdW3PYnHKe
 Vav3aS2ZSSsZ2DgqmMy+ca/xF1wwhzYp0qxXRemZKrGMassHEZ88yql2Z/YTscCLDUB2
 1Dpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmVf+3Ok0AbrznLH/cU/d28wCLPM89VbhXqYq6yGeudde+fQVgdpeDM3Ox8rZKXbduD33fmdeYDyM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxuduvuPEiUov6fC650l0vZGALobXPEkTijxL04VRIDb3svoYU
 OJR0RyHF3ngIiqmCsSCn1J82JdRIae8n6WXiUeAZirmOc7GMJv2mTU/dU/oX3MYEmOI=
X-Gm-Gg: ASbGnctl4i9u0o/81OXv2DMmUfmNPD9TG8cyd3uXaQL/QSOdwzINXvqQg+Z3XF7HM8a
 SRLHR8j+Nyr64LxJL8YRtxdiKwiIqC4Od9fbJIwRm5ZlC9RhOmzOiC/WjwUxggU/+JOabbkOYxB
 GfmJII9jWuaE9mhG4cfenHMv6LBGRjE3rXt1np/iu1iZk1YXCwfUgkXFfCiG/lriYVhiLZXyzs5
 d+e8DpAb2/eEVYMFvt5K6Mk7tT6UCHmz7kSD0CBsZ4y9zpJy0s5Nz0M/Pl6OoD+3/gCt3M+jVY5
 ixharj6UQtCRSZcHDFlX16gt43cdA7sFn3VzWe0gSoK5wwcwKmeyFD/v4UsHCqxvJWaaXaJ8rmu
 exm+86HEW8Y2/j7YELa/S39pnJB7YQKL9XgHhLul12nbPRSSEsK31mElHOIzL8H4Euob8x7qukx
 Vmbw==
X-Google-Smtp-Source: AGHT+IEiODVZTmpBKH4GJGfRgQpdF+p0v4t2QcX4SapXa+98D5HxqE/HG1opMUzT/b2Bq6W9RKZPmQ==
X-Received: by 2002:a05:6a00:2e1f:b0:781:171f:df6f with SMTP id
 d2e1a72fcca58-7a220b14d80mr26349244b3a.18.1761100020948; 
 Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Received: from localhost ([122.172.87.183]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23011088fsm12778187b3a.65.2025.10.21.19.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:56:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
Message-ID: <75keuxnrpd2p2lumgmoxpwt42ovsx4xyltq3dimarvlspjq3gn@cmadekc427tk>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
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

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
