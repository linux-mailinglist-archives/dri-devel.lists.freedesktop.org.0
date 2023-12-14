Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5722813765
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30F10E97E;
	Thu, 14 Dec 2023 17:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4667710E968;
 Thu, 14 Dec 2023 17:09:26 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3ba0d0a72dfso372452b6e.1; 
 Thu, 14 Dec 2023 09:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702573765; x=1703178565; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+CNk90HKBipLuoBWfUeXQZLtJYhN9IVU6m1y0XruPTY=;
 b=KrgqIfqUac8y8Tf1Q+u/mtHKrHPGkHOCaCP3oDtHDHbUabU4N2JXUCt94sjzXnvWd4
 UYe3Nmmk2Dl+/7Y/PVkqV/GjWFnEZPpjF9CRJB/6xj2QjA6IJDQ+/xN4Db/dFcFAURzJ
 7GT79mORysNbf9kWgCeLwde49axaGnDncZpVZHyfNKosR20+wTjbYdGrS2ST4zv2BgQd
 LMirxplf62wtz6LklOmpRUIjj8vpLlDyT9u+rNM57ti/KZrkcic3PJLP/tz2wH5quiXh
 AKBJ/fYRLvnnVxHFOvDtZCq+1gOiC6TmMLCFz2WOHazRit9tWJK2sGVhL1q3t7n2KzBC
 Pd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702573765; x=1703178565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+CNk90HKBipLuoBWfUeXQZLtJYhN9IVU6m1y0XruPTY=;
 b=MHgNwsbl9HFS0ZuLSm7ElnsD6JkjrK3zBbB71enNdMXBwGCmT9BKXx1LIpIzuSCtGO
 Et1+FovitEJuwwdl2UGl7uyrm4OhtsXc/twJTaEqRec8esxMFHAu26CuA5UOq6pqp0+3
 c7t0/Resjpu1ikz/JZsOhroRcMaPtyPAxcIab/xJ8PnOY0Cybr60+NuH0lFSNM3MI06p
 rfuAHw8kFQBSrg+u7nVpbAuIhT8pIQHtQx2CV3frD0JHg+TNc7McgHeyzQcAToxrgU8j
 BxlumASZQd0LAZiizs9mk0GngbMx//sxfyrvtL7LQZU/NQVjtX7mDbMFQ39sRZ80IiZs
 VBHQ==
X-Gm-Message-State: AOJu0YwrawXiJ8KKTZ6rAIY5UzrIZiBptVmc6WuuFFCWEY4osXfTGUJj
 fGa2IRpvWXVwtIZcwu9LhPe7EGMWmj6BGbL2E+7Cf0Rr
X-Google-Smtp-Source: AGHT+IGUV3iGnP50aJIfnevuJJL7nzP5vfn/xDODENvQRDdTTOd8ZToD7opG++DF5O6ARF7EaMYCremugouz+CXKAFo=
X-Received: by 2002:a05:6808:13d3:b0:3b9:e632:7f99 with SMTP id
 d19-20020a05680813d300b003b9e6327f99mr5221377oiw.17.1702573765310; Thu, 14
 Dec 2023 09:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20231214165843.3484373-1-alexious@zju.edu.cn>
In-Reply-To: <20231214165843.3484373-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Dec 2023 12:09:14 -0500
Message-ID: <CADnq5_OFhh_-qn9DdKWM5mhRWKfHWX027K95qyBUsqUao6vwHg@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: fix two memleaks in radeon_vm_init
To: Zhipeng Lu <alexious@zju.edu.cn>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Dec 14, 2023 at 11:59=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> w=
rote:
>
> When radeon_bo_create and radeon_vm_clear_bo fail, the vm->page_tables
> allocated before need to be freed. However, neither radeon_vm_init
> itself nor its caller have done such deallocation.
>
> Fixes: 6d2f2944e95e ("drm/radeon: use normal BOs for the page tables v4")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_vm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/=
radeon_vm.c
> index 987cabbf1318..c38b4d5d6a14 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -1204,13 +1204,17 @@ int radeon_vm_init(struct radeon_device *rdev, st=
ruct radeon_vm *vm)
>         r =3D radeon_bo_create(rdev, pd_size, align, true,
>                              RADEON_GEM_DOMAIN_VRAM, 0, NULL,
>                              NULL, &vm->page_directory);
> -       if (r)
> +       if (r) {
> +               kfree(vm->page_tables);
> +               vm->page_tables =3D NULL;
>                 return r;
> -
> +       }
>         r =3D radeon_vm_clear_bo(rdev, vm->page_directory);
>         if (r) {
>                 radeon_bo_unref(&vm->page_directory);
>                 vm->page_directory =3D NULL;
> +               kfree(vm->page_tables);
> +               vm->page_tables =3D NULL;
>                 return r;
>         }
>
> --
> 2.34.1
>
