Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EA75D5ED
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 22:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A202810E047;
	Fri, 21 Jul 2023 20:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE94D10E047
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 20:46:40 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a56311c559so253420b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 13:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689972400; x=1690577200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kegEaSN855FDt4tm8z1tvE9wOVNUzYWQYQH2EKhMlxw=;
 b=kL0h0Tfl0TXgzttCu8gCQDti+OZFfdU/A/tD3yMSs9z0XMmGaxhLSYEb+N2TrdzOms
 ajX/fZ3bZJySHaWSzYB9WgGh7Rs3jbbXfZYWnNIG9Mjy6CC5NgqMljY7lcaf8OCuUfHT
 +cSpphaQT6FdSJ3NLx547MyMDF1COPF+ZXeH+mNasxuWhNIze93cmB4fBooT/C5h/W3G
 +B3x4SB+he0agr7xJk7H6ia99QcpoZ0GxBaL+nHe2RZ4FjxiuN+OZ5CA3FsyJyjuURGo
 JRZu1cBiQ0GucA9YUfxk803uEBipvlNlXGrVrNWcJdQb4ukL9BuAQpdZ0FOh52jUUI0f
 qgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689972400; x=1690577200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kegEaSN855FDt4tm8z1tvE9wOVNUzYWQYQH2EKhMlxw=;
 b=Rg87PysfPtEpFFFEi1v5sgs6Uxm/CnJU88c1TFrklVpRLUaKFQ1gOoZR+OMKRUdcnx
 dnWeD0CMGyaVLB58kmlx28irr1Xf66UljHhbaAn1t+4GwY97IYLlCttSE+OT5y0pk8Pe
 1bDGwo3hf+zsBEETcIsoSSYObBU/6i82pEYD+EI77ye0wxUQ500XuQ83aA+AaVkwicPS
 uSUVRzx9avEvQVwFonsOxUJe4QhShV4qIHSTPFcP5tdZzVM5eaTwGpkhaTIPvEOF9xSl
 6fTUccfG8PjqdqmHKPr9WmnC1o+5YWySjrnvFjg2nWzK9O20teSjkWQVnLXGP+E4J7vg
 XdAA==
X-Gm-Message-State: ABy/qLavonK4AX0+8hEKhwweVqOpIO/4kyF9xGnpy1YJzDxSjdXnAJuT
 EmOXQT9AP786WljHnc0Mawk7+DklYHEedBeI61A=
X-Google-Smtp-Source: APBJJlEazpp3IozZKABhj0o8eFxzZNHMh14iutmDomrBHtn2Q62nnzjHfaSw/FKMAFyQjx/UKzvxl6No2mzAbEf/O7M=
X-Received: by 2002:a05:6808:340c:b0:394:25b9:db19 with SMTP id
 by12-20020a056808340c00b0039425b9db19mr2623742oib.2.1689972399782; Fri, 21
 Jul 2023 13:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230721112842eucas1p2071651599fd2b86792b84aa3770fba67@eucas1p2.samsung.com>
 <20230721112832.2273167-1-m.szyprowski@samsung.com>
In-Reply-To: <20230721112832.2273167-1-m.szyprowski@samsung.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 21 Jul 2023 17:46:27 -0300
Message-ID: <CAOMZO5DzQ3x6FzxJkEVUoPgPxuE8UN3qzSb8Lf_UOzsQcPHTsA@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 8:28=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
> doesn't report empty level of packer header FIFO. In case of those SoCs,
> use the old way of waiting for empty command tranfsfer FIFO, removed
> recently by commit 14806c641582 ("Drain command transfer FIFO before
> transfer").
>
> Fixes: 14806c641582 ("Drain command transfer FIFO before transfer")

Nitpick: the Subject of the commit log is not complete.

Fixes: 14806c641582 ("drm: bridge: samsung-dsim: Drain command
transfer FIFO before transfer")



> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - added additional delay when workaround is used as suggested by Marek Va=
sut
>
> v1: https://lore.kernel.org/all/20230718131859.3114135-1-m.szyprowski@sam=
sung.com/
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 18 ++++++++++++++++--
>  include/drm/bridge/samsung-dsim.h     |  1 +
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 9b7a00bafeaa..d06401de637c 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -412,6 +412,7 @@ static const struct samsung_dsim_driver_data exynos3_=
dsi_driver_data =3D {
>         .m_min =3D 41,
>         .m_max =3D 125,
>         .min_freq =3D 500,
> +       .has_broken_fifoctrl_emptyhdr =3D 1,
>  };
>
>  static const struct samsung_dsim_driver_data exynos4_dsi_driver_data =3D=
 {
> @@ -428,6 +429,7 @@ static const struct samsung_dsim_driver_data exynos4_=
dsi_driver_data =3D {
>         .m_min =3D 41,
>         .m_max =3D 125,
>         .min_freq =3D 500,
> +       .has_broken_fifoctrl_emptyhdr =3D 1,
>  };
>
>  static const struct samsung_dsim_driver_data exynos5_dsi_driver_data =3D=
 {
> @@ -1009,8 +1011,20 @@ static int samsung_dsim_wait_for_hdr_fifo(struct s=
amsung_dsim *dsi)
>         do {
>                 u32 reg =3D samsung_dsim_read(dsi, DSIM_FIFOCTRL_REG);
>
> -               if (reg & DSIM_SFR_HEADER_EMPTY)
> -                       return 0;
> +               if (!dsi->driver_data->has_broken_fifoctrl_emptyhdr) {
> +                       if (reg & DSIM_SFR_HEADER_EMPTY)
> +                               return 0;
> +               } else {
> +                       if (!(reg & DSIM_SFR_HEADER_FULL)) {
> +                               /*
> +                                * Wait a little bit, so the pending data=
 can
> +                                * actually leave the FIFO to avoid overf=
low.
> +                                */
> +                               if (!cond_resched())
> +                                       usleep_range(950, 1050);
> +                               return 0;
> +                       }
> +               }
>
>                 if (!cond_resched())
>                         usleep_range(950, 1050);
> diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsu=
ng-dsim.h
> index 05100e91ecb9..18017b3e5d9e 100644
> --- a/include/drm/bridge/samsung-dsim.h
> +++ b/include/drm/bridge/samsung-dsim.h
> @@ -62,6 +62,7 @@ struct samsung_dsim_driver_data {
>         const unsigned int *reg_values;
>         u16 m_min;
>         u16 m_max;
> +       unsigned int has_broken_fifoctrl_emptyhdr;
>  };
>
>  struct samsung_dsim_host_ops {
> --
> 2.34.1
>
