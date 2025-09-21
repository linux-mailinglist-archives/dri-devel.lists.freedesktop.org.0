Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223ABB8DA60
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 13:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42EC10E03B;
	Sun, 21 Sep 2025 11:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bwmjthrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242A810E03B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 11:42:09 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3307e8979f2so983518a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758454928; x=1759059728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K916KUx2pRc33+DQRqSv33PWW4YfoGyNBVmdt55/SZs=;
 b=bwmjthrtidLvmDxNnuHHFxe/SZ8vjugVfbHNo65Y8hplPrTkqXvc/Ohm8tl2eRwPsr
 8zKe0Y7O8u1FwNy0ktZLGGN1wiTcRi2xpPdIqrLR5k0xa50WrgJql6psZv48LDI55xN9
 MXk50in5qUcULwulchrAV1kJron30GbKJLFEdama+pfvTWtplOQdEavPIUDZnwsUhLLE
 aHVtVKMKLV+4mPyLCNn2aMis/dARwaCqGL6NX601gsw5eOw9U2KNAPTlrEA0kGVfFwbX
 dfbT3wqT/eNox0fzN6l9Ue8T6zQqJ5kI8WPk5RW0w2fBrKzPKvTix1iKffEkp6uVN8ax
 iFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758454928; x=1759059728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K916KUx2pRc33+DQRqSv33PWW4YfoGyNBVmdt55/SZs=;
 b=E6/fe1X7FgOgFkZe1j+ZxChv8dPGH2IAPJwr35TgUmHGxnagjs3d4ZBfhLt2P7lol8
 p09k0DY5cLG3yWQau+4eGSlCztbHnRn1PWFx1tzCGfrarSjNMpJIo00mTtXpBw+CX9G+
 +REVcydCS9dH7ydh789P5Q53+AjMZ6eDcalBn24SrS4ks1rPJOsIZrPNx4ujjxJtWf7G
 qZymb/ml1IZostFxDvq1ffH35hFpjlxgKxFUqzODO9zOLcg1gJ9QJ5pqTGFhT/sYkIhP
 w9WKwRQn/RlB4uTLonCHxzxnTRm1NHmNlA1phpjCndv3Cg6Frwqr5PnHvHGzem13Kfnf
 yGQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbfJjG9aN0lUvzNyFQiAHHIv9KeAlRtvPXQBvggTCx+KeusiL3pF4tkuNhvlHmJZ7m37Sqyid7MzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZLRpMHCp4x5jU+qAt11N72WuA72Xi3XKAXgI8joNd/y8CSBj3
 IEjyUezs9WNMa5E38rxSf5SsFCYb76CaVAqceu/C1pCChGd3AMacaAjab1h0R7/dRD6kHNNtcN0
 DjEX6IjOkeE9/WQX2Jdz8uUaOroLwfdU=
X-Gm-Gg: ASbGnct/bPHi0N50mJc0zCiKpzJi81at81mRVhioIfrT6vk89uOnQ4SODPxjSEK35zB
 WehhqYotoHuWqhXMFM4IfRy2WSNyCM1y6kzjsJZcISxrkMwg1m6IGSPz1KilQGyQAtSZo8cbzTh
 ffyFrsun8NDzrujp6IKcVU/gsi4IDBk5Q1juPSsXIurXhTEm1nDHWoMj+EjIgx+Wc8dUZKi+3mb
 kL/asB7Kz2G4cXolkzuPWwwPj7VfvBYzQ9OSWvCqUHCp52lsFg+1zeQZc46ZKDtA2HXeAizuU9/
 kZnD7cSVB94MymQC9U5GBehsaM+rc+Bo+xcE
X-Google-Smtp-Source: AGHT+IFRSGavmihE0jeFmf3/2ErrEQ7lVZdNPzc90R+azLE4QPTS7uO3XKCP8dBGdcZnR+PQiMPrb7CuZa2GRwXI02k=
X-Received: by 2002:a17:902:da81:b0:258:a3a1:9aa5 with SMTP id
 d9443c01a7336-269ba26087cmr64556325ad.0.1758454928589; Sun, 21 Sep 2025
 04:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
 <20250909212039.227221-6-joelagnelf@nvidia.com> <aMDq2ln1ivFol_Db@yury>
 <bbd6c5f8-8ad2-4dac-a3a4-b08de52f187b@nvidia.com> <aMIqGBoNaJ7rUrYQ@yury>
 <20250916095918.GA1647262@joelbox2> <20250920003916.GA2009525@joelbox2>
In-Reply-To: <20250920003916.GA2009525@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 13:41:55 +0200
X-Gm-Features: AS18NWAEK_G6m5-8BL_C3aor80z6U_cj8cDpyNPkB8wcxKLKwKj_z5k0IO6zsJc
Message-ID: <CANiq72=uycGrGAVH=8KjVQ3e-P_-B0c=_mUBa1__sh44eiQ3=Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
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

On Sat, Sep 20, 2025 at 2:39=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The C checks use BUILD_BUG_ON, in rust-for-linux we have build_assert but=
 it
> is fragile and depends on the value being a constant.

What do you mean?

`build_assert!` works essentially like `BUILD_BUG_ON`, i.e. after the
optimizer, and does not depend on the value being a constant.

You may be thinking of `static_assert!`, which is the compiler-based one.

Cheers,
Miguel
