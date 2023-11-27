Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AAB7FAC1C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B7710E304;
	Mon, 27 Nov 2023 20:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C96810E303;
 Mon, 27 Nov 2023 20:59:51 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b85c88710eso1527656b6e.3; 
 Mon, 27 Nov 2023 12:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701118790; x=1701723590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3yo837GDz7kubNtzjO6WNlCk3oHXeJlohNg0iLQ45k=;
 b=Ykj3JqCBL6PoR8aJp65bq5lk+CJSb4tpel2GWJMJTsEPBXFF3JeyVWpRfX7tGdIUvQ
 Jf7P7KIxXKrcRQb/gSlN9U940wKlMUzGe7bpj1qUMGeCQXNKN0XGRRwbPiwG2rZpJ1PT
 fLU29Wjwn87GGDVrXKaBJikTFjgk+fBPKdZ8VQtv9ccTs9AI2D5uGD8U0IxOedF19lFL
 EYlQt4U5ub9Gi3dxwiwIqk53vS67PHm0txCf17QgkakkNt6rxDQBAaIPPDkEfSfzvB0x
 zsOn4T9ZV1kKq/V03RgIiVvnEz60f7SEFcuP12dLYzO5AanLYwnDC2FxEMRne4014lZw
 JbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701118790; x=1701723590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3yo837GDz7kubNtzjO6WNlCk3oHXeJlohNg0iLQ45k=;
 b=n0i73NoYQXH/XiFZKaSmU72bz5p7DV+faWLNLGTFxPvcH4cA40ennLrzsbrJP+uRHf
 RYpsSUA1T7f1xWRC5hsmitXDGoz0O5+NJJNsV5LI20jfbBS1mRkiVDF2Fr5gukRckdMF
 wZhA8uHOllTjqN4rlYGF3sI6rogrzsyIhoL4Rj0ftxqALvE12hXbQQOCyOPi3xcF8J+X
 IUhUnr8Qx/iKBQBy1ICFKMHDOZa0tZHUS6WS1+evQa3cwxmlK+x9gC3TE7TCHaGF0CJF
 Kz9jq4BdndGTaFEaUoT66FbTuiB9VPbL1twOksidklQD4NsHl8sqmJUK5b0Bjwl/4uku
 leeQ==
X-Gm-Message-State: AOJu0YxzwbAseHypwIvv8hqXGUJpA1vzEHdGpJxTCrP/FaQ5351B6MYE
 b8WDgi51kxNu11D1so1WFFmJJ0fAt07u49k89DUE1tTn
X-Google-Smtp-Source: AGHT+IFKyeIS5VTJZrANfRdevBMLW1f91RM2J5bRYY04tGsN7SGb+1O8Y1sezDSrVrT/0EFaAr+CWYML8gUnwK6S5CU=
X-Received: by 2002:a05:6870:3c8b:b0:1f9:dc5a:b8fc with SMTP id
 gl11-20020a0568703c8b00b001f9dc5ab8fcmr17780453oab.56.1701118790494; Mon, 27
 Nov 2023 12:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20231123073325.16843-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20231123073325.16843-1-dinghao.liu@zju.edu.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 15:59:39 -0500
Message-ID: <CADnq5_Mm_LtYXAqGp0O0gk4YF-bM3_cBq6RZ-dBrZkSOQMo3qw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix a memleak in aldebaran_tables_init
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
 Darren Powell <darren.powell@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Nov 23, 2023 at 3:08=E2=80=AFAM Dinghao Liu <dinghao.liu@zju.edu.cn=
> wrote:
>
> When kzalloc() for smu_table->ecc_table fails, we should free
> the previously allocated resources to prevent memleak.
>
> Fixes: edd794208555 ("drm/amd/pm: add message smu to get ecc_table v2")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> index 1a6675d70a4b..f1440869d1ce 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c
> @@ -257,8 +257,11 @@ static int aldebaran_tables_init(struct smu_context =
*smu)
>         }
>
>         smu_table->ecc_table =3D kzalloc(tables[SMU_TABLE_ECCINFO].size, =
GFP_KERNEL);
> -       if (!smu_table->ecc_table)
> +       if (!smu_table->ecc_table) {
> +               kfree(smu_table->metrics_table);
> +               kfree(smu_table->gpu_metrics_table);
>                 return -ENOMEM;
> +       }
>
>         return 0;
>  }
> --
> 2.17.1
>
