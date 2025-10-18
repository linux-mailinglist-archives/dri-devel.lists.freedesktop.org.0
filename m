Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD9BEDA35
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 21:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90B10E1F3;
	Sat, 18 Oct 2025 19:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D2u+hSuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A5810E1F3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 19:25:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-290dc630a04so2954395ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760815505; x=1761420305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
 b=D2u+hSuUMjSZEX7sv2OieXyZp/+bRVPNN3q8rmjG9aed6eaVeq5nPUcNo1fwtUedl4
 0xieBbotEwzEd7udzlyJxG9q/kNfjG3KFOR14k/4QeUxPFfpbJOoIVX8oXFkcQbnzTcI
 h3N533E+fO4+oOdDvKOmkB+VfxVSTxoRihd5Vner+ol7qXfRi5azD8XpV9NOzCe8GBKY
 zX5+HOxjg47uKhi3kRcgtAs9shnz8rZJlhUkBbZJVHq5ZeCNsatvqT3pBPbHeVvVoYcN
 t6BWsc4ElpzVSyza8V7qvTgdWyu2NlWVOiiLUqnQEM2Mpkh/ZY/3DllxsnxESaBS0lGV
 wd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760815505; x=1761420305;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXwxLtFHklVqMldstrW5nXmaQWoQkEu+q+HBHCmmMZA=;
 b=PuRuS2n0ylgVR5XhH2h/lhnda4h+qie+tDJbO6gY8geomNdSCZ7U9LCDqCBR+FSb2B
 7V2BpirA5TRhbTuzxsGP0YilEdI4Ltg2lla+NaVwmPhmmRMJm7DACm7WOygbs/SxcnQH
 p9ME04PIrFgsO7pZrdUuhkRb7toOW4G9wmkkL3C+mXKcgQNyWxASANHH8Rr8xEX2h7Bi
 Vm2JiPTAociQk+V2MsmSOIxW5NRoWZ2cTgAzQ98Tp316LBPjF/LZViZ4g0Nr0SwUm151
 3H+CrF77Ts1Sfd8NRcazXOtSU6eMbqt9QvHlAcMpaMTPTBo8G5/jeFUO3miAzYMRCW3p
 rgeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc329ZqEZ3YrxA7QRgQhVAq5gtvYxzAmF/DB3S/AzyRUYYJ2XPJV7LVFf761Wqp5bClz/ICSeKHXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZl3HyDHIIYzXJm4ygxACcf+Zdwn0+Goi+sJH6OgEIaeBT63Rw
 oZE2KbXtGAtCPImaSahBKyrvFF6K224RAUf8/uMGWUHNFpus86fdrAhCkdrMyVwQDYasg2TJYNR
 1tcsojKkx5LYRSUbH0XINgCYdN7wCq40=
X-Gm-Gg: ASbGncsB4WlqBLjBr/neyaDXBPCA3254JIPAP0PKyaW2q+KcHV2Kt7m5aEr4Th5Y70I
 YlUHYmUgVrMVGuwN41jlB1vROi1VvL5apB7IUOL08sPXnt+dCoV/1pA/3DPdMKPl7mSgKzFyrD2
 icrpRMAHkMwYBGYHhHShORxDpB0pGDl54Z71L8sPGJ0qKIyICgPsJpJ8AxTg8ja09LP6v/2f3Bt
 SMUqP+uF3cB8Oj5bslzEAqrVdTCkkA1TX1hSQSyuwRBYrIZjUWpklEnlPHGLtSVNNnhH9+t/E7w
 2IH322ZBpNu7aZS7LJKtpzxscUFEyf9/kaDphw9+vitpD1QBNpqvSIKdU6jzZhIaP8iB3ubfacX
 n+kc=
X-Google-Smtp-Source: AGHT+IFynbxdq4PbDoeu2y7E7pruyAv8MSoOFKgcS5qR5uKUe2l/9/1aikoejnUdjk1VE9ieyNLSjxDynifGmomPS5w=
X-Received: by 2002:a17:902:f550:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-290c9cfec04mr58829965ad.4.1760815505098; Sat, 18 Oct 2025
 12:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Oct 2025 21:24:52 +0200
X-Gm-Features: AS18NWDWZ6CTzqAcsRkSpKjdzes4UGFhB9PPk5gEXsERGZ6zM8JBbanNnhdHiYY
Message-ID: <CANiq72n8m0JKjJMZ8Nk8B=GG5kcsSuc2YKp4=r2XJJgREoZZkw@mail.gmail.com>
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

Thanks for trying the kernel.org account -- it seems it worked!

No more throttling to deal with anymore :)

Cheers,
Miguel
