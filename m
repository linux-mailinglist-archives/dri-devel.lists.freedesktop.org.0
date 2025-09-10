Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CFB51363
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 12:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73510E2CA;
	Wed, 10 Sep 2025 10:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N2Ix8ile";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251D310E2CA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 10:01:12 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24aacdf40a2so16479445ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757498471; x=1758103271; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4uYyjZeT3X1uLSrC3Wk71Cjszm5hRnmgp8XTdb5gD4=;
 b=N2Ix8ilefwmgCIehumuaci152t5SV3Im2BveiuJrL8TFqP6rJ7Oo2tlxI3kxBnGWCY
 NNaFYZ/dwqBb4p3un40YMqqAUag3DmWtgJr4TUHCX2mvzdcTgy56aCiIWkR16rofZeE/
 Ay60uNgX/+yMCoHVRXfYR4dD/gUjifmo6L8IvD7jsJmKqyCuHl9bAlMUCOfwf1Yk8O9Q
 w7i+CN+T4QeoPgnrLz52pXy6pCjIwxY6tj+EKbz2NFZLLZlt7H/7DjWV+/blXwk1zcrA
 JOv86dINu26DAzCgveVwWQ+uwGM5MONpZrinoIzV6EK+wUH+4LgtMOxW79ur06LWL6Bc
 5wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757498471; x=1758103271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4uYyjZeT3X1uLSrC3Wk71Cjszm5hRnmgp8XTdb5gD4=;
 b=LYQNkWsIKWcKMdtezOhse7o5nfxTPmpzE3M4Orcu8fkgwkMTMFRHn+4WN7mYVhsm4A
 U/whf/4gelIGHp5Ofptgy7JC6yQgtSCJ84MOvvIL+kRHe99P5LyXt7sS8t6fx9Kx/9fg
 yPUiAyChAMi1svaINcajuzRwf03i7E83Hf772cqQboB9jqMLOtyIdu87am9/Qk13J7L2
 liP9GtCmyzCHw9HBMKDxhuk/flxrHJxrHf7dSNMs/M3172cxir3f3IsykClCQBMj68Yi
 YdDxdX8ykQ/WK5c5nlVyUUeY2ZDHZKQl72KimdQvs70p3qMLmEnw8+I1Wo1oO4snD9V9
 Y7gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeE6LIBDZqw+zh40v8cwlurnHM966I5FNVoRIBTRO1ipz0QIMb48l8esCW/hzdaMsLFy0zOSvN0go=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEgeaoVnyBi8aQ7LPXvrYjvmOhkWZQbDZiYzfSrrOJzkV5cFW5
 OAK076EzeLD8Vrn0tsSHExS+a73Pgov9a0roXsU3CVRPNyzgtzN72sNJjeh+KyE5aj5sFv4Sign
 JaIeOm1z3PIKDL/PJ+2WtHEiC/+8hats=
X-Gm-Gg: ASbGncv1z4jDqeR/HY0WdO+c1hIt/KKSQSqw8sZEQ8kPHcuvf0Nl3OpLILrB4ju0P88
 KxLCpD5UDVuS9nvSz+LKpELGgDxZrP0aYq28vREC0iC32A1nmHfxIAdm19+aL2tswFKgorccK3U
 pKZU5xpFh8WfuVxhHhKTNeVIhplFB4Hh0IXjKL3CNTMNcnefAMLYUHJFCrgOs02R/ZawH+3cB/i
 6E6HQybNxvQ/V6dLa2/f6UboFJmWLK9Fj8nu0zvwUNx1SZesuKclNNAndAwToGepyy4XD4EEn33
 +rAd5LXgRNfzipD0l7RctSL2vJ+tPqiQUp19
X-Google-Smtp-Source: AGHT+IEAL6fPEIytHux98x5koSeZTz+GJXocZx4VGKO9evNP7NMBw73sdhCn/m6+6whVEQTC76oWfQxflZiVR9UaSxU=
X-Received: by 2002:a05:6a21:6da1:b0:246:d43a:3865 with SMTP id
 adf61e73a8af0-2533e950b02mr12197267637.1.1757498471364; Wed, 10 Sep 2025
 03:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
 <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
 <CANiq72=nGbziZCKt=AneE_vXw76i=+td0dSVfbOJ8kJ9eYHw9w@mail.gmail.com>
 <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
In-Reply-To: <DCOVRI3TVJBN.3OGDSK8HW74LL@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 12:00:59 +0200
X-Gm-Features: AS18NWB3P1o-FQ07s_jB_zwoyBitfxkjABJvrHdFdftaj751AhGxluVMI4T6kjw
Message-ID: <CANiq72n-q0vdzp=Tb=brue+BMoNYdCTKsqcMYUsvKgvu9ZqGoQ@mail.gmail.com>
Subject: Re: Implicit panics (was: [PATCH v2 2/8] gpu: nova-core: firmware:
 add support for common firmware header)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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

On Wed, Sep 10, 2025 at 7:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> That would be nice, but also wouldn't cover all the cases where implicit
> panics can happen, like out-of-bounds slice accesses - we can't have a
> "report-and-continue" mode for these.

In principle, it could cover OOBs (even if it is a bad idea).

> But perception matters, and such crashes can be damaging to the reputatio=
n of the project.

Yes, we are well aware -- we have had it in our wish list for upstream
Rust for a long time.

We are tackling these things as we go -- e.g. we solved the `alloc`
panics and the ball on the report-and-continue mode for overflows
started moving.

Part of Rust for Linux is about making Rust the best language for
kernel development it can be, after all, and so far upstream Rust has
been quite helpful on giving us the features we need -- we meet with
them every two weeks, please join if you have time!

(Side note: the "safety" that Rust "sells" isn't really about avoiding
panics, although obviously it would be a nice feature to have.)

> Writing a uC topic proposal for Plumbers right now. :)

I see it there, thanks! I can briefly mention the topic in Kangrejos,
since we will have Rust representation, including from the language
team.

I don't think the discussion should focus much on "Do we need this?"
but rather more on "What exactly do we want? Would we be OK with a
local solution? Do we need/want a global one? Would we be OK with LSP?
Would we be OK with no panics after optimizations, e.g. a link time
check? Or do we want full support in the language for guaranteed
non-panicking functions? Do we need exceptional carve-outs on such
checking for particular language constructs?" and so on. And, of
course, "Who has time to write an RFC and implement an experiment
upstream if an approach is decided".

Getting data on "in practice, how much of an issue it is on the Rust
side" would help too -- those with actual users running Rust kernel
code probably can tell us something.

What I would personally expect to happen is that, over time, we
understand better what are the worst cases we must tackle.

Cheers,
Miguel
