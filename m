Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E791A88F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 16:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613AB10E045;
	Thu, 27 Jun 2024 14:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tDsWygWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB410EAC2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:02:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1510461EA8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7113CC4AF0E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719496942;
 bh=haqyinA5O0jrPvPaCY+hTYShEe3D4xzEGz+XqJKudOE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tDsWygWPG1UvEl1yw4KL3p/fKQSq64X/uqzYplsAs9Esq0Mw45Dzza291RqO0N/85
 GWM6bXdxmjIAoW9nbMVNTJE3+wXTInsHSNsW8su78Tvf1mc1g6wn1Wk6iDDZPJXNVa
 3i4MHufhu/EpzNi2b6LeOL16/6Mgb3FP5fDCFXKLO8Z2bbPJGiBAe9qSMDqNRuZfHK
 7i9K3Ha1627W+KrPkqq+PEN+G3vFNHp5rwKLbsL83myrFcYO3l76cF79/Iad4lUva7
 AHc9Rh559yc09gfr7JEV/jjaqebG2kIBLArT/bQDxpzGfLcsUkn+1YgPji9isbIjon
 LXh4xJKnrbaqw==
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7201cb6cae1so2682122a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUokWytWyL4+8eksLw0IwnfAlv91KPJyWoHoGQb+WYbC0TM7bAnRmE4yMajXqoGXfwdqhpIpxw6ekHM0S2saIJzcmjTT2OPREJgyJpBsBPq
X-Gm-Message-State: AOJu0YzJ29T1nyiJHOP3OSos9eNR+OOwehVAJD/x73Tc+9GBkcMO+rhY
 0e59BjkLbQaLqz0JugwuAqOV1g/tvzWZaltv85uh3axomOMYSX9sDWXSXw/vf5XOYGguBCjb48U
 CA9s/dUFxZcJoUVZMWMPdEF479Q==
X-Google-Smtp-Source: AGHT+IEjPuF+8KUmWpQykLG9Tjg3oIhhxWtBXJcsgAy4abavUazUPTIucmfl5lTNX0+gcaeiTabgHFx4AqJjfR1buSs=
X-Received: by 2002:a17:90b:1d12:b0:2c8:1e54:4d39 with SMTP id
 98e67ed59e1d1-2c8582dbfa4mr11861140a91.48.1719496941350; Thu, 27 Jun 2024
 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Jun 2024 22:02:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8pSGOhuRt=swb7o8zm6swnuXqyzPeASRppGCfi032xbQ@mail.gmail.com>
Message-ID: <CAAOTY_8pSGOhuRt=swb7o8zm6swnuXqyzPeASRppGCfi032xbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Douglas Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Fei Shao <fshao@chromium.org>, Maxime Ripard <mripard@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

Hi, Douglas

Douglas Anderson <dianders@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=881=
2=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> This driver users the component model and shutdown happens in the base
> driver. The "drvdata" for this driver will always be valid if
> shutdown() is called and as of commit 2a073968289d
> ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
> noop") we don't need to confirm that "drm" is non-NULL.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> v1 of this patch was part of a series [1]. It got tested and reviewed
> but never landed. Reposting separately in the hopes that Mediatek DRM
> folks will land it. If, instead, Mediatek DRM folks want to Ack it I'm
> happy to land through drm-misc.
>
> I noticed that this was missing when I failed to add "mediatek" to my
> patch series IDing which DRM modeset drivers did this properly [2].
> Assuming my patch lands, that means that Mediatek devices will start
> getting more warnings printed.
>
> [1] https://lore.kernel.org/r/20230901164111.RFT.5.I2b014f90afc4729b6ecc7=
b5ddd1f6dedcea4625b@changeid
> [2] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> Changes in v2:
> - Removed NULL check since it's not needed since 6.7
> - Rebased on ToT.
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b5f605751b0a..de811e2265da 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -952,6 +952,13 @@ static void mtk_drm_remove(struct platform_device *p=
dev)
>                 of_node_put(private->comp_node[i]);
>  }
>
> +static void mtk_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct mtk_drm_private *private =3D platform_get_drvdata(pdev);
> +
> +       drm_atomic_helper_shutdown(private->drm);
> +}
> +
>  static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> @@ -983,6 +990,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove_new =3D mtk_drm_remove,
> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
> --
> 2.45.2.505.gda0bf45e8d-goog
>
