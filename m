Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E240BEED3D
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6103B10E226;
	Sun, 19 Oct 2025 21:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M7dtdGR5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33010E226
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:26:08 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-33bb66c96a1so1048987a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760909168; x=1761513968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
 b=M7dtdGR5QmSm/efH0u/l8R8K6vu9ptnat0cNtmd3Z9qRm0xeffXUHMSpJeAm2uelaM
 Q5o8Z5HhaTQWipmZALOqfOZuoKkQ7+/W3gWSV2xw4ui6mKLlUdQ67+jMrvMuDRoH0JdK
 Vi761BGrmJ1k+8+HckxMxg0uTjzbmK1E9T7lReTnZeeDqOpTqWzYyF6+fF3zUTvKq+PJ
 34sc4s9xFc/opYAU1Uvkph5XQeFyuySpNLhw6qYxUG59RAf9/V6btjCg1i87C0lgqqRs
 U862C/ylu17lTUAifL2BZ1WhJ6t70DaLP9rxf9MuMRt6FPCMiTM4vownK8pEp5TZ9+3m
 p1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760909168; x=1761513968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
 b=e5V965RkTL9oSknB0CEinStsL1hsPmqHP5Ulz/E5LxcbELXq/dfT5dii+48lCbgBAm
 KP9aByW2ShIADVednU+vYeAhWTov5FT3DyTX9AnEVpmDm7rv6k6Csf771BCIsKp+yuar
 yZL8jLoN7aSa5RCzpFePwGC+iAt/BbtTxCjG2cLR8N4VEHb4LcoQWpJy3BB3H4OahrYm
 wEDp7vps9indmBhAvOFdV1L8lX8SZ4L1kN7h1Kge8aKyDdHGxkfw4OO0WpR85TTGEwKd
 +ij8QVH0a6a6xDGip8UpfNual6jFyOMLGj/GZBuAeElsbpFlt5yk47gyzQN5gvCfjn/3
 q9gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUei7eZMhtizQv+Jxr6uV73YgoWnwMz94lz6nJOgPp+Yam9DDgh6GEm+koEArBx2RjV9ZqgK2clURQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjF4cbSL2wOxFBEqpVBlFgC4eNyoI8/P8UP8f3Lc8LNWJ7Gmow
 izZ7fZ4t9M4swy0UAeGLoB63XiBIILWQ6Z1LNSgm5o0JceJk5MPuG5EkXlX2KGmzSkq9OwNLQuW
 mdHMkQcDpmG8ZwFg713BxwaPz3zcsG1g=
X-Gm-Gg: ASbGncvYwwSeCoL8ez8fiRBAsbDICJ/VUGDGrjkXG0c/RO7DScip7xWyT2ozIsiWN7t
 0hAuQkmr2CouCmCl5HVcLzMrJznV4V/0vBtyNJfaZUMG2vLwpKTx7kLO4rIKsUgMS9jNLuIiZTg
 lMM+RpNsR0lsAGJjoy7J7StPl2aJyekE6rtYAUfrCPE5nU4Mrer9di2nKlQPlgJtyYKYjeBOcGc
 NzkzCvEVeMF9uFdYgD6F43JKCGBRvK+syRJdqtvY8ZBhzo5FPd2w15JFfDxHjId7dld5QwERKes
 jFkEBTpFLjkvtkyadPYy7Na+wZQT/QDYo+0SnFjh8KkKvHWfDBiMuxfuDmplBWoj7Joa5JIfbJ5
 r1lg=
X-Google-Smtp-Source: AGHT+IEwx4nwwBhH/hNxoUVwvTs3X2bARut2TDi7HRPmGCV4tokc0LBHgVVevC+PQZA8tTr6XyTnNa7XyeNocxVrSx4=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr73269955ad.3.1760909167598; Sun, 19 Oct 2025
 14:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:55 +0200
X-Gm-Features: AS18NWDjBjMG5pR4bntjwqt3T7EHDFAllndAmj435I7b4c65f3XvqG9PcKa-Qb8
Message-ID: <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 11/16] rust: opp: fix broken rustdoc link
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
> Correct the spelling of "CString" to make the link work.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

It is private, but it is good to have this done so that eventually we
can potentially enable a runtime toggle for private docs.

However, this is independent of the series, so I would suggest that
Viresh et al. apply it independently.

Fixes: ce32e2d47ce6 ("rust: opp: Add abstractions for the
configuration options")

Cheers,
Miguel
