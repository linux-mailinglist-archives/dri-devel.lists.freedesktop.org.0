Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3BB1A503
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2436610E543;
	Mon,  4 Aug 2025 14:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dw6wZkJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0910E543;
 Mon,  4 Aug 2025 14:33:48 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-312a806f002so763038a91.3; 
 Mon, 04 Aug 2025 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754318028; x=1754922828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0T5bNkjOLwUXjeJPET1PATYeweG7dwzoZgOeClfm6o=;
 b=Dw6wZkJI0YPdlMcZJ1fGFqIgHvxurPyObLGvB76U/9kIpsyLkIQenmss6ZkCL0aak/
 O7ZvXCU/T/P9lyVlCCe5++S6pKsEzshPOL+eBTB+e8AteHwjBWDEWpSfVuZA0zpwggsX
 CDBiI+QRhEqvajJEwVX3tQSzmvefBrezvnmDGK1ILFbXZq5o8cRQvFHoAGXaHO4fUVA7
 Pj27orQfYXxn9URv6JrV1yaxuSr45EsfvFXqt+deFbAftj8EejMr0IRwGP+e+z6Ijw79
 4HzUJO3N1fYBtSkhHzPq0PwUe/B4c6BoUUjgdkLj0lQeqIjtGd7mMzOAjE4kestSB7QQ
 CBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754318028; x=1754922828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0T5bNkjOLwUXjeJPET1PATYeweG7dwzoZgOeClfm6o=;
 b=NstmJWQI+pvGp1GLAJn6lVe1rle2lbXOLWmZ+f+MWRXDl5rPfsKf9FI09vrbJ+iiuQ
 WRGEgXgi7R1ISbEAfSgO5DjaPO9FZJqIjqU/xfI0HuxbrROaO9+5v2zCEmdTbAts9f7n
 K9H13IEq+glTizU3hZ+W1fjc45AFo2mMpGlbQwhX+1YzyT9vyAjN9kHJxv2A/xHxZRS1
 z5hz8ffh58ckSfg4+HTeWOWgDc3nBbjZKc9fYq9nBt/jdgR3Rdv8q8VJJ6zjQVZVtTAS
 lHxUeTjAiAj1Rf/li+hiYM8aLbbT/MO12Y1rKEFLc5kbwqW2fY/HWmSrWfD/Zo+MDoHF
 pW1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5uOTLHRhYqWzyirLq9h7seIjtxbtBKx9Bd858H+R2JZexA7fqgzlpZ6JDkBdNf8IcnMk6SKwucdUw@lists.freedesktop.org,
 AJvYcCUrZd6X7sYPzH2szw3PR7d/3zRWBVatikCUG/Zi+y47oAArmO6GKL9hEuIfg4flA0kQSJAtyLZf@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc/dwf6tjF7kokOupJYBvD7AJgn7/UdcoOcPq/daM0jpRq9v5o
 LuwjGtQEbt+ThkuzF622XF3rQ1XM+PQc/Z4xEPJ+h8TKl1A9IcHvzRHG0GwCalOvsnICos07wlE
 L3JadILJJmWTMawBo12lRRsbDA3TS0ac=
X-Gm-Gg: ASbGnctJ8M1C+sC7rGqT91zAosLdY30L7cVB4LXxwExGxstsWVFijskArLWi0C14VXi
 ER3yhR8F91EeECZ4F4JD1g7TLunv02LRVkHkvD7bom0VOlRMFK034uzKC/NpYLH1gF73ybsWCjQ
 yXhL85TUXl0A9QwgMdLN6BMg06bQA8rML9DCjMLLkL7cppOzzd2453DWY9kMiHl8r5+fQGmqzG7
 CQ5PnLCH4lXrkCdOfU=
X-Google-Smtp-Source: AGHT+IGLgrHrPD6FJJCxW/OQubfBA53Jif9CMWKpZX11VoglF2lNuXufKtAMRai10ALKftx1KRAW03kCD5zS0tZlsb8=
X-Received: by 2002:a17:90b:4b92:b0:31e:facd:ca30 with SMTP id
 98e67ed59e1d1-3211611c1b9mr5992708a91.0.1754318027882; Mon, 04 Aug 2025
 07:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-uartlite-redundant-v1-1-6141b97a3c7f@ethancedwards.com>
In-Reply-To: <20250801-uartlite-redundant-v1-1-6141b97a3c7f@ethancedwards.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 10:33:36 -0400
X-Gm-Features: Ac12FXzRBElqGCC5tidrwbuqwnJHL33G6bP8oj-Ab2Z3a5A_mE7hHKx2MC4CCxQ
Message-ID: <CADnq5_OdnxRhX74svDrrK6OtrcJKywJPvZDo=J_VArALZVUdDw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx9.4.3: remove redundant repeated null checks
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Sat, Aug 2, 2025 at 4:28=E2=80=AFAM Ethan Carter Edwards
<ethan@ethancedwards.com> wrote:
>
> The repeated checks on grbm_soft_reset are unnecessary. Remove them.
>

Same comment as the gfx10 patch.  These are necessary.

Alex

> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_3.c
> index 51babf5c78c86c20ef806e31e9d0a4185ffda5b8..8ba66d4dfe86e96073f63e259=
177ca0ca2416a6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -2461,19 +2461,17 @@ static int gfx_v9_4_3_soft_reset(struct amdgpu_ip=
_block *ip_block)
>                 /* Disable MEC parsing/prefetching */
>                 gfx_v9_4_3_xcc_cp_compute_enable(adev, false, 0);
>
> -               if (grbm_soft_reset) {
> -                       tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM=
_SOFT_RESET);
> -                       tmp |=3D grbm_soft_reset;
> -                       dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n",=
 tmp);
> -                       WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RE=
SET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM=
_SOFT_RESET);
> -
> -                       udelay(50);
> -
> -                       tmp &=3D ~grbm_soft_reset;
> -                       WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RE=
SET, tmp);
> -                       tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM=
_SOFT_RESET);
> -               }
> +               tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RE=
SET);
> +               tmp |=3D grbm_soft_reset;
> +               dev_info(adev->dev, "GRBM_SOFT_RESET=3D0x%08X\n", tmp);
> +               WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp=
);
> +               tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RE=
SET);
> +
> +               udelay(50);
> +
> +               tmp &=3D ~grbm_soft_reset;
> +               WREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RESET, tmp=
);
> +               tmp =3D RREG32_SOC15(GC, GET_INST(GC, 0), regGRBM_SOFT_RE=
SET);
>
>                 /* Wait a little for things to settle down */
>                 udelay(50);
>
> ---
> base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
> change-id: 20250801-uartlite-redundant-c4cb6f87bb68
>
> Best regards,
> --
> Ethan Carter Edwards <ethan@ethancedwards.com>
>
