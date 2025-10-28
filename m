Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B85C1559B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B1410E5E2;
	Tue, 28 Oct 2025 15:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FukL4cc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B835F10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:12:44 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-28d18e933a9so8332495ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761664364; x=1762269164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
 b=FukL4cc6FuL+wglYe9k3OxWIgW+PfCksR0a+z1H8YU1zoHee44E8ogQoasMD0sFf8t
 EVb1FIXWjJqllJ9fQNlfVw+PTw1AGaZcqyCm/Xa35bMmLCL1aLt34CJUqG1+ynIf/uK8
 IqG+dKsPO3VK0zNrfCF2KNEaukxNfLwIUjp8uLu3lJjkRGiZ4ifXWEueE3aoaCbjoQe6
 htjNU58myKGIHvpxZAEc0EI1f/G6wQRUiPqS7GgP+aEl6xhnl6PlV3jMalUvtADAoDQn
 i0HbiwSZ8TqW61DtAPW6Qcn2JNcGYTUgl7oDh1N0tt7NRMpzW75Pyvqk4xJ2kFKuiPVN
 Kzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761664364; x=1762269164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5snQUvhRWkb9C2jeab2EsORSQy/NoakHLRvzEAR046k=;
 b=BSO15nk3vG1jUXu3N90kWSxdtdyDkBNhNxqxd5BzK6M/rUQfElZuz9FhXe+GP/6nJA
 Nm1V2S8hrhcTZTaT4xVtVOk8+GxCTmkPqq0mzEhJpMf3ahshrOthw0YEml7AUZ62EOXL
 woWGh6J/0XkKqx7BPJ/P3ZrXgj+vUvMiKflXVun81NeZbNNh4wTgh/f8GUKaK5Pcid63
 ur0ZMUuvFlYnD1xtwYyoacbIbGAoLm1B9AOfetB2/89jGO/Hh7CWmnSi9C7Mh3EO4Duw
 5Ka7oaTY8i6t/ncR5+1rZXjQSVXAxD8Tu5W/lTssrzn9qF3Jyhttm8MWZwJq0UykXdQb
 j5wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP/hKXGz4UfQvRKfNCWGj78XviN9QXwA1oEol7oO6YPcyPrW1m7MWSbdMtiFFz8WMpl2HwDDQO7Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE+0NChLSecrmFN74gQh2vYx8nmIIt5xMG5bk/dof8NIGzF3O9
 Q3mLnC7NW9TK7vEAgZFZlKsY2MUyY2XMvFPaQUabu2wub0JOLmylNSiEuf29dQYc1ylApqK/gdg
 2TwFLeQ5jI4mlTLM3TyLZl4jMm6iyWk8=
X-Gm-Gg: ASbGncu4CabJ/bTtLret0PnY5gzItOJAj7BhyEkcfoMmkq+7l5Cm+fJNleCf5TeFltn
 sKsGuyaWMG+l6IMuN3g15DN2pgjmn0WHxbIyvq431vYmXDadFqyGQEEHs/fNJbS/mP7Wc14ZnHo
 bSXlqNySkqKbloZt/gtEo4hMlXousycCIHuaKy8CkCJceQgFTci7V5v2z47nZ0Fxqlt59EgS5Yq
 e/fCvONA71DGuRicAj7AnLdYwfqq2swqZZvXZD2crQaEPGI//+kaZkQ+417DsJLl/kemgi1H8eq
 tJnau9yr1tZIhlCuvofy2bvn0MdVsFXCtjHiEkpt+SfsUe/frA6Psjs9Z4l89NUdCIuXT0aP9e1
 T41I=
X-Google-Smtp-Source: AGHT+IFYPGiAfq6Bkpv4VIZbnQ2eB25p+ZAfZMrF5Pziev/2opSXlTlA+Qb2DBeslIA+t2R0h3bM5akBnOcG/++7Z0U=
X-Received: by 2002:a17:903:8cb:b0:27e:da7d:32d2 with SMTP id
 d9443c01a7336-294cb500277mr27314415ad.7.1761664364153; Tue, 28 Oct 2025
 08:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
 <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
In-Reply-To: <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Oct 2025 16:12:32 +0100
X-Gm-Features: AWmQ_bma5_85Uxd8PIaUq6SaqwUjakaAH7XUFCSDVLctaYXwoFO8A3BqGERgpOk
Message-ID: <CANiq72nbYiwFO6Vqc+yoW1-qT_uMN-CftgOpPe8Mqn56b1Fq9g@mail.gmail.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Oct 28, 2025 at 3:44=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> intent with the latter was to say "I would normally have done an `as`,
> but instead here is a method that attests that this operations is indeed
> lossless and safe".

Yeah, so you want that, when we see `_as`, we are reminded that this
is the equivalent but lossless of that, which sounds OK. Though I
wouldn't say "I would normally have done ...", but rather turn it
around and say "Since we want to avoid `as`, here is a method ...".

Now, I suggested a change because typically I would expect names to
mention what they are about/do, rather than how they are implemented.
The implementation in this case also doesn't say much, i.e. a type
cast expression can be used for many things, and worse, the operator
may or may not be lossless, so it isn't a big hint.

But, yeah, I understand that you want to evoke the relationship above.

I also suggested it because when I wrote the message I was thinking
about the `cfg`s message, i.e. most of these depend on the
architecture, and thus having an `arch` or similar does evoke a
"careful, my code may not be portable anymore".

On the other hand, it is true that the `u32_as_usize` case will most
likely always be available, in practice, unlike the others. So an
`arch` for that one isn't great (but I guess it could still matter for
someone wanting to reuse the code in a different project/domain).

In any case, personally I don't mind it too much either way --
whatever looks best for most.

Cheers,
Miguel
