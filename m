Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303E07ED217
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 21:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B532E10E212;
	Wed, 15 Nov 2023 20:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C6310E212
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 20:34:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BF149CE1F21
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 20:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001CFC43395
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700080468;
 bh=EU1ORu8L0oCIrg7KaHoD9GBXRRT/HQ6jol7CgcdHKlo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=feFHmaZTE7bbFBHltT856OOX0V9ixOTnGfRhWzi0LSkza9h0xfzTCEvc7BASen9lc
 lQSg21cEniRNEJc0rx8IdoljTCJJdZev3mcq9zD6h3g7PGSGkzFhM9o+iqEtavMk5s
 cF4Fl4lcuTWmhJliFFcBR+B/IQjD1HsyMFHMPu5QAYoWUWyq4kriwG3sta+wmMZQ8u
 4iy+DTsT8ZzJ57bQ7IyEAwGYM73GuPPkHXMToda6HmGX3gaHyDE0D3vDMAtC0LXBEr
 4QtSuBuLsZdBDqG8KO+ZsNmOemgaUc0Ri8dEfpabAcjy1RWeLDAQoIFUtCnm09wH2q
 W2NyWYAkKAL4Q==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50a93c5647cso57162e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 12:34:27 -0800 (PST)
X-Gm-Message-State: AOJu0YxI8Yu6IEKAYkkveU5R1q49FS/JtKvMPqu8Qy8g/wTJz1EUdSl5
 qyCT7+xWg6FnweKesl1M9Wvjowk8vVsK1OISgw==
X-Google-Smtp-Source: AGHT+IE0S0tK/GSU6Wv5fUjZc4pGvPrcHf9BeEhRUDhIFnZWd7FL+/kFO75KxRbZi65Q9ml6nHbs3chKQp0jaiE+FqY=
X-Received: by 2002:ac2:4907:0:b0:507:cb61:2054 with SMTP id
 n7-20020ac24907000000b00507cb612054mr9866660lfi.49.1700080466108; Wed, 15 Nov
 2023 12:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20231113085305.1823455-1-javierm@redhat.com>
In-Reply-To: <20231113085305.1823455-1-javierm@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Nov 2023 14:34:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
Message-ID: <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 2:53=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Some DT platforms use EFI to boot and in this case the EFI Boot Services
> may register a EFI_GRAPHICS_OUTPUT_PROTOCOL handle, that will later be
> queried by the Linux EFI stub to fill the global struct screen_info data.
>
> The data is used by the Generic System Framebuffers (sysfb) framework to
> add a platform device with platform data about the system framebuffer.
>
> But if there is a "simple-framebuffer" node in the DT, the OF core will
> also do the same and add another device for the system framebuffer.
>
> This could lead for example, to two platform devices ("simple-framebuffer=
"
> and "efi-framebuffer") to be added and matched with their corresponding
> drivers. So both efifb and simpledrm will be probed, leading to following=
:
>
> [    0.055752] efifb: framebuffer at 0xbd58dc000, using 16000k, total 160=
00k
> [    0.055755] efifb: mode is 2560x1600x32, linelength=3D10240, pages=3D1
> [    0.055758] efifb: scrolling: redraw
> [    0.055759] efifb: Truecolor: size=3D2:10:10:10, shift=3D30:20:10:0
> ...
> [    3.295896] simple-framebuffer bd58dc000.framebuffer: [drm] *ERROR*
> could not acquire memory range [??? 0xffff79f30a29ee40-0x2a5000001a7
> flags 0x0]: -16
> [    3.298018] simple-framebuffer: probe of bd58dc000.framebuffer
> failed with error -16
>
> To prevent the issue, make the OF core to disable sysfb if there is a nod=
e
> with a "simple-framebuffer" compatible. That way only this device will be
> registered and sysfb would not attempt to register another one using the
> screen_info data even if this has been filled.
>
> This seems the correct thing to do in this case because:
>
> a) On a DT platform, the DTB is the single source of truth since is what
>    describes the hardware topology. Even if EFI Boot Services are used to
>    boot the machine.

This is the opposite of what we do for memory and memory reservations.
EFI is the source of truth for those.

This could also lead to an interesting scenario. As simple-framebuffer
can define its memory in a /reserved-memory node, but that is ignored
in EFI boot. Probably would work, but only because EFI probably
generates its memory map table from the /reserved-memory nodes.

Rob
