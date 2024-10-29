Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2589B4BA6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA7810E66E;
	Tue, 29 Oct 2024 14:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LHCtcpe9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C968710E66E;
 Tue, 29 Oct 2024 14:02:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71e74f35acaso443444b3a.2; 
 Tue, 29 Oct 2024 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730210552; x=1730815352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2OqKfzRqS2oj2sN68Xg9PC17To96WoL3aUxN4+A/rM=;
 b=LHCtcpe9bb55DXM2pqTnq8y+p4/bnDQOI1hJzRela63edmBvvxul2oOUTE/rDH5jgz
 fFfejN6H3YEq/Z+TNWJIJPvyzLMcKA8kVZbphG7ptrdVKcfx7e6PdP7+6wi7ZzmTSJ5K
 KL+ynhakg4E2kre9RCXCUSOS30qci9Kbiko9bW0OhIUjGSUVT/g8Q8/CVg+rsrSv0U8I
 6eMJwGv/yo3cNumC4qKWgWgBTzrtozTDF7J3GnfC9sTDjXdxulbv+nUY4nvUChI+dzUz
 5tSBcOjdX+r65pvCFoWZvyNccEycx6zcvj5G7gCQ2tbRcX1zXYvIRNEMvqyVWnmT9VKK
 8t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730210552; x=1730815352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2OqKfzRqS2oj2sN68Xg9PC17To96WoL3aUxN4+A/rM=;
 b=Fyh4MtuLcmad2I36tDBbSHhqCQIXIu47zvmAJWPw+YlLlVheKM9+C7yzPHoe6QRy4h
 2MLLDjcUO7a7AE6lM+FC1k1J6S5JJaemWkRXDPcZWIncWJR9M2ykNNxGcn9xQwc2cDml
 Fa7ob2X+mFG4bzCQe9KeK4qBCzQeGA+NwgIyQtu7FyQjqfo2KQx9O2L91VBMZ9QeR2Oa
 H247PYSp0Fkj7D4ucGm/E9PJpvtIwqt3R2qB6OguJMjPOLxlkHD9w0PT2pWZFkFipCbH
 uGM+BZz6Rpm47cwxTgznfLNDUva6WQw9GWWQYQAtQkjYyNY0t7eMfjv/vsKZgLaaXs/6
 1A1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Qs6DM9qKrkLkNs3T0KIEL8LBimX6XML1SK4ZI+6Utprl41b2c5lT565wE7DqMdtf1bPzzwohqYHF@lists.freedesktop.org,
 AJvYcCWxMpgWpaTbSpn9qCDhkGYLVFTMPRcizGMZsZTput94f+C7E7KlJGh3rPLDzGUgCfV3DI1WrjF+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZGLvU1gOVb+MZkM3Kcw8ySOMtqLmLXCgrYBj/fGyCSRElyx/d
 ejiejwIY9xvLYtX2aSiCZL+HMo6s7AUjY3rUhoxVQu4Y3Qx9ucGxGXpK+kIJ5g4K6oRp0uOqb6j
 UWpP4ANgNWwMQ4I0elIlpWITZZW8=
X-Google-Smtp-Source: AGHT+IEcGWT3kLWKK2rQeP5CpXTBUNLrvmNdqQLI1ZZI+jM2ngZukzu2bKOrNjGXTRPhUfHPZkgIYZQYYI/CtjrIlZA=
X-Received: by 2002:a05:6a20:7492:b0:1cf:4903:7f66 with SMTP id
 adf61e73a8af0-1d9a83af7e3mr7955777637.2.1730210552148; Tue, 29 Oct 2024
 07:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241029202758.2764535-1-lihuafei1@huawei.com>
In-Reply-To: <20241029202758.2764535-1-lihuafei1@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Oct 2024 10:02:20 -0400
Message-ID: <CADnq5_OunQkNHuc_5ur=LqCzVFoBoiCsc9CcZGGTa-vDPFht=g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/amdgpu: Fix the memory allocation issue in
 amdgpu_discovery_get_nps_info()
To: Li Huafei <lihuafei1@huawei.com>
Cc: alexander.deucher@amd.com, lijo.lazar@amd.com, 
 christophe.jaillet@wanadoo.fr, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, Hawking.Zhang@amd.com, 
 yifan1.zhang@amd.com, Likun.Gao@amd.com, Tim.Huang@amd.com, 
 pratap.nirujogi@amd.com, victorchengchi.lu@amd.com, Jun.Ma2@amd.com, 
 le.ma@amd.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Oct 29, 2024 at 8:53=E2=80=AFAM Li Huafei <lihuafei1@huawei.com> wr=
ote:
>
> Fix two issues with memory allocation in amdgpu_discovery_get_nps_info()
> for mem_ranges:
>
>  - Add a check for allocation failure to avoid dereferencing a null
>    pointer.
>
>  - As suggested by Christophe, use kvcalloc() for memory allocation,
>    which checks for multiplication overflow.
>
> Additionally, assign the output parameters nps_type and range_cnt after
> the kvcalloc() call to prevent modifying the output parameters in case
> of an error return.
>
> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
> Changes in v3:
>  - As suggested by Christophe, replace kvzalloc() with kvcalloc()
>  - Link to v2: https://lore.kernel.org/lkml/20241029101839.2605713-1-lihu=
afei1@huawei.com/
>
> Changes in v2:
>  - kvzalloc() call uses 'nps_info->v1.count' instead of '*range_cnt'
>  - Link to v1: https://lore.kernel.org/lkml/20241028215933.2599271-1-lihu=
afei1@huawei.com/

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 4bd61c169ca8..620090f092ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_d=
evice *adev,
>
>         switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>         case 1:
> +               mem_ranges =3D kvcalloc(nps_info->v1.count,
> +                                     sizeof(struct amdgpu_gmc_memrange),
> +                                     GFP_KERNEL);
> +               if (!mem_ranges)
> +                       return -ENOMEM;
>                 *nps_type =3D nps_info->v1.nps_type;
>                 *range_cnt =3D nps_info->v1.count;
> -               mem_ranges =3D kvzalloc(
> -                       *range_cnt * sizeof(struct amdgpu_gmc_memrange),
> -                       GFP_KERNEL);
>                 for (i =3D 0; i < *range_cnt; i++) {
>                         mem_ranges[i].base_address =3D
>                                 nps_info->v1.instance_info[i].base_addres=
s;
> --
> 2.25.1
>
