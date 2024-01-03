Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA3822F84
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD04810E312;
	Wed,  3 Jan 2024 14:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7E110E2F2;
 Wed,  3 Jan 2024 14:30:16 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2046dee3c14so4013908fac.1; 
 Wed, 03 Jan 2024 06:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704292216; x=1704897016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WX1lPt29dCJY1lm7moFZL9vZknDJXTE84CiBdwPeikg=;
 b=EBQbNr21lNx2NXx8hoaWXpF9+Xr7/C/8v3MJffdymn6uikIPQ+53OCix5QN4skEiZa
 eqxFszK5kqufR8XOWemMTBh/8+hQFWYSOohBarMHczNo3X9WVML4WxeYZQ34hmGmo1Ob
 OEyHFWVgYY+Q0bVVkAEFXWQqeblkNbTCvcd7SWSB1bnaSj0G24p6leLo3PBA/gkkviKk
 9rz+3DFxAjiXN9hsEqz/im43Gan2xmEsxbOVpNLmEtwrGkUQ/i+nclmD3FbYSVxpUdCt
 dBFTf/OuhSmANmLdypB91O6DWhuH9Hqo+7t/GXudlzaPNCC2oKpPeuQ7xm0qQ2N8UwxK
 d3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704292216; x=1704897016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WX1lPt29dCJY1lm7moFZL9vZknDJXTE84CiBdwPeikg=;
 b=J+hczxxIRQsxJb6abLXZGGUYd0FC6MrKnYEaG5HJN5UQ01ruUCXTEZ3+nyBbARBi3a
 Y3r/Md1GQCSpmoUZ3tMNTTyRx+o7I+XDpZx3DmQC4rWIBZOWPUKe/prNj1nsPJ2Lc4d6
 MgeaGcqREIvNAoYLsQR3/NDSeai5ZlHoa97wUssuuet0S13mNd6b0W2fEkhGf5JDM2ux
 +R/WF+PJwfjWhDrKMf4kgvhpUh0zFV0Qf8lqTeA2rE380S3YDEO/C8udCsBvvKDKGzvY
 AIIJgbjVnR8Ir2Xdwx+IkLi0hHNZVgdv/VRjltfbK/NSyFZmxTWXLYJR7qBKJQCAAhTF
 0sqg==
X-Gm-Message-State: AOJu0YzQQoHkaT55ug+aK13DuzwDydbaa9Pr1AymQoKIxkEYS8NHbEQq
 dToK1VP6ifga7mnal/apXmkTirX+ffYOmQVlfLP2/G24
X-Google-Smtp-Source: AGHT+IEZbfPBEDib/RU6p08tX4ysNOAhGE8Alxp+aBc7Hmb0TEYfeIIZMDhVl6/g8ugOqdTPytJCAXwjXk4Sqggcuss=
X-Received: by 2002:a05:6870:b156:b0:203:e64a:eb73 with SMTP id
 a22-20020a056870b15600b00203e64aeb73mr16227470oal.69.1704292215727; Wed, 03
 Jan 2024 06:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20231224082249.3539167-1-alexious@zju.edu.cn>
In-Reply-To: <20231224082249.3539167-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:30:04 -0500
Message-ID: <CADnq5_NrcF+Swf0T+upaM64=WYfxExEHyBEGKTDAB8P4Khyw1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/smu7: fix a memleak in smu7_hwmgr_backend_init
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
Cc: Ran Sun <sunran001@208suo.com>, Deepak R Varma <drv@mailo.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Ken Wang <Qingqing.Wang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <Rex.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Dec 25, 2023 at 5:18=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> wr=
ote:
>
> The hwmgr->backend, (i.e. data) allocated by kzalloc is not freed in
> the error-handling paths of smu7_get_evv_voltages and
> smu7_update_edc_leakage_table. However, it did be freed in the
> error-handling of phm_initializa_dynamic_state_adjustment_rule_settings,
> by smu7_hwmgr_backend_fini. So the lack of free in smu7_get_evv_voltages
> and smu7_update_edc_leakage_table is considered a memleak in this patch.
>
> Fixes: 599a7e9fe1b6 ("drm/amd/powerplay: implement smu7 hwmgr to manager =
asics with smu ip version 7.")
> Fixes: 8f0804c6b7d0 ("drm/amd/pm: add edc leakage controller setting")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> index 11372fcc59c8..b1a8799e2dee 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> @@ -2974,6 +2974,8 @@ static int smu7_hwmgr_backend_init(struct pp_hwmgr =
*hwmgr)
>                 result =3D smu7_get_evv_voltages(hwmgr);
>                 if (result) {
>                         pr_info("Get EVV Voltage Failed.  Abort Driver lo=
ading!\n");
> +                       kfree(hwmgr->backend);
> +                       hwmgr->backend =3D NULL;
>                         return -EINVAL;
>                 }
>         } else {
> @@ -3019,8 +3021,10 @@ static int smu7_hwmgr_backend_init(struct pp_hwmgr=
 *hwmgr)
>         }
>
>         result =3D smu7_update_edc_leakage_table(hwmgr);
> -       if (result)
> +       if (result) {
> +               smu7_hwmgr_backend_fini(hwmgr);
>                 return result;
> +       }
>
>         return 0;
>  }
> --
> 2.34.1
>
