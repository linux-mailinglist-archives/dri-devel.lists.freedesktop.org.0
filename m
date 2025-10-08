Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23105BC6190
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52982892C8;
	Wed,  8 Oct 2025 16:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kXNgv9iO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D22D892C8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:57:05 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b4fb891df86so206a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759942625; x=1760547425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
 b=kXNgv9iOqUCM2MZT+tXSj+widJYBO1qLuIl4C5+MZsk0bHVmlkrm+Rm2m/o7cWcdtE
 Fyb3Ka4FX8h/4fd90AD12IKoQBSGOeXZqR52Ybo6C1/gdzBqykIARf0bqgMCwpBIZDB+
 UfFXz0h3+NxOa4HQvfOzvKfYC7X4sZCdXV4LCaJI4fyrBjNE6t/HLSurgBMlKDHZiDNQ
 GZLRoK30fdzqCsw8Q1jtBLLhCj24Htg9Thas+XhOp+lDse7uKp8Cz3lZvUusZ7GMqJUu
 eVVMjmzfdL/FPtQdXAyraj/vFbY/5otf/0+htbGiOpaeYVKUVjhhM1ihMMOFrYWrA5sY
 ZZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759942625; x=1760547425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
 b=wWGFPntei6zEGnbTUi5OjpDwHNygYuJGhqmkL3TzXIPv7BsJSCoq2nqYdF0qGrwM1y
 Eg/rvXYRjvJtHPL7dY9uD7Vn+Xr+ZvHkS4o1PCOnGSTdkRW13UNIwr7B0JXm71pHAL3q
 +oE92vdy4PfmLzl1C8n96xLTClsKuSinzr7hKn+hfXYRNoTJvTcuI7yyj2JKh5nKvgZY
 9OvuFXaw4xE39c7mLVp7ebELUQytqvgCtl/lwEtcpbSTCjIga52hVf/l2AnuEMlNxCCz
 N33GPIa5ZL86ewJlWgxVx50+Hc4r6aIiL7zJOZdSKEHO3+C9mpa8KtZT9XvJDZnRMIOn
 JSvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS9w6n7BGnNSYJO4Vqtf9ji0QS7XX5FbBKwXQ76YF0ULyCjburqsp4Idg684z/JrBxWRKIMPGE+u4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqhDqmGBBdNtXMySZ+aSon5gfVx5lXikjlCe+Nw/m5Rc5A6sAx
 hPAq92M+Ev2VjDsghwy/G00cwGIvY+t8a5STe/Or8XXruGK1p50F8xTs+BzfeAbYGw6VTnQ9SPV
 S3Q343RcDpa6vhKCM1Ha1vvcD5NV21e0=
X-Gm-Gg: ASbGnct24cHAFPMVQuk55Qb3MplyDXIHyUUYmaYqWClsOizuELR1MiTM2YUfh78SoPx
 h18KWB24IPbF4MM0AkRSHXng9d0PXevD2UvN+dndc0KNOgZuAIW4HhPBPOUx9uCzhQh58JPFX1I
 2qv5UfEMDOVkTfTTSFtfpP+ZwFcOebggEV89t5TEQ5Lkfv1/vrLbPNbpen9EjJ/ynpvnhYpTC4V
 QI0k98Bld0LFyoiWJpv0RDWqx0T2T3LmuJccg6XJiWf2ko1QNqUTRTtp8kaeUbzDdtAPBLiWYX8
 fUHT2sztNXiLnr7rE5x8BWArhlpk2TM8qI8JG6Uj3VJkR1980w==
X-Google-Smtp-Source: AGHT+IE+hV5XvZK2LLA5Zj8MS65c8DKZNoLYsUmppQ2+DVDFH0vWuOn4hQEUZM9Ru/QEpwQVpwGiPDgdVyGxI0qTssQ=
X-Received: by 2002:a17:902:d4d2:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-2902745c0a2mr34349905ad.11.1759942624756; Wed, 08 Oct 2025
 09:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-5-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-5-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Oct 2025 18:56:52 +0200
X-Gm-Features: AS18NWBIne5rc-AVIeVWCfebGQh2r5eidrg652ppzGpIdVO4I8s2bzW85Um8QvY
Message-ID: <CANiq72k5f3f8Kys40sRmaKR8eeq8-4DsDkWDkwMPZ0A1JSFj8g@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
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

On Wed, Oct 8, 2025 at 2:13=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> +/// Example:
> +///
> +/// let mut buf1 =3D [0u8; 3];
> +/// let mut buf2 =3D [0u8; 5];
> +/// let mut sbuffer =3D SWriteBuffer::new([&buf1, &buf2]);
> +///
> +/// let data =3D b"hellowo";
> +/// let result =3D sbuffer.write_all(0, data);
> +///
> +/// A sliding window of slices to proceed.

Please write documentation in the expected format, i.e. using a code
block and a header:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

Eventually, this documentation will get rendered just like the
`kernel` crate (and the examples building/running as tests etc.),
which requires following the expected conventions.

By the way, is the sentence "A sliding window of slices to proceed." cut?

Thanks!

Cheers,
Miguel
