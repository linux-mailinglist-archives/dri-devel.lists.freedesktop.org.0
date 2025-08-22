Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10EB3185B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D75F10EAFE;
	Fri, 22 Aug 2025 12:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="IJHf3AA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FD110EAF1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 12:52:45 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b9dc55d84bso1874877f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755867164; x=1756471964;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
 b=IJHf3AA1D9ZIV7tvZaXs994VSNYxfMQL1ERqHNJZSMnP7rRA0pP4K8g5pGFjQEPLu5
 2NvN4ErHMF+7e2NbBEVcDd5lH9OqC8RF1BZ7+gmcpYa23LudmV8T8EHHQPYORmyFmcKT
 8oUurgr3RXlU2ixvtp/ioZmloT0mREQvhPlw2GsaZL1RKV/VbhW/juuCuzM6/V2SIMSp
 36yjr1J5IjBzT/ah6aLu6f0sinrk/g6Fr5pJvtaSmNph43dKUoM3AYMcTLN5KPBuci1R
 2IULm+QmhDHgfYCkmjuy6kKXJnMeGgogEcvQmEAPqZ5kTTm2e04TUuO/htfWLsYxKY6S
 TsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755867164; x=1756471964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQxzrle3VKFwpadizhrA++PgP4oF1J7QwIr8TLUlKCQ=;
 b=M8RztJq+ILYC7C0nhjOUdlHzQq7HRDs+eDiZoBetfqGil1A8QdFKqzmryzF16FKAbP
 u4keDhNiHpYtXjlehKFMNVmpN284KU1BPVdqd5kws0RxsqWITx4RevcqZOeB2XCq1JCd
 uPEhyBR/xrCfKTcC8xzrkbzh8y5+WoNim3IF0UJlS3A68l04u/wuVuKAicRqWTN5t8A3
 bkYdU1rv398LoEbL+MLVL3h0xlEotuQI0pGaMLO73D6uv/a2G/ZRLmUsivwjGsS1G7r2
 +WdeDaRvtNjH+Bg7eA2kQJRPlxvPT0ox83O7Jh4SrF8Nvfrec01w92zpepMPm26tSQIx
 9/Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMx1cVWV67cnBKI+cGxsHNpt0iS5gWIpItiAj8+KaeamGFnfvnzoTRB27pGsy6BT6UuOyixLWNdNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCL7TCz9TKLAgRtNUrpVobRy3FrQUJuwOCA6/4VaOxwUpLa4f2
 u+C1r3AgZ+V2qVeuJwfoddXIFIZTCMTK/bpHONMkDMyDfu2ABhzZ4RT/32NnrtENQfRQYis9grY
 thr/jBBqX6W0wPX2FLx498he1ZgiM9u7T2GjWTNWk
X-Gm-Gg: ASbGnctbHM34uE9nxqKKoIfdbjgMLGZGWb/xrtfBTLklmJOpX/IRq9q3rnJICPIeBS+
 9b43OrpmMSIu5VltR/5TtuQFXVawSLToVAAOld9cHw6Ao67c63AWQ28Y87vXlIcU6NyXByfBrNN
 GJZzzK+rwpqh/eqS33YKIT5u4N2/tyryasSNxujm7PwzIGXAFe/k/xfJ2sZfc05jWURIjj5tT6T
 VEdcqbTGoGzKhEIIkuEF/MkscnF9Rqn+FyQ/94Gvpuq2y2qdVmLkCpAq2LLVpXUQhgXpS4eIw==
X-Google-Smtp-Source: AGHT+IE7Y0lQvf5r/Ym72waDaFduU5pis90P/Y8BoW2WQ2ZgXRN4nLW4iRYkwU9mYPjzWGowKlbiftsAubogUD/WtkY=
X-Received: by 2002:a05:6000:230a:b0:3a4:f72a:b18a with SMTP id
 ffacd0b85a97d-3c5db6bb8d0mr2118466f8f.26.1755867164304; Fri, 22 Aug 2025
 05:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
 <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-1-ff5633679460@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Aug 2025 14:52:32 +0200
X-Gm-Features: Ac12FXxHtvKHWX7r4WBjHUgk1Fpgkh30TWxJenE5FBjdNdkXpbTtw7CFj3EHlec
Message-ID: <CAH5fLgiXYj0f0UEPCTjDgykjX3mFo4hf9SUswRYwHzh6Vznwtg@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, Aug 22, 2025 at 2:47=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> `FromBytes::from_bytes` comes with a few practical limitations:
>
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.
>
> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
