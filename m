Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4F1867462
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6258110F100;
	Mon, 26 Feb 2024 12:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Lkeq4/Zj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975210F0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9DDFDCE176D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4D3C433B1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708949300;
 bh=CGmK3cb5vpPiodIQAGGbcXy9IWOMla8yFmXkx6fEXb4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lkeq4/ZjvIKuSXWU4GdgsFWxWnVnCPxstYHH46Ps6nzkMosigbdK5q9hg6JBuaokE
 /3ICU3XIwo8pLf7HUH9eNqJXU6Etr2nszZ7ICw/2pGDLUYhDv6SeAqU0AzYXMcK+3Y
 JUL2EFNjfv6Nn8QBfjpqf8FY+BhkscDSDAnuEYqrTTh50BqKCKj9dYVpybT/o9ETLC
 SSkYmEReQQ1XcHVM+UDmSZ+mW1mFQriVzfMRbB8RlR5NASbUNyA0jugTDsxuxq0NAO
 OmdWCfY8pdByagO09L+BxpMXe5J+a82lASykV6xzejch/PYlaeW+kv5WeXrRTVZyCQ
 Yo71LO6AZTYtA==
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dcbc6a6808fso2150517276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:08:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUkaCwu26k+M4c88ZGA0A/2sEhjKQP49LIyFkZt3o6Bb/Cm+nSrSiQMw8jtymX0XTyY5sMnvX2AB+vgBi7twdR5YKnwafz9XlAWxobN2Cpp
X-Gm-Message-State: AOJu0YxdjWmu3iljPU1JkYi6p2pZsHNfEmy5eH4WQ1WmmMA2SCn1/R4L
 S42cK5/G7yZFmqg6EsfvXaxa9f7w26Nt6wmGpZ498QZZ3SUFDiet5I0GebY1iAEy9h1TSgHqjWf
 Z92IuTTuFMyPCrikIEgtFWMZeUvF6OD2CN1yWCQ==
X-Google-Smtp-Source: AGHT+IHeAB6njpp0OOhYsH7r9y+6wWY9Z5BETRDxuOciBdN7yiwuQsUEWB3+1RWp/dadJLAWNA7l1XzMj1PCBEhg7W4=
X-Received: by 2002:a25:bb88:0:b0:dcd:24b6:1aee with SMTP id
 y8-20020a25bb88000000b00dcd24b61aeemr3978658ybg.47.1708949300089; Mon, 26 Feb
 2024 04:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20240223150333.1401582-1-thierry.reding@gmail.com>
 <a6e73f3f-9bd6-40c4-abfa-84a22de07c23@suse.de>
 <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877cirpidw.fsf@minerva.mail-host-address-is-not-set>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 26 Feb 2024 13:08:08 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
Message-ID: <CAN6tsi4b+77udoHNhKjo8PFo9hdgrPYPz62D3f+rBqqw4Oymzg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tegra: Remove existing framebuffer only if we
 support display
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

On Mon, Feb 26, 2024 at 12:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> > Hi
> >
> > Am 23.02.24 um 16:03 schrieb Thierry Reding:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> >> not to remove any existing framebuffers in that case.
> >>
> >> v2: - add comments explaining how this situation can come about
> >>      - clear DRIVER_MODESET and DRIVER_ATOMIC feature bits
> >>

Fixes: 6848c291a54f ("drm/aperture: Convert drivers to aperture interfaces"=
)

Maybe this is more of a philosophical question, but either the
introduction of this hardware generation is where this regression was
introduced or this possibly this commit.

Either way, I'd like to get this into the drm-misc-fixes branch.

> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >
> > Makes sense as far as the aperture helpers are concerned.
> >
> > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
>
> I believe this is drm-misc-fixes material. Since the tegra DRM will remov=
e
> simple{fb,drm} for Tegra234, even when the driver does not support displa=
y
> on that platform, leaving the system with no display output at all.
>
> Are you going to push this patch or is going to be done by Thierry?

I'm on it.

>
> > Best regards
> > Thomas
> >
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
