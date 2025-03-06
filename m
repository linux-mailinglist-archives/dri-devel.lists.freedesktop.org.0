Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D57A549A5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 12:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C99F10E94B;
	Thu,  6 Mar 2025 11:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ivQ+J6J2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144EC10E949
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 11:40:33 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3f3edbef7d2so185635b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 03:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741261232; x=1741866032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gOXYzq9nqcs8aHgZt+3uZFVTQyVn9buEBCz2wyHWs4=;
 b=ivQ+J6J25Bjcm8tXQWOdZ6xeUMvKZFk+DGOxEBmLLvTX+m3J58CkODW8nAmmQ+T749
 5+pAB5TiD7Vb35hT+Da3LNOO7tRebSK7T8FTnS9F7hepmew6hzIbLFFRFA2gVLVCGJxs
 o/Y4lnLE5cC1361kvTlujUGZBnJ5goUh1l2xNI6iltmiCJb0cUvJJ7A2BhpvzXz+JSJe
 jVmnuQjwfdiQgHpkLREV4yzFGSFRfbux1kIesbvW6bxB6oCcQqgRx0Z623J1cwEzQobH
 Ps5tEMiroOBWXchAAUoJyHc9HbdgUfqjSyNdq+jA/iTtdUOebxxLkB1ihtTh2tNeLNhT
 f0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741261232; x=1741866032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7gOXYzq9nqcs8aHgZt+3uZFVTQyVn9buEBCz2wyHWs4=;
 b=cL0K0qxRuU2e4TQXBrqaL0B727CZn3Yy5yVNgWk9nV6YJYC6H8P5n0GsGJxyN8pTr9
 YDU/ZDOs2O531RW2cDMTmfUrHoYTHa+s/3JmoItFXR2Pzvl2GnALfhHhGHAwqy8MuoKI
 mGPsuFS/AQtaNqXOFzHBvh8jvFKSRULf6AHyAj+DLzrl8MJXkXyCH0CoZ6yQ676cr8SL
 9wv6VPP4v9Bc/o5H+UeJiG9bAkGzCco6tL4QB8ee/e145xBLGSLwmmXjVhP1rlAbSKCK
 BLwfiz+JnhAA6vg758j+tTPhRGJJl94mbcARWg9D3iYTPAuwt4DeL6oqR5Ux4DNRach4
 7bOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqr2hoy8nbO/ylfAVLlNxPiFc764GbmPvQLDnaZIjStQC2a6DpuigKTI8PY29D8eR9X+eavWxu0rE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxvu00xXuQIlXN6K4teS5mtqGDfdaJqSGza0prG+FrIhKjj0ZZp
 QT/R8i76RzNeNuGByDBywTSzmULbTrV7/ramF3JFRNo1DjBjV+VNI0ZQFfz/zvgoPGcxMHmwghp
 b9rH7F8oCdlj5iTW5vebGcjF+A1Q=
X-Gm-Gg: ASbGncuuleQSWfyWaD2LTeo3Gx4iUiTxlp5eD2CdCUz6F1P+Y3JOrrRcembGBSTfPHT
 jNRJpFx8AaI3qTbadD45u86pJCePzJbER6Yay7Bpp00O8mDp0Thm3Qcy6gyzRNkJlJlIWU/vBMg
 0YcIIiuuVVqWkz+D2PcZ13tZFx
X-Google-Smtp-Source: AGHT+IEBHIhyO9+1uVVsz6t3TEe1SqOAcPgdQVGj4AVDvCzuJWAhsMw6GjuELn/dnLHLmMgNkrhRhzGAWIhQai37hts=
X-Received: by 2002:a05:6808:2e9a:b0:3f6:7832:77f1 with SMTP id
 5614622812f47-3f6831efa80mr3740715b6e.33.1741261232222; Thu, 06 Mar 2025
 03:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20250306112046.17144-1-i.abramov@mt-integration.ru>
In-Reply-To: <20250306112046.17144-1-i.abramov@mt-integration.ru>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Mar 2025 12:40:20 +0100
X-Gm-Features: AQ5f1Jo-Q_unUYceAIgdIls3n-1TkFDSFuK08TpYbXPzRE5wm2xyWkPcAOXeLSI
Message-ID: <CAMeQTsZJp7AGYtcanGwJObFw=7U897biXvPs4xm-igCFN_6G8w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/gma500: Add NULL check for pci_gfx_root in
 mid_get_vbt_data()
To: Ivan Abramov <i.abramov@mt-integration.ru>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alan Cox <alan@linux.intel.com>, Dave Airlie <airlied@redhat.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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

On Thu, Mar 6, 2025 at 12:21=E2=80=AFPM Ivan Abramov
<i.abramov@mt-integration.ru> wrote:
>
> Since pci_get_domain_bus_and_slot() can return NULL, add NULL check for
> pci_gfx_root in the mid_get_vbt_data().
>
> This change is similar to the checks implemented in mid_get_fuse_settings=
()
> and mid_get_pci_revID(), which were introduced by commit 0cecdd818cd7
> ("gma500: Final enables for Oaktrail") as "additional minor
> bulletproofing".
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: f910b411053f ("gma500: Add the glue to the various BIOS and firmwa=
re interfaces")
> Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>

Thanks for the patch
Applied to drm-misc-fixes

> ---
> v2: Update Fixes tag as per Patrik Jakobsson's observation.
>
>  drivers/gpu/drm/gma500/mid_bios.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/m=
id_bios.c
> index 7e76790c6a81..cba97d7db131 100644
> --- a/drivers/gpu/drm/gma500/mid_bios.c
> +++ b/drivers/gpu/drm/gma500/mid_bios.c
> @@ -279,6 +279,11 @@ static void mid_get_vbt_data(struct drm_psb_private =
*dev_priv)
>                                             0, PCI_DEVFN(2, 0));
>         int ret =3D -1;
>
> +       if (pci_gfx_root =3D=3D NULL) {
> +               WARN_ON(1);
> +               return;
> +       }
> +
>         /* Get the address of the platform config vbt */
>         pci_read_config_dword(pci_gfx_root, 0xFC, &addr);
>         pci_dev_put(pci_gfx_root);
> --
> 2.48.1
>
