Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB4A8C13A0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 19:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E1710E190;
	Thu,  9 May 2024 17:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ak/4WUt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210B10E12F;
 Thu,  9 May 2024 17:15:45 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5b2761611e8so396202eaf.2; 
 Thu, 09 May 2024 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715274945; x=1715879745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZiLZP5/kk1vwmeb8DDi1DAoGL+kKQ0mz5pqsLRVAiQ=;
 b=Ak/4WUt1dxspYYrnMi6Oe0yD66VbozP6S8ROgM7SFLs7ObXqTYCYH3WnimclJXzvUq
 XcFnjB8WHpiniCWXCJWihBZDe7sAWjz/tcmac61643zQbnsBwjnSwoeFiXdJ73vJ/Nvj
 g2jIlO6Zd7vfiyk5/ngwVnt477fLZACh6lZ4WnV6IgJlPK97nKow8WSQy3vIfGuv0NeD
 gTzqCyiKT2Rt6s/jIbXhn3Cyg5oBd/jc2Mh4uO/zDNLfDvmRtJsiGVO1oLVQlc8Rqt1A
 yytVWmSxs3/BdFKIrbmaT/ASOv54al83iE241+DyEBUIMC0LSSYZZ6EHhAFik1IdhJJG
 nAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715274945; x=1715879745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZiLZP5/kk1vwmeb8DDi1DAoGL+kKQ0mz5pqsLRVAiQ=;
 b=HRvhe5aP5buyzBZ9pkwSJi0OaQHkoyhFh03GJCOWqLX6ial3Gm/ae3GV5Qmvu2YSAq
 CzChYf5M+O5VjBEuBUmOEPGAvbvmk/5uJJunOuKvCM7AmCGZzLrYRj4dyMMTJuTf2fDO
 d9zQ0uPJVs8ow7KE1inN4380VJ/7M9aPx8yA3MSX7wJATAGhHMvwEFQnHM18v5Xfx/sb
 gpOKzJFIkF8C9mRj4fN5eo8ZlZvni16+awqzFAR9uYVPB4umq1vR6qG6h9G8ou8iX1J4
 zdD7gIk7vPcFPZPZj9k46ISQkrsskqeQSmzobT747va4lsAV4yClnEN/EWqhPmA8LPGB
 yIQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVan2VLaNAP52GwWxMZ5/1ztclyJETkU79MBkuaIhjQYkBmyPu1klAnkPafKWDpjdFKuw6jbGOAEN4MJz2Og5BtzaL+92Evsmcw6QB96FGQcBiFcRDU39tFgdCu/zo1PimI3yqNtpY2H+MS9XVzvg==
X-Gm-Message-State: AOJu0YwjjodJ2oCr51tCYyn5Xi1mivfKcqcDsk6M8GidiaJurhsnIM/r
 GxqQnCxm3KytmStwra2/6KjjNSJLIkiXMojSRBZyhRJSb211EEbCXN0adpp+mvM5mf950oRmrqB
 98ag3g6v6nxokK2bpJ4km7FtN/EY=
X-Google-Smtp-Source: AGHT+IFjOz6jnY4i1OrbGHKdaDsm499HKePTZlD2L0qp+QR8Q9Mn7Vch8xVCZnWFEm9GLy0s0Bh0wQ4Age78L8ztfQg=
X-Received: by 2002:a05:6358:430f:b0:186:1b7f:e885 with SMTP id
 e5c5f4694b2df-193bb656d21mr4476955d.17.1715274944693; Thu, 09 May 2024
 10:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
In-Reply-To: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 May 2024 13:15:32 -0400
Message-ID: <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
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

On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.co=
m> wrote:
>
> Support for I2C_CLASS_SPD  is currently being removed from the kernel.
> Only remaining step is to remove the definition of I2C_CLASS_SPD.
> Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> here.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
and applied.

Thanks!

> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index 0d5ad531c..fb6f3bbe2 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@ -1616,7 +1616,6 @@ static int smu_v14_0_2_i2c_control_init(struct smu_=
context *smu)
>                 smu_i2c->port =3D i;
>                 mutex_init(&smu_i2c->mutex);
>                 control->owner =3D THIS_MODULE;
> -               control->class =3D I2C_CLASS_SPD;
>                 control->dev.parent =3D &adev->pdev->dev;
>                 control->algo =3D &smu_v14_0_2_i2c_algo;
>                 snprintf(control->name, sizeof(control->name), "AMDGPU SM=
U %d", i);
> --
> 2.45.0
>
