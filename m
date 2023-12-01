Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F90800DA0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 15:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9326810E8B4;
	Fri,  1 Dec 2023 14:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A8C10E8B3;
 Fri,  1 Dec 2023 14:46:21 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1faf10f80bcso276356fac.2; 
 Fri, 01 Dec 2023 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701441981; x=1702046781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE3XBjOtYDVBQDdop/n8JlUiiMow9sOSu9cqr2qfSMI=;
 b=jniJWqARKaTKvD9N0pQpoMF9RMk/8BnNrRU/VlEbz/RQO+RHQwhkCF5jkPntWmtthh
 YZrE3J8hgtYr+diJsXZx1ZBbFm08rKXEfbxuZweM/41FUwQemYVfN1l4r7ivlFdPb0is
 hTMMXNVqI6V5PDBicstTK4H6i46vyWlLw4V1BlMnlD9b76SFoCe3h8uJ6FCLub0EoUpr
 5HFpMUDmOPTwEuuOcB3WuQiAewlwbi6SDgOOtdGaMlxl4mU3tLZx4JiVCCUwvx4ZTq+f
 c+jyQ8ZlJrb34SVOtBdqIylAPSbsYi8rkoNlrPVz4kjT4hXxAc08bLt1U0oOa1I3WeUk
 UoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701441981; x=1702046781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE3XBjOtYDVBQDdop/n8JlUiiMow9sOSu9cqr2qfSMI=;
 b=VB79OC1cGcGFzYQQe2eB1S4bNgi5Iz1VkkFDf7Wgl7ddT60w3wBI85paEnPLDbg9co
 +HfhQX4ev2WPz7ke3++ttOMNXn4n3K5qLT4Sej7D1pqRHSAW4/GjNYS0UpSlFf8cvaXj
 AgdOOy3ht2WtkXiMeGZ7D62W4xMucLw/iVrSYTP5HIoWj/w7hIRbBtpSzJ8qnHvO05OO
 AywPXk5w3FOYchqoo4D7QgZXDodueJByjyDL1j+YWwmPBrlftq9WXRsrVzFHPMuyt7zH
 MyMTRDiSFTtOlNDb3POLCD6UVQbRT62WMAYCNavSueR3VbrdI8qULZMrcu8UvOo+f3au
 VZpw==
X-Gm-Message-State: AOJu0YzJdALKaT6E+EtcrRcGs5WjC1WRme+9H6t3ivGSRKuy9HHsRF55
 igNM7zcubLcRAZOG5Kv0/MJGBCNfPdYaZA1qwgs=
X-Google-Smtp-Source: AGHT+IE4S+Wprflve9P9jVlrb0PU7i6xo1Q16nE1n49S+cH71x5xMECfTcyLJppYL2IO1QMwCJMdNaA5oiahz8VTcyc=
X-Received: by 2002:a05:6870:808:b0:1fa:f170:bf2c with SMTP id
 fw8-20020a056870080800b001faf170bf2cmr1621443oab.57.1701441980691; Fri, 01
 Dec 2023 06:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20231130075016.2784376-1-yangyingliang@huaweicloud.com>
In-Reply-To: <20231130075016.2784376-1-yangyingliang@huaweicloud.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 1 Dec 2023 09:46:08 -0500
Message-ID: <CADnq5_MYnLjZS2yD6JcFRDU2=sCcEQUL2r3gd5HpSzzLYPj1pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: check the alloc_workqueue return value in
 radeon_crtc_init()
To: Yang Yingliang <yangyingliang@huaweicloud.com>
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
Cc: Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, yangyingliang@huawei.com,
 alexander.deucher@amd.com, airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Nov 30, 2023 at 2:46=E2=80=AFAM Yang Yingliang
<yangyingliang@huaweicloud.com> wrote:
>
> From: Yang Yingliang <yangyingliang@huawei.com>
>
> check the alloc_workqueue return value in radeon_crtc_init()
> to avoid null-ptr-deref.
>
> Fixes: fa7f517cb26e ("drm/radeon: rework page flip handling v4")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index 901e75ec70ff..efd18c8d84c8 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -687,11 +687,16 @@ static void radeon_crtc_init(struct drm_device *dev=
, int index)
>         if (radeon_crtc =3D=3D NULL)
>                 return;
>
> +       radeon_crtc->flip_queue =3D alloc_workqueue("radeon-crtc", WQ_HIG=
HPRI, 0);
> +       if (!radeon_crtc->flip_queue) {
> +               kfree(radeon_crtc);
> +               return;
> +       }
> +
>         drm_crtc_init(dev, &radeon_crtc->base, &radeon_crtc_funcs);
>
>         drm_mode_crtc_set_gamma_size(&radeon_crtc->base, 256);
>         radeon_crtc->crtc_id =3D index;
> -       radeon_crtc->flip_queue =3D alloc_workqueue("radeon-crtc", WQ_HIG=
HPRI, 0);
>         rdev->mode_info.crtcs[index] =3D radeon_crtc;
>
>         if (rdev->family >=3D CHIP_BONAIRE) {
> --
> 2.25.1
>
