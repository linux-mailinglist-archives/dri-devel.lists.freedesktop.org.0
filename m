Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0481AD1459
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 23:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3E510E544;
	Sun,  8 Jun 2025 21:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XhFkY2ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9A210E544
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 21:06:47 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so85758a91.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749416807; x=1750021607; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biTxWw1XUhzgVcSaJ7pNel53LmqsXpVkyjyl/XngF0Y=;
 b=XhFkY2ftAsg/8peytdy5QD+jB+49nktACbrPuXvfMdh1krE1Y8tT0KLZ2x/CXGXNeN
 XVL10YBb7E0RScapU/F+lrGpvIXlHC5I4DcOFyumtAAMp6p7+EcCRCKFDTCGsCwmeEg7
 J0SsYZzZ8arKoORImxcGEddx243/ASq6sHx1TX6ZM+xnJb4oi03qI53L/9f4VojgidQo
 QVLYiqtO4sGKqr3PKVoOCzQDwqtqI5svNKMcohxB5WtDeHkuRyoj+3xWmr1p+6lLV6VS
 ifyZNdxlHrKGMj7KAfSGNrR09JzdaoztUsnuQm/XP0qHmMHt1f8L8KTuP/aQ0DcaBIZK
 CfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749416807; x=1750021607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=biTxWw1XUhzgVcSaJ7pNel53LmqsXpVkyjyl/XngF0Y=;
 b=UfRfa8tiuL648P6zXbbNRgF3yDVmNifoTK9lY38iY1HJHD9ec4mBO5JQjdas1r5PK7
 3cLNkPOfzvLWmuqUlcGoIxUcoM9A4YA9yEbpUivlRdmtSI5a3hmO9QyRO2j917U6V1Pr
 sT/ISHzx2FrXg7/sTQUTAQQ79K4PfzX4YebjZwDJFFObF3nWMBKWVbPiJqF4gKywSxvn
 GgIF68KYY25Es3esdWeB0xh8xDf+u5UcJWOjG27kmEcuhvtILVqZ46QPEKQ2Gzm1FC3a
 WZEGlqIfSmPr2wQjE6vh0Gk8dg/1/GjGpyytdtFwIgweaTNVWhlacpC6C1tAVjNzS3Q1
 v3yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi3MqiH2ORa/ALZW65P4AarJeH1HvH8wiz8ZeXX3B/1rQDHemw71sP+KSTkk9JkuqRrJuMNlICvOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiX7Nt2xYkfp3dJYxdhif+WzZTLz7QeVwXMTVX/m+Sad3j0t7n
 m0Mgl9eQ+7LuU2dOdEFdFcuQ3IF49N6UpCHyA2hTi4c9N1XPHDFM5V5X3PpCf7nxuXUSevmpS9V
 aWseAvMJTzUkLK8f8sSZJlgVLWmjB3s4=
X-Gm-Gg: ASbGnctTQDHUDoGzYS3CTrZQX3py6DCVKdsaUGT1LA2lDk61RLzt9fADV74WGu6+F1j
 DVJbn0flgudMpk0HigRMeoyBGEYiXKfQF0Uc4RFUjOyVqm5LEo8sy7yhu2tyRa3ybNvN+eU01Uf
 WzuH+wZPZh+qTBXoMoKJmL96jI7dCJlFrRkhYKSIcxlgU=
X-Google-Smtp-Source: AGHT+IFZoj5H78nminVpVR/Eh5MZKRu2FMUA3tOH8l/xEYd1B6AKUG5XkEb/S2u3ZweF07euOUkBTgoKB1wHH0vNBBM=
X-Received: by 2002:a17:90b:3a87:b0:312:db8:dbd3 with SMTP id
 98e67ed59e1d1-3134e422457mr4671636a91.6.1749416807159; Sun, 08 Jun 2025
 14:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com>
 <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
In-Reply-To: <20250418-ptr-as-ptr-v10-4-3d63d27907aa@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 23:06:34 +0200
X-Gm-Features: AX0GCFsmqnoEKQUFsySPfR-zWKNBdsKqanc84VNOHBrhPbLWWUXTYAKIeQekh14
Message-ID: <CANiq72kWtEsXDuoXpbTNRLiZ=c==Ne=v4igxCWMwWFj0LOC-Yw@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] rust: enable `clippy::as_underscore` lint
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
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

On Fri, Apr 18, 2025 at 5:37=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> -            bindings::BLK_STS_OK as _
> +            bindings::BLK_STS_OK as u8

> -        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK=
_STS_OK as _) };
> +        unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK=
_STS_OK as u8) };

For these two: `BLK_STS_OK` was discussed in a previous version, but
why are we not using `blk_status_t` type instead?

We are even already using it in the first case, and in the second it
is the parameter's type.

> -/// # use kernel::{bindings, c_str, device::Device, devres::Devres, io::=
{Io, IoRaw}};
> +/// # use kernel::{bindings, c_str, device::Device, devres::Devres, ffi:=
:c_void, io::{Io, IoRaw}};

For v11 this can be removed since it is now in the prelude. There may
others that can be removed too (I would not add an import just to use
it in these patches, but if the prelude is already imported, then we
should use it).

> -        result.minor =3D bindings::MISC_DYNAMIC_MINOR as _;
> +        result.minor =3D bindings::MISC_DYNAMIC_MINOR as i32;

Similarly here, shouldn't we use `c_int`?

i.e. it is the one in the C side, not the "resolved" `i32` that the
compiler suggests.

> -                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as _,
> +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as i32,

Similarly, this should probably be `c_int` since that is the
parameter's type, right?

Cheers,
Miguel
