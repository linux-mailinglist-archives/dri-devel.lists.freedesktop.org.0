Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4EBEED64
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2624610E228;
	Sun, 19 Oct 2025 21:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DwsLCwi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4CC10E228
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:27:15 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-33badfbd87aso900157a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760909235; x=1761514035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
 b=DwsLCwi64r5X1lLsuAZtatWOrclj7LECrtySJZZNuEN7phvEOZ+xevaxYKAf+SBIBg
 8obFmd7ZJqhKs4v8YrPVKceJ0bKt/wPhSw/yM3AP86Ud5UxB+Dkmow+vW7BnX+X/Ez23
 JOMo7J21GjTd7RqU1UUqeXawddSaq+InQ2RQJImxkKt3EFc4npdRdtjf0J08UjmaDnyN
 REzXOLZWRqh4YuGoBCktnsghNgAroR2mFky+IVafxtubnMYHv/XQbyDtQxcUfaHs6pYc
 mj6EcceHnHQYTu0rkCfJerIBf/bxqTa8FkHiOMC5WIWCNA2RKw2LkyHCnuZEevDEDDcn
 4iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760909235; x=1761514035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
 b=hCf0NgoJIW7bW07MOnAAkPgrNe4j+u0WwebY1HHiI8t8yzeC2A1/YfdIE5hb+iNTOK
 DWHQ1BFJ0gspfyH+5ySXBT3tmA8J63YiZwRa2tfBUnkJwNQXlaDgOuMtWmCk2hxBDRh5
 pcaR/PdYGJCZtaN9qRS97ZuJgJWDfouhq8IrnYhIRQLlAECfoKWc+GNXVPEK9eUlERtm
 jt9Y7/UFMI+SMIP5NG1gDbbBYkg78DVm6G+NClNygKulBNoYb+QEq8mxxagC/+sYyYqy
 AFFeafcJjGyzTN2LxQ4uPbBHFMWVjnd7ndaoOHdLUWqwh6K0t9vsJiaiPpl5V6F1lE/6
 Z+VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxmluHf6QBdWv1zSuOdMmpisRoe4k8k4eiggiSnZH655gmKn7MWWWy9tVqs5Euav5LWQHxKRIWh6A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzNTh9ABVZ0o/q2y75XN7a3FmqShdTcYsPapUjyeghaHwEGjuC
 spWvEA+mBH/jFIC9x2Wv01RMcjMlmrwe7bEwYYd5qPYX0IrwV8IRb2ud8NIb9PlwEuiT5MtQFJw
 ih3J+UnUjDaMusKkpBCICBRqrB8Y1Ydc=
X-Gm-Gg: ASbGncuuBZTw/BvRm8x+ptFX27/OQix2OZaYvL5b3aIDWTg8u8emrbcMKB1fLr96v1R
 FDA3dEJ5APYHq6h+f0fyZcgWFmHXWGm+9hxd8izybHb96Rv7ozLbu754FgXSXKAV3JAR7Bu2lZb
 2GtQkR1h2b0PQ3R0z+lr8onGYh1zY0ToSIyHS+BSDakKFJcSnRg2b3x8pAlqu4qFyIF9qa079jp
 e53ICaYe4oQPUV0YRJgp4eBo0Iowfuf9+W+WxzQTJWIXCLDsSlilapCnM+apNq5FRmkr5QVxeSr
 z13HybjHRZ8brsnCwvra32IoRaL3HGX/3uR1CK2GvA3c3DmIWOrJ95knJGSGxFrhaYmCibCSX/s
 kuknJW6OttbbMpg==
X-Google-Smtp-Source: AGHT+IF1VFFJwy8ygSX6eoBXAmkQpi5ZSm3xG9mAwnAEV9eBFnYF+NCv7z0G4tbtRrIxdCU8CTeu9qRXC9i913/SiXw=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr71823605ad.7.1760909234948; Sun, 19 Oct 2025
 14:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:27:02 +0200
X-Gm-Features: AS18NWD3K-E_pn_Z0H-XvvQwoMFJQoy6QnxlKg55_WYP1vw1bB7QYmn04Fruiws
Message-ID: <CANiq72nTRAW17RRKHjdfmy-HQk+31vEHyksOs8XGZZKBY=54EQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
 Tamir Duberstein <tamird@gmail.com>
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

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Viresh, Nishanth, Stephen: I will apply this since it would be nice to
try to get the flag day patch in this series finally done -- please
shout if you have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
