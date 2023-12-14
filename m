Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FAA81374A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 18:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9C710E1CE;
	Thu, 14 Dec 2023 17:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A93710E971;
 Thu, 14 Dec 2023 17:06:38 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b9f8c9307dso5156056b6e.0; 
 Thu, 14 Dec 2023 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702573597; x=1703178397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lw0RodZSdxJA0iLxv7tkLpUrFdAojr9L6Vs6gKIIOys=;
 b=IGV4SZ0T76WQHOCl19uMqvHWwrgTDor26NGm3W0es6uRg3csPniLhuyErLpkpjt9TL
 drPt/htqprR8cdvyDxW7ZqM1EgD3z60VxF5sfz/d660wO7BBuglMI3cdavpX95QCegDM
 O2U4LDP2cUP72G3Vqrch9Oq41ls9WrgUfpfcV9D3Z9WzVa0zyMj78vw1xlUF02/TO7k9
 4PlJeyCP1pUZQr9qkLejEC+O8dKy5Bo+3tPvEuuObxYCnHiDi+k0lPQgWkmAPr8Z/MZH
 cRqIvatVLv3lTF12zU8YbBVVlLhv1k2oO6eButDtrg7+AtihI9IfLCo/eVOZOqtR6ad9
 +QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702573597; x=1703178397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lw0RodZSdxJA0iLxv7tkLpUrFdAojr9L6Vs6gKIIOys=;
 b=ZtbSjASM/5O6sjtQCN/ZMrv0xY/rEQeOss94ZhzUc+VmY0R/kM8nmjd8j6XXxf4elI
 rdBxa+aSuK/HapVBXSOQ+OTgENEE2qMZ09+PQCQx/zldJNVwb2hSn/CbgKPQ0AMfYE7o
 O1M09fXXce93q6QSIE9aS8yXXt5t1ARrkS4E2Y5FjFSnJmKcVdBfWw8ygy1f5cq4wmqa
 MPRWYUwQYuwg1SymE6DGL+6OvP2JsO8pQhKDPbyHII/UsX7RtGAZ0A8JoESJ2Jlzhq7A
 34Jn7M5Jq3wl3wdYnjfSQeW51cbKBdyy35XQVYX6RXIlaM7TM6W0bgRsadMirLEEvfvs
 H9Ng==
X-Gm-Message-State: AOJu0YzUHYGm1tip38CWlQn6iN4dSyw7dx56d61qbc9wnL7Fj9fSNIFQ
 fVPco/eTI1c4l1T5UOZWPl4rkmGZQC3pDwhULiY=
X-Google-Smtp-Source: AGHT+IExNNoad7Bj8XQBRJ5WCf95CmDbkzKCuwvVnxC9gAiPmYDsKYy6JXEAUEPxTCZKr8tl2TD7sMsnEmTVcPwK7m8=
X-Received: by 2002:a05:6870:168c:b0:203:2e8b:1a1d with SMTP id
 j12-20020a056870168c00b002032e8b1a1dmr3061586oae.11.1702573597292; Thu, 14
 Dec 2023 09:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20231214162500.3483936-1-alexious@zju.edu.cn>
In-Reply-To: <20231214162500.3483936-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Dec 2023 12:06:26 -0500
Message-ID: <CADnq5_MYKE+GssKugrLZ-0zj1=JxJayxxp4kviVh6kOPi2abZg@mail.gmail.com>
Subject: Re: [PATCH] drivers/amd/pm: fix a use-after-free in
 kv_parse_power_table
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
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Le Ma <le.ma@amd.com>, dri-devel@lists.freedesktop.org,
 Ran Sun <sunran001@208suo.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Dec 14, 2023 at 11:57=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> w=
rote:
>
> When ps allocated by kzalloc equals to NULL, kv_parse_power_table
> frees adev->pm.dpm.ps that allocated before. However, after the control
> flow goes through the following call chains:
>
> kv_parse_power_table
>   |-> kv_dpm_init
>         |-> kv_dpm_sw_init
>               |-> kv_dpm_fini
>
> The adev->pm.dpm.ps is used in the for loop of kv_dpm_fini after its
> first free in kv_parse_power_table and causes a use-after-free bug.
>
> Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm=
/amd/pm/legacy-dpm/kv_dpm.c
> index 5d28c951a319..5cb4725c773f 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> @@ -2735,10 +2735,8 @@ static int kv_parse_power_table(struct amdgpu_devi=
ce *adev)
>                 non_clock_info =3D (struct _ATOM_PPLIB_NONCLOCK_INFO *)
>                         &non_clock_info_array->nonClockInfo[non_clock_arr=
ay_index];
>                 ps =3D kzalloc(sizeof(struct kv_ps), GFP_KERNEL);
> -               if (ps =3D=3D NULL) {
> -                       kfree(adev->pm.dpm.ps);
> +               if (ps =3D=3D NULL)
>                         return -ENOMEM;
> -               }
>                 adev->pm.dpm.ps[i].ps_priv =3D ps;
>                 k =3D 0;
>                 idx =3D (u8 *)&power_state->v2.clockInfoIndex[0];
> --
> 2.34.1
>
