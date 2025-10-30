Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA554C214B4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F4510E299;
	Thu, 30 Oct 2025 16:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="coAV8Iuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0110E299
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:50:17 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29498a10972so2368805ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761843017; x=1762447817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVy8tbUD3Ds1T7QsmSlLfYhJ41rXLA290c2MjqkFJVg=;
 b=coAV8IuqMvv60IJeLNKvRaZfQWowhE+2DVvcdQh7wCsTjcTEcnEAHSo5JM766gb+G1
 WqGymMmbhKbhnTQgvsaP1/GIqt8N2+f8oznVCkp0Hyvbs6Q3aGFB0ZlEYO4v0g1J2Tgm
 tXnV3EzAkaOQ2BM93ByoJ58DFF5Yyc6Kw4JW7gtMds+5sS1t0HCRmzaqz0eNYR0kegF3
 5buAYmPnb7FoZuMDhiZ7rcfT65ozQJaSF7nq9GdaLYgmkOdgEfZBxN2VRDQN+0I7vNgs
 Nw0SW/QCki7w7guvSdB8zJGZ/isYQfT+BegAfwtMCzkPTgZqdNyoAfwSKQHq2gwZY8BH
 +tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761843017; x=1762447817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VVy8tbUD3Ds1T7QsmSlLfYhJ41rXLA290c2MjqkFJVg=;
 b=CHcTFgCVPqPynPBbtGMKZF+XWPSZJGwIB7dWOrUupekymxNOO+YwTMGSfTPUjj0SDQ
 euRX67TWBb8Q8RSO73ldkBWrRBPpjUYK7i40qWOUyTjgzO7ktRAAfdHH2I3cPFD7wkHo
 1jjrYA2yC06XzfKo8vj9mW3ZfNkEN7cp7Qm1EGgh1aNzfa1+NNlTelGGTjTOPhFcA1jB
 hrL1KKa4tk6NQXISinFo/PIxvz8jJ2N1n28mCJybnGdSqgVR18zUcecWgBaSO9xHAPII
 8gkCNBgVaQkbvrsM0OGaPNSFd3asT2pH+cjhLqA50cdV+50l4gByzPr93cQdG3t7NsQo
 36FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGxKc1e3/36vvLLJkDWVYWypmtmPKnlByhrxCWXgrW9cGqOyQih7vtm7CW1JTQ5uTQW6CqQdWWYPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj3Z8TNdONThC83/AHX1t3l7m1Ut2Fb16r4liSjbKoL5YFCOZE
 evLBPKjDbDIclY3xzBEmgFyUZRZ//24bvWTGLTZxHuZm1/JzvjLICrbir+IuZr8H5NmU0IFmwir
 W2XH4lnRGLO3/RtJIHdjm2FmpitMa0Xk=
X-Gm-Gg: ASbGncu/lTgF2KJg7FrCNSHZaYkIjOW2RdA1Auag/HOfdt049G58/gDyx90QP2KnT8n
 svA5zHJ5Z0+mvV0XPqMbMRaBUAbb1XTqkwc7oikTWPfSr9R2wBgEKINbO9HCclASov0/aLGB43h
 bIPtSpemratfkK4N+TIl2LQuGPaXdce5hMtk7/xFC9ZfJ0go/z5yhexU1xCMHLFCVttpmAq8iZz
 sMFJTiShAfvheXj2Kx0OQN9AjtLYON0HCeK0ol65gKXczsp/6kS0UuSovRUL8rOZ2XJ/ss+jOrZ
 SfjhtOIJZxPdaSX6tGMyhOI78CP59Y/WmnUnU6qw8Mgb8Yvmo2sxmnbGR1S2Ss+MOBWxINloJfb
 CYT4=
X-Google-Smtp-Source: AGHT+IHIwOHRSXqelvV1Sdf63ytImuxsi6mN867ttFRk6bB9U4Bt6FvCqQWaRN3cWMuEbnRRwlVbLx8M4DZOhZxBczg=
X-Received: by 2002:a17:903:234e:b0:294:b58e:6580 with SMTP id
 d9443c01a7336-2951a545f7fmr2497775ad.10.1761843017022; Thu, 30 Oct 2025
 09:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
 <20251001-unique-ref-v12-2-fa5c31f0c0c4@pm.me>
 <87sef08mjk.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87sef08mjk.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Oct 2025 17:50:04 +0100
X-Gm-Features: AWmQ_bkaCQLlBdplFGaXs_s6rBEi5hnyY5mzRPNbjRg2sfBfQKwQOTLK3O0jQnQ
Message-ID: <CANiq72kuRNvovHK5r24kh23mo5wp2bpx-EjGMOyNBOF1YzukvA@mail.gmail.com>
Subject: Re: [PATCH v12 2/4] `AlwaysRefCounted` is renamed to `RefCounted`.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
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

On Thu, Oct 30, 2025 at 3:57=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Since this patch touches so many moving parts of the rust tree, it is
> going to be a cat and mouse game regarding rebasing this thing. It also
> touches a lot if peoples code. I am not sure how something like this
> would merge. Do we need ACK from everyone @Miguel?

Yeah, any rename (or generally namespace/path change) is always
painful due to the flag day change, and thus ideally best avoided if
there is a practical way to do so (e.g. keeping the old name for a
while).

And, yeah, treewide changes generally need Acked-by's from the
relevant maintainers.

Cheers,
Miguel
