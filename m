Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FBC0AE12
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 17:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0410E073;
	Sun, 26 Oct 2025 16:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iQopb7Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F5710E073
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 16:44:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-26816246a0aso6951805ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761497061; x=1762101861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6wILLtfeNYO6vlF1lVdjizAOVshwGgLXWHD0xoxegrM=;
 b=iQopb7Pxq6WRRzM3OsLEQjas3/zNqDcyH1QRoSyrymxfy3stBir16az+fcBoQJr+oG
 FUFVZNCa0Da0XTUb1LJ+zsCx1O/whlxqod46SJRDA0L0Z3IVm/piLg0xNKooJ8iTJM7A
 1LdWZj2ScqlxZU4QSVYI8gEmqHV/XWmYjlbKwjSg311G2uromNa00imhI97k2mGh7txp
 KYoPQREJ6b/qYKbgf1GoS8EZ7QHcG88747WtcxBEr8GBmMldjSm8bp/qq7PhingzVqz6
 xrSCzn9gJ3j0qJurNCjU3vN48NeV+Erk/QkvoMkFUH/OkplfeM3l9VvZf88oxVFpT2Xh
 yO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761497061; x=1762101861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6wILLtfeNYO6vlF1lVdjizAOVshwGgLXWHD0xoxegrM=;
 b=O2yHzHzO7nbU0CIILvP4ZxZ29w5SRk/ECsLhQUXHfvU6IlVpGUhPY7wGtYLMY1Ezbp
 9rW5okkSZcXPjkx23IvoXAzXwzBXM03gqHicXNBOopbIOUzRMvDbIoxE9FNWIjIBhVum
 6vZ5JtO0jxXmLQtyW8WSk9HKQU+yZ3LnlLICX/DoEFxNzvFk+UK03+cvqd55j3SdhvwQ
 IsjWJhZCe93Oyl3QRhigEDL2DxeyUKJJhP2ZCOp+BgkdR2G1gZzWhsQrhjTcuuIxkSRs
 Dlktko4mUu03N6184AAG8dp11M4VPFC5gea3H0dDO7PeeG5g6gyIfyWH/EmksTfIv1Bk
 Vcjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPUFhNaySEDPtZpuyKbieZBLzJTooWxsIzTgOOUaf5EWSowdoUpnrmX7Obar+6+tH+ZlmrsedYLm8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTInoknIziw2N/gv+N0MOPz+SMYepNyC+lLVC9KUfIluHhQtWU
 36ZSN1qmQ+imu3elkDXXwJoXo6oEJag6bFXLx35CI/HnjLO3G4u60g/tHiu0pB7/zBuo7AE+af3
 VfDUKBYcm44uuWMalms9e/eNZNgrAC90=
X-Gm-Gg: ASbGncsIcLUtYXQdffWRE6IehTh2O5IFItVtd7rZC9ks0Wto818z2xO2/gP+7XodOXn
 pFO24OB4TfJ9cqoXObhBaaK4MxlEzkgGGIBwQkGB8eyA2pMWgISq7C7V75j2SIWPNf/IJRH+Efp
 jqFDb2bzllHbRboy//KPjSSlvdiDQjKD4rev4wgQBX6Kxs60+3/1yCNhfK0hT+IwpzyPBWacVfj
 KGkyYPZjvE6ec8G6IMUKWVBtvHcYZ3k+Gyn4m+OFC9cgyugX48BHHBu3UufHBLWqKFwkmi2puDk
 LiAMH88qrP6S5aKmfx5em94u4CNTp+WpRhxy3cVcGmAcLEefQ+T+uexPmfAmKyTVyI9LqbHMPkI
 rAXtHAfXJmq+PAZuKPnoscxei
X-Google-Smtp-Source: AGHT+IGcKNBiOeJRVxt2uo6Hqt2C6o0CYIe4RfW4BEVkfN4Gc0z8gi+UAYPMQz7pRTqkzl3cw39cqdYTdggHuWXBRN4=
X-Received: by 2002:a17:903:1ac8:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-292d3e5084dmr130371015ad.1.1761497061350; Sun, 26 Oct 2025
 09:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
In-Reply-To: <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 26 Oct 2025 17:44:08 +0100
X-Gm-Features: AWmQ_bkdt-5-XZk5dwhGctE3nBdh_GyjtSn8Bs5HCiaG241yBI4aSb7WE_0r3tU
Message-ID: <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>
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

On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +/// Infallibly converts a `usize` to `u64`.
> +///
> +/// This conversion is always lossless as Linux only supports 32-bit and=
 64-bit platforms, thus a
> +/// `usize` is always smaller than or of the same size as a `u64`.
> +///
> +/// Prefer this over the `as` keyword to ensure no lossy conversions are=
 performed.
> +///
> +/// This is for use from a `const` context. For non `const` use, prefer =
the [`FromAs`] and
> +/// [`IntoAs`] traits.
> +pub(crate) const fn usize_as_u64(value: usize) -> u64 {
> +    kernel::static_assert!(size_of::<u64>() >=3D size_of::<usize>());
> +
> +    value as u64
> +}

Since you have the static asserts, this is fine today.

However, we may actually get 128-bit architectures in the
not-so-distant future -- Matthew suggests to be ready by 2035:

    https://lwn.net/Articles/908026/

So this one in particular may actually not be true "soon" -- we also
had related discussions about these assumptions, e.g.:

    https://lore.kernel.org/rust-for-linux/CANiq72m9AeqFKHrRniQ5Nr9vPv2MmUM=
HFTuuj5ydmqo+OYn60A@mail.gmail.com/

So we should consider having the `cfg` already to prevent people from
assuming it will be always available, and likely a note in its docs,
i.e. we may introducing trouble to port later on to new architectures.
Similarly, the docs of the trait may need rewording.

What do you think?

Regarding the `.into_as()` name, it makes sense, but it can be a bit
surprising when reading out of context... The standalone functions are
super clear, in comparison. But I am not sure what could be better.
`into_in_this_arch()` or similar could emphasize that this will only
work in certain architectures, i.e. it is "an `into()` for this arch"
rather than the general one.
That would go well with the idea that you didn't implement it for
other obvious types, which I guess was to avoid developers using this
instead of `into()` by mistake, right?

(By the way, please use intra-doc links on the primitives too.)

Thanks!

Cheers,
Miguel
