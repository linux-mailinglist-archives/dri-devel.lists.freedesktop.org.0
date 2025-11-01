Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F3C281CD
	for <lists+dri-devel@lfdr.de>; Sat, 01 Nov 2025 16:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1143D10E037;
	Sat,  1 Nov 2025 15:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+Ruzkqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150B210E345
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Nov 2025 15:48:02 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7a271fc7e6bso513117b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Nov 2025 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762012082; x=1762616882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
 b=l+RuzkqwIx5849FFR6V07P/2uqXMa5taRjjL+tkn6JAyBX7flT3/SsFiSsOst1EXOc
 4GJ8QLcVyklSG1NW3Nlm1Z1vlRYq0zU9h5OmIIun/odqow84ZeePB2fYLLO8P3Ut9GD3
 omxBqLFbpcnhaiF+VEKPepvI4iV4VBPL830PXhR+WWO3W+iiaTcAV6SvarCj+YuTDzBo
 RSEQ8iRFYqjzCVqoXGEDKdOE82swH5tJxo4EQXuEKs1nrgaIBmUU8zHd/lXFR4gfDpVP
 HYc46YeVkN3r86/RQaJDjt4/Rtj9T3z6yuMA09j7PF1iq2brLp0U8PUJnn84La7tzQgI
 OWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762012082; x=1762616882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jamIEloEQhiPyz5eXgKCJiNa+AjH+v3pihsy8kT47Q0=;
 b=nDVvEc1otX25DoKnvqhT52f2no50A3Q/a5cD/Q06iMdJY7FKIhselhZu/nismeZR/Q
 G2hb1Td6nI5W/aRLxjffNQTUbMRhN2d2T1pifqzMxJdiqGWtzFKBX4PEt92Zxw+ecauw
 tqVznhP8c2xxiaJg/qFCmKiQj7MtGJBaEq0cmYg+/PRsUxUd2XxMCPjQ7kBOLT7coZD1
 COgHkxRRZ3rkHNxt13QgSNQMSaCvso0A2LiWdklNTeRMDm+VCEZGjwwX/sZvghRNYgjH
 zTkoQ/PwKybGDR3vvDYAbhK379Z9LjoxvsfQ4is3fiHmRaY98qqwN3D8fTpF79nkexmo
 IeDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhKNk0PAxcSH+2Ec5ds1KFSusF0dMCLhFg9QdwebitPeOVo7aEN55jMObMoizmWYam719vWpQ2ac8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2un+Ln78Xqz4F0scUfne6W3SjD/d7UADEO1fzCYsrdJi2IheD
 s7tq79Zm9ogvzP/yA+5HFzY/ApA9wXinnk1gdHAUC5pIaDqQpc6Sy/jAzVp4ex7iqNcYY59pj3v
 slAqLJGkp8NPHzAYcpcG8wzXUp+zldh0=
X-Gm-Gg: ASbGncsHUySYatXBrJhhIJvtqPE79N3GVB2ZpM8+v9UOPqUnqFIWfTM3eWTTp2vcf0/
 44zPMg6QSOI3KhcDVXYJoDnwsRP79sw/ViOPiBlbXJX4RR/PKTpW5SAc6Cwj7tAUfllC+iFuYwM
 y1aMn5br3YKrI9YmLdZuDmKxWb5uKn9cFH5lk6TRgAw+P7jOr1OOU6MolcoSWO47IsnZPXeXoQj
 SpiSJ3arM5/Avz1cgGYixrJO9mQeg2nAdJRUlsi4iA9N6ZeCb7QvZfNa7ba1een55Yv4n8lFvox
 6ndR5biQp1cPBxrtYOeMZfol/aPbgp1GFx9ayggz2GAKD3OZqfycAVxcMto0tUB+7+Ei/Ziolke
 Q+S/uEpBqjm1OtQ==
X-Google-Smtp-Source: AGHT+IFeUdEiRDYhzdYh9fW3/jmt01WqbIkn5Mq3SaBz0gC57ZxcOJdIQVq5xYtfcf//SPWY5i1+n1E8bScNYE7sAx0=
X-Received: by 2002:a17:903:3846:b0:295:62d:501c with SMTP id
 d9443c01a7336-2951a3eda2emr49742475ad.5.1762012082347; Sat, 01 Nov 2025
 08:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-3-joelagnelf@nvidia.com>
 <DDVYVKDW8WG2.2STCJ4ZU00MZF@kernel.org>
 <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
In-Reply-To: <DDX1Y0EUNNPR.1KQ7OF9H4T81E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:47:49 +0100
X-Gm-Features: AWmQ_bn8sxdowUb4pdCsaJVkR0Kpv-lxkf62UR4OPlqQBFH0kCL_DBSvQwqzdW4
Message-ID: <CANiq72nJEGMaV7=omoM+9pKvQpUTq_sXNB5APhEY5vg_6KFoNA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C linked
 list iteration
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
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

On Sat, Nov 1, 2025 at 4:53=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Yup, we can probably move this into the doctest examples and have them
> serve as examples as well.

 +1, in general, one should consider whether a test makes sense as an
example first.

Cheers,
Miguel
