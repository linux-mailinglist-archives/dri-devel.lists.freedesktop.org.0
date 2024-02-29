Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C734E86CD59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D2410E4D2;
	Thu, 29 Feb 2024 15:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkfv7Fdp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664E10E4CC;
 Thu, 29 Feb 2024 15:46:35 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1dc29f1956cso9609445ad.0; 
 Thu, 29 Feb 2024 07:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709221594; x=1709826394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEWJ7fHnFKVu8gdE5jXlSXn13xT8OIn42g9Z5EsEfXs=;
 b=jkfv7FdpKOQfGSLE01AegPGrGdA2gM4fGg4GB55xheY5TVDOughyEg2dktbjCkyGHo
 sAVG1kdnt0UVIL1xcd5H/YG6Z5n5wNManNk+XwuDwGINKv5+3ay4a+IyvBdL1Eteweib
 A/e12TMOdjw+xOqRw9pF5C/PfXojIzUORX9d62vDbp4b/niM1CBEZst+8q7uncRteZu+
 Ai1exc6a2wIZyGe+xbyPYFzP6vRwBQ4+t56X3QXhPo9VS766Fwr365wTezmIhHnDt6Ru
 WjI6sEjhMmlYF4Sh5lWa6xH19vw5sxUgijiy5fTlXMm5sB3Lo7RDTB3AY8QmA9tJtMNZ
 rHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709221594; x=1709826394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEWJ7fHnFKVu8gdE5jXlSXn13xT8OIn42g9Z5EsEfXs=;
 b=VAJ4ZrBgbRDRcDJZDBDjNRBdEdFz4qSQQQTNimOIHVQEmm4YQn2YrIF4ht/iJgrb+0
 ltJzcOZLilchVAvDcQbTP5qg7K5eOmj38RQ3xw/xkgfW8rgIubefpaeuFjXvBBfFRKTv
 8NRAAlQyg8wIMHy1sOP+XMTpdn7KhNaWrv9qdq0O6B88tzViDtmTZPeYk5TK+mQ7rsim
 dtIcXABbRN/Rte4m9JsEdhk4VXSpQtsdiXOLIYFCbh+wrxCG3+cKg2zVhjkQfvJEVHcx
 PB6/V618GtxUR8B9fp6vwWTOwJmp9VUznK2tWOnvyHyAp03EhUKCmAhA+wmuJb03gS0u
 y27Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp35HFXJ6INUgRYw6PoR4hCAAXY5+sS85VSdJdgajfNYDPVdPUhXVQpKfy1ZQtwZdJRxsxJSnQN2jLunOxw0uhPE5e0693eFcGzhVOucyxwd7I5xlnw/OGWVvn53kqgV6Qu1Yw1T/wGIfzQ1YyYA==
X-Gm-Message-State: AOJu0Yz4iCSNM67o4uf38J4y8hpKUPJ/1JwLvyx+xlD0HBQbbg0+TB+2
 DtXXxnyBaui64/3AxHvY/KT3d+ytGIx4ymn80PClJOgUxwEuY8eMhIeIlAP7R6OPPq69k85zo6B
 PhDab68Pr5ezjYauP/Ktmv3GfR8dKygJm
X-Google-Smtp-Source: AGHT+IGrbashKqBZ2tV3PLN8CgPZa2z5gJJYfc88kdevqUke36eNBirRViD6TQOxEDvojhYYho1Fm4jUKaAFHyNuFtI=
X-Received: by 2002:a17:902:ecc9:b0:1dc:b003:6382 with SMTP id
 a9-20020a170902ecc900b001dcb0036382mr3128455plh.0.1709221594508; Thu, 29 Feb
 2024 07:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20240227190828.444715-1-mwen@igalia.com>
In-Reply-To: <20240227190828.444715-1-mwen@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Feb 2024 10:46:23 -0500
Message-ID: <CADnq5_Pt1ncb_omsjwpoFNawt-2EhwQXFQ7QEk1=-Px-m=frKw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: check dc_link before dereferencing
To: Melissa Wen <mwen@igalia.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, Dan Carpenter <dan.carpenter@linaro.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com
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

Applied.  Thanks!

On Tue, Feb 27, 2024 at 2:08=E2=80=AFPM Melissa Wen <mwen@igalia.com> wrote=
:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6683 amdgpu_d=
m_connector_funcs_force()
> warn: variable dereferenced before check 'dc_link' (see line 6663)
>
> Fixes: 967176179215 ("drm/amd/display: fix null-pointer dereference on ed=
id reading")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 32efce81a5a7..46dd06e8fc7e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6653,7 +6653,7 @@ static void amdgpu_dm_connector_funcs_force(struct =
drm_connector *connector)
>         struct edid *edid;
>         struct i2c_adapter *ddc;
>
> -       if (dc_link->aux_mode)
> +       if (dc_link && dc_link->aux_mode)
>                 ddc =3D &aconnector->dm_dp_aux.aux.ddc;
>         else
>                 ddc =3D &aconnector->i2c->base;
> --
> 2.43.0
>
