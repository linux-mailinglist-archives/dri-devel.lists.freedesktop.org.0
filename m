Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C6CC2D707
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88A910E47B;
	Mon,  3 Nov 2025 17:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gMmcAhiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687A910E477
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:20:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FB83436F8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01E3C4CEE7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762190456;
 bh=Cw8Tr0pt0izwPilVv5nGs/i4ufdA9dFbRs4VQY6zikM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=gMmcAhiBsVSyCkOM0mRYgkYZA9tJDSvK2wgh3qZwFULWhvuXi8erf2rkr/MwaAaKA
 fw2ML9KSCqXlPeZgkwSyurKcuqLMA35nwK2qQ0C+4tXt6DCRv6SBnvnR3Y0ZzRJ2is
 xEMh5Fex5rWkiAKYDk1zV0DJro/oYmo46qNlrrule9GFz1EZ2d+i9bGQhCeC76L2cR
 LSaGQGR0st+3+0WNqNJbdF2+qKzGRo9WavHL/e95h245XBEB2hF+uuN2wWEAWpdWKg
 bFcHCnLRxBqbLvNmg4iYxqhyRLpJbGgWx3uKZI/NAhWbpgI8Beyv1bk0jQe5hkUZSh
 UxBEpH8miuwgw==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37775ed97daso55539761fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 09:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWReHqcB7dXrZgi1A98p2J6dscgVX7oP4yX5zNkM31qyO8m0twYBHDRG1vbkKzINbilGWIXZgxJdAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrNVa/KFvKGkKPdGMSZ+LGZt9QTJu+msrXP/2YGTXNRYS1wvIz
 Sgf4iwdvPiF07hrLK4dXAuYo1Weq29rDrM1fqKnUDiYS21B7NWScllXwGlnkrTIxz+prjpF1GNS
 6Pq4uAdUtwpHpyRaIDN1+KM0ev+7ap0M=
X-Google-Smtp-Source: AGHT+IHRUi6EAD6pMQNRdNYhSlcQIuKYSqaTxdXDqRJl9lmDDHFEVrdVEd5CRyApfZOE2sDZkcCOjtV9/2hQgNU4yLg=
X-Received: by 2002:a05:651c:23d3:10b0:378:f3b6:f762 with SMTP id
 38308e7fff4ca-37a430aa81amr317571fa.8.1762190455235; Mon, 03 Nov 2025
 09:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-28-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-28-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:20:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
X-Gm-Features: AWmQ_bkmnwYwJfDQIAiND4eRiNPut9jjWdyj2va-IjgdPAkREnfrJWQqH0QGSVs
Message-ID: <CAGb2v65x+b8FXUfM_XbaSxKbKb2bMydmwAHZCm+AMd5f1gW1Aw@mail.gmail.com>
Subject: Re: [PATCH 27/30] drm/sun4i: mixer: split out layer config
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Later special plane only driver for DE33 will provide separate
> configuration. This change will also help layer driver migrate away from
> mixer structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---

[...]

> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
> index 40b800022237..8629e21f9cf6 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -164,34 +164,44 @@ enum sun8i_mixer_type {
>  };
>
>  /**
> - * struct sun8i_mixer_cfg - mixer HW configuration
> - * @vi_num: number of VI channels
> - * @ui_num: number of UI channels
> + * struct sun8i_layer_cfg - layer configuration
>   * @scaler_mask: bitmask which tells which channel supports scaling
>   *     First, scaler supports for VI channels is defined and after that,=
 scaler
>   *     support for UI channels. For example, if mixer has 2 VI channels =
without
>   *     scaler and 2 UI channels with scaler, bitmask would be 0xC.
>   * @ccsc: select set of CCSC base addresses from the enumeration above.
> - * @mod_rate: module clock rate that needs to be set in order to have
> - *     a functional block.
>   * @de_type: sun8i_mixer_type enum representing the display engine gener=
ation.
>   * @scaline_yuv: size of a scanline for VI scaler for YUV formats.
>   * @de2_fcc_alpha: use FCC for missing DE2 VI alpha capability
>   *     Most DE2 cores has FCC. If number of VI planes is one, enable thi=
s.
>   * @vi_scaler_num: Number of VI scalers. Used on DE2 and DE3.
> - * @map: channel map for DE variants processing YUV separately (DE33)
>   */
> -struct sun8i_mixer_cfg {
> -       int             vi_num;
> -       int             ui_num;
> +struct sun8i_layer_cfg {
>         int             scaler_mask;
>         int             ccsc;
> -       unsigned long   mod_rate;
>         unsigned int    de_type;
>         unsigned int    scanline_yuv;
>         unsigned int    de2_fcc_alpha : 1;
>         unsigned int    vi_scaler_num;
> -       unsigned int    map[6];
> +};
> +
> +/**
> + * struct sun8i_mixer_cfg - mixer HW configuration
> + * @lay_cfg: layer configuration
> + * @vi_num: number of VI channels
> + * @ui_num: number of UI channels

Missing kerneldoc for .de_type field.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
