Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B568C996FC
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD3689CC1;
	Mon,  1 Dec 2025 22:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NL0IjXL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7DD10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 22:50:46 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-299e43c1adbso6615475ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 14:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764629445; x=1765234245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
 b=NL0IjXL4ppEsD8It9WKJQ2oCmbQgUJClYKnnVewEvUCAhjM1jcXEnsSv0ePGpfv2sh
 JhFG/y7IfeAEnPopVIvcnMz/JcScTs0PKQoEsSeK8htDv6rN6Ss9mIg+45BPnot2MFYi
 CpmaO20eL3Eg2wjQU6dW+ljx0E8IwEv2AANHXhx2OAGB4GFODtxtWZXRheqqyUDM5nlg
 WQhIxjRwdXbjA73hV33Yn1FO+7Fdps80pJ8Hyb/1iKeD21Cf8EdNfXVS+3xjcaWBVdR3
 x69+wBgTPqKdwUsja9vNqs1jwLI+IaGauErDssFB03nE/yFpZI9xa/OBo/UoLCSXRWYy
 eqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764629445; x=1765234245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o5MpGRWt1QbTCIx3psi0kP3FtONWDRDv/mGYqfAxpuE=;
 b=fO2yg0xqqsGI7KcI6T/qwkd2T9VlM6jJAlVEkQocCBXS/QrmX9HjOWI5Uts1r9rsn2
 laIhYuSO00wdmwHyRd0mT2z9rOUGgHsXIP7cE642xR4SVHEaMgTaQNqw6uM9o3Vdfs1k
 XYkwV8Kp2h4601HJOLI1n6ZnimcpbKJLnWhmx+qNqJ+/tavQsU8sYtPOf5M1r61izvDy
 nDF1NRY2sDCNrBaiOBiapUXXKJYFrnybIerSpZ0FL7ihHkyAVtC/s+QqSLwBWmb9SECx
 Olg0dxmmYlfkU0GdU6VxH2ZNd+xDwvmXaq3p2SzVADtgAGR5+dedAnRK5DyZIZgJloOW
 BINA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5g4riS4Qc6+Whm8SKDZw6NBG45SDXAnBLEQq9Aubj5ERSl9inAnpicUt2z8WSLcKvoAlgJQfj+3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhYzXB7QiJ0Zn8RBYEs8JUt7hpXneRZgvRgiT4exxxb9pwN6Wt
 cOCdAuerQngQh/bhqAbvz+8Tsqm509+Ygl+qyRAcjk/pOm/R6BEmDrZCV79VFMwURCiE4+yqz22
 iRrbhF3Rgb9MABhmDI24/JBGbMBQH1CU=
X-Gm-Gg: ASbGncsx00ODTjaQjMHnNJQ/zVCPWXnxEgFIIdKHHZelxh94DudnCD4/Vybr8M9UvgJ
 vp6/bCi0NQXBdtywKivCCdDCExhabChNwVcKfVkuUx5eS09lxL3b/vo3vCAFje1AoKU2u6R0H88
 xbJRAsB98CeDZ41OH/JcIsvoXwBhbMAmDfNeMQmk53YJKr/usFIZhVwVreVWo8KZwj4IZ+Lg+T1
 NKFYWtYRq+jtOcp4rHZYsFL9M0fJM2N7j0/A4318SknWryIIc8/LyDhkUlEH2qr3W7obYbD8vqK
 wpJlFyra7iKLxGd14TJZh/hRBSyWbLbkQ3SsaZ6m82fQWtcRzj55iw8WwXtBv1R/TPSl++xMwr4
 acOlxsjKmIr7+Hg==
X-Google-Smtp-Source: AGHT+IGHxGCGzFVwRUGMDnjtYFSdBL47/yuzjgLbitj4yeg6ia4ATcJFfArtvcqBElQcbvEvQwVhmeOGDZ21tUc8jmo=
X-Received: by 2002:a05:7300:e80a:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a718b198bemr25658546eec.0.1764629445406; Mon, 01 Dec 2025
 14:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <2653abf6-5cd4-4385-b7c2-f377a9503160@nvidia.com>
 <7a88da9f-c67b-4a68-b8d6-a66f9096bab4@nvidia.com>
 <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
In-Reply-To: <497c91a2-ca6c-4e05-bc5e-7c3818302c7e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 23:50:33 +0100
X-Gm-Features: AWmQ_bn7_DfyaSJT0jy3fNrYUWknruqwwH7bRpIZRSHNxUbqTeaYfAUp-OMWGok
Message-ID: <CANiq72nhkOMGGb7evGn441J-8nX=jSWeDTASn0gj+TCa692B+A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: John Hubbard <jhubbard@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, 
 Joel Fernandes <joel@joelfernandes.org>, Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>
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

On Mon, Dec 1, 2025 at 11:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> But for API developers, the problem with doctests is that no one has ever
> actually *run* the code. It's just a build test. And so critical bugs, su=
ch
> as the kernel crash/hang below, are missed.

No, it is not just a build test. Doctests are actually transformed
into KUnit tests automatically, and `assert!`s inside them actually
report back to KUnit too.

It was a major hack to implement, but I am proud of that one :)

That also allows us to build them with Clippy, to e.g. get the safety
comments right, which is something normal Rust doesn't support yet.

We are actually getting a feature from upstream Rust to support it all
in a stable and nice way!

Cheers,
Miguel
