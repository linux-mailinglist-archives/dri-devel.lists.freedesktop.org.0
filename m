Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DAB8D914
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 11:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFF110E06B;
	Sun, 21 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NodQgKxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9CF10E360
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 09:59:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-26808b24a00so6384795ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758448758; x=1759053558; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
 b=NodQgKxP8s4XG85Z5nuFoQN9gso1SpDNaz8Is0GPlUW/l2O6C7EiESA1ztWqLKYeNU
 w/MpknwFRo1enhNgvrUDRJkEwXu9Gkll5ZLHWyiObklmwbxVOVbzRDOjLMdoZn5Qgwb/
 G3afBuZDJPoTjLbN1IjXyqXNVfgjJjxttdXo4AiGvqen/nV/tyQdzcwT3yd3rPw40G87
 NqaN+9AxpvGwh8MdAJaHQ8MjzqqeOblJtq9tZMA2cgr72xVVlHw1gUK8/hpdgP7bng0m
 2cxDWBxtBZyV4tN0YsQDYF/ZirLFqBU++hVOcbAzHwfprs2KiMzLM/T2WekZq4IQeekF
 Y4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758448758; x=1759053558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWKmsQdl2jsGwScL3RcU3RgGD8V6ji7p/wbvV6vfnGU=;
 b=wbUg8pl1kMD9hlcfRK/4JoJhEX4mmVqxUnUv1/cfCFn1fe5eRXr8beEfhqw3sDpS8X
 LlEQDk3bI8J7wxuI+r8azJb+V5EcrnuviGHPeYd5Sn2tTA6n2LSlaDhAkriiybQh4VNt
 x/jP5tj+sOzcznjvqNKO7wTLahT+WM4KmkTKQ0ZS3SaL92mW+EvnhPVR7jBuZ9ATeV2C
 vw7xlZMyeeV6090Ehw7TvYqkz2K3Jmq/lO34zEuImeogUnJzcv2EHGdPHhLV3VkArbbJ
 Xyyjo9TL6Ht2ls8gvgq1rYl3/3+z01YvBqrNxCdfH03TV19gtO+ca5TOLBEsacNzteol
 z85g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/uZrf4z84S7Qi2YuOUMKBkBLkSJDsACMhCs3wMhAD2aWnWPS08rQHDQJXV4L0x4IZl/1RHEXtEZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd9e+3RRI77uefQQ+PlZJtoGjniaDqnJdoDBjnDouxn3vwH4gQ
 cLmKvvd7IPuXune8J/Iz0KyFrr9u6/nR3/Mbja3m0ZZX3eVgM+tetF0R9VbTGUXkcr/DmN6pQHR
 b38caGnJMbbSOaIXlUQNhIiaAkCM98wc=
X-Gm-Gg: ASbGnctihE7iBpY/+Daw6trbx5mXz5dPwSrCGhKxqUgALVg6U3hifYTEAIKV52Eubwp
 kwHOwNwKYpvTDv7m/93T+2I4m6yCOe0BtVenZX49oBxkjWnaafNkGX8mS6WbFNUwjjmsp6K+EIV
 EclF9TMGCvCqF8DRbD+DmHzFb2ZQLJNhudN3MBjaKXC8caOQSC4Wz5wtYSafsdrAONhQ4+mXJNT
 WV6bNwQJNjtFVmmFLWxugHvLQXDO38eS/mPnOyYJJi3AIgrmuZAfTgntHGxgYxSlVWAonzIWnWO
 wLQBSB0Ff654DOjoqii+ep5ism7BLl5w2gX1
X-Google-Smtp-Source: AGHT+IE/M5n7k5EV9oBMoTKSdZYNJ8k/u28SAzpBTSTXvI/1sciYsCvywr3oY6EDALdphOvsgrpqPOmhVakNTvvKCsI=
X-Received: by 2002:a17:903:110c:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-269ba50450bmr70599375ad.6.1758448758376; Sun, 21 Sep 2025
 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh>
In-Reply-To: <2025092157-pauper-snap-aad1@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 11:59:05 +0200
X-Gm-Features: AS18NWAX2coIcjtRAeKTjf4CFDI4YK6EYgm8hWO5NK1pOl2WGGAfjpcS8VVdy_0
Message-ID: <CANiq72mk1-Ew11RB0kfep5BtB8M_5H6o_Rb2MwamrZd-FmzFWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 nouveau@lists.freedesktop.org
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

On Sun, Sep 21, 2025 at 11:36=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> And where does this allow us to define things like BIT(2) for values?
> (ok, that's kind of not the point of this patch series, but it will come
> up over time...)

We have the `bits` module since 6.17:

    https://rust.docs.kernel.org/kernel/bits/index.html

(Or do you mean something else?)

Cheers,
Miguel
