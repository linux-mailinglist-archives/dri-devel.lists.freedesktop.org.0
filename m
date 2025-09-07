Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F452B47CC6
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 20:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB6B10E0F3;
	Sun,  7 Sep 2025 18:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nbm57BH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E710E0F3;
 Sun,  7 Sep 2025 18:15:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-24b157ba91bso8778435ad.3; 
 Sun, 07 Sep 2025 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757268903; x=1757873703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=so7tAPulNJoJZMuWiKPDBzUnu5rjpYZ5RN5Pr7FZmqc=;
 b=Nbm57BH/ncVgovAQ8XW8SXr9T3MA+V2JfcQlJQCsnzG/3RyQ/7vS8Lan5HyCY2E4Jq
 OQai6apoHDfhr+S2zbIDJz7inYNaQC6maBlVQzu07O176T3wm+gtfSSvo7PiT8Ckx4pE
 9FmRcLB7OHzpaqFt0veLxCcQ3J4fy14EKviug+5DEOX4hY2qcT0AMJM/YDvusB63bkxw
 0CmXY0JKJ1wdUR3z4pxU/UJRI9px8++w1H9gDh0so1XOIwkKWV/sWXmIhE5oo3k4L2xP
 mKVmUdoSlxY92tTyLMJdd3vKSHgP4FMDlUOE7B9fasBJHIRaERPIxOdk4F9KXTYlNo3C
 Q6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757268903; x=1757873703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=so7tAPulNJoJZMuWiKPDBzUnu5rjpYZ5RN5Pr7FZmqc=;
 b=F8lS6Qg/WWeb0IoGD8WdiSIEX2eyeP5ufWwyxBk4MdrIr9eiP44ASNbK8zkPwXbJ6e
 A56EBpctQg8HH7OmjU3hagBagHpmR+3qZLXrgdLKd3dLqTGJx5vmzlh3WOnPFZrLvDCU
 q3naV4VWXycLKY189dd+pCu1rf6BbcXbq2cKwRUAUHh6kTK7MyoQyXoTMSXIazai2cnc
 EcO3+8UVFD0bt+4PGhZDmSxyMFSIK39nRcONL6NLg/PY1jUrQNEL8Z9VpNyxxDGx0dmx
 DTarbNsC+r0dcvnLE8KmNvVpMUvTIbqXROcSUwhvijuYlcq2Y6PRM8SJgL7Y0ytsVsLr
 zL7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn1yNnYFfanO29+9h/fi9qGevYQgSy/ZvryOajQJ1o6XGVL6AQUAbQJ7N0hmorpnPMh4OGwrTL2w==@lists.freedesktop.org,
 AJvYcCWfLXX5EET5R2d6l4izY467lQgYxhFHnoHYiXL23cxvViPbWpENhXpJSva8wnev4NsHzNueF/avnXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUUzUQzWOnky7rwYU+YTBTbawRIHX8nGYRj1HsgFD8t0OvMVjz
 4tPsyBDTv4aZseJcyEAJtsuo9UcyQTmbIJXW6m9krlYrIk+ULsAunvzN77RSemOUSbwdliDTknv
 9BizQvUoIyeRU2+z+bu0yRosO5nzu1+s=
X-Gm-Gg: ASbGnctbUdJ6CXQXRJ3gVENYM50CtX41zj2ehWL++DJlexeFku7zT2BO/lfI5k0t3yL
 oItesg+o6q/67nabYZENfPj/9Ku+ROjIV1okzKRk6qpheo2IwAG3gBShgQ0wK42gjLEIjMBQ71E
 3+DbISr2F4aGyYOKze8frxEYS4HUNSVtnvSvYbh4yoNYJKVTItalv/oLLQeYjqN7iP5v+AujPCG
 bZRlgOCKGw3uxHZkGS/FJjgMXlplATHO3So+nWA6cKj5IgzDpEEqG6YrT3wRL9ziInrCwafYHcG
 Mp07c0ULuQ43ep59g3G0k+727mzdds0z07h7
X-Google-Smtp-Source: AGHT+IEFi+yiD6pVt8xzykvdhNR8iAoTqSIP3/VvCtQxgaxGbdva/bQu0Po7Zl81J3iNwIzpTh79xZ2zh37yiiaAZ/4=
X-Received: by 2002:a17:902:f644:b0:24b:1421:bbf8 with SMTP id
 d9443c01a7336-2516697f1d8mr44536825ad.0.1757268902784; Sun, 07 Sep 2025
 11:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-5-joelagnelf@nvidia.com>
In-Reply-To: <20250903215428.1296517-5-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Sep 2025 20:14:49 +0200
X-Gm-Features: AS18NWDG9a3NtPqmPD6xE-rs6EheOTI3-aJP7xdVXVOvHjupVzwUtV7enM1PPPs
Message-ID: <CANiq72mx7NA1KD5fw98kba+3oENHW44QXVGO1VmvPPUKin2LPg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: Move register and bitstruct macros out of
 Nova
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
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
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

Hi Joel,

I didn't check the macros, but a couple nits I noticed in this patch
in particular given it moved it to `kernel`...

On Wed, Sep 3, 2025 at 11:54=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +//! A library that provides support for defining bit fields in Rust

What about just "Support for defining bit fields in ..." or similar?

> +//! structures. Also used from things that need bitfields like register =
macro.

The "register macro" part sounds like it should be formatted with
Markdown plus an intra-doc link.

> -            ::kernel::build_assert!(
> +            build_assert!(

Is this path unqualified for some reason? Does it mean the user needs
to have imported the prelude?

> +pub use super::{bitstruct, register};

Please justify in the commit message why we want them in the prelude,
e.g. are they expected to be common? Does it simplify some code? etc.

Thanks!

Cheers,
Miguel
