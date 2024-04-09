Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3A89D899
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 13:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D185E10ECFD;
	Tue,  9 Apr 2024 11:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="VcPp7UNe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FF310EE70
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 11:57:00 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7cf092f6bb7so254351739f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712663819; x=1713268619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+sFwXoYlvmaRLKdHU2OL3LD5t7Xm+RlcJkwNqyQM6E=;
 b=VcPp7UNeOQO0fXKb8EdbXKptTrNbqRk4zmMkQ5ndzIQuKJdNJrJm0jLHP697Tg2wKk
 wN/sStaWlv7Wd/nnbjaLGYMmpda/hR6/etqUymsGUfW5Zv0d7Fao67kViwIgGR2KlKkB
 reDXZHdLRCm3VpMz79Dk2/sf/bV0hw9d1Yfdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712663819; x=1713268619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+sFwXoYlvmaRLKdHU2OL3LD5t7Xm+RlcJkwNqyQM6E=;
 b=YQF3pACyV+I7mR6p8qWhM8NN85jzTJtkLY//7+IZp06zmiaUTSfcaY4pTCGFKWZNo5
 ceWUR7mz39iCbZWSkl6+ify+yAzn4fuTPeyp8kqooVHP/E+SF6kJnJ4nabx1XKHfzavh
 J8n3s0c6h52xZOLbC5k6UHHJR2rPxZ/6jAsjCbmCEEqfHT0TT00vVxtqSrx78ob6CBqI
 lg7fAnuw4sp3BS/0UKvpLq8diM4ph3FUgDA8FVzJRG+hOnpK3uhBY6Q+NWC6fl/4s0kZ
 KCZLP3cPeDnUpvRqju04CniIZOtYiPXOX6GIl0AKPT0o3punGpCi3Ofhs7TflxdWByo7
 mCGg==
X-Gm-Message-State: AOJu0Yx1ceLR62Zh7GjcUVTDe3QI1DiMOFS95nY/xyJ+t4Cc3QJXEAbQ
 SxmVN/u/MIxoHhSRW1CSYpaXN/nvAh+klNztFtk7fVOR/hhGrYwyvaXDZAz6Uynq0+H/zvY6Bb+
 VWDawtfNQ1ODn5F8VG4OQrBNQRHGsuhrtTYqS
X-Google-Smtp-Source: AGHT+IFvIS8zDpgMDAGoXg7iiAGympjAvHb7hn6f+MJNaHDU7uc/jMvy5XAao/Ems5jMBEJEP23RHiuUh6azxOBbuXc=
X-Received: by 2002:a05:6602:c8c:b0:7d5:efd9:3c87 with SMTP id
 fp12-20020a0566020c8c00b007d5efd93c87mr4700135iob.5.1712663819589; Tue, 09
 Apr 2024 04:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240408022802.358641-1-zack.rusin@broadcom.com>
In-Reply-To: <20240408022802.358641-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 9 Apr 2024 14:56:48 +0300
Message-ID: <CAKLwHdU8cv8sBQN0PYG-2w7RnE0CF_AyGnZEV+kJFOABoUb_UA@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Enable DMA mappings with SEV
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, Ye Li <ye.li@broadcom.com>,
 stable@vger.kernel.org
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

On Mon, Apr 8, 2024 at 5:28=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> Enable DMA mappings in vmwgfx after TTM has been fixed in commit
> 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iome=
m")
>
> This enables full guest-backed memory support and in particular allows
> usage of screen targets as the presentation mechanism.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Reported-by: Ye Li <ye.li@broadcom.com>
> Tested-by: Ye Li <ye.li@broadcom.com>
> Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryptio=
n is active")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.6+
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 41ad13e45554..bdad93864b98 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -667,11 +667,12 @@ static int vmw_dma_select_mode(struct vmw_private *=
dev_priv)
>                 [vmw_dma_map_populate] =3D "Caching DMA mappings.",
>                 [vmw_dma_map_bind] =3D "Giving up DMA mappings early."};
>
> -       /* TTM currently doesn't fully support SEV encryption. */
> -       if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
> -               return -EINVAL;
> -
> -       if (vmw_force_coherent)
> +       /*
> +        * When running with SEV we always want dma mappings, because
> +        * otherwise ttm tt pool pages will bounce through swiotlb runnin=
g
> +        * out of available space.
> +        */
> +       if (vmw_force_coherent || cc_platform_has(CC_ATTR_MEM_ENCRYPT))
>                 dev_priv->map_mode =3D vmw_dma_alloc_coherent;
>         else if (vmw_restrict_iommu)
>                 dev_priv->map_mode =3D vmw_dma_map_bind;
> --
> 2.40.1


LGTM!

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
