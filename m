Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16E80CE99
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CD010E472;
	Mon, 11 Dec 2023 14:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F510E472
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:44:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DEDD7B80E65
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0A8C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702305861;
 bh=IExdtmWmPMyY8Pay6KZb0S6W8wKmO6J3E3GfBIV1Cio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LeXVj4Bu+T7n50b8HfpbHRiQwZNCwPXA3r/XqcRRjZbXn45jFPYhiFzfyIrn7RDyv
 yBQAEgO8Z005TEuQnXqrs/oWoSAhSfX3otjLedh0fatrxHkPWPZpH1X2tyfOr7w56f
 fBZ0QjFfZgUGSx5kYqpACVfKdtXLQ6H3Ssci02dxVpLJVr6fZjXMNfhkOW5qJSkpdR
 /Iz8ZCH7P+yMD+RNonu2mXg/WDDc8xLlYFtgWrcPBZ1zA+XVUzIyL2G8ARXG1vZwDU
 aZWaqO5PSB9MooT0ex4Pj7BGne+26lm+9OjjsQCi8AxiOzgDjmwb4L/ZvnCeKAA5Wo
 KlRwDjdToXXJg==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ca0f21e48cso57797351fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 06:44:20 -0800 (PST)
X-Gm-Message-State: AOJu0YzvVakZTBL2lyXxEvnHRgfqa3jDfu9u/xh6Lth6NDlcqVr7ddGB
 44i3i8kIxs4lrl0mjHLJba9zfp3PkHECN5/iYw==
X-Google-Smtp-Source: AGHT+IHbV4puB5U8GlwIN/BZWBEsAsegaKynxZaOnbkAQ6wtk5UHRy14LSHQMn757papUqYJTbpaelmS3QylqrwmPx0=
X-Received: by 2002:a05:651c:807:b0:2cc:2120:81b3 with SMTP id
 r7-20020a05651c080700b002cc212081b3mr758630ljb.3.1702305859144; Mon, 11 Dec
 2023 06:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20231110012914.14884-1-stuart.lee@mediatek.com>
 <20231110012914.14884-2-stuart.lee@mediatek.com>
In-Reply-To: <20231110012914.14884-2-stuart.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 11 Dec 2023 22:44:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY__NgTPDedbuRQLZSS-0AC2rTW7Jfbm-e42sTU+-czzvew@mail.gmail.com>
Message-ID: <CAAOTY__NgTPDedbuRQLZSS-0AC2rTW7Jfbm-e42sTU+-czzvew@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/mediatek: Fix access violation in
 mtk_drm_crtc_dma_dev_get
To: Stuart Lee <stuart.lee@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lancelot Wu <lancelot.wu@mediatek.com>, stable@vger.kernel.org,
 Shawn Sung <shawn.sung@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Stuart:

Stuart Lee <stuart.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B411=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add error handling to check NULL input in
> mtk_drm_crtc_dma_dev_get function.
>
> While display path is not configured correctly, none of crtc is
> established. So the caller of mtk_drm_crtc_dma_dev_get may pass
> input parameter *crtc as NULL, Which may cause coredump when
> we try to get the container of NULL pointer.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: cb1d6bcca542 ("drm/mediatek: Add dma dev get function")
> Signed-off-by: Stuart Lee <stuart.lee@mediatek.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index c277b9fae950..047c9a31d306 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -921,7 +921,14 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_=
device *drm_dev,
>
>  struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>  {
> -       struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
> +       struct mtk_drm_crtc *mtk_crtc =3D NULL;
> +
> +       if (!crtc)
> +               return NULL;
> +
> +       mtk_crtc =3D to_mtk_crtc(crtc);
> +       if (!mtk_crtc)
> +               return NULL;
>
>         return mtk_crtc->dma_dev;
>  }
> --
> 2.18.0
>
