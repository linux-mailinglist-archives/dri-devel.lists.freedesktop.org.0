Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946BBBA974E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 15:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7163610E238;
	Mon, 29 Sep 2025 13:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="laGcVbgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5410E238
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 13:59:45 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-26e81c17d60so9204385ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759154385; x=1759759185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
 b=laGcVbgxNPePL+/QhwUgn4GrGercTB5+tWN38As7RCu6T2zCrKTeyi66UGWzNIWAhP
 CieqPQnsIplkdC4F/aDiZ7uLVyGvG0sekiaVY2TPBA7Uj9r19VvgZeXsD3+s63clYfkJ
 nD7ZbPnJLaPojrTHIUkWX6n3gv8Staopy7eS9fFsimkbqzGWtAVt+H7y7CBwUuunjdsW
 ehtsYPhxLS3AVhJ5Wr6Jgzs0UYC/MKaGv8HibrFCADCN6zW4vbcHaBwv8EOZlcAVB5J/
 q/fwGWewJ5GtqO69JQ2V1pKq67qqWbhgjN+CG1MjGO9sAcK065hYoQ9iNKkcnNo14NyS
 wf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759154385; x=1759759185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owq4ojdUwUTymm10C9BTuXDtxr/QsVzPAyM6ekIbFlk=;
 b=JvjG7+9EvJx2dUXtNI11REY7kld6CxsTcqX3WlCBcYVThkleEmr6NJab5EjjR0oaCA
 N1Ob1LY0/a46skUto7RBt4r9twsBgHHRPZdJSFJwH1kJ08qgus6zx9MXCOmcdHMKxbSY
 T2kcAW4GRUXmOfvSeRJKSJqNM4TeWoTfsi3WrFMPDRvbapC7ZjONwN6Xqu0CKe+mCK3a
 lBGwsIJKrAWkyIiQTFZ1WQF9eRWJMjXnswUvR8BI3nt0UThfEROyWI/dBeWyZnkD/Kv5
 79uguHem/8b8lkR6/Bam9ox+YRmuvfQBxPselAnqQANVf+zfr/lBhWIlQgnZtJ4ky8T8
 +Aog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG+fhn07LbevhQUZR+qK6c+mLt8q17iaFNyiYk6psfYmASa1Xn2pq3Wkwz79IfedypDan9jGgtEJg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzELealJM9Tz0qDIcquD1s+lUFeTEwua7YILmdzEezuffT04Awu
 /pR3RQaOKkFqfnMoI4lXjFmjNHuguHOlPv6l6Nmp0rgxY5IaSwq08PW4kn5kskZNEUheQSdD1lH
 YhEhY59/Qv+jMYKz3FxDuaHkNWwp+1o8=
X-Gm-Gg: ASbGncufZN0+Q5KbUsvEHKuQA/7YI2uu/s5LJbSVxDCgfqUjIUsPxOq+UDDsSVQzqZp
 HG1UcBA1vBVk3y6k3Oy0vTqp1qTyfFoz2HxbalTlCT7bqK/H5m2zybDGspZdtzaFc4wYq31DbmZ
 /Ew2MWXrtBz23zZadxsk7djn6MGFI4IKX/qA56wFCpIoSHatynIXuqRLF1bhmicWJEObRkDhZ7x
 csDGl4D2gvinresG8Xp1ezzlWsa1TfOX5LdRvc+kBNA7TnOSGRjjdckHAecAb303Z96rqjg8KVl
 CF5GXgj4LLLk0LSAD4XeW+CG3JrEg7FKJ1vo
X-Google-Smtp-Source: AGHT+IEC1OH3LVB4V0oxft7FgJLhEwqNNj6rUnyOmnwsKLC7LLfd/i5cH3v8mOBtoJlF7/5PaCpYXgtDTbDZevnth5I=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr105372055ad.10.1759154384643; Mon, 29 Sep 2025
 06:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
In-Reply-To: <20250920182232.2095101-7-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 15:59:32 +0200
X-Gm-Features: AS18NWASygynDnatU4KPTeDzNXeVtgwJfzlJorCLrDvtP5k4ZufDBjnqp0W75-o
Message-ID: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
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

On Sat, Sep 20, 2025 at 8:23=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> The bitfield macro's setter currently uses the From trait for type
> conversion, which is overly restrictive and prevents use cases such as
> narrowing conversions (e.g., u32 storage size to u8 field size) which
> aren't supported by From.

Being restrictive is a good thing -- it would be nice to know more
context about this change, like Alexandre points out.

In particular, the line:

    .set_nibble(0x12345678_u32)    // truncated to 0x8

sounds fairly alarming, and not what we usually want. Why cannot the
caller cast on their side, if they really want that?

We avoid `as` for similar reasons and nowadays enable some Clippy
warnings to prevent its use where not needed.

(By the way, please follow our usual coding conventions for comments.)

Thanks!

Cheers,
Miguel
