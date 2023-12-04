Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF6803D05
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FF10E3CE;
	Mon,  4 Dec 2023 18:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DDD10E1CC;
 Mon,  4 Dec 2023 18:29:49 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1f03d9ad89fso2652417fac.1; 
 Mon, 04 Dec 2023 10:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701714589; x=1702319389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q98w33mc6+s9A9wtHHFHE8JJnBQGyFexGo0rxM7RDmY=;
 b=RYfLq+Vu34ZgI5luDja/RCY8H575X5pfxdIXrhSzRwRxUjMQj35/qtPxeMiEQhgMj+
 r18UT/X8uozukowAk+7F/NE9tQnD9tY5beXDyLIm1Fg9PS8Fu23qMlyDwQZa2n++47hC
 xzhBrFqmqS+Lazkpgf0MTwA0xRgvJpeZYPx+gKDxOOUGBw66CmeBDtswc6+NUA/DE6Ug
 BKGBZOyKlFq6CXqq7VtmryzKk6oKx7hwA2R3B6uFWbldEzf8lS6AS/VasKosKgdbMKDv
 Ggg3JJlS565fb4G+6sr3efwIW3V9P5tw+1isYYp1Tl80iBdkPWAyxF23tb+HeoZnc/ik
 jjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701714589; x=1702319389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q98w33mc6+s9A9wtHHFHE8JJnBQGyFexGo0rxM7RDmY=;
 b=Zn2fksrlG+P8aAc8yWjyIpB1U8fwHSfk8b9SJvIXFtzfDesnOiKadKhFvE3hGt13WD
 Ha1ExlEVxKE+cbZ68rpLx3tp1wvt0vQfyaEWNL/ax9FWAqbsyqVQhLPUNyGYP3tTmB9z
 yGbfxtbaCAJ+KlyyKbUK45LyWbb5ctHFC4O8ctmp9k2iI6Q/N58BwtL0wbB2NUeGt+XS
 Uzncb+fxYF1dmYSdQUKGSamYPpchDIxxICZU5XvxmKtUoNW4ooOEMRs+d6msTlzM/dmK
 TdNSI6qV6HL3OcIcn9f8XvmgVijQ0++UG8Kc+xb98fEYcziour7rutArOX55XcA6XrWw
 h2Ow==
X-Gm-Message-State: AOJu0Yx7RdO7U4+DIuKl46U+DIlKJchlb2bI935QsKquOLs8RkxcdlNH
 MKT5YzZt+ZBRkP2R8MtHvYoHzf0gWiU/M9Z8Sdg=
X-Google-Smtp-Source: AGHT+IFM9JkjyOPfFe5FFesofTO8QjpC1HMWpndmSWOomEp4GGuWn0kXHiMGFIhyu0BwvuDsaAwlQPYYo3e1X+VIQfI=
X-Received: by 2002:a05:6870:7813:b0:1fa:1ca3:ced8 with SMTP id
 hb19-20020a056870781300b001fa1ca3ced8mr2735574oab.52.1701714589221; Mon, 04
 Dec 2023 10:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20231204102154.3309670-1-alexious@zju.edu.cn>
In-Reply-To: <20231204102154.3309670-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 13:29:38 -0500
Message-ID: <CADnq5_PZ4pzhSXCQjO7bs3WPHSbkOe57GVN+wxzza5NVzMWb6Q@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/radeon/trinity_dpm: fix a memleak in
 trinity_parse_power_table
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

On Mon, Dec 4, 2023 at 5:39=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> wro=
te:
>
> The rdev->pm.dpm.ps allocated by kcalloc should be freed in every
> following error-handling path. However, in the error-handling of
> rdev->pm.power_state[i].clock_info the rdev->pm.dpm.ps is not freed,
> resulting in a memleak in this function.
>
> Fixes: d70229f70447 ("drm/radeon/kms: add dpm support for trinity asics")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
>
> Changelog:
>
> v2: Adding {} to correct the if statement.
> ---
>  drivers/gpu/drm/radeon/trinity_dpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/trinity_dpm.c b/drivers/gpu/drm/radeo=
n/trinity_dpm.c
> index 08ea1c864cb2..ef1cc7bad20a 100644
> --- a/drivers/gpu/drm/radeon/trinity_dpm.c
> +++ b/drivers/gpu/drm/radeon/trinity_dpm.c
> @@ -1726,8 +1726,10 @@ static int trinity_parse_power_table(struct radeon=
_device *rdev)
>                 non_clock_array_index =3D power_state->v2.nonClockInfoInd=
ex;
>                 non_clock_info =3D (struct _ATOM_PPLIB_NONCLOCK_INFO *)
>                         &non_clock_info_array->nonClockInfo[non_clock_arr=
ay_index];
> -               if (!rdev->pm.power_state[i].clock_info)
> +               if (!rdev->pm.power_state[i].clock_info) {
> +                       kfree(rdev->pm.dpm.ps);
>                         return -EINVAL;
> +               }
>                 ps =3D kzalloc(sizeof(struct sumo_ps), GFP_KERNEL);
>                 if (ps =3D=3D NULL) {
>                         kfree(rdev->pm.dpm.ps);
> --
> 2.34.1
>
