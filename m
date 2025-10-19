Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539AEBEEE70
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 01:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015ED10E20D;
	Sun, 19 Oct 2025 23:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/EtTsGZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D18010E20D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 23:04:18 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-339d7c401d8so968049a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 16:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760915058; x=1761519858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOEeh6O4RXrjCbdM/YQb/OmkajAlxiTKW4cEYv2MTfU=;
 b=Z/EtTsGZSiC5WvFr+tB49ZCYKsz6jnKgq7AzEb49lqIAd/+nyMVY0k11FgqQKrDYcr
 NEUVdGCjd+0jM6wL8EyOyt+hNYwRs39obR0K8WKnoFJ0je/ynSfVBd9rPbUCq2xLNczF
 SlrfpQtdonYN6arf1LuSKm1iY0IbbS0sLN7N63EvRhTr/uOAri3SKtDFprDYd1d1vY9I
 kALEt0EUU65s5k36qPxUEJb52eL6agVA3zq3TgTJNql2tpA6Ntg+VKUFEZO5BGdVop5t
 cWyvPI6h3slTOiubcU43BxkGUA3785iVfIyVZ2w78KjcH4jV0aMPUeyA9CQXjKUx++9K
 vmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760915058; x=1761519858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOEeh6O4RXrjCbdM/YQb/OmkajAlxiTKW4cEYv2MTfU=;
 b=QY7MriF9DoTezm+xAk2w7W+abgjX9NnOZGixSMvgorsLtJBCPpVjs8Mqcrgq+Sn/kZ
 HbXfgdO3sREybz0erkttCm76YNbGm230JU3+cqEmlvJ69ZqQzGUDIY6GYesXOHGWAXiI
 JE9T2ct81m65hsCGVOD5yRJ+zmTcDwkY9wS2UGtmZcEJfIQ9fhqxqJVBgq767jSlDgCn
 ZxvG+OMe8NOXuRzu/k4P1TKlqPpdLM/dRMZf+4GqbgFyvUzxsSYVwKRP9qb9YtZ/bPhg
 L6WFxcG2trhqB4eWc9oZPK2FOyNOn9yyJap+LjyQENq2YI10mnLN42H/5GIrOD6exOsE
 uy8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ+6j6/z+WQQNooxJD7FagWXbD+GXNtwPGmxXWIvdZgWTR0z/2Bz6VbqWerwUJ/lxs6V8iKbaN3kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgY5PpObje8pr7TmpExmljfWpPx9crd1bKo04X6n0cVXBtKZNd
 j7yP+RrbFBuZ3Uc16mP9O0SLKXjpwHSr3hT/RCxLM5PBvQ83Js99OGeiq3VUKGLfsnIZ94j/9Kv
 8JdjrGGa3jTLJaoKpuzdfKctKyl8tt24=
X-Gm-Gg: ASbGnct8vqJrWlHBT2Mzooq2dhVcCSuBrGgVTKu6EF5aaXOhBOWW0PpbF1D4lNoZ/pG
 6IHYFfrReN5uPIVhNODCGKjH4iWeSZcCUL8D3xqO/ULbHqpD8orAbwLUM9ADh3RByLugibXo2FB
 4URZF50LTmpbRQ5ELs/J9xJ21LzjCTA+/1rnQciO6aVbyQtvgTl4E+Pqxj/uua6N98rK4EUsMmI
 faT64Jdpqzhp2Q3zszGFE3Wh7mjwozCE3nmHurNTggAZDbFQt2Z5rwgXJebVibZmRpzyTvTmE6O
 2i+u0N46PJiuf+jbzCVtzYlBrUBwuSoGuWtS5CWVMr9NR5bw2Yx7+TwU9PsCyofKM43S05xS406
 oKpKV4q264WtYYw==
X-Google-Smtp-Source: AGHT+IEHoe7IdB8Fn4blPj1kZr2k1PDvwkLeFqEjMadUT99xbKyU7kwS9dgklhgQJkFrx7iKJ+XmLkdzgYdk7hZ0y1w=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr74335675ad.3.1760915057866; Sun, 19 Oct 2025
 16:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 01:04:05 +0200
X-Gm-Features: AS18NWBk6jlJf0RifcBoOPS6BkMb0c8T8AQmrZIWVCq_Mep36ZL7bfRUqV3fx64
Message-ID: <CANiq72moW2VULd6EMQe9X4d1S+ftOG4Mcpp2_+V6zG7xVXj+qg@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 00/16] rust: replace kernel::str::CStr w/
 core::ffi::CStr
To: Tamir Duberstein <tamird@kernel.org>
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
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
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
 Tamir Duberstein <tamird@gmail.com>, Matthew Maurer <mmaurer@google.com>
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

On Sat, Oct 18, 2025 at 9:16=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> have omitted Co-authored tags, as the end result is quite different.
>
> This series is intended to be taken through rust-next. The final patch
> in the series requires some other subsystems' `Acked-by`s:
> - drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
>   look?
> - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
> - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
>
> Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vador=
ovsky@protonmail.com/t/#u [0]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1075
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Tentatively applied to see how it goes in linux-next, but I will
rebase for -rc2, so tags are very welcome!

    [ Move safety comment below to support older Clippy. - Miguel ]

I included the additional patch I just sent. In addition, there is a
`>` typo on the `Deref` commits -- I didn't fix it to avoid adding a
note everywhere.

Thanks everyone!

Cheers,
Miguel
