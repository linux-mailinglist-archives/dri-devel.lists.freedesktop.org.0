Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5A2803CF8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9581310E3C2;
	Mon,  4 Dec 2023 18:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5610E3C2;
 Mon,  4 Dec 2023 18:27:23 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6d7f3a4bbc6so2561873a34.2; 
 Mon, 04 Dec 2023 10:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701714443; x=1702319243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKS/R0LCdw8slEjKVFrwMfnGQ9/6ujHp7Vv1Nk4Yan8=;
 b=mJsaMoUl/dvGTa7O07PuU0vI2q3CRJ/crri4c+S3AwNKl8zzhhlnCkafvBUbYQy0CB
 ZxmmeP6eUBxa1yWQQ7+mY0P7cvzEVfozSakp0JUN/CY5hluxLGxJJEcKRhFM8T4LCl61
 OuFFI/00VARd+RJZSEPvgMxpVgza2dJLoA0JD1df4E57u/oioMx4KD7Jl4kT/d0Mivla
 nIJG4Ww+44SlHbROVYiJpln2EyhFRpc2BxccSblT4ENuijvPK5WY7e+BqFwZ+ZOM2R2N
 JcQEMO/X2GIAFq9hk2lSHhLHM/OY7DkN5chR39FwD/OG0SgkatNHrhc3ISciDmR8Rw+r
 8ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701714443; x=1702319243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKS/R0LCdw8slEjKVFrwMfnGQ9/6ujHp7Vv1Nk4Yan8=;
 b=Hk6OJmVWyCinYYtoZxarj960HDrq0lY/iC5+cMKiV3YfMrbeTls54fq1S1Pj9NS1mO
 qGPK8YMdHu3GRRIaotmHlHD1ZZqDs5/6DGejcO2BmbbzdyykuoybH1mIw5o7heUia9w+
 e/lbI0nVbbjmKGv9XqN0fs+X8csB4Xdp0+GljVmbD+5E6//TdIOyvs1D5NkdwgG1oS8K
 cfdRX+sTgLeAkArWH5/S8pHPW3WCmDSX+nC5MosnHtIFKaIXl8fKSuCLeubg+YDiQEFO
 8U4vvqYCDbCwsBS3fwwAPhPi8DI4SzyrFz+KMqOC3qDdqYzBcDze7HvdHYAyaDqKzXyN
 XY1w==
X-Gm-Message-State: AOJu0YyW3VTVZUua7Ghr2gO4gRPnCxP2vM2+G0ovk/yhTcvcHZEVHKCv
 N5qk97EBj0zk5fPEdhzdu7B31yEbuWM2N6ToNkL6xgKf
X-Google-Smtp-Source: AGHT+IFpRbGI/d8p6DZaN7Pl996L2VYH9OmYnQ82PEmp4ww76xvcUbv12dovgxqEXpefd1J4UKlyWX2fWtvfy0137U0=
X-Received: by 2002:a05:6871:878a:b0:1fb:186d:73f2 with SMTP id
 td10-20020a056871878a00b001fb186d73f2mr4684487oab.32.1701714442949; Mon, 04
 Dec 2023 10:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20231204085756.3303900-1-alexious@zju.edu.cn>
In-Reply-To: <20231204085756.3303900-1-alexious@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Dec 2023 13:27:11 -0500
Message-ID: <CADnq5_M0UodAHEkZR+naBELpeJXDexa5WHgp5DEzpP5ympAmaA@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/radeon/dpm: fix a memleak in
 sumo_parse_power_table
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
 dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 4, 2023 at 5:39=E2=80=AFAM Zhipeng Lu <alexious@zju.edu.cn> wro=
te:
>
> The rdev->pm.dpm.ps allocated by kcalloc should be freed in every
> following error-handling path. However, in the error-handling of
> rdev->pm.power_state[i].clock_info the rdev->pm.dpm.ps is not freed,
> resulting in a memleak in this function.
>
> Fixes: 80ea2c129c76 ("drm/radeon/kms: add dpm support for sumo asics (v2)=
")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>

Applied.  Thanks!

> ---
>
> Changelog:
>
> v2: Adding {} to make if statement correct.
> ---
>  drivers/gpu/drm/radeon/sumo_dpm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/sumo_dpm.c b/drivers/gpu/drm/radeon/s=
umo_dpm.c
> index f74f381af05f..d49c145db437 100644
> --- a/drivers/gpu/drm/radeon/sumo_dpm.c
> +++ b/drivers/gpu/drm/radeon/sumo_dpm.c
> @@ -1493,8 +1493,10 @@ static int sumo_parse_power_table(struct radeon_de=
vice *rdev)
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
