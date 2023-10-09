Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB67BEA05
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8924010E2C8;
	Mon,  9 Oct 2023 18:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C10C10E2C6;
 Mon,  9 Oct 2023 18:46:06 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6c4f1f0774dso3459782a34.2; 
 Mon, 09 Oct 2023 11:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696877165; x=1697481965; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hO3LUe5ofUhhf/JzpF6obyH/g5xq6HG7iuNZoAV8g0A=;
 b=jLYI+PQhKOgoMvCWR+VSsG+C+rTypRutY1LuGMwfqWgnzxXJ5V/coMlxDgpf3otzA6
 he09Zcea78ujjof1zykdlkttLC7b7UXzAbeN/lDtsBcOTGY71uEJYOu/z5GDJLKHjVNK
 f5R5ZToA/8rZOv7NDbbMgervH1jB4MF7SDGHuEyRYhl36mblaZ6QNIZ/hpYlbULieX4T
 6PybE7nAeadpeCH30CIMPfV7fD+G+KSEyLRQr/0vvA8Ssdr7Y9TyrWbfXY6aG9tb0ufo
 i4bSX0sqynTddkH7yxEdCKwXlgRrJONSv2ko+ZgA3gWFYFfwu2JBAK3TLyITn95efDRX
 u4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696877165; x=1697481965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hO3LUe5ofUhhf/JzpF6obyH/g5xq6HG7iuNZoAV8g0A=;
 b=aMTmyI9VNG2hHIKUTUZilt/hrts3LkeaVfmyyMYGQFOHR0Blmt5kRB2Yc08fYTW+aL
 6wQBODq9VFZurJr7UYfB7cI0hu+zXt0qy4QG/l5+zhY5cvcLGk8Wdi1m4C0IAO5/+0Mb
 YeWdno20CLDavIIHYr6D79WBQQGeArhH1DxRBYqgaEUWTK+7WIpe8tTKxCr7VlKG7ZOj
 RycRxict+Z9vOatRzKG4hTS5tF8CUZmYIRaZFkFJLydzyzR2bdJvbWmg2tfyZrBZF1JV
 /psF2d61ZncS4jh8vp0pWO1b/II4wWFDqxKLwjtqcBCxa9+RGJz00pPvS8jM8Ih9i4Jk
 KuCQ==
X-Gm-Message-State: AOJu0YzlIxJs9lRi6GXFgXg9uFyFCHZ1/Sf+tDol/v5KKMQF8o6ZLfUE
 5EIhlJJVTtYCBbhniKbTgZKy87DkNCeFxNQwEuw=
X-Google-Smtp-Source: AGHT+IGPYT0RA6DlQ4e2wnpZWcJFoS79JDz2JE5zmK9PmczS5ESfePxUym53XyVJIbPneoKuwkdOzdEcD189F8+MdJA=
X-Received: by 2002:a05:6871:451:b0:1dc:ddcd:876f with SMTP id
 e17-20020a056871045100b001dcddcd876fmr19133264oag.41.1696877165351; Mon, 09
 Oct 2023 11:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231008064649.3184677-1-uwu@icenowy.me>
 <MW4PR12MB5667743E5B759FFE85F204ACF2CEA@MW4PR12MB5667.namprd12.prod.outlook.com>
In-Reply-To: <MW4PR12MB5667743E5B759FFE85F204ACF2CEA@MW4PR12MB5667.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Oct 2023 14:45:54 -0400
Message-ID: <CADnq5_PziCZsBy==21t4Wen_Dv_F7Q1AMNbJXmSjtBrgsboSAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation
To: "Sharma, Shashank" <Shashank.Sharma@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Icenowy Zheng <uwu@icenowy.me>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yadav,
 Arvind" <Arvind.Yadav@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Oct 9, 2023 at 5:27=E2=80=AFAM Sharma, Shashank <Shashank.Sharma@am=
d.com> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
>
> Regards
> Shashank
> -----Original Message-----
> From: Icenowy Zheng <uwu@icenowy.me>
> Sent: Sunday, October 8, 2023 8:47 AM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Ch=
ristian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie <ai=
rlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Sharma, Shashank <Shasha=
nk.Sharma@amd.com>; Yadav, Arvind <Arvind.Yadav@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-kernel@vger.kernel.org; Icenowy Zheng <uwu@icenowy.me>
> Subject: [PATCH] drm/amdgpu: fix SI failure due to doorbells allocation
>
> SI hardware does not have doorbells at all, however currently the code wi=
ll try to do the allocation and thus fail, makes SI AMDGPU not usable.
>
> Fix this failure by skipping doorbells allocation when doorbells count is=
 zero.
>
> Fixes: 54c30d2a8def ("drm/amdgpu: create kernel doorbell pages")
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> index d0249ada91d30..599aece42017a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
> @@ -142,6 +142,10 @@ int amdgpu_doorbell_create_kernel_doorbells(struct a=
mdgpu_device *adev)
>         int r;
>         int size;
>
> +       /* SI HW does not have doorbells, skip allocation */
> +       if (adev->doorbell.num_kernel_doorbells =3D=3D 0)
> +               return 0;
> +
>         /* Reserve first num_kernel_doorbells (page-aligned) for kernel o=
ps */
>         size =3D ALIGN(adev->doorbell.num_kernel_doorbells * sizeof(u32),=
 PAGE_SIZE);
>
> --
> 2.39.1
>
