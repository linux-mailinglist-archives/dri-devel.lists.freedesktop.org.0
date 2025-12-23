Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DECD8688
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 08:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32DA10E0A5;
	Tue, 23 Dec 2025 07:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ahPSnSLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F43110E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 07:48:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC8B344480
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 07:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ED3C2BC9E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766476137;
 bh=nNVjZYuCgUNvRIf5FpO9plp03v3td7UJLhhZt6cEf7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ahPSnSLgBqQfwWn4XDimrL9juNkiZVAy0x2OKarXgnUF2orjymCPMBXbE1zha5zey
 zdQNR7IuaQqPIttCzzhfd0XDZW4SD9ZGu2dgY5AnT1i/Zd+uLATrXWaIrc4n6wJ0FT
 y7eWFAoIpSCy0eJuzL6I+B6aTanZjXSPND9eJQu3MwCWdjBPrz0ueMsfub7Q4vu1tX
 VeptZviHnl6oj/lGU0rC5pzFtiMFYrGCy+lXdrX33XxQrUhNabj6d/XXHVXL2BOe3t
 2ywlWjjEif5vh8PLdvbzL+qdxdbzHERD/I9zg88RPNU7YcP3v/rJP8GurqyWatLCOw
 5iQHMbFbZT4Yg==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37ba5af5951so42318711fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 23:48:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX9Z6bYmK3halRQu7jPHCqfkkJedPNqUJOTPBOWMCtb3BmEmwWrGxdK0V4k10TJjYS/smylhuWpVSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIzoB0m22hbHEkCqVkylN31aYiunE8l3vTNQNG8YrfHCdBqXPl
 VwPzSw/rItQkuTl1zn69uO26dWlogvTsQIWf8qivdciTGJFy91rHm/gut4lIK4lKmQXXdwE820t
 RXYxcU8jcxWpL6UeWTRIRkhQD5iE2ffA=
X-Google-Smtp-Source: AGHT+IGmXhm2OTxMWzWOBhVvRmJ9kJ9vHSYPeyQXxrbndu6wjS69wPAEWwKEE3py18ZkaMYQ5RVWrna1+jAxOqMgMYs=
X-Received: by 2002:a05:651c:549:b0:380:989:f602 with SMTP id
 38308e7fff4ca-38121568d0amr36693561fa.5.1766476136227; Mon, 22 Dec 2025
 23:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
 <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
In-Reply-To: <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 23 Dec 2025 08:48:20 +0100
X-Gmail-Original-Message-ID: <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
X-Gm-Features: AQt7F2peq0jDPThnB7INsXhtdZ_Tc0tpwkzLeYZUrxxW7OXPZR38v2fFhD5Oc18
Message-ID: <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Mon, Dec 22, 2025 at 3:18=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Tamir,
>
> Please cc me for any Tyr changes.

Hey Daniel, thanks for the reviews! Looks like `drivers/gpu/drm/tyr/`
is listed in MAINTAINERS twice since commit 29e7c311b ("MAINTAINERS:
add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]") with
different sets of owners; it must be the case that last one wins in
b4. @Danilo is the overlap between the entries intended?
