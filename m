Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919CC32739
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 18:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232810E29A;
	Tue,  4 Nov 2025 17:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lU/6HIqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416510E29B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 17:54:13 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-295351ad2f5so4069795ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762278853; x=1762883653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
 b=lU/6HIqF9hOGh3UCUcj+UbBOr8qML9l5gZkZUQLqg0WSFBROoKEoh5f4Ukxl8ChNZF
 UxrzHg5Vq6Jeg4sVbk/qWnJ8EVFK8swcze44Mw0VJAp+nPqKN4OXNMzKZ4kkTWF4HUgI
 kRIweMsmqzGQfWdTk4JP3+QWotMHz0uWfFRwiJ9MiuioojyNOT3B+QjTddH4F1lgCUJq
 4FYSp67Xks6E0AVHC8gZfpCSrzqE2K37DlHDipcIdjRBI/BSYBBNpcIcbeAqKR1SEgZJ
 3Nim1AEqwaqDUjqekCM1iaLy4nrBDOhdC+Rq6YK/keLLi7bEidQ/cza1BlZ/RTPwU9pU
 pAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762278853; x=1762883653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agzzRtsZV6+laamcHgGvEzr1fnC64LJg6bvadj96D6A=;
 b=fN9V8Ey5JGFIGtiDEiFqwlJ0KsKXcgZOe8YtDq3/bEqX11ZmDuAy7Ml0dTmzoxxyTQ
 W1acRALhqnuyTNOOegCobM9Am6z9XKrDi73Lv1Cvd94arnp4Ikrsl8m5g/iU2SQcJilG
 ykiGdWnhyLvqrE0ziMsp0zrRrlvUL9j73NrQdYt4dF7oBQigX48ftr6GPFWlwwp2dZpP
 mK07cWFYyDI1U+pOKFIk1bLa/2IfeACGfchqdNFLl3QpC3zACzxOScW1jGs3PR+4UzE2
 dX0TxGlLfzD7Bs2rhOX/mxw3zUea2PLNV6wvANR11NoCF/2+EvUoynYt4eWeWD0ykzxT
 li4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPYp67vaqPHjrZw+WEV4KIonB8SOU877KWzI8jXy2l/9/RDTojndTMuFe6Re4n81Du7vM6/dJbv2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwrkd1zhrNJmf/zWIfKLnnsDcexpa9hkNxWrDDYuJwEtVh9+28
 sTXt20CvGiWDrWXqjIO4E+U9cgwHfcf8qwZ6FlOFR9zDS+8Y09Z2ZwpFCz6SCuDoyHsMvmJEHLx
 pANqYVSY6PQo03kHES6/443Acfyeh5HU=
X-Gm-Gg: ASbGnctjb2PLVCangr60qwo54CCDNE07v+H7L+zk99P5AmLEZHSnnYijNkkTocsE34L
 4DwaQkJo4KdrNhcdhafgNvXtR8tlqIWEIKL6YkigkYkR0c788KGgP97e3MI0veip3uH4Ww89EYO
 AqPKQllvj2CsayHjfGd9zYJVlEGNo8HNIJogw0H9zXCtv3V11NAGEn2uQ5nFwzpjtnbYNy0hly5
 de0IqJK2txmdntLD2oHnvFENIxZ1pXFLN3f3ZFlvtztGk2sctEs0oL5d/JDRo6jFbnrbdHa3USG
 bc1GbVPwpZPwL4xszuNyCNi/Ocr9uYAG5PRp1JhFCLgeC0ahBiyh2rm6diZNSPyr/rbdGFwA4i2
 vciM=
X-Google-Smtp-Source: AGHT+IFMtgciB6QONB6VxZCG1myoQ/OF5p9zSByGfEAwuejN7MO6VmvweNifh8ze36q1bb6i4v+fU3wfRfdXIBYH7Vo=
X-Received: by 2002:a17:903:32d1:b0:295:a1a5:baf6 with SMTP id
 d9443c01a7336-2962ae52bc0mr2728245ad.6.1762278853136; Tue, 04 Nov 2025
 09:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
 <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
In-Reply-To: <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 18:54:00 +0100
X-Gm-Features: AWmQ_bnlFTvkhYxQQsxRU1wVA_rAcYxAjX9HSQxCVZanIDspjsve6Q_H0_KRQ5Q
Message-ID: <CANiq72mqDWrLp9EjXHUgeODh1zh-9XaUnmgHWGgX2Awqs4G=cw@mail.gmail.com>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
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

On Mon, Nov 3, 2025 at 8:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Thanks a lot for these, I studied all of the suggestions and agree with t=
hem.
> May I also suggest to add some of these suggestions to the kernel rust co=
ding
> guidelines document, that way others new to sending rust kernel patches d=
on't
> miss it (example not adding a period at the end of a markdown doc header.=
). But

You're welcome!

I don't think everyone reads the documentation, and one issue is that
the longer it is, the less people may read it. For instance, the note
about using "Examples" as the section name is already explicitly there
and other bits can be inferred from the examples' style.

Now, in 2025, thanks to AI, you actually have a point, in the sense
that I assume people may be able to point a patch to an AI to ask it
to apply the guidelines from such a document.

So a good way forward may be best to have a list of "short
rules/examples" in a separate section or document, where I can easily
add entries with a simple example without too much explanation. Yeah,
I think I will do that.

> Also a lot of your suggestions are related to how it looks it rustdoc, so=
 I will
> try to build rustdoc and see what it looks like as well, to get an idea o=
f when
> things in my patches could be improved.

Definitely, please do!

We all should be doing it, especially so when the changes aren't
trivial (e.g. adding an entire new feature/API).

I have it in the "Subsystem Profile" document from `MAINTAINERS`:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

    "When submitting changes to Rust code documentation, please render
them using the `rustdoc` target and ensure the result looks as
expected."

Cheers,
Miguel
