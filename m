Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B307C031F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 19:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DCF10E3B1;
	Tue, 10 Oct 2023 17:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC9B10E3B1;
 Tue, 10 Oct 2023 17:59:29 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1e562706d29so3501846fac.2; 
 Tue, 10 Oct 2023 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696960768; x=1697565568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGIeLbonPPYlH9oYKOAbS/s/wMjxEMpdPvDdi4ETn8U=;
 b=QipIPbPX23luBkALmX+qjet8yv6NWpJ8Xop6axH5IHzfsqwm/MmbC8ay7UQey7aXjd
 c1wASRCuy1GOsuAMJky6iUtmoOPhFsWQOY1e2LxmkMIDs12dF130hquWdfsDZl7xauqb
 tTODvYcbkRnXspVybp8buGmjuhT7QfIYhHVinQryJW409SyDSz7w4RI3g4N7C4c3J8My
 msQ4kn6JDZyxqFVWr54ydgub/GF3PdtG+JvEtZAL+9stxOpWfgHfCgiehhFGxi0AsLDo
 gzuXAiKnsFQ4lXLobNLdnMekBz6HnvHFngwXAYhGAEQVQFgiajXxoo3o2Q/gQ1xzfQOR
 NFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696960768; x=1697565568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kGIeLbonPPYlH9oYKOAbS/s/wMjxEMpdPvDdi4ETn8U=;
 b=kz3hnBHrXnf0p/yZQ643hZjcUzC3RiD9QJQLo4dSXvVrHktLFLTYi6jN/VLk15KoMn
 Yd/HS+l1qBaWsie2UlqkfSqtrAG64j3aoHIRctXOKo7usXNTc4gZQQum50Bq+5jhOJD+
 o6C3WDm8+4VtlLi0lJo730zvebNvfcPDdfw1Hgdvc8E+ILZ6+gcXybe8YJX6iyVE2mOx
 xg41ofinaC1rK0++6BO6q17k6JSUIi3CXy6Yv62lRMY4fFnR3yjjgwgREtERwnf6Mt3j
 nXOdJy/qcB4H17jwPHw0kl8f3JLV6VvgQub2m8HeCe8oVF0qyMewB0o5HPkAfF/3e82K
 gUuQ==
X-Gm-Message-State: AOJu0YzHvL7K325PY8FVdRsJuYrZQk/G/y3Jtfixl6DkAJG849+p8KDj
 4rxkstaliR53D6A7+Bc0wORq40NsiOSJfNKUie8=
X-Google-Smtp-Source: AGHT+IE6T3Xrn9dGWUdNXdC0Ro5S5WfkJlG8Vzrtn1AyZD1HHQ/ZvG1EbKuMokTpPOhfphSdp5q0y0y/rZdODqzaT/c=
X-Received: by 2002:a05:6871:79c:b0:1d6:5fee:d8ef with SMTP id
 o28-20020a056871079c00b001d65feed8efmr20943526oap.22.1696960768389; Tue, 10
 Oct 2023 10:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <PH7PR12MB5997C208CDD4587332346CD782CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
 <20231010061039.75878-1-chentao@kylinos.cn>
 <PH7PR12MB5997E8A541A39046B0B3BCB982CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB5997E8A541A39046B0B3BCB982CDA@PH7PR12MB5997.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Oct 2023 13:59:17 -0400
Message-ID: <CADnq5_MLOSkC+qgOxCLkfQ-ML0SdVXackvn6L9GRLFmpndv-OQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix a memory leak on an error path
To: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Kunwu.Chan" <chentao@kylinos.cn>,
 "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ma,
 Le" <Le.Ma@amd.com>, "Kamal, Asad" <Asad.Kamal@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Oct 10, 2023 at 2:32=E2=80=AFAM Wang, Yang(Kevin)
<KevinYang.Wang@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
>
> Best Regards,
> Kevin
>
> -----Original Message-----
> From: Kunwu.Chan <chentao@kylinos.cn>
> Sent: Tuesday, October 10, 2023 2:11 PM
> To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kamal, Asad <Asad.Kam=
al@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhang, Hawking <=
Hawking.Zhang@amd.com>; Ma, Le <Le.Ma@amd.com>; Lazar, Lijo <Lijo.Lazar@amd=
.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; amd-gfx@lists.f=
reedesktop.org; chentao@kylinos.cn; dan.carpenter@linaro.org; daniel@ffwll.=
ch; dri-devel@lists.freedesktop.org; evan.quan@amd.com; kunwu.chan@hotmail.=
com; linux-kernel@vger.kernel.org
> Subject: [PATCH] drm/amd/pm: Fix a memory leak on an error path
>
> Add missing free on an error path.
>
> Fixes: 511a95552ec8 ("drm/amd/pm: Add SMU 13.0.6 support")
> Signed-off-by: Kunwu.Chan <chentao@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index ce971a93d28b..c26e12ff532c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -1981,8 +1981,10 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct =
smu_context *smu, void **table
>
>         metrics =3D kzalloc(sizeof(MetricsTable_t), GFP_KERNEL);
>         ret =3D smu_v13_0_6_get_metrics_table(smu, metrics, true);
> -       if (ret)
> +       if (ret) {
> +               kfree(metrics);
>                 return ret;
> +       }
>
>         smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 3);
>
> --
> 2.25.1
>
