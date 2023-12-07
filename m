Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5FB8096CF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 00:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E8010E22B;
	Thu,  7 Dec 2023 23:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BAE10E22B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C760862241
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F285CC43397
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701993254;
 bh=126f2FINqt2NzWMdkeMGSXx7WFzHGP22zRHVVvtlMF8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKOR0pl21/lBqjEPLL44m3F5pS7Y7hvSTtHUas9f9DE4EM7ULVYijHiFVQ8RnyU19
 wNzRgzmdcT1mfMLOduWKD7WonNxnEQo92gQid92pAIYNS7ZJEBx1iUIMhm8x2kg2n8
 T78/Hhki3QnJlvflJ/4wzthfl2h8gYzFGfvlJScP6zG+WNHU04Zgw93g7CjuxAh6zy
 n3JbafzyfuoqNRmIl9cqlY7hCddTm8oCyc1gYhzii39cTMVkupMzEz8cwryj1f4cx0
 AcQ7TsNrxK5qyfyGnE5kojTUcR3S6/cmGkyAYeaY7WFJM0OxD7V0rP2cWNOcD13BK1
 FHo16mLCElPXA==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2c9f166581dso18817561fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 15:54:13 -0800 (PST)
X-Gm-Message-State: AOJu0YwOQ8JR8Sr+chkV0ONvAjWUqvtOXLATk5/RvMYsT6pzntxT1uNP
 +TlfDvUHdPOjBoQy4RkyXMGtkeeIJjOA3PEswQ==
X-Google-Smtp-Source: AGHT+IFG1YJnNx0pOc8S7TKFLRo4jr/uqeafdNxD4kyWaFE3oQZnuq4vicxphBN5NfQQmfMRMfbvWf4LsTLiiniVQFg=
X-Received: by 2002:a2e:8ec6:0:b0:2ca:12f5:c5d3 with SMTP id
 e6-20020a2e8ec6000000b002ca12f5c5d3mr2081298ljl.33.1701993251999; Thu, 07 Dec
 2023 15:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20230905084922.3908121-1-mwalle@kernel.org>
In-Reply-To: <20230905084922.3908121-1-mwalle@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Dec 2023 07:54:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xrt_ku-fZotJAnPa2ns-2PCGken4TepMrQYG9KEJcFA@mail.gmail.com>
Message-ID: <CAAOTY_9xrt_ku-fZotJAnPa2ns-2PCGken4TepMrQYG9KEJcFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/mediatek: fix kernel oops if no crtc is found
To: Michael Walle <mwalle@kernel.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>, Stu Hsieh <stu.hsieh@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Michael:

Michael Walle <mwalle@kernel.org> =E6=96=BC 2023=E5=B9=B49=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> drm_crtc_from_index(0) might return NULL if there are no CRTCs
> registered at all which will lead to a kernel oops in
> mtk_drm_crtc_dma_dev_get(). Add the missing return value check.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT=
8195")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> v4:
>  - collected tags
> v3:
>  - none
> v2:
>  - collected tags
>  - fixed typos
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 93552d76b6e7..2c582498817e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -420,6 +420,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         struct mtk_drm_private *private =3D drm->dev_private;
>         struct mtk_drm_private *priv_n;
>         struct device *dma_dev =3D NULL;
> +       struct drm_crtc *crtc;
>         int ret, i, j;
>
>         if (drm_firmware_drivers_only())
> @@ -494,7 +495,9 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* Use OVL device for all DMA memory allocations */
> -       dma_dev =3D mtk_drm_crtc_dma_dev_get(drm_crtc_from_index(drm, 0))=
;
> +       crtc =3D drm_crtc_from_index(drm, 0);
> +       if (crtc)
> +               dma_dev =3D mtk_drm_crtc_dma_dev_get(crtc);
>         if (!dma_dev) {
>                 ret =3D -ENODEV;
>                 dev_err(drm->dev, "Need at least one OVL device\n");
> --
> 2.39.2
>
