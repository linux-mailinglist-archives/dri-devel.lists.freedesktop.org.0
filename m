Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1898CBE5C97
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 01:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142710E004;
	Thu, 16 Oct 2025 23:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LeTpmcQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A836710EABD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 23:26:04 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b6a42754723so25862a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760657164; x=1761261964; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
 b=LeTpmcQzoGIYyrqy1pwBs+eLsy3sP2nXueaz5noJCx0yvBk3hRsZPBKF657h/mzor/
 o1DPjNRxIaVSVfEQZubL8DWvCZZbASTNFOaaqz/VNwniUnV53F5iOVChA7GGbQcp4VDS
 cosCi3b59YmxwHHV5ORhBmg77d8Ar/iFReyjGt3WGR/6r//ibers5eJh+OeLHSCmVgkE
 l+s4iKc3c9Tbp8hbkOsKM8tbBUMLEDtq3VT61YkNu05P2ImMiZQAEllrWl1rk3MHu/PC
 Xv3rhp0NP15FbpQFBu7laDnxAlEJW+aX2pqMkx6280V/jwtk8k7Fkfv7L6zwsh6y0SLR
 YaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760657164; x=1761261964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+JggmdmCtBj6KDkuLqnnfKIt7/ceu80PeaihGVC/S0=;
 b=esF0WNXzwliFSLfwLiE7UUQIaks82qFfEnb9MtjObxrBUuVG0GN2Ndk+aCFJZX+7rI
 4PH9fVqCOldsriJYR2OaB82RPFnKxgfzlSdDWMhLht533wpMk8UgZhofJgsCIHucYe6C
 ZPuY/md4/ZfA5hy0WHTgR4j2tacvdzLrPS0B1zL80PrbBSCV8rPdYfjXJDYdoX3Rxruu
 Mux8ncPXHlveBEeHI/JDDhgYZR4KASyEtzh/rAdaitigBUQl65WXTY9nn8V8g+7970TX
 Y3qaEjC/wo5bPgBP+XM2xybRt/GllmmORTwxz5XYE+Ix03YILXUEG9qhpiReTrXepgnp
 AT3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNn67wvhmbtp+1dwyTbdA3IBPFQyNT6cqP3HYXp7BRJ4AqOc++9aUQ977rb9fJXLwdH8sxaZr+9iA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtQlPmlMHW4bRku16SY19G/gSYsXfBz12toc+xagB5fSxBgdTv
 rCOi6MrM8s5hSQ6OceXdcivQT3hiWYkBQZ+lB0luIri10/+SUUrm3A6wR+LVQ9Vj7Px8vNMA4T1
 OE7g9BvwJYPTvGsG1CvT7S6y32+pCNOA=
X-Gm-Gg: ASbGncsFYkF0mXu4vsi1vF+I3jEa39KZPA14KWoOvK5Ui1P/Fjz83EgAei9XhR/BOFk
 XG4lB4I9pHAr/Gej3JaHnrAcoP+Frh5GrtLYpmSHI7NpQNixj+FTzRpDwJLhbi9zJsO1ysijIBO
 154mDhhv1vn6Q9q7NURCUTvq9EtD6E6OiWcEiL59pR/7cu3GzyusvgkqievoBxTY/5lJzOho6pP
 l9ZJL5E+419ov7dEkJwgHiSMTy6zItNAqQ9wgd8By42Z5gW6nMp8pEbXLnyqVthug5D/jdlkBGN
 E6RUhXjJlJnCrsADzSssTbCYLE550rOkTKHgp3Z4c2GN4OF3fDolA0n2faIRckry6TCi/aBeNDu
 t92hhdAyM2NsfZw==
X-Google-Smtp-Source: AGHT+IHnRUogCTLR4j2SRK3tnx9yJeIhgejmiTK6A9npVoSOmDy3a5IB+8s4WFVWl7NclfK6Oapzgp8ltJtmKXRKyH0=
X-Received: by 2002:a17:902:d484:b0:269:80e2:c5a8 with SMTP id
 d9443c01a7336-290cba419fdmr9896625ad.7.1760657163954; Thu, 16 Oct 2025
 16:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
In-Reply-To: <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 01:25:51 +0200
X-Gm-Features: AS18NWAntWCgqHJ-0gybXjQxgpqfISwElGAlnBfAxtiow_eCYUtIQUGW5snmefQ
Message-ID: <CANiq72=bXR4oodrPS8_Dk59cNQa54EOzAPxp3r6e7BAKoZy2Wg@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Fri, Oct 17, 2025 at 1:11=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Since nova-core depends on CONFIG_64BIT, I think we want a helper functio=
n that
> converts usize to u64 infallibly.
>
> This helper function can simply generate a compile time error, when
> !CONFIG_64BIT, etc.
>
> We can do this locally in nova-core, but it could also find it's place in=
 the
> generic infrastructure. nova-core clearly won't be the last driver runnin=
g into
> this inconvinience.

Indeed.

Cheers,
Miguel
